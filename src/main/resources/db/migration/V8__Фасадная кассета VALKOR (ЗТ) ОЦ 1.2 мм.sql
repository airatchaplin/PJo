INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('835361ce-b6d6-4369-8a47-72674244a0ea'::uuid, 'Фасадная кассета VALKOR (ЗТ) ОЦ 1.2 мм', '00:02:40',
        '93172ad6-caab-4ab2-93c5-212db993bd4d'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('ed8aa05c-f36d-4f2d-a2b5-ce372026f91f'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('60d5576d-1a0e-428a-8e87-43611f4c51ec'::uuid, '540*510, 1170*510 по тех.карте', 0, '00:12:32',
        'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('53eb0679-8ced-455c-a4b0-256a55c1c10b'::uuid, '540*510, 1170*510 по тех.карте', 1, '00:01:20',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('22e00017-c5ff-47bf-9927-a1a7a089315e'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('d0c8f606-a5f3-493c-9a99-db4fca2999a4'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('570b0d0f-f58d-45c8-a481-2767a56bc1b5'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('b088a161-f5c9-4765-97ea-4272d0e34b32'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('6bf1a408-f3c8-410b-bdb6-1f01eeae51f0'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('64b4e5b8-29e9-4ad5-b59d-c4ab31022e47'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('835361ce-b6d6-4369-8a47-72674244a0ea'::uuid, 'ed8aa05c-f36d-4f2d-a2b5-ce372026f91f'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('835361ce-b6d6-4369-8a47-72674244a0ea'::uuid, 'd0c8f606-a5f3-493c-9a99-db4fca2999a4'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('ed8aa05c-f36d-4f2d-a2b5-ce372026f91f'::uuid, '60d5576d-1a0e-428a-8e87-43611f4c51ec'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('ed8aa05c-f36d-4f2d-a2b5-ce372026f91f'::uuid, '53eb0679-8ced-455c-a4b0-256a55c1c10b'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('ed8aa05c-f36d-4f2d-a2b5-ce372026f91f'::uuid, '22e00017-c5ff-47bf-9927-a1a7a089315e'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('d0c8f606-a5f3-493c-9a99-db4fca2999a4'::uuid, '570b0d0f-f58d-45c8-a481-2767a56bc1b5'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('d0c8f606-a5f3-493c-9a99-db4fca2999a4'::uuid, 'b088a161-f5c9-4765-97ea-4272d0e34b32'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('d0c8f606-a5f3-493c-9a99-db4fca2999a4'::uuid, '6bf1a408-f3c8-410b-bdb6-1f01eeae51f0'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('d0c8f606-a5f3-493c-9a99-db4fca2999a4'::uuid, '64b4e5b8-29e9-4ad5-b59d-c4ab31022e47'::uuid);
