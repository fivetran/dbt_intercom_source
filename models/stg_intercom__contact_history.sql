with base as (

    select * 
    from {{ ref('stg_intercom__contact_history_tmp') }}

),

fields as (

    select
    /*
    The below macro is used to generate the correct SQL for package staging models. It takes a list of columns 
    that are expected/needed (staging_columns from dbt_intercom_source/models/tmp/) and compares it with columns 
    in the source (source_columns from dbt_intercom_source/macros/).
    For more information refer to our dbt_fivetran_utils documentation (https://github.com/fivetran/dbt_fivetran_utils.git).
    */
    
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_intercom__contact_history_tmp')),
                staging_columns=get_contact_history_columns()
            )
        }}
        
        --The below script allows for pass through columns.
        {% if var('intercom__contact_history_pass_through_columns') %}
        ,
        {{ var('intercom__contact_history_pass_through_columns') | join (", ")}}

        {% endif %}
    from base
),

final as (
    
    select 
        id as contact_id,
        admin_id,
        created_at,
        updated_at,
        signed_up_at,
        name as contact_name, 
        role as contact_role,
        email as contact_email,
        last_replied_at,
        last_email_clicked_at,
        last_email_opened_at,
        last_contacted_at,
        unsubscribed_from_emails as is_unsubscribed_from_emails

        --The below script allows for pass through columns.
        {% if var('intercom__contact_history_pass_through_columns') %}
        ,
        {{ var('intercom__contact_history_pass_through_columns') | join (", ")}}

        {% endif %}
    from fields
)

select * 
from final
