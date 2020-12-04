{% macro get_conversation_contact_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_string()},
    {"name": "contact_id", "datatype": dbt_utils.type_string()},
    {"name": "conversation_id", "datatype": dbt_utils.type_int()},
    {"name": "conversation_updated_at", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
