= Getting your environment running

if you haven't created a gemset for development yet, then:

    rvm --create use 1.9.2@aether

else

    rvm use 1.9.2@aether

Once you're in the right ruby environment, you need to install rails, if you haven't already done so:

    gem install rails --version 3.0.9

Now you're ready to start developing.

First, install the project's dependencies:
 
    bundle install --binstubs

Then set up the database

    bundle exec rake db:migrate
    bundle exec rake db:test:prepare
