# SECOND HAND GAME STORE
## The problem
Have you ever traded your old games back to the major game stores such as EB Games and JB Hi-Fi? I have, and I remember getting something like 1 dollar store credit for a game that I really enjoyed, and that is the problem this app is trying to solve, the low trade in value that you get back for games you paid 60 dollars or more for. This app aims to provide a selling/buying platform only for video games so you don't need to go to: 
* Gumtree: where games are in the same category with music and books
* Facebook Marketplace: where games are in the same category with toys

Hopefully, you can sell your old games for a higher price and buy second hand games for a cheaper price than you would have been offered by the major stores.

Here is the link to [Second Hand Game Store](https://shgame.herokuapp.com/) and here is the link to my [GitHub](https://github.com/noe13hsu/T2A2---Marketplace) repo.

## Third party services used
### Gems
* *[devise](https://github.com/heartcombo/devise)* - provides user authentication through its Validatable module, the default is email and password but can be customised. It also has a Registerable module that handles user sign up, edit and destroy user accounts. In the case where uses forget their password, the Recoverable module sends reset password instructions to users. All the relevant views are also provided.

* *[rolify](https://github.com/heartcombo/devise)* - a roles library that also provides methods such as add_role to allow news roles to be created and has_role? which can be used to allow/limit access with the pundit gem. This app has two roles, :genuine and :admin. Everyone after registering for a new account will be assigned the :genuine role which allows them to access all the user and product related CRUD features. If uses lose the :genuine role, they will not be allowed to created new products. The :admin role is for admin only which gives access to the admin dashboard.

* *[pundit](https://github.com/varvet/pundit)* - provides user authorisation through the query methods inside the policy classes. These query methods map to the actions of a particular controller, and if a method returns true, access to the corresponding action is allowed. This app has only has a product policy to limit non-genuine users from creating new products.

* *[cloudinary](https://cloudinary.com/)* - a cloud-based image and video management service that allows users to upload, store, manipulate and deliver their images and videos to their applications and websites. This app uses it to allow users to upload a game cover of their listed games.

* *[activestorage-cloudinary-service](https://github.com/0sc/activestorage-cloudinary-service)* - which facilitate uploading images to cloudinary.

* *[chartkick](https://chartkick.com/)* - creates charts with one line of ruby code. This app uses it to create a line chart in admin dashboard to show new user registration each day.

* *[groupdate](https://github.com/ankane/groupdate)* - used with chartkick to group user registration data by day.

* *[bootstrap](https://getbootstrap.com/)* - a CSS framework for front end development. This app uses the nav bar template and pre-defined classes it provides.

* *[swiper demo](https://swiperjs.com/demos#space-between)* - provides swiper code which this app uses to display the games.

## Models
* User
* Product
* Cart
* CartItem
* Order
* OrderItem