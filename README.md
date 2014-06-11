#myTurkDB 

This is a script written in Python (2.7) that is used to scrape and store data contained within your Amazon Mechanical Turk account for use in data aggregation, review, and projection.  It will log into your mTurk account and scrape a set of data related to the HITs you have completed, as well as some information related to your account as a whole.  This is all sent and stored into a MySQL database that will serve as a robust and speedy solution to access the data. 

#The data pulled into MySQL contains:
##•	HIT data
        o	HIT ID
        o	Requester ID
        o	Requester Name
        o	HIT Title
        o	Reward Amount
        o	HIT Stats (Pending, Approved – Pending Payment, Paid, Rejected)
        o	Feedback
##•	Worker data
        o	Worker ID
        o	Worker Name
        o	Bonus Rewards
        o	Transfer Balance

You may use the data in any way you wish, but an example would be connecting Microsoft Excel to the database to create a dashboard with various charts and totals so you can get a quick look at your work status.
