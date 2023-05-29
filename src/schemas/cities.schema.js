import Joi from "joi";

export const postCitySchema = Joi.object({
    name: Joi.string().required(),
    state: Joi.string().required(),
    country: Joi.string().required()
});
