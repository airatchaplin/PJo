INSERT INTO public.details
(id, "name", time_packing, material_id)
VALUES('d3830e75-1a3c-4dc2-a6ea-91b48f429886'::uuid, 'Фасадная кассета VALKOR (ЗТ) ПЭ 0.7 мм', '00:02:40', 'fbff29ac-ed22-4ed9-9d34-19a4ca9f5bb9'::uuid);

INSERT INTO public.detail_list
(id, is_selected, main_or_alternative)
VALUES('a1946877-43d0-475d-be2e-afd7e1e3cc10'::uuid, false, 1);

INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('07afa3a8-a3ff-4531-b928-262d0c46b4a7'::uuid, '540*510, 1170*510 по тех.карте', 0, '00:06:04', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('cd632e46-e4ac-41df-a0ff-3eb779ab1263'::uuid, '540*510, 1170*510 по тех.карте', 1, '00:02:52', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('5c5d7b9f-2876-4a70-b620-36441d1a48a3'::uuid, '540*510 по тех.картам', 2, '00:01:20', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('762b9c47-d3de-48f4-9fdc-4ff691c64c00'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('cb0cd8e4-ef48-40d3-8faf-09eb35c98992'::uuid, '', 4, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.detail_list
(id, is_selected, main_or_alternative)
VALUES('c566fa26-5e3d-4d54-8863-d72f3bf4eb5e'::uuid, false, 2);

INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('e587a0d5-5ddf-4af4-8851-5d3da4fee31e'::uuid, '', 0, '00:00:00', 'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('d54aa36f-8bf8-4cb8-a475-de01b86b6f4d'::uuid, '', 1, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('52f60c20-5408-4406-93d9-0a17cfbaa874'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('ff790e1f-a6f2-4337-bcb2-a49cdac77f4c'::uuid, '', 3, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.details_detail_lists
(detail_id, detail_lists_id)
VALUES('d3830e75-1a3c-4dc2-a6ea-91b48f429886'::uuid, 'a1946877-43d0-475d-be2e-afd7e1e3cc10'::uuid);
INSERT INTO public.details_detail_lists
(detail_id, detail_lists_id)
VALUES('d3830e75-1a3c-4dc2-a6ea-91b48f429886'::uuid, 'c566fa26-5e3d-4d54-8863-d72f3bf4eb5e'::uuid);

INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('a1946877-43d0-475d-be2e-afd7e1e3cc10'::uuid, '07afa3a8-a3ff-4531-b928-262d0c46b4a7'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('a1946877-43d0-475d-be2e-afd7e1e3cc10'::uuid, 'cd632e46-e4ac-41df-a0ff-3eb779ab1263'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('a1946877-43d0-475d-be2e-afd7e1e3cc10'::uuid, '5c5d7b9f-2876-4a70-b620-36441d1a48a3'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('a1946877-43d0-475d-be2e-afd7e1e3cc10'::uuid, '762b9c47-d3de-48f4-9fdc-4ff691c64c00'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('a1946877-43d0-475d-be2e-afd7e1e3cc10'::uuid, 'cb0cd8e4-ef48-40d3-8faf-09eb35c98992'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('c566fa26-5e3d-4d54-8863-d72f3bf4eb5e'::uuid, 'e587a0d5-5ddf-4af4-8851-5d3da4fee31e'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('c566fa26-5e3d-4d54-8863-d72f3bf4eb5e'::uuid, 'd54aa36f-8bf8-4cb8-a475-de01b86b6f4d'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('c566fa26-5e3d-4d54-8863-d72f3bf4eb5e'::uuid, '52f60c20-5408-4406-93d9-0a17cfbaa874'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('c566fa26-5e3d-4d54-8863-d72f3bf4eb5e'::uuid, 'ff790e1f-a6f2-4337-bcb2-a49cdac77f4c'::uuid);
