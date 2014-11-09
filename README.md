This was an idea for location-aware interactive APIs that didn't get off the ground.

It was hacked together quickly with the intention of showing a demo at a YC interview.

We did not get accepted.

This is just here because it was taking up a private repo slot, and there's no sense paying
to keep this private.

Getting your environment running
================================

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
    bundle exec rake db:populate
