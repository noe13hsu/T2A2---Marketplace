# SECOND HAND GAME STORE
## The problem
Have you ever traded your old games back to the major game stores, possibily the store you first bought the games from such as EB Games and JB Hi-Fi? I have, and I remember getting something like 1 dollar store credit for a game that I really enjoyed, and that is the problem this app is trying to solve, the low trade in value that you get back for games you paid 60 dollars or more for. This app aims to provide a selling/buying platform only for video games so you don't need to go to: 
* Gumtree: where games are in the same category with music and books
* Facebook Marketplace: where games are in the same category with toys

Hopefully, you can sell your old games for a higher price and buy second hand games for a cheaper price than you would have been offered by the major stores.

Here is the link to my [Second Hand Game Store](https://shgame.herokuapp.com/) and here is the link to the [GitHub](https://github.com/noe13hsu/T2A2---Marketplace) repo.

## Features
* User sign up/log in
* users can create, view, update and delete games
* users can add games to cart
* users can place order (payment not included) and view order history
* admin users can access the admin dashboard

## Third party services used
### Gems
* *[devise](https://github.com/heartcombo/devise)* - provides user authentication through its Validatable module, the default is email and password but can be customised. It also has a Registerable module that handles user sign up, edit and destroy user accounts. In the case where uses forget their password, the Recoverable module sends reset password instructions to users. All the relevant views are also provided.

* *[rolify](https://github.com/heartcombo/devise)* - a roles library that also provides methods such as add_role to allow news roles to be created and has_role? which can be used to allow/limit access with the pundit gem. This app has two roles, :genuine and :admin. Everyone after registering for a new account will be assigned the :genuine role which allows them to access all the user and product related CRUD features. If uses lose the :genuine role, they will not be allowed to created new products. The :admin role is for admin only which gives access to the admin dashboard.

* *[pundit](https://github.com/varvet/pundit)* - provides user authorisation through the query methods inside the policy classes. These query methods map to the actions of a particular controller, and if a method returns true, access to the corresponding action is allowed. This app has only has a product policy to limit non-genuine users from creating new products.

* *[cloudinary](https://cloudinary.com/)* - a cloud-based image and video management service that allows users to upload, store, manipulate and deliver their images and videos to their applications and websites. This app uses it to allow users to upload a game cover of their listed games.

* *[activestorage-cloudinary-service](https://github.com/0sc/activestorage-cloudinary-service)* - which facilitate uploading images to cloudinary.

* *[chartkick](https://chartkick.com/)* - creates charts with one line of ruby code. This app uses it to create a line chart in admin dashboard to show new user registration each day.

* *[groupdate](https://github.com/ankane/groupdate)* - used with chartkick to group user registration data by day.

### Framework
* *[bootstrap](https://getbootstrap.com/)* - a CSS framework for front end development. This app uses the nav bar template and pre-defined classes it provides.

* *[swiper demo](https://swiperjs.com/demos#space-between)* - provides swiper code which this app uses to display the games.

## Model relationships
This app is built based on the models below:
* *User*
    * each user can have zero or many products. 
    * each user has one cart.
    * each user can have zero or many orders.
* *Product*
    * each product belongs to a user, and a product can not be created without being linked to a user. Products that belong to a particular user will be destroyed when the user is destroyed.
* *Cart*
    * a cart belongs to a user, a cart is destroyed when its owner is destroyed. The app has an after_create method in the User model to create a cart for users after they sign up.
    * a cart has zero or many products through cart items.
* *CartItem*
    * each cart item belongs to a cart, and cart items can not be created without being linked to a cart, and are destroyed when the user that owns the cart is destroyed.
* *Order*
    * each order belongs to a user. An order can not be created wihtout being linked to a user and orders are destroyed when the owner is destroyed.
    * an order can have 1 or many products through order items.
* *OrderItem*
    * each order item belongs to a order and a order item can not be created without being linked to an order.

## Database relations
* Each user can be associated with many products so there is a one-to-many relationship between the User entity and Product entity, and each product is associated with its user through the foreign key of user id in the Product table. This user id is the primary key in the User table.
* Each user can be associated with one cart through the foreign key of user id inside the Cart table, so the relationship is one-to-one.
* Each user can be associated with many orders through the foreign key of user id inside the Order table, so there is a one-to-many relationship.
* Each cart can contain more than one product and each product can be included in more than one cart so there is a many-to-many relationship between the Cart and Product entity, and this is implemented by having a linking table named CartItem (not the best naming convention) between the Cart and Product table. This CartItem table links the Cart and Product table by having fields (as foreign keys) which are the primary key of the Product and Cart table.
* Each order can have more than one product and each product can be included in more than one order so there is a many-to-many relationship between the Order and Product entity. This is implemented by having a linking table named OrderItem between the Order and Product table which links the Order and Product table by having fields (as foreign keys) which are the primary key of the Order and Product table.

    