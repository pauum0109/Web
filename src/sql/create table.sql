create table
    account (
        user_id int not null primary key,
        username varchar(50) not null,
        user_password varchar(50) not null,
        user_email varchar(50) not null,
        created_at date default (curdate ()) null,
        constraint user_email_unique unique (user_email)
    );

create table
    article (
        article_id int not null primary key,
        title varchar(100) null,
        content text null,
        image varchar(100) null
    );

create table
    category (
        category_id varchar(20) not null primary key,
        category_name varchar(20) not null,
        category_image varchar(20) null,
        constraint category_name unique (category_name)
    );

create table
    district (
        district_id varchar(20) not null primary key,
        district_name varchar(20) not null,
        constraint district_name unique (district_name)
    );

create table
    otp (
        user_id int not null primary key,
        otp varchar(50) not null,
        created_at timestamp default CURRENT_TIMESTAMP null,
        constraint otp_ibfk_1 foreign key (user_id) references account (user_id)
    );

create table
    restaurant (
        restaurant_id int not null primary key,
        restaurant_name varchar(100) null,
        restaurant_district varchar(20) null,
        restaurant_address varchar(100) null,
        restaurant_image varchar(100) null,
        phone_number varchar(12) null,
        open_time time null,
        close_time time null,
        constraint restaurant_category_district foreign key (restaurant_district) references district (district_id)
    );

create table
    restaurant_category (
        restaurant_id int not null,
        category_id varchar(20) not null,
        primary key (restaurant_id, category_id),
        constraint restaurant_category_ibfk_1 foreign key (restaurant_id) references restaurant (restaurant_id),
        constraint restaurant_category_ibfk_2 foreign key (category_id) references category (category_id)
    );