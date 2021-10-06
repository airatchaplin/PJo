INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('4c9a14c0-62a4-41de-a7de-605d2ddecb78'::uuid, 'Фасадная кассета VALKOR (ОТ) ПО 1.2 мм', '00:02:40',
        '1bc18ee8-11e7-4338-85a4-a296130aef7b'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('a2a2937e-43e6-403e-a13a-1b385aea4878'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('8bff780e-bfb2-4a19-ba9a-14669bea3481'::uuid, '1165*540 8 шт с листа по тех.картам', 0, '00:11:20',
        'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('9a558d52-9f8d-4446-aff6-d4be29684431'::uuid, '1165*540 8 шт с листа по тех.картам', 1, '00:12:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('df4dce2f-d7c9-4a43-9eef-1004b74775cb'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('f8f9081a-42e0-47c3-b7fd-1d2b5be205b6'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('80586f25-0afc-4736-8d8a-bf344cd7e194'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('c2a5b956-9e70-4c34-a7df-9465138a7071'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('8e592430-f010-4306-aec3-6a369b8d4931'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('d8ac614f-c140-47b5-b152-f0b792ccb90c'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('4c9a14c0-62a4-41de-a7de-605d2ddecb78'::uuid, 'a2a2937e-43e6-403e-a13a-1b385aea4878'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('4c9a14c0-62a4-41de-a7de-605d2ddecb78'::uuid, 'f8f9081a-42e0-47c3-b7fd-1d2b5be205b6'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('a2a2937e-43e6-403e-a13a-1b385aea4878'::uuid, '8bff780e-bfb2-4a19-ba9a-14669bea3481'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('a2a2937e-43e6-403e-a13a-1b385aea4878'::uuid, '9a558d52-9f8d-4446-aff6-d4be29684431'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('a2a2937e-43e6-403e-a13a-1b385aea4878'::uuid, 'df4dce2f-d7c9-4a43-9eef-1004b74775cb'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('f8f9081a-42e0-47c3-b7fd-1d2b5be205b6'::uuid, '80586f25-0afc-4736-8d8a-bf344cd7e194'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('f8f9081a-42e0-47c3-b7fd-1d2b5be205b6'::uuid, 'c2a5b956-9e70-4c34-a7df-9465138a7071'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('f8f9081a-42e0-47c3-b7fd-1d2b5be205b6'::uuid, '8e592430-f010-4306-aec3-6a369b8d4931'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('f8f9081a-42e0-47c3-b7fd-1d2b5be205b6'::uuid, 'd8ac614f-c140-47b5-b152-f0b792ccb90c'::uuid);
