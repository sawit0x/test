ALTER TABLE `general_settings` ADD `firebase_config` TEXT NULL DEFAULT NULL AFTER `promotional_tool`;
ALTER TABLE `general_settings` ADD `firebase_template` TEXT NULL DEFAULT NULL AFTER `firebase_config`;
ALTER TABLE `notification_templates` ADD `firebase_status` TINYINT(1) NOT NULL DEFAULT '0' AFTER `sms_status`, ADD `firebase_body` TEXT NULL DEFAULT NULL AFTER `firebase_status`;

CREATE TABLE `device_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_app` tinyint(1) NOT NULL DEFAULT 0,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `device_tokens`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `device_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


ALTER TABLE `general_settings` ADD `push_notify` TINYINT(1) NOT NULL DEFAULT '0' AFTER `firebase_template`;