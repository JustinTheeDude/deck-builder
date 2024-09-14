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

export const userSelectedCards = pgTable("user_cards", {
  id: serial("id").primaryKey(),
  card: integer("card_id").notNull().references(() => cards.id),
  deckId: integer("user_deck_id").notNull().references(() => deck.id),
})

export const deck = pgTable("users_deck", {
  id: serial("id").primaryKey(),
  deckName: text('deck_name'),
  format: text('format'),
  authorId: integer("author_id").notNull().references(() => users.id),
  createdAt: timestamp("created_at", { mode: "string" }).defaultNow().notNull(),
  updatedAt: timestamp("updated_at", { mode: "string" }).notNull(),
});

export const deckRelations = relations(deck, ({ many, one }) => ({
  cards: many(userSelectedCards),
  author: one(users, {
    fields: [deck.authorId],
    references: [users.id],
  }),
}));

export const userDeckRelations = relations(users, ({ many }) => ({
  decks: many(deck),
}));
