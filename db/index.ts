import { drizzle } from 'drizzle-orm/libsql';
import postgres from 'postgres';

export const client = postgres(process.env.SUPABASE_URL, { prepare: false })

export const db = drizzle(client);