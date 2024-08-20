ALTER TABLE "deck" DROP CONSTRAINT "deck_user_id_users_id_fk";
--> statement-breakpoint
ALTER TABLE "cards" ADD COLUMN "card_name" text;--> statement-breakpoint
ALTER TABLE "deck" ADD COLUMN "deck_name" text;--> statement-breakpoint
ALTER TABLE "deck" ADD COLUMN "author_id" integer NOT NULL;--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "deck" ADD CONSTRAINT "deck_author_id_users_id_fk" FOREIGN KEY ("author_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
ALTER TABLE "cards" DROP COLUMN IF EXISTS "cardName";--> statement-breakpoint
ALTER TABLE "deck" DROP COLUMN IF EXISTS "deckName";--> statement-breakpoint
ALTER TABLE "deck" DROP COLUMN IF EXISTS "user_id";