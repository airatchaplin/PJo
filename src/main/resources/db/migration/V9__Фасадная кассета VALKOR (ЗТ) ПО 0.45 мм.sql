INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('9318e84f-c888-4afb-b05d-d979320c85b6'::uuid, 'Фасадная кассета VALKOR (ЗТ) ПО 0.45 мм', '00:02:40',
        'da3d5301-02f1-4a9e-a41f-5daeb3e51583'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('18133ae1-f34e-4ac1-872f-80b4ab382723'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('f6f71c9a-ea5e-44a0-bb68-8146a3da839f'::uuid, '540*510, 1170*510 по тех.карте', 0, '00:05:20',
        'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('33678815-b142-487d-8a5f-d53262f20d94'::uuid, '540*510, 1170*510 по тех.карте', 1, '00:01:20',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('5ab705b9-f840-4046-90b4-536b66a2898c'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('58f51fd7-d148-4b44-b619-2387df4a0222'::uuid, '', 3, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('88bb6e26-ad46-4350-b2dc-f794f1237bf7'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('2499cbec-e6a8-44df-8e0d-1f12580c5a56'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('ad4ebefd-10bc-47fa-bfef-7cf94d846c1b'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('c7006901-c9b3-4b54-a4de-ec81a858c316'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('8442774e-272b-4b90-8e15-0068ad6845d0'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('5c025d53-9d7d-4387-a9e4-15849f160d94'::uuid, '', 4, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('9318e84f-c888-4afb-b05d-d979320c85b6'::uuid, '18133ae1-f34e-4ac1-872f-80b4ab382723'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('9318e84f-c888-4afb-b05d-d979320c85b6'::uuid, '88bb6e26-ad46-4350-b2dc-f794f1237bf7'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('18133ae1-f34e-4ac1-872f-80b4ab382723'::uuid, 'f6f71c9a-ea5e-44a0-bb68-8146a3da839f'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('18133ae1-f34e-4ac1-872f-80b4ab382723'::uuid, '33678815-b142-487d-8a5f-d53262f20d94'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('18133ae1-f34e-4ac1-872f-80b4ab382723'::uuid, '5ab705b9-f840-4046-90b4-536b66a2898c'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('18133ae1-f34e-4ac1-872f-80b4ab382723'::uuid, '58f51fd7-d148-4b44-b619-2387df4a0222'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('88bb6e26-ad46-4350-b2dc-f794f1237bf7'::uuid, '2499cbec-e6a8-44df-8e0d-1f12580c5a56'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('88bb6e26-ad46-4350-b2dc-f794f1237bf7'::uuid, 'ad4ebefd-10bc-47fa-bfef-7cf94d846c1b'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('88bb6e26-ad46-4350-b2dc-f794f1237bf7'::uuid, 'c7006901-c9b3-4b54-a4de-ec81a858c316'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('88bb6e26-ad46-4350-b2dc-f794f1237bf7'::uuid, '8442774e-272b-4b90-8e15-0068ad6845d0'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('88bb6e26-ad46-4350-b2dc-f794f1237bf7'::uuid, '5c025d53-9d7d-4387-a9e4-15849f160d94'::uuid);
