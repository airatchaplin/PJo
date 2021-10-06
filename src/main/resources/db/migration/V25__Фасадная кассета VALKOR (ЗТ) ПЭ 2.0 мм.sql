INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('7b98adc3-2001-47f7-8ff5-ee8a45433a7f'::uuid, 'Фасадная кассета VALKOR (ЗТ) ПЭ 2.0 мм', '00:02:40',
        '681d7860-e43a-4864-8e77-0d7df7d54f2f'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('deefb4ae-7dbd-4ea4-9e0c-7b46575f6047'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('3cfc163c-d780-4742-a2ee-44d99771ef7b'::uuid, '540*510, 1170*510 по тех.карте', 0, '00:06:04',
        '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('358825fa-4a94-4320-9096-858a819cbfab'::uuid, '540*510, 1170*510 по тех.карте', 1, '00:02:52',
        'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('d38bd7cd-5f51-4683-ab62-a3b6c8b21631'::uuid, '540*510, 1170*510 по тех.карте', 2, '00:06:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('73772cf3-7016-4d27-9587-107d331ad4fc'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('bf7bed07-c8b2-49e0-9b67-95dffcc6a9f6'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('8387948b-7360-45db-b95a-03cf89965a43'::uuid, '', 0, '00:00:00', 'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('a2a8f325-c508-4baf-bf84-5bd9df005f87'::uuid, '', 1, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('98c612c2-71b2-4fd7-8019-3dc1fe63315b'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('7b98adc3-2001-47f7-8ff5-ee8a45433a7f'::uuid, 'deefb4ae-7dbd-4ea4-9e0c-7b46575f6047'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('7b98adc3-2001-47f7-8ff5-ee8a45433a7f'::uuid, 'bf7bed07-c8b2-49e0-9b67-95dffcc6a9f6'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('deefb4ae-7dbd-4ea4-9e0c-7b46575f6047'::uuid, '3cfc163c-d780-4742-a2ee-44d99771ef7b'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('deefb4ae-7dbd-4ea4-9e0c-7b46575f6047'::uuid, '358825fa-4a94-4320-9096-858a819cbfab'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('deefb4ae-7dbd-4ea4-9e0c-7b46575f6047'::uuid, 'd38bd7cd-5f51-4683-ab62-a3b6c8b21631'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('deefb4ae-7dbd-4ea4-9e0c-7b46575f6047'::uuid, '73772cf3-7016-4d27-9587-107d331ad4fc'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('bf7bed07-c8b2-49e0-9b67-95dffcc6a9f6'::uuid, '8387948b-7360-45db-b95a-03cf89965a43'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('bf7bed07-c8b2-49e0-9b67-95dffcc6a9f6'::uuid, 'a2a8f325-c508-4baf-bf84-5bd9df005f87'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('bf7bed07-c8b2-49e0-9b67-95dffcc6a9f6'::uuid, '98c612c2-71b2-4fd7-8019-3dc1fe63315b'::uuid);
