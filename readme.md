Explorer Mode

##How many users are there?

`User.all.count`
50

#____________________
##What are the 5 most expensive items?

`Item.select(:title).order(:price).last(5)`

Ergonomic Steel Car
Sleek Wooden Hat
Awesome Granite Pants
Small Wooden Computer
Small Cotton Gloves

#____________________
##What's the cheapest book?

`Item.select(:title).where("category like 'Books'").order(:price).first`

Ergonomic Granite Chair


#____________________
##Who lives at "6439 Zetta Hills, Willmouth, WY"? Do they have another address?

`User.joins("JOIN addresses ON addresses.user_id = users.id").where("street = '6439 Zetta Hills'")`

Corrine Little

`Address.joins("JOIN users ON users.id = addresses.user_id").where("users.id = 40")`
Yes. 54369 Wolff Forges, Lake Byron, CA 31587


#____________________
##Correct Virginie Mitchell's address to "New York, NY, 10108".
`User.find_by(first_name: 'Virginie')`

`Address.find_by(user_id:  39).update(city: 'New York', state: 'NY', zip: '10108')`

#____________________
##How much would it cost to buy one of each tool?

`Item.where("category like 'tools'").sum("price")`

7383

#____________________
##How many total items did we sell?

`Order.sum("quantity")`

2125


#____________________
##How much was spent on books?
```
Item.joins("JOIN orders ON items.id = orders.item_id").where("items.category LIKE 'books'").sum("items.price * orders.quantity")
```
420566

#____________________
##Simulate buying an item by inserting a User for yourself and an Order for that User.
```
User.find_or_create_by(first_name: 'Matt', last_name: 'Rice', email: 'mattrice12@outlook.com')
```
^Creates user

```
Order.find_or_create_by(user_id: 51, item_id: 55, quantity: 200)
```
^Creates order

```
User.select(:id).where(email:  'mattrice12@outlook.com')
```
```
Order.where(user_id: 51)
```
^Views order

