create table completed_orders
(
    id             uuid not null,
    comment        varchar(255),
    date_end       timestamp,
    date_start     timestamp,
    number_order   int4 not null,
    manager_id     uuid,
    object_name_id uuid,
    primary key (id)
);
create table completed_orders_detail_infos
(
    completed_order_id uuid not null,
    detail_infos_id    uuid not null
);
create table contragents
(
    id   uuid not null,
    name varchar(255),
    primary key (id)
);
create table detail_info
(
    id         uuid not null,
    count      int4 not null,
    date_end   timestamp,
    date_start timestamp,
    increment  int4 not null,
    detail_id  uuid,
    primary key (id)
);
create table detail_info_is_calculated
(
    detail_info_id uuid not null,
    is_calculated  boolean
);
create table details
(
    id          uuid not null,
    length      varchar(255),
    name        varchar(255),
    width       varchar(255),
    material_id uuid,
    primary key (id)
);
create table details_time_work_details
(
    detail_id            uuid not null,
    time_work_details_id uuid not null
);
create table details_work_benches
(
    detail_id       uuid not null,
    work_benches_id uuid not null
);
create table managers
(
    id        uuid not null,
    fio       varchar(255),
    fio_i_o   varchar(255),
    last_name varchar(255),
    name      varchar(255),
    primary key (id)
);
create table materials
(
    id        uuid not null,
    name      varchar(255),
    thickness varchar(255),
    primary key (id)
);
create table orders
(
    id             uuid not null,
    comment        varchar(255),
    date_end       timestamp,
    date_start     timestamp,
    number_order   int4 not null,
    packing        varchar(255),
    painting       varchar(255),
    manager_id     uuid,
    object_name_id uuid,
    user_id        uuid,
    primary key (id)
);
create table orders_detail_infos
(
    order_id        uuid not null,
    detail_infos_id uuid not null
);
create table roles
(
    id   uuid not null,
    name varchar(255),
    primary key (id)
);
create table subsequence_type_operation
(
    id          uuid not null,
    description varchar(255),
    primary key (id)
);
create table subsequence_type_operation_type_operations
(
    subsequence_type_operation_id uuid not null,
    type_operations_id            uuid not null
);
create table timeworkdetail
(
    id        uuid not null,
    time_work varchar(255),
    primary key (id)
);
create table type_operation
(
    id   uuid not null,
    name varchar(255),
    primary key (id)
);
create table type_operation_work_benches
(
    type_operation_id uuid not null,
    work_benches_id   uuid not null
);
create table users
(
    id        uuid not null,
    fio       varchar(255),
    fio_i_o   varchar(255),
    last_name varchar(255),
    name      varchar(255),
    password  varchar(255),
    username  varchar(255),
    primary key (id)
);
create table users_roles
(
    user_id  uuid not null,
    roles_id uuid not null
);
create table workbench
(
    id                uuid not null,
    date_end_detail   timestamp,
    name              varchar(255),
    type_operation_id uuid,
    primary key (id)
);
alter table if exists details_time_work_details
    add constraint UK_k1awwoq79pjoc3lhmj6wm7ywt unique (time_work_details_id);
alter table if exists type_operation_work_benches
    add constraint UK_oov9sv06v8kb7gywqqmcsbk3p unique (work_benches_id);
alter table if exists completed_orders
    add constraint FKk7v87ic1bdy15w6uixoijmp1s foreign key (manager_id) references managers;
alter table if exists completed_orders
    add constraint FK66pn2bog0lt454xfy3md1h5wg foreign key (object_name_id) references contragents;
alter table if exists completed_orders_detail_infos
    add constraint FK3esh8svr7cruatn0e5h7mc655 foreign key (detail_infos_id) references detail_info;
alter table if exists completed_orders_detail_infos
    add constraint FKh5w58l9fgl79d67uen6bd7783 foreign key (completed_order_id) references completed_orders;
alter table if exists detail_info
    add constraint FKnqq4t3gkdara6xg7vtwwwpvn9 foreign key (detail_id) references details;
alter table if exists detail_info_is_calculated
    add constraint FK7wo51dcvk8t9x1hrsxg6laeht foreign key (detail_info_id) references detail_info;
alter table if exists details
    add constraint FK1jpc8m60b3hyb5ns1kr3ef7bd foreign key (material_id) references materials;
alter table if exists details_time_work_details
    add constraint FKedknbp9b8ibs4wx3qd8o0e8q2 foreign key (time_work_details_id) references timeworkdetail;
alter table if exists details_time_work_details
    add constraint FKmuoge69nafu4pdylw1y6epre7 foreign key (detail_id) references details;
alter table if exists details_work_benches
    add constraint FK8jdodx1vieg4syf1sophdk6ax foreign key (work_benches_id) references workbench;
alter table if exists details_work_benches
    add constraint FKsvmr0fc0rikjftfoww7hdhu38 foreign key (detail_id) references details;
alter table if exists orders
    add constraint FK3kb98kmk1xemhxbjomoaec280 foreign key (manager_id) references managers;
alter table if exists orders
    add constraint FKk6on0fnwea31l3wrd9b79xp8d foreign key (object_name_id) references contragents;
alter table if exists orders
    add constraint FK32ql8ubntj5uh44ph9659tiih foreign key (user_id) references users;
alter table if exists orders_detail_infos
    add constraint FKl6237nwuhhkvy4hks3g1tjqpw foreign key (detail_infos_id) references detail_info;
alter table if exists orders_detail_infos
    add constraint FKqj504uagpcgjy09pyr29jwlv5 foreign key (order_id) references orders;
alter table if exists subsequence_type_operation_type_operations
    add constraint FKa2yj42k8v6xhjs70lgeooh4fw foreign key (type_operations_id) references type_operation;
alter table if exists subsequence_type_operation_type_operations
    add constraint FK7a0eostc2gb0towge7kvt6ue0 foreign key (subsequence_type_operation_id) references subsequence_type_operation;
alter table if exists type_operation_work_benches
    add constraint FKdch5g4u2qwf1m7jrbtmq2xwbu foreign key (work_benches_id) references workbench;
alter table if exists type_operation_work_benches
    add constraint FKqr8cns76k4nit8p9q5070urk6 foreign key (type_operation_id) references type_operation;
alter table if exists users_roles
    add constraint FKa62j07k5mhgifpp955h37ponj foreign key (roles_id) references roles;
alter table if exists users_roles
    add constraint FK2o0jvgh89lemvvo17cbqvdxaa foreign key (user_id) references users;
alter table if exists workbench
    add constraint FKwm0qawryp7tsjj64o66udkgo foreign key (type_operation_id) references type_operation;
