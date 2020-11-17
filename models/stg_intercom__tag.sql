with source as (

    select * from {{ ref('stg_intercom__tag_tmp') }}

),

renamed as (

    select
    
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_intercom__tag_tmp')),
                staging_columns=get_tag_columns()
            )
        }}

    from source

)

select * from renamed