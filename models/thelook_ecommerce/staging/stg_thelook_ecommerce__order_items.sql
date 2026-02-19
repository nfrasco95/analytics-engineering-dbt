with source as (

    select * from {{ source('thelook_ecommerce', 'order_items') }}
),

renamed as (

    select
      id as order_item_id
      , order_id
      , product_id
      , inventory_item_id
      , status as order_item_status
      , created_at as order_item_created_date
      , shipped_at as order_item_shipped_date
      , delivered_at as order_item_delivered_date
      , returned_at as order_item_returned_date
      , sale_price

    from source
),

final as (

    select * from renamed
)

select * from final