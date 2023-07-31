
-- Schema coding - shared work Andrew and Vicky - completed over zoom / teamwork

--- PLEASE when importing csv into PostGre SQL load Campaign.csv last 

CREATE TABLE "campaign" (
    "cf_id" float(5)   NOT NULL,
    "contact_id" float(4)   NOT NULL,
    "company_name" varchar(50)   NOT NULL,
    "description" varchar(55)   NOT NULL,
    "goal" float,
    "pledged" float,
    "backers_count" float,
    "country" varchar(2)   NOT NULL,
    "currency" varchar(3)   NOT NULL,
    "launch_date" timestamp   NOT NULL,
    "end_date" timestamp   NOT NULL,
    "category_id" varchar(4)   NOT NULL,
    "subcategory_id" varchar(8)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);




CREATE TABLE "category_df" (
    "category_id" varchar(4)   NOT NULL,
    "category" varchar(12)   NOT NULL,
    CONSTRAINT "pk_category_df" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "contacts_df" (
    "contact_id" float(4)   NOT NULL,
    "first_name" varchar(15)   NOT NULL,
    "last_name" varchar(15)   NOT NULL,
    "email" varchar(42)   NOT NULL,
    CONSTRAINT "pk_contacts_df" PRIMARY KEY (
        "contact_id"
     )
);

CREATE TABLE "subcategory_df" (
    "category" varchar(8)   NOT NULL,
    "subcategory" varchar(17)   NOT NULL,
    CONSTRAINT "pk_subcategory_df" PRIMARY KEY (
        "category"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts_df" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category_df" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory_df" ("category");

