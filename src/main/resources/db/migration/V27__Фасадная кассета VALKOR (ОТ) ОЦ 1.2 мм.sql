INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('e791c138-d731-4497-9275-43f61edcf3c5'::uuid, 'Фасадная кассета VALKOR (ОТ) ОЦ 1.2 мм', '00:02:40',
        '93172ad6-caab-4ab2-93c5-212db993bd4d'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('b612ebeb-b56e-4930-b101-2179beea8ebe'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('0619ebe6-51b5-4afa-82b0-2fa99eb3a35e'::uuid, '1165*540 8 шт с листа по тех.картам', 0, '00:11:20',
        'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('2018e229-ef58-49f9-b0f7-5a2a7275d9e2'::uuid, '1165*540 8 шт с листа по тех.картам', 1, '00:12:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('fc2811b8-91d1-434c-bb45-d864888a086b'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('991cfed7-1213-4c6d-87c9-1f5d715b2a79'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('326c066b-3188-42df-8f3f-a0abdf284b6c'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('c5bb925c-49a4-484e-a66a-f2abb2ec6739'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('2a617bd1-94fd-423d-b9d7-e19b24f8e2c6'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('74e280d0-ea4f-4b1e-9a2d-f799db7f24fb'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('e791c138-d731-4497-9275-43f61edcf3c5'::uuid, 'b612ebeb-b56e-4930-b101-2179beea8ebe'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('e791c138-d731-4497-9275-43f61edcf3c5'::uuid, '991cfed7-1213-4c6d-87c9-1f5d715b2a79'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('b612ebeb-b56e-4930-b101-2179beea8ebe'::uuid, '0619ebe6-51b5-4afa-82b0-2fa99eb3a35e'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('b612ebeb-b56e-4930-b101-2179beea8ebe'::uuid, '2018e229-ef58-49f9-b0f7-5a2a7275d9e2'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('b612ebeb-b56e-4930-b101-2179beea8ebe'::uuid, 'fc2811b8-91d1-434c-bb45-d864888a086b'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('991cfed7-1213-4c6d-87c9-1f5d715b2a79'::uuid, '326c066b-3188-42df-8f3f-a0abdf284b6c'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('991cfed7-1213-4c6d-87c9-1f5d715b2a79'::uuid, 'c5bb925c-49a4-484e-a66a-f2abb2ec6739'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('991cfed7-1213-4c6d-87c9-1f5d715b2a79'::uuid, '2a617bd1-94fd-423d-b9d7-e19b24f8e2c6'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('991cfed7-1213-4c6d-87c9-1f5d715b2a79'::uuid, '74e280d0-ea4f-4b1e-9a2d-f799db7f24fb'::uuid);

