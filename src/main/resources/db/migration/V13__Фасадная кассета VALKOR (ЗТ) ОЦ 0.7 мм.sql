INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('30407415-bdb4-4b1c-9d22-ac54953f7053'::uuid, 'Фасадная кассета VALKOR (ЗТ) ОЦ 0.7 мм', '00:02:40',
        'c804c17a-3860-4da5-bc45-8758aacf8ea5'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('2180deef-9b6a-48bf-935d-c0bce0b1fcc5'::uuid, false, 1);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('f0b0b97a-0cc9-4bc0-8c79-c7b35e6ecea1'::uuid, '540*510, 1170*510 по тех.карте', 0, '00:05:20',
        'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('c59eefa0-7155-45f0-b89c-27271658e8a2'::uuid, '540*510 по тех.картам', 1, '00:01:20',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('9a344544-98f4-46ba-ad89-a8317be30bd5'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('245b3225-7736-4680-8026-5c7e303a979b'::uuid, '', 3, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('512b8c74-483a-49bc-a858-a675a581fbc2'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('9ab7b881-e10a-44f6-9f13-54df6423fb01'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('faa92f4f-867e-4d20-854b-a8c2cff8a2a2'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('1bbcd338-6f2d-4e6a-b3e3-558da26ecbd6'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('c41e2657-8680-4546-b1b9-0fbe9c457da0'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('37884e1a-93a9-45bd-89fc-1e4acf979429'::uuid, '', 4, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('30407415-bdb4-4b1c-9d22-ac54953f7053'::uuid, '2180deef-9b6a-48bf-935d-c0bce0b1fcc5'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('30407415-bdb4-4b1c-9d22-ac54953f7053'::uuid, '512b8c74-483a-49bc-a858-a675a581fbc2'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('2180deef-9b6a-48bf-935d-c0bce0b1fcc5'::uuid, 'f0b0b97a-0cc9-4bc0-8c79-c7b35e6ecea1'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('2180deef-9b6a-48bf-935d-c0bce0b1fcc5'::uuid, 'c59eefa0-7155-45f0-b89c-27271658e8a2'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('2180deef-9b6a-48bf-935d-c0bce0b1fcc5'::uuid, '9a344544-98f4-46ba-ad89-a8317be30bd5'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('2180deef-9b6a-48bf-935d-c0bce0b1fcc5'::uuid, '245b3225-7736-4680-8026-5c7e303a979b'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('512b8c74-483a-49bc-a858-a675a581fbc2'::uuid, '9ab7b881-e10a-44f6-9f13-54df6423fb01'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('512b8c74-483a-49bc-a858-a675a581fbc2'::uuid, 'faa92f4f-867e-4d20-854b-a8c2cff8a2a2'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('512b8c74-483a-49bc-a858-a675a581fbc2'::uuid, '1bbcd338-6f2d-4e6a-b3e3-558da26ecbd6'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('512b8c74-483a-49bc-a858-a675a581fbc2'::uuid, 'c41e2657-8680-4546-b1b9-0fbe9c457da0'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('512b8c74-483a-49bc-a858-a675a581fbc2'::uuid, '37884e1a-93a9-45bd-89fc-1e4acf979429'::uuid);
