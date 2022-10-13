{% macro get_contact_tag_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_string()},
    {"name": "contact_id", "datatype": dbt.type_string()},
    {"name": "contact_updated_at", "datatype": dbt.type_timestamp()},
    {"name": "tag_id", "datatype": dbt.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
