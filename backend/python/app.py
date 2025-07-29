# app.py
# This code sets up a Flask API with endpoints for retrieving users, 
# products, orders, and order items, as well as creating new orders and order items.

from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from models import db, User, Product, Order, OrderItem

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql://root:password@localhost/ecommerce"
db.init_app(app)

@app.route("/users", methods=["GET"])
def get_users():
    users = User.query.all()
    return jsonify([user.to_dict() for user in users])

@app.route("/products", methods=["GET"])
def get_products():
    products = Product.query.all()
    return jsonify([product.to_dict() for product in products])

@app.route("/orders", methods=["GET"])
def get_orders():
    orders = Order.query.all()
    return jsonify([order.to_dict() for order in orders])

@app.route("/orders/<int:order_id>", methods=["GET"])
def get_order(order_id):
    order = Order.query.get(order_id)
    if order:
        return jsonify(order.to_dict())
    return jsonify({"error": "Order not found"})

@app.route("/orders", methods=["POST"])
def create_order():
    data = request.get_json()
    user_id = data["user_id"]
    order_date = data["order_date"]
    total = data["total"]
    order = Order(user_id=user_id, order_date=order_date, total=total)
    db.session.add(order)
    db.session.commit()
    return jsonify(order.to_dict())

@app.route("/order-items", methods=["POST"])
def create_order_item():
    data = request.get_json()
    order_id = data["order_id"]
    product_id = data["product_id"]
    quantity = data["quantity"]
    order_item = OrderItem(order_id=order_id, product_id=product_id, quantity=quantity)
    db.session.add(order_item)
    db.session.commit()
    return jsonify(order_item.to_dict())

if __name__ == "__main__":
    app.run(debug=True)


#This code sets up a Flask API with endpoints for 
#retrieving users, products, orders, and order items, as well as creating new orders and order items.