--To disable this model, set the using_contact_tags variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_contact_tags', True)) }}

select * 
from {{ var('contact_tag_history') }}
