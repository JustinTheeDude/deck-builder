ALTER TABLE "users" DROP CONSTRAINT "users_deck_id_deck_id_fk";
--> statement-breakpoint
ALTER TABLE "users" DROP COLUMN IF EXISTS "deck_id";