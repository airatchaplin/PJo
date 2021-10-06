INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('30a69518-f778-4e36-9f2b-addae40e70b3'::uuid, 'Фасадная кассета VALKOR (ЗТ) ПО 1.0 мм', '00:02:40',
        '825d8bb4-ca85-486a-9686-1721db35c584'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('83d726dd-0390-4aec-9fec-f3178daf737f'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('5f9a6e14-84d6-46e2-89f2-dba14483f66a'::uuid, '540*510, 1170*510 по тех.карте', 0, '00:05:20',
        'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('26d865f5-fba0-4b36-ae67-3973e9c50c09'::uuid, '1170*510 по тех.карте', 1, '00:06:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('1990b98f-7c57-45ad-85f1-4b5741b94f8e'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('399115d6-a326-4741-b3e4-89b00310c8aa'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('0e7a1235-f618-442e-8db4-b64aa1816393'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('2cf365b4-8707-4907-b056-ab48116781a6'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('d7fe097b-5078-45d1-9126-7dc00d45f8c8'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('900da9a9-cf6f-4056-a122-5bc587b34c08'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('30a69518-f778-4e36-9f2b-addae40e70b3'::uuid, '83d726dd-0390-4aec-9fec-f3178daf737f'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('30a69518-f778-4e36-9f2b-addae40e70b3'::uuid, '399115d6-a326-4741-b3e4-89b00310c8aa'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('83d726dd-0390-4aec-9fec-f3178daf737f'::uuid, '5f9a6e14-84d6-46e2-89f2-dba14483f66a'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('83d726dd-0390-4aec-9fec-f3178daf737f'::uuid, '26d865f5-fba0-4b36-ae67-3973e9c50c09'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('83d726dd-0390-4aec-9fec-f3178daf737f'::uuid, '1990b98f-7c57-45ad-85f1-4b5741b94f8e'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('399115d6-a326-4741-b3e4-89b00310c8aa'::uuid, '0e7a1235-f618-442e-8db4-b64aa1816393'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('399115d6-a326-4741-b3e4-89b00310c8aa'::uuid, '2cf365b4-8707-4907-b056-ab48116781a6'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('399115d6-a326-4741-b3e4-89b00310c8aa'::uuid, 'd7fe097b-5078-45d1-9126-7dc00d45f8c8'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('399115d6-a326-4741-b3e4-89b00310c8aa'::uuid, '900da9a9-cf6f-4056-a122-5bc587b34c08'::uuid);
