INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('710f6680-7041-4281-a73c-f9cdebe8245d'::uuid, 'Фасадная кассета VALKOR (ЗТ) ОЦ 0.45 мм', '00:02:40',
        '901c2d39-95c3-4255-85bf-7b58098c29a5'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('6cdaba43-3acd-4686-b813-f6ba0034c8ff'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('5cbc36d9-a61d-4940-99ef-1e6c2ee3f739'::uuid, '540*510, 1170*510 по тех.карте', 0, '00:05:20',
        'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('9e689d19-acbc-479f-bfc9-855c7d3ac35d'::uuid, '540*510, 1170*510 по тех.карте', 1, '00:01:20',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('f0999ec3-cd9d-4c54-971a-5ceb3c3653bb'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('7df48438-606b-497e-9dd9-f31b87969c3c'::uuid, '', 3, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('1150cb80-b877-4464-925a-3574f8ea713a'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('acb66a16-a337-40ca-b778-67f820704355'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('e301659a-113f-4e21-bbd7-0824cb5db76b'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('752e192f-2451-4b2b-89fd-c048525202c4'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('4cd5e949-aeeb-49f6-bfa1-1c520029814a'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('596d39e9-a12c-4cf4-a52d-7c54c23509d8'::uuid, '', 4, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('710f6680-7041-4281-a73c-f9cdebe8245d'::uuid, '6cdaba43-3acd-4686-b813-f6ba0034c8ff'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('710f6680-7041-4281-a73c-f9cdebe8245d'::uuid, '1150cb80-b877-4464-925a-3574f8ea713a'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('6cdaba43-3acd-4686-b813-f6ba0034c8ff'::uuid, '5cbc36d9-a61d-4940-99ef-1e6c2ee3f739'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('6cdaba43-3acd-4686-b813-f6ba0034c8ff'::uuid, '9e689d19-acbc-479f-bfc9-855c7d3ac35d'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('6cdaba43-3acd-4686-b813-f6ba0034c8ff'::uuid, 'f0999ec3-cd9d-4c54-971a-5ceb3c3653bb'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('6cdaba43-3acd-4686-b813-f6ba0034c8ff'::uuid, '7df48438-606b-497e-9dd9-f31b87969c3c'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('1150cb80-b877-4464-925a-3574f8ea713a'::uuid, 'acb66a16-a337-40ca-b778-67f820704355'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('1150cb80-b877-4464-925a-3574f8ea713a'::uuid, 'e301659a-113f-4e21-bbd7-0824cb5db76b'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('1150cb80-b877-4464-925a-3574f8ea713a'::uuid, '752e192f-2451-4b2b-89fd-c048525202c4'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('1150cb80-b877-4464-925a-3574f8ea713a'::uuid, '4cd5e949-aeeb-49f6-bfa1-1c520029814a'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('1150cb80-b877-4464-925a-3574f8ea713a'::uuid, '596d39e9-a12c-4cf4-a52d-7c54c23509d8'::uuid);
