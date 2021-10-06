INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('d4fa7e7a-aeb4-4b92-8e9a-f73563e8ebd3'::uuid, 'Фасадная кассета VALKOR (ОТ) ПЭ 1.5 мм', '00:02:40',
        'f4b5146e-8660-4a12-a3e3-1cfffa46d03b'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('10a73be9-1934-403e-b780-72cd3ef22e54'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('2473e629-116a-4f9f-8294-b2bccc5a9d32'::uuid, '1165*540 4 шт с листа по тех карте', 0, '00:06:20',
        '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('8e912214-a82c-4912-8036-3c78c2598bc0'::uuid, '1165*540 4 шт с листа по тех карте', 1, '00:02:40',
        'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('c22854ca-5058-428a-abeb-cfed65014cfd'::uuid, '1165*540 8 шт с листа по тех.карте', 2, '00:12:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('574c2dbb-aa94-4f65-a90e-f3634eb5fb98'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('0f047f1f-c9b3-498f-accd-4f0c4261d6fb'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('136357d3-bf19-4024-b585-521a1cce1042'::uuid, '', 0, '00:00:00', 'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('ab28451f-96ca-46bd-8938-95f1f82c4637'::uuid, '', 1, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('a5d7fc11-98c7-47e4-b1e0-5bed83e17b37'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('d4fa7e7a-aeb4-4b92-8e9a-f73563e8ebd3'::uuid, '10a73be9-1934-403e-b780-72cd3ef22e54'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('d4fa7e7a-aeb4-4b92-8e9a-f73563e8ebd3'::uuid, '0f047f1f-c9b3-498f-accd-4f0c4261d6fb'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('10a73be9-1934-403e-b780-72cd3ef22e54'::uuid, '2473e629-116a-4f9f-8294-b2bccc5a9d32'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('10a73be9-1934-403e-b780-72cd3ef22e54'::uuid, '8e912214-a82c-4912-8036-3c78c2598bc0'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('10a73be9-1934-403e-b780-72cd3ef22e54'::uuid, 'c22854ca-5058-428a-abeb-cfed65014cfd'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('10a73be9-1934-403e-b780-72cd3ef22e54'::uuid, '574c2dbb-aa94-4f65-a90e-f3634eb5fb98'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('0f047f1f-c9b3-498f-accd-4f0c4261d6fb'::uuid, '136357d3-bf19-4024-b585-521a1cce1042'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('0f047f1f-c9b3-498f-accd-4f0c4261d6fb'::uuid, 'ab28451f-96ca-46bd-8938-95f1f82c4637'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('0f047f1f-c9b3-498f-accd-4f0c4261d6fb'::uuid, 'a5d7fc11-98c7-47e4-b1e0-5bed83e17b37'::uuid);
