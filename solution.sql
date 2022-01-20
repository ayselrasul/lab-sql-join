-- List the number of films per category

   select name as category,count(film_id) as number_of_films
   from sakila.category c
   join sakila.film_category fc on c.category_id = fc.category_id
   group by category
   Order by category;
 


-- Display the first and the last names, as well as the address, of each staff member

   select first_name,last_name,address
   from sakila.staff s
   join sakila.address a 
   on a.address_id = s.address_id;
 


-- Display the total amount rung up by each staff member in August 2005
   
   select s.staff_id,s.first_name,s.last_name,sum(amount) as total_amount
   from sakila.payment p
   join sakila.staff s 
   on p.staff_id = s.staff_id
   where  s.staff_id in(1,2,3) and month(p.payment_date) = '8' and year(p.payment_date) = '2005'
   group by s.staff_id;
  
 
-- List all films and the number of actors who are listed for each film
  
   select title as films,count(actor_id) as number_of_actors
   from sakila.film f
   join sakila.film_actor fa
   on f.film_id = fa.film_id
   group by title
   Order by number_of_actors desc;
   


-- Using the payment and the customer tables as well as the JOIN command, list the total amount 
-- paid by each customer. List the customers alphabetically by their last names.
   
   select c.first_name,c.last_name,sum(p.amount) as total_amount
   from sakila.payment p
   join sakila.customer c
   on p.customer_id = c.customer_id
   group by c.customer_id
   Order by c.last_name;


