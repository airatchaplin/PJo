INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('81a70a8c-27af-41a3-ae7d-16e42c27d84c'::uuid, 'Фасадная кассета VALKOR (ЗТ) ПЭ 1.0 мм', '00:02:40',
        '7dc9a87e-4108-4820-b052-0ddd2ec77f1a'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('8b0c72ea-dad8-468a-b4a7-038e1e3f73ee'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('7ad6ea3b-4876-474e-a31a-fc0bd5309cb3'::uuid, '540*510, 1170*510 по тех.карте', 0, '00:06:04',
        '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('125f8e3c-c630-4805-88a6-0169c47a3b44'::uuid, '540*510, 1170*510 по тех.карте', 1, '00:02:52',
        'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('7167dcee-afc8-4cf0-a7a7-ac67d949926f'::uuid, '1170*510 по тех.карте', 2, '00:06:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('97b1f1cb-7019-4786-96e2-a61cfc98ec9c'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('12562404-8c03-4dff-8b26-5de9c824dd0b'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('4bd55800-d42b-4490-90df-a8d5480d62ea'::uuid, '', 0, '00:00:00', 'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('630e8ece-27a7-4b9e-bb7e-433eaad3eaf7'::uuid, '', 1, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('cd2dcde7-db19-4228-87a1-d17cc7b6f7b1'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('81a70a8c-27af-41a3-ae7d-16e42c27d84c'::uuid, '8b0c72ea-dad8-468a-b4a7-038e1e3f73ee'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('81a70a8c-27af-41a3-ae7d-16e42c27d84c'::uuid, '12562404-8c03-4dff-8b26-5de9c824dd0b'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('8b0c72ea-dad8-468a-b4a7-038e1e3f73ee'::uuid, '7ad6ea3b-4876-474e-a31a-fc0bd5309cb3'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('8b0c72ea-dad8-468a-b4a7-038e1e3f73ee'::uuid, '125f8e3c-c630-4805-88a6-0169c47a3b44'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('8b0c72ea-dad8-468a-b4a7-038e1e3f73ee'::uuid, '7167dcee-afc8-4cf0-a7a7-ac67d949926f'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('8b0c72ea-dad8-468a-b4a7-038e1e3f73ee'::uuid, '97b1f1cb-7019-4786-96e2-a61cfc98ec9c'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('12562404-8c03-4dff-8b26-5de9c824dd0b'::uuid, '4bd55800-d42b-4490-90df-a8d5480d62ea'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('12562404-8c03-4dff-8b26-5de9c824dd0b'::uuid, '630e8ece-27a7-4b9e-bb7e-433eaad3eaf7'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('12562404-8c03-4dff-8b26-5de9c824dd0b'::uuid, 'cd2dcde7-db19-4228-87a1-d17cc7b6f7b1'::uuid);
