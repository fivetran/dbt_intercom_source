--To disable this model, set the using_contact_company variable within your dbt_project.yml file to False.
{{ config(enabled=var('using_contact_company', True)) }}

select * 
from {{ var('contact_company_history') }}
