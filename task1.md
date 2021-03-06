# Task 1

- [x] List the number of 404 errors including the number of times each URL was
requested.

    URL | Number of requests
    ----|-------------------
    /api/accounts/3 | 8757
    /user_password_resets | 1
    /petitions | 1
    /backend/subscription/update_billing | 1
    /uas/request-password-reset?trk=uas-resetpass | 1

    I created a hash to store the path of each line containing a 404 status and
    incremented the value each time that path occured. See [here](log_crawl.rb#L13)

- [x] Average time to load each page

    43ms

    I'm inferring here that each entry starting with heroku/router is the client
    request, which then makes one or more database queries to a seperate server,
    which appears as a separate entry starting with infoapp/web.x. It looks as
    though the service time is the total time it takes for the response to go out,
    including any wait time from the database queries. See [here](log_crawl.rb#L13) and [here](log_crawl.rb#L37) 

- [x] Which database is most frequently loaded?

    delayed_jobs

    See [here](log_crawl.rb#L22) and [here](log_crawl.rb#L41) 

- [x] Is any URL redirection taking place?

    Yes

    There are multiple 300 level status codes, mostly originating from the demo
    controller and backend namespaced controllers

- [x] Are there any server errors? Ideas about possible causes?

    Yes

    There are a handful of entries with 500 level status codes. The only ones with
    particularly helpful error messages are the first, which says the request was
    interrupted, and two others that had missing ERB templates.
