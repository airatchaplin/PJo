INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('56dc617d-368e-4556-b92d-44732d5ff4b0'::uuid, 'Фасадная кассета VALKOR (ОТ) ОЦ 2.0 мм', '00:02:40',
        '4a19ee13-b056-418b-97a1-9919934963dc'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('4ba98dad-93f4-4a8f-9d7d-5c52a2b61b8c'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('ef1f852e-bd5b-47dd-9e83-11a44884d9aa'::uuid, '1165*540 8 шт с листа по тех.картам', 0, '00:11:20',
        'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('b8db9efd-2820-489b-9f97-07a4260edb62'::uuid, '1165*540 8 шт с листа по тех.картам', 1, '00:12:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('80f00015-1787-49c2-86b2-6d32ee4be658'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('7999d31a-0cbd-46ab-876b-b4233caea65a'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('b985af67-3e69-4102-8237-3444d0711e0a'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('d0b2b041-e751-4028-b59b-51a8049c3792'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('e49a4198-1602-42c5-bdc4-61c5e268b27c'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('dcd91b9c-210d-4dfa-82a9-d1e241a95de9'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('56dc617d-368e-4556-b92d-44732d5ff4b0'::uuid, '4ba98dad-93f4-4a8f-9d7d-5c52a2b61b8c'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('56dc617d-368e-4556-b92d-44732d5ff4b0'::uuid, '7999d31a-0cbd-46ab-876b-b4233caea65a'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('4ba98dad-93f4-4a8f-9d7d-5c52a2b61b8c'::uuid, 'ef1f852e-bd5b-47dd-9e83-11a44884d9aa'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('4ba98dad-93f4-4a8f-9d7d-5c52a2b61b8c'::uuid, 'b8db9efd-2820-489b-9f97-07a4260edb62'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('4ba98dad-93f4-4a8f-9d7d-5c52a2b61b8c'::uuid, '80f00015-1787-49c2-86b2-6d32ee4be658'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('7999d31a-0cbd-46ab-876b-b4233caea65a'::uuid, 'b985af67-3e69-4102-8237-3444d0711e0a'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('7999d31a-0cbd-46ab-876b-b4233caea65a'::uuid, 'd0b2b041-e751-4028-b59b-51a8049c3792'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('7999d31a-0cbd-46ab-876b-b4233caea65a'::uuid, 'e49a4198-1602-42c5-bdc4-61c5e268b27c'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('7999d31a-0cbd-46ab-876b-b4233caea65a'::uuid, 'dcd91b9c-210d-4dfa-82a9-d1e241a95de9'::uuid);
