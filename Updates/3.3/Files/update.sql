ALTER TABLE `users` ADD `user_ranking_id` INT(10) NOT NULL DEFAULT '0' AFTER `password`;

ALTER TABLE `general_settings` ADD `user_ranking` TINYINT(1) NOT NULL DEFAULT '0' AFTER `p_charge`;

ALTER TABLE `transactions` ADD `invest_id` INT(10) NOT NULL DEFAULT '0' AFTER `user_id`;

ALTER TABLE `plans` ADD `time_setting_id` INT(10) NOT NULL DEFAULT '0' AFTER `interest_type`;

ALTER TABLE `time_settings` ADD `status` TINYINT(1) NOT NULL DEFAULT '0' COMMENT '0: Disable\r\n1: Enable' AFTER `time`;

ALTER TABLE `plans` DROP `time`, DROP `time_name`;

ALTER TABLE `users` ADD `last_rank_update` DATETIME NULL DEFAULT NULL AFTER `remember_token`;
ALTER TABLE `users` ADD `total_invests` DECIMAL(28,8) NOT NULL DEFAULT '0' AFTER `password`;

ALTER TABLE `users` ADD `team_invests` DECIMAL(28,8) NOT NULL DEFAULT '0' AFTER `total_invests`;

ALTER TABLE `users` DROP `image`;

ALTER TABLE `deposits` CHANGE `try` `payment_try` INT(10) NOT NULL DEFAULT '0';

INSERT INTO `gateways` (`id`, `form_id`, `code`, `name`, `alias`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES (NULL, '0', '122', 'BTCPay', 'BTCPay', '1', '{\"store_id\":{\"title\":\"Store Id\",\"global\":true,\"value\":\"-------\"},\"api_key\":{\"title\":\"Api Key\",\"global\":true,\"value\":\"------\"},\"server_name\":{\"title\":\"Server Name\",\"global\":true,\"value\":\"https:\\/\\/yourbtcpaserver.lndyn.com\"},\"secret_code\":{\"title\":\"Secret Code\",\"global\":true,\"value\":\"----------\"}}', '{\"BTC\":\"Bitcoin\",\"LTC\":\"Litecoin\"}', '1', '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.BTCPay\"}}', NULL, NULL, NULL);


INSERT INTO `gateways` (`id`, `form_id`, `code`, `name`, `alias`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES (NULL, '0', '123', 'Now payments hosted', 'NowPaymentsHosted', '1', '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"-------------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"--------------\"}}', '{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDT\":\"USDT\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}', '1', '', NULL, NULL, '2023-02-14 10:42:09');


INSERT INTO `gateways` (`id`, `form_id`, `code`, `name`, `alias`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES (NULL, '0', '509', 'Now payments checkout', 'NowPaymentsCheckout', '1', '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"-------------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"--------------\"}}', '{\"BTG\":\"BTG\",\"ETH\":\"ETH\",\"XMR\":\"XMR\",\"ZEC\":\"ZEC\",\"XVG\":\"XVG\",\"ADA\":\"ADA\",\"LTC\":\"LTC\",\"BCH\":\"BCH\",\"QTUM\":\"QTUM\",\"DASH\":\"DASH\",\"XLM\":\"XLM\",\"XRP\":\"XRP\",\"XEM\":\"XEM\",\"DGB\":\"DGB\",\"LSK\":\"LSK\",\"DOGE\":\"DOGE\",\"TRX\":\"TRX\",\"KMD\":\"KMD\",\"REP\":\"REP\",\"BAT\":\"BAT\",\"ARK\":\"ARK\",\"WAVES\":\"WAVES\",\"BNB\":\"BNB\",\"XZC\":\"XZC\",\"NANO\":\"NANO\",\"TUSD\":\"TUSD\",\"VET\":\"VET\",\"ZEN\":\"ZEN\",\"GRS\":\"GRS\",\"FUN\":\"FUN\",\"NEO\":\"NEO\",\"GAS\":\"GAS\",\"PAX\":\"PAX\",\"USDC\":\"USDC\",\"ONT\":\"ONT\",\"XTZ\":\"XTZ\",\"LINK\":\"LINK\",\"RVN\":\"RVN\",\"BNBMAINNET\":\"BNBMAINNET\",\"ZIL\":\"ZIL\",\"BCD\":\"BCD\",\"USDT\":\"USDT\",\"USDTERC20\":\"USDTERC20\",\"CRO\":\"CRO\",\"DAI\":\"DAI\",\"HT\":\"HT\",\"WABI\":\"WABI\",\"BUSD\":\"BUSD\",\"ALGO\":\"ALGO\",\"USDTTRC20\":\"USDTTRC20\",\"GT\":\"GT\",\"STPT\":\"STPT\",\"AVA\":\"AVA\",\"SXP\":\"SXP\",\"UNI\":\"UNI\",\"OKB\":\"OKB\",\"BTC\":\"BTC\"}', '1', '', NULL, NULL, '2023-02-14 10:42:09');



UPDATE users c
INNER JOIN (
  SELECT user_id, SUM(amount) as total
  FROM invests
  GROUP BY user_id
) x ON c.id = x.user_id
SET c.total_invests = x.total;



INSERT INTO `frontends` (`data_keys`, `data_values`, `template_name`, `created_at`, `updated_at`) VALUES
('user_ranking.content', '{\"heading_w\":\"User Ranking\",\"heading_c\":\"Bonus\",\"sub_heading\":\"You can get bonus for investing or Interest.\"}', 'bit_gold', '2023-02-06 07:48:56', '2023-02-06 07:48:56'),
('user_ranking.content', '{\"heading\":\"User Ranking Bonus\",\"sub_heading\":\"You can get bonus for investing or Interest.\"}', 'neo_dark', '2023-02-06 23:51:09', '2023-02-06 23:51:35'),
('user_ranking.content', '{\"title\":\"User Ranking Bonus\",\"subtitle\":\"You can get bonus for investing or Interest.\"}', 'invester', '2023-02-07 00:15:49', '2023-02-07 00:15:49'),
('ranking.content', '{\"heading_w\":\"User\",\"heading_c\":\"Ranking\",\"sub_heading\":\"You can get a bonus to fulfill the requirement.\"}', 'bit_gold', '2023-03-11 01:25:36', '2023-03-11 02:56:24'),
('ranking.content', '{\"heading\":\"User Ranking\",\"sub_heading\":\"You can get a bonus to fulfill the requirement.\"}', 'invester', '2023-03-11 02:47:58', '2023-03-11 02:52:08'),
('ranking.content', '{\"heading\":\"User Ranking\",\"sub_heading\":\"You can get a bonus to fulfill the requirement.\"}', 'neo_dark', '2023-03-11 02:55:55', '2023-03-11 02:55:55');


CREATE TABLE `user_rankings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) DEFAULT 0,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimum_invest` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `min_referral_invest` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `min_referral` int(11) NOT NULL DEFAULT 0,
  `bonus` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `user_rankings`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `user_rankings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;