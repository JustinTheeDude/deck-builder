import { defineConfig } from "drizzle-kit";

export default defineConfig({
    schema: "./db/schema.ts",
    out: "./db/migrations",
    dialect: 'postgresql',
    migrations: {
        prefix: 'supabase',
    },
    dbCredentials: {
        url: process.env.SUPABASE_URL!,
    },
});