--To disable this model, set the using_company variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_company', True)) }}

select * 
from {{ var('company_history') }}
