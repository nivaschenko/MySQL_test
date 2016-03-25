-- a) Для заданного списка товаров получить названия всех категорий, в которых
--    представлены товары:

		select distinct c.name from category c 
		left join category_product cp on cp.category_id = c.id 
		where cp.product_id IN(5, 6, 10, 16);	


-- b) Для заданной категории получить список предложений всех товаров из этой категории и
--    ее дочерних категорий:

		select p.id, p.name from product p
		left join category_product cp on p.id = cp.product_id
		where cp.category_id = 3
		union
		select p.id, p.name from product p
		left join category_product cp on p.id = cp.product_id
		where cp.category_id in ( 
			select id from category 
			where parent_id = 3 
		);



-- c) Для заданного списка категорий получить количество предложений товаров в каждой
--    категории:

		select cp.category_id, count(cp.product_id) p_count from category_product cp
		where  cp.category_id in (2, 5, 7) group by cp.category_id


-- d) Для заданного списка категорий получить общее количество уникальных предложений
--    товара:

		select count(distinct p.id) total_summ from product p
		join category_product cp on p.id = cp.product_id
		where cp.category_id in (5, 7, 9, 10 ,11);