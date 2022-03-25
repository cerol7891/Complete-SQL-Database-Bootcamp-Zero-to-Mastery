/*
* DB: Store
* Table: products
* Question: Show NULL when the product is not on special (0)
*/

SELECT category, price, actor, NULLIF(special,0) as special
FROM"public"."products"
