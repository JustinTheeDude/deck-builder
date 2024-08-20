CREATE TABLE IF NOT EXISTS "cards" (
	"id" serial PRIMARY KEY NOT NULL,
	"cardName" text,
	"sub_type" text[],
	"artist" text NOT NULL,
	"hp" text,
	"rules" text[],
	"moves" text[],
	"types" text[]
);
--> statement-breakpoint
DROP TABLE "pokemon";--> statement-breakpoint
DROP TABLE "superTypes";--> statement-breakpoint
DROP TABLE "types";