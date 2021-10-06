INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('11971f8e-b049-4409-8351-fe486803b46a'::uuid, 'Фасадная кассета VALKOR (ОТ) ОЦ 1.5 мм', '00:02:40',
        'de8280cc-fd56-4047-933f-47329fa3fe02'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('9eef9030-ac64-4efa-8af9-81a3aa566f05'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('9873a140-daf2-4dae-a4b7-518f265ee660'::uuid, '1165*540 8 шт с листа по тех.картам', 0, '00:11:20',
        'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('a8521c5f-ff4b-4342-804d-a484adb4739d'::uuid, '1165*540 8 шт с листа по тех.картам', 1, '00:12:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('f8f3e35b-ca4a-45a1-b29b-7d6f4b1336e8'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('8dd5266a-9551-4555-b92e-4346bf49f9b4'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('7bda50cf-df7a-4252-9a1e-ed861b11089f'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('498f91cf-6490-480e-8292-b771bb4a2b6d'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('45d952b8-3bac-4125-b674-5325551b316d'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('1c6a09b1-af05-4c1b-b54d-4af9b3ca159f'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('11971f8e-b049-4409-8351-fe486803b46a'::uuid, '9eef9030-ac64-4efa-8af9-81a3aa566f05'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('11971f8e-b049-4409-8351-fe486803b46a'::uuid, '8dd5266a-9551-4555-b92e-4346bf49f9b4'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('9eef9030-ac64-4efa-8af9-81a3aa566f05'::uuid, '9873a140-daf2-4dae-a4b7-518f265ee660'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('9eef9030-ac64-4efa-8af9-81a3aa566f05'::uuid, 'a8521c5f-ff4b-4342-804d-a484adb4739d'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('9eef9030-ac64-4efa-8af9-81a3aa566f05'::uuid, 'f8f3e35b-ca4a-45a1-b29b-7d6f4b1336e8'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('8dd5266a-9551-4555-b92e-4346bf49f9b4'::uuid, '7bda50cf-df7a-4252-9a1e-ed861b11089f'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('8dd5266a-9551-4555-b92e-4346bf49f9b4'::uuid, '498f91cf-6490-480e-8292-b771bb4a2b6d'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('8dd5266a-9551-4555-b92e-4346bf49f9b4'::uuid, '45d952b8-3bac-4125-b674-5325551b316d'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('8dd5266a-9551-4555-b92e-4346bf49f9b4'::uuid, '1c6a09b1-af05-4c1b-b54d-4af9b3ca159f'::uuid);
