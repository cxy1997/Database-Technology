
USE `mydb` ;

-- -----------------------------------------------------
-- Initialize suppliers
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS initialize_suppliers;
delimiter //
CREATE PROCEDURE initialize_suppliers()
BEGIN
  DECLARE i, j, k INT;
  SET i = 1;
  SELECT i;
  WHILE i <= 10 DO 
    INSERT INTO Suppliers(supplier_name) VALUES(CONCAT('supplier_', i));
    SET j = FLOOR(RAND() * 4);
    SET k = 1;
    IF (j = 0) THEN
      WHILE k <= 4 DO
        INSERT INTO Catalog(commodity_name, clothes, price, discount, stock, supplier_id) VALUES(CONCAT(i, '_clothes_', k), CONCAT(i, '_clothes_', k), FLOOR(RAND() * 900 + 100), RAND() * 0.3 + 0.7, FLOOR(RAND() * 900 + 100), i-1);
        SET k = k + 1;
      END WHILE;
    ELSEIF (j = 1) THEN
      WHILE k <= 4 DO
        INSERT INTO Catalog(commodity_name, food, price, discount, stock, supplier_id) VALUES(CONCAT(i, '_food_', k), CONCAT(i, '_food_', k), FLOOR(RAND() * 900 + 100), RAND() * 0.3 + 0.7, FLOOR(RAND() * 900 + 100), i-1);
        SET k = k + 1;
      END WHILE;
    ELSEIF (j = 2) THEN
      WHILE k <= 4 DO
        INSERT INTO Catalog(commodity_name, entertainments, price, discount, stock, supplier_id) VALUES(CONCAT(i, '_entertainments_', k), CONCAT(i, '_entertainments_', k), FLOOR(RAND() * 900 + 100), RAND() * 0.3 + 0.7, FLOOR(RAND() * 900 + 100), i-1);
        SET k = k + 1;
      END WHILE;
    ELSEIF (j = 3) THEN
      WHILE k <= 4 DO
        INSERT INTO Catalog(commodity_name, luxary, price, discount, stock, supplier_id) VALUES(CONCAT(i, '_luxary_', k), CONCAT(i, '_luxary_', k), FLOOR(RAND() * 900 + 100), RAND() * 0.3 + 0.7, FLOOR(RAND() * 900 + 100), i-1);
        SET k = k + 1;
      END WHILE;
    END IF;
    SET i = i + 1;
  END WHILE;
END//
delimiter ;


-- -----------------------------------------------------
-- Initialize users
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS initialize_users;
delimiter //
CREATE PROCEDURE initialize_users()
BEGIN
  DECLARE i, j INT;
  SET i = 1;
  SELECT i;
  WHILE i <= 100 DO -- MARK!!!
    SET j = FLOOR(RAND()*2000);
    IF (j > 1000) THEN
      SET j = -1;
    END IF;
    INSERT INTO UserList(user_name, credit, age) VALUES(CONCAT('user_', i), j, FLOOR(RAND() * 80) + 1);
    SET i = i + 1;
  END WHILE;
END//
delimiter ;

-- -----------------------------------------------------
-- Purchase pattern of customer 1
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS purchase_1;
delimiter //
CREATE PROCEDURE purchase_1(IN U_id INT)
BEGIN
  DECLARE GID, i INT;
  DECLARE q FLOAT;
  SELECT Goods_id, stock INTO GID, q FROM Catalog WHERE clothes IS NOT NULL ORDER BY price ASC LIMIT 1;
  SET i = FLOOR(RAND() * 3);
  INSERT INTO Order_contents(Goods_id, quantity) VALUES(GID, FLOOR(RAND() * q));
  IF (i = 0) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '未处理');
  ELSEIF (i = 1) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '已备货');
  ELSEIF (i = 2) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '已发货');
  END IF;

  SELECT Goods_id, stock INTO GID, q FROM Catalog WHERE food IS NOT NULL ORDER BY price ASC LIMIT 1;
  SET i = FLOOR(RAND() * 3);
  INSERT INTO Order_contents(Goods_id, quantity) VALUES(GID, FLOOR(RAND() * q));
  IF (i = 0) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '未处理');
  ELSEIF (i = 1) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '已备货');
  ELSEIF (i = 2) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '已发货');
  END IF;

  SELECT Goods_id, stock INTO GID, q FROM Catalog WHERE entertainments IS NOT NULL ORDER BY price ASC LIMIT 1;
  SET i = FLOOR(RAND() * 3);
  INSERT INTO Order_contents(Goods_id, quantity) VALUES(GID, FLOOR(RAND() * q));
  IF (i = 0) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '未处理');
  ELSEIF (i = 1) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '已备货');
  ELSEIF (i = 2) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '已发货');
  END IF;

  SELECT Goods_id, stock INTO GID, q FROM Catalog WHERE luxary IS NOT NULL ORDER BY price ASC LIMIT 1;
  SET i = FLOOR(RAND() * 3);
  INSERT INTO Order_contents(Goods_id, quantity) VALUES(GID, FLOOR(RAND() * q));
  IF (i = 0) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '未处理');
  ELSEIF (i = 1) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '已备货');
  ELSEIF (i = 2) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '已发货');
  END IF;

  UPDATE Variables SET order_group_cnt = order_group_cnt + 1;
END//
delimiter ;

-- -----------------------------------------------------
-- Purchase pattern of customer 2
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS purchase_2;
delimiter //
CREATE PROCEDURE purchase_2(IN U_id INT)
BEGIN
  DECLARE GID, i INT;
  DECLARE q FLOAT;
  SELECT Goods_id, stock INTO GID, q FROM Catalog WHERE clothes IS NOT NULL ORDER BY stock DESC LIMIT 1;
  SET i = FLOOR(RAND() * 3);
  INSERT INTO Order_contents(Goods_id, quantity) VALUES(GID, q);
  IF (i = 0) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '未处理');
  ELSEIF (i = 1) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '已备货');
  ELSEIF (i = 2) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '已发货');
  END IF;

  SELECT Goods_id, stock INTO GID, q FROM Catalog WHERE food IS NOT NULL ORDER BY stock DESC LIMIT 1;
  SET i = FLOOR(RAND() * 3);
  INSERT INTO Order_contents(Goods_id, quantity) VALUES(GID, q);
  IF (i = 0) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '未处理');
  ELSEIF (i = 1) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '已备货');
  ELSEIF (i = 2) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '已发货');
  END IF;

  SELECT Goods_id, stock INTO GID, q FROM Catalog WHERE entertainments IS NOT NULL ORDER BY stock DESC LIMIT 1;
  SET i = FLOOR(RAND() * 3);
  INSERT INTO Order_contents(Goods_id, quantity) VALUES(GID, q);
  IF (i = 0) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '未处理');
  ELSEIF (i = 1) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '已备货');
  ELSEIF (i = 2) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '已发货');
  END IF;

  SELECT Goods_id, stock INTO GID, q FROM Catalog WHERE luxary IS NOT NULL ORDER BY stock DESC LIMIT 1;
  SET i = FLOOR(RAND() * 3);
  INSERT INTO Order_contents(Goods_id, quantity) VALUES(GID, q);
  IF (i = 0) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '未处理');
  ELSEIF (i = 1) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '已备货');
  ELSEIF (i = 2) THEN
    INSERT INTO Orders(User_id, post_code, address, status) VALUES(U_id, '200240', 'SJTU', '已发货');
  END IF;

  UPDATE Variables SET order_group_cnt = order_group_cnt + 1;
END//
delimiter ;

-- -----------------------------------------------------
-- Cancel an order
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS cancel_order;
delimiter //
CREATE PROCEDURE cancel_order(IN OG_id INT, IN reason VARCHAR(200))
BEGIN
  UPDATE Orders SET status = '已退货', reject_reason = reason WHERE order_group_id = OG_id;
END//
delimiter ;

-- -----------------------------------------------------
-- Confirm a delivery
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS confirm_order;
delimiter //
CREATE PROCEDURE confirm_order(IN OG_id INT, IN R INT, IN C VARCHAR(200))
BEGIN
  UPDATE Orders SET status = '已完成', delivery_date = NOW() WHERE order_group_id = OG_id;
  UPDATE Comments SET rating = R, content = C WHERE order_group_id = OG_id;
END//
delimiter ;

CALL initialize_suppliers();
CALL initialize_users();