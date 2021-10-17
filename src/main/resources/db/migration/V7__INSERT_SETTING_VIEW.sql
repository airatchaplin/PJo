INSERT INTO public.setting_view
    (id, is_viewing, "name")
VALUES ('c788c46c-e185-458e-a428-87faffae0dea'::uuid, false, 'Заказы');

INSERT INTO public.setting_view
    (id, is_viewing, "name")
VALUES ('f08ffc96-f33c-442b-b9fd-50dc5e816182'::uuid, false, 'Детали');

INSERT INTO public.setting_view
    (id, is_viewing, "name")
VALUES ('f7a14592-d192-427a-9dca-a8e4303360e4'::uuid, false, 'Материалы');

INSERT INTO public.setting_view
    (id, is_viewing, "name")
VALUES ('21f098cc-12ac-4e0a-b1d8-bf3f6597de75'::uuid, false, 'Менеджеры');

INSERT INTO public.setting_view
    (id, is_viewing, "name")
VALUES ('3dd57c67-588b-4e76-a753-d3195ca99032'::uuid, false, 'Контрагенты');

INSERT INTO public.setting_view
    (id, is_viewing, "name")
VALUES ('e943a0c1-d017-46b2-a373-74efcdd93ee5'::uuid, false, 'Станки');

INSERT INTO public.setting_setting_views
    (setting_id, setting_views_id)
VALUES ('a7566ccd-7729-4592-a675-28638ca72e65'::uuid, 'c788c46c-e185-458e-a428-87faffae0dea'::uuid);
INSERT INTO public.setting_setting_views
    (setting_id, setting_views_id)
VALUES ('a7566ccd-7729-4592-a675-28638ca72e65'::uuid, 'f08ffc96-f33c-442b-b9fd-50dc5e816182'::uuid);
INSERT INTO public.setting_setting_views
    (setting_id, setting_views_id)
VALUES ('a7566ccd-7729-4592-a675-28638ca72e65'::uuid, 'f7a14592-d192-427a-9dca-a8e4303360e4'::uuid);
INSERT INTO public.setting_setting_views
    (setting_id, setting_views_id)
VALUES ('a7566ccd-7729-4592-a675-28638ca72e65'::uuid, '21f098cc-12ac-4e0a-b1d8-bf3f6597de75'::uuid);
INSERT INTO public.setting_setting_views
    (setting_id, setting_views_id)
VALUES ('a7566ccd-7729-4592-a675-28638ca72e65'::uuid, '3dd57c67-588b-4e76-a753-d3195ca99032'::uuid);
INSERT INTO public.setting_setting_views
    (setting_id, setting_views_id)
VALUES ('a7566ccd-7729-4592-a675-28638ca72e65'::uuid, 'e943a0c1-d017-46b2-a373-74efcdd93ee5'::uuid);
