INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('1b7056b9-bac8-4131-9319-9ac593eef0ad'::uuid,
        'Фасадная кассета VALKOR (ЗТ) ПЭ 1.2 мм (ЧПУ 3м - 1165*540 8 шт с листа)', '00:02:40',
        '21ee3088-6f02-4894-a84a-cdc9900d0bfb'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('680b8c25-d35f-4a26-8462-bb8546baaf54'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('83bbaf81-9489-42c7-9cd9-b058337dbaed'::uuid, '540*510, 1170*510 по тех.карте', 0, '00:06:04',
        '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('f882ac78-5cc6-4919-82a1-0c5b164966bb'::uuid, '540*510, 1170*510 по тех.карте', 1, '00:02:52',
        'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('a640dc18-256a-4d2c-ab24-d1099e1d7837'::uuid, '1165*540 8 шт с листа по тех.карте', 2, '00:12:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('f60230ab-4d60-4152-9b0c-c54eb8796028'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('18195ba5-fb41-4457-9472-1e9c4e75e701'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('3b585559-eba2-48e5-9837-4a46c17a961d'::uuid, '', 0, '00:00:00', 'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('a4379205-f54a-424a-b35e-da3e13dfc4e8'::uuid, '', 1, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('9bfe03cc-43ee-424c-a79d-baa8f9f73a3d'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('1b7056b9-bac8-4131-9319-9ac593eef0ad'::uuid, '680b8c25-d35f-4a26-8462-bb8546baaf54'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('1b7056b9-bac8-4131-9319-9ac593eef0ad'::uuid, '18195ba5-fb41-4457-9472-1e9c4e75e701'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('680b8c25-d35f-4a26-8462-bb8546baaf54'::uuid, '83bbaf81-9489-42c7-9cd9-b058337dbaed'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('680b8c25-d35f-4a26-8462-bb8546baaf54'::uuid, 'f882ac78-5cc6-4919-82a1-0c5b164966bb'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('680b8c25-d35f-4a26-8462-bb8546baaf54'::uuid, 'a640dc18-256a-4d2c-ab24-d1099e1d7837'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('680b8c25-d35f-4a26-8462-bb8546baaf54'::uuid, 'f60230ab-4d60-4152-9b0c-c54eb8796028'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('18195ba5-fb41-4457-9472-1e9c4e75e701'::uuid, '3b585559-eba2-48e5-9837-4a46c17a961d'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('18195ba5-fb41-4457-9472-1e9c4e75e701'::uuid, 'a4379205-f54a-424a-b35e-da3e13dfc4e8'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('18195ba5-fb41-4457-9472-1e9c4e75e701'::uuid, '9bfe03cc-43ee-424c-a79d-baa8f9f73a3d'::uuid);
