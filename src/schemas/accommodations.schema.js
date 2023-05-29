import Joi from "joi";

export const postAccommodationSchema = Joi.object({
    name: Joi.string().required(),
    locationId: Joi.number().required(),
    pricePerDay: Joi.number().required(),
    description: Joi.string().required(),
    pictures: Joi.array().items(Joi.string().uri()).required(),
    conveniences: Joi.array().items(Joi.number()).required(),
});