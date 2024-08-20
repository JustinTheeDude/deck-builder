CREATE TABLE IF NOT EXISTS "deck" (
	"id" serial PRIMARY KEY NOT NULL,
	"deckName" text,
	"format" text,
	"user_id" integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "pokemon" (
	"id" serial PRIMARY KEY NOT NULL,
	"pokemonName" text,
	"super_type_id" serial NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "superTypes" (
	"id" serial PRIMARY KEY NOT NULL,
	"type" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "types" (
	"id" serial PRIMARY KEY NOT NULL,
	"type" text
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
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "pokemon" ADD CONSTRAINT "pokemon_super_type_id_superTypes_id_fk" FOREIGN KEY ("super_type_id") REFERENCES "public"."superTypes"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
