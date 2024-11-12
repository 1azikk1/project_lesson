DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS comments;


CREATE TABLE IF NOT EXISTS categories(
	id SERIAL PRIMARY KEY,
	name VARCHAR(1000)
);

CREATE TABLE IF NOT EXISTS products(
	id SERIAL PRIMARY KEY,
	name VARCHAR(1000),
	description VARCHAR(1000),
	price INTEGER,
	quantity INTEGER,
	added DATE,
	category_id INTEGER REFERENCES categories(id)
);

CREATE TABLE IF NOT EXISTS comments(
	comment_text VARCHAR(1000),
	user_name VARCHAR(20),
	product_id INTEGER REFERENCES products(id),
	created DATE DEFAULT CURRENT_DATE
);


INSERT INTO categories(name) VALUES
('Smartphone'),
('Laptop'),
('PC'),
('Keyboard');


INSERT INTO products(name, description, price, quantity, added, category_id) VALUES
('Samsung Galaxy S24 ULTRA', 'Number 1', 2000, 50, '2024.11.12', 1),
('Iphone 16 PRO MAX BLACK TITANIUM', 'Just an Iphone worth 2000 $', 1999, 30, '2024.11.12', 1),
('ASUS ROG STRIX G16', 'Offering highest performance', 10000, 100, '2024.11.12', 2),
('ASUS ROG STRIX ACER VICTUS MAC', 'Gaming PC', 15000, 10, '2024.11.12', 3),
('RTX 5090 2007', 'Gaming PC', 20000, 20, '2024.11.12', 3),
('Fingerworks TouchStream LP ZeroForce', 'King of the keyboards', 1500, 500, '2024.11.12', 4);


INSERT INTO comments(comment_text, user_name, product_id) VALUES
('Zor telefon ekan', '1azikk1', 1),
('Narxi qimmat ekan lekin yaxshi telefon!', 'its_mubiw', 2),
('Bomba komp ekan!', 'toxirtoxirov', 3),
('Narxi slishkom qimmat!', 'sobirsobirov', 4),
('Boloradi!', 'Mr_PERFECT', 5),
('Ovozi yoqti!', 'alivaliyev', 6);


SELECT
    categories.name AS category_name,
    products.name AS product_name,
    products.price,
    products.added,
    comments.comment_text,
    comments.user_name,
    comments.created
FROM
    products
JOIN
    categories ON products.category_id = categories.id
LEFT JOIN
    comments ON products.id = comments.product_id;











