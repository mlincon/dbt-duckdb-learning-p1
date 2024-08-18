# `dbt`

## Notes

### Models

- In dbt, models are sql files with a select statement
- models depend on other models, have tests defined on them, and can be created as tables or views
- the names of models created by dbt are their file names
- example: the file `post_history.sql` represents the model named `post_history`

### Tests

- two types of test: generic and bespoke/one-off
- generic: `unique`, `not_null`, `accepted_values` and `relationships` built-in tests defined in `models/**.yml`. Example: `models/bronze/schema.yml`. Doc: https://docs.getdbt.com/docs/build/data-tests#generic-data-tests
- bespoke/one-off: sql scripts created under the `tests` folder

### Folder structure

```
.
├── analysis
├── seeds
├── macros
├── models
│   ├── marts
│   │   ├── core
│   │   └── marketing
│   └── staging
├── snapshots
└── tests
```

- `analysis`: any `.sql` files here will be compiled to raw sql with `dbt compile`. The compiled scripts will not executed with `dbt run` but can be copied to any other tool
- `seeds`: store small static/mapping files that can be loaded to a data warehouse via `dbt seed`
- `marco`: sql based functions that can be reused across project

## Commands

`dbt init <project name>` to create a new project.

`dbt deps` install packages from `packages.yml`. It requires `dbt_project.yml`.

`dbt build` requires `profiles.yml`. Define configuration in `profiles.yml`.

`dbt run` to materialize the models.

`dbt seed` to include static files from the `/seeds` folder.

## Simple model

Create a directory in the `models` directory. Add `.sql` files.

## Packages

### `dbt-utils`

- `union_relations`: combines via `union all` an array of Relations, even when columns have differing orders in each Relation, and/or some columns are missing from some relations. Ref: https://github.com/dbt-labs/dbt-utils?tab=readme-ov-file#union_relations-source

# Data model

![alt text](images/image.png)

# Ref

Main: https://github.com/ergest/sql_patterns/tree/main

Additional:

- https://github.com/meltano/jaffle-shop-template
- https://github.com/gwenwindflower/octocatalog
- https://www.startdataengineering.com/post/dbt-data-build-tool-tutorial/
