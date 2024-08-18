import { relations } from "drizzle-orm";
import { pgTable, serial, text, integer } from "drizzle-orm/pg-core";

export const users = pgTable('users', {
  id: serial("id").primaryKey(),
  userName: text('username'),
})

export const deck = pgTable("deck", {
  id: serial("id").primaryKey(),
  deckName: text('deckName'),
  format: text('format'),
  authorId: integer("user_id").notNull().references(() => users.id),
});

export const userDeckRelations = relations(users, ({ many }) => ({
  decks: many(deck)
}));

export const deckRelations = relations(deck, ({ one }) => ({
  deck: one(users, {
    fields: [deck.id],
    references: [users.id]
  })
}));