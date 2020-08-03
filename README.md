###This is adopted from https://medium.com/@billy.sf.cheng/a-rails-6-application-part-1-api-1ee5ccf7ed01

##SETUP

run in console:
$ heroku config:set BUILDPACK_URL=https://github.com/ddollar/heroku-buildpack-multi.git
$ touch .buildpacks
$ echo "https://github.com/heroku/heroku-buildpack-ruby" >> .buildpacks
$ echo "https://github.com/stomita/heroku-buildpack-phantomjs" >> .buildpacks
$ heroku config:set PATH="/usr/local/bin:/usr/bin:/bin:/app/vendor/phantomjs/bin"
$ heroku config:set LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:/lib:/app/vendor/phantomjs/lib

##Example curl:

#Create user with rails console
User.create(email: 'john.doe@example.com', password: 'test123')

# curl to authenticate, retrieve an authorization token
curl -X POST http://localhost:3000/api/v1/authenticate \
-H 'content-type: multipart/form-data' \
-F 'email=john.doe@example.com' -F 'password=test123'

-> {"auth_token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHBpcnkiOjE1OTY1Nzc1MTJ9.r7AKv-BycYgeup7gBKiBmQgABzLLHYjF5KM8AwkZoyY"}

# curl using the auth_token to get some data
curl http://localhost:3000/api/v1/yahoo_data -H 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHBpcnkiOjE1OTY1Nzc1MTJ9.r7AKv-BycYgeup7gBKiBmQgABzLLHYjF5KM8AwkZoyY'

-> {"results":{"yahoo":["data","data"],"my_yahoo":["data","data"]}}

# get yahoo authorization code (using watir to retrieve)

curl http://localhost:3000/api/v1/yahoo_data/get_auth_code -H 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHBpcnkiOjE1OTY1Nzc1MTJ9.r7AKv-BycYgeup7gBKiBmQgABzLLHYjF5KM8AwkZoyY'