# dbt_intercom_source v0.6.1
## ⭐ Features ⭐
- Passthrough columns variables can now be configured with an alias and a transform. Refer to [Passthrough Columns](https://github.com/fivetran/dbt_intercom_source#passthrough-columns) of the README for more information. ([#22](https://github.com/fivetran/dbt_intercom_source/pull/22))
- Added passthrough custom column capability for models depending on source table `conversation_history`. ([#22](https://github.com/fivetran/dbt_intercom_source/pull/22))
- Addition of the `body` field to the `stg_intercom__conversation_part_history` model. The addition of this field will help users understand the context of the conversation parts. ([#23](https://github.com/fivetran/dbt_intercom_source/pull/23))

## 🚘 Under the hood 🚘
- Updated staging for sources `company_history` and `contact_history` to utilize passthrough column macros from the fivetran/fivetran_utils package, which provides the configuration ability. ([#22](https://github.com/fivetran/dbt_intercom_source/pull/22))

## 🔧 Fixes 🔧
- Removed the `assigned_to_id` null test from `stg_intercom__conversation_part_history`. This test does not apply to instances where a conversation is not assigned, so `assigned_to_id` could accurately be null. ([#22](https://github.com/fivetran/dbt_intercom_source/pull/22))

# dbt_intercom_source v0.6.0

## 🚨 Breaking Changes 🚨:
[PR #19](https://github.com/fivetran/dbt_intercom_source/pull/19) includes the following breaking changes:
- Dispatch update for dbt-utils to dbt-core cross-db macros migration. Specifically `{{ dbt_utils.<macro> }}` have been updated to `{{ dbt.<macro> }}` for the below macros:
    - `any_value`
    - `bool_or`
    - `cast_bool_to_text`
    - `concat`
    - `date_trunc`
    - `dateadd`
    - `datediff`
    - `escape_single_quotes`
    - `except`
    - `hash`
    - `intersect`
    - `last_day`
    - `length`
    - `listagg`
    - `position`
    - `replace`
    - `right`
    - `safe_cast`
    - `split_part`
    - `string_literal`
    - `type_bigint`
    - `type_float`
    - `type_int`
    - `type_numeric`
    - `type_string`
    - `type_timestamp`
    - `array_append`
    - `array_concat`
    - `array_construct`
- For `current_timestamp` and `current_timestamp_in_utc` macros, the dispatch AND the macro names have been updated to the below, respectively:
    - `dbt.current_timestamp_backcompat`
    - `dbt.current_timestamp_in_utc_backcompat`
- Dependencies on `fivetran/fivetran_utils` have been upgraded, previously `[">=0.3.0", "<0.4.0"]` now `[">=0.4.0", "<0.5.0"]`.

# dbt_intercom_source v0.5.0
## 🚨 Breaking Changes 🚨
- Added dbt_expectations packages to more easily setup more complex data validation tests.
- Added not null tests for both author and assigned_to fields, conditional on author_type and assigned_to_type not being null.
## Features
- 🎉 Postgres Compatibility 🎉 ([#18](https://github.com/fivetran/dbt_intercom_source/pull/18))
## Under the Hood
We have added the below feature enhancements to this package in PR #18  ([#18](https://github.com/fivetran/dbt_intercom_source/pull/18)):
- Added `{{ dbt_utils.type_timestamp() }}` casting to timestamp fields for safe casting across warehouses. ([#18](https://github.com/fivetran/dbt_intercom_source/pull/18))

# dbt_intercom_source v0.4.0
🎉 dbt v1.0.0 Compatibility 🎉
## 🚨 Breaking Changes 🚨
- Adjusts the `require-dbt-version` to now be within the range [">=1.0.0", "<2.0.0"]. Additionally, the package has been updated for dbt v1.0.0 compatibility. If you are using a dbt version <1.0.0, you will need to upgrade in order to leverage the latest version of the package.
  - For help upgrading your package, I recommend reviewing this GitHub repo's Release Notes on what changes have been implemented since your last upgrade.
  - For help upgrading your dbt project to dbt v1.0.0, I recommend reviewing dbt-labs [upgrading to 1.0.0 docs](https://docs.getdbt.com/docs/guides/migration-guide/upgrading-to-1-0-0) for more details on what changes must be made.
- Upgrades the package dependency to refer to the latest `dbt_fivetran_utils`. The latest `dbt_fivetran_utils` package also has a dependency on `dbt_utils` [">=0.8.0", "<0.9.0"].
  - Please note, if you are installing a version of `dbt_utils` in your `packages.yml` that is not in the range above then you will encounter a package dependency error.

## Bug Fixes
- Addition of the `meta` config within the relevant `src_intercom.yml` tables that are able to be disabled by the user. These configs allow the source freshness tests to skip over the disabled models.

## Under the Hood
- Removed unnecessary duplicate `company_id` field definition and test from `stg_intercom.yml`.

# dbt_intercom_source v0.1.0 -> v0.3.0
Refer to the relevant release notes on the Github repository for specific details for the previous releases. Thank you!
