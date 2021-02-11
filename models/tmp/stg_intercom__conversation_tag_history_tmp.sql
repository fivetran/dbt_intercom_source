--To disable this model, set the using_conversation_tags variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_conversation_tags', True)) }}

select * 
from {{ var('conversation_tag_history') }}
