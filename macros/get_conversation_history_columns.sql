{% macro get_conversation_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "assignee_id", "datatype": dbt_utils.type_int()},
    {"name": "assignee_type", "datatype": dbt_utils.type_string()},
    {"name": "conversation_rating_remark", "datatype": dbt_utils.type_int()},
    {"name": "conversation_rating_value", "datatype": dbt_utils.type_int()},
    {"name": "created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "first_contact_reply_created_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "first_contact_reply_type", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "read", "datatype": "boolean"},
    {"name": "sla_name", "datatype": dbt_utils.type_int()},
    {"name": "sla_status", "datatype": dbt_utils.type_int()},
    {"name": "snoozed_until", "datatype": dbt_utils.type_timestamp()},
    {"name": "source_author_id", "datatype": dbt_utils.type_string()},
    {"name": "source_author_type", "datatype": dbt_utils.type_string()},
    {"name": "source_body", "datatype": dbt_utils.type_string()},
    {"name": "source_delivered_as", "datatype": dbt_utils.type_string()},
    {"name": "source_subject", "datatype": dbt_utils.type_string()},
    {"name": "source_type", "datatype": dbt_utils.type_string()},
    {"name": "state", "datatype": dbt_utils.type_string()},
    {"name": "updated_at", "datatype": dbt_utils.type_timestamp()},
    {"name": "waiting_since", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
