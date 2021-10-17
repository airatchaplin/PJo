create table completed_orders
(
    id               uuid    not null,
    comment          varchar(255),
    date_end_order   timestamp,
    date_start_order timestamp,
    increment        int8    not null,
    is_calculated    boolean not null,
    number_order     int4    not null,
    packing          varchar(255),
    painting         varchar(255),
    update_date      timestamp,
    economist_id     uuid,
    manager_id       uuid,
    object_name_id   uuid,
    primary key (id)
);
create table completed_orders_details_orders
(
    completed_order_id uuid not null,
    details_orders_id  uuid not null
);
create table completed_detail_date_by_workbench
(
    id                uuid    not null,
    detail_date_end   timestamp,
    detail_date_start timestamp,
    is_setting        boolean not null,
    priority          int4    not null,
    work_bench_id     uuid,
    primary key (id)
);
create table completed_detail_order
(
    id           uuid not null,
    name         varchar(255),
    time_packing varchar(255),
    material_id  uuid,
    primary key (id)
);
create table completed_detail_order_detail_order_lists
(
    completed_detail_order_id uuid not null,
    detail_order_lists_id     uuid not null
);
create table completed_detail_order_info
(
    id              uuid    not null,
    comment         varchar(255),
    is_setting      boolean not null,
    priority        int4    not null,
    time_work       varchar(255),
    work_benches_id uuid,
    primary key (id)
);
create table completed_detail_order_list
(
    id                  uuid    not null,
    is_selected         boolean not null,
    main_or_alternative int4    not null,
    primary key (id)
);
create table completed_detail_order_list_detail_date_by_workbench
(
    completed_detail_order_list_id uuid not null,
    detail_date_by_workbench_id    uuid not null
);
create table completed_detail_order_list_detail_order_infos
(
    completed_detail_order_list_id uuid not null,
    detail_order_infos_id          uuid not null
);
create table completed_details_order
(
    id              uuid not null,
    count           int4 not null,
    increment       int4 not null,
    detail_order_id uuid,
    primary key (id)
);
create table contragents
(
    id   uuid not null,
    name varchar(255),
    primary key (id)
);
create table detail_date_by_workbench
(
    id                uuid    not null,
    detail_date_end   timestamp,
    detail_date_start timestamp,
    is_setting        boolean not null,
    priority          int4    not null,
    work_bench_id     uuid,
    primary key (id)
);
create table detail_info
(
    id              uuid not null,
    comment         varchar(255),
    priority        int4 not null,
    time_work       varchar(255),
    work_benches_id uuid,
    primary key (id)
);
create table detail_list
(
    id                  uuid    not null,
    is_selected         boolean not null,
    main_or_alternative int4    not null,
    primary key (id)
);
create table detail_list_detail_infos
(
    detail_list_id  uuid not null,
    detail_infos_id uuid not null
);
create table detail_order
(
    id           uuid not null,
    name         varchar(255),
    time_packing varchar(255),
    material_id  uuid,
    primary key (id)
);
create table detail_order_detail_order_lists
(
    detail_order_id       uuid not null,
    detail_order_lists_id uuid not null
);
create table detail_order_info
(
    id              uuid    not null,
    comment         varchar(255),
    is_setting      boolean not null,
    priority        int4    not null,
    time_work       varchar(255),
    work_benches_id uuid,
    primary key (id)
);
create table detail_order_list
(
    id                  uuid    not null,
    is_selected         boolean not null,
    main_or_alternative int4    not null,
    primary key (id)
);
create table detail_order_list_detail_date_by_workbench
(
    detail_order_list_id        uuid not null,
    detail_date_by_workbench_id uuid not null
);
create table detail_order_list_detail_order_infos
(
    detail_order_list_id  uuid not null,
    detail_order_infos_id uuid not null
);
create table details
(
    id           uuid not null,
    name         varchar(255),
    time_packing varchar(255),
    material_id  uuid,
    primary key (id)
);
create table details_detail_lists
(
    detail_id       uuid not null,
    detail_lists_id uuid not null
);
create table details_order
(
    id              uuid not null,
    count           int4 not null,
    increment       int4 not null,
    detail_order_id uuid,
    primary key (id)
);
create table materials
(
    id        uuid not null,
    name      varchar(255),
    thickness float8,
    primary key (id)
);
create table old_detail_date_by_workbench
(
    id                uuid    not null,
    detail_date_end   timestamp,
    detail_date_start timestamp,
    is_setting        boolean not null,
    priority          int4    not null,
    work_bench_id     uuid,
    primary key (id)
);
create table old_detail_order
(
    id           uuid not null,
    name         varchar(255),
    time_packing varchar(255),
    material_id  uuid,
    primary key (id)
);
create table old_detail_order_detail_order_lists
(
    old_detail_order_id   uuid not null,
    detail_order_lists_id uuid not null
);
create table old_detail_order_info
(
    id              uuid    not null,
    comment         varchar(255),
    is_setting      boolean not null,
    priority        int4    not null,
    time_work       varchar(255),
    work_benches_id uuid,
    primary key (id)
);
create table old_detail_order_list
(
    id                  uuid    not null,
    is_selected         boolean not null,
    main_or_alternative int4    not null,
    primary key (id)
);
create table old_detail_order_list_detail_date_by_workbench
(
    old_detail_order_list_id    uuid not null,
    detail_date_by_workbench_id uuid not null
);
create table old_detail_order_list_detail_order_infos
(
    old_detail_order_list_id uuid not null,
    detail_order_infos_id    uuid not null
);
create table old_details_order
(
    id              uuid not null,
    count           int4 not null,
    increment       int4 not null,
    detail_order_id uuid,
    primary key (id)
);
create table old_order
(
    id               uuid    not null,
    comment          varchar(255),
    date_end_order   timestamp,
    date_start_order timestamp,
    is_calculated    boolean not null,
    number_order     int4    not null,
    order_id         uuid,
    packing          varchar(255),
    painting         varchar(255),
    economist_id     uuid,
    manager_id       uuid,
    object_name_id   uuid,
    primary key (id)
);
create table old_order_details_orders
(
    old_order_id      uuid not null,
    details_orders_id uuid not null
);
create table old_work_bench
(
    id                uuid not null,
    current_thickness float8,
    date_end_detail   timestamp,
    id_workbench      uuid,
    name              varchar(255),
    type_operation_id uuid,
    primary key (id)
);
create table orders
(
    id                        uuid    not null,
    comment                   varchar(255),
    date_end_order            timestamp,
    date_start_order          timestamp,
    date_end_first_package    timestamp,
    date_start_first_package  timestamp,
    date_end_second_package   timestamp,
    date_start_second_package timestamp,
    date_end_painting         timestamp,
    date_start_painting       timestamp,
    date_end                  timestamp,
    increment                 int8    not null,
    is_calculated             boolean not null,
    number_order              int4    not null,
    packing                   varchar(255),
    painting                  varchar(255),
    economist_id              uuid,
    manager_id                uuid,
    object_name_id            uuid,
    primary key (id)
);
create table orders_details_orders
(
    order_id          uuid not null,
    details_orders_id uuid not null
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
    id                 uuid not null,
    filter_details     varchar(255),
    filter_workbenches varchar(255),
    fio                varchar(255),
    fio_i_o            varchar(255),
    last_name          varchar(255),
    name               varchar(255),
    password           varchar(255),
    username           varchar(255),
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
    current_thickness float8,
    date_end_detail   timestamp,
    name              varchar(255),
    type_operation_id uuid,
    primary key (id)
);
create table setting
(
    id                   uuid not null,
    time_work_adjustment varchar(255),
    primary key (id)
);

create table setting_setting_weekends
(
    setting_id          uuid not null,
    setting_weekends_id uuid not null
);
create table setting_weekend
(
    id         uuid not null,
    date_end   date,
    date_start date,
    name       varchar(255),
    primary key (id)
);
create table setting_view
(
    id         uuid    not null,
    is_viewing boolean not null,
    name       varchar(255),
    primary key (id)
);
create table setting_setting_views
(
    setting_id       uuid not null,
    setting_views_id uuid not null
);
alter table setting_setting_views
    add constraint UK_rkdj3sje7c132oext3aubg5f3 unique (setting_views_id);
alter table setting_setting_views
    add constraint FK9o7iv764i15t1cgbja0a4hp6n foreign key (setting_views_id) references setting_view;
alter table setting_setting_views
    add constraint FKpa9owo489vvp2eq1cgk4aafr2 foreign key (setting_id) references setting;
alter table setting_setting_weekends
    add constraint UK_5sa77b6ry8twy7wqiq4xlscfc unique (setting_weekends_id);
alter table setting_setting_weekends
    add constraint FKdlbi3ninio2j58ll7apnh6lf9 foreign key (setting_weekends_id) references setting_weekend;
alter table setting_setting_weekends
    add constraint FKgjh5t0saus2lhnh448ptv4gk8 foreign key (setting_id) references setting;
alter table if exists completed_detail_order_detail_order_lists
    add constraint UK_ntnmbs9sfyjpxofr6uvbd1sr6 unique (detail_order_lists_id);
alter table if exists completed_detail_order_list_detail_date_by_workbench
    add constraint UK_fmlj4omn0lmmqje2stdu5vnmv unique (detail_date_by_workbench_id);
alter table if exists completed_detail_order_list_detail_order_infos
    add constraint UK_bbhxkmv0oie2swpx8pg123om1 unique (detail_order_infos_id);
alter table if exists detail_list_detail_infos
    add constraint UK_nmw8lchsc8jdbfpb194rwwttj unique (detail_infos_id);
alter table if exists detail_order_detail_order_lists
    add constraint UK_90slrc8eibyts6jh1eyogxpla unique (detail_order_lists_id);
alter table if exists detail_order_list_detail_date_by_workbench
    add constraint UK_r067rkoem65g2382de4147uei unique (detail_date_by_workbench_id);
alter table if exists detail_order_list_detail_order_infos
    add constraint UK_hsorkf98ndl0qcvuh6ngmo05l unique (detail_order_infos_id);
alter table if exists details_detail_lists
    add constraint UK_9uhii5est7l0iivh1fhid2e1u unique (detail_lists_id);
alter table if exists old_detail_order_detail_order_lists
    add constraint UK_7d3b2k392ogs4567t79yxvaha unique (detail_order_lists_id);
alter table if exists old_detail_order_list_detail_date_by_workbench
    add constraint UK_4n50ct90lpiepoq65cfv1hn62 unique (detail_date_by_workbench_id);
alter table if exists old_detail_order_list_detail_order_infos
    add constraint UK_6706b92w06tmwynsc0ed3oui1 unique (detail_order_infos_id);
alter table if exists type_operation_work_benches
    add constraint UK_oov9sv06v8kb7gywqqmcsbk3p unique (work_benches_id);
alter table if exists completed_orders
    add constraint FKhfga6nc19anx7la8k52ta8rj foreign key (economist_id) references users;
alter table if exists completed_orders
    add constraint FKlyeyp88hw379vbml5077gxae3 foreign key (manager_id) references users;
alter table if exists completed_orders
    add constraint FK66pn2bog0lt454xfy3md1h5wg foreign key (object_name_id) references contragents;
alter table if exists completed_orders_details_orders
    add constraint FKsle4nriejk60fq06hhnsin7lr foreign key (details_orders_id) references completed_details_order;
alter table if exists completed_orders_details_orders
    add constraint FKcndlvqqvi475tn7f7jgg58e1b foreign key (completed_order_id) references completed_orders;
alter table if exists completed_detail_date_by_workbench
    add constraint FKqso23u7skjx3ak6565lipi7p0 foreign key (work_bench_id) references workbench;
alter table if exists completed_detail_order
    add constraint FKqjg9oy9ru3xfgkibfrxkxqx7k foreign key (material_id) references materials;
alter table if exists completed_detail_order_detail_order_lists
    add constraint FKhfpcb5mhb8husu8btwxheo1mc foreign key (detail_order_lists_id) references completed_detail_order_list;
alter table if exists completed_detail_order_detail_order_lists
    add constraint FKqs13ktv9qvigffsjr1bh15tlq foreign key (completed_detail_order_id) references completed_detail_order;
alter table if exists completed_detail_order_info
    add constraint FK25i2ygpv475ho16d2xkc5nivc foreign key (work_benches_id) references workbench;
alter table if exists completed_detail_order_list_detail_date_by_workbench
    add constraint FKhqm6800amgajb3qv7j8uoooeu foreign key (detail_date_by_workbench_id) references completed_detail_date_by_workbench;
alter table if exists completed_detail_order_list_detail_date_by_workbench
    add constraint FK8h2yfs3j4ye35ittp8up0nl73 foreign key (completed_detail_order_list_id) references completed_detail_order_list;
alter table if exists completed_detail_order_list_detail_order_infos
    add constraint FKila9veb7u494o0w22jfpsathy foreign key (detail_order_infos_id) references completed_detail_order_info;
alter table if exists completed_detail_order_list_detail_order_infos
    add constraint FKms4n9c8ocwtswwylu0aajy70r foreign key (completed_detail_order_list_id) references completed_detail_order_list;
alter table if exists completed_details_order
    add constraint FKcjnr9flfkb4v7xtglflr8dnc7 foreign key (detail_order_id) references completed_detail_order;
alter table if exists detail_date_by_workbench
    add constraint FKo9fjfk95svc4x3cboncriukn1 foreign key (work_bench_id) references workbench;
alter table if exists detail_info
    add constraint FK3ikrqrrvu5x6revuk6untc0wb foreign key (work_benches_id) references workbench;
alter table if exists detail_list_detail_infos
    add constraint FKhpwbkasggmktnvvfp1j37cpdj foreign key (detail_infos_id) references detail_info;
alter table if exists detail_list_detail_infos
    add constraint FKoqp8sc54yeqml4eyi2ox6vpa3 foreign key (detail_list_id) references detail_list;
alter table if exists detail_order
    add constraint FKhjtdrn90t4runyfd04tb6riio foreign key (material_id) references materials;
alter table if exists detail_order_detail_order_lists
    add constraint FKre80qog0wt3y7pc17n5ug0bks foreign key (detail_order_lists_id) references detail_order_list;
alter table if exists detail_order_detail_order_lists
    add constraint FK7qxs0de1p20vb0cfpo4n3pb7b foreign key (detail_order_id) references detail_order;
alter table if exists detail_order_info
    add constraint FK46rp2dk2qert36m1uk7yboen foreign key (work_benches_id) references workbench;
alter table if exists detail_order_list_detail_date_by_workbench
    add constraint FKoagqrhu8sjroyl2pymtaxf8tg foreign key (detail_date_by_workbench_id) references detail_date_by_workbench;
alter table if exists detail_order_list_detail_date_by_workbench
    add constraint FKlutryyt68gi533b391nbsrnu8 foreign key (detail_order_list_id) references detail_order_list;
alter table if exists detail_order_list_detail_order_infos
    add constraint FKp0l9gs3tpbobfmi0wj7g8jmjo foreign key (detail_order_infos_id) references detail_order_info;
alter table if exists detail_order_list_detail_order_infos
    add constraint FKm2m4l7x44y285y4c59jdcvbw2 foreign key (detail_order_list_id) references detail_order_list;
alter table if exists details
    add constraint FK1jpc8m60b3hyb5ns1kr3ef7bd foreign key (material_id) references materials;
alter table if exists details_detail_lists
    add constraint FKixbn2jr0xwdntt05rfsng59cq foreign key (detail_lists_id) references detail_list;
alter table if exists details_detail_lists
    add constraint FKi2c5tpjie8u6rijne340cp3i foreign key (detail_id) references details;
alter table if exists details_order
    add constraint FK2i3yftxaqvoxgoxvtkanfqhih foreign key (detail_order_id) references detail_order;
alter table if exists old_detail_date_by_workbench
    add constraint FKk9fvee0hcecdwmpek49fwbfut foreign key (work_bench_id) references workbench;
alter table if exists old_detail_order
    add constraint FKse8hdqnh5b4smum9sv236iacd foreign key (material_id) references materials;
alter table if exists old_detail_order_detail_order_lists
    add constraint FKhkhjy0cd1k4p7837henfrx9dl foreign key (detail_order_lists_id) references old_detail_order_list;
alter table if exists old_detail_order_detail_order_lists
    add constraint FKk88qj0qg3nxy0ctwtmadqb098 foreign key (old_detail_order_id) references old_detail_order;
alter table if exists old_detail_order_info
    add constraint FKb9b3mue6ry2cxxvphwqucq26w foreign key (work_benches_id) references old_work_bench;
alter table if exists old_detail_order_list_detail_date_by_workbench
    add constraint FKbfq7c1cg0e821ti8rna8p7xvq foreign key (detail_date_by_workbench_id) references old_detail_date_by_workbench;
alter table if exists old_detail_order_list_detail_date_by_workbench
    add constraint FKc6s1n4a6xnq5gmj1f5kdbylve foreign key (old_detail_order_list_id) references old_detail_order_list;
alter table if exists old_detail_order_list_detail_order_infos
    add constraint FKarkk5bucvk4vad7rcwqxnqabm foreign key (detail_order_infos_id) references old_detail_order_info;
alter table if exists old_detail_order_list_detail_order_infos
    add constraint FKnc2rm8oyy2q8bgy3en3ucyk7x foreign key (old_detail_order_list_id) references old_detail_order_list;
alter table if exists old_details_order
    add constraint FKn1piimkjlurqhio20jq768qyi foreign key (detail_order_id) references old_detail_order;
alter table if exists old_order
    add constraint FKjudbx8v5jkqet09o16c70ddr6 foreign key (economist_id) references users;
alter table if exists old_order
    add constraint FKc6d6apjwd2g3u8x63ng6anirg foreign key (manager_id) references users;
alter table if exists old_order
    add constraint FKhv62scsqaqshlk6nlbam5o25y foreign key (object_name_id) references contragents;
alter table if exists old_order_details_orders
    add constraint FKtduew6plfpjlte076j3v9gdrf foreign key (details_orders_id) references old_details_order;
alter table if exists old_order_details_orders
    add constraint FKap9ngc9feyc29k882vfpaqc1q foreign key (old_order_id) references old_order;
alter table if exists old_work_bench
    add constraint FKa21qpinnjtq4qldj5nidk75v1 foreign key (type_operation_id) references type_operation;
alter table if exists orders
    add constraint FKq44037fqp5ci6lpmvsrtnlbur foreign key (economist_id) references users;
alter table if exists orders
    add constraint FK9qn4jar6kvccow7iyuo2mfuef foreign key (manager_id) references users;
alter table if exists orders
    add constraint FKk6on0fnwea31l3wrd9b79xp8d foreign key (object_name_id) references contragents;
alter table if exists orders_details_orders
    add constraint FKp39irdv3m0dvysq1vxxvboesc foreign key (details_orders_id) references details_order;
alter table if exists orders_details_orders
    add constraint FK2ov3ygn2ibi45wigspgjp11xs foreign key (order_id) references orders;
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