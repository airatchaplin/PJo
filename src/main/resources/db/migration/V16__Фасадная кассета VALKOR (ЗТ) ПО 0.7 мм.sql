INSERT INTO public.details
(id, "name", time_packing, material_id)
VALUES('17bce184-8bcc-4175-89fa-1152f65425b9'::uuid, 'Фасадная кассета VALKOR (ЗТ) ПО 0.7 мм', '00:02:40', '30c4c38b-2a33-4464-b329-39ed52ae1440'::uuid);

INSERT INTO public.detail_list
(id, is_selected, main_or_alternative)
VALUES('0e81876f-2a33-4161-9ed3-fbc2211f8e31'::uuid, false, 1);

INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('8ca77314-9e7f-4363-bc6e-710bda28521b'::uuid, '540*510, 1170*510 по тех.карте', 0, '00:05:20', 'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('62a9d9da-1556-4e32-91f0-77fa4fca5d67'::uuid, '540*510 по тех.картам', 1, '00:01:20', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('2c0b26af-882c-440f-a362-9a78b7f2a2d6'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('75bc92a6-7083-4e13-8a4f-9cd011620ef5'::uuid, '', 3, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.detail_list
(id, is_selected, main_or_alternative)
VALUES('bcbdac7c-de1f-4986-a787-da7eb694a328'::uuid, false, 2);

INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('701bd947-be0f-497d-b93c-87af38d89f1d'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('7962578b-e655-4ce9-a43f-8c29d7395bdd'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('761cf099-4e0d-4f07-91b5-1e4973add1ec'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('f2ed2bbc-17b3-4291-85c1-1f1220c22c05'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('461353c6-118e-4ae5-854c-3098640b5c6d'::uuid, '', 4, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.details_detail_lists
(detail_id, detail_lists_id)
VALUES('17bce184-8bcc-4175-89fa-1152f65425b9'::uuid, '0e81876f-2a33-4161-9ed3-fbc2211f8e31'::uuid);
INSERT INTO public.details_detail_lists
(detail_id, detail_lists_id)
VALUES('17bce184-8bcc-4175-89fa-1152f65425b9'::uuid, 'bcbdac7c-de1f-4986-a787-da7eb694a328'::uuid);

INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('0e81876f-2a33-4161-9ed3-fbc2211f8e31'::uuid, '8ca77314-9e7f-4363-bc6e-710bda28521b'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('0e81876f-2a33-4161-9ed3-fbc2211f8e31'::uuid, '62a9d9da-1556-4e32-91f0-77fa4fca5d67'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('0e81876f-2a33-4161-9ed3-fbc2211f8e31'::uuid, '2c0b26af-882c-440f-a362-9a78b7f2a2d6'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('0e81876f-2a33-4161-9ed3-fbc2211f8e31'::uuid, '75bc92a6-7083-4e13-8a4f-9cd011620ef5'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('bcbdac7c-de1f-4986-a787-da7eb694a328'::uuid, '701bd947-be0f-497d-b93c-87af38d89f1d'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('bcbdac7c-de1f-4986-a787-da7eb694a328'::uuid, '7962578b-e655-4ce9-a43f-8c29d7395bdd'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('bcbdac7c-de1f-4986-a787-da7eb694a328'::uuid, '761cf099-4e0d-4f07-91b5-1e4973add1ec'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('bcbdac7c-de1f-4986-a787-da7eb694a328'::uuid, 'f2ed2bbc-17b3-4291-85c1-1f1220c22c05'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('bcbdac7c-de1f-4986-a787-da7eb694a328'::uuid, '461353c6-118e-4ae5-854c-3098640b5c6d'::uuid);
