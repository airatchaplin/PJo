INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('d221d160-f5ce-4fad-ab7a-f96770bce543'::uuid, 'Фасадная кассета VALKOR (ОТ) ПЭ 0.7 мм', '00:02:40',
        'fbff29ac-ed22-4ed9-9d34-19a4ca9f5bb9'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('e17ab71d-a620-4bcb-996e-5667686c3314'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('7376e65f-bf27-434a-85b1-6eae4028e02e'::uuid, '1165*540 4 шт с листа по тех карте', 0, '00:06:20',
        '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('41f6c2ee-e4fc-4541-bd14-92ddf682f73f'::uuid, '1165*540 4 шт с листа по тех карте', 1, '00:02:40',
        'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('9b60a72f-3988-437a-9036-6ed25f8f736f'::uuid, '1165*540 8 шт с листа по тех.карте', 2, '00:12:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('9a6d4d36-e000-4928-826f-46b8a7f98ef9'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('f5c852f8-a9f2-4d1f-bc4e-bc1017c66941'::uuid, '', 4, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('1b7a068c-ae24-4d5b-8c7d-81e33590b9f5'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('33b90766-05a2-496b-bbb2-1164b54ed124'::uuid, '', 0, '00:00:00', 'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('dcc4bbf2-0f96-48f9-a630-4f66777d88f2'::uuid, '', 1, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('b2d2d6df-bbd5-4188-85a5-dfa3f7ef303f'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('c07c7451-bd05-4884-bba9-1041bb65eb82'::uuid, '', 3, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('d221d160-f5ce-4fad-ab7a-f96770bce543'::uuid, 'e17ab71d-a620-4bcb-996e-5667686c3314'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('d221d160-f5ce-4fad-ab7a-f96770bce543'::uuid, '1b7a068c-ae24-4d5b-8c7d-81e33590b9f5'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('e17ab71d-a620-4bcb-996e-5667686c3314'::uuid, '7376e65f-bf27-434a-85b1-6eae4028e02e'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('e17ab71d-a620-4bcb-996e-5667686c3314'::uuid, '41f6c2ee-e4fc-4541-bd14-92ddf682f73f'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('e17ab71d-a620-4bcb-996e-5667686c3314'::uuid, '9b60a72f-3988-437a-9036-6ed25f8f736f'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('e17ab71d-a620-4bcb-996e-5667686c3314'::uuid, '9a6d4d36-e000-4928-826f-46b8a7f98ef9'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('e17ab71d-a620-4bcb-996e-5667686c3314'::uuid, 'f5c852f8-a9f2-4d1f-bc4e-bc1017c66941'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('1b7a068c-ae24-4d5b-8c7d-81e33590b9f5'::uuid, '33b90766-05a2-496b-bbb2-1164b54ed124'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('1b7a068c-ae24-4d5b-8c7d-81e33590b9f5'::uuid, 'dcc4bbf2-0f96-48f9-a630-4f66777d88f2'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('1b7a068c-ae24-4d5b-8c7d-81e33590b9f5'::uuid, 'b2d2d6df-bbd5-4188-85a5-dfa3f7ef303f'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('1b7a068c-ae24-4d5b-8c7d-81e33590b9f5'::uuid, 'c07c7451-bd05-4884-bba9-1041bb65eb82'::uuid);
