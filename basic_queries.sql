--1


select * from fb_user

SELECT u1.username AS User1, u2.username AS User2
FROM fb_user u1 JOIN fb_user u2
ON u1.blocked_users = u2.blocked_users




--2

select * from groups
select * from group_admin


select g1.grp_name, g1.members_count, g2.admin_role
from groups g1 inner join group_admin g2
on g1.admin_id = g2.admin_id



--3

select count(username), current_city
from fb_user
group by current_city



--4

select * from fb_user



SELECT gender, COUNT(Blocked_users) AS num_blocked_users
FROM fb_user
GROUP BY gender
HAVING COUNT(Blocked_users) > 1;




--5 who has same native of the person who is doing business

select * from fb_user

select username, work, hometown from fb_user
where hometown = (select hometown from fb_user where work='business')




--6 

select * from fb_user




select id, username,
count(blocked_users) OVER (partition by hometown) bu
from fb_user


--7
select * from event_notification


SELECT *
FROM event_notification
WHERE notification_type LIKE '%Alert%';





select * from fb_user
select count(username), current_city
from fb_user
group by current_city
---we are counting number of people residing in particular city and using facebook we can 
----conclude that 


SELECT gender, COUNT(Blocked_users) AS num_blocked_users
FROM fb_user
GROUP BY gender
HAVING COUNT(Blocked_users) > 1;
-----this can someup with the solution that males are getting blocked due to some reason
-----so we can rectify it with increasing the security 


SELECT 
    ROUND((COUNT(CASE WHEN Email IS NOT NULL THEN 1 END) * 100.0) / COUNT(*), 2) AS Percentage_WithEmail
FROM fb_user;

-------- This query provides insights into the 
----completeness of user profiles in terms of email information but in our table creation
----we have got 100percent if it was not 100 percent than we can conclude to the solution 
-----for our business that we need to send continuos notification to complete the profile so that it can help our business to 
----not went into the fraud 


SELECT 
    AVG(report_count) AS Average_Reports_Per_User
FROM (
    SELECT 
        COUNT(*) AS report_count
    FROM 
        report
    GROUP BY 
        reporter_id
) AS report_counts;
-----this can conclude that as our profile is complete so we not getting more fraud 
-----this is the avg reports per user  on the baisis of fraud

