--To disable this model, set the using_company_tags variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_company_tags', True)) }}

select * 
from {{ var('company_tag_history') }}
