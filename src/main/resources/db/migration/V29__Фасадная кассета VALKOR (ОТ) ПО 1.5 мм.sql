INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('f6d49e68-c1f4-426a-a5b7-2208246d5088'::uuid, 'Фасадная кассета VALKOR (ОТ) ПО 1.5 мм', '00:02:40',
        '014ff617-3170-4b31-98e5-43c31f4511df'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('28760af2-4a29-429e-a055-807372222ab3'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('39e51bc6-9680-4d2b-a96f-4fd45e16545f'::uuid, '1165*540 8 шт с листа по тех.картам', 0, '00:11:20',
        'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('4a2c7369-9fc2-4a22-8a00-e0cc635fc3c3'::uuid, '1165*540 8 шт с листа по тех.картам', 1, '00:12:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('3a3c3cc9-7dd4-4c6e-a640-adda6c5dc421'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('8d99281f-ea82-42d8-81f0-d03994c03c01'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('790a0de2-f41c-44f2-b666-b00106d42b1c'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('1ba0cdeb-e345-44c8-a065-6feb59fc9b43'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('beaa9de8-a28c-42dc-a25f-4ff3a4b6ca75'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('24680e45-0c71-48bd-8c9f-1dddc88d32db'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('f6d49e68-c1f4-426a-a5b7-2208246d5088'::uuid, '28760af2-4a29-429e-a055-807372222ab3'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('f6d49e68-c1f4-426a-a5b7-2208246d5088'::uuid, '8d99281f-ea82-42d8-81f0-d03994c03c01'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('28760af2-4a29-429e-a055-807372222ab3'::uuid, '39e51bc6-9680-4d2b-a96f-4fd45e16545f'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('28760af2-4a29-429e-a055-807372222ab3'::uuid, '4a2c7369-9fc2-4a22-8a00-e0cc635fc3c3'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('28760af2-4a29-429e-a055-807372222ab3'::uuid, '3a3c3cc9-7dd4-4c6e-a640-adda6c5dc421'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('8d99281f-ea82-42d8-81f0-d03994c03c01'::uuid, '790a0de2-f41c-44f2-b666-b00106d42b1c'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('8d99281f-ea82-42d8-81f0-d03994c03c01'::uuid, '1ba0cdeb-e345-44c8-a065-6feb59fc9b43'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('8d99281f-ea82-42d8-81f0-d03994c03c01'::uuid, 'beaa9de8-a28c-42dc-a25f-4ff3a4b6ca75'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('8d99281f-ea82-42d8-81f0-d03994c03c01'::uuid, '24680e45-0c71-48bd-8c9f-1dddc88d32db'::uuid);

