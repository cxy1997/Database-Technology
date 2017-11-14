
USE `mydb` ;

-- -----------------------------------------------------
-- Select the oldest and the yountest customers
-- -----------------------------------------------------
SELECT user_name, extra_discount FROM UserList, credits, ranks 
WHERE UserList.credit = credits.credit AND credits.rank = ranks.rank 
ORDER BY age DESC LIMIT 1; 

SELECT user_name, extra_discount FROM UserList, credits, ranks 
WHERE UserList.credit = credits.credit AND credits.rank = ranks.rank 
ORDER BY age ASC LIMIT 1; 

CALL purchase_1(1);
CALL purchase_2(2);

CALL cancel_order(0, '江南皮革厂倒闭啦');
CALL confirm_order(1, 5, '一袋能顶两袋撒,小麦亩产一千八');