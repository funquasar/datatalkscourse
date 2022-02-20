{{ config(materialized='view') }}

select 
-- identifiers
    {{ dbt_utils.surrogate_key(['dispatching_base_num', 'pickup_datetime']) }} as tripid,
    cast(dispatching_base_num as string) as dispatching_base_num,
    
    cast(PULocationID as integer) as pickup_locationid,
    cast(DOLocationID as integer) as dropoff_locationid,
    
    -- timestamps
    cast(pickup_datetime as timestamp) as pickup_datetime,
    cast(dropoff_datetime as timestamp) as dropoff_datetime,
    
    -- trip info
    cast(SR_Flag as numeric) as SR_Flag
from 
  {{ source('staging', 'fhv_tripdata') }}
where 
    dispatching_base_num is not null