WITH source as
(
    SELECT * FROM {{ source('thelook_ecommerce', 'products') }}
),

renamed as (

    SELECT 
        id as product_id
        , name as product_name
        , cost as product_cost
        , category as product_category
        , brand
        , retail_price as product_retail_price
        , department as product_department
        , sku as product_sku
        , distribution_center_id
    FROM source
),

final as (
    SELECT * FROM renamed
    )

SELECT * FROM final