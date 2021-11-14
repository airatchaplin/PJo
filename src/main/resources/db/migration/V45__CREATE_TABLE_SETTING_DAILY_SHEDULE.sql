create table setting_daily_schedule
(
    id        uuid not null,
    start_day varchar(255),
    end_day   varchar(255),
    name      varchar(255),
    priority  int,
    primary key (id)
);

create table setting_setting_daily_schedules
(
    setting_id                 uuid not null,
    setting_daily_schedules_id uuid not null
);
alter table setting_setting_daily_schedules
    add constraint UK_4saukj7e9cje9f8bol5xy8ibf unique (setting_daily_schedules_id);

INSERT INTO public.setting_setting_daily_schedules
    (setting_id, setting_daily_schedules_id)
VALUES ('a7566ccd-7729-4592-a675-28638ca72e65'::uuid, 'aa387630-4c76-4be7-8036-c0a863beec77'::uuid);
INSERT INTO public.setting_setting_daily_schedules
    (setting_id, setting_daily_schedules_id)
VALUES ('a7566ccd-7729-4592-a675-28638ca72e65'::uuid, '8758ec47-8697-4484-8541-7b598e918245'::uuid);
INSERT INTO public.setting_setting_daily_schedules
    (setting_id, setting_daily_schedules_id)
VALUES ('a7566ccd-7729-4592-a675-28638ca72e65'::uuid, 'cd9955a2-e03e-487c-b555-6b16a60ea63c'::uuid);
INSERT INTO public.setting_setting_daily_schedules
    (setting_id, setting_daily_schedules_id)
VALUES ('a7566ccd-7729-4592-a675-28638ca72e65'::uuid, 'f1703231-8672-412a-a8c8-1e2981151171'::uuid);


INSERT INTO public.setting_daily_schedule
    (id, start_day, end_day, "name", priority)
VALUES ('aa387630-4c76-4be7-8036-c0a863beec77'::uuid, '08:30', '16:30', 'Смена', 0);

INSERT INTO public.setting_daily_schedule
    (id, start_day, end_day, "name", priority)
VALUES ('8758ec47-8697-4484-8541-7b598e918245'::uuid, '09:00', '09:10', 'Первый перерыв', 1);

INSERT INTO public.setting_daily_schedule
    (id, start_day, end_day, "name", priority)
VALUES ('cd9955a2-e03e-487c-b555-6b16a60ea63c'::uuid, '11:00', '12:00', 'Обед', 2);

INSERT INTO public.setting_daily_schedule
    (id, start_day, end_day, "name", priority)
VALUES ('f1703231-8672-412a-a8c8-1e2981151171'::uuid, '13:00', '13:10', 'Второй перерыв', 3);
