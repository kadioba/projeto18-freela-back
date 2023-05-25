import { Router } from "express";
import flightsRouter from "./flights.routes.js";
import citiesRouter from "./cities.routes.js";
import accommodationsRouter from "./accommodations.routes.js";

const router = Router()
router.use(flightsRouter)
router.use(citiesRouter)
router.use(accommodationsRouter)

export default router;