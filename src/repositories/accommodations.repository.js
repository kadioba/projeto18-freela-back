import { db } from "../database/database.connection.js";

export function getAccommodationsByDestinationIdDB(destinationId) {
    return db.query(`SELECT accommodations.id, accommodations.name, accommodations."pricePerDay", "accommodationsPictures".url AS picture
    FROM accommodations
    JOIN "accommodationsPictures" ON accommodations."mainPictureId" = "accommodationsPictures".id
    WHERE "locationId" = $1`, [destinationId]);
}

export function getAccommodationByIdDB(id) {
    return db.query(`SELECT accommodations.*, cities.name AS location
    FROM accommodations
    LEFT JOIN cities ON cities.id = accommodations."locationId"
    WHERE accommodations.id = $1`, [id]);
}

export function getAccomodationPicturesDB(id) {
    return db.query(`SELECT * FROM "accommodationsPictures" WHERE "accommodationId" = $1`, [id]);
}

export function getAccommodationsConveniencesDB(id) {
    return db.query(`SELECT "accommodationsConveniences".id, conveniences.name
    FROM "accommodationsConveniences"
    JOIN conveniences ON conveniences.id = "accommodationsConveniences"."convenienceId"
    WHERE "accommodationsConveniences"."accommodationId" = $1`, [id]);
}