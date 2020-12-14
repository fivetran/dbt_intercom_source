# Intercom Source

This package models Intercom data from [Fivetran's connector](https://fivetran.com/docs/applications/intercom). It uses data in the format described by [this ERD](https://docs.google.com/presentation/d/1K3HTGqNQ-neUNeTtjJq42RHBV68_4FuXFp8X81zJ5Xo/edit#slide=id.p).

This package enriches your Fivetran data by doing the following:

* Adds descriptions to tables and columns that are synced using Fivetran
* Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
* Models staging tables, which will be used in our transform package

## Compatibility
> Please be aware the [dbt_intercom_source](https://github.com/fivetran/dbt_intercom_source) and transform [dbt_intercom](https://github.com/fivetran/dbt_intercom) packages will only work with the [Fivetran Intercom connector](https://fivetran.com/docs/applications/intercom/changelog) which was released in July 2020, or any version thereafter. If your Intercom connector was set up prior to the July 2020 release, you will need to set up a new Intercom connector in order for the Fivetran dbt Intercom packages to work.

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

This package includes all source columns defined in the macros folder. To add additional columns to this package, do so using our pass-through column variables. This is extremely useful if you'd like to include custom fields to the package.


```yml
# dbt_project.yml

...
vars:
  intercom_source:
    company_history_pass_through_columns: [company_custom_field_1, company_custom_field_2]
    contact_history_pass_through_columns: [super_cool_contact_field]
```

Additionally, this package includes company, contact, and conversation tag mapping tables as well as a company contact mapping table. We understand not every Intercom customer utilizes these tables. As such, if you do not use these tables you may add the below configuration (removing any configs for tables you use) to your `dbt_project.yml` file. By default these variables are set to `True`:

```yml
# dbt_project.yml

...
vars:
  intercom_source:
    using_contact_company: False
    using_company_tags: False
    using_contact_tags: False
    using_conversation_tags: False
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
