### Task 2

[x] List the number of 404 errors including the number of times each URL was
requested.

/api/accounts/3 => 8757
/user_password_resets => 1
/petitions => 1
/backend/subscription/update_billing => 1
/uas/request-password-reset?trk=uas-resetpass => 1

I created a hash to store the path of each line containing a 404 status and
incremented the value each time that path occured. See log_crawl.rb ln 13

[x] Average time to load each page

43ms

I'm inferring here that each entry starting with heroku/router is the client
request, which then makes one or more database queries to a seperate server,
which appears as a separate entry starting with infoapp/web.x. It looks as
though the service time is the total time it takes for the response to go out,
including any wait time from the database queries. See log_crawl ln 18 and ln 33

[ ] Which database is most frequently loaded?

[ ] Is any URL redirection taking place?

[ ] Are there any server errors? Ideas about possible causes?
