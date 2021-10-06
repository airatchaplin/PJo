INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('ec3d249c-fbdd-4e5e-bb22-470b2058b52b'::uuid, 'Фасадная кассета VALKOR (ОТ) ПЭ 0.45 мм', '00:02:40',
        '3d082c4c-c1ae-4f4d-a901-6e8c98256bc6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('a154a396-d3a4-4f36-8040-13efe50b7d7e'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('163c827b-fc2d-4f97-aa6e-8034e9590ef4'::uuid, '1165*540 4 шт с листа по тех карте', 0, '00:06:20',
        '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('b970acbb-533c-4ffd-abf9-6987f2d2c52e'::uuid, '1165*540 4 шт с листа по тех карте', 1, '00:02:40',
        'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('2ec7ddb5-debd-4874-a2e5-8ca367b26e55'::uuid, '1165*540 8 шт с листа по тех.карте', 2, '00:12:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('afd8eedc-a594-4d1b-b67c-6ecd736fec1e'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('32ea48ff-4b38-4673-be68-27c4176debc4'::uuid, '', 4, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('c194b020-476b-4086-bfc2-2a88a27a55a8'::uuid, false, 2);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('60845b90-a667-497e-9eaa-f47671203e7d'::uuid, '', 0, '00:00:00', 'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('fe18a4cd-3cde-4851-8671-b5995296f6bc'::uuid, '', 1, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('d5c681b9-42fa-409c-a4c9-c27165b70729'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('c1b7aa65-6586-48ce-aa96-84a87e35aaad'::uuid, '', 3, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('ec3d249c-fbdd-4e5e-bb22-470b2058b52b'::uuid, 'a154a396-d3a4-4f36-8040-13efe50b7d7e'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('ec3d249c-fbdd-4e5e-bb22-470b2058b52b'::uuid, 'c194b020-476b-4086-bfc2-2a88a27a55a8'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('a154a396-d3a4-4f36-8040-13efe50b7d7e'::uuid, '163c827b-fc2d-4f97-aa6e-8034e9590ef4'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('a154a396-d3a4-4f36-8040-13efe50b7d7e'::uuid, 'b970acbb-533c-4ffd-abf9-6987f2d2c52e'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('a154a396-d3a4-4f36-8040-13efe50b7d7e'::uuid, '2ec7ddb5-debd-4874-a2e5-8ca367b26e55'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('a154a396-d3a4-4f36-8040-13efe50b7d7e'::uuid, 'afd8eedc-a594-4d1b-b67c-6ecd736fec1e'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('a154a396-d3a4-4f36-8040-13efe50b7d7e'::uuid, '32ea48ff-4b38-4673-be68-27c4176debc4'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('c194b020-476b-4086-bfc2-2a88a27a55a8'::uuid, '60845b90-a667-497e-9eaa-f47671203e7d'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('c194b020-476b-4086-bfc2-2a88a27a55a8'::uuid, 'fe18a4cd-3cde-4851-8671-b5995296f6bc'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('c194b020-476b-4086-bfc2-2a88a27a55a8'::uuid, 'd5c681b9-42fa-409c-a4c9-c27165b70729'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('c194b020-476b-4086-bfc2-2a88a27a55a8'::uuid, 'c1b7aa65-6586-48ce-aa96-84a87e35aaad'::uuid);

