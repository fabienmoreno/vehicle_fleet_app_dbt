-- models/example_model.sql

with vehicle_data as (
    select
        id,
        car_registration,
        date_first_registration,
        owner_name,
        color,
        number_of_seats,
        created_at
    from {{ source('public', 'vehicle') }}
)

select
    id,
    car_registration,
    owner_name,
    color,
    number_of_seats,
    date_first_registration,
    created_at,
    -- Calculate vehicle age in years
    date_part('year', age(current_date, date_first_registration)) as vehicle_age
from vehicle_data;
