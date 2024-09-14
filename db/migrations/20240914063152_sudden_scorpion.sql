CREATE TABLE IF NOT EXISTS "cards" (
	"id" serial PRIMARY KEY NOT NULL,
	"card_name" text,
	"sub_type" text[],
	"artist" text NOT NULL,
	"hp" text,
	"rules" text[],
	"moves" text[],
	"types" text[],
	"image" text
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "deck" (
	"id" serial PRIMARY KEY NOT NULL,
	"deck_name" text,
	"format" text,
	"author_id" integer NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "users" (
	"id" serial PRIMARY KEY NOT NULL,
	"username" text,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"updated_at" timestamp
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "deck" ADD CONSTRAINT "deck_author_id_users_id_fk" FOREIGN KEY ("author_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
