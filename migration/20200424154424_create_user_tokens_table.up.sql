CREATE TABLE "public"."user_tokens"(
    "id" serial NOT NULL,
    "user_id" int NOT NULL,
    "token" text NOT NULL,
    "context" text NOT NULL,
    "sent_to" text NOT NULL,
    "created_at" timestamp(0) without time zone NOT NULL DEFAULT now(),
    PRIMARY KEY ("id"),
    CONSTRAINT "users_tokens_user_id_fkey" FOREIGN KEY ("user_id")
        REFERENCES "public"."users" ("id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
);