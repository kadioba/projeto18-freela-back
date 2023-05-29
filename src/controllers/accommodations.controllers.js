import { db } from "../database/database.connection.js";
import { getAccommodationByIdDB, getAccommodationsByDestinationIdDB, getAccommodationsConveniencesDB, getAccomodationPicturesDB } from "../repositories/accommodations.repository.js";

export async function getAccommodationsByDestinationId(req, res) {
    try {
        const accommodations = await getAccommodationsByDestinationIdDB(req.params.destinationId);
        res.status(200).send(accommodations.rows);
    } catch (error) {
        res.status(500).send(error);
    }
}

export async function getAccommodationById(req, res) {
    try {
        const accommodation = await getAccommodationByIdDB(req.params.id);
        const pictures = await getAccomodationPicturesDB(req.params.id);
        const conveniences = await getAccommodationsConveniencesDB(req.params.id);

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

