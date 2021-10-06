INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('77b74951-3836-44d9-95f5-e25ecf05f0c5'::uuid, 'Фасадная кассета VALKOR (ЗТ) ПО 1.5 мм', '00:02:40',
        '014ff617-3170-4b31-98e5-43c31f4511df'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('d681cb9a-4ad5-48ee-a035-30bcbb15b8b0'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('392bb16d-2b70-4e90-afa8-335c7d0c62d7'::uuid, '540*510, 1170*510 по тех.карте', 0, '00:11:20',
        'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('f1197b85-3cc6-4abd-9d95-fd237c54c7b7'::uuid, '1170*510 по тех.карте', 1, '00:06:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('f6d6fd2a-94f8-4a3e-91ca-0c3ed7741d1a'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('aa10aa3c-f3e9-484a-8919-d2faae07cf33'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('96161783-36c4-46ef-a2eb-d44cce189f98'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('198607f6-8b1c-4a41-bac2-cefa51fdba2e'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('ba999510-663b-4d1f-9b8a-ec312ee4e8b7'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('b4b68cbb-4313-4bb5-8ddc-341e2021f9f4'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('77b74951-3836-44d9-95f5-e25ecf05f0c5'::uuid, 'd681cb9a-4ad5-48ee-a035-30bcbb15b8b0'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('77b74951-3836-44d9-95f5-e25ecf05f0c5'::uuid, 'aa10aa3c-f3e9-484a-8919-d2faae07cf33'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('d681cb9a-4ad5-48ee-a035-30bcbb15b8b0'::uuid, '392bb16d-2b70-4e90-afa8-335c7d0c62d7'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('d681cb9a-4ad5-48ee-a035-30bcbb15b8b0'::uuid, 'f1197b85-3cc6-4abd-9d95-fd237c54c7b7'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('d681cb9a-4ad5-48ee-a035-30bcbb15b8b0'::uuid, 'f6d6fd2a-94f8-4a3e-91ca-0c3ed7741d1a'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('aa10aa3c-f3e9-484a-8919-d2faae07cf33'::uuid, '96161783-36c4-46ef-a2eb-d44cce189f98'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('aa10aa3c-f3e9-484a-8919-d2faae07cf33'::uuid, '198607f6-8b1c-4a41-bac2-cefa51fdba2e'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('aa10aa3c-f3e9-484a-8919-d2faae07cf33'::uuid, 'ba999510-663b-4d1f-9b8a-ec312ee4e8b7'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('aa10aa3c-f3e9-484a-8919-d2faae07cf33'::uuid, 'b4b68cbb-4313-4bb5-8ddc-341e2021f9f4'::uuid);
