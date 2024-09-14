ALTER TABLE "user_cards" DROP CONSTRAINT "user_cards_author_id_users_id_fk";
--> statement-breakpoint
ALTER TABLE "user_cards" DROP COLUMN IF EXISTS "author_id";