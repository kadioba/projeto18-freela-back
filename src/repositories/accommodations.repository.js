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

export function postAccommodationDB(accommodation) {
    return db.query(`INSERT INTO accommodations (name, "locationId", "pricePerDay", description)
    VALUES ($1, $2, $3, $4) RETURNING id`, [accommodation.name, accommodation.locationId, accommodation.pricePerDay, accommodation.description]);
}

export function postAccommodationPictureDB(accommodationId, url) {
    return db.query(`INSERT INTO "accommodationsPictures" ("accommodationId", url)
    VALUES ($1, $2)`, [accommodationId, url]);
}

export function postAccommodationConvenienceDB(accommodationId, convenienceId) {
    return db.query(`INSERT INTO "accommodationsConveniences" ("accommodationId", "convenienceId")
    VALUES ($1, $2)`, [accommodationId, convenienceId]);
}

export function setMainAccommodationPictureDB(accommodationId) {
    return db.query(`UPDATE accommodations SET "mainPictureId" = (SELECT id FROM "accommodationsPictures" WHERE "accommodationId" = $1 LIMIT 1) WHERE id = $1`, [accommodationId]);
}