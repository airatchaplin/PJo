INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('59831299-d690-458e-af8f-7a2b7b40d99f'::uuid, 'Фасадная кассета VALKOR (ЗТ) ПЭ 0.45 мм', '00:02:40',
        '3d082c4c-c1ae-4f4d-a901-6e8c98256bc6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('38ee1e47-e9d5-41b6-8ead-d7f35b564296'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('22f740ce-5cfb-4f90-aabd-8a088bbb07c0'::uuid, '540*510, 1170*510 по тех.карте', 0, '00:06:04',
        '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('d3465155-c164-44c5-8db5-f9099b722a5b'::uuid, '540*510, 1170*510 по тех.карте', 1, '00:02:52',
        'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('46b51003-5f68-4b01-b5d9-98b17ece6f5a'::uuid, '540*510, 1170*510 по тех.карте', 2, '00:01:20',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('09fecc02-96be-44f0-ab21-3df559c6ca5b'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('f77c96ef-02c9-43a7-b2e5-f5fcc9dda684'::uuid, '', 4, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('acca11cc-b70d-4370-8897-9e2013a1dc2e'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('b24dd4de-b0ac-458b-83a7-b3527ffe0a91'::uuid, '', 0, '00:00:00', 'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('542c345a-ff2c-497e-b2e5-e7a89fe9a5f2'::uuid, '', 1, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('b99637e7-bd6e-4260-80db-676ef322fd57'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('1682a7ef-b66d-4a86-bfa8-cd7dc16ba445'::uuid, '', 3, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('59831299-d690-458e-af8f-7a2b7b40d99f'::uuid, '38ee1e47-e9d5-41b6-8ead-d7f35b564296'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('59831299-d690-458e-af8f-7a2b7b40d99f'::uuid, 'acca11cc-b70d-4370-8897-9e2013a1dc2e'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('38ee1e47-e9d5-41b6-8ead-d7f35b564296'::uuid, '22f740ce-5cfb-4f90-aabd-8a088bbb07c0'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('38ee1e47-e9d5-41b6-8ead-d7f35b564296'::uuid, 'd3465155-c164-44c5-8db5-f9099b722a5b'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('38ee1e47-e9d5-41b6-8ead-d7f35b564296'::uuid, '46b51003-5f68-4b01-b5d9-98b17ece6f5a'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('38ee1e47-e9d5-41b6-8ead-d7f35b564296'::uuid, '09fecc02-96be-44f0-ab21-3df559c6ca5b'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('38ee1e47-e9d5-41b6-8ead-d7f35b564296'::uuid, 'f77c96ef-02c9-43a7-b2e5-f5fcc9dda684'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('acca11cc-b70d-4370-8897-9e2013a1dc2e'::uuid, 'b24dd4de-b0ac-458b-83a7-b3527ffe0a91'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('acca11cc-b70d-4370-8897-9e2013a1dc2e'::uuid, '542c345a-ff2c-497e-b2e5-e7a89fe9a5f2'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('acca11cc-b70d-4370-8897-9e2013a1dc2e'::uuid, 'b99637e7-bd6e-4260-80db-676ef322fd57'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('acca11cc-b70d-4370-8897-9e2013a1dc2e'::uuid, '1682a7ef-b66d-4a86-bfa8-cd7dc16ba445'::uuid);
