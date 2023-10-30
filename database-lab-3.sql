/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2023/10/20 20:33:35                          */
/*==============================================================*/




/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   admin_id             int not null,
   admin_name           varchar(16) not null,
   admin_pwd            varchar(16) not null,
   primary key (admin_id)
);

insert admin (admin_id, admin_name, admin_pwd)
values (1, 'root', '1234');

/*==============================================================*/
/* Table: an_order                                              */
/*==============================================================*/
create table an_order
(
   order_id             int not null AUTO_INCREMENT,
   user_id              int not null,
   order_time           timestamp not null default current_timestamp on update current_timestamp,
   /* payment              decimal(5,1) not null, */
   item_id              int not null,
   store_id             int not null,
   modified_time        timestamp not null default current_timestamp on update current_timestamp,
   primary key (order_id)
);

create table order_states
(
   order_id    int not null,
   order_state int not null,
   primary key (order_id)
);

/*==============================================================*/
/* Table: canteen                                               */
/*==============================================================*/
create table canteen
(
   canteen_id           int not null AUTO_INCREMENT,
   addr                 varchar(16) not null,
   canteen_name         varchar(16) not null,
   primary key (canteen_id)
);

insert canteen (addr, canteen_name)
values ('大概在东边', '一食堂');
insert canteen (addr, canteen_name)
values ('大概在西边', '二食堂');
insert canteen (addr, canteen_name)
values ('大概在南边', '四食堂');

/*==============================================================*/
/* Table: store                                                 */
/*==============================================================*/
create table store
(
   store_id             int not null,
   store_name           varchar(16) not null,
   canteen_id           int not null,
   floor                int not null,
   primary key (store_id)
);

insert store (store_id, store_name, canteen_id, floor)
values (1, '包子铺', 1, 1);
insert store (store_id, store_name, canteen_id, floor)
values (2, '烤冷面', 1, 1);
insert store (store_id, store_name, canteen_id, floor)
values (3, '猪肚鸡', 1, 1);

insert store (store_id, store_name, canteen_id, floor)
values (4, '小炒菜', 2, 3);

insert store (store_id, store_name, canteen_id, floor)
values (5, '东北菜', 3, 3);
insert store (store_id, store_name, canteen_id, floor)
values (6, '木桶饭', 3, 3);



/*==============================================================*/
/* Table: item                                                  */
/*==============================================================*/
create table item
(
   item_id              int not null AUTO_INCREMENT,
   item_name            varchar(16) not null,
   description          varchar(32),
   store_id             int not null,
   price                smallint not null,
   is_available         bool not null,
   primary key (item_id)
);

insert item (item_name, description, store_id, price, is_available)
values ('鸡腿包', '未必真是鸡腿, 但是很便宜', 1, 2, true);
insert item (item_name, description, store_id, price, is_available)
values ('茄子包', '有点咸, 但是很便宜', 1, 2, true);
insert item (item_name, description, store_id, price, is_available)
values ('卤肉包', '靠谱, 但是相对贵一点', 1, 3, true);
insert item (item_name, description, store_id, price, is_available)

values ('没料的冷面', '加料不多', 2, 12, true);
insert item (item_name, description, store_id, price, is_available)
values ('加了料的冷面', '加料一般', 2, 16, true);
insert item (item_name, description, store_id, price, is_available)
values ('加了很多料的冷面', '加了很多料', 2, 20, true);

insert item (item_name, description, store_id, price, is_available)
values ('猪肚鸡经典款', '经典款, 也即原味', 3, 15, true);
insert item (item_name, description, store_id, price, is_available)
values ('猪肚鸡酸甜款', '酸甜款, 也即酸甜味', 3, 16, true);

insert item (item_name, description, store_id, price, is_available)
values ('荷包蛋炒饭', '有可能吃不饱', 4, 12, true);
insert item (item_name, description, store_id, price, is_available)
values ('烧茄子', '内有致命的青椒, 小心食用', 4, 16, true);
insert item (item_name, description, store_id, price, is_available)
values ('土豆牛腩', '牛腩可以帮助你锻炼咀嚼肌', 4, 20, true);

insert item (item_name, description, store_id, price, is_available)
values ('肉段茄子', '里面肉段尝起来不像肉', 5, 16, true);
insert item (item_name, description, store_id, price, is_available)
values ('肉末茄子', '内有致命的青椒, 小心食用', 5, 16, true);
insert item (item_name, description, store_id, price, is_available)
values ('里脊肉沫炒饭', '尝不出什么里脊肉', 5, 17, true);

insert item (item_name, description, store_id, price, is_available)
values ('青椒肉丝', '内有大量致命的青椒, 请小心食用', 6, 17, true);
insert item (item_name, description, store_id, price, is_available)
values ('包菜', '有点咸', 6, 17, true);

/*==============================================================*/
/* Table: item_order                                            */
/*==============================================================*/
create table item_order
(
   order_id             int not null,
   item_id              int not null,
   primary key (order_id, item_id)
);

/*==============================================================*/
/* Table: review                                                */
/*==============================================================*/
create table review
(
   review_id            int not null AUTO_INCREMENT,
   order_id             int not null,
   rate                 int not null,
   content              varchar(32),
   primary key (review_id)
);


/*==============================================================*/
/* Table: users                                                 */
/*==============================================================*/
create table users
(
   user_id              int not null AUTO_INCREMENT,
   user_name            varchar(16) not null,
   user_pwd             varchar(16) not null,
   primary key (user_id)
);

alter table users comment 'Note that the user pwd is now 16 character long.';
insert users (user_name, user_pwd)
values ('newbie', '1234');
insert users (user_name, user_pwd)
values ('root', 'zhrmghgws1');

/*==============================================================*/
/* View: View_2                                                 */
/*==============================================================*/

create view  View_2
 as
select s.store_name, r.content, r.rate, c.canteen_id
from review as r
inner join an_order as o on r.order_id = o.order_id
inner join store as s on o.store_id = s.store_id
inner join canteen as c on c.canteen_id = s.canteen_id;

alter table an_order add constraint FK_order_store foreign key (store_id)
      references store (store_id) on delete restrict on update restrict;

alter table an_order add constraint FK_user_order foreign key (user_id)
      references users (user_id) on delete restrict on update restrict;

alter table item_order add constraint FK_item_order foreign key (order_id)
      references an_order (order_id) on delete restrict on update restrict;

alter table item_order add constraint FK_order_item foreign key (item_id)
      references item (item_id) on delete restrict on update restrict;

alter table review add constraint FK_order_review foreign key (order_id)
      references an_order (order_id) on delete restrict on update restrict;

alter table store add constraint FK_canteen_store foreign key (canteen_id)
      references canteen (canteen_id) on delete restrict on update restrict;


delimiter $$
create procedure getCanteenReview (in canteen_id int)
begin
   select * from View_2 where View_2.canteen_id = canteen_id;
end $$
delimiter ;


delimiter $$
create trigger after_order_inserted
after insert on an_order
for each row
begin 
	insert item_order (order_id, item_id)
   values (new.order_id, new.item_id);
   insert order_states (order_id, order_state)
   values (new.order_id, 0);
end $$
delimiter ;