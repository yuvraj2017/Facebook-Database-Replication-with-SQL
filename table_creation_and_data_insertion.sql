CREATE TABLE fb_user (
  id INT PRIMARY KEY,
  username VARCHAR(30),
  Phone_number VARCHAR(30),
  Email VARCHAR(30),
  Bio VARCHAR(100),
  Gender VARCHAR(30),
  DOB DATE,
  Work VARCHAR(30),
  Education VARCHAR(30),
  Hometown VARCHAR(30),
  Current_city VARCHAR(30),
  Blocked_users VARCHAR(30),
  language VARCHAR(30)
)

drop table fb_user
select * from fb_user

INSERT INTO fb_user (id, username, Phone_number, Email, Bio, Gender, DOB, Work, Education, Hometown, Current_city, Blocked_users, language)
VALUES (1, 'yash', '9664899195', 'yash@gmail.com', 'hello', 'M', '1999-09-17', 'datascience', 'b.tech', 'keshod', 'banglore', '5', 'english');

INSERT INTO fb_user (id, username, Phone_number, Email, Bio, Gender, DOB, Work, Education, Hometown, Current_city, Blocked_users, language)
VALUES (2, 'yuvraj', '1111111111', 'yuvraj@gmail.com', 'hiii', 'M', '1999-09-17', 'business', 'b.tech', 'keshod', 'banglore', '5', 'english'),
(3, 'yasira', '9665634195', 'yasira@gmail.com', 'qwerty', 'F', '2000-09-17', 'datascience', 'b.com', 'bhilai', 'banglore', '1', 'english'),
(4, 'anmol', '96967849195', 'anmol@gmail.com', 'asdfdggh', 'M', '1996-05-17', 'job', 'b.civil', 'raipur', 'banglore', '3', 'english'),
(5, 'naitik', '9664384195', 'naitik@gmail.com', 'hestgrsgfdsllo', 'M', '2000-09-30', 'job', 'b.e', 'keshod', 'ahmedabad', '4', 'english');


----------------------------------------------------------------------------------------------
2
---


CREATE TABLE post (
  post_id INT PRIMARY KEY,
  user_id INT,
  content TEXT,
  media VARCHAR(30),
  loc VARCHAR(30),
  post_time VARCHAR(30),
  privacy_setting VARCHAR(30),
  likes_count INT,
  comments_count INT,
  shares_count INT,
  FOREIGN KEY (user_id) REFERENCES fb_user(id)
);


drop table post

INSERT INTO post (post_id, user_id, content, media, loc, post_time, privacy_setting, likes_count, comments_count, shares_count)
VALUES
(1, 1, 'First post content', 'image1', 'ahmedabad ', '2024-04-18 08:00:00', 'public', 10, 5, 2),
(2, 2, 'Second post content', 'image2', 'delhi', '2024-04-18 09:00:00', 'friends', 15, 7, 3),
(3, 1, 'Third post content', 'video1', 'mumbai', '2024-04-18 10:00:00', 'private', 20, 10, 5),
(4, 4, 'Fourth post content', 'image4', 'banglore', '2024-04-18 11:00:00', 'public', 25, 12, 6),
(5, 5, 'Fifth post content', 'image5', 'rajkot', '2024-04-18 12:00:00', 'friends', 30, 15, 8);



-------------------------------------------------------------------------------------------------------------------------------
3
---


CREATE TABLE comment (
  comment_id INT PRIMARY KEY,
  post_id INT,
  user_id INT,
  content TEXT,
  comment_time VARCHAR(50),
  likes_count INT,
  FOREIGN KEY (post_id) REFERENCES post(post_id),
  FOREIGN KEY (user_id) REFERENCES fb_user(id)
)

drop table comment
select * from comment

INSERT INTO comment (comment_id, post_id, user_id, content, comment_time, likes_count)
VALUES 
(1, 1, 2, 'Great post!', '2024-04-18 08:15:00', 5),
(2, 1, 3, 'Nice!', '2024-04-18 08:20:00', 3),
(3, 2, 1, 'Interesting', '2024-04-18 09:30:00', 8),
(4, 3, 4, 'Awesome!', '2024-04-18 10:45:00', 10),
(5, 2, 5, 'just looking like a wow!', '2024-04-18 09:35:00', 6);





-------------------------------------------------------------------------------------------------------------------------------
4
CREATE TABLE likes (
  LikeID INT PRIMARY KEY,
  user_id INT,
  post_id INT,
  like_time varchar(50),
  FOREIGN KEY (user_id) REFERENCES fb_user(id),
  FOREIGN KEY (post_id) REFERENCES post(post_id)
);

drop table likes

INSERT INTO likes (LikeID, user_id, post_id, like_time)
VALUES 
(1, 1, 2, '2024-04-18 08:15:00'),
(2, 1, 3, '2024-04-18 08:20:00'),
(3, 2, 1, '2024-04-18 09:30:00'),
(4, 3, 4, '2024-04-18 10:45:00'),
(5, 2, 5, '2024-04-18 09:35:00');



----------------------------------------------------------------------------------------------------------------------------------
5
CREATE TABLE friend (
  f_id INT PRIMARY KEY,
  f1_id INT,
  f2_id INT,
  f_status VARCHAR(30),
  f_date VARCHAR(30),
  FOREIGN KEY (f1_id) REFERENCES fb_user(id),
  FOREIGN KEY (f2_id) REFERENCES fb_user(id)
);


INSERT INTO friend (f_id, f1_id, f2_id, f_status, f_date)
VALUES 
(1, 1, 2, 'Friends', '2024-04-18'),
(2, 3, 1, 'Pending', '2024-04-19'),
(3, 2, 4, 'Accepted', '2024-04-20'),
(4, 5, 1, 'Blocked', '2024-04-21'),
(5, 3, 5, 'Friends', '2024-04-22');



----------------------------------------------------------------------------------------------------------------------------------
6
CREATE TABLE message (
  msg_id INT PRIMARY KEY,
  sender_id INT,
  receiver_id INT,
  content TEXT,
  Timestamp VARCHAR(30),
  Status VARCHAR(30),
  FOREIGN KEY (sender_id) REFERENCES fb_user(id),
  FOREIGN KEY (receiver_id) REFERENCES fb_user(id)
);



INSERT INTO message (msg_id, sender_id, receiver_id, content, Timestamp, Status)
VALUES 
(1, 1, 2, 'Hello, how are you?', '2024-04-18 08:30:00', 'seen'),
(2, 2, 1, 'Im doing well, thank you!', '2024-04-18 08:35:00', 'delivered'),
(3, 3, 1, 'Hey there!', '2024-04-18 09:00:00', 'seen'),
(4, 1, 3, 'Hi! Whats up?', '2024-04-18 09:15:00', 'delivered'),
(5, 4, 1, 'Hello! How have you been?', '2024-04-18 10:00:00', 'delivered');

----------------------------------------------------------------------------------------------------------------------------------
7

CREATE TABLE chat (
  chat_id INT PRIMARY KEY,
  uid_1 INT,
  uid_2 INT,
  last_msg_id INT,
  FOREIGN KEY (uid_1) REFERENCES fb_user(id),
  FOREIGN KEY (uid_2) REFERENCES fb_user(id)
);


INSERT INTO chat (chat_id, uid_1, uid_2, last_msg_id)
VALUES 
(1, 1, 2, 1),
(2, 2, 3, 3),
(3, 4, 1, 5),
(4, 3, 5, 3),
(5, 5, 2, 2);

----------------------------------------------------------------------------------------------------------------------------------
8
CREATE TABLE groups (
  grp_id INT PRIMARY KEY,
  grp_name VARCHAR(30),
  admin_id INT,
  Creation_date VARCHAR(50),
  members_count INT,
  description VARCHAR(50),
  FOREIGN KEY (admin_id) REFERENCES fb_user(id)
);


drop table groups

INSERT INTO groups (grp_id, grp_name, admin_id, Creation_date, members_count, description)
VALUES 
(1, 'the_friendds forever', 1, '2024-04-18', 10, 'for friends.'),
(2, 'the_fun', 2, '2024-04-19', 15, 'just for fun.'),
(3, 'praxisjan24', 3, '2024-04-20', 20, 'classroom unofficial'),
(4, 'Photography', 4, '2024-04-21', 12, 'for phootographers'),
(5, 'gym_squad', 5, '2024-04-22', 8, 'for fitness freaks.');


----------------------------------------------------------------------------------------------------------------------------------
9

CREATE TABLE group_member (
  grp_id INT,
  user_id INT,
  join_date varchar(30),
  PRIMARY KEY (grp_id, user_id),
  FOREIGN KEY (grp_id) REFERENCES groups(grp_id),
  FOREIGN KEY (user_id) REFERENCES fb_user(id)
);



INSERT INTO group_member (grp_id, user_id, join_date)
VALUES 
(1, 1, '2024-04-18'),
(1, 2, '2024-04-18'),
(1, 3, '2024-04-18'),
(2, 2, '2024-04-19'),
(2, 3, '2024-04-19'),
(2, 4, '2024-04-19'),
(3, 1, '2024-04-20'),
(3, 2, '2024-04-20'),
(3, 3, '2024-04-20'),
(4, 4, '2024-04-21'),
(4, 5, '2024-04-21'),
(5, 1, '2024-04-22'),
(5, 5, '2024-04-22');

----------------------------------------------------------------------------------------------------------------------------------
10

CREATE TABLE group_message (
  grp_msg_id INT PRIMARY KEY,
  grp_id INT,
  user_id INT,
  msg_content TEXT,
  Timestamp varchar(50),
  FOREIGN KEY (grp_id) REFERENCES groups(grp_id),
  FOREIGN KEY (user_id) REFERENCES fb_user(id)
);

drop table group_message


INSERT INTO group_message (grp_msg_id, grp_id, user_id, msg_content, Timestamp)
VALUES 
(1, 1, 1, 'Hello!', '2024-04-18 08:00:00'),
(2, 1, 2, 'Hi!', '2024-04-18 08:05:00'),
(3, 2, 3, 'Welcome to group', '2024-04-18 09:00:00'),
(4, 2, 4, 'Lets have fun', '2024-04-18 09:05:00'),
(5, 3, 5, 'Good morning!', '2024-04-18 10:00:00');


----------------------------------------------------------------------------------------------------------------------------------
11

CREATE TABLE notification (
  n_id INT PRIMARY KEY,
  user_id INT,
  n_type VARCHAR(50),
  n_content TEXT,
  Timestamp VARCHAR(50),
  n_status VARCHAR(50),
  FOREIGN KEY (user_id) REFERENCES fb_user(id)
);


drop table notification


INSERT INTO notification (n_id, user_id, n_type, n_content, Timestamp, n_status)
VALUES 
(1, 1, 'Event', 'event invitation.', '2024-04-18 08:00:00', 'read'),
(2, 2, 'Page', 'New post on your favorite page.', '2024-04-18 09:00:00', 'unread'),
(3, 3, 'Advertisement', 'Special offer', '2024-04-18 10:00:00', 'read'),
(4, 4, 'Group', 'someone added you.', '2024-04-18 11:00:00', 'unread'),
(5, 5, 'Event', 'Reminder: 1 hour remaining.', '2024-04-18 12:00:00', 'unread');



----------------------------------------------------------------------------------------------------------------------------------
12
----
CREATE TABLE block (
  block_id INT PRIMARY KEY,
  blocker_id INT,
  blocked_user_id INT,
  block_date VARCHAR(30),
  FOREIGN KEY (blocker_id) REFERENCES fb_user(id),
  FOREIGN KEY (blocked_user_id) REFERENCES fb_user(id)
);


INSERT INTO block (block_id, blocker_id, blocked_user_id, block_date)
VALUES 
(1, 1, 2, '2024-04-18 08:00:00'),
(2, 2, 3, '2024-04-18 09:00:00'),
(3, 3, 4, '2024-04-18 10:00:00'),
(4, 4, 5, '2024-04-18 11:00:00'),
(5, 5, 1, '2024-04-18 12:00:00');


----------------------------------------------------------------------------------------------------------------------------------
13
----
CREATE TABLE report (
  report_id INT PRIMARY KEY,
  reporter_id INT,
  reported_user_id INT,
  report_reason VARCHAR(30),
  Timestamp VARCHAR(50),
  FOREIGN KEY (reporter_id) REFERENCES fb_user(id),
  FOREIGN KEY (reported_user_id) REFERENCES fb_user(id)
);

drop table report

INSERT INTO report (report_id, reporter_id, reported_user_id, report_reason, Timestamp)
VALUES 
(1, 1, 2, 'spam', '2024-04-18 08:00:00'),
(2, 2, 3, 'fraud', '2024-04-18 09:00:00'),
(3, 3, 4, 'spam', '2024-04-18 10:00:00'),
(4, 4, 5, 'fake', '2024-04-18 11:00:00'),
(5, 5, 1, 'abusing', '2024-04-18 12:00:00');

----------------------------------------------------------------------------------------------------------------------------------
14
----
	CREATE TABLE event (
	  event_id INT PRIMARY KEY,
	  user_id INT,
	  event_name VARCHAR(255),
	  location VARCHAR(255),
	  description VARCHAR(255),
	  start_time VARCHAR(30),
	  end_time VARCHAR(30),
	  privacy_setting VARCHAR(255),
	  FOREIGN KEY (user_id) REFERENCES fb_user(id)
	);


INSERT INTO event (event_id, user_id, event_name, location, description, start_time, end_time, privacy_setting)
VALUES 
(1, 1, 'Birthday Party', 'delhi', 'Join us for a fun', '2024-04-18 08:00:00', '2024-04-18 12:00:00', 'public'),
(2, 2, 'Conference', 'delhi', 'A gathering of industry proffesionals.', '2024-04-19 09:00:00', '2024-04-19 17:00:00', 'private'),
(3, 3, 'Music concert', 'mumbai', 'Enjoy live music from top artists!', '2024-04-20 12:00:00', '2024-04-20 23:59:59', 'friends'),
(4, 4, 'seminar', 'ahmedabad', 'Support a good cause and make a difference.', '2024-04-21 10:00:00', '2024-04-21 16:00:00', 'public'),
(5, 5, 'Workshop', 'banglore', 'Learn new skills and techniques.', '2024-04-22 13:00:00', '2024-04-22 15:00:00', 'private');


----------------------------------------------------------------------------------------------------------------------------------
15
----
CREATE TABLE event_joiner (
  event_id INT,
  user_id INT,
  join_status VARCHAR(50),
  PRIMARY KEY (event_id, user_id),
  FOREIGN KEY (event_id) REFERENCES event(event_id),
  FOREIGN KEY (user_id) REFERENCES fb_user(id)
);


INSERT INTO event_joiner (event_id, user_id, join_status)
VALUES 
(1, 1, 'Going'),
(1, 2, 'Interested'),
(2, 3, 'Going'),
(3, 4, 'Interested'),
(4, 5, 'Going');


----------------------------------------------------------------------------------------------------------------------------------
16
----
CREATE TABLE reaction (
  reaction_id INT PRIMARY KEY,
  user_id INT,
  post_id INT,
  reaction_type VARCHAR(30),
  Timestamp VARCHAR(30)
  FOREIGN KEY (user_id) REFERENCES fb_user(id),
  FOREIGN KEY (post_id) REFERENCES post(post_id)
 );

 
INSERT INTO reaction (reaction_id, user_id, post_id, reaction_type, Timestamp)
VALUES 
(1, 1, 1, 'Like', '2024-04-18 08:00:00'),
(2, 2, 1, 'Love', '2024-04-18 08:05:00'),
(3, 3, 2, 'Haha', '2024-04-18 09:00:00'),
(4, 4, 2, 'Like', '2024-04-18 09:05:00'),
(5, 5, 3, 'Sad', '2024-04-18 10:00:00');

----------------------------------------------------------------------------------------------------------------------------------
17
----

CREATE TABLE page (
  page_id INT PRIMARY KEY,
  page_name VARCHAR(30),
  category VARCHAR(30),
  description TEXT,
  admin_id INT,
  creation_date VARCHAR(30)
  FOREIGN KEY (admin_id) REFERENCES fb_user(id)
);


INSERT INTO page (page_id, page_name, category, description, admin_id, creation_date)
VALUES 
(1, 'Tech', 'Technology', 'A place for tech persons', 1, '2024-04-18'),
(2, 'Food', 'Food & Drink', 'find new flavors', 2, '2024-04-19'),
(3, 'Travel', 'Travel', 'travel adventures and tips.', 3, '2024-04-20'),
(4, 'Fitness', 'Health and Wellness', 'Stay fit and healthy', 4, '2024-04-21'),
(5, 'Art', 'Arts', 'creativity.', 5, '2024-04-22');


----------------------------------------------------------------------------------------------------------------------------------
18
----
CREATE TABLE page_follower (
  page_id INT,
  user_id INT,
  follow_time VARCHAR(30)
  PRIMARY KEY (page_id, user_id),
  FOREIGN KEY (page_id) REFERENCES page(page_id),
  FOREIGN KEY (user_id) REFERENCES fb_user(id)
);


INSERT INTO page_follower (page_id, user_id, follow_time)
VALUES 
(1, 1, '2024-04-18 08:00:00'),
(1, 2, '2024-04-18 09:00:00'),
(2, 3, '2024-04-18 10:00:00'),
(2, 4, '2024-04-18 11:00:00'),
(3, 5, '2024-04-18 12:00:00');

----------------------------------------------------------------------------------------------------------------------------------
19
----
CREATE TABLE page_post (
  post_id INT PRIMARY KEY,
  page_id INT,
  content TEXT,
  media VARCHAR(30),
  post_time VARCHAR(30),
  likes_count INT,
  comments_count INT,
  shares_count INT,
  FOREIGN KEY (page_id) REFERENCES page(page_id)
);



INSERT INTO page_post (post_id, page_id, content, media, post_time, likes_count, comments_count, shares_count)
VALUES 
(1, 1, 'Check latest tech reviews!', 'image1', '2024-04-18 08:00:00', 10, 5, 2),
(2, 2, 'Whats your favorite food', 'image2', '2024-04-18 09:00:00', 15, 7, 3),
(3, 3, 'Share your travel memories!', 'image3', '2024-04-18 10:00:00', 20, 10, 5),
(4, 4, 'Join for a workout!', 'image4', '2024-04-18 11:00:00', 25, 12, 6),
(5, 5, 'Show your artwork!', 'image5', '2024-04-18 12:00:00', 30, 15, 8);



----------------------------------------------------------------------------------------------------------------------------------
20
----
CREATE TABLE adv (
  ad_id INT PRIMARY KEY,
  advertiser_id INT,
  ad_content TEXT,
  ad_place VARCHAR(30),
  ad_expiry_date VARCHAR(30)
);



INSERT INTO adv (ad_id, advertiser_id, ad_content, ad_place, ad_expiry_date)
VALUES 
(1, 1, 'Special offer: 50% off ', 'Homepage', '2024-04-30'),
(2, 2, 'try new dish at our restaurant.', 'Sidebar', '2024-04-30'),
(3, 3, 'Plan vacation with us!', 'Homepage', '2024-04-30'),
(4, 4, 'plan fitness programs!', 'Homepage', '2024-04-30'),
(5, 5, 'exhibition coming soon!', 'Sidebar', '2024-04-30');

----------------------------------------------------------------------------------------------------------------------------------
21
----
CREATE TABLE ad_click (
  click_id INT PRIMARY KEY,
  ad_id INT,
  user_id INT,
  click_time VARCHAR(30)
  FOREIGN KEY (ad_id) REFERENCES adv(ad_id),
  FOREIGN KEY (user_id) REFERENCES fb_user(id)
);



INSERT INTO ad_click (click_id, ad_id, user_id, click_time)
VALUES 
(1, 1, 1, '2024-04-18 08:00:00'),
(2, 2, 2, '2024-04-18 09:00:00'),
(3, 3, 3, '2024-04-18 10:00:00'),
(4, 4, 4, '2024-04-18 11:00:00'),
(5, 5, 5, '2024-04-18 12:00:00');


----------------------------------------------------------------------------------------------------------------------------------
22
----
CREATE TABLE reaction_details (
  reaction_id INT,
  user_id INT,
  reaction_time VARCHAR(30)
  PRIMARY KEY (reaction_id, user_id),
  FOREIGN KEY (reaction_id) REFERENCES reaction(reaction_id),
  FOREIGN KEY (user_id) REFERENCES fb_user(id)
);


INSERT INTO reaction_details (reaction_id, user_id, reaction_time)
VALUES 
(1, 1, '2024-04-18 08:00:00'),
(2, 2, '2024-04-18 09:00:00'),
(3, 3, '2024-04-18 10:00:00'),
(4, 4, '2024-04-18 11:00:00'),
(5, 5, '2024-04-18 12:00:00');


----------------------------------------------------------------------------------------------------------------------------------
23
----
CREATE TABLE page_like (
  like_id INT PRIMARY KEY,
  page_id INT,
  user_id INT,
  like_time VARCHAR(30)
  FOREIGN KEY (page_id) REFERENCES page(page_id),
  FOREIGN KEY (user_id) REFERENCES fb_user(id)
);


INSERT INTO page_like (like_id, page_id, user_id, like_time)
VALUES 
(1, 1, 1, '2024-04-18 08:00:00'),
(2, 2, 2, '2024-04-18 09:00:00'),
(3, 3, 3, '2024-04-18 10:00:00'),
(4, 4, 4, '2024-04-18 11:00:00'),
(5, 5, 5, '2024-04-18 12:00:00');


----------------------------------------------------------------------------------------------------------------------------------
24
----
CREATE TABLE page_review (
  review_id INT PRIMARY KEY,
  page_id INT,
  user_id INT,
  rating INT,
  review_text TEXT,
  review_time VARCHAR(30)
  FOREIGN KEY (page_id) REFERENCES page(page_id),
  FOREIGN KEY (user_id) REFERENCES fb_user(id)
);



INSERT INTO page_review (review_id, page_id, user_id, rating, review_text, review_time)
VALUES 
(1, 1, 1, 5, 'Great tech content!', '2024-04-18 08:00:00'),
(2, 2, 2, 4, 'Love the food recommendations.', '2024-04-18 09:00:00'),
(3, 3, 3, 5, 'Amazing travel inspiration.', '2024-04-18 10:00:00'),
(4, 4, 4, 4, 'Effective fitness programs.', '2024-04-18 11:00:00'),
(5, 5, 5, 5, 'Incredible art showcase.', '2024-04-18 12:00:00');

----------------------------------------------------------------------------------------------------------------------------------
25
----
CREATE TABLE page_admin (
  admin_id INT PRIMARY KEY,
  page_id INT,
  user_id INT,
  admin_role VARCHAR(30),
  FOREIGN KEY (page_id) REFERENCES page(page_id),
  FOREIGN KEY (user_id) REFERENCES fb_user(id)
);


INSERT INTO page_admin (admin_id, page_id, user_id, admin_role)
VALUES 
(1, 1, 1, 'Editor'),
(2, 2, 2, 'Moderator'),
(3, 3, 3, 'Creator'),
(4, 4, 4, 'Editor'),
(5, 5, 5, 'Editor');

----------------------------------------------------------------------------------------------------------------------------------
26
----
CREATE TABLE group_admin (
  admin_id INT PRIMARY KEY,
  grp_id INT,
  user_id INT,
  admin_role VARCHAR(30),
  FOREIGN KEY (grp_id) REFERENCES groups(grp_id),
  FOREIGN KEY (user_id) REFERENCES fb_user(id)
);



INSERT INTO group_admin (admin_id, grp_id, user_id, admin_role)
VALUES 
(1, 1, 1, 'Creator'),
(2, 2, 2, 'Moderator'),
(3, 3, 3, 'Creator'),
(4, 4, 4, 'Creator'),
(5, 5, 5, 'Moderator');


----------------------------------------------------------------------------------------------------------------------------------
27
----


CREATE TABLE event_admin (
  admin_id INT PRIMARY KEY,
  event_id INT,
  user_id INT,
  admin_role VARCHAR(30),
  FOREIGN KEY (event_id) REFERENCES event(event_id),
  FOREIGN KEY (user_id) REFERENCES fb_user(id)
);


INSERT INTO event_admin (admin_id, event_id, user_id, admin_role)
VALUES 
(1, 1, 1, 'Organizer'),
(2, 2, 2, 'Organizer'),
(3, 3, 3, 'Manager'),
(4, 4, 4, 'Organizer'),
(5, 5, 5, 'Organizer');




----------------------------------------------------------------------------------------------------------------------------------
28
----
CREATE TABLE event_interest (
  interest_id INT PRIMARY KEY,
  event_id INT,
  interest_name VARCHAR(30),
  FOREIGN KEY (event_id) REFERENCES event(event_id)
);

INSERT INTO event_interest (interest_id, event_id, interest_name)
VALUES 
(1, 1, 'Technology'),
(2, 2, 'Food & Drink'),
(3, 3, 'Travel'),
(4, 4, 'Fitness'),
(5, 5, 'Art & Culture');


----------------------------------------------------------------------------------------------------------------------------------
29
----

CREATE TABLE event_notification (
  notification_id INT PRIMARY KEY,
  event_id INT,
  notification_type VARCHAR(30),
  notification_content TEXT,
  timestamp VARCHAR(30),
  status VARCHAR(30),
  FOREIGN KEY (event_id) REFERENCES event(event_id)
);


INSERT INTO event_notification (notification_id, event_id, notification_type, notification_content, timestamp, status)
VALUES 
(1, 1, 'Reminder', 'upcoming tech event!', '2024-04-18 08:00:00', 'unread'),
(2, 2, 'New Event', 'food festival coming soon!', '2024-04-18 09:00:00', 'unread'),
(3, 3, 'Notification', 'Plan your travel!', '2024-04-18 10:00:00', 'unread'),
(4, 4, 'Alert', 'dont miss workout!', '2024-04-18 11:00:00', 'unread'),
(5, 5, 'Reminder', ' starting tomorrow!', '2024-04-18 12:00:00', 'unread');




----------------------------------------------------------------------------------------------------------------------------------
30
----
CREATE TABLE page_notification (
  notification_id INT PRIMARY KEY,
  page_id INT,
  notification_type VARCHAR(30),
  notification_content TEXT,
  timestamp VARCHAR(30),
  status VARCHAR(30),
  FOREIGN KEY (page_id) REFERENCES page(page_id)
);


INSERT INTO page_notification (notification_id, page_id, notification_type, notification_content, timestamp, status)
VALUES 
(1, 1, 'New Post', 'Check latest reviews!', '2024-04-18 08:00:00', 'unread'),
(2, 2, 'Event Update', 'Food event this weekend!', '2024-04-18 09:00:00', 'unread'),
(3, 3, 'Notification', 'Share your travel photos', '2024-04-18 10:00:00', 'unread'),
(4, 4, 'Special Offer', '20% off', '2024-04-18 11:00:00', 'unread'),
(5, 5, 'New Post', 'Artists showcase .', '2024-04-18 12:00:00', 'unread');





----------------------------------------------------------------------------------------------------------------------------------
31
----
CREATE TABLE ads_notification (
  notification_id INT PRIMARY KEY,
  ad_id INT,
  notification_type VARCHAR(30),
  notification_content TEXT,
  timestamp VARCHAR(30),
  status VARCHAR(30),
  FOREIGN KEY (ad_id) REFERENCES adv(ad_id)
);


INSERT INTO ads_notification (notification_id, ad_id, notification_type, notification_content, timestamp, status)
VALUES 
(1, 1, 'Special Offer', 'Limited time offer: 50% off on all tech gadgets!', '2024-04-18 08:00:00', 'unread'),
(2, 2, 'New Ad', 'Discover new flavors at our restaurant.', '2024-04-18 09:00:00', 'unread'),
(3, 3, 'Exclusive Deal', 'Plan your next vacation with us and save big!', '2024-04-18 10:00:00', 'unread'),
(4, 4, 'Fitness Challenge', 'Join our fitness challenge and win prizes!', '2024-04-18 11:00:00', 'unread'),
(5, 5, 'Art Exhibition', 'Art exhibition opening soon.', '2024-04-18 12:00:00', 'unread');




----------------------------------------------------------------------------------------------------------------------------------
32
----
CREATE TABLE group_notification (
  notification_id INT PRIMARY KEY,
  grp_id INT,
  notification_type VARCHAR(30),
  notification_content TEXT,
  timestamp VARCHAR(30),
  status VARCHAR(30),
  FOREIGN KEY (grp_id) REFERENCES groups(grp_id)
);


INSERT INTO group_notification (notification_id, grp_id, notification_type, notification_content, timestamp, status)
VALUES 
(1, 1, 'New Member', 'Welcome to the group!', '2024-04-18 08:00:00', 'unread'),
(2, 2, 'Group Event', 'Join us for a group outing next weekend.', '2024-04-18 09:00:00', 'unread'),
(3, 3, 'Group Update', 'Important announcement: please read!', '2024-04-18 10:00:00', 'unread'),
(4, 4, 'Group Discussion', 'Let''s discuss our next group project.', '2024-04-18 11:00:00', 'unread'),
(5, 5, 'New Post', 'Check out the latest post in the group.', '2024-04-18 12:00:00', 'unread');



drop table group_notification


----------------------------------------------------------------------------------------------------------------------------------
33
----
CREATE TABLE event_post (
  post_id INT PRIMARY KEY,
  event_id INT,
  content TEXT,
  Media VARCHAR(30),
  post_time VARCHAR(30),
  likes_count INT,
  comments_count INT,
  Shares_count INT,
  FOREIGN KEY (event_id) REFERENCES event(event_id)
);


INSERT INTO event_post (post_id, event_id, content, Media, post_time, likes_count, comments_count, shares_count)
VALUES 
(1, 1, 'Excited for the upcoming tech event!', 'image1', '2024-04-18 08:00:00', 10, 5, 2),
(2, 2, 'Don''t miss out on the delicious food at our event!', 'image2', '2024-04-18 09:00:00', 15, 7, 3),
(3, 3, 'Share your travel experiences with us!', 'image3', '2024-04-18 10:00:00', 20, 10, 5),
(4, 4, 'Join us for a workout session!', 'image4', '2024-04-18 11:00:00', 25, 12, 6),
(5, 5, 'Artists showcase their latest works.', 'image5', '2024-04-18 12:00:00', 30, 15, 8);




----------------------------------------------------------------------------------------------------------------------------------
34
----
CREATE TABLE event_like (
  like_id INT PRIMARY KEY,
  event_id INT,
  user_id INT,
  like_time VARCHAR(30),
  FOREIGN KEY (event_id) REFERENCES event(event_id),
  FOREIGN KEY (user_id) REFERENCES fb_user(id)
);



INSERT INTO event_like (like_id, event_id, user_id, like_time)
VALUES 
(1, 1, 1, '2024-04-18 08:00:00'),
(2, 2, 2, '2024-04-18 09:00:00'),
(3, 3, 3, '2024-04-18 10:00:00'),
(4, 4, 4, '2024-04-18 11:00:00'),
(5, 5, 5, '2024-04-18 12:00:00');


----------------------------------------------------------------------------------------------------------------------------------
35
----
CREATE TABLE event_comment (
  ev_cmt_id INT PRIMARY KEY,
  event_id INT,
  user_id INT,
  content TEXT,
  comment_time VARCHAR(30),
  likes_count INT,
  FOREIGN KEY (event_id) REFERENCES event(event_id),
  FOREIGN KEY (user_id) REFERENCES fb_user(id)
);


INSERT INTO event_comment (ev_cmt_id, event_id, user_id, content, comment_time, likes_count)
VALUES 
(1, 1, 1, 'Looking forward to the event!', '2024-04-18 08:00:00', 5),
(2, 2, 2, 'Can''t wait to try the food!', '2024-04-18 09:00:00', 3),
(3, 3, 3, 'Amazing travel destination!', '2024-04-18 10:00:00', 8),
(4, 4, 4, 'Ready for the workout challenge!', '2024-04-18 11:00:00', 10),
(5, 5, 5, 'Excited to see the artworks!', '2024-04-18 12:00:00', 6);


----------------------------------------------------------------------------------------------------------------------------------
36
----
CREATE TABLE adv_interest (
  interest_id INT PRIMARY KEY,
  user_id INT,
  interest_name VARCHAR(30),
  FOREIGN KEY (user_id) REFERENCES fb_user(id)
);


INSERT INTO adv_interest (interest_id, user_id, interest_name)
VALUES 
(1, 1, 'Technology'),
(2, 2, 'Food & Drink'),
(3, 3, 'Travel'),
(4, 4, 'Fitness'),
(5, 5, 'Art & Culture');

----------------------------------------------------------------------------------------------------------------------------------
37
----
CREATE TABLE bookmark (
  bookmark_id INT PRIMARY KEY,
  user_id INT,
  content_id INT,
  content_type VARCHAR(30),
  bookmark_date VARCHAR(30),
  FOREIGN KEY (user_id) REFERENCES fb_user(id)
);

drop table bookmark

INSERT INTO bookmark (bookmark_id, user_id, content_id, content_type, bookmark_date)
VALUES 
(1, 1, 101, 'post', '2024-04-18 08:00:00'),
(2, 1, 201, 'page', '2024-04-18 09:00:00'),
(3, 2, 102, 'post', '2024-04-18 10:00:00'),
(4, 3, 301, 'event', '2024-04-18 11:00:00'),
(5, 4, 202, 'page', '2024-04-18 12:00:00');


----------------------------------------------------------------------------------------------------------------------------------
38
----

CREATE TABLE user_settings (
  setting_id INT PRIMARY KEY,
  user_id INT,
  theme VARCHAR(30),
  Language VARCHAR(30),
  Timezone VARCHAR(50),
  FOREIGN KEY (user_id) REFERENCES fb_user(id)
);


INSERT INTO user_settings (setting_id, user_id, theme, Language, Timezone)
VALUES 
(1, 1, 'Dark', 'English', 'UTC+0'),
(2, 2, 'Light', 'Spanish', 'UTC-5'),
(3, 3, 'Dark', 'French', 'UTC+2'),
(4, 4, 'Light', 'German', 'UTC+1'),
(5, 5, 'Dark', 'English', 'UTC-8');




----------------------------------------------------------------------------------------------------------------------------------
39
----


CREATE TABLE event_location (
  loc_id INT PRIMARY KEY,
  event_id INT,
  Latitude DECIMAL(10, 8),
  Longitude DECIMAL(11, 8),
  Address VARCHAR(255),
  FOREIGN KEY (event_id) REFERENCES Event(event_id)
);


INSERT INTO event_location (loc_id, event_id, Latitude, Longitude, Address)
VALUES 
(1, 1, 37.7749, -122.4194, 'delhi, india'),
(2, 2, 34.0522, -118.2437, 'mumbai, india'),
(3, 3, 40.7128, -74.0060, 'delhi, india'),
(4, 4, 41.8781, -87.6298, 'ahmedabad, india'),
(5, 5, 29.7604, -95.3698, 'india, india');





----------------------------------------------------------------------------------------------------------------------------------
40
----

CREATE TABLE event_invitation (
  invitation_id INT PRIMARY KEY,
  event_id INT,
  user_id INT,
  InvitationStatus VARCHAR(30),
  FOREIGN KEY (event_id) REFERENCES event(event_id),
  FOREIGN KEY (user_id) REFERENCES fb_user(id)
);


INSERT INTO event_invitation (invitation_id, event_id, user_id, InvitationStatus)
VALUES 
(1, 1, 2, 'Accepted'),
(2, 1, 3, 'Pending'),
(3, 2, 1, 'Declined'),
(4, 3, 4, 'Accepted'),
(5, 2, 5, 'Pending');





























































































