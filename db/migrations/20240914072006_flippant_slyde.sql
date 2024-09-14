ALTER TABLE "users_deck" DROP CONSTRAINT "users_deck_user_cards_id_user_cards_id_fk";
--> statement-breakpoint
ALTER TABLE "user_cards" ADD COLUMN "user_deck_id" integer NOT NULL;--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_cards" ADD CONSTRAINT "user_cards_user_deck_id_users_deck_id_fk" FOREIGN KEY ("user_deck_id") REFERENCES "public"."users_deck"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
ALTER TABLE "users_deck" DROP COLUMN IF EXISTS "user_cards_id";