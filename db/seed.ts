import * as seeds from "./seeds";
import { db, client } from "../db";
import * as schema from "../db/schema";
import { Table, getTableName, sql } from "drizzle-orm";

async function resetTable(db: db, table: Table) {
  return db.execute(
    sql.raw(`TRUNCATE TABLE ${getTableName(table)} RESTART IDENTITY CASCADE`)
  );
}

const seedData = async () => {
    await resetTable(db, schema.users)
    await seeds.users(db);
    await client.end();
}

seedData();