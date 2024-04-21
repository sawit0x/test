ALTER TABLE `time_settings` CHANGE `status` `status` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '0: Disable\r\n1: Enable';

ALTER TABLE `invests` ADD `capital_back` TINYINT(1) NOT NULL DEFAULT '0' AFTER `capital_status`;
ALTER TABLE `invests` ADD `compound_times` INT(11) NOT NULL DEFAULT '0' AFTER `last_time`, ADD `rem_compound_times` INT(11) NOT NULL DEFAULT '0' AFTER `compound_times`;
ALTER TABLE `invests` ADD `hold_capital` TINYINT(1) NOT NULL DEFAULT '0' AFTER `capital_back`;
ALTER TABLE `invests` ADD `initial_amount` DECIMAL(28,8) NOT NULL DEFAULT '0' AFTER `amount`;
ALTER TABLE `invests` ADD `initial_interest` DECIMAL(28,8) NOT NULL DEFAULT '0' AFTER `interest`;
ALTER TABLE `invests` ADD `net_interest` DECIMAL(28,8) NOT NULL DEFAULT '0' AFTER `initial_interest`;


ALTER TABLE `plans` CHANGE `time_setting_id` `time_setting_id` INT(10) NOT NULL DEFAULT '0' AFTER `id`, CHANGE `repeat_time` `repeat_time` VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL AFTER `interest_type`, CHANGE `lifetime` `lifetime` TINYINT(1) NULL DEFAULT '0' AFTER `repeat_time`, CHANGE `capital_back` `capital_back` TINYINT(1) NULL DEFAULT '0' AFTER `lifetime`, CHANGE `featured` `featured` TINYINT(1) NOT NULL DEFAULT '0' AFTER `capital_back`;


ALTER TABLE `plans` ADD `compound_interest` TINYINT(1) NOT NULL DEFAULT '0' AFTER `capital_back`;
ALTER TABLE `plans` ADD `hold_capital` TINYINT(1) NOT NULL DEFAULT '0' AFTER `compound_interest`;


ALTER TABLE `general_settings` ADD `schedule_invest` TINYINT(1) NOT NULL DEFAULT '0' AFTER `user_ranking`;


INSERT INTO `notification_templates` (`act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `firebase_status`, `firebase_body`, `created_at`, `updated_at`) VALUES
('INSUFFICIENT_BALANCE', 'Schedule Investment Failed', 'Schedule Investment Failed', '<div style=\"font-family: Montserrat, sans-serif;\">Your scheduled investment failed due to insufficient balance.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Details of your scheduled investment.</div><div style=\"font-family: Montserrat, sans-serif;\">Invest Amount: {{invest_amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Wallet: {{wallet}}</div><div style=\"font-family: Montserrat, sans-serif;\">Plan Name: {{plan_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Your Balance: {{balance}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Next Schedule: {{next_schedule}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Please keep your balance for the next scheduled date.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Your scheduled investment failed due to insufficient balance.', '{\r\n    \"invest_amount\": \"Invest amount\",\r\n    \"wallet\": \"Wallet type\",\r\n    \"plan_name\": \"Plan name\",\r\n    \"balance\": \"User balance\",\r\n    \"next_schedule\": \"Next invest schedule\"\r\n}', 1, 0, 0, 'Your scheduled investment failed due to insufficient balance.', '2021-11-03 12:00:00', '2023-06-21 03:13:36');

 

CREATE TABLE `cron_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cron_schedule_id` int(11) NOT NULL DEFAULT 0,
  `next_run` datetime DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `is_running` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `cron_jobs`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `cron_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


CREATE TABLE `cron_job_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cron_job_id` int(11) NOT NULL DEFAULT 0,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 0,
  `error` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


ALTER TABLE `cron_job_logs`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `cron_job_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;



CREATE TABLE `cron_schedules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interval` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


ALTER TABLE `cron_schedules`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `cron_schedules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


CREATE TABLE `schedule_invests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `plan_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `wallet` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `schedule_times` int(11) NOT NULL DEFAULT 0,
  `rem_schedule_times` int(11) NOT NULL DEFAULT 0,
  `interval_hours` int(11) NOT NULL DEFAULT 0,
  `compound_times` int(11) NOT NULL DEFAULT 0,
  `next_invest` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `schedule_invests`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `schedule_invests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;


ALTER TABLE `gateways` ADD UNIQUE(`code`);

CREATE TABLE `update_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_log` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


ALTER TABLE `update_logs`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `update_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;


  INSERT INTO
    `gateways`(
        `form_id`,
        `code`,
        `name`,
        `alias`,
        `status`,
        `gateway_parameters`,
        `supported_currencies`,
        `crypto`,
        `extra`,
        `description`,
        `created_at`,
        `updated_at`
    )
VALUES
    (
        0,
        124,
        '2Checkout',
        'TwoCheckout',
        1,
        '{\"merchant_code\":{\"title\":\"Merchant Code\",\"global\":true,\"value\":\"253248016872\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"eQM)ID@&vG84u!O*g[p+\"}}',
        '{\"AFN\": \"AFN\",\"ALL\": \"ALL\",\"DZD\": \"DZD\",\"ARS\": \"ARS\",\"AUD\": \"AUD\",\"AZN\": \"AZN\",\"BSD\": \"BSD\",\"BDT\": \"BDT\",\"BBD\": \"BBD\",\"BZD\": \"BZD\",\"BMD\": \"BMD\",\"BOB\": \"BOB\",\"BWP\": \"BWP\",\"BRL\": \"BRL\",\"GBP\": \"GBP\",\"BND\": \"BND\",\"BGN\": \"BGN\",\"CAD\": \"CAD\",\"CLP\": \"CLP\",\"CNY\": \"CNY\",\"COP\": \"COP\",\"CRC\": \"CRC\",\"HRK\": \"HRK\",\"CZK\": \"CZK\",\"DKK\": \"DKK\",\"DOP\": \"DOP\",\"XCD\": \"XCD\",\"EGP\": \"EGP\",\"EUR\": \"EUR\",\"FJD\": \"FJD\",\"GTQ\": \"GTQ\",\"HKD\": \"HKD\",\"HNL\": \"HNL\",\"HUF\": \"HUF\",\"INR\": \"INR\",\"IDR\": \"IDR\",\"ILS\": \"ILS\",\"JMD\": \"JMD\",\"JPY\": \"JPY\",\"KZT\": \"KZT\",\"KES\": \"KES\",\"LAK\": \"LAK\",\"MMK\": \"MMK\",\"LBP\": \"LBP\",\"LRD\": \"LRD\",\"MOP\": \"MOP\",\"MYR\": \"MYR\",\"MVR\": \"MVR\",\"MRO\": \"MRO\",\"MUR\": \"MUR\",\"MXN\": \"MXN\",\"MAD\": \"MAD\",\"NPR\": \"NPR\",\"TWD\": \"TWD\",\"NZD\": \"NZD\",\"NIO\": \"NIO\",\"NOK\": \"NOK\",\"PKR\": \"PKR\",\"PGK\": \"PGK\",\"PEN\": \"PEN\",\"PHP\": \"PHP\",\"PLN\": \"PLN\",\"QAR\": \"QAR\",\"RON\": \"RON\",\"RUB\": \"RUB\",\"WST\": \"WST\",\"SAR\": \"SAR\",\"SCR\": \"SCR\",\"SGD\": \"SGD\",\"SBD\": \"SBD\",\"ZAR\": \"ZAR\",\"KRW\": \"KRW\",\"LKR\": \"LKR\",\"SEK\": \"SEK\",\"CHF\": \"CHF\",\"SYP\": \"SYP\",\"THB\": \"THB\",\"TOP\": \"TOP\",\"TTD\": \"TTD\",\"TRY\": \"TRY\",\"UAH\": \"UAH\",\"AED\": \"AED\",\"USD\": \"USD\",\"VUV\": \"VUV\",\"VND\": \"VND\",\"XOF\": \"XOF\",\"YER\": \"YER\"}',
        1,
        '{\"approved_url\":{\"title\": \"Approved URL\",\"value\":\"ipn.TwoCheckout\"}}',
        NULL,
        NULL,
        '2023-04-29 09:21:58'
    ),
    (
        0,
        125,
        'Checkout',
        'Checkout',
        1,
        '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"------\"},\"public_key\":{\"title\":\"PUBLIC KEY\",\"global\":true,\"value\":\"------\"},\"processing_channel_id\":{\"title\":\"PROCESSING CHANNEL\",\"global\":true,\"value\":\"------\"}}',
        '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"AUD\":\"AUD\",\"CAN\":\"CAN\",\"CHF\":\"CHF\",\"SGD\":\"SGD\",\"JPY\":\"JPY\",\"NZD\":\"NZD\"}',
        0,
        NULL,
        NULL,
        NULL,
        '2023-05-06 07:43:01'
    );


INSERT INTO `cron_jobs` (`id`, `name`, `alias`, `action`, `url`, `cron_schedule_id`, `next_run`, `last_run`, `is_running`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Interest Cron', 'interest_cron', '[\"App\\\\Http\\\\Controllers\\\\CronController\", \"interest\"]', NULL, 1, '2023-06-24 12:30:08', '2023-06-24 12:25:08', 1, 1, '2023-06-21 23:29:14', '2023-06-24 06:25:08'),
(2, 'Rank Cron', 'rank_cron', '[\"App\\\\Http\\\\Controllers\\\\CronController\", \"rank\"]', NULL, 1, '2023-06-24 12:30:08', '2023-06-24 12:25:08', 1, 1, '2023-06-22 06:04:49', '2023-06-24 06:25:08'),
(3, 'Schedule Invest', 'schedule_invest', '[\"App\\\\Http\\\\Controllers\\\\CronController\", \"investSchedule\"]', NULL, 1, '2023-06-24 12:30:08', '2023-06-24 12:25:08', 1, 1, '2023-06-22 06:10:31', '2023-06-24 06:25:08');

INSERT INTO `cron_schedules` (`id`, `name`, `interval`, `status`, `created_at`, `updated_at`) VALUES
(1, '5 Minutes', 300, 1, '2023-06-21 08:14:52', '2023-06-21 08:14:52'),
(2, '10 Minutes', 600, 1, '2023-06-21 23:28:22', '2023-06-21 23:28:22');