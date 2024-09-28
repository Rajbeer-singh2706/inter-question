Difficulty Level -> 𝐌𝐞𝐝𝐢𝐮𝐦 

You are working with a large-scale web application that tracks user activities. You have a table in your data warehouse with the following schema:

user_activity
-------------
id: integer (user ID)
datetime: timestamp (time of activity)
action: string (type of action performed, can be null)

Sample of the data looks like this:

+---+-------------------+-------+------------------+
|id |datetime |action |time_diff_minutes |
+---+-------------------+-------+------------------+
|1 |2024-09-27 10:00:00|click |null |
|1 |2024-09-27 10:10:00|like |10.0 |
|1 |2024-09-27 10:15:00|null |5.0 |
|1 |2024-09-27 10:50:00|scroll |35.0 |
|1 |2024-09-27 11:40:00|comment|50.0 |
|2 |2024-09-27 09:30:00|click |null |
|2 |2024-09-27 09:45:00|like |15.0 |
|2 |2024-09-27 10:30:00|comment|45.0 |
+---+-------------------+-------+------------------+


The business defines a user session as a series of activities where the time gap between any two consecutive activities is less than or equal to 30 minutes. If there's an inactivity period of more than 30 minutes, it marks the beginning of a new session.


Your need to write a Pyspark code to compute the 𝐚𝐯𝐞𝐫𝐚𝐠𝐞 𝐬𝐞𝐬𝐬𝐢𝐨𝐧 𝐝𝐮𝐫𝐚𝐭𝐢𝐨𝐧 𝐟𝐨𝐫 𝐞𝐚𝐜𝐡 𝐮𝐬𝐞𝐫 ?

Output :

+---+------------------------------+
|id |avg_session_duration_minutes |
+---+------------------------------+
|1 |5.0 |
|2 |7.5 |
+---+------------------------------+