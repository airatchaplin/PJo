INSERT INTO public.details
(id, "name", time_packing, material_id)
VALUES('5b4e9fdd-e9b0-4ae0-96c6-deb052c1c104'::uuid, 'Фасадная кассета VALKOR (ЗТ) ОЦ 1.0 мм', '00:02:40', 'dd1d05d5-e4a2-4f70-a21c-ea91b7906650'::uuid);

INSERT INTO public.detail_list
(id, is_selected, main_or_alternative)
VALUES('04f14a41-8330-45df-b57d-9b169dca486d'::uuid, false, 1);

INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('7c27b199-ee9e-4581-a1a2-9b280a5bd859'::uuid, '540*510, 1170*510 по тех.карте', 0, '00:05:20', 'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('fcf00bd0-cc06-4969-99a4-935c13f2441b'::uuid, '540*510, 1170*510 по тех.карте', 1, '00:01:20', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('6bcbea4c-bbdb-4435-95b0-2454de35d37c'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
(id, is_selected, main_or_alternative)
VALUES('729cd80c-a8ef-48ff-85fb-65dc1cb3f3fa'::uuid, false, 2);

INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('f1029d54-0b61-4fec-9fde-70a13693f7b0'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('1b698810-a743-4195-8cb0-63f2c18b71fa'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('9cc91cd5-e5a3-49e5-83b0-f32f8a76a155'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('3b5de897-f9e3-4603-9af6-5b070f47424c'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
(detail_id, detail_lists_id)
VALUES('5b4e9fdd-e9b0-4ae0-96c6-deb052c1c104'::uuid, '04f14a41-8330-45df-b57d-9b169dca486d'::uuid);
INSERT INTO public.details_detail_lists
(detail_id, detail_lists_id)
VALUES('5b4e9fdd-e9b0-4ae0-96c6-deb052c1c104'::uuid, '729cd80c-a8ef-48ff-85fb-65dc1cb3f3fa'::uuid);

INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('04f14a41-8330-45df-b57d-9b169dca486d'::uuid, '7c27b199-ee9e-4581-a1a2-9b280a5bd859'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('04f14a41-8330-45df-b57d-9b169dca486d'::uuid, 'fcf00bd0-cc06-4969-99a4-935c13f2441b'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('04f14a41-8330-45df-b57d-9b169dca486d'::uuid, '6bcbea4c-bbdb-4435-95b0-2454de35d37c'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('729cd80c-a8ef-48ff-85fb-65dc1cb3f3fa'::uuid, 'f1029d54-0b61-4fec-9fde-70a13693f7b0'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('729cd80c-a8ef-48ff-85fb-65dc1cb3f3fa'::uuid, '1b698810-a743-4195-8cb0-63f2c18b71fa'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('729cd80c-a8ef-48ff-85fb-65dc1cb3f3fa'::uuid, '9cc91cd5-e5a3-49e5-83b0-f32f8a76a155'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('729cd80c-a8ef-48ff-85fb-65dc1cb3f3fa'::uuid, '3b5de897-f9e3-4603-9af6-5b070f47424c'::uuid);
