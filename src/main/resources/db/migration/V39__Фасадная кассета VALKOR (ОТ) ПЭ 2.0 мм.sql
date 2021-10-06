INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('b81b3cef-3a61-4915-983d-3efa3a063ab2'::uuid, 'Фасадная кассета VALKOR (ОТ) ПЭ 2.0 мм', '00:02:40',
        '681d7860-e43a-4864-8e77-0d7df7d54f2f'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('ca627e95-40d9-4d48-9916-97f323b7380c'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('ff0ab170-95fd-46e7-93c8-f11dc11cd19e'::uuid, '1165*540 4 шт с листа по тех карте', 0, '00:06:20',
        '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('488201f3-74e1-4427-b6c3-4f939a51f90b'::uuid, '1165*540 4 шт с листа по тех карте', 1, '00:02:40',
        'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('4dfadecf-c82a-4408-af0e-3dd8f769d94d'::uuid, '1165*540 8 шт с листа по тех.карте', 2, '00:12:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('15d55d1f-b13a-4f96-95f1-c7a5721f6179'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('21210521-9ea4-4570-aeda-c6a6a0b95fbc'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('cc62591e-32b8-4631-aa8d-aa40837d2473'::uuid, '', 0, '00:00:00', 'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('5c1dc102-4267-44c9-b35e-1cd4d5516d96'::uuid, '', 1, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('f7d8ae88-85ba-4573-9286-1d9205cadbe2'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('b81b3cef-3a61-4915-983d-3efa3a063ab2'::uuid, 'ca627e95-40d9-4d48-9916-97f323b7380c'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('b81b3cef-3a61-4915-983d-3efa3a063ab2'::uuid, '21210521-9ea4-4570-aeda-c6a6a0b95fbc'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('ca627e95-40d9-4d48-9916-97f323b7380c'::uuid, 'ff0ab170-95fd-46e7-93c8-f11dc11cd19e'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('ca627e95-40d9-4d48-9916-97f323b7380c'::uuid, '488201f3-74e1-4427-b6c3-4f939a51f90b'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('ca627e95-40d9-4d48-9916-97f323b7380c'::uuid, '4dfadecf-c82a-4408-af0e-3dd8f769d94d'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('ca627e95-40d9-4d48-9916-97f323b7380c'::uuid, '15d55d1f-b13a-4f96-95f1-c7a5721f6179'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('21210521-9ea4-4570-aeda-c6a6a0b95fbc'::uuid, 'cc62591e-32b8-4631-aa8d-aa40837d2473'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('21210521-9ea4-4570-aeda-c6a6a0b95fbc'::uuid, '5c1dc102-4267-44c9-b35e-1cd4d5516d96'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('21210521-9ea4-4570-aeda-c6a6a0b95fbc'::uuid, 'f7d8ae88-85ba-4573-9286-1d9205cadbe2'::uuid);
