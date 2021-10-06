INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('5af2e7ca-f400-46db-a9e7-c5e01a5d5287'::uuid, 'Фасадная кассета VALKOR (ОТ) ПО 1.0 мм', '00:02:40',
        '825d8bb4-ca85-486a-9686-1721db35c584'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('2145ce46-af68-4326-a97c-d3902de44d7f'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('eb9c67c8-58e5-497f-a60a-bce8567f6310'::uuid, '1165*540 8 шт с листа по тех.картам', 0, '00:05:20',
        'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('0dc0b971-4e74-42fb-98dd-00e43ffef4da'::uuid, '1165*540 8 шт с листа по тех.картам', 1, '00:12:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('e11505f2-21c4-4ef7-8ca0-921c7c2e83c2'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('259c274a-e4b5-406f-aade-a759de3cf01f'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('a85a460b-2ca6-4db7-b819-e10aac97d22e'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('257e504e-741d-4ae8-821b-66a4ddd7f469'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('78236b1c-f9e6-4123-8b04-9553bd05993c'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('c1f9ec06-3815-4a97-84cf-ae6cadd9e554'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('5af2e7ca-f400-46db-a9e7-c5e01a5d5287'::uuid, '2145ce46-af68-4326-a97c-d3902de44d7f'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('5af2e7ca-f400-46db-a9e7-c5e01a5d5287'::uuid, '259c274a-e4b5-406f-aade-a759de3cf01f'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('2145ce46-af68-4326-a97c-d3902de44d7f'::uuid, 'eb9c67c8-58e5-497f-a60a-bce8567f6310'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('2145ce46-af68-4326-a97c-d3902de44d7f'::uuid, '0dc0b971-4e74-42fb-98dd-00e43ffef4da'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('2145ce46-af68-4326-a97c-d3902de44d7f'::uuid, 'e11505f2-21c4-4ef7-8ca0-921c7c2e83c2'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('259c274a-e4b5-406f-aade-a759de3cf01f'::uuid, 'a85a460b-2ca6-4db7-b819-e10aac97d22e'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('259c274a-e4b5-406f-aade-a759de3cf01f'::uuid, '257e504e-741d-4ae8-821b-66a4ddd7f469'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('259c274a-e4b5-406f-aade-a759de3cf01f'::uuid, '78236b1c-f9e6-4123-8b04-9553bd05993c'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('259c274a-e4b5-406f-aade-a759de3cf01f'::uuid, 'c1f9ec06-3815-4a97-84cf-ae6cadd9e554'::uuid);
