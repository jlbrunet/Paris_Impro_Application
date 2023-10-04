PGDMP                     	    {           parisimpro_3634    14.8 (Debian 14.8-1.pgdg110+1) #   14.6 (Ubuntu 14.6-0ubuntu0.22.04.1) D    C           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            D           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            E           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            F           1262    16385    parisimpro_3634    DATABASE     c   CREATE DATABASE parisimpro_3634 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE parisimpro_3634;
                parisimpro_3634    false            �            1259    16613    absences    TABLE     �   CREATE TABLE public.absences (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    lesson_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);
    DROP TABLE public.absences;
       public         heap    parisimpro_3634    false            �            1259    16616    absences_id_seq    SEQUENCE     x   CREATE SEQUENCE public.absences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.absences_id_seq;
       public          parisimpro_3634    false    209            G           0    0    absences_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.absences_id_seq OWNED BY public.absences.id;
          public          parisimpro_3634    false    210            �            1259    16617    ar_internal_metadata    TABLE     �   CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);
 (   DROP TABLE public.ar_internal_metadata;
       public         heap    parisimpro_3634    false            �            1259    16622    courses    TABLE     p  CREATE TABLE public.courses (
    id bigint NOT NULL,
    level character varying,
    location character varying,
    day character varying,
    hour time without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    info character varying,
    teacher character varying,
    minute integer
);
    DROP TABLE public.courses;
       public         heap    parisimpro_3634    false            �            1259    16627    courses_id_seq    SEQUENCE     w   CREATE SEQUENCE public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.courses_id_seq;
       public          parisimpro_3634    false    212            H           0    0    courses_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;
          public          parisimpro_3634    false    213            �            1259    16628    lessons    TABLE       CREATE TABLE public.lessons (
    id bigint NOT NULL,
    course_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    occurs_on timestamp(6) without time zone,
    location character varying
);
    DROP TABLE public.lessons;
       public         heap    parisimpro_3634    false            �            1259    16633    lessons_id_seq    SEQUENCE     w   CREATE SEQUENCE public.lessons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.lessons_id_seq;
       public          parisimpro_3634    false    214            I           0    0    lessons_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.lessons_id_seq OWNED BY public.lessons.id;
          public          parisimpro_3634    false    215            �            1259    16634    places    TABLE     �   CREATE TABLE public.places (
    id bigint NOT NULL,
    number integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    lesson_id bigint
);
    DROP TABLE public.places;
       public         heap    parisimpro_3634    false            �            1259    16637    places_id_seq    SEQUENCE     v   CREATE SEQUENCE public.places_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.places_id_seq;
       public          parisimpro_3634    false    216            J           0    0    places_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.places_id_seq OWNED BY public.places.id;
          public          parisimpro_3634    false    217            �            1259    16638    rattrapages    TABLE     �   CREATE TABLE public.rattrapages (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    lesson_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);
    DROP TABLE public.rattrapages;
       public         heap    parisimpro_3634    false            �            1259    16641    rattrapages_id_seq    SEQUENCE     {   CREATE SEQUENCE public.rattrapages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.rattrapages_id_seq;
       public          parisimpro_3634    false    218            K           0    0    rattrapages_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.rattrapages_id_seq OWNED BY public.rattrapages.id;
          public          parisimpro_3634    false    219            �            1259    16642    schema_migrations    TABLE     R   CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);
 %   DROP TABLE public.schema_migrations;
       public         heap    parisimpro_3634    false            �            1259    16647    users    TABLE     Q  CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    course_id bigint,
    first_name character varying,
    last_name character varying,
    status character varying
);
    DROP TABLE public.users;
       public         heap    parisimpro_3634    false            �            1259    16654    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          parisimpro_3634    false    221            L           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          parisimpro_3634    false    222            �           2604    16655    absences id    DEFAULT     j   ALTER TABLE ONLY public.absences ALTER COLUMN id SET DEFAULT nextval('public.absences_id_seq'::regclass);
 :   ALTER TABLE public.absences ALTER COLUMN id DROP DEFAULT;
       public          parisimpro_3634    false    210    209            �           2604    16656 
   courses id    DEFAULT     h   ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);
 9   ALTER TABLE public.courses ALTER COLUMN id DROP DEFAULT;
       public          parisimpro_3634    false    213    212            �           2604    16657 
   lessons id    DEFAULT     h   ALTER TABLE ONLY public.lessons ALTER COLUMN id SET DEFAULT nextval('public.lessons_id_seq'::regclass);
 9   ALTER TABLE public.lessons ALTER COLUMN id DROP DEFAULT;
       public          parisimpro_3634    false    215    214            �           2604    16658 	   places id    DEFAULT     f   ALTER TABLE ONLY public.places ALTER COLUMN id SET DEFAULT nextval('public.places_id_seq'::regclass);
 8   ALTER TABLE public.places ALTER COLUMN id DROP DEFAULT;
       public          parisimpro_3634    false    217    216            �           2604    16659    rattrapages id    DEFAULT     p   ALTER TABLE ONLY public.rattrapages ALTER COLUMN id SET DEFAULT nextval('public.rattrapages_id_seq'::regclass);
 =   ALTER TABLE public.rattrapages ALTER COLUMN id DROP DEFAULT;
       public          parisimpro_3634    false    219    218            �           2604    16660    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          parisimpro_3634    false    222    221            3          0    16613    absences 
   TABLE DATA           R   COPY public.absences (id, user_id, lesson_id, created_at, updated_at) FROM stdin;
    public          parisimpro_3634    false    209   [Q       5          0    16617    ar_internal_metadata 
   TABLE DATA           R   COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
    public          parisimpro_3634    false    211   9Z       6          0    16622    courses 
   TABLE DATA           p   COPY public.courses (id, level, location, day, hour, created_at, updated_at, info, teacher, minute) FROM stdin;
    public          parisimpro_3634    false    212   �Z       8          0    16628    lessons 
   TABLE DATA           ]   COPY public.lessons (id, course_id, created_at, updated_at, occurs_on, location) FROM stdin;
    public          parisimpro_3634    false    214   �_       :          0    16634    places 
   TABLE DATA           O   COPY public.places (id, number, created_at, updated_at, lesson_id) FROM stdin;
    public          parisimpro_3634    false    216   ��       <          0    16638    rattrapages 
   TABLE DATA           U   COPY public.rattrapages (id, user_id, lesson_id, created_at, updated_at) FROM stdin;
    public          parisimpro_3634    false    218   ͈       >          0    16642    schema_migrations 
   TABLE DATA           4   COPY public.schema_migrations (version) FROM stdin;
    public          parisimpro_3634    false    220   �       ?          0    16647    users 
   TABLE DATA           �   COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, course_id, first_name, last_name, status) FROM stdin;
    public          parisimpro_3634    false    221   ]�       M           0    0    absences_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.absences_id_seq', 136, true);
          public          parisimpro_3634    false    210            N           0    0    courses_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.courses_id_seq', 26, true);
          public          parisimpro_3634    false    213            O           0    0    lessons_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.lessons_id_seq', 804, true);
          public          parisimpro_3634    false    215            P           0    0    places_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.places_id_seq', 1, false);
          public          parisimpro_3634    false    217            Q           0    0    rattrapages_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.rattrapages_id_seq', 28, true);
          public          parisimpro_3634    false    219            R           0    0    users_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.users_id_seq', 184, true);
          public          parisimpro_3634    false    222            �           2606    16662    absences absences_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.absences
    ADD CONSTRAINT absences_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.absences DROP CONSTRAINT absences_pkey;
       public            parisimpro_3634    false    209            �           2606    16664 .   ar_internal_metadata ar_internal_metadata_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);
 X   ALTER TABLE ONLY public.ar_internal_metadata DROP CONSTRAINT ar_internal_metadata_pkey;
       public            parisimpro_3634    false    211            �           2606    16666    courses courses_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.courses DROP CONSTRAINT courses_pkey;
       public            parisimpro_3634    false    212            �           2606    16668    lessons lessons_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.lessons DROP CONSTRAINT lessons_pkey;
       public            parisimpro_3634    false    214            �           2606    16670    places places_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.places DROP CONSTRAINT places_pkey;
       public            parisimpro_3634    false    216            �           2606    16672    rattrapages rattrapages_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.rattrapages
    ADD CONSTRAINT rattrapages_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.rattrapages DROP CONSTRAINT rattrapages_pkey;
       public            parisimpro_3634    false    218            �           2606    16674 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 R   ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       public            parisimpro_3634    false    220            �           2606    16676    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            parisimpro_3634    false    221            �           1259    16677    index_absences_on_lesson_id    INDEX     U   CREATE INDEX index_absences_on_lesson_id ON public.absences USING btree (lesson_id);
 /   DROP INDEX public.index_absences_on_lesson_id;
       public            parisimpro_3634    false    209            �           1259    16678    index_absences_on_user_id    INDEX     Q   CREATE INDEX index_absences_on_user_id ON public.absences USING btree (user_id);
 -   DROP INDEX public.index_absences_on_user_id;
       public            parisimpro_3634    false    209            �           1259    16679    index_lessons_on_course_id    INDEX     S   CREATE INDEX index_lessons_on_course_id ON public.lessons USING btree (course_id);
 .   DROP INDEX public.index_lessons_on_course_id;
       public            parisimpro_3634    false    214            �           1259    16680    index_places_on_lesson_id    INDEX     Q   CREATE INDEX index_places_on_lesson_id ON public.places USING btree (lesson_id);
 -   DROP INDEX public.index_places_on_lesson_id;
       public            parisimpro_3634    false    216            �           1259    16681    index_rattrapages_on_lesson_id    INDEX     [   CREATE INDEX index_rattrapages_on_lesson_id ON public.rattrapages USING btree (lesson_id);
 2   DROP INDEX public.index_rattrapages_on_lesson_id;
       public            parisimpro_3634    false    218            �           1259    16682    index_rattrapages_on_user_id    INDEX     W   CREATE INDEX index_rattrapages_on_user_id ON public.rattrapages USING btree (user_id);
 0   DROP INDEX public.index_rattrapages_on_user_id;
       public            parisimpro_3634    false    218            �           1259    16683    index_users_on_course_id    INDEX     O   CREATE INDEX index_users_on_course_id ON public.users USING btree (course_id);
 ,   DROP INDEX public.index_users_on_course_id;
       public            parisimpro_3634    false    221            �           1259    16684    index_users_on_email    INDEX     N   CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);
 (   DROP INDEX public.index_users_on_email;
       public            parisimpro_3634    false    221            �           1259    16685 #   index_users_on_reset_password_token    INDEX     l   CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);
 7   DROP INDEX public.index_users_on_reset_password_token;
       public            parisimpro_3634    false    221            �           2606    16686    users fk_rails_26e618b988    FK CONSTRAINT     |   ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_rails_26e618b988 FOREIGN KEY (course_id) REFERENCES public.courses(id);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT fk_rails_26e618b988;
       public          parisimpro_3634    false    3215    221    212            �           2606    16691    rattrapages fk_rails_2b51e40ca7    FK CONSTRAINT     ~   ALTER TABLE ONLY public.rattrapages
    ADD CONSTRAINT fk_rails_2b51e40ca7 FOREIGN KEY (user_id) REFERENCES public.users(id);
 I   ALTER TABLE ONLY public.rattrapages DROP CONSTRAINT fk_rails_2b51e40ca7;
       public          parisimpro_3634    false    3232    218    221            �           2606    16696    absences fk_rails_442f8d40b0    FK CONSTRAINT        ALTER TABLE ONLY public.absences
    ADD CONSTRAINT fk_rails_442f8d40b0 FOREIGN KEY (lesson_id) REFERENCES public.lessons(id);
 F   ALTER TABLE ONLY public.absences DROP CONSTRAINT fk_rails_442f8d40b0;
       public          parisimpro_3634    false    214    3218    209            �           2606    16701    places fk_rails_46a6ab4c13    FK CONSTRAINT     }   ALTER TABLE ONLY public.places
    ADD CONSTRAINT fk_rails_46a6ab4c13 FOREIGN KEY (lesson_id) REFERENCES public.lessons(id);
 D   ALTER TABLE ONLY public.places DROP CONSTRAINT fk_rails_46a6ab4c13;
       public          parisimpro_3634    false    214    216    3218            �           2606    16706    lessons fk_rails_4bcdb571d9    FK CONSTRAINT     ~   ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT fk_rails_4bcdb571d9 FOREIGN KEY (course_id) REFERENCES public.courses(id);
 E   ALTER TABLE ONLY public.lessons DROP CONSTRAINT fk_rails_4bcdb571d9;
       public          parisimpro_3634    false    212    214    3215            �           2606    16711    absences fk_rails_c27f31cefa    FK CONSTRAINT     {   ALTER TABLE ONLY public.absences
    ADD CONSTRAINT fk_rails_c27f31cefa FOREIGN KEY (user_id) REFERENCES public.users(id);
 F   ALTER TABLE ONLY public.absences DROP CONSTRAINT fk_rails_c27f31cefa;
       public          parisimpro_3634    false    209    221    3232            �           2606    16716    rattrapages fk_rails_e3a5ba294f    FK CONSTRAINT     �   ALTER TABLE ONLY public.rattrapages
    ADD CONSTRAINT fk_rails_e3a5ba294f FOREIGN KEY (lesson_id) REFERENCES public.lessons(id);
 I   ALTER TABLE ONLY public.rattrapages DROP CONSTRAINT fk_rails_e3a5ba294f;
       public          parisimpro_3634    false    218    214    3218            3   �  x�}YY�$+���.�0���Y�����Af]?펂E�\$_z�j�d��r�����������z�HN����"�}�hO9�� ��hf�/3�@�ct�)VSg��eQ��i�d�/3�@T/��_��������Z�nv����/��]e�D�j�/3&&/��� ��m��&��r9@�|�˽���,�f,� b��\�����K��k�f*� ��XS�*��0��e}�H{1�hIr�U!:�`y�Hl{垴j�D��_$O�+ko�0y^���Fžf>@�����_����rIUs���A��B�̟�,[RHI�D�/����g�ꏯ�	�V�ͯ�D�8��>B��#�2���[�rŭ�6���@��<-�՗9�����V.��'�������|�6�R�Ϗ�vf{YN^
��z@����NrNڳg9@��+��|�[H"�Xq�����D�.���R���\楳(lI��l����%��5��8�/O�<����FH�7����8!-/a39@�����Y"�������TQ�o�'� �����bj�o����� B�`~V��CYš.��6�'BZ.�U��P~yM�e�� �Vԛ5q{\m|C9Yn6'�������GZ��"d�ؽ�IJi�����YY��!��\E���!2�JW�I(J� ����Z=@��,X�AҨK��V�J;@dz�/;	��v�D�A�XZ��{�lr.����4��jD��儫	.M���D�����)"<�=�!��_�O�Vk{��䰂䄟�Dqc�r�6W����fc�� ����b�Y� ���b�ޤQ��� ����=�w���Jt��������e�q38H����"D��N���T�6�p���s�PԢ}��l>w;D����uey(��+U�Tpw� :p���4f���2����!�?X�C]���Y�AY����u�����w�/,�T;JJ?@T�����*ު��� ���%��i�Ng�^A9ѱ,���6����C�!*�7`�u�ܞ����'@%2^���0Q�\M�3x��vZ�>R<$*��$�)��AT��(m�������B!�F� ��w<W'�
}��\�6�p�� }g1��s�/>�� %a!�M��o�*��V�e��ks��]d��D�F��>�dc��Uɥ ��}�(c�s�S��� ��PvV4�اz��"	%z��dᢠ3���� �v��#�$hCj���vGX9p�Vѕ�>��"/��Y�O���z8��Qi��:L���#��,�<9��lUd�>���=��s� �w�0�{��m�l�w����%h��4�DH�;�6O����V���چ;@�Y�p82MA�Xm[�l6Xź�D������ˑ�z�v�������dt9r�BwؖP�`r_d~�(���w:%E��+�Q�L��}��xy�J��#�W�zdb��e	a:$<CͭH=@3���|I7\�8�6_%�DZC\��>�<e���t�n�C�ף�~�j	��� B���X@	�+<��~��G97#�+��C*�r?@��b��x�D�0
�"�;�s*qc+D��FU��}�3�x�����"����A��]tc-� Qr��^����E���X�#����\�x���rZk�� !�K??^�`<�S��s=@�o�H�~����&�~�(L�A�4����u�vD���Ӑ.Y����Q�j_����
�� z�� QlR��Fj)[��El�(��h��Q�=��Or;Dam���cm8��9h8-\9)�BO1#Q}?��ݯ��
R�N��-���F#]P���"���?"xak|�!�������8�?���`~��.���k���q�kX!��\�.�Boc�UY�B��P�4�(����PXtX��F)H�� ���k9@��D'�OVߴ6^��qO�DaңM�X��6Z����fz�(\:�*ۛf��U^�!D���ǣ��5s�D��#Ʒ =�v�����t�iQ���������iN�ˇ�%j�kn� �VԦ :�*�#Y�R�B�r��>j4Ɖђ̂�Ai��ֹ΀�<���� +� =�G�ߴ��X�%ٹ �v��O�h�v+v�(�>��x"3-N����$� D���{Z��#6z��aE��E����7��=j��j�{����`��Q�p�P�n�BPG������E�6�������W8U      5   A   x�K�+�,���M�+�,(�O)M.����4202�5��50W04�21�21�362�07�#����� �>      6   D  x��W�r�F]�_qw�SzKx��������ɦ��J�MZ�kRY�}���m	I��3U.t�9��s�m���P��m|!iB7�sjR1g�c�[�_8n�j��l���=�^ۯ�&I:g2'�.���_P)�9�ޒL����m_$�K`$E�5�;�`5 _ɖ&	5�D�I�m��v�R�)gT@��D1G^�9/xյj��s���ܜE
�$��T-`B�HZ}*�aFɄ�D�k�jC7j��%��ƻ��W)���J2��ȥb��S��x��Y�j!
	����~]�w�Ek�ï��;]��KWL���R�$Y��
���B0�2���oW~#�S�P��LgK���3���K(�}�:a��)�� �r��ܸ�ǒ�.#�QI�e�7���F៖�/�FFS���2HyJ��6(؎��P1��3��o�<��.�=F�:	^���sf���dab����&���B�aA�OyB���%5쨎�m9�W��xG$R��ç�$�9�-N�0�J0�8�~�[����r�����)�0�bjk�5�K'�~�H�)b��]�`}6�Mrַ�Ъ��A?68zRQ��Y����l�9=`�+ag�"'�:�s_5�߱���@���K�D:�|�5Qe�M.�v�b@a�!��l.���� ��`Y��"�KZ�չ	�҄�~��	�v�d���RhN�ᕤ4��7V^� �Ї���PaL���$1�L��:Yl��r���枵��z����F��Zm�b�r�hN֘�LB*�8a+���)_���wQnʲFxg#�>B�4��jȸ�8�A���Z�(�w�+�L���~�����}9�6�،'��p�P��K���|3OfD�U��R�<�d[����_�l��0t�:�3��2?S��R�$qh�#����gx�lL�ң��1�HΚN�g�a�\�PyF9M2����ʾ��В�=����"��+��C�q bd+[h����)D��j�U�D�N1+O�#Tcf��8~r��N�A��E��F$单E�[169T�+�A���	�/q�i�~X�9�Slf֬v!�Ur�H��q��=oWx/�>���)��� �X^'o���L�mC1�W5H9�lwQ}J��>�9v!�Eb-[}���բl�VT��:�;���l�������B&��yyTТN�]��'�N�����2�����	<Q�!���&>��C���2Ӥ݂to���/��w���A��AC�f����[N<��T/r�.W"�V�&��'����r-y�y�0�(r���������Z�i��3r^�F>
q�W�q5눉��v���98�c�aW"۫X�9�u3���?�����M�c      8      x���ͮ˕^��Sp֣+�����a,Cp=�m�-٠x�u<r��z1G����;b�s���]8��f��32b����/�����~��oS�M�!��3ȇ��������ǿ���o_�~z��ri?�|����!�^�byz{�p��-o&o̡����;�[ț\O�M4���V�������o#o���7���dy;z���]hx���ޑ���E���Z��^[x���˦W���o�!���1q��
GB�)6��1r�%Q�Q�ōS�c��8S�P��E��1�S���ك�B/�`�RW]���O�"��(�)v�ǖ�8/4��t����[�E�q"P�j���o2��(w5&��x�)\�(s5��h,t��38P�j���Q�ыؾ��\�1����'8�e��Q�D/b�����o4�.H3W}�pN��El_�f�����El_�f��Hgō.�yQ����s�Gⅆ����c�z�p�X�E��CǏ`�^ͥ#憔��������}����!�obo��}5
��f􆘲�f�oaoo��@��oEo����D�n-���7���h֭���w�V��h֭��&��<��7�,0����-λ���V��y+%x8�uk2����=�����q⼍����+��9N����������r�Z�Ѿ-tլ���8o=&����7*,�����0oݥ��BW�j��y��{�v.tի���1o����]����y�!Qٳ�UZ�Ș�])�}oty��7c�z�r��U�Z�歧�xot����1o=58�r�nƬ��:�w.t���9�Y�c|�\u�qʜ�2NO8�ntU�ƕ�p�j�p�_�*&��[8i��t�jI�Y8i-7y���q_j|'�����?�������������}49Z��5R���>����yYމ-���|�ͺ8k�O�n���R����9�M�PF��F�}�u�w�w3���Z^�cq��@�4���O�+�����>�����h����������s��;c��� ���Mω-�8���i7=g�z{8�蜭����ڂ9�.�9g��9�m�����3���3;t���蜿��Ʃ����7:gq7=�ֻ��/�s&w�cf�w���}�sFw�cf��"'�?�9���1�>{.O�s�w�cf}�~؅�y�M���q��YųD�l�����#'��9�M���)�e|�s�w�cf}�|���Z�1�s��|�)�9��9�%:�:�7=���[�7�9#��9�5:�7:�7�H-[�'g�F������g�vg.=8��E/kA�5�p�4R?�e�d�,��!Ѭ��amlm
$�f�kG��CV����V?�?Զh����o�C�Q;.��S%�[��������4��V�<���ݛ�34�[a��b�B����hV���b���A(�,a��z��D��_��=��g�s1� W�jH9be��ȸХ=��8c5F����c<ek{�a�FWaz�?5�`7���A�>n%����t��s����\�#�U�a���]�[�*=�0x�؜3Mo���4~2���
�-ti��3G�`X\��t�A���PJ����Uq��� �y%�*�����,�a�f��R=/9Ss.�-t���%'`�b�%��Ek\r�,���>r��"5���d>'��D������`lc�)�j��?}�����Զ�h������|d��,�!m M��k��fH;JK�RQ�Y*�SiG���lm�֣�Ѭ�D�T�6�6$��h����F�F��͚.ڄ��a�P�Y�9CK	Ki�nyM���H	�k����YNKK	K9���&WMg�6b��]5�܈+5C]�Х5��0c5��nt�t�AH���
��/����AH���h�{���30c�۫<$�j:#	36J�����Y�(cٍ�`{�Z�鬟�2�]��(It�tַ���q��y��U�Y�-�,���[қ\�q�I��<��P�.tUt�'S�r���*:�ʐ)c9f�DX�*��oK�)&x
�Х5.��2�Sop1_�謃@�y�2��h�1"�_��}..�S��y����������?�������1����	�����	��Q�����k�4�ֶ����10�Y�ȶ�u��U0 �9L�K��s������$ږ���@��J7��h��z���s8��y��ů�>����4����zLl	#���F�m)��Ė8�^��m+bw=&����ܘ�Ѷ0v�cfK���79V��rLlI5��%:�n���-9�+�$:���z�l�V�����%���3[���3+gw=g��!�7:��z�lM��Y�c������~����XN��9����:V��z�l2{�cq������(V7:���zLm������б�v�7Lmu����BǪ�]������o�c������ w�Op���՘�Y��'�M�e���Z�p���X���1�u\��խ�rw}yg��5U�~
���|��ǧ�}��e�α�4ǆ�H�ԍ�s}&��(��ե�M�D[�-�ݑ��J�h���ڣ�y��h���:��� �\$��k���n�N>���Z��{,P}I���J�Q�iBL���VjJ�ܯ	7�m��RS�w.�c�D[-�Ԕ�泃�gmu�RS[p�/tT�B�q� �	ȅ�
Z�)�-��BG��Ԕƹ3ʫ���Y�)�-y7sU�RS��P��:*f��4��gT_GG��Ԙ�<o�@G��Ԙ�<Y訒��X��v��BVjL���hձT{Lc�%��w��2VjL���`y��&Vb�bw���zX�1��tAnt��JMY�sѣ=Z/tT�JMY�ү��
VZ�a�)��$:*`����!��A֘mH����?>}����<������Tr�;����3H�'�?8�|�fɚ^�{�3)�̪տfho��$����?�?�����:9�	��(�C�D~+Q&)�:%�[�r�������V�~L�#��L �7�~Loj�fa���0��҂w��j��F�����D�*��U�������N]��F�h�����)���*v_}���!����:�]{�^���)C��_������c�wHF4�*R���~m��v~��sG�DWm�Z����!���m��]U�k��v~�$��7�J�W�;�S�;��7������������,ѵ<����NI��ύ����|%�o�8ntȯ]����*o��J~���0�����7���]�淕n^�$�J�W���nn��*�_=>�_�.t�_=>�V�>�\lI��\��_?~�ݟ?���K�Q��@r���g����C��{���;s��Fۖ6-,/��"۾6�����^��Ѷ�M�����7Ѷ�M�3�S�f�2���nZ^X^\�$�6�iyE��̵�m�޴��{0o�5�6�i9糌3پ�I�m�S�����sI�жN�9�5u�s�Dǆ8-�|6�%��ⴜ
�9��i5糏�"t�c���s>��}����lH���,��������9.�CA��msZ�����=@�c�WLg?�}�D�:-�t�������N�1��F��f-ѱ�N�1�a����Fǆ:-�l����7:��i9fs\����\���2��ύ�-vZ�ٜ��!k�c���s:+,R���n����[7Whh��^*�?fKgG�k�@['ܞ�}�l0bi
��kA�B[�5���.Es��F[�5�N���n����cM�3����A��Śvrϑ��@[5���Gb%��\M��K1צj�uV�n�eL��"[S5e�ʘ��7��QM�)�1G���"[35m�L��T�����vc&�=(����vc&��,��jڍ��ЌT��7P�n�dK�����{�vc&��W�K���iڍ��9�]0$J{�4��L&���G���M���(�ɍ�¾.,���i�M��۱�\(�Ӵ�r�|�"y��wK�n�e
!���$J{�4��\���(o���I�n�e��~]�Dio��ݔ�1�uxP�P�;�i7�2�k-<$Z(��Ѵ�r�rɔ���7�vc.K�;lI���h�=��؂:jgpk�3��>�    �a�h��l�} ��edn%����̑��%ktT�˜�<�/��訋�9�9�4�DGU�̅���=@4:j�e�h���272���ܚ��Q/sGs��,�Q��@����k�DG5�̔�{�;T��Zx�)�vz(rT��K	�9�%�&F����ܪ� G"�^f�_E�=�.dT�ˌ�+=�8��Q�.3��n�6�Ȩ~��׼��S"��]f�_�&�2*��1=��FFݻ̘�Q����$2��e��W�k!��]fJ`����BFŻ̔��;]]2��e���Ms��DF��̔�2kN2?�Q�.3e���%o��2Sgcw?�Q�./%��j�\$)�Q���D	,9Xݰ�Q�.�GgV��;~�p�������ߧ:��d�z��^��:n[�ʆt��:�����q�:��EsG�"G��ą�-���4:jܥ���KHt�K�X����U�RwRW�=�e�u@=N\{��r��8�n��B���]jLb��5K���]jLb��DG��Ԙ�:n���m!��]jL⨇�y!��]j���ko.ŗȨw��X���Z��]bLb������Q�.5'��7o�.��R+�oYȨx���8~*s7�DFɻԜ���X�Ȩy����F�FFѻԜ��+T�U�Rs{��>���w�1�͍\�C�BFݻԘ�6���#�BF�Ԙ�拇{����w�1�-�H�FF�{�+�����v��Rc[�tA��w�G�p�Qeاކ�ʊO���˧�?}?�CH���k̆�-O(�8��!5�*yfy�_x�Ѷ�O��KJ�k
�m����Q����D�>>-o,/oK�m����[W5�v�)ys(�>�EX�m���{�w�,f�hۻ����J���D��=-Ǆ��f���h۵����;,*d۰�՘�r5Jt���r�g��ü�B�V=-�|�Qb��ą�}zZ���4�<��AO�1�=��{:v�)y�lηܚ�%:��i9g�8��W�򴜳Y��yᅎMyZ��w��˴$:v�i9g��j�`��؎��Ζ��Z�؋����,[�؈���q6C��бO�!��7�R`>I��؂���i(��"���wR�$����&ss�D��;-��N�]�c睖CB�a���*�$:��iy|�5�`�_8�l"�~_����O���߾������h��ٛ����3�Sh�k&�+�B�ٔ~���p����v�
���p�o�/��ob���������RW��O�#}Mɜ����zO��읦]��XP��7Iht��c=�vf�4���q���vx��FW�8�Sj��ݜl����zJ�w0�!Qz��c=�����ң��)�~ �J�^r����qga�\�(=�ɡ>Pj}Ŝ-�(=zʱ�R��}�8O�]�XN��)��m�(=:˱�2�SwP9-���XO���.�|/�D��a���ٹ�~��G�9�cfK�f�[�ң��1�5�(=�ͱ3ۜ��V���9�z�l��\+Qz��C}�̎
�l{(Qz��c=f�{ՊD������0�ws�]���C�zJ�|\
J�^t�?|�q���U⣶�o�~|����?���pgv�h��<Pt�.��~�F�v���s+2����h�\U���;���b���ȿ��7�s��G�L��@�e�����6�HJ0�� ހ����H�������-�Ȭ�9��{��h��B���b�n����i��ޗ!�U�A����`����rC�籕`>���*�p"���:�^��I�D���FZ]�"$'c"�l�m'g���ɘ�1��k�%��D�N�TF�3\)�*D�-3�2�����+Y�\�g��JA���^:&��]3�Jt՝��������e"]E'\'3�2�`7��8�J�1�q�z�\f�NLe���-�U��u�p*G�mv��b�Ne��+�%��tL8�����BW�J�$�3��NA�0��!�x揟~|��������������?��F�^�%4���J3��O����s�>@��s���?�u��F[���:}@r�n���������,~�S�:-����� �P���T�����?`�M��h��v~@��Bf����)���f��#����� L񸋤�w���۩�����h��v~ fx���\�(Qڻ���Ng�J{���8ùzG�Di��v|@����5��������S8�n��~o�p�k���'������ �ps&�J{��8��	~����������IH��p�p�{��	"Qڻ���I���]�.��np�`���vd����� Lr�Cb���+����_�'������ Lr���`��w�;? ���3{�	���p�s�����E����;? s��8����Bi�w~�ȱ�-�����J�o_|�����-�\�D�lw�?�������@�Fr_�r7v��m�������\m;�;�EM�.lI�mTn��q6��D۞A���\��ѶiP�#�{h�^X��]�ʝ��ੇ ۶Ae�T��>K�mߠrc*���9�ȶmP�1�ŗ�D۾A��L���,tlTn��(����#������1�%��k:�*7f��a�k�c��rc&�(��!�B��A��L���W兎��ʍ�,�Us�D�B��T��ؗʛ���3Y�3�&Jtl TnNem櫕9�*3g�e�^��@�ܜ��<|[��A(݁3�+-{Z��B�ܘ�:�]c_:�*7f�����'��3Y}�����C�̘��[�逅�M�ʍ��a�,�ѱ�P��;{���W8�7�~�����������a�bC�W\�F��-�����8;Z�(�>o}��Cq�w����%�$.��K��S/q@q��a����%�$���#%��y�%N$n�l��>�����T��H��D/1容l���h��^b�]�1���D���S���(I��9/1�n�W�d�B�\�-N����j+��9�%�ܵ��wVJt�-/1�n�Ny�R��9��Ĕ�6�<�^�K^b�]K�nr� /-����[��5^R�\�/�y���K��+������Y�%�̍������%���
7�79�om�ĵРZ�^bL���cč�9�%�����d�s�w�)q���Xo�s�w�)q}\�a�B�l�S溯N���Y�%���=\�:gw�x����ex<�!i��������m��A9�!����v����?����;�	�w��tN�������������������hkuq{#zKrp��h�rq{z��pc �����f���D[o��[�����mm-n/��UZ�)�����r�:�y
�������6�fs;�F[���B���s�t������67dw�,���^q{!m�K5��������ۗ�yk$�ѷ��B��7o��Kt������6߶l�\���Vq{!m㏓��}ot4���������$:zT�^H���Q̛�
������V\7Htt�xz筌���M)n/��l>����Gq{9o�gs�DG+���yk��*�х��r�FEcΉJt4�����1x�����=q{1o�e{��DGۉۋy���=%::N������sځd��?����?}���������$)���՞Q;����nO�1ښ��]=&���\F%�L�;�;e��FWw	p'rg���j-���'A]}%�]�]b5[�kt5� w%w�.�]%�����P.��I�s�b0Wcht��0��a.[�{%ht5� 7��o���C̘�ނ��B�g	pS*��v�0���#�M��h5�.$z�� 7�2x؈*ѳo�)���E�B϶�T���قL�g�pS*ǍC6׍I�lnJe�ޞ����-�v{Je����!ѳU�)�s��� C�g�pS.�iV��=�D�s9���W���"���̣������ܘ�q�Cu�г7�1���-�%z6� 7沖f�J�gWpc.�mU7y6� �o�c�*�&�?�>~�����2����j>\<�Y��vO���|��O��T�����]5�fu7{D���=�J���n���q%0Wih���n���jvoQ�[���.�)���5�V�r�+ړ�PI�b�7��d�d��[��m� �  ���5vm��1��2	�Gm�����ZZ0ni��ovNjM��e��9���Imޛ}E$:f�7;'��'o�c~x�sR��A�9�͍IM㬀�h�c�x�cR�kn�:�7;&5���Gk�ƛ���ץ���cmO��1�O]%:f�7;&5����t�#ovL�\�b.ʖ�M���4�X��X�S��ԔS0[Ht�,ovLj*�-�o�c~y�sVKpC��1˼�9�5WsݔD�\�f�6�͍;3Λ���j2W�Ht�;k�|�D��h.�:�9���_�۳�����9<܁�٥�:G��;�ۻ
O�%2��;�{Pv�$2��;�;�#�5��]�]��\[#��~�+�c�טkdV�wcwk0�"�YO?��)e��Ȭ�/w�\��*�)���Í�̹�/��Ȭ�n�eI��AE�*�a�T�N_�I��~�9�s��]�-���͙lљ˭%�����L�n�Ē�燛3�K���j�39�;�{A��pc&��e-u�官��G�f�'A��pc&�|a��A��pc&_^�l��A��pc*���9���^~�1�㶱���%�j���\�"=��Ӓj�s9JE�T���S9��o[�䇛S��3WJ5��ͩ��?�
�r7Ne�J.���={��[C���;�������ۿ�����$whydy�p�ِc�<��go6��h�	���չdn�h�����~ݸFێ8-�(�1�=�Dۮ8-o,�.lm;㴼�<��D��8%����o.�h�#��Њ��l���Y�/��m;��YG��m���Y��0��бcN�9���~��洜�9���B��9-�|6ߠ~[��=��Ϟ��aS�c��c>��|�c�������.t��r�g���ٲб�N�1��Gk�/��}uZ�	�{KI~�co��cBǭ, �ɱ�N�1�m��}{���Rh��v�c���c>[j�8.t��r����������9��a&h�cϝ�{��!�����}wZ���1<3X��{��3ö���Y6$��/��������ۗp���jk�ݨ�@2�OmFm���%��b��-��.�2��2����?�}&K��OmC���[F4�J㧶�v���>�mE�C���6z�ي�Գ�W:me�S���2IE��)ń�Q��� [���b�z���_���}j1_��-9Jݧ��UK�5~E�S���0���(o�ZNW�	
ۅ�����t���N�%�C!]�7��`V���S��]5��It��O-�k�m��R���}j!a�o�87�L��t}j!c�o�������������cܳ��������Ϳ�ٜG��(U�ZH��۔�
X��H}j!e�o{1�xHt��O-�l�m�ɬf$:
Ӈ6q�J�h+�Q�>���ql���S�)3�����Sߙ/��F�~
i�����������f.��Ip�8���`N�(T[]H�����&ږ4Hueu��\i��h��j1^`[� ����°#Ѷ�A��rPo/��h[� ՞��~��F�J����~�F�B�����?��uR�9�)�/��h[� ՘ĹK�|�Ѷ�A�9�9zs��D�B��$����ѱ�A�9�%vs�P�c�TsKk��D�*�.��q!3�Jt,b�jNc��
r�`�b�b��ˋ$:0H5g�{g>p��X� ՜�^�y�$ѱ|A�1�a�z���B����,�Q
��9$:/H5fq������R�Yבl��It,]�j�b)����B]1�!���,.t,]�j���JR?ѱrA�1�!�
5�B����4����Y�X� �#��E;�l�>��g�����?���!�(/��ewC��U��g�ПAj`U��q�3g�5�gb���|������h��U���V�I�}VV����\�ؑh��UrO��h��K�}�V���R�3�JQ�c6_���>_���\1 j���*9&4��ͷ^i���*9&4�l���h��UrLh91�8&�9���И�8	r��*5�s�J����y])�Ϙ���M�svW�9�%d:�7:�x���Yj4�nKt��*9�Fg�Y���Ur��8d����J��l)B��9����ٖ��Ot� +9�sT���A��y`%�|&�\�:g���\-�z+��9a!�u(�[����VrL�(3ԉ���J�	M���Sq�s�X�1�)�
7��s�J�	M1d�-\�7��������ˎ�      :      x������ � �      <     x�}��"1�����\}��e�ck@���{������ܠ��{mj�6�C�r�j��� ѢZ|^��}Y��u�������@,�0�y�%��ċ&���f.��E��=�Ig��̣�e���c��I��W͙][���;$��Q.�+��2�������|k� V�RT���,�[l;�U5�͈4����5��W��>�l�7H���[��T���j��D��^=5s9�1Ѳc�V���W�X�j���7H�N��K��m_K��r���g����(��in�k���W��2娪M\��7���yi�x��9'ic���o�-?D����������y��t5��)�w"J����E�\ty��+���o�zʷ��^Hx�;$�vH/\?/ڣ�.c�V�=�A�4_�7*�E,�r@Ϙ$�y��7��/=lퟯ~DB�s����+��"�kd�$�6����UE��*��<tn�h��6Щ��SMWd��C�	)<�-�?}��S�����?UD�I�      >   b   x�U��C1��S�N�K����ڨ��G~���5iO�П;�`����D<�~�է	��:��_&���KI ��*��8�[.�%�x�V����_c�6�-�      ?      x���ɲ����7�>�|"!�Ψ@u�w�A�D'ѩy?�]���A��3�n����'�V�*���Z�>�8���0���N�,/�>�yX�&�<��,��������L�f���]�3��0ԔJ+Gҁ5��\䳑"u����Ҟ9�/��e��a�����b�_����<Cs�$��+���m�`��O� �I}T����B'c� ��g�g��t�#�ӘN��f�^����N����j$�;�~^byNx%����_��v������!ʋ?=�UW�h)v�p�a�Qq�/V���C��@8��[W�)sPG�U���7�o��2� ����E	
Pl}F� ��S<��/������Si���vi�;���e�u��S��n����NG�ei�<��*e.�R5�f��B��I�����+�/�!`���ñ��J$�l�(�PQEYy(-�#P��ʰm�CǬ���]���B�K�j�=�s_�}��
�;�2u2��,�a��??uZ� 1�o��AB	��KOo`T��@�[�
��C;�~��6ߙ�gn��1�L���]��D��嗵	f��gQ�<bv��'\����4� ��/E,��P����`��4t��.<��*�,��Y��Ț�nA�bY�k��VY�SjNv��p�箂�Q~U�l++ �9�7+�,�<�o����>٢���>xeʾ�8Ftj_��y��ʋ���b�ƨ��Q�V�������=�;�xaLǷ.[��(�t[�
Z�e�W" PJ����`}�@�;��*��f��a�i�v���V�egi�ZV_�7`sBS#��t����m��q��T�� ��%�+�� jg�6�*�a�Ɵ�U�y�ڷ��!��?ޯA>L�6��j�ڈm���s��B����d��3Rd�*?�iC���P�'�W�Zc���OLH�tb���ÿ�~���+�l5bVwv����V :/��v*o�Y�7{�T�p��Sq�������ͱ�y��Ȳ�KO�C��rj�	�S�k�%v�~ΝB����Y�f��	�z5�H�`?^�;�3e#�����0��˪��߿�f `D�P]�X?��OX�:f���6�X�0���A7/�]�r��A�W�Ug�c��R� f��d��t�B�~�6'�O��h^� ÿQ�ւ�'�D�8+b���c��({���ް�u�g��Vk>8ޗaf.�$
[?N�iW�N�	���C���KO��X�1��OT��m'G�]��ެ���*���rYM�����Z������[�X����m��3Г�2h;[� ĺ)�<dȾqT��P:A�`�G���NCDn�qx@��.: ��)*ߡ�<������������gC�^X.����z�4���5�`{�Z�E��|�2˳�����<j��	(�.��oǾ���{:��Wv�������zw�U����U�>�A�	�܇����̶��7��ؘʐ{%�(��`{�����vv����0���g��&���,�zsǻ��b��/��������x\^��-:l��$�	xy�a�+����
!��������U��������驱ls8�;f B#-��DS����M�}90��|�@9�_�ɽ�'�o�������3�Ylq%V�/~іA���`��y���	��ȫ��rQ��ٷ�	�sf����2^u������ӳT��iF��h�~?�MN��#�~C�,�D��^��w0��R�`$(u���"�ʆ�S+�<��|���n�kc��%��jZ�m�4�S.<E�O�y�C�߃?h�DΒai���J�S�7(J�q���N�C�;d��^!L�i�j��~V��#�Y��-��.I���f�Xޯsp��3�G�� �b�#�/E<5Ly�CŮe����(��.s��O�8���oD�e�ԇ�F�I��յ���V9R��������t��W�B\��lhy@��=��"�R�����ˉb.>#\V�
����Y�a~��*�х��w�"�S���L�/��S��U��I�E^�ҤW���˓7K9ȳ/E� L���g8�J��pI���j�r����	G?�on��^t�U2�V������%n��L�^l/�px3�˶�Lj����.�����?%<�k��a}�T�X�KCڧ�(ѳo� 0�g�}��ح{��B���*�Iuړ�9����^
�v�m�[����<Os���}k}X�.������V�ȕ���2��T?y,vz�^,Wť��.'-�C�F;Z�P���.3��L��[}�D4`8�a%�H8{%���x�Q�w�Op�~й}C���EG������\gS+�Z�*����|7E�^*E���K`].�b�R�n˂.e�9Ybٗ"�~�sB�I�RY�;�B��~���K�_��s�i;�*&��:�KOwK�Fõq.gVÍ�c8-��GPb��*+`C�,�J��ת� t�_�DS��x�|�	��;oj8���3mWN~kQ����w}�F�Rͬu��V��:��K�ª�Xok]+���b���Y����%����J��'�/�R�'<|/;�NX����s�[:i}�*N�[_�}M��r�q��ult�b�lm����*���V[ $���X2Y�j+�����J�>iy�m3��Y�a�o�z�X��~��Ib6N�BI(��с�Կ�u�$�~�yw�i[�!�T��~����� �񨡢�7�O`��e8���p̢�ZvUpu������U����QqF�s�ѧ��+��6U����Ɖ��{7��m�t�2ψ/E,N�05~��$��Ŏm��=��r�w���qg��#��HkZVn);�&�|�N�Tک�����׃�JI���DҌ,ʢ�R$P�K��gu^���q�q������8���S�����N�N�W���p����:^��3����e7�H�0Z�{��#�@�x����~	�c(j�P}4%9��H���Ж�gtma�D뎳���㻕�c�^������mw�76�t����1O��~�iBF���>�!NE��c�X�;��w�['�X�;�X��o!G�`��g����ZD�)�E��"���ז�HM��m/'Q��+ ض=ȰU#d�Ѐr3�Ô��7D�ے�L=ܘ�>�24��D��rK���S�ӭ|f*��^9����<ތ��r5FI*�	�M�qr�J$}�a�����	�R'���8��4�����	����x��{����������?P���r�ߺ��_���E�CZbṸ�S$Q��#	���ו�p���'E��ʎ�[�/��]jCҏ}�X��v\�<�V�q<d��}'���
]}�ļ���y��]��8��#�}��ij�3��J����'>��v�G�w5	��J����f$q��w�=�DydMo��9�u��
;p.�V��Ο�\"*%�g�+&^>Ȱ5y�}V����m���
Ţ��g�T/��i���mO���9
��{�{��3�c�
1`_G}-K?��=-l��ߜL�<xՊ%RӖή�?|��ԨЃ'0���aķ���Oq�COb���Y�1�L��"�ٱ�jV���ʖͭ�5�̎�s����۹p�a���$<)��oH���P��K����eFf%��O�P������C��i��M<Ud� D�=�g3�q��a߈aQ�V|��2H�VY$��t�]3Kq	�Z�-�i�X��GU"X-�خH�DX��/����$H�J�$�����'�ǻ�k�J����55{��*��g���">-8o���fH��Ɗ�J�q5C��)�����vPY�����7侷������r�k�]j��F���'�PT���3�@�+a�D�[�"��@b%A|!��c�D��OV�:�g2���q�������O.�.*�<�-;�j�Fަ����ggp50�lśt��V��XJn�+�h�K<|%��ѿ�����	V����&bה������KtFJ`�37��f��O�y�[��
�sܻ�^NA6�ԋ��l.�Ws��y���e� `CHү�9���>    �x�MJP�mQ�3���O�����Y���i��}!�M=��U�&`����t}pLC�VmA�ܤ&M(*�P��KĈ$��a�T���7�@a^��oG����Z�uO�m�{���J3�8t�C,��3���=���x��b �W&V�t�p��	�(�a��0
Ԣ����8]��Y*�?q��.���&��z���U�Bk=�F�e��Puo���8Yr���6j+|5L,O��P� ^� �LE��)��I��s�!���fK;�,r��aײK-�s�֣C��|	�f����h<O��k�����ğ�����k����E-��2����0�"DU�w�
tx�y(���3�z��f��=���Xߎmיw�[��a���"��ہY@��4�p_R��"�l<�>�*�O��b�m�� �_ϸԯ����8������UV]%���q�Z�:i����^e\�F�,	�	���+	�ؿ�wL���ah��u�����O�ݕ�]�-e&,X�|�|sׯ�?\�[8+��9���$����s�2��c�R�?���9�0�+�5�_T���D�);vl�g��W��;��/^ج8~cë=/M�2e��0��:!s��f��{�k��l����fᦕ��]�!�e���^-"�R.�%��9 ��
����@�s�^k�Z1ӱ4��j��(Xg�����l,n�
D���ɪE{�T��iY���ճ���8�I[d���D���na��eK�6��f���Ҳ�L�g��G��\�uk[,���¬�Ed�o�m�.l �y��W"�����B1{sm���`�T��>`��˥����&���W����W�Sv>�:
c��n2����4��!o�AXR-Į����+O0�o�>Q9ʳS�j��[�,�x���e8�{��#l�~��a,\�� �.��@(80[j��I�b���@� ��$�z%�mD��j���;濢0�����R�b���2<�3��DO8��)��R1dH�̀�r.d���Z��IJ��f��_�p�R�g�M�=��>�j�h��t��i��.{�6ܳ��Eζwʚ\��ԯ&�ob�J�ϑђ>��4�H� �J��-4��gÅs:�f�Q�^�����:l��j5��u��͡��u.��%�k�������9-{��?�Z$^�hYN|%<�����_��`�OlloS;,�,hŌ�2��9���h|�Cn@oW(bxp��`���cB��s�>g��ht͖--�G�b i���J$S
A���S&2TX�Nr����L��}�whhc`��kzu\�o��9Y%������g^�~o����0�����c�RD1PS�Я~�m*�*��1�H�P�omv��ı��2��U��in�gSo9�X#k�g��~<�&h|V={5�>��vr�h�e���~38����P�q�F��m$�O���PM�ރ���"��!N�B��w���+I���w�"}<���t�Noۻ�)BtZ�iPki�"H��2� ~���D@�����EI�9a��e}(:!�@�����!�z�㣸c'�ѷu^��H�A&��<7T[�����@&Y%'�P_������P}ⒶY��M�ɴD�͕ߏ��}�}�T�+gm�^q�K������L�����w7g�RS~ �����-��&��0!TԔ`}�Ը�,�+�.�'C�q7I7+��ӬX��NEWcZ�nGQ�����O�]����@c��:�$�Ł#�3�^�d��a� 0���@�B7�IR��bv����a%�G��:�\�J�� P��gՄΏ� ���y�Э� �+��;���݇�?}H�	32SBj�����<o��,��98�h�Cg�<�hFJ�;c�8�S^��K���`kJ�?�e��c/GH��&�X� 3��8��W"���e���!h��`�G�8,p(f�x3�[j>���oU+�Ѷ%��6�Q��\� ��Fc���͕�;~_��۞|`0�6��cy��{q�paC��zB)/�p�D�q�h���<7�6�j��8��W�����p���E�y}���5��������,�(������Bp�^��I+QYZ�`�(Z�b9r�Eg�t�fo��XNz�1��SDO���s�+���2{���ER��8|��Ke���D�q�(���=T���'k��N�wgI������C%�@ߜ]��nhV�U��r�ϙ���L�J��7�E �{ԽR���K�6S�?�'ʢ��"
���}Z��G�\��m�H�����"�K1^\���.�����U(���h�m��H�(��o�ҿ���'7�4U����U��S	�����cW�n�J��i��v����'�!I�͟۱g�[�!�@d���,��'�"\�/����9���N[��Ψ/[�`��ݡ�T#�9y���kq���s�;������E�+����m���taU�ss��nMr�*FO1?Q��a��&I�����jm���������Q
�Aս�@�0HzLy�F��L�0��N�����᛺җ��O�6@� ����`�Lz��9t��UG�����z?1��_���)Es9B�f4�l�f�%Ҥ-�y ��(��LC�_���2Ϛ�i���|@�Y�㈸
�
��S��i��V���k����`^�K[w3L��a;������!����A��|iJ�X������Od�*���%7Yh��-�>tN��,'�m��^�#ɋ3��ɽT$;G%�K��m8�Ɋi��*(6�������;�����U��]��]�m]]Ye@g���}��:֞w��nS���ŨP�qg1Y�Z�Յ3�N�2B��&F�B�)�5������/X��w���nR���Qz��k�:(ǧβ�im�h��3�n�^�G|"8�2a¡.����	����M1J�-ůMrP�9N�ݯ��L�\pd�b����|���<�ľ?Oi==˶czخ/:p�}�XW��Y3��9��Xk��-��4�\��������@��� ~�����ai��{���S<�q�H���!�����t���h���9rq0��sqzXO�Ԟ����2��b]6K9uy�#�6^J��0���4�ɐA� /E�%8���}��c��cګ��j�ˡ�S1�~�X�k4���XOiƤ�'[S"�t!��6��e7O�I=	��,��w�dQ~V����S�dT�!��T`��Vmw�A�r�qI/�x^��}g�����kTm֯�^��iTM�@�e��I&}G��s��H��7 j�4Z$��]��F�t'�-EO�t23�
+]Fn������KI82�a$�I���v$װK{mv�a©/�P���EZD RJ�E�4C���8��;A��`o۱�U-���T{(Ʉ�oN�����80��vo#�֧I�X�x^�����!�N���u�H�E�OhH�yV��Ys-�-�;\�^ѷAw�gf�$,��gKQ=l�Ko�/�$��owP�U����%%���*�;u��������S�J���*P�����a1`o��t>��3�/�ɸZq�h�l�����R<5��:F�Gl^&_e�@|-���O��1ܿ��Ov����q<�����dEYfu�$a����+v�'kH��e���8���$tK�t�	6�dl�����em"j����QV�S@-���S(KT��d�֮~W�E�I>S�7�|�%]n��3�1==�K2�3km�����Y̶�"XXUI�Y�D����v�=�d��p�En�航��mv;D#�\��P��}0����ń=���<������gު:�Z��s�9�>C&�xA|�la��}��m����*`���p�����T�����̥�X����	���Z��-�W����� jge���E�l3NH]\�(�D�ǁ/�'l�q�+��a��s(@���	F���<݈�ېGRfY�0�Tk-����O�{��F�*���V�aI���$�5xp�D@~��=y�=q��	k9    W�4	����FI1�ϮR��z���hM��T��=ZMK>d�U�.����
����P��X* "�×"HM�&о?���~�y���
���}m�O�"N��LMT��}z0S�C��y�L������7�c�a�"$���!W3h��s�؈��� �|���z�}6xӀ=A�������|x���n������GX6<^v��|��~w��c�6���i5|��7���q�"�j����'n��3;��8ny��\�7�h��J�)�a����|f��r0���}r�b�q�XZ��Ӡ��Y�̸��q��yoaG���I�_^B�B5��E��:�b��۲I������v�w�{Ew4��46�{�W반�V�k����!�ǯ[D��jD�����?��ҧ8k�	z���x�4H;������5�je��h��ݲ�Λ������^"2������@rc�_����?�/�?'�Bb���O�,׼��}�i�=��`��ǑH�o<��;L�H�mG��I7�<E��Zxg���Ƭ�0
��|7�&ҘEm���'L6�04ˋ�̿A���'mrA��=��&������'�7�\0��-�u�T��mf�5;���R�����箫���նr��l�7�i�cȾ���čR�'`�JCa�B����g��UT�}q��0��#�L���b��jVy�;�1���F+�2'7h+���y��"�|m�E��&�<�'d��!�2қ����4)8֬�;}&t�r��p�_�Lu���E�9��	l�֑(��Ӱ���>���������
%��$����A�w�0ܫ#�O���[i����}�6á��"��O�$O�]}1��l�df#q�9�/���B#�P�>����nf%7.���C�ǳE���dUI����Ϭ���b�9lr����"=��EX9�މy7>pN����yx�����
[9�$�@��W"�p��4 s]ׯ'Z����.�Eܼ%j�.�uR��0&�p�v{UB�������+m��|���]��L��5,'����H��D-�'V��C��!NhÖ���a+�g��0�ܿ�"KOw�I>��H.�`>엣��'���:=����r ���JPf���7>]BE�կ	��/�!R5]�,��O*�?���d6�A`�����*�1�nU@PUx�[7�7�W3ǌ���]��`�l�J��n�L�Ь�Ix)j��YJ�XO�u%�HH%�������+��fJ�[���U�:��x���oz��S������eW��v�VJ\�Ds���Vz���g�A/{��*�<����<��:��.�g��pۧ]F��n�s�c����Jn���e�)F�%ry�a�/֮Eރ���Ź���|H4bW	i��Dw;Nt�u��jۛʁ�Ṕ*���3m?�'�'�,����0�%fH,þ��@���D���VЬx9��.Ia�-�\\�����!���V�	S9{>K��)�䴸wԋ���rpe`%qmN�Qvnz����#�-"�*����w�Ȳ�����"E�c��2��`��/���&���c����ZV�t���?8(b��7�!���z'�	��s��E�VMQ�d��;:d	*��m�w�5���|7�C�$q �\Ajqs�����.+�UO���v�J,{V��G�'��	��JI0�fT��=����Uu��X���� ���b�]���s�C����V"w?����n���]'h+57D�5��=G���D�=���"]/{~�x������K��͉IG�f�Y6�꣎�kaܽZ�mx�Ҫ�O��v\����([�.�����2/ ����j��S�7��T�w�f1>��>�\�f���9o%�61��g��Xo�卪��U�'�5ӏ/f�P]��vɵ�~��7 2�+I@�����9�_oc^��Rڇ)�qTT�����/Ⱥ��ܸ<�:�aXW�xVN)���ur�,�j�l.�ktn[iȊ��JFVq� Y�9Pn�&�te1��L��xR�)������)�����t�ڊ;q{CL%��9�Y��JW����9P��q ���e��'����z�rQ�~	,�}Ĥ����Dp�lF����XWy���#p��q���ۙ���&��1R⣄v�A�3-i�5%CH��i���s�6� ��+	�{���S#�����ɒ�~Gɼ�Ҍ�l�\���������O�� �G������l)Z�`NA��$iz�j&�q�m3�Mٖ��,-�Xyᗳ��a���'S�Z�_���I]��b�_��]�D̓Qr�C�G����zV�^+j�ލ{��w��yr�Ok��X��"��-p�8ks��<����)������!�!MÏz�����M2Uxȵ���V�/�A�2|v/�˃��nV��Y���(U�c�r�n=��i�?t��}�E���ǹ`X��l��g���1��Gr=�e��ph�H$������A�/�T�%R� ��=�oƲ�k.ʬ�K� $^<�����i	'C��I�[�(���W,�	"sD�/#YC�Qm��=���� �����|�l΋��ݷ���{B,�p᱗�W"D��Z���F{�T���N��5�����(�>�����2�W�2u�N�N�����Rn��qp���
��[�C��ZY��;9dJ�����8�"kQ�A���U7��NIK��-�0�փ�斶*��xT�G���g�1�����t�t;�2I������y�t� #22�R��(�/J}�{f�#��� ���?��X�vg�^�#k����ȚJ
����d�!H٭Bwo�8�@E�'��-k���/"�t�~}�цOt��P!l�����O�ŲCz�8��X\�XO��R�:L��P��ӣ]U��������m�]�@��ɊiF�%I|)z���A߯H����r<Q���6�����`vpR���[ޑϛk(�K��&�BYn�2�${2��%o��ֻ��6�!�Ղ �y |%�>�2,r�*/�5G��8#�P�(Es1-lt��M�|�t@�!O��Z��>֣�}��4�v�zw�fb]���B�L6`Or�+ ����E2����4L���~�֋�VotIP>u'����>:UhsM�o�Z��l�f��VL�k��m���q��<�<��S���I�ȝ�p=KT��%�jҶ=s��3:��>/(�U� M� �6
�$�tq26Y�'�������n�����H�@�6���JD.��9'd�!�{����24��d�cQ��΃{����!'*o��D"�^;����2��sv���RE?y�tcl��5Qi ɝ?r��.�Y�U��E�q}�ǥ%�衐��g�*]Wa/�ġ-�i��.]�����͞>Yt���v$�ѓ�d���V�߮�-@I~�n}\^�EMW�?��"	���[�O��E���|��������Kiv8��I5�n�c9a'��ڗ�J���Nb��[2w&��J$�<%E}t���m����R�dU��x@�v��OO徳w��3IϺM��]���a?��۝�6U-�9�n�U{zEV����Sk�5��.��m{��L��P�%ynF����9m:�j�]r�Ϫ���B�#kC����5�HӤӝtn)G�(�����"a�9�e�����cFM�'\،������-W�� ��'�X��\:$��L��1{�8g���(t�e"M���1W�]g�60%6א�f�D2^��̰J`��� |o�`�X '����v��5�i8X�8O�������c�nA!zl����X��K��:�{&MAK"{��W"��h�(��zB&+hJ�N�h/�[w����"�G����J结�,/�D]���z�rw0���6�硪�f�qc�h��� _� p}���R����On��C��~&h+�Hg�>�xh)�y��.�*��*�}4RG�h��Ypb�D/�?��"����NJ�k��]��)}�}�Rs�yr=��d���uG	-�ױ�<���z�s�G���Z�N�y��yo���p��v��d������S^��)_�P&;���C�+ e  Q�߅�?iF0�"�����N{>����{B����N���U�[F�E��߶y����Ӭ,|��_%����5TO��3T�g�o��lT�D�l7�`�axz��5;���h�١�@�xU�3u{���L)�Q���?�>��9�f�]�W��Vcŧ}s8[��Ȏ�)��2�Ў�.X����Sv����g�������5��Z��qm�ˁs[�m�F"�`I�Y"�5��.�͘�����xٷkJt�5�_B�QV��sFB����>S�ot��(�YocA:��]���}7��͑�k��,�/$�w���;ֳ:��;��%'F�l���Y���h<�PMK�p^��G����E1�}OrB_`O��+ڕ��o6�M��;�BĿoz`�'NH�YB��G��-#��`.��瓳���d��]���k�MW�'G����;>��d&�W�j�,�\d�hQd�ȿ�|v���	��X�W?&r[��[NSn����P�����+N��<���� �WZ�)��ԟ�]ۂn���U"���L��}��>f�?����}��Y\d�Y�N{��nt����I| V64��͑4�N�P��3�Oԓ:`dF��Lo��ߌHK<'I�Y����>��E�?_�'���N��z��q��m���o��r���;�):��vuw���ڙ�����v�pL����4H�6�C��'��W"r��}�^o���|bƮ-�d�Nb;a�v�u�V��S�t���ʪ�L\����I���M�}j�/k�H�۩�����y>Gl?E��=�H��{�(QE����8����y�7n9�1wC�(׸�a�b�����I��}8�~a΍���/ ��P��-�Б�+ɲ��������e�w$Y�l��$��]���K��H���7�Wi�����
��&[��+�y���er5��%:d�����=���y��K���>��$��Ȋ�~�)�e%��B����=��S[�d�\<C��M�DP9��{�Vb%I�_�p�0j�����
����:��]Z��e9���3�{h�D�l��d��@TtFDlOdl��w�Z,�E"�e�}��o�m����Ȕ��k$������0ɪ{��o���z�W��m~���n�umm��ۼ�s�i0�(� �\2�ǺY!l�mF^j�X���a�����䏖���D�R���6���1��4l�����|-@a�i��2�Tz1bq�ϼ�2du���K��=N���o���;p�a(a?#H/EM���AGotO��q�&������p|fΒ�<81�~V�hb�X�V7ґ��Ƶ���1�N��nU�-*�1od�%�k�i �ED�ކ�l��§�'=8������F�[.��dM}�Ǜ�w$���T��Vl鎳s�����=^/�^������=�f%Nne�lKj��j�R�؞�,�}3�c�g7�kI"�0�������;�(�W���C��Nt����R�����x�������M$US��26zPx%��[�z^���(�f�a�.�2$��cXЧ݅��ڄ��fn#�bv��t�/d��Uq���4��J#�@-5k!x������v����Z��Ha���a�8-%z��rZ��G�-ߩ�U�y��}K8����� D��(�����(���\���<��D8�1�M��Xv��g���KdI�6��R���N�c}�,�5�b�Lf:��7.�0 �+������� '��淒��c��4oF�R�S��� |b�?�
W�?HȤ�O���Q7p��=�׃��?k��+�y.g�͟Z���+T{8���z�|��$����l��[D��d��"C��8����Yk�}�E�Z�G�D�������Q�1�kp�Emѓ���:�0v�	�h�{��6t�5K�-�P�}%a�(2&[g��	PyV<�LV�_iY�a��U4כ�{��^Y[�����UQ�V��d�.uv$�/�����4�ŉ]!�� �a�=ϊ�ite���D�8J��1px�ʿ�%6���c�Qͻ�i�Yxp���`�GWz�9s����_�o��n�k9�`k��+�2����4�AVd_�ȴMj� �@=�rT�{ix�<^kPz�qX�ǁ�7�ZK�r����Y�M�-��T�ۡ���}]J���������߀'[�Y	�5�6!�N{�-���	�[��W����l���/VGqv"cz�2t˥�8r��*��iu8L�r�=y{�l<~~�$‎{%"�:��0�&M �<@p"�v�̳��Ӗ�,���T-���B��Ht�a�}�(F{~���i�6[�~�����`��Ne���W"��os�����[���]gM��6����J���:��@����v�����5���9ڲ���!v;}϶�8��P(�V ~�$ȿa�x�A��{�{B� ���T�Q����`��σ[���
i�T���%����4����No�_�|����op<�z8�'��'�W"�?ZHFkvM`�'�(}��d��Qvj�!�k�>����e|�l���-�;#�Tc�ߌv�p�S�4�_�l�כ+�Y�2|%�����K�dOԀzlu��=�(��� v�����΍�$��Ҷ���^\睃�sY|�-λA���{��j^6�3|%¡�c��/�K���m)���
����k�g�����Ƌ�u�6�rF��bU�lԾz]�-t]�����\��a�$��+�ǯC�o��E,5�{~��KqM�G�������6���M:C�����%��'T�6�bvsB�¿�taf��Y/\�����
��,�$��^���극���R8a�s�>��`7]��с���l��V��D4���Ng������"���ޭֶ�ê�����$�����x��.�e�������_&����_�����{     