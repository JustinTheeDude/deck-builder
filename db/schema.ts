import { sql, relations } from "drizzle-orm";
import { text, integer, sqliteTable } from "drizzle-orm/sqlite-core";

export const users = sqliteTable('users', {
  id: integer('id', { mode: 'number' }).primaryKey({ autoIncrement: true }),
  userName: text('username'),
})

export const deck = sqliteTable("deck", {
  id: integer('id', { mode: 'number' }).primaryKey({ autoIncrement: true }),
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