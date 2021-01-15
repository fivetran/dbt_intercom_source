{% macro get_contact_history_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "admin_id", "datatype": dbt_utils.type_int()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "email", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "last_contacted_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "last_email_clicked_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "last_email_opened_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "last_replied_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "role", "datatype": dbt_utils.type_string()},
    {"name": "signed_up_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "unsubscribed_from_emails", "datatype": "boolean"},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
