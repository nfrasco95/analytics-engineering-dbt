{%- set payment_methods = ['bank_transfer', 'credit_card', 'coupon', 'gift_card'] -%}

with payments as (

    select * from {{ ref('stg_stripe__payment') }}
    where payment_status = 'success'
),

pivoted as (
    select
        order_id,
        {% for method in payment_methods -%}
            SUM(CASE WHEN payment_method = '{{ method }}' THEN amount ELSE 0 END) as {{ method }}_amount
            {%- if not loop.last %},
            {% endif -%}
        {%- endfor %}
    from payments

    group by order_id
)

select * from pivoted