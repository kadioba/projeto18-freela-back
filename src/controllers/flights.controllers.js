import { db } from "../database/database.connection.js";

export async function getFlightsByDestination(req, res) {
    try {
        const flights = await db.query('SELECT * FROM flights WHERE "destinationId" = $1', [req.params.destinationId]);
        res.status(200).send(flights.rows);
    } catch (error) {
        res.status(500).send(error);
    }
}