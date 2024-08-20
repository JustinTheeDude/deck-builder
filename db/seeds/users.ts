import type db from "../index";
import userData from "./data/users.json";
import { users } from "db/schema";

export default async function seed(db: db) {
    await db.insert(users).values(userData);
}