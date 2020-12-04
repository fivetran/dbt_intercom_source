
with base as (

    select * 
    from {{ ref('stg_intercom__conversation_history_tmp') }}

),

fields as (

    select
    /*
    The below macro is used to generate the correct SQL for package staging models. It takes a list of columns 
    that are expected/needed (staging_columns from dbt_salesforce_source/models/tmp/) and compares it with columns 
    in the source (source_columns from dbt_salesforce_source/macros/).
    For more information refer to our dbt_fivetran_utils documentation (https://github.com/fivetran/dbt_fivetran_utils.git).
    */

        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_intercom__conversation_history_tmp')),
                staging_columns=get_conversation_history_columns()
            )
        }}

        --The below script allows for pass through columns.
        {% if var('conversation_history_pass_through_columns') %}
        ,
        {{ var('conversation_history_pass_through_columns') | join (", ")}}

        {% endif %}

    from base
),

final as (
    
    select 
        id as conversation_id,
        created_at,
        assignee_id,
        assignee_type,
        conversation_rating_value,
        conversation_rating_remark,
        first_contact_reply_created_at,
        first_contact_reply_type,
        open as is_open,
        read as is_read,
        source_author_id,
        source_author_type,
        source_delivered_as,
        source_type,
        source_subject,
        state,
        updated_at,
        waiting_since,
        snoozed_until

        --The below script allows for pass through columns.
        {% if var('conversation_history_pass_through_columns') %}
        ,
        {{ var('conversation_history_pass_through_columns') | join (", ")}}

        {% endif %}

    from fields
)

select * 
from final