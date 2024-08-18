CREATE TABLE IF NOT EXISTS "deck" (
	"id" serial PRIMARY KEY NOT NULL,
	"deckName" text,
	"format" text,
	"user_id" integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "users" (
	"id" serial PRIMARY KEY NOT NULL,
	"username" text
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "deck" ADD CONSTRAINT "deck_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
