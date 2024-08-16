CREATE TABLE `deck` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`deckName` text,
	`format` text,
	`user_id` integer NOT NULL,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE no action
);
--> statement-breakpoint
CREATE TABLE `users` (
	`id` integer PRIMARY KEY AUTOINCREMENT NOT NULL,
	`username` text
);
