import { db } from "../database/database.connection.js";

export async function getAccommodationsByDestinationId(req, res) {
    try {
        const accommodations = await db.query('SELECT * FROM accommodations WHERE "locationId" = $1', [req.params.destinationId]);
        console.log(accommodations.rows);
        res.status(200).send(accommodations.rows);
    } catch (error) {
        res.status(500).send(error);
    }
}