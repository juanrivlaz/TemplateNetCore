PGDMP         ;                y           PrestaQi    12.6    13.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    61565    PrestaQi    DATABASE     _   CREATE DATABASE "PrestaQi" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'es_MX.UTF-8';
    DROP DATABASE "PrestaQi";
                postgres    false            �            1259    61566    users    TABLE     �  CREATE TABLE public.users (
    first_name character varying(100),
    last_name character varying(100),
    password text,
    employee_number character varying(15),
    mail character varying(100),
    phone character varying(100),
    enabled boolean,
    first_login boolean,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false                       1259    62926    user_seq_id    SEQUENCE     t   CREATE SEQUENCE public.user_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_seq_id;
       public          postgres    false    202            �           0    0    user_seq_id    SEQUENCE OWNED BY     <   ALTER SEQUENCE public.user_seq_id OWNED BY public.users.id;
          public          postgres    false    259            �            1259    61572    users_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_id_user_seq;
       public          postgres    false    202            �           0    0    users_id_user_seq    SEQUENCE OWNED BY     B   ALTER SEQUENCE public.users_id_user_seq OWNED BY public.users.id;
          public          postgres    false    203            q           2604    62952    users id    DEFAULT     c   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.user_seq_id'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    259    202            �          0    61566    users 
   TABLE DATA           �   COPY public.users (first_name, last_name, password, employee_number, mail, phone, enabled, first_login, id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    202   �       �           0    0    user_seq_id    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_seq_id', 71, true);
          public          postgres    false    259            �           0    0    users_id_user_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_id_user_seq', 1, true);
          public          postgres    false    203            s           2606    61582    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    202            �   �   x�]��
�@ ���W�.�3�3������BxQш��"������q����=庆&c���(c}�0��l�ofd����".��3=���i��W=� D�B`x�d�mj(E�X��5z�������	t��R���%�     