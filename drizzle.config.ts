import { defineConfig } from "drizzle-kit";

export default defineConfig({
    schema: "./db/schema.ts",
    out: "./db/migrations",
    dialect: "sqlite",
    driver: 'turso',
    dbCredentials: {
        url: process.env.TURSO_URL!,
        authToken: process.env.TURSO_DB
    }
})