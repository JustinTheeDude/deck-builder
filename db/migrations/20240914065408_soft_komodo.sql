CREATE TABLE IF NOT EXISTS "user_cards" (
	"id" serial PRIMARY KEY NOT NULL,
	"card_id" integer NOT NULL,
	"author_id" integer NOT NULL
);
--> statement-breakpoint
ALTER TABLE "deck" RENAME TO "users_deck";--> statement-breakpoint
ALTER TABLE "users_deck" DROP CONSTRAINT "deck_author_id_users_id_fk";
--> statement-breakpoint
ALTER TABLE "users_deck" ADD COLUMN "user_cards_id" integer NOT NULL;--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_cards" ADD CONSTRAINT "user_cards_card_id_cards_id_fk" FOREIGN KEY ("card_id") REFERENCES "public"."cards"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_cards" ADD CONSTRAINT "user_cards_author_id_users_id_fk" FOREIGN KEY ("author_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "users_deck" ADD CONSTRAINT "users_deck_user_cards_id_user_cards_id_fk" FOREIGN KEY ("user_cards_id") REFERENCES "public"."user_cards"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "users_deck" ADD CONSTRAINT "users_deck_author_id_users_id_fk" FOREIGN KEY ("author_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
