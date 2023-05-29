import { db } from "../database/database.connection.js";

export async function getFlightsByDestination(req, res) {
    try {
        const flights = await db.query(`SELECT flights.id, flights."departureTime", flights.price, cities.name AS origin, "flightPictures".url AS picture
        FROM flights
        JOIN cities ON cities.id = flights."originId"
        JOIN "flightPictures" ON "flightPictures"."flightId" = flights.id
        WHERE flights."destinationId" = $1`, [req.params.destinationId]);
        res.status(200).send(flights.rows);
    } catch (error) {
        res.status(500).send(error);
    }
}

export async function getFlightById(req, res) {
    try {
        const flights = await db.query(`SELECT flights.* , o.name AS origin, d.name AS destination, "flightCompanies".name
        FROM flights
        JOIN cities AS o ON o.id = flights."originId"
        JOIN cities AS d ON d.id = flights."destinationId"
        JOIN "flightCompanies" ON "flightCompanies".id = flights."flightCompanyId"
        WHERE flights.id = $1`, [req.params.id]);
        res.status(200).send(flights.rows[0]);
    } catch (error) {
        res.status(500).send(error);
    }
}

export async function postFlight(req, res) {
    const flight = req.body;
    try {
        const newFlight = await db.query(`INSERT INTO flights ("originId", "destinationId", "departureTime", "arrivalTime", "flightCompanyId", price)
        VALUES ($1, $2, $3, $4, $5, $6) RETURNING id`, [flight.originId, flight.destinationId, flight.departureTime, flight.arrivalTime, flight.flightCompanyId, flight.price]);
        await db.query(`INSERT INTO "flightPictures" ("flightId", url)
        VALUES ($1, $2)`, [newFlight.rows[0].id, flight.picture]);
        res.status(200).send("Flight added");
    } catch (error) {
        res.status(500).send(error);
    }
}