SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `likes` int(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `published` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `views`, `likes`, `image`, `body`, `published`, `created_at`, `updated_at`) VALUES
(1, 1, '5 Habits that can improve your life', '5-habits-that-can-improve-your-life', 26, 12, 'banner.jpg', 'Read every day', 1, '2018-11-22 05:59:52', '2018-02-01 13:44:31'),
(2, 1, 'Second post on LifeBlog', 'second-post-on-lifeblog', 34, 20, 'banner.jpg', 'This is the body of the second post on this site', 1, '2018-11-22 04:22:05', '2018-02-01 07:34:36'),
(3, 1, 'Hello Post', 'hello-post', 1, 1, 'iPhoneX-Svr.png', 'Something about iphone X', 1, '2018-11-22 06:12:02', '2018-11-22 06:06:57'),
(4, 1, 'Google pixel', 'google-pixel', 0, 0, 'Nokia_5.1_plus.jpg', '&lt;p&gt;Something about Nokia&lt;/p&gt;\r\n', 1, '2018-11-22 06:11:44', '2018-11-22 06:11:25');


CREATE TABLE `post_topic` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `post_topic` (`id`, `post_id`, `topic_id`) VALUES
(0, 3, 2),
(1, 1, 1),
(2, 2, 2);


CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `topics` (`id`, `name`, `slug`) VALUES
(1, 'Inspiration', 'inspiration'),
(2, 'Motivation', 'motivation'),
(3, 'Diary', 'diary');



CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('Author','Admin') DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `users` (`id`, `username`, `email`, `role`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Kishan', 'rkishan516@gmail.com', 'Admin', '38caf6bc6147e61e1570f61e737fb6d8', '2018-01-08 07:22:58', '2018-01-08 07:22:58'),
(3, 'author1', 'author1@gmail.com', 'Admin', 'b312ba4ffd5245fa2a1ab819ec0d0347', '2018-11-14 14:25:05', '2018-11-14 14:25:05'),
(5, 'author2', 'author2@gmail.com', 'Author', '9bd97baef2b853ec00cc3cffd269f679', '2018-11-15 05:24:20', '2018-11-15 05:24:20'),
(15, 'user', 'user@gmail.com', NULL, 'ee11cbb19052e40b07aac0ca060c23ee', '2018-11-22 06:02:20', '2018-11-22 06:02:20');


ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `user_id` (`user_id`);


ALTER TABLE `post_topic`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_id` (`post_id`),
  ADD KEY `topic_id` (`topic_id`);

ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);


ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;


ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE `post_topic`
  ADD CONSTRAINT `post_topic_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `post_topic_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

