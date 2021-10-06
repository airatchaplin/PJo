INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('eba05606-87bf-488a-9d27-934ff4922a31'::uuid, 'Фасадная кассета VALKOR (ЗТ) ПО 2.0 мм', '00:02:40',
        '735e79f5-a36b-43d8-85c0-5d4042bffe4f'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('55fd9fc2-6e82-4f5c-9aa3-fc00dc7e8510'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('b7410052-6dbc-47a3-b2ce-693433aa807d'::uuid, '540*510, 1170*510 по тех.карте', 0, '00:12:32',
        'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('aa18abdb-7c73-416b-9944-1174303a7a9c'::uuid, '540*510, 1170*510 по тех.карте', 1, '00:06:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('1c0d205c-abee-4df0-8f50-f2c2b0c2a487'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('7bf7ba3b-1cf1-4b03-b4ef-fcbf3b0fdf2b'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('6843da7b-32cd-4fe4-8b80-165e461d0701'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('03afb25b-b999-4c31-a477-cee602528e34'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('8459a36d-65c9-4bcc-80e6-80cfd86dc23c'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('3bbc6c57-e218-4627-ac13-9e435937e184'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('eba05606-87bf-488a-9d27-934ff4922a31'::uuid, '55fd9fc2-6e82-4f5c-9aa3-fc00dc7e8510'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('eba05606-87bf-488a-9d27-934ff4922a31'::uuid, '7bf7ba3b-1cf1-4b03-b4ef-fcbf3b0fdf2b'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('55fd9fc2-6e82-4f5c-9aa3-fc00dc7e8510'::uuid, 'b7410052-6dbc-47a3-b2ce-693433aa807d'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('55fd9fc2-6e82-4f5c-9aa3-fc00dc7e8510'::uuid, 'aa18abdb-7c73-416b-9944-1174303a7a9c'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('55fd9fc2-6e82-4f5c-9aa3-fc00dc7e8510'::uuid, '1c0d205c-abee-4df0-8f50-f2c2b0c2a487'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('7bf7ba3b-1cf1-4b03-b4ef-fcbf3b0fdf2b'::uuid, '6843da7b-32cd-4fe4-8b80-165e461d0701'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('7bf7ba3b-1cf1-4b03-b4ef-fcbf3b0fdf2b'::uuid, '03afb25b-b999-4c31-a477-cee602528e34'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('7bf7ba3b-1cf1-4b03-b4ef-fcbf3b0fdf2b'::uuid, '8459a36d-65c9-4bcc-80e6-80cfd86dc23c'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('7bf7ba3b-1cf1-4b03-b4ef-fcbf3b0fdf2b'::uuid, '3bbc6c57-e218-4627-ac13-9e435937e184'::uuid);
