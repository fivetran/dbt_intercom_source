{% macro get_conversation_tag_history_columns() %}

{% set columns = [
    {"name": "conversation_id", "datatype": dbt_utils.type_int()},
    {"name": "conversation_updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "tag_id", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
