INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('21cc0cd3-ec89-4daf-9b98-e1c8595363e7'::uuid, 'Фасадная кассета VALKOR (ОТ) ОЦ 0.7 мм', '00:02:40',
        'c804c17a-3860-4da5-bc45-8758aacf8ea5'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('9f468f54-64e9-4d8e-804d-1e0b54534330'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('eba32e41-07e8-4b0b-aba2-72a4de91fc27'::uuid, '1165*540 8 шт с листа по тех.картам', 0, '00:05:20',
        'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('aff4319b-beb2-4b74-b866-2704bdd4607a'::uuid, '1165*540 8 шт с листа по тех.картам', 1, '00:12:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('c503e102-066e-4db9-adee-825a72cae2a6'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('3b1947da-9a30-4d24-a411-ed35b3136e76'::uuid, '', 3, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('88c13f31-7a25-42ba-890e-04c730ce6eaf'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('765fdf78-a088-465a-9ae1-fdeb7d12b147'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('100b0df0-e57f-4ddf-8bdf-a658e866e308'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('cdc0bc55-0d70-40a8-b27e-cfa744486981'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('f1971188-f247-45ec-b232-863d15dbf4a9'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('813ec45c-6bac-469a-97d0-7e6d8fd86bf1'::uuid, '', 4, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('21cc0cd3-ec89-4daf-9b98-e1c8595363e7'::uuid, '9f468f54-64e9-4d8e-804d-1e0b54534330'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('21cc0cd3-ec89-4daf-9b98-e1c8595363e7'::uuid, '88c13f31-7a25-42ba-890e-04c730ce6eaf'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('9f468f54-64e9-4d8e-804d-1e0b54534330'::uuid, 'eba32e41-07e8-4b0b-aba2-72a4de91fc27'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('9f468f54-64e9-4d8e-804d-1e0b54534330'::uuid, 'aff4319b-beb2-4b74-b866-2704bdd4607a'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('9f468f54-64e9-4d8e-804d-1e0b54534330'::uuid, 'c503e102-066e-4db9-adee-825a72cae2a6'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('9f468f54-64e9-4d8e-804d-1e0b54534330'::uuid, '3b1947da-9a30-4d24-a411-ed35b3136e76'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('88c13f31-7a25-42ba-890e-04c730ce6eaf'::uuid, '765fdf78-a088-465a-9ae1-fdeb7d12b147'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('88c13f31-7a25-42ba-890e-04c730ce6eaf'::uuid, '100b0df0-e57f-4ddf-8bdf-a658e866e308'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('88c13f31-7a25-42ba-890e-04c730ce6eaf'::uuid, 'cdc0bc55-0d70-40a8-b27e-cfa744486981'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('88c13f31-7a25-42ba-890e-04c730ce6eaf'::uuid, 'f1971188-f247-45ec-b232-863d15dbf4a9'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('88c13f31-7a25-42ba-890e-04c730ce6eaf'::uuid, '813ec45c-6bac-469a-97d0-7e6d8fd86bf1'::uuid);

