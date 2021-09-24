-- Добавление ролей
INSERT INTO public.roles (id, "name")
VALUES ('4307dd6b-1c2d-4bd7-9506-786be6d96435'::uuid, 'ROLE_USER');
INSERT INTO public.roles (id, "name")
VALUES ('08425470-c8bc-48d3-b4a9-97ef7fe3c369'::uuid, 'ROLE_ADMIN');

-- Добавление админа
INSERT INTO public.users (id, fio, fio_i_o, last_name, "name", "password", username, filter_details, filter_workbenches)
VALUES ('5290a208-d616-4552-94a2-5bc124458199'::uuid, 'admin', 'admin a.a.', 'admin', 'admin',
        '$2a$10$3IpyfnEim4Jo2q3gUfNi3e9NhhVFm07F.n5dSrBc..dOuUoIhuW.S', 'admin', NULL, NULL);
INSERT INTO public.users_roles (user_id, roles_id)
VALUES ('5290a208-d616-4552-94a2-5bc124458199'::uuid, '08425470-c8bc-48d3-b4a9-97ef7fe3c369'::uuid);
