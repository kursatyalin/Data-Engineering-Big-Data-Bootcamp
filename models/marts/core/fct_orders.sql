with orders as (
    select id as order_id,
            user_id as customer_id
    from `dbt-tutorial.jaffle_shop.orders`
),

amount as (
    select amount,
           id as customer_id,
           orderid as order_id

    from `dbt-tutorial.stripe.payment`
),

final as (
    select orders.order_id,
            orders.customer_id,
            amount.customer_id,
            amount.order_id,
            amount.amount
    from orders 
    left join amount ON orders.order_id = amount.order_id
    AND orders.customer_id = amount.customer_id)