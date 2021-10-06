INSERT INTO public.details
    (id, "name", time_packing, material_id)
VALUES ('9f55d6ea-0fa6-484e-b7ff-5713b1ceda38'::uuid, 'Фасадная кассета VALKOR (ОТ) ПЭ 1.2 мм', '00:02:40',
        '21ee3088-6f02-4894-a84a-cdc9900d0bfb'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('43239cbd-f7fe-4e64-ab17-7b495e601edf'::uuid, false, 1);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('8c9ab38e-1715-4ce7-8efe-de2415be8a58'::uuid, '1165*540 4 шт с листа по тех карте', 0, '00:06:20',
        '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('6383abfd-4e1e-4339-a52e-7253719fef1b'::uuid, '1165*540 4 шт с листа по тех карте', 1, '00:02:40',
        'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('5049ad57-93a2-45aa-9d20-4475421e5ed6'::uuid, '1165*540 8 шт с листа по тех.карте', 2, '00:12:00',
        '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('c0c62f9a-c235-48e4-b1fc-2f2bcf57018b'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
    (id, is_selected, main_or_alternative)
VALUES ('3de31251-8817-4964-b2e8-d458f1ba75e7'::uuid, false, 2);

INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('6144f459-a983-4776-ac38-b8e000fb6bd4'::uuid, '', 0, '00:00:00', 'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('bbc1d616-f2cc-4fc1-b514-574e85165cef'::uuid, '', 1, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
    (id, "comment", priority, time_work, work_benches_id)
VALUES ('930047c4-7aa0-4586-906a-163656c6a223'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('9f55d6ea-0fa6-484e-b7ff-5713b1ceda38'::uuid, '43239cbd-f7fe-4e64-ab17-7b495e601edf'::uuid);
INSERT INTO public.details_detail_lists
    (detail_id, detail_lists_id)
VALUES ('9f55d6ea-0fa6-484e-b7ff-5713b1ceda38'::uuid, '3de31251-8817-4964-b2e8-d458f1ba75e7'::uuid);

INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('43239cbd-f7fe-4e64-ab17-7b495e601edf'::uuid, '8c9ab38e-1715-4ce7-8efe-de2415be8a58'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('43239cbd-f7fe-4e64-ab17-7b495e601edf'::uuid, '6383abfd-4e1e-4339-a52e-7253719fef1b'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('43239cbd-f7fe-4e64-ab17-7b495e601edf'::uuid, '5049ad57-93a2-45aa-9d20-4475421e5ed6'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('43239cbd-f7fe-4e64-ab17-7b495e601edf'::uuid, 'c0c62f9a-c235-48e4-b1fc-2f2bcf57018b'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('3de31251-8817-4964-b2e8-d458f1ba75e7'::uuid, '6144f459-a983-4776-ac38-b8e000fb6bd4'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('3de31251-8817-4964-b2e8-d458f1ba75e7'::uuid, 'bbc1d616-f2cc-4fc1-b514-574e85165cef'::uuid);
INSERT INTO public.detail_list_detail_infos
    (detail_list_id, detail_infos_id)
VALUES ('3de31251-8817-4964-b2e8-d458f1ba75e7'::uuid, '930047c4-7aa0-4586-906a-163656c6a223'::uuid);

