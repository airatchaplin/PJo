INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('2a4321d6-4567-4722-8a39-d46a6525ea5c'::uuid,
        'Фасадная кассета VALKOR (ЗТ) ПЭ 1.2 мм (ЧПУ 1.5м -540*510. 1170*510)', '00:02:40',
        '21ee3088-6f02-4894-a84a-cdc9900d0bfb'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('47ba7289-177a-4d15-97a9-7774302fdb3b'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('c3d194a9-fcb9-44b5-bcfe-e25df144e5e3'::uuid, '540*510, 1170*510 по тех.карте', 0, '00:06:04',
        '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('7a2dc512-1433-4104-a134-be103b3f1a3e'::uuid, '540*510, 1170*510 по тех.карте', 1, '00:02:52',
        'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('cba382ef-1069-4d00-a23f-755b8bb51b66'::uuid, '540*510, 1170*510 по тех.карте', 2, '00:06:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('3f68de0e-1ecc-4c9d-8584-10189b7a2df8'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('6e5b9491-dfc0-456c-9658-adb6b245a66c'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('55c61397-3ddc-43c5-9b7e-57fbc51548a5'::uuid, '', 0, '00:00:00', 'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('8d118600-4fef-401d-a386-326d81db6a11'::uuid, '', 1, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('b3cd0ade-d2e9-438f-9df2-0d38323bf632'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('2a4321d6-4567-4722-8a39-d46a6525ea5c'::uuid, '47ba7289-177a-4d15-97a9-7774302fdb3b'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('2a4321d6-4567-4722-8a39-d46a6525ea5c'::uuid, '6e5b9491-dfc0-456c-9658-adb6b245a66c'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('47ba7289-177a-4d15-97a9-7774302fdb3b'::uuid, 'c3d194a9-fcb9-44b5-bcfe-e25df144e5e3'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('47ba7289-177a-4d15-97a9-7774302fdb3b'::uuid, '7a2dc512-1433-4104-a134-be103b3f1a3e'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('47ba7289-177a-4d15-97a9-7774302fdb3b'::uuid, 'cba382ef-1069-4d00-a23f-755b8bb51b66'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('47ba7289-177a-4d15-97a9-7774302fdb3b'::uuid, '3f68de0e-1ecc-4c9d-8584-10189b7a2df8'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('6e5b9491-dfc0-456c-9658-adb6b245a66c'::uuid, '55c61397-3ddc-43c5-9b7e-57fbc51548a5'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('6e5b9491-dfc0-456c-9658-adb6b245a66c'::uuid, '8d118600-4fef-401d-a386-326d81db6a11'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('6e5b9491-dfc0-456c-9658-adb6b245a66c'::uuid, 'b3cd0ade-d2e9-438f-9df2-0d38323bf632'::uuid);
