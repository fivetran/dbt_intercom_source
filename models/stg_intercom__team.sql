with source as (

    select * from {{ ref('stg_intercom__team_tmp') }}

),

renamed as (

    select
    
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_intercom__team_tmp')),
                staging_columns=get_team_columns()
            )
        }}

    from source

)

select * from renamed