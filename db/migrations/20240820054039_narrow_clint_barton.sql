ALTER TABLE "deck" ADD COLUMN "card_id" integer NOT NULL;--> statement-breakpoint
ALTER TABLE "deck" ADD COLUMN "created_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "deck" ADD COLUMN "updated_at" timestamp NOT NULL;--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "deck" ADD CONSTRAINT "deck_card_id_cards_id_fk" FOREIGN KEY ("card_id") REFERENCES "public"."cards"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
