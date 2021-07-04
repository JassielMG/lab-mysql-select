SELECT authors.au_id as "Author ID", authors.au_lname as 'Last name',
authors.au_fname as 'First name', titles.title as 'Title', publishers.pub_name as 'Publisher'
FROM publications.authors
INNER JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN publications.titles ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_id ASC;
**************************************************************************************************
SELECT authors.au_id as "Author ID", authors.au_lname as 'Last name',
authors.au_fname as 'First name', publishers.pub_name as 'Publisher',COUNT(titles.title) as 'Title count'
FROM publications.authors
INNER JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN publications.titles ON titleauthor.title_id = titles.title_id
INNER JOIN publications.publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id,authors.au_lname
****************************************************************************************************************
SELECT authors.au_id as "Author ID", authors.au_lname as 'Last name',
authors.au_fname as 'First name',sales.qty as 'Title count'
FROM publications.authors
INNER JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN publications.titles ON titleauthor.title_id = titles.title_id
INNER JOIN publications.sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sales.qty DESC
LIMIT 3
***********************************************************************************
SELECT authors.au_id as "Author ID", authors.au_lname as 'Last name',
authors.au_fname as 'First name',COALESCE(sales.qty,0) as 'Title count'
FROM publications.authors
LEFT JOIN publications.titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN publications.titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publications.sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY sales.qty DESC



