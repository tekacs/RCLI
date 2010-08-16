# About RCLI
RCLI is an AJAX Ruby Command Line (interpreter) based on CLI2 (as used by UNIXKCD (<http://uni.xkcd.com/>)).

RCLI was originally created by Kevin Gisi (<http://www.kevingisi.com>) with modifications and additions by myself.

## Heroku Branch
This branch is ready-made to push up to Heroku.

For most use:

	git clone git@github.com:techkid/RCLI.git
	heroku create $APPNAME
	git remote add heroku git@heroku.com:$APPNAME.git
	git push heroku heroku:master

will suffice.