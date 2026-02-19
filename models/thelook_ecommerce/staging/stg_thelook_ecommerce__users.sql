with source as (

    select * from {{ source('thelook_ecommerce', 'users')}}
),

renamed as (

    select
      id as user_id
      , first_name
      , last_name
      , email as user_email
      , age as user_age
      , gender as user_gender
      , state as user_state
      , street_address as user_street_address
      , postal_code as user_postal_code
      , city as user_city
      , country as user_country
      , traffic_source
      , created_at as user_created_date
    
    from source
),

final as (

    select * from renamed
)

select * from final