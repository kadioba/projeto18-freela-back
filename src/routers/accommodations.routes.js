import { Router } from "express";
import { getAccommodationById, getAccommodationsByDestinationId, postAccommodation } from "../controllers/accommodations.controllers.js";
import { validateSchema } from "../middlewares/validateSchema.middleware.js";
import { postAccommodationSchema } from "../schemas/accommodations.schema.js";


const accommodationsRouter = Router()

accommodationsRouter.get("/accommodations/:destinationId", getAccommodationsByDestinationId);
accommodationsRouter.get("/accommodation/:id", getAccommodationById);
accommodationsRouter.post("/accommodation", validateSchema(postAccommodationSchema), postAccommodation);

export default accommodationsRouter;