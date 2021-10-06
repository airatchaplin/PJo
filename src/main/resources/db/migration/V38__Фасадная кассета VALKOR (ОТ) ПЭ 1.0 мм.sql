INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('577c437d-28e9-4be6-8633-2cb3562b0c7d'::uuid, 'Фасадная кассета VALKOR (ОТ) ПЭ 1.0 мм', '00:02:40',
        '7dc9a87e-4108-4820-b052-0ddd2ec77f1a'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('67822734-b4e2-47a5-abee-5bcdb924f1da'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('10bd892e-de35-4c05-8988-a2d674fa0fc2'::uuid, '1165*540 4 шт с листа по тех карте', 0, '00:06:20',
        '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('36675fb2-135a-47d4-b219-fe9ae1b66b43'::uuid, '1165*540 4 шт с листа по тех.карте', 1, '00:02:40',
        'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('2a2fc3b1-9838-4489-b763-65cf5dd15318'::uuid, '1165*540 8 шт с листа по тех.карте', 2, '00:12:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('e2a17a42-1d30-4fb2-9221-1a2040a9653b'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('037fb1c4-81aa-406b-a000-bb5645658ff8'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('79ffc273-8557-47ee-9002-84d0b0cb48b8'::uuid, '', 0, '00:00:00', 'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('3898505b-9344-467f-9d50-c7661de2326c'::uuid, '', 1, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('775750ac-e02e-4b4b-a6bd-6298265426f1'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('577c437d-28e9-4be6-8633-2cb3562b0c7d'::uuid, '67822734-b4e2-47a5-abee-5bcdb924f1da'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('577c437d-28e9-4be6-8633-2cb3562b0c7d'::uuid, '037fb1c4-81aa-406b-a000-bb5645658ff8'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('67822734-b4e2-47a5-abee-5bcdb924f1da'::uuid, '10bd892e-de35-4c05-8988-a2d674fa0fc2'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('67822734-b4e2-47a5-abee-5bcdb924f1da'::uuid, '36675fb2-135a-47d4-b219-fe9ae1b66b43'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('67822734-b4e2-47a5-abee-5bcdb924f1da'::uuid, '2a2fc3b1-9838-4489-b763-65cf5dd15318'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('67822734-b4e2-47a5-abee-5bcdb924f1da'::uuid, 'e2a17a42-1d30-4fb2-9221-1a2040a9653b'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('037fb1c4-81aa-406b-a000-bb5645658ff8'::uuid, '79ffc273-8557-47ee-9002-84d0b0cb48b8'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('037fb1c4-81aa-406b-a000-bb5645658ff8'::uuid, '3898505b-9344-467f-9d50-c7661de2326c'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('037fb1c4-81aa-406b-a000-bb5645658ff8'::uuid, '775750ac-e02e-4b4b-a6bd-6298265426f1'::uuid);

