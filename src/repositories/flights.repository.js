import { db } from "../database/database.connection.js";

export function getFlightsByDesinationDB(destinationId) {
    return db.query(`SELECT flights.id, flights."departureTime", flights.price, cities.name AS origin, "flightPictures".url AS picture
    FROM flights
    JOIN cities ON cities.id = flights."originId"
    JOIN "flightPictures" ON "flightPictures"."flightId" = flights.id
    WHERE flights."destinationId" = $1`, [destinationId]);
}

export function getFlightByIdDB(id) {
    return db.query(`SELECT flights.* , o.name AS origin, d.name AS destination, "flightCompanies".name
    FROM flights
    JOIN cities AS o ON o.id = flights."originId"
    JOIN cities AS d ON d.id = flights."destinationId"
    JOIN "flightCompanies" ON "flightCompanies".id = flights."flightCompanyId"
    WHERE flights.id = $1`, [id]);
}

export function postFlightDB(flight) {
    return db.query(`INSERT INTO flights ("originId", "destinationId", "departureTime", "arrivalTime", "flightCompanyId", price)
    VALUES ($1, $2, $3, $4, $5, $6) RETURNING id`, [flight.originId, flight.destinationId, flight.departureTime, flight.arrivalTime, flight.flightCompanyId, flight.price]);
}

export function postFlightPictureDB(flightId, url) {
    return db.query(`INSERT INTO "flightPictures" ("flightId", url)
    VALUES ($1, $2)`, [flightId, url]);
}