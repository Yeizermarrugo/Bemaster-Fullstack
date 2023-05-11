CREATE TABLE "video" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "duration" time NOT NULL,
  "publication_date" date NOT NULL,
  "author_id" uuid NOT NULL,
  "upvotes" boolean,
  "downvotes" boolean,
  "created_at" timestamp DEFAULT 'now()',
  "update_at" timestamp DEFAULT 'now()'
);

CREATE TABLE "authors" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "created_at" timestamp DEFAULT 'now()',
  "update_at" timestamp DEFAULT 'now()'
);

CREATE TABLE "collaborators" (
  "id" uuid PRIMARY KEY,
  "video_id" uuid NOT NULL,
  "author_id" uuid NOT NULL,
  "user_id" uuid NOT NULL,
  "created_at" timestamp DEFAULT 'now()',
  "update_at" timestamp DEFAULT 'now()'
);

CREATE TABLE "comments" (
  "id" uuid PRIMARY KEY,
  "comment" text NOT NULL,
  "upvotes" boolean,
  "downvotes" boolean,
  "video_id" uuid NOT NULL,
  "user_id" uuid NOT NULL,
  "created_at" timestamp DEFAULT 'now()',
  "update_at" timestamp DEFAULT 'now()'
);

CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "created_at" timestamp DEFAULT 'now()',
  "update_at" timestamp DEFAULT 'now()'
);

CREATE TABLE "reviews" (
  "id" uuid PRIMARY KEY,
  "video_id" uuid NOT NULL,
  "user_id" uuid NOT NULL,
  "rating" int NOT NULL
);

CREATE TABLE "role" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "created_at" timestamp DEFAULT 'now()',
  "update_at" timestamp DEFAULT 'now()'
);

CREATE TABLE "user_role" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "role_id" uuid NOT NULL
);

ALTER TABLE "video" ADD FOREIGN KEY ("author_id") REFERENCES "authors" ("id");

ALTER TABLE "collaborators" ADD FOREIGN KEY ("video_id") REFERENCES "video" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("video_id") REFERENCES "video" ("id");

ALTER TABLE "comments" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "authors" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_role" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_role" ADD FOREIGN KEY ("role_id") REFERENCES "role" ("id");

ALTER TABLE "authors" ADD FOREIGN KEY ("id") REFERENCES "collaborators" ("author_id");

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "collaborators" ("user_id");

ALTER TABLE "video" ADD FOREIGN KEY ("id") REFERENCES "reviews" ("video_id");

ALTER TABLE "reviews" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");
