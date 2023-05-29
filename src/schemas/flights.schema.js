import Joi from "joi";

export const postFlightSchema = Joi.object({
    originId: Joi.number().required(),
    destinationId: Joi.number().required(),
    departureTime: Joi.date().iso().required(),
    arrivalTime: Joi.date().iso().required(),
    flightCompanyId: Joi.number().required(),
    price: Joi.number().required(),
    picture: Joi.string().uri().required(),
});