--To disable this model, set the using_team variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_team', True)) }}

select * 
from {{ var('team') }}
