# Intercom (Source)

> NOTE: Our Intercom [model](https://github.com/fivetran/dbt_intercom) and [source](https://github.com/fivetran/dbt_intercom_source) dbt packages only work with connectors that were [created in July 2020](https://fivetran.com/docs/applications/intercom/changelog) or later. If you created your connector before July 2020, you must set up a new Intercom connector to use these dbt packages.

This package models Intercom data from [Fivetran's connector](https://fivetran.com/docs/applications/intercom). It uses data in the format described by [this ERD](https://fivetran.com/docs/applications/intercom#schemainformation).

This package enriches your Fivetran data by doing the following:

* Adds descriptions to tables and columns that are synced using Fivetran
* Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
* Models staging tables, which will be used in our transform package

## Models
This package contains staging models, designed to work simultaneously with our [Intercom modeling package](https://github.com/fivetran/dbt_intercom). The staging models name columns consistently across all packages:
* Boolean fields are prefixed with `is_` or `has_`
* Timestamps are appended with `_at`
* ID primary keys are prefixed with the name of the table. For example, the admin table's ID column is renamed `admin_id`.

## Installation Instructions
Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions, or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.

## Configuration
By default, this package looks for your Intercom data in the `intercom` schema of your [target database](https://docs.getdbt.com/docs/running-a-dbt-project/using-the-command-line-interface/configure-your-profile). If this is not where your Intercom data is, add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml 

...
config-version: 2

vars:
    intercom_database: your_database_name
    intercom_schema: your_schema_name
```

This package includes all source columns defined in the macros folder. If you want to include custom fields in this package, you can add more columns using our pass-through column variables.

```yml
# dbt_project.yml

...
vars:
  intercom__company_history_pass_through_columns: [company_custom_field_1, company_custom_field_2]
  intercom__contact_history_pass_through_columns: [super_cool_contact_field]
```

Additionally, this package includes Intercom's `company tag`, `contact tag`, `contact company`,`conversation tag`, `team` and `team admin` mapping tables. If you do not use these tables, add the configuration below to your `dbt_project.yml`. By default, these variables are set to `True`:

```yml
# dbt_project.yml

...
vars:
  intercom__using_contact_company: False
  intercom__using_company_tags: False
  intercom__using_contact_tags: False
  intercom__using_conversation_tags: False
  intercom__using_team: False
```

### Changing the Build Schema
By default this package will build the Intercom staging models within a schema titled (<target_schema> + `_stg_intercom`) in your target database. If this is not where you would like your Intercom staging data to be written to, add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml

...
models:
    intercom_source:
      +schema: my_new_schema_name # leave blank for just the target_schema
```

## Contributions
Additional contributions to this package are very welcome! Please create issues
or open PRs against `master`. Check out 
[this post](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) 
on the best workflow for contributing to a package.

## Resources:
- Provide [feedback](https://www.surveymonkey.com/r/DQ7K7WW) on our existing dbt packages or what you'd like to see next
- Find all of Fivetran's pre-built dbt packages in our [dbt hub](https://hub.getdbt.com/fivetran/)
- Learn more about Fivetran [in the Fivetran docs](https://fivetran.com/docs)
- Check out [Fivetran's blog](https://fivetran.com/blog)
- Learn more about dbt [in the dbt docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the dbt blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
