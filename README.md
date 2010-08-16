# About RCLI
RCLI is an AJAX Ruby Command Line (interpreter) based on CLI2 (as used by UNIXKCD (<http://uni.xkcd.com/>)) and Sinatra.

RCLI was originally created by Kevin Gisi (<http://www.kevingisi.com>) with modifications and additions by myself.

The purpose of RCLI is simply to allow for a simple testing environment to try out scripts and snippets of code directly in the Ruby/Rack runtime of your choice. I use it personally for both of the below, but it should work as a standalone Sinatra app just about anywhere!

## Heroku Branch
You can check out the Heroku branch to get a version which is immediately compatible with Heroku's Bamboo stack. Instructions for use are available on that branch (<http://github.com/techkid/RCLI/tree/heroku>).

## App Engine Branch
The 'GAE' branch is nearly ready for use on Google's App Engine, but is missing a few crucial files, which can be added in using the jruby-appengine tools
(<http://code.google.com/p/appengine-jruby/>). Further instructions can be found on that branch.