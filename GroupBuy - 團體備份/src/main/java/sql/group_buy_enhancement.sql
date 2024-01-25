CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `web`@`%` 
    SQL SECURITY DEFINER
VIEW `v_rank` AS
    SELECT 
        `p`.`productId` AS `productId`,
        `p`.`productName` AS `productName`,
        `p`.`price` AS `price`,
        `p`.`unit` AS `unit`,
        COALESCE(SUM(IF((`c`.`isCheckout` = 1),
                    `ci`.`quantity`,
                    0)),
                0) AS `total_quantity`
    FROM
        ((`cartitem` `ci`
        LEFT JOIN `cart` `c` ON ((`ci`.`cartId` = `c`.`cartId`)))
        LEFT JOIN `product` `p` ON ((`ci`.`productId` = `p`.`productId`)))
    GROUP BY `p`.`productId` 
    UNION SELECT 
        `p`.`productId` AS `productId`,
        `p`.`productName` AS `productName`,
        `p`.`price` AS `price`,
        `p`.`unit` AS `unit`,
        COALESCE(SUM(IF((`c`.`isCheckout` = 1),
                    `ci`.`quantity`,
                    0)),
                0) AS `total_quantity`
    FROM
        (`product` `p`
        LEFT JOIN (`cart` `c`
        LEFT JOIN `cartitem` `ci` ON ((`ci`.`cartId` = `c`.`cartId`))) ON ((`ci`.`productId` = `p`.`productId`)))
    GROUP BY `p`.`productId`
    ORDER BY `total_quantity` DESC;
    
    
select p.productId, p.productName, p.price, p.unit, coalesce(sum( if( c.isCheckout = 1,ci.quantity,0)),0) total_quantity from group_buy.cartitem ci
left join group_buy.cart c on ci.cartId = c.cartId
left join group_buy.product p on ci.productId = p.productId
-- where c.isCheckout = 1  
group by p.productId
UNION
select p.productId, p.productName, p.price, p.unit, coalesce(sum( if( c.isCheckout = 1,ci.quantity,0)),0) total_quantity from group_buy.cartitem ci
right join group_buy.cart c on ci.cartId = c.cartId
right join group_buy.product p on ci.productId = p.productId
-- where c.isCheckout = 1  
group by p.productId 
order by total_quantity desc;