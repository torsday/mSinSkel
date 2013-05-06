# My Skeleton App
===========

## Directions

1. In github, make [a new repo](https://github.com/new)
1. ```git clone https://github.com/ctorstens/mSinSkel.git```
1. Move into the cloned directory
1. ```$ git remote set-url origin <new_repo_url>```

## Includes
- Sinatra Skeleton
- User migration
  - first_name
  - last_name
  - user_name
  - email
  - password_hash
  - timestamps
- User model
- User Authorization
  - bcrypt

## To Do
- switch session to user tokens
- further CSS refinement
- email verification through confirmation email ([ActionMailer](http://guides.rubyonrails.org/action_mailer_basics.html))
  - [Authlogic Password Reset Tutorial](https://github.com/rejeep/authlogic-password-reset-tutorial)
  - [Authlogic Activation Tutorial](https://github.com/matthooks/authlogic-activation-tutorial)
  - [StackOverflow: Email confirmation in Rails without using any existing authentication gems/plugins](http://stackoverflow.com/questions/3984977/email-confirmation-in-rails-without-using-any-existing-authentication-gems-plugi)