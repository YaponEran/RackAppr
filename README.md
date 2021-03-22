# Rack app
=======
true request
--------------
* curl --url "http://localhost:9292/time?format=year%2Cmonth%2Cday%2Chour" -i
wrong request
--------------
* curl --url "http://localhost:9292/date?format=year%2Cmonth%2Cday%2Chour" -i