DROP TABLE IF EXISTS zomato;
CREATE TABLE zomato (
    restaurant_id INTEGER,
    restaurant_name TEXT,
    city TEXT,
    area TEXT,
    cuisine TEXT,
    average_cost_for_two INTEGER,
    has_online_delivery INTEGER,
    aggregate_rating REAL,
    ratings_count INTEGER,
    menu_item TEXT,
    price INTEGER,
    order_count INTEGER,
    is_gold_member INTEGER,
    user_id INTEGER
);
CREATE INDEX idx_city_area ON zomato(city, area);
CREATE INDEX idx_rest ON zomato(restaurant_id);
