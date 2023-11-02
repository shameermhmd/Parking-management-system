create table employee
(
    id        int auto_increment
        primary key,
    username  varchar(100) not null,
    full_name varchar(100) null,
    email     varchar(100) null,
    phone     varchar(20)  null,
    company   varchar(100) null,
    password  varchar(200) not null,
    constraint employee_id_uindex
        unique (id),
    constraint employee_username_uindex
        unique (username)
);

create table alert
(
    id      int auto_increment
        primary key,
    time    datetime     not null,
    message varchar(200) not null,
    `to`    int          null,
    constraint alert_id_uindex
        unique (id),
    constraint alert_employee_id_fk
        foreign key (`to`) references employee (id)
            on delete cascade
);

create table settings
(
    k varchar(100)  not null
        primary key,
    v varchar(1000) not null,
    constraint settings_key_uindex
        unique (k)
);

create table vehicle
(
    id       int auto_increment
        primary key,
    number   varchar(100)                  not null,
    employee int                           not null,
    type     varchar(30) default 'UNKNOWN' not null,
    constraint vehicle_id_uindex
        unique (id),
    constraint vehicle_employee_id_fk
        foreign key (employee) references employee (id)
            on delete cascade
);

create table slot
(
    id       int auto_increment
        primary key,
    name     varchar(20)  not null,
    reserved int          null,
    company  varchar(100) null,
    type     varchar(50)  null,
    constraint slot_id_uindex
        unique (id),
    constraint slot_vehicle_id_fk
        foreign key (reserved) references vehicle (id)
            on delete cascade
);

create table parking
(
    id      int auto_increment
        primary key,
    vehicle int      not null,
    slot    int      not null,
    `from`  datetime not null,
    `to`    datetime null,
    constraint parking_id_uindex
        unique (id),
    constraint parking_slot_id_fk
        foreign key (slot) references slot (id)
            on delete cascade,
    constraint parking_vehicle_id_fk
        foreign key (vehicle) references vehicle (id)
            on delete cascade
);


