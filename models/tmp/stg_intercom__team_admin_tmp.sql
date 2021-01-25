--To disable this model, set the using_team_admin variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_team_admin', True)) }}

select * 
from {{ var('team_admin') }}
