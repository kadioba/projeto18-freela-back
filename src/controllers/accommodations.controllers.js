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