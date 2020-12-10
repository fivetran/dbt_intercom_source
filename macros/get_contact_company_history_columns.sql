{% macro get_contact_company_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "company_id", "datatype": dbt_utils.type_string()},
    {"name": "contact_id", "datatype": dbt_utils.type_string()},
    {"name": "contact_updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "user_id", "datatype": dbt_utils.type_string()},
    {"name": "user_updated_at", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
