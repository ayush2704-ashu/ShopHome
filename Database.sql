-- drop database project;
CREATE DATABASE project;
USE project;
CREATE TABLE IF NOT EXISTS project.cart
(
    user_id bigint NOT NULL,
    CONSTRAINT cart_pkey1 PRIMARY KEY (user_id)
);


CREATE TABLE IF NOT EXISTS project.discount
(
    id character varying(255) NOT NULL,
    status bigint,
    CONSTRAINT discount_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS project.product_category
(
    category_id integer NOT NULL,
    category_name character varying(255) ,
    category_type integer,
    create_time timestamp ,
    update_time timestamp ,
    CONSTRAINT product_category_pkey PRIMARY KEY (category_id),
    CONSTRAINT uk_6kq6iveuim6wd90cxo5bksumw UNIQUE (category_type)
);

ALTER TABLE `project`.`product_category` 
CHANGE COLUMN `category_id` `category_id` INT NOT NULL AUTO_INCREMENT ;


CREATE TABLE IF NOT EXISTS project.product_info
(
    product_id character varying(255)  NOT NULL,
    category_type integer DEFAULT 0,
    create_time timestamp ,
    product_description character varying(255) ,
    product_icon character varying(255) ,
    product_name character varying(255)  NOT NULL,
    product_price numeric(19,2) NOT NULL,
    product_status integer DEFAULT 0,
    product_stock integer NOT NULL,
    update_time timestamp ,
    CONSTRAINT product_info_pkey PRIMARY KEY (product_id),
    CONSTRAINT product_info_product_stock_check CHECK (product_stock >= 0)
);

CREATE TABLE IF NOT EXISTS project.users
(
    id bigint NOT NULL,
    active boolean NOT NULL,
    address character varying(255) ,
    email character varying(255) ,
    name character varying(255) ,
    password character varying(255) ,
    phone character varying(255) ,
    role character varying(255) ,
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT uk_sx468g52bpetvlad2j9y0lptc UNIQUE (email)
);

ALTER TABLE `project`.`users` 
CHANGE COLUMN `id` `id` BIGINT NOT NULL AUTO_INCREMENT ;



CREATE TABLE IF NOT EXISTS project.order_main
(
    order_id bigint NOT NULL,
    buyer_address character varying(255) ,
    buyer_email character varying(255) ,
    buyer_name character varying(255) ,
    buyer_phone character varying(255) ,
    create_time timestamp,
    order_amount numeric(19,2) NOT NULL,
    order_status integer NOT NULL DEFAULT 0,
    update_time timestamp,
    CONSTRAINT order_main_pkey PRIMARY KEY (order_id)
);

ALTER TABLE `project`.`order_main` 
CHANGE COLUMN `order_id` `order_id` BIGINT NOT NULL AUTO_INCREMENT ;



CREATE TABLE IF NOT EXISTS project.product_in_order
(
    id bigint NOT NULL AUTO_INCREMENT,
    category_type integer NOT NULL,
    count integer,
    product_description character varying(255)  NOT NULL,
    product_icon character varying(255) ,
    product_id character varying(255) ,
    product_name character varying(255) ,
    product_price numeric(19,2) NOT NULL,
    product_stock integer,
    cart_user_id bigint,
    order_id bigint,
    CONSTRAINT product_in_order_pkey PRIMARY KEY (id),
    CONSTRAINT fkt0sfj3ffasrift1c4lv3ra85e FOREIGN KEY (order_id)
        REFERENCES project.order_main (order_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT product_cart_fkey FOREIGN KEY (cart_user_id)
        REFERENCES project.cart (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        ,
    CONSTRAINT product_in_order_count_check CHECK (count >= 1),
    CONSTRAINT product_in_order_product_stock_check CHECK (product_stock >= 0)
);



CREATE TABLE IF NOT EXISTS project.wishlist
(
    id bigint NOT NULL AUTO_INCREMENT,
    created_date timestamp ,
    user_id bigint,
    product_id character varying(255),
    CONSTRAINT wishlist_pkey PRIMARY KEY (id),
    CONSTRAINT product_wish_fkey FOREIGN KEY (product_id)
        REFERENCES project.product_info (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT user_wish_Fkey FOREIGN KEY (user_id)
        REFERENCES project.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

ALTER TABLE `project`.`discount`
ADD COLUMN user_email VARCHAR(255);

ALTER TABLE `project`.`discount` 
ADD INDEX `user_email_fkey_idx` (`user_email` ASC);


ALTER TABLE `project`.`discount` 
ADD CONSTRAINT `user_email_fkey`
  FOREIGN KEY (`user_email`)
  REFERENCES `project`.`users` (`email`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  ALTER TABLE `project`.`discount` 
DROP PRIMARY KEY;
;

ALTER TABLE `project`.`discount` 
ADD COLUMN `coupon` VARCHAR(255) NULL AFTER `user_email`,
CHANGE COLUMN `id` `id` BIGINT NOT NULL ,
ADD PRIMARY KEY (`id`);
;

ALTER TABLE `project`.`discount` 
CHANGE COLUMN `id` `id` BIGINT NOT NULL AUTO_INCREMENT ;



INSERT INTO project.product_category VALUES (171, 'STORAGE', 0, '2022-06-23 23:03:26', '2022-06-23 23:03:26');
INSERT INTO project.product_category VALUES (172, 'CARPETS', 1, '2022-06-23 23:03:26', '2022-06-23 23:03:26');
INSERT INTO project.product_category VALUES (173, 'GARDEN', 2, '2022-06-23 23:03:26', '2022-06-23 23:03:26');
INSERT INTO project.product_category VALUES (174, 'SOFAS & RECLINERS', 3, '2022-06-23 23:03:26', '2022-06-23 23:03:26');
INSERT INTO project.product_category VALUES (175, 'DINING AND BAR', 4, '2022-06-23 23:03:26', '2022-06-23 23:03:26');


INSERT INTO project.product_info VALUES ('IP001', 0, '2022-06-23 23:03:26', 'Modern Book Case is used to store books for usage of space efficiently', 'https://ii2.pepperfry.com/media/wysiwyg/banners/Web_Storage_NewArrivalBlock_1_2x_29042022.jpg', 'Modern Book Case', 2500.0, 0, 32, '2022-06-23 23:03:26');
INSERT INTO project.product_info VALUES ('IP002', 0, '2022-06-23 23:03:26', 'This wall decor and corner shelf come with a unique design that fits perfectly on your home and office walls.', 'https://ii3.pepperfry.com/media/wysiwyg/banners/Web_Storage_NewArrivalBlock_2_2x_29042022.jpg', 'Wenge Engineered Wood Javies Cubical Wall Shelf', 1899.0, 0, 60, '2022-06-23 23:03:26');
INSERT INTO project.product_info VALUES ('IP003', 0, '2022-06-23 23:03:26', 'These sleek and sturdy shoe racks which are easily accessible with tilted drop-down front doors which assist in viewing your shoes at once. ', 'https://ii1.pepperfry.com/media/wysiwyg/banners/Web_Storage_NewArrivalBlock_3_2x_29042022.jpg', 'Alder Tilt Out Shoe Rack in Walnut Colour', 6990.0, 0, 26, '2022-06-23 23:03:26');

INSERT INTO project.product_info VALUES ('FL001', 1, '2022-06-23 23:03:26', 'Add to the beauty of your interior decor with a Practical and High Quality mats from Saral Home. ','https://ii1.pepperfry.com/media/catalog/product/b/l/800x880/blue-cotton-abstract-2-6-x-1-6-feet-dhurrie-set-of-2-by-saral-home-blue-cotton-abstract-2-6-x-1-6-fe-9wv4yp.jpg', 'Blue Cotton Abstract 2.6 x 1.6 Feet Dhurrie Set of 2', 153.00, 0, 24, '2022-06-23 23:03:26');
INSERT INTO project.product_info VALUES ('FL002', 1, '2022-06-23 23:03:26', 'Placemats and Carpets to Functional Bedsheet Quilts and Yogamats, each product is designed keeping your convenience in mind.', 'https://ii1.pepperfry.com/media/catalog/product/b/r/800x880/brown-microfiber-striped-anti-skid-rubber-latex-backing--bedside-runner-by-saral-home-brown-microfib-jwmzor.jpg', 'Brown Microfiber Striped Anti-Skid Rubber Latex Backing Bedside Runner', 552.00, 0, 32, '2022-06-23 23:03:26');
INSERT INTO project.product_info VALUES ('FL003', 1, '2022-06-23 23:03:26', 'Give a modern touch to your home decor by decorating the floors with these stylish floor runners. Made of superior quality materials, these floor runners are durable and will elevate the rich look of your home.', 'https://ii1.pepperfry.com/media/catalog/product/g/e/800x880/geometrical-pattern-polyester-5-x-2-feet-machine-made-bedside-runner-geometrical-pattern-polyester-5-g9utwj.jpg', 'Oriental Pattern Polyester 5 x 2 Feet Machine Made Bedside Runner', 455.00, 0, 50, '2022-06-23 23:03:26');


INSERT INTO project.product_info VALUES ('MC001', 2, '2022-06-23 23:03:26', 'Redecorate your living space in an innovative way with these beautiful and charming pebbles. Place them in a bowl or platter to enhance the look of your home. Offering a natural look to your home.', 'https://ii1.pepperfry.com/media/catalog/product/m/u/800x880/multicolour-stone-decorative-pebbles-chips-by-stone-and-beyond-multicolour-stone-decorative-pebbles--gspje7.jpg', 'Brown 1 Kg Decorative River Pebbles', 173.00, 0, 45, '2022-06-23 23:03:26');
INSERT INTO project.product_info VALUES ('MC002', 2, '2022-06-23 23:03:26', 'High temperature fired ceramic. Handmade item, glazed to give it shiny look. Top quality clay gives this item more durability, longevity & smooth finish. Suitable for Indian climate & conditions. ', 'https://ii1.pepperfry.com/media/catalog/product/g/r/800x880/green-ceramic-owl-shape-big-planter-by-justoriginals-green-ceramic-owl-shape-big-planter-by-justorig-hfffws.jpg', 'Green Ceramic Owl Shape Big Planter', 157.00, 0, 53, '2022-06-23 23:03:26');
INSERT INTO project.product_info VALUES ('MC003', 2, '2022-06-23 23:03:26', 'Nestasia is an online home decor and tableware brand which aims to provide a high variety of novel and affordable products to its lovely customers. ', 'https://ii1.pepperfry.com/media/catalog/product/b/o/800x880/book-resin-planter-by-nestasia-book-resin-planter-by-nestasia-rehniw.jpg', 'Book Resin Planter', 790.00, 0, 70, '2022-06-23 23:03:26');


INSERT INTO project.product_info VALUES ('MR001', 3, '2022-06-23 23:03:26', 'Febonic range of sofa set brings impeccable aesthetics and design value to your interiors. It is made with finest fabric and takes hours of craftsmanship before we ship it to our beloved customers.', 'https://ii1.pepperfry.com/media/catalog/product/l/a/800x880/ladybug-1-seater-sofa-in-sea-green-by-febonic-ladybug-1-seater-sofa-in-sea-green-by-febonic-eb7ecu.jpg', 'Ladybug 1 Seater Sofa In Sea Green Colour', 18575.00, 0, 39, '2022-06-23 23:03:26');
INSERT INTO project.product_info VALUES ('MR002', 3, '2022-06-23 23:03:26', 'Bantia Furniture most trusted company is in the business for last 65 years. Bantia Furnitures has become synonymous with quality because of consistent endeavor and personal sourcing coupled with attractive prices', 'https://ii1.pepperfry.com/media/catalog/product/v/e/800x880/ventor-manual-pushback-recliner-in-blue-colour-by-bantia-furniture-ventor-manual-pushback-recliner-i-o6edqa.jpg', 'Ventor Manual Pushback Recliner in Blue Colour', 14899.00, 0, 75, '2022-06-23 23:03:26');
INSERT INTO project.product_info VALUES ('MR003', 3, '2022-06-23 23:03:26', 'Febonic range of sofa set brings impeccable aesthetics and design value to your interiors. It is made with finest fabric and takes hours of craftsmanship before we ship it to our beloved customers.', 'https://ii1.pepperfry.com/media/catalog/product/l/a/800x400/ladybug-sofa-in-maroon-colour-by-febonic-ladybug-sofa-in-maroon-colour-by-febonic-bbxzyh.jpg', 'Ladybug 3 Seater Sofa In Maroon Colour ', 27861.00, 0, 8, '2022-06-23 23:03:26');



INSERT INTO project.product_info VALUES ('WB001', 4, '2022-06-23 23:03:26', 'Enhance your serveware collection with this handcrafted bowl. This ceramic bowl can be used to serve dessert/curries/soups. It is handcrafted and each piece is unique.', 'https://ii1.pepperfry.com/media/catalog/product/h/a/800x880/handcrafted-ceramic-bowl--set-of-2--by-turkish-clay-handcrafted-ceramic-bowl--set-of-2--by-turkish-c-exbllx.jpg', 'Handcrafted Ceramic Bowl (Set of 2)', 399.0, 0, 23, '2022-06-23 23:03:26');
INSERT INTO project.product_info VALUES ('WB002', 4, '2022-06-23 23:03:26', 'Conceptualized in a Dream & Visualized into Verity, NestRoots is a Dream House of Design, Aesthetics & Elegance. Here, we do what we Love & Love what we do, its who we are.', 'https://ii1.pepperfry.com/media/catalog/product/p/i/800x880/pilat-mango-wood-spice-box-by-nestroots-pilat-mango-wood-spice-box-by-nestroots-qnxn95.jpg', 'Pilat Mango Wood Spice Box', 1949.0, 0, 31, '2022-06-23 23:03:26');
INSERT INTO project.product_info VALUES ('WB003', 4, '2022-06-23 23:03:26', 'Glass water bottles not only keep water deliciously fresh and cool, they are superior to a collapsible water bottle they wont leak or puncture.', 'https://ii1.pepperfry.com/media/catalog/product/d/e/800x880/deep-sea-blue-glass-1-ltr-bottle-by-femora-deep-sea-blue-glass-1-ltr-bottle-by-femora-vzbbr8.jpg', 'Deep Sea Blue Glass 1 Ltr Bottle', 349.0, 0, 16, '2022-06-23 23:03:26');
INSERT INTO project.product_info VALUES ('WB004', 4, '2022-06-23 23:03:26', 'Made with high quality stainless steel so it will last a lifetime with excellent quality fittings which wont fall off. Double-wall construction keeps cold inside and prevents outer condensation. Ice lasts for over 6hrs. ', 'https://ii1.pepperfry.com/media/catalog/product/s/i/800x880/silver-tone-stainless-steel-ice-scoop-by-nestroots-silver-tone-stainless-steel-ice-scoop-by-nestroot-ofzidc.jpg', 'Silver Tone Stainless Steel Ice Bucket with Tong', 1514.0, 0, 18, '2022-06-23 23:03:26');
INSERT INTO project.product_info VALUES ('WB005', 4, '2022-06-23 23:03:26', 'At Clay Craft we manufacture ceramic crockery in a variety of styles, sizes, and colours. We supply fine tableware crockery. Our line of products can be used for special occasions and everyday dining, too.', 'https://ii1.pepperfry.com/media/catalog/product/p/r/800x880/premium-180ml--set-of-12--ceramic-cup---saucer-by-clay-craft-premium-180ml--set-of-12--ceramic-cup---d0iqmf.jpg', 'Premium 180ml (Set of 12) Ceramic Cup & Saucer', 1529.0, 0, 9, '2022-06-23 23:03:26');
INSERT INTO project.product_info VALUES ('WB006', 4, '2022-06-23 23:03:26', 'Nestasia is an online home decor and tableware brand which aims to provide a high variety of novel and affordable products to its lovely customers.', 'https://ii1.pepperfry.com/media/catalog/product/p/i/800x880/pink-dots-ceramic-baking-plate-by-nestasia-pink-dots-ceramic-baking-plate-by-nestasia-oydnos.jpg', 'Pink Dots Ceramic Baking Plate', 720.0, 0, 19, '2022-06-23 23:03:26');

INSERT INTO project.users VALUES (6518, true, 'Hyderabad', 'admin@b4.com', 'ADMIN', '$2a$10$LiBwO43TpKU0sZgCxNkWJueq2lqxoUBsX2Wclzk8JQ3Ejb9MWu2Xy', '7171717171', 'ROLE_MANAGER');