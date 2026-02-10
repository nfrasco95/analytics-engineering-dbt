SELECT 
    order_id,
    sum(amount) as total_amount
from {{ ref('stg_stripe__payment') }}

GROUP BY order_id
HAVING sum(amount) < 0