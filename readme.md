# `dbt`

## Notes

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
- `snapshots`: helps to capture changes over time like SCD2 (slowly changing dimension tables type 2). Example: a customer changing address. Example: https://github.com/josephmachado/simple_dbt_project/blob/master/snapshots/customers.sql
  - dbt snapshot adds extra columns `dbt_valid_from` and `dbt_valid_to` to mark when the changes occured
  - use `dbt snapshot` to capture the change in data
  - `dbt run` does not create snapshots

### Models

- In dbt, models are sql files with a select statement
- models depend on other models, have tests defined on them, and can be created as tables or views
- the names of models created by dbt are their file names
- example: the file `post_history.sql` represents the model named `post_history`
- by default, every model is a view. This can be adjusted in `dbt_project.yml`, where the `materialized` argument can be set to `table`

### Tests

- two types of test: generic and bespoke/one-off
- generic: `unique`, `not_null`, `accepted_values` and `relationships` built-in tests defined in `models/**.yml`. Example: `models/bronze/schema.yml`. Doc: https://docs.getdbt.com/docs/build/data-tests#generic-data-tests
- bespoke/one-off: sql scripts created under the `tests` folder
- use `dbt test` to run the tests

### Configurations

- `profiles.yml`: contains data warehouse connection details

  - `target`: defines the environment (default is `dev`). Multiple targets are possible
  - this can contain multiple profiles if you have more than one dbt project

- `dbt_project.yml`: define the profile to be use and the paths for different file types (`*-paths`). Also set whether models should be created as view or table

### Commands

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

# Minimal Viable SQL Patterns StackOverflow Data model

![alt text](images/image.png)

# Ref

Main: [Repo for Book: Minimal Viable SQL Patterns](https://github.com/ergest/sql_patterns/tree/main)

Additional:

- https://github.com/meltano/jaffle-shop-template
- https://github.com/gwenwindflower/octocatalog
- [Repo Startdataengineering[dot]com: dbt(Data Build Tool) Tutorial](https://github.com/josephmachado/simple_dbt_project)
- [Blog startdataengineering[dot]com: dbt(Data Build Tool) Tutorial. Accessed: 2024-08-18](https://www.startdataengineering.com/post/dbt-data-build-tool-tutorial/)
- [Blog startdataengineering[dot]com: Uplevel your dbt workflow. Accessed: 2024-08-18](https://www.startdataengineering.com/post/uplevel-dbt-workflow/)
- [Blog startdataengineering[dot]com: How to set up a dbt data-ops workflow. Accessed: 2024-08-18](https://www.startdataengineering.com/post/cicd-dbt/)

More:
- [Blog Building scalable data pipelines with Kedro and Ibis]([https://github.com/deepyaman/jaffle-shop](https://kedro.org/blog/building-scalable-data-pipelines-with-kedro-and-ibis))
- [Repo Building scalable data pipelines with Kedro and Ibis](https://github.com/deepyaman/jaffle-shop)
- [Ibis](https://ibis-project.org/)
