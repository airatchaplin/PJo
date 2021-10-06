INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('f533ea62-4075-424d-840a-40c4d4ade315'::uuid, 'Фасадная кассета VALKOR (ЗТ) ОЦ  1.5 мм', '00:02:40',
        'de8280cc-fd56-4047-933f-47329fa3fe02'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('5a2cbf34-58a7-43c1-8b1e-3297617bf18c'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('e17cdfe6-e29d-4c20-a5db-80ee6eaddaa6'::uuid, '540*510, 1170*510 по тех.карте', 0, '00:12:32',
        'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('51a97244-26ce-4e87-adc5-79bb42a4dc87'::uuid, '540*510 по тех.картам', 1, '00:01:20',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('4f1d3775-9ca5-4053-aedb-d79e435f5daf'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('6603b8b2-529e-43be-a71c-c0bd9cbc84d0'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('98b8b1cb-4dae-45e3-8977-92c572f5e823'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('88fd1096-56f2-4851-9c9e-f265d6d7cbc5'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('a17bd47e-e198-41b3-98f8-513c5149e90e'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('0c8f53c6-f0f6-4ae1-a24f-f2768c2cff2b'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('f533ea62-4075-424d-840a-40c4d4ade315'::uuid, '5a2cbf34-58a7-43c1-8b1e-3297617bf18c'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('f533ea62-4075-424d-840a-40c4d4ade315'::uuid, '6603b8b2-529e-43be-a71c-c0bd9cbc84d0'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('5a2cbf34-58a7-43c1-8b1e-3297617bf18c'::uuid, 'e17cdfe6-e29d-4c20-a5db-80ee6eaddaa6'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('5a2cbf34-58a7-43c1-8b1e-3297617bf18c'::uuid, '51a97244-26ce-4e87-adc5-79bb42a4dc87'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('5a2cbf34-58a7-43c1-8b1e-3297617bf18c'::uuid, '4f1d3775-9ca5-4053-aedb-d79e435f5daf'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('6603b8b2-529e-43be-a71c-c0bd9cbc84d0'::uuid, '98b8b1cb-4dae-45e3-8977-92c572f5e823'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('6603b8b2-529e-43be-a71c-c0bd9cbc84d0'::uuid, '88fd1096-56f2-4851-9c9e-f265d6d7cbc5'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('6603b8b2-529e-43be-a71c-c0bd9cbc84d0'::uuid, 'a17bd47e-e198-41b3-98f8-513c5149e90e'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('6603b8b2-529e-43be-a71c-c0bd9cbc84d0'::uuid, '0c8f53c6-f0f6-4ae1-a24f-f2768c2cff2b'::uuid);
