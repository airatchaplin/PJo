INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('48308201-74f9-49c6-a970-6047c5177628'::uuid, 'Фасадная кассета VALKOR (ЗТ) ПЭ 1.5 мм', '00:02:40',
        'f4b5146e-8660-4a12-a3e3-1cfffa46d03b'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('b8d3e489-0109-4e15-8764-4e97b7d18896'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('244852fc-e922-4db5-8df3-35c008f5564f'::uuid, '540*510, 1170*510 по тех.карте', 0, '00:06:04',
        '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('85b92c73-c62d-405c-988d-73ec9e132d0b'::uuid, '540*510, 1170*510 по тех.карте', 1, '00:02:52',
        'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('cacd15b1-b8e4-454d-aff8-84057f61ccff'::uuid, '1170*510 по тех.карте', 2, '00:06:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('0060720b-053e-4ebb-8b0f-fcfc9981aeb4'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('b78e1cce-7820-4756-9aa5-9134d187d465'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('33b3e193-698d-4851-aa2f-d39d3f997a05'::uuid, '', 0, '00:00:00', 'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('c5c7c3a9-efa3-45ae-9bac-dfdfe96009f6'::uuid, '', 1, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('443ea7b4-dfbc-42a4-af46-5f2cc5ecf95b'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('48308201-74f9-49c6-a970-6047c5177628'::uuid, 'b8d3e489-0109-4e15-8764-4e97b7d18896'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('48308201-74f9-49c6-a970-6047c5177628'::uuid, 'b78e1cce-7820-4756-9aa5-9134d187d465'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('b8d3e489-0109-4e15-8764-4e97b7d18896'::uuid, '244852fc-e922-4db5-8df3-35c008f5564f'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('b8d3e489-0109-4e15-8764-4e97b7d18896'::uuid, '85b92c73-c62d-405c-988d-73ec9e132d0b'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('b8d3e489-0109-4e15-8764-4e97b7d18896'::uuid, 'cacd15b1-b8e4-454d-aff8-84057f61ccff'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('b8d3e489-0109-4e15-8764-4e97b7d18896'::uuid, '0060720b-053e-4ebb-8b0f-fcfc9981aeb4'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('b78e1cce-7820-4756-9aa5-9134d187d465'::uuid, '33b3e193-698d-4851-aa2f-d39d3f997a05'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('b78e1cce-7820-4756-9aa5-9134d187d465'::uuid, 'c5c7c3a9-efa3-45ae-9bac-dfdfe96009f6'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('b78e1cce-7820-4756-9aa5-9134d187d465'::uuid, '443ea7b4-dfbc-42a4-af46-5f2cc5ecf95b'::uuid);
