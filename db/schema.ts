import { relations } from "drizzle-orm";
import { pgTable, serial, text, integer, timestamp } from "drizzle-orm/pg-core";

export const users = pgTable('users', {
  id: serial("id").primaryKey(),
  userName: text('username'),
  createdAt: timestamp("created_at", { mode: "string" }).defaultNow().notNull(),
  updatedAt: timestamp("updated_at", { mode: "string" }),
});

export const cards = pgTable("cards", {
  id: serial("id").primaryKey(),
  name: text("card_name"),
  subType: text("sub_type").array(),
  artist: text("artist").notNull(),
  hp: text("hp"),
  rules: text("rules").array(),
  moves: text("moves").array(),
  types: text("types").array(),
  image: text("image"),
});

export const deck = pgTable("deck", {
  id: serial("id").primaryKey(),
  deckName: text('deck_name'),
  format: text('format'),
  authorId: integer("author_id").notNull().references(() => users.id),
  cards: integer("card_id").notNull().references(() => cards.id),
  createdAt: timestamp("created_at", { mode: "string" }).defaultNow().notNull(),
  updatedAt: timestamp("updated_at", { mode: "string" }).notNull(),
});

export const cardRelations = relations(deck, ({ many }) => ({
  cards: many(cards),
}));

export const userDeckRelations = relations(users, ({ many }) => ({
  decks: many(deck),
}));

export const deckRelations = relations(deck, ({ one }) => ({
  author: one(users, {
    fields: [deck.authorId],
    references: [users.id],
  }),
}));
