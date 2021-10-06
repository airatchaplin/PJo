INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('42b98085-7a95-46b7-af3f-ef9af4a27e6a'::uuid, 'Фасадная кассета VALKOR (ЗТ) ПО 1.2 мм', '00:02:40',
        '1bc18ee8-11e7-4338-85a4-a296130aef7b'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('e7c6d870-bbf7-4f6f-bae1-d09654c4ea19'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('2f706de7-e4aa-4c69-8fb8-04752dba1cd9'::uuid, '540*510, 1170*510 по тех.карте', 0, '00:12:32',
        'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('bfa73f58-bf26-4630-b377-74d975208527'::uuid, '540*510, 1170*510 по тех.карте', 1, '00:06:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('b3aee8f9-f748-483e-ad46-efea070747b0'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('35401d6f-d52e-42fd-948e-8f6b70dd3ca9'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('b5e8352e-ef48-44c8-928d-824d1a06d16f'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('0f45e2d1-a0af-4c3d-871e-5372c85bb64b'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('22e3bfc5-1ccc-4aab-9f4b-e3f4c260e9fb'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('ceea4b6a-8fdd-4f9e-a233-04925df804ac'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('42b98085-7a95-46b7-af3f-ef9af4a27e6a'::uuid, 'e7c6d870-bbf7-4f6f-bae1-d09654c4ea19'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('42b98085-7a95-46b7-af3f-ef9af4a27e6a'::uuid, '35401d6f-d52e-42fd-948e-8f6b70dd3ca9'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('e7c6d870-bbf7-4f6f-bae1-d09654c4ea19'::uuid, '2f706de7-e4aa-4c69-8fb8-04752dba1cd9'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('e7c6d870-bbf7-4f6f-bae1-d09654c4ea19'::uuid, 'bfa73f58-bf26-4630-b377-74d975208527'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('e7c6d870-bbf7-4f6f-bae1-d09654c4ea19'::uuid, 'b3aee8f9-f748-483e-ad46-efea070747b0'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('35401d6f-d52e-42fd-948e-8f6b70dd3ca9'::uuid, 'b5e8352e-ef48-44c8-928d-824d1a06d16f'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('35401d6f-d52e-42fd-948e-8f6b70dd3ca9'::uuid, '0f45e2d1-a0af-4c3d-871e-5372c85bb64b'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('35401d6f-d52e-42fd-948e-8f6b70dd3ca9'::uuid, '22e3bfc5-1ccc-4aab-9f4b-e3f4c260e9fb'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('35401d6f-d52e-42fd-948e-8f6b70dd3ca9'::uuid, 'ceea4b6a-8fdd-4f9e-a233-04925df804ac'::uuid);
