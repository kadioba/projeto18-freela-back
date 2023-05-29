import { db } from "../database/database.connection.js";

export async function getAccommodationsByDestinationId(req, res) {
    try {
        const accommodations = await db.query(`SELECT accommodations.id, accommodations.name, accommodations."pricePerDay", "accommodationsPictures".url AS picture
        FROM accommodations
        JOIN "accommodationsPictures" ON accommodations."mainPictureId" = "accommodationsPictures".id
        WHERE "locationId" = $1`, [req.params.destinationId]);
        console.log(accommodations.rows);
        res.status(200).send(accommodations.rows);
    } catch (error) {
        res.status(500).send(error);
    }
}

export async function getAccommodationById(req, res) {
    try {
        const accommodation = await db.query(`SELECT accommodations.*, cities.name AS location
                FROM accommodations
                LEFT JOIN cities ON cities.id = accommodations."locationId"
                WHERE accommodations.id = $1`, [req.params.id]);
        const pictures = await db.query(`SELECT * FROM "accommodationsPictures" WHERE "accommodationId" = $1`, [req.params.id]);
        const conveniences = await db.query(`SELECT "accommodationsConveniences".id, conveniences.name
                 FROM "accommodationsConveniences"
                 JOIN conveniences ON conveniences.id = "accommodationsConveniences"."convenienceId"
                 WHERE "accommodationsConveniences"."accommodationId" = $1`, [req.params.id]);

        const response = {
            ...accommodation.rows[0], pictures: pictures.rows, conveniences: conveniences.rows
        }
        res.status(200).send(response);
    } catch (error) {
        res.status(500).send(error);
    }
}

export async function postAccommodation(req, res) {
    const accommodation = req.body;
    try {
        const newAccommodation = await db.query(`INSERT INTO accommodations (name, "locationId", "pricePerDay", description)
        VALUES ($1, $2, $3, $4) RETURNING id`, [accommodation.name, accommodation.locationId, accommodation.pricePerDay, accommodation.description]);
        accommodation.pictures.forEach(async picture => {
            await db.query(`INSERT INTO "accommodationsPictures" ("accommodationId", url)
            VALUES ($1, $2) RETURNING id`, [newAccommodation.rows[0].id, picture]);
        });
        accommodation.conveniences.forEach(async convenience => {
            await db.query(`INSERT INTO "accommodationsConveniences" ("accommodationId", "convenienceId")
            VALUES ($1, $2)`, [newAccommodation.rows[0].id, convenience]);
        });
        await db.query(`UPDATE accommodations
        SET "mainPictureId" = (SELECT id FROM "accommodationsPictures" WHERE "accommodationId" = $1 LIMIT 1)
        WHERE id = $1`, [newAccommodation.rows[0].id]);
        res.status(200).send("Accommodation added");
    } catch (error) {
        res.status(500).send(error);
    }
}

