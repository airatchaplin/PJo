INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('d6e070b9-0eb4-4e3f-803e-82c6a333cbf3'::uuid, 'Фасадная кассета VALKOR (ОТ) ПО 0.7 мм', '00:02:40',
        '30c4c38b-2a33-4464-b329-39ed52ae1440'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('554a81c1-a789-42d1-b656-7eec04d3e1f4'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('47d335ff-f828-4945-a99b-7aae48d1cfa4'::uuid, '1165*540 8 шт с листа по тех.картам', 0, '00:05:20',
        'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('47bcc6fe-00dd-47b4-96cc-92ca8004c03c'::uuid, '1165*540 8 шт с листа по тех.картам', 1, '00:12:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('ab244903-5081-4c79-9f68-70525fb4b84e'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('d5dcaea0-2036-4bdb-ac92-5ea49e5da915'::uuid, '', 3, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('aafd8af2-ef84-439e-9f73-6a1491f12fda'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('b91fb1fb-d94a-405c-b99e-80918d21006d'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('6648eff5-ad0e-4631-95ab-0bc80860fd7a'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('3fe4dd21-65b7-43c2-ac7d-5ede56ed4806'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('680efcdc-0ca1-4d00-9ed5-9d859bc12db7'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('37e1587d-16d5-43ae-b106-1f00836f5136'::uuid, '', 4, '00:00:00', 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('d6e070b9-0eb4-4e3f-803e-82c6a333cbf3'::uuid, '554a81c1-a789-42d1-b656-7eec04d3e1f4'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('d6e070b9-0eb4-4e3f-803e-82c6a333cbf3'::uuid, 'aafd8af2-ef84-439e-9f73-6a1491f12fda'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('554a81c1-a789-42d1-b656-7eec04d3e1f4'::uuid, '47d335ff-f828-4945-a99b-7aae48d1cfa4'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('554a81c1-a789-42d1-b656-7eec04d3e1f4'::uuid, '47bcc6fe-00dd-47b4-96cc-92ca8004c03c'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('554a81c1-a789-42d1-b656-7eec04d3e1f4'::uuid, 'ab244903-5081-4c79-9f68-70525fb4b84e'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('554a81c1-a789-42d1-b656-7eec04d3e1f4'::uuid, 'd5dcaea0-2036-4bdb-ac92-5ea49e5da915'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('aafd8af2-ef84-439e-9f73-6a1491f12fda'::uuid, 'b91fb1fb-d94a-405c-b99e-80918d21006d'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('aafd8af2-ef84-439e-9f73-6a1491f12fda'::uuid, '6648eff5-ad0e-4631-95ab-0bc80860fd7a'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('aafd8af2-ef84-439e-9f73-6a1491f12fda'::uuid, '3fe4dd21-65b7-43c2-ac7d-5ede56ed4806'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('aafd8af2-ef84-439e-9f73-6a1491f12fda'::uuid, '680efcdc-0ca1-4d00-9ed5-9d859bc12db7'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('aafd8af2-ef84-439e-9f73-6a1491f12fda'::uuid, '37e1587d-16d5-43ae-b106-1f00836f5136'::uuid);
