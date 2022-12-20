{% macro get_conversation_tag_history_columns() %}

{% set columns = [
    {"name": "conversation_id", "datatype": dbt.type_int()},
    {"name": "conversation_updated_at", "datatype": dbt.type_timestamp()},
    {"name": "tag_id", "datatype": dbt.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
