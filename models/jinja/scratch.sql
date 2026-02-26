--select distinct payment_method from {{ ref('stg_stripe__payment') }}

/*{{ target.name }}
{{ target.role }}
{{ target.schema }}*/

--{{template_example() }}

/*{{ union_tables_by_prefix(database='dbt-tutorial', schema='dbt_learn_jinja', prefix='orders__') }}*/

/*{% set database = target.database %}
{% set schema = target.schema %}

select
    table_type
    , table_schema
    , table_name
    , last_altered
    , CASE WHEN table_type = 'VIEW' then 'VIEW' else 'TABLE' END  as object_type
    , 'DROP ' || object_type || ' ' || '{{ database | upper }}' || '.' || table_schema || '.' || table_name || ';' as drop_statement
from {{ database }}.information_schema.tables
where table_schema = upper( '{{ schema }}' )
and date(last_altered) <= date(dateadd('day', -1, current_date))
order by last_altered desc
*/