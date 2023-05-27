import { db } from "../database/database.connection.js";

export async function getAccommodationsByDestinationId(req, res) {
    try {
        const accommodations = await db.query(`SELECT accommodations.name, accommodations."pricePerDay"
        FROM accommodations WHERE "locationId" = $1`, [req.params.destinationId]);
        console.log(accommodations.rows);
        res.status(200).send(accommodations.rows);
    } catch (error) {
        res.status(500).send(error);
    }
}

export async function getAccommodationById(req, res) {
    try {
        const accommodation = await db.query(`SELECT accommodations.*, cities.name AS location, "accommodationsPictures".id AS pictureId, "accommodationsPictures".url AS pictureUrl
        FROM accommodations
        LEFT JOIN cities ON cities.id = accommodations."locationId"
        LEFT JOIN "accommodationsPictures" ON "accommodationsPictures"."accommodationId" = accommodations.id
        WHERE accommodations.id = $1`, [req.params.id]);
        res.status(200).send(accommodation.rows);
    } catch (error) {
        res.status(500).send(error);
    }
}