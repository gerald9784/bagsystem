-- download mysqlworkbench and import and run this file
drop database if exists bagsystem;
create database bagsystem;
use bagsystem;

create table `users`(
	`id` integer not null auto_increment,
    `first_name` varchar(20) not null,
    `last_name`  varchar(20) not null,
	`username`  varchar(20) not null unique,
	`profile_img` varchar(255) default null,
	`password`  varchar(250) not null,
	`date_updated` datetime on update current_timestamp,
	`date_created` datetime default NOW(),
    primary key(`id`)
)engine= InnoDB default charset = utf8mb4 collate= utf8mb4_0900_as_cs;

create table `groups` (
	`id` integer not null auto_increment,
    `name`  varchar(20) unique not null,
	`created_by` int not null,
	`date_updated` datetime on update current_timestamp,
	`date_created` datetime default NOW(),
	foreign key(`created_by`) references `users`(`id`),
	primary key(`id`)
)engine= InnoDB default charset = utf8mb4 collate= utf8mb4_0900_as_cs;

create table `user_groups`(
	`id`	integer not null auto_increment,
	`user_id` int not null,
	`group_id` int not null,
	primary key(`id`),
    foreign key(`user_id`) references users(`id`),
	foreign key(`group_id`) references `groups`(`id`)
)engine= InnoDB default charset = utf8mb4 collate= utf8mb4_0900_as_cs;

create table `permissions` (
	`id` integer not null auto_increment,
	`name` varchar(255) unique not null,
	`created_by` int not null,
	`date_updated` datetime on update current_timestamp,
	`date_created` datetime default NOW(),
    foreign key(`created_by`) references `users`(`id`),
	primary key(`id`)
)engine= InnoDB default charset = utf8mb4 collate= utf8mb4_0900_as_cs;

create table `groups_permissions`(
	`id`	integer not null auto_increment,
	`group_id` int not null,
	`permission_id` int not null,
	primary key(`id`),
    foreign key(`permission_id`) references permissions(`id`),
	foreign key(`group_id`) references `groups`(`id`)
)engine= InnoDB default charset = utf8mb4 collate= utf8mb4_0900_as_cs;

create table `products` (
 	`id` integer not null auto_increment,
    `name`  varchar(20) not null unique,
    `description` text not null,
    `image` varchar(255) default null,
	`added_by` int not null,
    `updated_by` int default null,
    `date_updated` datetime on update current_timestamp,
    `date_created` datetime default NOW(),
    foreign key(`added_by`) references `users`(`id`),
	foreign key(`updated_by`) references `users`(`id`),
    primary key(`id`)
)engine= InnoDB default charset = utf8mb4 collate= utf8mb4_0900_as_cs;

create table `stock` (
 	`id` integer not null auto_increment,
    `product_id` integer not null,
	`quantity` integer not null,
    `buying_price` float not null,
	`added_by` int not null,
	`updated_by` int default null,
    `date_updated` datetime on update current_timestamp,
    `date_created` datetime default NOW(),
    primary key(`id`),
	foreign key(`added_by`) references `users`(`id`),
	foreign key(`updated_by`) references `users`(`id`),
    foreign key(`product_id`) references products(`id`)
)engine= InnoDB default charset = utf8mb4 collate= utf8mb4_0900_as_cs;

create table `colors` (
 	`id` integer not null auto_increment,
    `name`  varchar(20) not null,	
    `quantity` integer not null,
    `stock_id` integer not null,
	`image` varchar(255) default null,
	`added_by` int not null,
	`updated_by` int default null,
    `date_updated` datetime on update current_timestamp,
    `date_created` datetime default NOW(),
    primary key(`id`),
	foreign key(`added_by`) references `users`(`id`),
	foreign key(`updated_by`) references `users`(`id`),
    foreign key(`stock_id`) references stock(`id`)
)engine= InnoDB default charset = utf8mb4 collate= utf8mb4_0900_as_cs;

create table `sizes` (
 	`id` integer not null auto_increment,
    `name`  varchar(20) not null,
    `quantity` integer not null,
    `stock_id` integer not null,
	`image` varchar(255) default null,
	`added_by` int not null,
	`updated_by` int default null,
    `date_updated` datetime on update current_timestamp,
    `date_created` datetime default NOW(),
    primary key(`id`),
	foreign key(`added_by`) references `users`(`id`),
	foreign key(`updated_by`) references `users`(`id`),
    foreign key(`stock_id`) references stock(`id`)
)engine= InnoDB default charset = utf8mb4 collate= utf8mb4_0900_as_cs;

create table transactions(
	`id` integer not null auto_increment,
	`stock_id` integer not null,
    `color_id` int not null,
    `size_id` int not null,
	`quantity` integer default null,
    `buying_price` float not null,
    `selling_price` float not null,
	`added_by` int not null,
	`updated_by` int default null,
	`date_updated` datetime on update current_timestamp,
	`date_created` datetime default NOW(),
	primary key(`id`),
	foreign key(`added_by`) references `users`(`id`),
	foreign key(`updated_by`) references `users`(`id`),
	foreign key(`stock_id`) references stock(`id`)
)engine= InnoDB default charset = utf8mb4 collate= utf8mb4_0900_as_cs; 

create view stock_list as select products.name as product_name, products.description as product_description, stock.quantity as quantity, stock.buying_price as buying_price, colors.name as color_name, colors.quantity as color_quantity, sizes.name as size_name, sizes.quantity as size_quantity, stock.date_updated as date_updated,stock.date_created as date_created from stock inner join products on stock.product_id = products.id inner join colors on colors.stock_id = stock.id inner join sizes on sizes.stock_id = stock.id;