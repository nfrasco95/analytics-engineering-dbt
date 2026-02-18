with source as (
    
    select * from {{ source('thelook_ecommerce', 'orders')}}
),

renamed as (

    select
      order_id
      , user_id as customer_id
      , status as order_status
      , gender as customer_gender
      , created_at as order_date
      , returned_at as order_returned_date
      , shipped_at as order_shipped_date
      , delivered_at as order_delivered_date
      , num_of_item as order_num_of_items

    from source
),

final as (

    select * from renamed
)

select * from final