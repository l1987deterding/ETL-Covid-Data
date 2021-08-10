-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "covid_tracker" (
    "case_month" VARCHAR   NOT NULL,
    "res_state" VARCHAR   NOT NULL,
    "res_county" VARCHAR   NOT NULL,
    "age_group" VARCHAR   NOT NULL,
    "current_status" VARCHAR   NOT NULL,
    "symptom_status" VARCHAR   NOT NULL,
    "hosp_yn" VARCHAR   NOT NULL,
    "icu_yn" VARCHAR   NOT NULL,
    "death_yn" VARCHAR   NOT NULL,
    "underlying_conditions_yn" VARCHAR   NOT NULL
);

CREATE TABLE "vaccine_allocation" (
    "state" VARCHAR   NOT NULL,
    "pfizer_first" VARCHAR   NOT NULL,
    "pfizer_second" VARCHAR   NOT NULL,
    "moderna_first" VARCHAR   NOT NULL,
    "moderna_second" VARCHAR   NOT NULL,
    "j&j_first" VARCHAR   NOT NULL,
    "j&j_second" VARCHAR   NOT NULL
);

CREATE TABLE "covid_death_tracker" (
    "state" VARCHAR   NOT NULL,
    "condition_group" VARCHAR   NOT NULL,
    "condition" VARCHAR   NOT NULL,
    "age_group" VARCHAR   NOT NULL,
    "covid_19_deaths" INT   NOT NULL
);

CREATE TABLE "population" (
    "rank" INT   NOT NULL,
    "state" VARCHAR   NOT NULL,
    "pop" INT   NOT NULL,
    "growth" DECIMAL   NOT NULL,
    "percent_of_united_states" DECIMAL   NOT NULL,
    "density_per_square_mile" DECIMAL   NOT NULL
);

CREATE TABLE "vaccine_administration" (
    "state" VARCHAR   NOT NULL,
    "%_Population_Vaccinated" DECIMAL   NOT NULL,
    "Total_Population_Vaccinated" INT   NOT NULL,
    "Vaccinated_Population_Age12to17" INT   NOT NULL,
    "%_Population_Vaccinated_Age12to17" DECIMAL   NOT NULL,
    "Vaccinated_Population_Age18to64" INT   NOT NULL,
    "Vaccinated_Population_Age65andup" INT   NOT NULL,
    "%_Population_Vaccinated_Age65andup" DECIMAL   NOT NULL,
    "1st_dose_administered" INT   NOT NULL,
    "%_Population_1st_dose_administered" DECIMAL   NOT NULL,
    "Population_1st_dose_administered_Age12to17" INT   NOT NULL,
    "%_Population_1st_dose_administered_Age12to17" DECIMAL   NOT NULL,
    "Population_1st_dose_administered_Age18to64" INT   NOT NULL,
    "%_Population_1st_dose_administered_Age18to64" DECIMAL   NOT NULL,
    "Population_1st_dose_administered_Age65andup" INT   NOT NULL,
    "%_Population_1st_dose_administered_Age65andup" DECIMAL   NOT NULL,
    "Social_Vulnerability_Index" VARCHAR   NOT NULL
);

CREATE TABLE "state_names" (
    "state" VARCHAR   NOT NULL,
    "abbr" VARCHAR   NOT NULL,
    CONSTRAINT "pk_state_names" PRIMARY KEY (
        "state"
     )
);

ALTER TABLE "covid_tracker" ADD CONSTRAINT "fk_covid_tracker_res_state" FOREIGN KEY("res_state")
REFERENCES "state_names" ("state");

ALTER TABLE "vaccine_allocation" ADD CONSTRAINT "fk_vaccine_allocation_state" FOREIGN KEY("state")
REFERENCES "state_names" ("state");

ALTER TABLE "covid_death_tracker" ADD CONSTRAINT "fk_covid_death_tracker_state" FOREIGN KEY("state")
REFERENCES "state_names" ("state");

ALTER TABLE "population" ADD CONSTRAINT "fk_population_state" FOREIGN KEY("state")
REFERENCES "state_names" ("state");

ALTER TABLE "state_names" ADD CONSTRAINT "fk_state_names_abbr" FOREIGN KEY("abbr")
REFERENCES "vaccine_administration" ("state");

