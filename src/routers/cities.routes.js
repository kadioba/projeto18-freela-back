import { Router } from "express";
import { getCities, getCityById, postCity } from "../controllers/cities.controllers.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { postCitySchema } from "../schemas/cities.schema.js";

const citiesRouter = Router()

citiesRouter.get("/cities", getCities);
citiesRouter.get("/city/:id", getCityById);
citiesRouter.post("/city", validateSchema(postCitySchema), postCity);

export default citiesRouter;