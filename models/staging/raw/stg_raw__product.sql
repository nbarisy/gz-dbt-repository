with 

source as (

    select * from {{ source('raw', 'product') }}

),

renamed as (

    select
        products_id,
        cast(purcHSE_PRICE as int)  as purchase_price

    from source

)

select * from renamed