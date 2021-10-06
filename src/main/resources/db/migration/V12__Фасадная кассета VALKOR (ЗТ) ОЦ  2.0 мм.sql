INSERT INTO public.details
(id, "name", time_packing, material_id)
VALUES('c6e266ff-1799-4d8e-b923-b02eabc415bc'::uuid, 'Фасадная кассета VALKOR (ЗТ) ОЦ  2.0 мм', '00:02:40', '4a19ee13-b056-418b-97a1-9919934963dc'::uuid);

INSERT INTO public.detail_list
(id, is_selected, main_or_alternative)
VALUES('923e92c7-3868-4347-9544-29f723bb22c1'::uuid, false, 1);

INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('2d8fac41-19c9-4351-ad70-2b66b1dca309'::uuid, '540*510, 1170*510 по тех.карте', 0, '00:12:32', 'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('e42deedd-99a0-448c-a952-5fc60084daa9'::uuid, '540*510, 1170*510 по тех.карте', 1, '00:01:20', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('564e03a0-adaa-406f-bddf-aac04a21dc99'::uuid, '', 2, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.detail_list
(id, is_selected, main_or_alternative)
VALUES('a21ef91f-7e6b-4092-b36c-7bfe1623d206'::uuid, false, 2);

INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('197d9ac1-dc22-4688-8276-92cfea8ed78e'::uuid, '', 0, '00:00:00', '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('bc3c2901-6c6f-4da9-a2bd-15b4e7dd00b5'::uuid, '', 1, '00:00:00', 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('b036e24a-4bdd-4596-b583-4ef4d40b17a8'::uuid, '', 2, '00:00:00', '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.detail_info
(id, "comment", priority, time_work, work_benches_id)
VALUES('cc40bbfb-a79e-4e95-8502-fe5105bd60cc'::uuid, '', 3, '00:00:00', 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);

INSERT INTO public.details_detail_lists
(detail_id, detail_lists_id)
VALUES('c6e266ff-1799-4d8e-b923-b02eabc415bc'::uuid, '923e92c7-3868-4347-9544-29f723bb22c1'::uuid);
INSERT INTO public.details_detail_lists
(detail_id, detail_lists_id)
VALUES('c6e266ff-1799-4d8e-b923-b02eabc415bc'::uuid, 'a21ef91f-7e6b-4092-b36c-7bfe1623d206'::uuid);

INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('923e92c7-3868-4347-9544-29f723bb22c1'::uuid, '2d8fac41-19c9-4351-ad70-2b66b1dca309'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('923e92c7-3868-4347-9544-29f723bb22c1'::uuid, 'e42deedd-99a0-448c-a952-5fc60084daa9'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('923e92c7-3868-4347-9544-29f723bb22c1'::uuid, '564e03a0-adaa-406f-bddf-aac04a21dc99'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('a21ef91f-7e6b-4092-b36c-7bfe1623d206'::uuid, '197d9ac1-dc22-4688-8276-92cfea8ed78e'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('a21ef91f-7e6b-4092-b36c-7bfe1623d206'::uuid, 'bc3c2901-6c6f-4da9-a2bd-15b4e7dd00b5'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('a21ef91f-7e6b-4092-b36c-7bfe1623d206'::uuid, 'b036e24a-4bdd-4596-b583-4ef4d40b17a8'::uuid);
INSERT INTO public.detail_list_detail_infos
(detail_list_id, detail_infos_id)
VALUES('a21ef91f-7e6b-4092-b36c-7bfe1623d206'::uuid, 'cc40bbfb-a79e-4e95-8502-fe5105bd60cc'::uuid);
