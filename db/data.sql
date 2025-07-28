-- Insert sample data
INSERT INTO users (username, email, password, role) VALUES
  ('john', 'john@example.com', 'password123', 'customer'),
  ('jane', 'jane@example.com', 'password123', 'customer'),
  ('admin', 'admin@example.com', 'password123', 'admin');

INSERT INTO categories (name, description) VALUES
  ('Electronics', 'Electronic devices'),
  ('Fashion', 'Clothing and accessories'),
  ('Home', 'Home goods and furniture');

INSERT INTO products (name, description, price, category_id) VALUES
  ('iPhone', 'Apple iPhone', 999.99, 1),
  ('Samsung TV', 'Samsung 4K TV', 1299.99, 1),
  ('Nike Shoes', 'Nike running shoes', 99.99, 2),
  ('Levi\'s Jeans', 'Levi\'s denim jeans', 79.99, 2),
  ('IKEA Chair', 'IKEA office chair', 49.99, 3);

INSERT INTO orders (user_id, order_date, total) VALUES
  (1, '2022-01-01', 999.99),
  (1, '2022-01-15', 1299.99),
  (2, '2022-02-01', 99.99);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
  (1, 1, 1),
  (2, 2, 1),
  (3, 3, 2);