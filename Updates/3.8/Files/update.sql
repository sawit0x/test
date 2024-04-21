ALTER TABLE `general_settings` ADD `system_customized` TINYINT(1) NOT NULL DEFAULT '0' AFTER `system_info`;

ALTER TABLE `general_settings` ADD `staking_option` TINYINT(1) NOT NULL DEFAULT '0' AFTER `holiday_withdraw`, ADD `staking_min_amount` DECIMAL(28,8) NOT NULL DEFAULT '0' AFTER `staking_option`, ADD `staking_max_amount` DECIMAL(28,8) NOT NULL DEFAULT '0' AFTER `staking_min_amount`;

ALTER TABLE `general_settings` ADD `pool_option` TINYINT(1) NOT NULL DEFAULT '0' AFTER `staking_max_amount`;


ALTER TABLE `invests` CHANGE `status` `status` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '0: Closed\r\n1: Running\r\n2: Canceled';
ALTER TABLE `invests` CHANGE `next_time` `next_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE `users` ADD `wallet` VARCHAR(255) NULL DEFAULT NULL AFTER `email`;
ALTER TABLE `users` ADD `message` VARCHAR(40) NULL DEFAULT NULL AFTER `wallet`;

ALTER TABLE `deposits` ADD `compound_times` INT(11) NOT NULL DEFAULT '0' AFTER `trx`;


INSERT INTO `cron_jobs` (`name`, `alias`, `action`, `url`, `cron_schedule_id`, `next_run`, `last_run`, `is_running`, `is_default`, `created_at`, `updated_at`) VALUES ('Staking Invest', 'staking_invest', '[\"App\\\\Http\\\\Controllers\\\\CronController\", \"staking\"]', NULL, '1', '2023-07-26 18:55:58', '2023-07-26 18:50:58', '1', '1', '2023-06-22 12:10:31', '2023-07-26 18:50:58');


CREATE TABLE `pools` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `invested_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `interest_range` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `share_interest` tinyint(4) NOT NULL DEFAULT 0,
  `interest` decimal(5,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `pool_invests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `pool_id` int(10) UNSIGNED NOT NULL,
  `invest_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: Running\r\n2: Completed\r\n',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `stakings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `days` int(11) NOT NULL,
  `interest_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `staking_invests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `staking_id` int(10) NOT NULL DEFAULT 0,
  `invest_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `interest` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `end_at` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1: Running\r\n2: Completed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



ALTER TABLE `pools`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `pool_invests`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `stakings`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `staking_invests`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `pools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `pool_invests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `stakings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `staking_invests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;