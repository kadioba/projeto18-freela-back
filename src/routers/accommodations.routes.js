import { Router } from "express";
import { getAccommodationsByDestinationId } from "../controllers/accommodations.controllers.js";


const accommodationsRouter = Router()

accommodationsRouter.get("/accommodations/:destinationId", getAccommodationsByDestinationId);

export default accommodationsRouter;