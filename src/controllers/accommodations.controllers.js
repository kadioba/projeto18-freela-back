import { getAccommodationByIdDB, getAccommodationsByDestinationIdDB, getAccommodationsConveniencesDB, getAccomodationPicturesDB, postAccommodationConvenienceDB, postAccommodationDB, postAccommodationPictureDB, setMainAccommodationPictureDB } from "../repositories/accommodations.repository.js";

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
        const newAccommodation = await postAccommodationDB(accommodation);
        accommodation.pictures.forEach(async picture => {
            await postAccommodationPictureDB(newAccommodation.rows[0].id, picture);
        });
        accommodation.conveniences.forEach(async convenience => {
            await postAccommodationConvenienceDB(newAccommodation.rows[0].id, convenience);
        });
        await setMainAccommodationPictureDB(newAccommodation.rows[0].id);
        res.status(200).send("Accommodation added");
    } catch (error) {
        res.status(500).send(error);
    }
}

