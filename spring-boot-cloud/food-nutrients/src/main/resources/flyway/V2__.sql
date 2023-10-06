CREATE TABLE nutrient_group
(
    id      BIGINT NOT NULL,
    name    VARCHAR(255),
    name_fr VARCHAR(255),
    CONSTRAINT pk_nutrient_group PRIMARY KEY (id)
);

CREATE TABLE nutrient
(
    id                BIGINT NOT NULL,
    name              VARCHAR(255),
    name_fr           VARCHAR(255),
    symbol            VARCHAR(255),
    unit              VARCHAR(255),
    requirement       FLOAT,
    nutrient_group_id BIGINT,
    CONSTRAINT pk_nutrient PRIMARY KEY (id)
);

ALTER TABLE nutrient
    ADD CONSTRAINT FK_NUTRIENT_ON_NUTRIENT_GROUP FOREIGN KEY (nutrient_group_id) REFERENCES nutrient_group (id) ON DELETE CASCADE;

CREATE TABLE food_nutrient
(
    id          BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    food_id     BIGINT                                  NOT NULL,
    nutrient_id BIGINT                                  NOT NULL,
    value       FLOAT,
    CONSTRAINT pk_food_nutrient PRIMARY KEY (id)
);

ALTER TABLE food_nutrient
    ADD CONSTRAINT FK_FOOD_NUTRIENT_ON_FOOD FOREIGN KEY (food_id) REFERENCES food (id) ON DELETE CASCADE;

ALTER TABLE food_nutrient
    ADD CONSTRAINT FK_FOOD_NUTRIENT_ON_NUTRIENT FOREIGN KEY (nutrient_id) REFERENCES nutrient (id) ON DELETE CASCADE;