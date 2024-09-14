import type db from "../index";
import cardData from "./data/cards.json";
import { cards } from "db/schema";

export default async function seed(db: db) {
    await db.insert(cards).values(cardData);
}
