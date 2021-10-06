INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('17922062-33ce-4bbd-a689-67a7914378ca'::uuid, 'Фасадная кассета VALKOR (ОТ) ОЦ 0.45 мм', '00:02:40',
        '901c2d39-95c3-4255-85bf-7b58098c29a5'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('e1e567bb-e838-4e3a-9a74-9b3043d609ef'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('c10341e5-1997-494a-8d15-047de339b096'::uuid, '1165*540 8 шт с листа по тех.картам', 0, '00:05:20',
        'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('742c220f-c31a-4a73-9842-a2c27df99f70'::uuid, '1165*540 8 шт с листа по тех.картам', 1, '00:12:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('d27e34a3-f64d-4ed3-b215-2a1c74fd61c3'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('35d5caa8-214b-45a9-97a6-24e0ef5d3e45'::uuid, '', 3, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('0b746a12-703f-4b9b-bcea-4396fd1f11d4'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('801d20ad-0fc0-431c-8268-659d867a1437'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('e41a2b96-6a05-4471-bbc6-cf58be833bec'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('9afbf051-99b5-4ed1-995a-582fdc434d27'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('114535dc-bf1d-4c6d-a4fb-122164894a22'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('3a071bce-31c8-44b1-bb5f-8a4c22272ea1'::uuid, '', 4, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('17922062-33ce-4bbd-a689-67a7914378ca'::uuid, 'e1e567bb-e838-4e3a-9a74-9b3043d609ef'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('17922062-33ce-4bbd-a689-67a7914378ca'::uuid, '0b746a12-703f-4b9b-bcea-4396fd1f11d4'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('e1e567bb-e838-4e3a-9a74-9b3043d609ef'::uuid, 'c10341e5-1997-494a-8d15-047de339b096'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('e1e567bb-e838-4e3a-9a74-9b3043d609ef'::uuid, '742c220f-c31a-4a73-9842-a2c27df99f70'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('e1e567bb-e838-4e3a-9a74-9b3043d609ef'::uuid, 'd27e34a3-f64d-4ed3-b215-2a1c74fd61c3'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('e1e567bb-e838-4e3a-9a74-9b3043d609ef'::uuid, '35d5caa8-214b-45a9-97a6-24e0ef5d3e45'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('0b746a12-703f-4b9b-bcea-4396fd1f11d4'::uuid, '801d20ad-0fc0-431c-8268-659d867a1437'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('0b746a12-703f-4b9b-bcea-4396fd1f11d4'::uuid, 'e41a2b96-6a05-4471-bbc6-cf58be833bec'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('0b746a12-703f-4b9b-bcea-4396fd1f11d4'::uuid, '9afbf051-99b5-4ed1-995a-582fdc434d27'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('0b746a12-703f-4b9b-bcea-4396fd1f11d4'::uuid, '114535dc-bf1d-4c6d-a4fb-122164894a22'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('0b746a12-703f-4b9b-bcea-4396fd1f11d4'::uuid, '3a071bce-31c8-44b1-bb5f-8a4c22272ea1'::uuid);
