## Schema

1. **pizzeria** - Dictionary Table with available pizzerias
- id - primary key
- name - name of pizzeria
- rating - average rating of pizzeria (from 0 to 5)
2. **person** - Dictionary Table with persons
- id - primary key
- name - name of person
- age - age of person
- gender - gender of person
- address - address of person
3. **menu** - Dictionary Table with menu and prices
- id - primary key
- pizzeria_id - foreign key to pizzeria
- pizza_name - name of pizza in pizzeria
- price - price of concrete pizza
4. **person_visits** - Operational Table with information about visits
- id - primary key
- person_id - foreign key to person
- pizzeria_id - foreign key to pizzeria
- visit_date - date (for example 2022-01-01) of person visit 
5. **person_order** - Operational Table with information about persons orders
- field id - primary key
- field person_id - foreign key to person
- field menu_id - foreign key to menu
- field order_date - date (for example 2022-01-01) of person order 

Visits and orders are distinct entities with no inherent correlation between their respective data.
