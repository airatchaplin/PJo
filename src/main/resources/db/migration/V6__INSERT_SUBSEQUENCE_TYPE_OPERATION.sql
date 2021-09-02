INSERT INTO public.subsequence_type_operation (id, description) VALUES('93bb3def-03dd-4843-9bb3-19f7cc2d39de'::uuid, 'РЕЗКА -> ГИБКА');
INSERT INTO public.subsequence_type_operation (id, description) VALUES('012d8619-124c-4633-ab3a-5192867fcd80'::uuid, 'ПРОБИВКА -> РЕЗКА -> ГИБКА');

INSERT INTO public.subsequence_type_operation_type_operations (subsequence_type_operation_id, type_operations_id) VALUES('93bb3def-03dd-4843-9bb3-19f7cc2d39de'::uuid, '83e811fd-5619-45e3-908c-d0e1484668e1'::uuid);
INSERT INTO public.subsequence_type_operation_type_operations (subsequence_type_operation_id, type_operations_id) VALUES('93bb3def-03dd-4843-9bb3-19f7cc2d39de'::uuid, 'e0c90c05-b0b4-45df-8885-5e0cf058f242'::uuid);
INSERT INTO public.subsequence_type_operation_type_operations (subsequence_type_operation_id, type_operations_id) VALUES('012d8619-124c-4633-ab3a-5192867fcd80'::uuid, 'baeaf517-07d0-4c11-8c95-e918a97d0ef8'::uuid);
INSERT INTO public.subsequence_type_operation_type_operations (subsequence_type_operation_id, type_operations_id) VALUES('012d8619-124c-4633-ab3a-5192867fcd80'::uuid, '83e811fd-5619-45e3-908c-d0e1484668e1'::uuid);
INSERT INTO public.subsequence_type_operation_type_operations (subsequence_type_operation_id, type_operations_id) VALUES('012d8619-124c-4633-ab3a-5192867fcd80'::uuid, 'e0c90c05-b0b4-45df-8885-5e0cf058f242'::uuid);

INSERT INTO public.type_operation_work_benches (type_operation_id, work_benches_id) VALUES('83e811fd-5619-45e3-908c-d0e1484668e1'::uuid, 'b75c7e4c-d9a4-47ad-8e8c-45238fcdacef'::uuid);
INSERT INTO public.type_operation_work_benches (type_operation_id, work_benches_id) VALUES('83e811fd-5619-45e3-908c-d0e1484668e1'::uuid, 'b493840c-6e1c-43a4-9b17-a63388bcd721'::uuid);
INSERT INTO public.type_operation_work_benches (type_operation_id, work_benches_id) VALUES('baeaf517-07d0-4c11-8c95-e918a97d0ef8'::uuid, '71c7e64a-8904-4e04-b15e-293a58535a26'::uuid);
INSERT INTO public.type_operation_work_benches (type_operation_id, work_benches_id) VALUES('d09c6991-63ea-4896-9c10-784918c6b620'::uuid, 'ae63b3f2-885c-4491-8068-5f16ccbb52e7'::uuid);
INSERT INTO public.type_operation_work_benches (type_operation_id, work_benches_id) VALUES('d0ef057c-247f-4b68-bcc2-d32b6ce868ce'::uuid, '4dd0d76b-3729-41eb-b30b-9154f8ba2c68'::uuid);
INSERT INTO public.type_operation_work_benches (type_operation_id, work_benches_id) VALUES('e0c90c05-b0b4-45df-8885-5e0cf058f242'::uuid, 'c51d88fa-03ad-4d73-9de2-99559d08d7f6'::uuid);
INSERT INTO public.type_operation_work_benches (type_operation_id, work_benches_id) VALUES('e0c90c05-b0b4-45df-8885-5e0cf058f242'::uuid, '919b758e-c650-4020-9864-6d240b389e55'::uuid);
INSERT INTO public.type_operation_work_benches (type_operation_id, work_benches_id) VALUES('e0c90c05-b0b4-45df-8885-5e0cf058f242'::uuid, 'eea03810-2a6b-4101-825e-5d4ac119bcbb'::uuid);
INSERT INTO public.type_operation_work_benches (type_operation_id, work_benches_id) VALUES('e0c90c05-b0b4-45df-8885-5e0cf058f242'::uuid, '5ff81986-e56c-400c-831d-794c4a883fdd'::uuid);
