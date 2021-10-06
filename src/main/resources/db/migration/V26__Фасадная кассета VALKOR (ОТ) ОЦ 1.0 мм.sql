INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('1e449ca4-202e-4f50-afad-46c351993317'::uuid, 'Фасадная кассета VALKOR (ОТ) ОЦ 1.0 мм', '00:02:40',
        'dd1d05d5-e4a2-4f70-a21c-ea91b7906650'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('ba1f153d-670e-4146-b012-52b4b9b35521'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('700062d4-2636-4b80-bf4c-78103a326ef3'::uuid, '1165*540 8 шт с листа по тех.картам', 0, '00:05:20',
        'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('d6c67015-ed53-4af4-9bdf-c7e018d08824'::uuid, '1165*540 8 шт с листа по тех.картам', 1, '00:12:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('64a3b290-5a17-40c7-a5cb-435fcf0f4dd6'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('f30e4003-2da8-47e0-b74f-9b9bbf1dc418'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('5823c29b-8b3a-4b99-9d8d-e0b930293734'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('11c409c3-23f7-400f-a7eb-192a5d23ae40'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('cf3b8350-c400-41e7-a86d-2590597d5dff'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('89a40ef9-7861-4b15-bb71-15e84800cdb3'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('1e449ca4-202e-4f50-afad-46c351993317'::uuid, 'ba1f153d-670e-4146-b012-52b4b9b35521'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('1e449ca4-202e-4f50-afad-46c351993317'::uuid, 'f30e4003-2da8-47e0-b74f-9b9bbf1dc418'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('ba1f153d-670e-4146-b012-52b4b9b35521'::uuid, '700062d4-2636-4b80-bf4c-78103a326ef3'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('ba1f153d-670e-4146-b012-52b4b9b35521'::uuid, 'd6c67015-ed53-4af4-9bdf-c7e018d08824'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('ba1f153d-670e-4146-b012-52b4b9b35521'::uuid, '64a3b290-5a17-40c7-a5cb-435fcf0f4dd6'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('f30e4003-2da8-47e0-b74f-9b9bbf1dc418'::uuid, '5823c29b-8b3a-4b99-9d8d-e0b930293734'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('f30e4003-2da8-47e0-b74f-9b9bbf1dc418'::uuid, '11c409c3-23f7-400f-a7eb-192a5d23ae40'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('f30e4003-2da8-47e0-b74f-9b9bbf1dc418'::uuid, 'cf3b8350-c400-41e7-a86d-2590597d5dff'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('f30e4003-2da8-47e0-b74f-9b9bbf1dc418'::uuid, '89a40ef9-7861-4b15-bb71-15e84800cdb3'::uuid);
