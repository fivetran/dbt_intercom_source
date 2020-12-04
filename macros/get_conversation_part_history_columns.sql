{% macro get_conversation_part_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_string()},
    {"name": "assigned_to_id", "datatype": dbt_utils.type_int()},
    {"name": "assigned_to_type", "datatype": dbt_utils.type_string()},
    {"name": "author_id", "datatype": dbt_utils.type_string()},
    {"name": "author_type", "datatype": dbt_utils.type_string()},
    {"name": "body", "datatype": dbt_utils.type_string()},
    {"name": "conversation_id", "datatype": dbt_utils.type_int()},
    {"name": "conversation_updated_at", "datatype": dbt_utils.type_string()},
    {"name": "created_at", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "notified_at", "datatype": dbt_utils.type_string()},
    {"name": "part_type", "datatype": dbt_utils.type_string()},
    {"name": "updated_at", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
