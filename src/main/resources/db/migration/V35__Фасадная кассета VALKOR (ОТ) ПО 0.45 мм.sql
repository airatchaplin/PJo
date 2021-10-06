INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('0054aea7-32e1-423b-88ca-65bd4504b64e'::uuid, 'Фасадная кассета VALKOR (ОТ) ПО 0.45 мм', '00:02:40',
        'da3d5301-02f1-4a9e-a41f-5daeb3e51583'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('9aaaa8ff-d0d5-439e-99ec-995c8781e73d'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('37be5a11-37ec-46fe-ba58-1e0651a12a97'::uuid, '1165*540 8 шт с листа по тех.картам', 0, '00:05:20',
        'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('19fb2069-ea1a-46d9-9fc4-6b08d7226ace'::uuid, '1165*540 8 шт с листа по тех.картам', 1, '00:12:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('984fa1e9-b84b-4c21-8649-a79f35e6c30d'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('da0eceeb-207f-465a-b9a5-bdfdf18c436b'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('aaafa2df-cab4-4ed1-bc63-ae0116c7388a'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('69ce3456-6f3c-4c2d-9450-2954acb0ed30'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('f90eba11-980f-4eed-8ba2-6ce3b0457fce'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('0faf4fcc-c838-4ae3-92fa-6c4c45d28804'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('0054aea7-32e1-423b-88ca-65bd4504b64e'::uuid, '9aaaa8ff-d0d5-439e-99ec-995c8781e73d'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('0054aea7-32e1-423b-88ca-65bd4504b64e'::uuid, 'da0eceeb-207f-465a-b9a5-bdfdf18c436b'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('9aaaa8ff-d0d5-439e-99ec-995c8781e73d'::uuid, '37be5a11-37ec-46fe-ba58-1e0651a12a97'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('9aaaa8ff-d0d5-439e-99ec-995c8781e73d'::uuid, '19fb2069-ea1a-46d9-9fc4-6b08d7226ace'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('9aaaa8ff-d0d5-439e-99ec-995c8781e73d'::uuid, '984fa1e9-b84b-4c21-8649-a79f35e6c30d'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('da0eceeb-207f-465a-b9a5-bdfdf18c436b'::uuid, 'aaafa2df-cab4-4ed1-bc63-ae0116c7388a'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('da0eceeb-207f-465a-b9a5-bdfdf18c436b'::uuid, '69ce3456-6f3c-4c2d-9450-2954acb0ed30'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('da0eceeb-207f-465a-b9a5-bdfdf18c436b'::uuid, 'f90eba11-980f-4eed-8ba2-6ce3b0457fce'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('da0eceeb-207f-465a-b9a5-bdfdf18c436b'::uuid, '0faf4fcc-c838-4ae3-92fa-6c4c45d28804'::uuid);
