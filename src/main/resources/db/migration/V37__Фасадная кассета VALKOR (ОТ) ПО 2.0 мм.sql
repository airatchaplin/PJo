INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('bcaa0443-6b36-40ed-9c89-e6f9e5c710ce'::uuid, 'Фасадная кассета VALKOR (ОТ) ПО 2.0 мм', '00:02:40',
        '735e79f5-a36b-43d8-85c0-5d4042bffe4f'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('ce29c2fc-9c55-4d8a-9952-6f3fc1e4ac15'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('5eb236ee-2941-49fe-93d6-a9643e3ba96a'::uuid, '1165*540 8 шт с листа по тех.картам', 0, '00:11:20',
        'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('b24a884a-3d5f-44ac-af01-cfc77d11ef08'::uuid, '1165*540 8 шт с листа по тех.картам', 1, '00:12:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('5f8080e0-5ad6-42ca-9b1a-8992fe57d878'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('2030e004-9848-498c-bfa6-f3336838c9e4'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('6c78cda9-5342-4015-a04c-4f3ab58901b4'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('b4b8feeb-6669-4c4f-9a8e-62ef1057ecaa'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('9a4c1139-f7c1-4ad7-8c7d-54bb0c5de990'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('41b13014-c8ef-4f9d-a0c9-bed9acad0739'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('bcaa0443-6b36-40ed-9c89-e6f9e5c710ce'::uuid, 'ce29c2fc-9c55-4d8a-9952-6f3fc1e4ac15'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('bcaa0443-6b36-40ed-9c89-e6f9e5c710ce'::uuid, '2030e004-9848-498c-bfa6-f3336838c9e4'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('ce29c2fc-9c55-4d8a-9952-6f3fc1e4ac15'::uuid, '5eb236ee-2941-49fe-93d6-a9643e3ba96a'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('ce29c2fc-9c55-4d8a-9952-6f3fc1e4ac15'::uuid, 'b24a884a-3d5f-44ac-af01-cfc77d11ef08'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('ce29c2fc-9c55-4d8a-9952-6f3fc1e4ac15'::uuid, '5f8080e0-5ad6-42ca-9b1a-8992fe57d878'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('2030e004-9848-498c-bfa6-f3336838c9e4'::uuid, '6c78cda9-5342-4015-a04c-4f3ab58901b4'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('2030e004-9848-498c-bfa6-f3336838c9e4'::uuid, 'b4b8feeb-6669-4c4f-9a8e-62ef1057ecaa'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('2030e004-9848-498c-bfa6-f3336838c9e4'::uuid, '9a4c1139-f7c1-4ad7-8c7d-54bb0c5de990'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('2030e004-9848-498c-bfa6-f3336838c9e4'::uuid, '41b13014-c8ef-4f9d-a0c9-bed9acad0739'::uuid);

