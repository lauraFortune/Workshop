# Workshop 

Full CRUD ecommerce web application. 
The main intention for the application was to provide a platform for artists and makers of hand-made items to sell their goods online. 

<br>

## Built With

- [Ruby on Rails](https://rubyonrails.org/)

#### Gems:
- For Authentication and Authorisation - [Devise 4.6.0](https://rubygems.org/gems/devise/versions/4.6.0) 
- Local Database - [Sqlite3 1.3.6](https://rubygems.org/gems/sqlite3/versions/1.3.6s)

#### Languages:
- [Ruby '2.6.6'](https://www.ruby-lang.org/en/news/2020/03/31/ruby-2-6-6-released), &nbsp; [Javascript](https://developer.mozilla.org/en-US/docs/Web/JavaScript), &nbsp; [jQuery](https://jquery.com), &nbsp; [HTML](https://developer.mozilla.org/en-US/docs/Learn/HTML), &nbsp; [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS)

#### Development Environment:
https://aws.amazon.com/cloud9/


## Demo 

- Create an account, Fill Cart, Checkout & PayPal

[![memberAccount](https://user-images.githubusercontent.com/48602973/81713522-e276bd00-946d-11ea-9674-35f281698ba3.png)](https://www.youtube.com/watch?v=oqia1FRpQbI)

- Admin - Full Crud

[![admin](https://user-images.githubusercontent.com/48602973/81724587-86676500-947c-11ea-9ad4-e9b8c499daec.png)](https://youtu.be/cVL7Owu6dW8)



## Setting Up


### AWS Cloud9
Create a free AWS Account  - https://portal.aws.amazon.com/billing/signup
   - Sign in to your AWS Management Console and navigate to Cloud9 inside Developer Tools.
   - Select 'Create Environment' and give your new environment a name and description.
   - Select Next Step - Keep doing so untill you reach 'Create Environment'.
   - Select 'Create Envionment'. Cloud9 will load up your environment and you are ready to start developing.


## Running the application on AWS Cloud9

1. Clone project 

   ```bash
   git clone https://github.com/lauraFortune/Workshop.git
   ```
2. Upload the project folder to your cloud9 developemnt environment

3. Change directory
   ```bash
   cd Workshop
   ```
4. Check your Ruby version
   ```bash
   ruby -v
   ```
5. If ruby '2.6.6' is not installed run
   ```bash
   rvm install "ruby-2.6.6"
   ```
6. Install dependencies
   ```bash
   bundle install
   ```
7. Migrate the database
   ```bash
   rake db:migrate
   ```
8. Start the rails server
   ```bash
   rails server
   ```
9. Preview the running application.

10. Choose 'Create Account' and sign up for an account with 'Workshop'.


### Create system Admin for authorisation and application privelages

1. Inside the terminal
   ```bash
   rails console
   ```
2. Update the User table. Set the default 'False' user admin status to 'True'.
   ```bash
   User.where(:email => "<your Workshop email here>").update(:admin => true)
   ```
   
   
### PayPal

If you want to set up your own paypal credentials for testing....
   1. Replace 'insert paypal buyer account here' with your paypal buyer account in the following files: 
      - line 52 of 'views/cart/createOrder.html.erb'
      - line 66 of 'views/orders/show.html.erb'
   2. Replace 'insert site url here' with your applications URL in the following files:
      - line 57 of 'views/cart/createOrder.html.erb'
      - line 71 of 'views/orders/show.html.erb'

