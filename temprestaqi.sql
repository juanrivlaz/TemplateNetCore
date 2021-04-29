PGDMP         $                y           PrestaQi    11.6    13.1 �    
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16500    PrestaQi    DATABASE     n   CREATE DATABASE "PrestaQi" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE "PrestaQi";
                PrestaQi    false            �            1259    16504    accrediteds    TABLE     �  CREATE TABLE public.accrediteds (
    id integer NOT NULL,
    first_name character varying(256) NOT NULL,
    last_name character varying(256) NOT NULL,
    identify character varying(256),
    contract_number character varying(256),
    "position" character varying(256),
    net_monthly_salary numeric,
    rfc character varying(256),
    interest_rate integer,
    birth_date date,
    age integer,
    gender_id integer,
    clabe character varying(256),
    account_number character varying(256),
    enabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    period_id integer,
    moratoruim_interest_rate integer,
    company_id integer,
    mail character varying(512),
    mail_mandate_latter character varying(512),
    password character varying(128),
    institution_id integer,
    deleted_at timestamp without time zone,
    seniority_company character varying(256),
    first_login boolean DEFAULT false,
    is_blocked boolean DEFAULT false,
    type_contract_id integer,
    address character varying(256),
    colony character varying(256),
    municipality character varying(256),
    zip_code character varying(256),
    state character varying(256),
    end_day_payment timestamp without time zone DEFAULT CURRENT_DATE,
    gross_monthly_salary numeric DEFAULT 0,
    other_obligations numeric DEFAULT 0,
    outsourcing_id integer
);
    DROP TABLE public.accrediteds;
       public            PrestaQi    false            �            1259    16510    accredited_seq_id    SEQUENCE     z   CREATE SEQUENCE public.accredited_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.accredited_seq_id;
       public          PrestaQi    false    200                       0    0    accredited_seq_id    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.accredited_seq_id OWNED BY public.accrediteds.id;
          public          PrestaQi    false    201            �            1259    51240    acreditedcontractmutuo    TABLE       CREATE TABLE public.acreditedcontractmutuo (
    id integer NOT NULL,
    accredited_id integer NOT NULL,
    number_contract integer,
    path_contract character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 *   DROP TABLE public.acreditedcontractmutuo;
       public            PrestaQi    false            �            1259    51238    accreditedcontractmutuo_seq_id    SEQUENCE     �   CREATE SEQUENCE public.accreditedcontractmutuo_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.accreditedcontractmutuo_seq_id;
       public          PrestaQi    false    249                       0    0    accreditedcontractmutuo_seq_id    SEQUENCE OWNED BY     `   ALTER SEQUENCE public.accreditedcontractmutuo_seq_id OWNED BY public.acreditedcontractmutuo.id;
          public          PrestaQi    false    248            �            1259    51494    acreditedcartamandato    TABLE     �   CREATE TABLE public.acreditedcartamandato (
    id integer NOT NULL,
    accredited_id integer NOT NULL,
    path_contract character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 )   DROP TABLE public.acreditedcartamandato;
       public            PrestaQi    false            �            1259    51492    acreditedcartamandato_seq_id    SEQUENCE     �   CREATE SEQUENCE public.acreditedcartamandato_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.acreditedcartamandato_seq_id;
       public          PrestaQi    false    251                       0    0    acreditedcartamandato_seq_id    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.acreditedcartamandato_seq_id OWNED BY public.acreditedcartamandato.id;
          public          PrestaQi    false    250            �            1259    16593    usermodules    TABLE     �   CREATE TABLE public.usermodules (
    id integer NOT NULL,
    module_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.usermodules;
       public            PrestaQi    false            �            1259    16596    usermodule_seq_id    SEQUENCE     z   CREATE SEQUENCE public.usermodule_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.usermodule_seq_id;
       public          PrestaQi    false    222                       0    0    usermodule_seq_id    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.usermodule_seq_id OWNED BY public.usermodules.id;
          public          PrestaQi    false    223            �            1259    16786    advances    TABLE     �  CREATE TABLE public.advances (
    id integer DEFAULT nextval('public.usermodule_seq_id'::regclass) NOT NULL,
    accredited_id integer NOT NULL,
    amount numeric,
    date_advance date,
    requested_day integer,
    total_withhold numeric,
    comission integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    enabled boolean DEFAULT false,
    paid_status integer DEFAULT 0,
    interest numeric DEFAULT 0,
    vat numeric DEFAULT 0,
    subtotal numeric DEFAULT 0,
    interest_moratorium numeric DEFAULT 0,
    day_moratorium integer DEFAULT 0,
    limit_date timestamp without time zone,
    promotional_setting numeric DEFAULT 0,
    day_for_payment integer DEFAULT 0,
    interest_rate integer DEFAULT 0
);
    DROP TABLE public.advances;
       public            PrestaQi    false    223            �            1259    16784    advance_seq_id    SEQUENCE     w   CREATE SEQUENCE public.advance_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.advance_seq_id;
       public          PrestaQi    false    225                       0    0    advance_seq_id    SEQUENCE OWNED BY     B   ALTER SEQUENCE public.advance_seq_id OWNED BY public.advances.id;
          public          PrestaQi    false    224            �            1259    155918    advancedetail_seq_id    SEQUENCE     }   CREATE SEQUENCE public.advancedetail_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.advancedetail_seq_id;
       public          PrestaQi    false            �            1259    155920    advancedetails    TABLE     <  CREATE TABLE public.advancedetails (
    id integer DEFAULT nextval('public.advancedetail_seq_id'::regclass) NOT NULL,
    advance_id integer NOT NULL,
    amount numeric,
    date_advance date,
    requested_day integer,
    total_withhold numeric,
    comission integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    enabled boolean DEFAULT false,
    paid_status integer DEFAULT 0,
    interest numeric DEFAULT 0,
    vat numeric DEFAULT 0,
    subtotal numeric DEFAULT 0,
    limit_date timestamp without time zone,
    day_for_payment integer DEFAULT 0,
    initial numeric DEFAULT 0,
    final numeric DEFAULT 0,
    accredited_id integer DEFAULT 0,
    day_moratorium integer DEFAULT 0,
    interest_moratorium numeric DEFAULT 0,
    promotional_setting numeric DEFAULT 0
);
 "   DROP TABLE public.advancedetails;
       public            PrestaQi    false    252            �            1259    16512    capitals    TABLE     }  CREATE TABLE public.capitals (
    id integer NOT NULL,
    amount numeric NOT NULL,
    interest_rate integer NOT NULL,
    investment_horizon integer NOT NULL,
    bussiness_day integer NOT NULL,
    period_id integer NOT NULL,
    notice_mail boolean NOT NULL,
    start_date date,
    end_date date,
    default_interest integer,
    investor_id integer NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    capital_status integer,
    investment_status integer,
    file_name character varying(1024),
    extension_day integer,
    file_byte bytea
);
    DROP TABLE public.capitals;
       public            PrestaQi    false            �            1259    16518    capital_seq_id    SEQUENCE     w   CREATE SEQUENCE public.capital_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.capital_seq_id;
       public          PrestaQi    false    202                       0    0    capital_seq_id    SEQUENCE OWNED BY     B   ALTER SEQUENCE public.capital_seq_id OWNED BY public.capitals.id;
          public          PrestaQi    false    203            �            1259    16520    capitaldetails    TABLE     R  CREATE TABLE public.capitaldetails (
    id integer NOT NULL,
    period integer NOT NULL,
    capital_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    outstanding_balance numeric DEFAULT 0 NOT NULL,
    principal_payment numeric DEFAULT 0 NOT NULL,
    interest_payment numeric DEFAULT 0 NOT NULL,
    default_interest numeric DEFAULT 0 NOT NULL,
    promotional_settings numeric DEFAULT 0 NOT NULL,
    vat numeric DEFAULT 0 NOT NULL,
    vat_retention numeric DEFAULT 0 NOT NULL,
    isr_retention numeric DEFAULT 0 NOT NULL,
    payment numeric DEFAULT 0 NOT NULL,
    ispayment boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    pay_day_limit date NOT NULL,
    promotional_setting numeric DEFAULT 0,
    reason character varying(256)
);
 "   DROP TABLE public.capitaldetails;
       public            PrestaQi    false            �            1259    16536    capitaldetail_seq_id    SEQUENCE     }   CREATE SEQUENCE public.capitaldetail_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.capitaldetail_seq_id;
       public          PrestaQi    false    204                       0    0    capitaldetail_seq_id    SEQUENCE OWNED BY     N   ALTER SEQUENCE public.capitaldetail_seq_id OWNED BY public.capitaldetails.id;
          public          PrestaQi    false    205            �            1259    49865    periodcommission    TABLE     �   CREATE TABLE public.periodcommission (
    id integer NOT NULL,
    period_id integer NOT NULL,
    type_month integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 $   DROP TABLE public.periodcommission;
       public            PrestaQi    false            �            1259    49863    commission_seq_id    SEQUENCE     z   CREATE SEQUENCE public.commission_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.commission_seq_id;
       public          PrestaQi    false    245                       0    0    commission_seq_id    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.commission_seq_id OWNED BY public.periodcommission.id;
          public          PrestaQi    false    244            �            1259    49881    periodcommissiondetail    TABLE     D  CREATE TABLE public.periodcommissiondetail (
    id integer NOT NULL,
    period_commission_id integer NOT NULL,
    day_month integer,
    commission numeric,
    day_payement integer,
    interest numeric,
    date_payment integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 *   DROP TABLE public.periodcommissiondetail;
       public            PrestaQi    false            �            1259    49879    commissiondetail_seq_id    SEQUENCE     �   CREATE SEQUENCE public.commissiondetail_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.commissiondetail_seq_id;
       public          PrestaQi    false    247                       0    0    commissiondetail_seq_id    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.commissiondetail_seq_id OWNED BY public.periodcommissiondetail.id;
          public          PrestaQi    false    246            �            1259    17349 	   companies    TABLE     �   CREATE TABLE public.companies (
    id integer NOT NULL,
    description character varying(256) NOT NULL,
    enabled boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.companies;
       public            PrestaQi    false            �            1259    17347    company_seq_id    SEQUENCE     w   CREATE SEQUENCE public.company_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.company_seq_id;
       public          PrestaQi    false    227                       0    0    company_seq_id    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.company_seq_id OWNED BY public.companies.id;
          public          PrestaQi    false    226            �            1259    16538    configurations    TABLE     �   CREATE TABLE public.configurations (
    id integer NOT NULL,
    configuration_name character varying(128),
    configuration_value text,
    enabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 "   DROP TABLE public.configurations;
       public            PrestaQi    false            �            1259    16544    configuration_seq_id    SEQUENCE     }   CREATE SEQUENCE public.configuration_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.configuration_seq_id;
       public          PrestaQi    false    206                       0    0    configuration_seq_id    SEQUENCE OWNED BY     N   ALTER SEQUENCE public.configuration_seq_id OWNED BY public.configurations.id;
          public          PrestaQi    false    207            �            1259    16546    contacts    TABLE       CREATE TABLE public.contacts (
    id integer NOT NULL,
    contact_name character varying(128),
    contact_data character varying(128),
    logo character varying(256),
    enabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.contacts;
       public            PrestaQi    false            �            1259    16552    contact_seq_id    SEQUENCE     w   CREATE SEQUENCE public.contact_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.contact_seq_id;
       public          PrestaQi    false    208                       0    0    contact_seq_id    SEQUENCE OWNED BY     B   ALTER SEQUENCE public.contact_seq_id OWNED BY public.contacts.id;
          public          PrestaQi    false    209            �            1259    34855    devices    TABLE       CREATE TABLE public.devices (
    id integer NOT NULL,
    device_id character varying(512) NOT NULL,
    user_id integer NOT NULL,
    user_type integer NOT NULL,
    enabled boolean NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.devices;
       public            PrestaQi    false            �            1259    34853    device_seq_id    SEQUENCE     v   CREATE SEQUENCE public.device_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.device_seq_id;
       public          PrestaQi    false    237                       0    0    device_seq_id    SEQUENCE OWNED BY     @   ALTER SEQUENCE public.device_seq_id OWNED BY public.devices.id;
          public          PrestaQi    false    236            �            1259    155945    details_advance    TABLE     O  CREATE TABLE public.details_advance (
    id integer DEFAULT nextval('public.device_seq_id'::regclass) NOT NULL,
    advance_id integer,
    principal_payment double precision,
    total_payment double precision,
    interest double precision,
    vat double precision,
    date_payment date,
    initial_balance double precision,
    final_balance double precision,
    days_for_payments integer,
    paid_status integer NOT NULL,
    accredited_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    promotional_setting numeric
);
 #   DROP TABLE public.details_advance;
       public            PrestaQi    false    236            �            1259    155969    details_by_advance    TABLE     �   CREATE TABLE public.details_by_advance (
    advance_id integer NOT NULL,
    details_id integer NOT NULL,
    amount double precision,
    id integer DEFAULT nextval('public.device_seq_id'::regclass) NOT NULL,
    created_at date,
    updated_at date
);
 &   DROP TABLE public.details_by_advance;
       public            PrestaQi    false    236            �            1259    16554    genders    TABLE     �   CREATE TABLE public.genders (
    id integer NOT NULL,
    description character varying(128) NOT NULL,
    enabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.genders;
       public            PrestaQi    false            �            1259    16557    gender_seq_id    SEQUENCE     v   CREATE SEQUENCE public.gender_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.gender_seq_id;
       public          PrestaQi    false    210                       0    0    gender_seq_id    SEQUENCE OWNED BY     @   ALTER SEQUENCE public.gender_seq_id OWNED BY public.genders.id;
          public          PrestaQi    false    211            �            1259    19899    institutions    TABLE     �   CREATE TABLE public.institutions (
    id integer NOT NULL,
    code integer NOT NULL,
    description character varying(256),
    enabled boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
     DROP TABLE public.institutions;
       public            PrestaQi    false            �            1259    19897    institution_seq_id    SEQUENCE     {   CREATE SEQUENCE public.institution_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.institution_seq_id;
       public          PrestaQi    false    229                       0    0    institution_seq_id    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.institution_seq_id OWNED BY public.institutions.id;
          public          PrestaQi    false    228            �            1259    16559 	   investors    TABLE     �  CREATE TABLE public.investors (
    id integer NOT NULL,
    first_name character varying(256) NOT NULL,
    last_name character varying(256) NOT NULL,
    total_amount_agreed numeric,
    start_date_prestaqi date,
    limit_date date,
    rfc character varying(256),
    clabe character varying(256),
    account_number character varying(256),
    enabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_moral_person boolean,
    mail character varying(512),
    password character varying(128),
    institution_id integer,
    deleted_at timestamp without time zone,
    contract_number character varying(256),
    first_login boolean
);
    DROP TABLE public.investors;
       public            PrestaQi    false            �            1259    16565    investor_seq_id    SEQUENCE     x   CREATE SEQUENCE public.investor_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.investor_seq_id;
       public          PrestaQi    false    212                       0    0    investor_seq_id    SEQUENCE OWNED BY     D   ALTER SEQUENCE public.investor_seq_id OWNED BY public.investors.id;
          public          PrestaQi    false    213            �            1259    40341 	   logerrors    TABLE     [  CREATE TABLE public.logerrors (
    id bigint NOT NULL,
    file_name character varying(1024),
    class_name character varying(1024),
    method_name character varying(1024),
    code_line integer,
    message_error text,
    inner_exception_message text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.logerrors;
       public            PrestaQi    false            �            1259    40339    logerror_seq_id    SEQUENCE     x   CREATE SEQUENCE public.logerror_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.logerror_seq_id;
       public          PrestaQi    false    241                       0    0    logerror_seq_id    SEQUENCE OWNED BY     D   ALTER SEQUENCE public.logerror_seq_id OWNED BY public.logerrors.id;
          public          PrestaQi    false    240            �            1259    16567    logmovements    TABLE     =  CREATE TABLE public.logmovements (
    id bigint NOT NULL,
    module_id integer NOT NULL,
    record_id bigint NOT NULL,
    action_type integer NOT NULL,
    user_id integer NOT NULL,
    data_new text,
    data_update text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
     DROP TABLE public.logmovements;
       public            PrestaQi    false            �            1259    16573    logmovement_seq_id    SEQUENCE     {   CREATE SEQUENCE public.logmovement_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.logmovement_seq_id;
       public          PrestaQi    false    214                       0    0    logmovement_seq_id    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.logmovement_seq_id OWNED BY public.logmovements.id;
          public          PrestaQi    false    215            �            1259    16575    modules    TABLE     �   CREATE TABLE public.modules (
    id integer NOT NULL,
    description character varying(128) NOT NULL,
    enabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.modules;
       public            PrestaQi    false            �            1259    16578    module_seq_id    SEQUENCE     v   CREATE SEQUENCE public.module_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.module_seq_id;
       public          PrestaQi    false    216                        0    0    module_seq_id    SEQUENCE OWNED BY     @   ALTER SEQUENCE public.module_seq_id OWNED BY public.modules.id;
          public          PrestaQi    false    217            �            1259    35073    notifications    TABLE     �  CREATE TABLE public.notifications (
    id integer NOT NULL,
    user_id integer NOT NULL,
    user_type integer NOT NULL,
    title character varying(128) NOT NULL,
    message character varying(256) NOT NULL,
    is_read boolean NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    icon character varying(18),
    data_text text,
    notificationtype integer DEFAULT 0
);
 !   DROP TABLE public.notifications;
       public            PrestaQi    false            �            1259    35071    notification_seq_id    SEQUENCE     |   CREATE SEQUENCE public.notification_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.notification_seq_id;
       public          PrestaQi    false    239            !           0    0    notification_seq_id    SEQUENCE OWNED BY     L   ALTER SEQUENCE public.notification_seq_id OWNED BY public.notifications.id;
          public          PrestaQi    false    238            �            1259    23470    paidadvances    TABLE     �   CREATE TABLE public.paidadvances (
    id integer NOT NULL,
    amount numeric,
    company_id integer,
    is_partial boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
     DROP TABLE public.paidadvances;
       public            PrestaQi    false            �            1259    23468    paidadvance_seq_id    SEQUENCE     {   CREATE SEQUENCE public.paidadvance_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.paidadvance_seq_id;
       public          PrestaQi    false    233            "           0    0    paidadvance_seq_id    SEQUENCE OWNED BY     J   ALTER SEQUENCE public.paidadvance_seq_id OWNED BY public.paidadvances.id;
          public          PrestaQi    false    232            �            1259    16580    periods    TABLE     �   CREATE TABLE public.periods (
    id integer NOT NULL,
    description character varying(64),
    enabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    period_value integer,
    user_type integer
);
    DROP TABLE public.periods;
       public            PrestaQi    false            �            1259    16583    period_seq_id    SEQUENCE     v   CREATE SEQUENCE public.period_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.period_seq_id;
       public          PrestaQi    false    218            #           0    0    period_seq_id    SEQUENCE OWNED BY     @   ALTER SEQUENCE public.period_seq_id OWNED BY public.periods.id;
          public          PrestaQi    false    219            �            1259    33385 	   repayment    TABLE     �   CREATE TABLE public.repayment (
    id integer NOT NULL,
    code integer NOT NULL,
    description character varying(128) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    enabled boolean NOT NULL
);
    DROP TABLE public.repayment;
       public            PrestaQi    false            �            1259    33383    repayment_seq_id    SEQUENCE     y   CREATE SEQUENCE public.repayment_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.repayment_seq_id;
       public          PrestaQi    false    235            $           0    0    repayment_seq_id    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.repayment_seq_id OWNED BY public.repayment.id;
          public          PrestaQi    false    234            �            1259    20164    speiresponses    TABLE     :  CREATE TABLE public.speiresponses (
    id integer NOT NULL,
    advance_id integer NOT NULL,
    tracking_id integer,
    tracking_key character varying(128),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    state_name character varying(64),
    repayment_id integer
);
 !   DROP TABLE public.speiresponses;
       public            PrestaQi    false            �            1259    20162    speiresponse_seq_id    SEQUENCE     |   CREATE SEQUENCE public.speiresponse_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.speiresponse_seq_id;
       public          PrestaQi    false    231            %           0    0    speiresponse_seq_id    SEQUENCE OWNED BY     L   ALTER SEQUENCE public.speiresponse_seq_id OWNED BY public.speiresponses.id;
          public          PrestaQi    false    230            �            1259    49749    typecontract    TABLE     �   CREATE TABLE public.typecontract (
    id integer NOT NULL,
    description character varying(120),
    code character varying(120),
    created_at date,
    updated_at date
);
     DROP TABLE public.typecontract;
       public            PrestaQi    false            �            1259    49747    typecontract_seq_id    SEQUENCE     |   CREATE SEQUENCE public.typecontract_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.typecontract_seq_id;
       public          PrestaQi    false    243            &           0    0    typecontract_seq_id    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.typecontract_seq_id OWNED BY public.typecontract.id;
          public          PrestaQi    false    242            �            1259    16585    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(256) NOT NULL,
    last_name character varying(256) NOT NULL,
    password character varying(512),
    employee_number character varying(256),
    mail character varying(256),
    phone character varying(256),
    enabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    first_login boolean DEFAULT false
);
    DROP TABLE public.users;
       public            PrestaQi    false            �            1259    16591    user_seq_id    SEQUENCE     t   CREATE SEQUENCE public.user_seq_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_seq_id;
       public          PrestaQi    false    220            '           0    0    user_seq_id    SEQUENCE OWNED BY     <   ALTER SEQUENCE public.user_seq_id OWNED BY public.users.id;
          public          PrestaQi    false    221            �           2604    16700    accrediteds id    DEFAULT     o   ALTER TABLE ONLY public.accrediteds ALTER COLUMN id SET DEFAULT nextval('public.accredited_seq_id'::regclass);
 =   ALTER TABLE public.accrediteds ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    201    200            �           2604    51497    acreditedcartamandato id    DEFAULT     �   ALTER TABLE ONLY public.acreditedcartamandato ALTER COLUMN id SET DEFAULT nextval('public.acreditedcartamandato_seq_id'::regclass);
 G   ALTER TABLE public.acreditedcartamandato ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    251    250    251            �           2604    51243    acreditedcontractmutuo id    DEFAULT     �   ALTER TABLE ONLY public.acreditedcontractmutuo ALTER COLUMN id SET DEFAULT nextval('public.accreditedcontractmutuo_seq_id'::regclass);
 H   ALTER TABLE public.acreditedcontractmutuo ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    249    248    249            �           2604    16701    capitaldetails id    DEFAULT     u   ALTER TABLE ONLY public.capitaldetails ALTER COLUMN id SET DEFAULT nextval('public.capitaldetail_seq_id'::regclass);
 @   ALTER TABLE public.capitaldetails ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    205    204            �           2604    16702    capitals id    DEFAULT     i   ALTER TABLE ONLY public.capitals ALTER COLUMN id SET DEFAULT nextval('public.capital_seq_id'::regclass);
 :   ALTER TABLE public.capitals ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    203    202            �           2604    17352    companies id    DEFAULT     j   ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.company_seq_id'::regclass);
 ;   ALTER TABLE public.companies ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    226    227    227            �           2604    16703    configurations id    DEFAULT     u   ALTER TABLE ONLY public.configurations ALTER COLUMN id SET DEFAULT nextval('public.configuration_seq_id'::regclass);
 @   ALTER TABLE public.configurations ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    207    206            �           2604    16704    contacts id    DEFAULT     i   ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contact_seq_id'::regclass);
 :   ALTER TABLE public.contacts ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    209    208            �           2604    34858 
   devices id    DEFAULT     g   ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.device_seq_id'::regclass);
 9   ALTER TABLE public.devices ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    236    237    237            �           2604    16705 
   genders id    DEFAULT     g   ALTER TABLE ONLY public.genders ALTER COLUMN id SET DEFAULT nextval('public.gender_seq_id'::regclass);
 9   ALTER TABLE public.genders ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    211    210            �           2604    19902    institutions id    DEFAULT     q   ALTER TABLE ONLY public.institutions ALTER COLUMN id SET DEFAULT nextval('public.institution_seq_id'::regclass);
 >   ALTER TABLE public.institutions ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    229    228    229            �           2604    16706    investors id    DEFAULT     k   ALTER TABLE ONLY public.investors ALTER COLUMN id SET DEFAULT nextval('public.investor_seq_id'::regclass);
 ;   ALTER TABLE public.investors ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    213    212            �           2604    40344    logerrors id    DEFAULT     k   ALTER TABLE ONLY public.logerrors ALTER COLUMN id SET DEFAULT nextval('public.logerror_seq_id'::regclass);
 ;   ALTER TABLE public.logerrors ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    241    240    241            �           2604    16707    logmovements id    DEFAULT     q   ALTER TABLE ONLY public.logmovements ALTER COLUMN id SET DEFAULT nextval('public.logmovement_seq_id'::regclass);
 >   ALTER TABLE public.logmovements ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    215    214            �           2604    16708 
   modules id    DEFAULT     g   ALTER TABLE ONLY public.modules ALTER COLUMN id SET DEFAULT nextval('public.module_seq_id'::regclass);
 9   ALTER TABLE public.modules ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    217    216            �           2604    35076    notifications id    DEFAULT     s   ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notification_seq_id'::regclass);
 ?   ALTER TABLE public.notifications ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    238    239    239            �           2604    23473    paidadvances id    DEFAULT     q   ALTER TABLE ONLY public.paidadvances ALTER COLUMN id SET DEFAULT nextval('public.paidadvance_seq_id'::regclass);
 >   ALTER TABLE public.paidadvances ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    233    232    233            �           2604    49868    periodcommission id    DEFAULT     t   ALTER TABLE ONLY public.periodcommission ALTER COLUMN id SET DEFAULT nextval('public.commission_seq_id'::regclass);
 B   ALTER TABLE public.periodcommission ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    245    244    245            �           2604    49884    periodcommissiondetail id    DEFAULT     �   ALTER TABLE ONLY public.periodcommissiondetail ALTER COLUMN id SET DEFAULT nextval('public.commissiondetail_seq_id'::regclass);
 H   ALTER TABLE public.periodcommissiondetail ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    246    247    247            �           2604    16709 
   periods id    DEFAULT     g   ALTER TABLE ONLY public.periods ALTER COLUMN id SET DEFAULT nextval('public.period_seq_id'::regclass);
 9   ALTER TABLE public.periods ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    219    218            �           2604    33388    repayment id    DEFAULT     l   ALTER TABLE ONLY public.repayment ALTER COLUMN id SET DEFAULT nextval('public.repayment_seq_id'::regclass);
 ;   ALTER TABLE public.repayment ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    234    235    235            �           2604    20167    speiresponses id    DEFAULT     s   ALTER TABLE ONLY public.speiresponses ALTER COLUMN id SET DEFAULT nextval('public.speiresponse_seq_id'::regclass);
 ?   ALTER TABLE public.speiresponses ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    230    231    231            �           2604    49752    typecontract id    DEFAULT     r   ALTER TABLE ONLY public.typecontract ALTER COLUMN id SET DEFAULT nextval('public.typecontract_seq_id'::regclass);
 >   ALTER TABLE public.typecontract ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    243    242    243            �           2604    16710    usermodules id    DEFAULT     o   ALTER TABLE ONLY public.usermodules ALTER COLUMN id SET DEFAULT nextval('public.usermodule_seq_id'::regclass);
 =   ALTER TABLE public.usermodules ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    223    222            �           2604    16711    users id    DEFAULT     c   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.user_seq_id'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          PrestaQi    false    221    220            �          0    16504    accrediteds 
   TABLE DATA             COPY public.accrediteds (id, first_name, last_name, identify, contract_number, "position", net_monthly_salary, rfc, interest_rate, birth_date, age, gender_id, clabe, account_number, enabled, created_at, updated_at, period_id, moratoruim_interest_rate, company_id, mail, mail_mandate_latter, password, institution_id, deleted_at, seniority_company, first_login, is_blocked, type_contract_id, address, colony, municipality, zip_code, state, end_day_payment, gross_monthly_salary, other_obligations, outsourcing_id) FROM stdin;
    public          PrestaQi    false    200   �)                0    51494    acreditedcartamandato 
   TABLE DATA           i   COPY public.acreditedcartamandato (id, accredited_id, path_contract, created_at, updated_at) FROM stdin;
    public          PrestaQi    false    251   �\                0    51240    acreditedcontractmutuo 
   TABLE DATA           {   COPY public.acreditedcontractmutuo (id, accredited_id, number_contract, path_contract, created_at, updated_at) FROM stdin;
    public          PrestaQi    false    249   Y`                0    155920    advancedetails 
   TABLE DATA           5  COPY public.advancedetails (id, advance_id, amount, date_advance, requested_day, total_withhold, comission, created_at, updated_at, enabled, paid_status, interest, vat, subtotal, limit_date, day_for_payment, initial, final, accredited_id, day_moratorium, interest_moratorium, promotional_setting) FROM stdin;
    public          PrestaQi    false    253   �c      �          0    16786    advances 
   TABLE DATA           "  COPY public.advances (id, accredited_id, amount, date_advance, requested_day, total_withhold, comission, created_at, updated_at, enabled, paid_status, interest, vat, subtotal, interest_moratorium, day_moratorium, limit_date, promotional_setting, day_for_payment, interest_rate) FROM stdin;
    public          PrestaQi    false    225   �c      �          0    16520    capitaldetails 
   TABLE DATA           3  COPY public.capitaldetails (id, period, capital_id, start_date, end_date, outstanding_balance, principal_payment, interest_payment, default_interest, promotional_settings, vat, vat_retention, isr_retention, payment, ispayment, created_at, updated_at, pay_day_limit, promotional_setting, reason) FROM stdin;
    public          PrestaQi    false    204   v�      �          0    16512    capitals 
   TABLE DATA             COPY public.capitals (id, amount, interest_rate, investment_horizon, bussiness_day, period_id, notice_mail, start_date, end_date, default_interest, investor_id, created_by, created_at, updated_at, capital_status, investment_status, file_name, extension_day, file_byte) FROM stdin;
    public          PrestaQi    false    202   ��      �          0    17349 	   companies 
   TABLE DATA           U   COPY public.companies (id, description, enabled, created_at, updated_at) FROM stdin;
    public          PrestaQi    false    227   ��      �          0    16538    configurations 
   TABLE DATA           v   COPY public.configurations (id, configuration_name, configuration_value, enabled, created_at, updated_at) FROM stdin;
    public          PrestaQi    false    206   g�      �          0    16546    contacts 
   TABLE DATA           i   COPY public.contacts (id, contact_name, contact_data, logo, enabled, created_at, updated_at) FROM stdin;
    public          PrestaQi    false    208   ��                0    155945    details_advance 
   TABLE DATA           �   COPY public.details_advance (id, advance_id, principal_payment, total_payment, interest, vat, date_payment, initial_balance, final_balance, days_for_payments, paid_status, accredited_id, created_at, updated_at, promotional_setting) FROM stdin;
    public          PrestaQi    false    254   ��                0    155969    details_by_advance 
   TABLE DATA           h   COPY public.details_by_advance (advance_id, details_id, amount, id, created_at, updated_at) FROM stdin;
    public          PrestaQi    false    255   �      �          0    34855    devices 
   TABLE DATA           e   COPY public.devices (id, device_id, user_id, user_type, enabled, created_at, updated_at) FROM stdin;
    public          PrestaQi    false    237   y�      �          0    16554    genders 
   TABLE DATA           S   COPY public.genders (id, description, enabled, created_at, updated_at) FROM stdin;
    public          PrestaQi    false    210   ��      �          0    19899    institutions 
   TABLE DATA           ^   COPY public.institutions (id, code, description, enabled, created_at, updated_at) FROM stdin;
    public          PrestaQi    false    229   #�      �          0    16559 	   investors 
   TABLE DATA             COPY public.investors (id, first_name, last_name, total_amount_agreed, start_date_prestaqi, limit_date, rfc, clabe, account_number, enabled, created_at, updated_at, is_moral_person, mail, password, institution_id, deleted_at, contract_number, first_login) FROM stdin;
    public          PrestaQi    false    212   5�      �          0    40341 	   logerrors 
   TABLE DATA           �   COPY public.logerrors (id, file_name, class_name, method_name, code_line, message_error, inner_exception_message, created_at, updated_at) FROM stdin;
    public          PrestaQi    false    241   ��      �          0    16567    logmovements 
   TABLE DATA           �   COPY public.logmovements (id, module_id, record_id, action_type, user_id, data_new, data_update, created_at, updated_at) FROM stdin;
    public          PrestaQi    false    214   ��      �          0    16575    modules 
   TABLE DATA           S   COPY public.modules (id, description, enabled, created_at, updated_at) FROM stdin;
    public          PrestaQi    false    216   ��      �          0    35073    notifications 
   TABLE DATA           �   COPY public.notifications (id, user_id, user_type, title, message, is_read, created_at, updated_at, icon, data_text, notificationtype) FROM stdin;
    public          PrestaQi    false    239   ��      �          0    23470    paidadvances 
   TABLE DATA           b   COPY public.paidadvances (id, amount, company_id, is_partial, created_at, updated_at) FROM stdin;
    public          PrestaQi    false    233   x      �          0    49865    periodcommission 
   TABLE DATA           ]   COPY public.periodcommission (id, period_id, type_month, created_at, updated_at) FROM stdin;
    public          PrestaQi    false    245   E      �          0    49881    periodcommissiondetail 
   TABLE DATA           �   COPY public.periodcommissiondetail (id, period_commission_id, day_month, commission, day_payement, interest, date_payment, created_at, updated_at) FROM stdin;
    public          PrestaQi    false    247   �      �          0    16580    periods 
   TABLE DATA           l   COPY public.periods (id, description, enabled, created_at, updated_at, period_value, user_type) FROM stdin;
    public          PrestaQi    false    218   �      �          0    33385 	   repayment 
   TABLE DATA           [   COPY public.repayment (id, code, description, created_at, updated_at, enabled) FROM stdin;
    public          PrestaQi    false    235   |      �          0    20164    speiresponses 
   TABLE DATA           �   COPY public.speiresponses (id, advance_id, tracking_id, tracking_key, created_at, updated_at, state_name, repayment_id) FROM stdin;
    public          PrestaQi    false    231   �      �          0    49749    typecontract 
   TABLE DATA           U   COPY public.typecontract (id, description, code, created_at, updated_at) FROM stdin;
    public          PrestaQi    false    243   g6      �          0    16593    usermodules 
   TABLE DATA           U   COPY public.usermodules (id, module_id, user_id, created_at, updated_at) FROM stdin;
    public          PrestaQi    false    222   �6      �          0    16585    users 
   TABLE DATA           �   COPY public.users (id, first_name, last_name, password, employee_number, mail, phone, enabled, created_at, updated_at, deleted_at, first_login) FROM stdin;
    public          PrestaQi    false    220   b;      (           0    0    accredited_seq_id    SEQUENCE SET     A   SELECT pg_catalog.setval('public.accredited_seq_id', 155, true);
          public          PrestaQi    false    201            )           0    0    accreditedcontractmutuo_seq_id    SEQUENCE SET     M   SELECT pg_catalog.setval('public.accreditedcontractmutuo_seq_id', 77, true);
          public          PrestaQi    false    248            *           0    0    acreditedcartamandato_seq_id    SEQUENCE SET     K   SELECT pg_catalog.setval('public.acreditedcartamandato_seq_id', 57, true);
          public          PrestaQi    false    250            +           0    0    advance_seq_id    SEQUENCE SET     =   SELECT pg_catalog.setval('public.advance_seq_id', 1, false);
          public          PrestaQi    false    224            ,           0    0    advancedetail_seq_id    SEQUENCE SET     C   SELECT pg_catalog.setval('public.advancedetail_seq_id', 1, false);
          public          PrestaQi    false    252            -           0    0    capital_seq_id    SEQUENCE SET     >   SELECT pg_catalog.setval('public.capital_seq_id', 162, true);
          public          PrestaQi    false    203            .           0    0    capitaldetail_seq_id    SEQUENCE SET     D   SELECT pg_catalog.setval('public.capitaldetail_seq_id', 318, true);
          public          PrestaQi    false    205            /           0    0    commission_seq_id    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.commission_seq_id', 8, true);
          public          PrestaQi    false    244            0           0    0    commissiondetail_seq_id    SEQUENCE SET     G   SELECT pg_catalog.setval('public.commissiondetail_seq_id', 236, true);
          public          PrestaQi    false    246            1           0    0    company_seq_id    SEQUENCE SET     =   SELECT pg_catalog.setval('public.company_seq_id', 60, true);
          public          PrestaQi    false    226            2           0    0    configuration_seq_id    SEQUENCE SET     C   SELECT pg_catalog.setval('public.configuration_seq_id', 54, true);
          public          PrestaQi    false    207            3           0    0    contact_seq_id    SEQUENCE SET     <   SELECT pg_catalog.setval('public.contact_seq_id', 3, true);
          public          PrestaQi    false    209            4           0    0    device_seq_id    SEQUENCE SET     =   SELECT pg_catalog.setval('public.device_seq_id', 489, true);
          public          PrestaQi    false    236            5           0    0    gender_seq_id    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.gender_seq_id', 2, true);
          public          PrestaQi    false    211            6           0    0    institution_seq_id    SEQUENCE SET     A   SELECT pg_catalog.setval('public.institution_seq_id', 85, true);
          public          PrestaQi    false    228            7           0    0    investor_seq_id    SEQUENCE SET     >   SELECT pg_catalog.setval('public.investor_seq_id', 51, true);
          public          PrestaQi    false    213            8           0    0    logerror_seq_id    SEQUENCE SET     >   SELECT pg_catalog.setval('public.logerror_seq_id', 1, false);
          public          PrestaQi    false    240            9           0    0    logmovement_seq_id    SEQUENCE SET     A   SELECT pg_catalog.setval('public.logmovement_seq_id', 1, false);
          public          PrestaQi    false    215            :           0    0    module_seq_id    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.module_seq_id', 8, true);
          public          PrestaQi    false    217            ;           0    0    notification_seq_id    SEQUENCE SET     D   SELECT pg_catalog.setval('public.notification_seq_id', 3048, true);
          public          PrestaQi    false    238            <           0    0    paidadvance_seq_id    SEQUENCE SET     A   SELECT pg_catalog.setval('public.paidadvance_seq_id', 56, true);
          public          PrestaQi    false    232            =           0    0    period_seq_id    SEQUENCE SET     <   SELECT pg_catalog.setval('public.period_seq_id', 10, true);
          public          PrestaQi    false    219            >           0    0    repayment_seq_id    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.repayment_seq_id', 18, true);
          public          PrestaQi    false    234            ?           0    0    speiresponse_seq_id    SEQUENCE SET     C   SELECT pg_catalog.setval('public.speiresponse_seq_id', 562, true);
          public          PrestaQi    false    230            @           0    0    typecontract_seq_id    SEQUENCE SET     A   SELECT pg_catalog.setval('public.typecontract_seq_id', 2, true);
          public          PrestaQi    false    242            A           0    0    user_seq_id    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_seq_id', 71, true);
          public          PrestaQi    false    221            B           0    0    usermodule_seq_id    SEQUENCE SET     A   SELECT pg_catalog.setval('public.usermodule_seq_id', 852, true);
          public          PrestaQi    false    223            �           2606    16611    accrediteds accrediteds_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.accrediteds
    ADD CONSTRAINT accrediteds_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.accrediteds DROP CONSTRAINT accrediteds_pkey;
       public            PrestaQi    false    200            2           2606    51499 0   acreditedcartamandato acreditedcartamandato_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.acreditedcartamandato
    ADD CONSTRAINT acreditedcartamandato_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.acreditedcartamandato DROP CONSTRAINT acreditedcartamandato_pkey;
       public            PrestaQi    false    251            0           2606    51245 2   acreditedcontractmutuo acreditedcontractmutuo_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.acreditedcontractmutuo
    ADD CONSTRAINT acreditedcontractmutuo_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.acreditedcontractmutuo DROP CONSTRAINT acreditedcontractmutuo_pkey;
       public            PrestaQi    false    249                       2606    16794    advances advances_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.advances
    ADD CONSTRAINT advances_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.advances DROP CONSTRAINT advances_pkey;
       public            PrestaQi    false    225                       2606    16613 "   capitaldetails capitaldetails_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.capitaldetails
    ADD CONSTRAINT capitaldetails_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.capitaldetails DROP CONSTRAINT capitaldetails_pkey;
       public            PrestaQi    false    204                       2606    16615    capitals capitals_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.capitals
    ADD CONSTRAINT capitals_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.capitals DROP CONSTRAINT capitals_pkey;
       public            PrestaQi    false    202                       2606    17355    companies companies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_pkey;
       public            PrestaQi    false    227                       2606    16617 "   configurations configurations_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.configurations
    ADD CONSTRAINT configurations_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.configurations DROP CONSTRAINT configurations_pkey;
       public            PrestaQi    false    206                       2606    16619    contacts contacts_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.contacts DROP CONSTRAINT contacts_pkey;
       public            PrestaQi    false    208            4           2606    155953 $   details_advance details_advance_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.details_advance
    ADD CONSTRAINT details_advance_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.details_advance DROP CONSTRAINT details_advance_pkey;
       public            PrestaQi    false    254            $           2606    34863    devices devices_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.devices DROP CONSTRAINT devices_pkey;
       public            PrestaQi    false    237            
           2606    16621    genders genders_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.genders
    ADD CONSTRAINT genders_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.genders DROP CONSTRAINT genders_pkey;
       public            PrestaQi    false    210                       2606    19905    institutions institutions_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.institutions
    ADD CONSTRAINT institutions_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.institutions DROP CONSTRAINT institutions_pkey;
       public            PrestaQi    false    229                       2606    16623    investors investors_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.investors
    ADD CONSTRAINT investors_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.investors DROP CONSTRAINT investors_pkey;
       public            PrestaQi    false    212            (           2606    40349    logerrors logerrors_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.logerrors
    ADD CONSTRAINT logerrors_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.logerrors DROP CONSTRAINT logerrors_pkey;
       public            PrestaQi    false    241                       2606    16625    logmovements logmovements_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.logmovements
    ADD CONSTRAINT logmovements_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.logmovements DROP CONSTRAINT logmovements_pkey;
       public            PrestaQi    false    214                       2606    16627    modules modules_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.modules DROP CONSTRAINT modules_pkey;
       public            PrestaQi    false    216            &           2606    35078     notifications notifications_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
       public            PrestaQi    false    239                        2606    23478    paidadvances paidadvances_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.paidadvances
    ADD CONSTRAINT paidadvances_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.paidadvances DROP CONSTRAINT paidadvances_pkey;
       public            PrestaQi    false    233            ,           2606    49870 &   periodcommission periodcommission_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.periodcommission
    ADD CONSTRAINT periodcommission_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.periodcommission DROP CONSTRAINT periodcommission_pkey;
       public            PrestaQi    false    245            .           2606    49889 2   periodcommissiondetail periodcommissiondetail_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.periodcommissiondetail
    ADD CONSTRAINT periodcommissiondetail_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.periodcommissiondetail DROP CONSTRAINT periodcommissiondetail_pkey;
       public            PrestaQi    false    247                       2606    16629    periods periods_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.periods
    ADD CONSTRAINT periods_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.periods DROP CONSTRAINT periods_pkey;
       public            PrestaQi    false    218            :           2606    155974    details_by_advance pk 
   CONSTRAINT     S   ALTER TABLE ONLY public.details_by_advance
    ADD CONSTRAINT pk PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.details_by_advance DROP CONSTRAINT pk;
       public            PrestaQi    false    255            "           2606    33390    repayment repayment_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.repayment
    ADD CONSTRAINT repayment_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.repayment DROP CONSTRAINT repayment_pkey;
       public            PrestaQi    false    235                       2606    20169     speiresponses speiresponses_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.speiresponses
    ADD CONSTRAINT speiresponses_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.speiresponses DROP CONSTRAINT speiresponses_pkey;
       public            PrestaQi    false    231            *           2606    49754    typecontract typecontract_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.typecontract
    ADD CONSTRAINT typecontract_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.typecontract DROP CONSTRAINT typecontract_pkey;
       public            PrestaQi    false    243                       2606    16631    usermodules usermodules_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usermodules
    ADD CONSTRAINT usermodules_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.usermodules DROP CONSTRAINT usermodules_pkey;
       public            PrestaQi    false    222                       2606    16633    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            PrestaQi    false    220            5           1259    155964    fki_accredited_id_fk    INDEX     Y   CREATE INDEX fki_accredited_id_fk ON public.details_advance USING btree (accredited_id);
 (   DROP INDEX public.fki_accredited_id_fk;
       public            PrestaQi    false    254                        1259    49769 %   fki_accrediteds_type_contract_id_fkey    INDEX     i   CREATE INDEX fki_accrediteds_type_contract_id_fkey ON public.accrediteds USING btree (type_contract_id);
 9   DROP INDEX public.fki_accrediteds_type_contract_id_fkey;
       public            PrestaQi    false    200            7           1259    155985    fki_advance_fk    INDEX     S   CREATE INDEX fki_advance_fk ON public.details_by_advance USING btree (advance_id);
 "   DROP INDEX public.fki_advance_fk;
       public            PrestaQi    false    255            6           1259    155965    fki_advance_id_foreign    INDEX     X   CREATE INDEX fki_advance_id_foreign ON public.details_advance USING btree (advance_id);
 *   DROP INDEX public.fki_advance_id_foreign;
       public            PrestaQi    false    254            8           1259    155986    fki_details_fk    INDEX     S   CREATE INDEX fki_details_fk ON public.details_by_advance USING btree (details_id);
 "   DROP INDEX public.fki_details_fk;
       public            PrestaQi    false    255            Q           2606    155954     details_advance accredited_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.details_advance
    ADD CONSTRAINT accredited_id_fk FOREIGN KEY (accredited_id) REFERENCES public.accrediteds(id);
 J   ALTER TABLE ONLY public.details_advance DROP CONSTRAINT accredited_id_fk;
       public          PrestaQi    false    254    200    4351            =           2606    17359 '   accrediteds accrediteds_company_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accrediteds
    ADD CONSTRAINT accrediteds_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id);
 Q   ALTER TABLE ONLY public.accrediteds DROP CONSTRAINT accrediteds_company_id_fkey;
       public          PrestaQi    false    4378    200    227            ;           2606    16634 &   accrediteds accrediteds_gender_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accrediteds
    ADD CONSTRAINT accrediteds_gender_id_fkey FOREIGN KEY (gender_id) REFERENCES public.genders(id);
 P   ALTER TABLE ONLY public.accrediteds DROP CONSTRAINT accrediteds_gender_id_fkey;
       public          PrestaQi    false    200    4362    210            >           2606    19980 +   accrediteds accrediteds_institution_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accrediteds
    ADD CONSTRAINT accrediteds_institution_id_fkey FOREIGN KEY (institution_id) REFERENCES public.institutions(id);
 U   ALTER TABLE ONLY public.accrediteds DROP CONSTRAINT accrediteds_institution_id_fkey;
       public          PrestaQi    false    229    200    4380            <           2606    16639 &   accrediteds accrediteds_period_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accrediteds
    ADD CONSTRAINT accrediteds_period_id_fkey FOREIGN KEY (period_id) REFERENCES public.periods(id);
 P   ALTER TABLE ONLY public.accrediteds DROP CONSTRAINT accrediteds_period_id_fkey;
       public          PrestaQi    false    4370    200    218            ?           2606    49764 -   accrediteds accrediteds_type_contract_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accrediteds
    ADD CONSTRAINT accrediteds_type_contract_id_fkey FOREIGN KEY (type_contract_id) REFERENCES public.typecontract(id) NOT VALID;
 W   ALTER TABLE ONLY public.accrediteds DROP CONSTRAINT accrediteds_type_contract_id_fkey;
       public          PrestaQi    false    243    200    4394            P           2606    51500 >   acreditedcartamandato acreditedcartamandato_accredited_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.acreditedcartamandato
    ADD CONSTRAINT acreditedcartamandato_accredited_id_fkey FOREIGN KEY (accredited_id) REFERENCES public.accrediteds(id);
 h   ALTER TABLE ONLY public.acreditedcartamandato DROP CONSTRAINT acreditedcartamandato_accredited_id_fkey;
       public          PrestaQi    false    4351    200    251            O           2606    51246 @   acreditedcontractmutuo acreditedcontractmutuo_accredited_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.acreditedcontractmutuo
    ADD CONSTRAINT acreditedcontractmutuo_accredited_id_fkey FOREIGN KEY (accredited_id) REFERENCES public.accrediteds(id);
 j   ALTER TABLE ONLY public.acreditedcontractmutuo DROP CONSTRAINT acreditedcontractmutuo_accredited_id_fkey;
       public          PrestaQi    false    4351    249    200            S           2606    155975    details_by_advance advance_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.details_by_advance
    ADD CONSTRAINT advance_fk FOREIGN KEY (advance_id) REFERENCES public.advances(id);
 G   ALTER TABLE ONLY public.details_by_advance DROP CONSTRAINT advance_fk;
       public          PrestaQi    false    225    255    4376            R           2606    155959 "   details_advance advance_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.details_advance
    ADD CONSTRAINT advance_id_foreign FOREIGN KEY (advance_id) REFERENCES public.advances(id);
 L   ALTER TABLE ONLY public.details_advance DROP CONSTRAINT advance_id_foreign;
       public          PrestaQi    false    4376    225    254            I           2606    16795 $   advances advances_accredited_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.advances
    ADD CONSTRAINT advances_accredited_id_fkey FOREIGN KEY (accredited_id) REFERENCES public.accrediteds(id);
 N   ALTER TABLE ONLY public.advances DROP CONSTRAINT advances_accredited_id_fkey;
       public          PrestaQi    false    4351    200    225            C           2606    16644 -   capitaldetails capitaldetails_capital_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.capitaldetails
    ADD CONSTRAINT capitaldetails_capital_id_fkey FOREIGN KEY (capital_id) REFERENCES public.capitals(id);
 W   ALTER TABLE ONLY public.capitaldetails DROP CONSTRAINT capitaldetails_capital_id_fkey;
       public          PrestaQi    false    202    204    4354            @           2606    16649 !   capitals capitals_created_by_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.capitals
    ADD CONSTRAINT capitals_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);
 K   ALTER TABLE ONLY public.capitals DROP CONSTRAINT capitals_created_by_fkey;
       public          PrestaQi    false    220    4372    202            A           2606    16654 "   capitals capitals_investor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.capitals
    ADD CONSTRAINT capitals_investor_id_fkey FOREIGN KEY (investor_id) REFERENCES public.investors(id);
 L   ALTER TABLE ONLY public.capitals DROP CONSTRAINT capitals_investor_id_fkey;
       public          PrestaQi    false    4364    212    202            B           2606    16659     capitals capitals_period_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.capitals
    ADD CONSTRAINT capitals_period_id_fkey FOREIGN KEY (period_id) REFERENCES public.periods(id);
 J   ALTER TABLE ONLY public.capitals DROP CONSTRAINT capitals_period_id_fkey;
       public          PrestaQi    false    202    218    4370            T           2606    155980    details_by_advance details_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.details_by_advance
    ADD CONSTRAINT details_fk FOREIGN KEY (details_id) REFERENCES public.details_advance(id);
 G   ALTER TABLE ONLY public.details_by_advance DROP CONSTRAINT details_fk;
       public          PrestaQi    false    255    4404    254            D           2606    19975 '   investors investors_institution_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.investors
    ADD CONSTRAINT investors_institution_id_fkey FOREIGN KEY (institution_id) REFERENCES public.institutions(id);
 Q   ALTER TABLE ONLY public.investors DROP CONSTRAINT investors_institution_id_fkey;
       public          PrestaQi    false    4380    229    212            E           2606    16664 (   logmovements logmovements_module_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.logmovements
    ADD CONSTRAINT logmovements_module_id_fkey FOREIGN KEY (module_id) REFERENCES public.modules(id);
 R   ALTER TABLE ONLY public.logmovements DROP CONSTRAINT logmovements_module_id_fkey;
       public          PrestaQi    false    214    4368    216            F           2606    16669 &   logmovements logmovements_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.logmovements
    ADD CONSTRAINT logmovements_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 P   ALTER TABLE ONLY public.logmovements DROP CONSTRAINT logmovements_user_id_fkey;
       public          PrestaQi    false    214    220    4372            L           2606    23479 )   paidadvances paidadvances_company_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.paidadvances
    ADD CONSTRAINT paidadvances_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id);
 S   ALTER TABLE ONLY public.paidadvances DROP CONSTRAINT paidadvances_company_id_fkey;
       public          PrestaQi    false    233    4378    227            M           2606    49871 0   periodcommission periodcommission_period_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.periodcommission
    ADD CONSTRAINT periodcommission_period_id_fkey FOREIGN KEY (period_id) REFERENCES public.periods(id);
 Z   ALTER TABLE ONLY public.periodcommission DROP CONSTRAINT periodcommission_period_id_fkey;
       public          PrestaQi    false    245    4370    218            N           2606    49890 G   periodcommissiondetail periodcommissiondetail_period_commission_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.periodcommissiondetail
    ADD CONSTRAINT periodcommissiondetail_period_commission_id_fkey FOREIGN KEY (period_commission_id) REFERENCES public.periodcommission(id);
 q   ALTER TABLE ONLY public.periodcommissiondetail DROP CONSTRAINT periodcommissiondetail_period_commission_id_fkey;
       public          PrestaQi    false    247    4396    245            J           2606    20170 +   speiresponses speiresponses_advance_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.speiresponses
    ADD CONSTRAINT speiresponses_advance_id_fkey FOREIGN KEY (advance_id) REFERENCES public.advances(id);
 U   ALTER TABLE ONLY public.speiresponses DROP CONSTRAINT speiresponses_advance_id_fkey;
       public          PrestaQi    false    4376    225    231            K           2606    33430 -   speiresponses speiresponses_repayment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.speiresponses
    ADD CONSTRAINT speiresponses_repayment_id_fkey FOREIGN KEY (repayment_id) REFERENCES public.repayment(id);
 W   ALTER TABLE ONLY public.speiresponses DROP CONSTRAINT speiresponses_repayment_id_fkey;
       public          PrestaQi    false    231    4386    235            G           2606    16674 &   usermodules usermodules_module_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usermodules
    ADD CONSTRAINT usermodules_module_id_fkey FOREIGN KEY (module_id) REFERENCES public.modules(id);
 P   ALTER TABLE ONLY public.usermodules DROP CONSTRAINT usermodules_module_id_fkey;
       public          PrestaQi    false    216    4368    222            H           2606    16679 $   usermodules usermodules_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usermodules
    ADD CONSTRAINT usermodules_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 N   ALTER TABLE ONLY public.usermodules DROP CONSTRAINT usermodules_user_id_fkey;
       public          PrestaQi    false    220    222    4372            �      x��]�rG�}���?`D�UY��CB%�PET��/��mzZ�lH��ɻdVA��ܞ��V4�Xj˻�{�M)����~�/���ٯ���O�7�W��zs�����S?{��z�|��?N��'��7��M9�ſ*}��}�/�/7�u��/p����J���Yf~~�Ͻ����E�?�+8Y�)z"&
N>>��������?ÿK����e�5|>Y��[�@��5|1`�p�~.!�}/����|?(��tGFI5U�*��&FLnv��f���g3��e�k��[_{�;�|x(���q��Sy��)��u?���_-|'x5'����D݉��rѴ�l��z��kj��>���_���u�{8L�+'k8�5�FX����r����?Y���~X��P?�C|������Z��C]m���-�7����A$�-g����2�S8�5�P\�M�v����G]µ���+x]��[߁��	��,~��Ѧe��,�+�{�:��
��^�������<� .d��R_�N�|��)<-�g~V�� ��$��a~P�V|����<��
��	~@:0�x�z|n2?ّRS4.����g��/�a�>����=�<��p���� ��&�����<M��,��m;m2�Uu+e�U'�Z��n�Dz�u�L�I��5?��$�
�'���F�(.��Fa킆���K�-���g8N���~by����x�R>��eA�|��3ܗ��G��u^�/ii�fq������)��S���I.�$�����%��k�eT�_��z&�u�L&�����C��c��^�s��h��p���Q���,�?�̇�8�q��]�Z�g�,g+?_�9f�w��a!�y���U���+z��h�=��DY_�����e�b���J�`�����}+)�p��#+��(��P��6X�<J�^�#u�ڃd����,|_�N��T��.����W&�m�\������H�z�
<����_p����l�߃\����)��[��rK�0Gi��--p�>-�^��������#� ���<@���Pp��7a� fpC�@#�>2v�"S�ئrZd���e��6��l�*+dmU����Bg9��s1��P�4����]F��;�:>i�W�r><,�!���{Y	�Cn�0��Qγ���!�1F�`ە�T�q�
���t	!��r7P�?���;g~��낣������w��M>�=X�	z��b{�a�a�<CÓp�+?�˒,j8	��]��-�'��1�m� �����z���/�m>(��N�]G�Mun��z���`6[�ːz��W�����o��(f��]X�;-���.k\߫ �mx�����H�G��Q�J�?�ZN=��Y���Oêv|�sz��'H��kI�8�4�_�#��+�gۮ��y�����Z�E��<=K��cAA�u����.J��X������P���ߟ$k�I�g9�~L�T�R�lKMe.BV��"=����x��ʊc���dt��Bkd�B�.I���ڒ�N��mta���EUם�:a�^��9݅g��Ĩ`��3�2G^�����՞�v�I4)��(����l\Ȱ����&P�6�o�8Y���GD"92cw��$zY�c̸�y���wp�p���	�W�����^�I>������/�ا���(ݘ�]{z*���rL�(�+Y~=eO�t�g��j9J�p�^-xM�Y�g�mLaS��W]�:ce'��D���G.�Lgս�-^��\�P���:\wL��<��	1������ҿ�<��-��[����?�*��>z�hx�^/K�M��� ��5x'��D/������m��
�Q�5;�G����pGQ�7cǬ�#0�!�D:��)�,�(D�<�6`�s�F�\|�C"��O��ϖ�յ�E[5�����2M��lpT�C�o�!ۊ-�+�g���Nh�)a��u��3�� ����X9�+�h�n~�8�����\����iE�V����s��b�F�\����� �8����8��k�E�� w�f�,�5z�#���%��gZ@N�4�:�:�y3<@��n�m^��|�^��[[�5uѴ�ͤ�^۪ͺ�>7܃�{d} ^B�6Z��}���
�J��-����^�p��H�1��p:d�Wb�w�aP�Iބu�#í_['`''��ҳ� >�X��+6@�o"��o�cR6�������
~�`�A�.����b�(��K4�+�!L(�mF u8`�W���ϡl��CvȪ�gX���t���hᗨ��X������A WP��H��1������A�ք䪡���3��p% ��{R�G ��r����B�N���z�C�`�ʭ�8ݞ�rrV�jLQc���@(o�	��u�k���Ȝ^�VS������k�'4��p����8=J �~.�[�:��Q���򄪄S#dz�B-8�g������{A�0[���de��o��	*��B���S!
���G:�j����Ш��.`�9ƴ� G�c�
�_9�\��k�:�yۻܴ����VY��}��2kz���LH_�(1�||1�� � -��
���`1�:Y�m��rM6m$>���ʟ������&.�F2�u�Q-�=��C+r��o'5�1��.��%���>��)Dv�4�1;yǯ�Ҿ��bï>��:�`g,@���YK�d�f~s�b�'�A�[���1�R���
��l;Y����6sy����1EnBM-���ݱ�X��Ȑ]��ؼ�*s��!���D;��A�.Y��&�s�8]����Q`��F�@p��!Q[��C�;\��m�v�jg���Š3�����g�q��aƕ�+x8�~�������pNeK2��i��§���=�;��ٕ�Y�Z:�Wr~�a��I�&�%�P`u�w*#ȴ_�6H2�[a���C�T>�VGZO]V�,K�Qq
V�ڽ�{�oX��/T>PTܶ�}�J���VK��B9��\u]WeAeۮ5�'��^k�~` ���4v?1��� ��-߂a<���'��:�E����4�O�2�7�-�~k��16�qJٲ������2��zϰ!�2A|��T�!%�<uɝͦY�MW �k�KT��Q�e<�?�:���jC��!pд���ґF��<����L�0�O�8.� ��-�{��8,�����2K�I�"���������Y�ڡ�����dzЎ5c븠PcZ��{=j����gk�RM&�Zg"�̶�4�н,�<(����D�����t��f�n�p}��}[	C�X�($��33���̕�+�~J����[Ƶu�Buʹl�to�MS�q��,QύV�T�IR��Z�4�;R��!ҟ�2�O���_&�!l�V��2֩O!�9� o���=��k6����X��O`�E@yH�#�)��La`�w��9����7�%�
fp�����d���8qU��Q� �8g[����臡`:~�aQI��C�"�yP�̎L�n��� �\6��Ӓ��!ʤ�JX�^Y��ӥ���q��;+S,1�@y��+^/d$�������}��#����H���?��b��f��H��D���ʫ��$��<=o�j� �8��u�� 1�`��ܣ/�}��҉��6%�!+x	�b�W���-@����
�\3���43�o�!���k=�<����Q�I3.����qV��M2�R���>&������r�y��t!2M�h�e�hLpʴ��Ymt�(��/�[.�yNT_a� ��<�a��m��G��2�Qt�����]'����h�Y��� =���@��BOu
�22���8�&Mʓ��DxƁ�	�D�T�@�c�hѦ~d�%��C���t�^��2<F�U|=�ĒY�aˈ�q�dzM���(G�;�L�u�`0�by���;e���Vd��bMn0��ש��F�9�G�};�{?[��*������>�{k*��:��.�PY��O��D��j���5�t�^����    �H��J	FZ�C;R�+f�Ī�dQ�'��O
�vjS|��#��A�|�0?+��bn��� + ���1ǟA��S~/ܑ�GJN�ͥ,�b8���)g�?5 �[<�*�Q�떊����$R��q��-dTt����@�.���C�����G.���\Q�b�ЃW&M-b^.�-��׃1�o$�[��#H[��P�=��3���r�Z�����?NL�9E(k���|"<7<!���$G��ُ��D�!>ʂ�O���/f��i��H�i�a'��G�i95AlD4�f���%K�6�%P��xۡ���ױ�!���r��mEc�>�t��Ϻ��m��&\����M�G*�.Z��bD̐ZE��;a��P�/j��%��V�ڡ�<�����~{'A�~�I�
R�c���Vo��٥clxH�$Z�M(il�)v�� �C�C�.!E冬4U�A�(Q��-%��d�q�������r��H��!A�<�WG7Cu����G2�`�-�+{!��Gp7<�[��"�6�,t�H^�d��`Z@,��!YN�J��܌�oz ���@D
Jf����m��'o��Q������*BbYe�n��Lש�	����anem�eH�^���� ��O��Ʈ�%�.J�F%�qC�2�A7�L$Fh+O<�Hf�\���{����^3�r��!i�#ibi/Xڑ�G��FN�/l����ݡ�p��U<A�K7�BC4�c�il@j��������H}c,����0�g���:�0f���|��/<��+�ҀOX=͍4��y~Ȁ��{� �і����n	_�*b�孮�Z4�	QM�Xi���7������f����!~O�=�8������H� �A�O��WH���}|,�?Xd5�����!�J��(9(�[�)���}�WB�ޘ�\<}0gD���Le��]a�V�+�(s�����[�]Ǌ��~��	������B�?q����CO�Fđv�"wZ�jB�D+�x9�%�mt�Dg��ֹk3StU��j��	����H�5w/מ�x�����S�$����Vh�-&��+�,oR��(�g���\�QY3<qd�ɼ(IR�XR��9'�����K�N���Y,c��Ճ&��&{>�~��$V����5ÉN*rE�(��F({QB���$���#�Ҽ�k��	_�4���ɈN�!z�	N̑̃4+�&9
s=L؋�p�U��o ?�P�����'oW�&;��p��cS�m�a���LSՕ�s�Ԧΰ�UV�mnj�JA�P_Bu�V��jM��Kt�s+�����|1����E�����������Y��]!� [l\d,��A��r
�ƈ!z�+��[¢�}��]�ɿ�({�@H��}i�Gnc<~���&�ZLS���BhD��^���t��\FX0�g���s��1z���T��*�g�WC
2��J��U
�c�*w[��<
�t>ͅ�.��kn�,^3��wO��x ��p���@;D�̊�X���v���^Ym܈߲U�y�����`l���y˽XP���%��7JMX�՚l$�ʱg�j�,8�(b%%���"���	��3��v;�]�y��.7X�ܦ`$�����9�Q��n���%�.ѰC]�c`5c�ʌ{)k��A	�*�C��>�):�ܖ@_<�(��;؋�Z�C/^]О�i��
�9,�Q'�`���=`d� 9��?r?��`��/�!ʿ���HE���Mm��j���٤=7��NUKN�[��{�}���h��MVi�I��Եr����Z�}皡��.�r��$��L8Ȓ	j�'E���FMi#>: .4������PkY�Ah]�r�,�T�秇}�XU������Am�-F=Y/W��K(?Q�*ɕ�X�G���W���;�T������z�@��ےb�A��In��ѠC��#��@�=Iɞ�si
�==��+#f�Qܑ	�j6��d�`�۱���S�3�4��Q.7�||�\�+7}]M蕨]�uW�Z���mz�{��r��-�u*�b�8t��p��)�81��7%)�����q~�r�+��"��9���π"ݸ�"�D�o����x	�='�3҂�s�c��3$��*�
�B� �@�/��5���6�צ��%������m:~�q $���0�]�`̵ ��S�t.R�[X��x����Ò��䴩m���6�ʂ�vy߫JH�3!����TLDY�3e6C��9��U�����~N��Ȼ��b�����f΀�PX��r�p��jRW����w�N��bVX1*G0W�M�r�:�D�Vw�T7��o����H���13+.:�>�R��Xh�T�uC���̆���nO3��8�r�|���e�$"�����P��&������Z۵2x�QJ�@	 ���"	�%-9���0��6��'��(��Df?�<9�б��-���"~b�r�Y�p�`O�wB�+Jy#�f,}A60�sB�N���q`��~��(W��ȁd
˷�r���e�R�DY�c9ac1��둊|�֨�"��rNu���䑲.�h��"PE�`���<�L���kFѱrHÀޏ-%���lȚ����d�l@��F���M�Aӓ��E��E#�؉�o�d��d�`���Q�)�S����)}��J�*Ym(�XxB1QK��Wr�(_q|�?�HbG������C?
���NT�%��2�K��O"W���W��tI�E�,��"#������#*�LK�9�z�k92{��ۏC�R�P"�R�uðPT�x_�6�����r'%)C���0��5��B��Q!��yJ+ǳ��� �(T��BW.�C�Y孮[SH���,��.*Ap1��Rr*{J�X{�����v!`��8ϑʱ�d9�����Y����
�l8S������=1��bĄ���S>�J�v��\�U���g�A�_�1Ccg��i[2�	�g�����&���Jt>�D�0�� ^��DoL�_���8���p�@���e8���#�QRa`[�0��H�k	|`a�`���r/��
xOfG&�*犜VM*�1� �/�<KOU,}�.mf��=Fq'$��GE�E�o�u�쪾7��"$��
W��hr��e�DE���J\��C�P��O,Tv(3�P���_�G"�B>�H�.����n�p�A4�(&��{)�.}j��\��5Ճe&�������$�.�2/�F_ަ����:���C�|V1���+�	Eú�$s46�'J��L{�3(:fϐi��4�l�l" ����@Φy|^r2
8nZָ!�*g�Ŵ�p7�� ��x�������$Hx���jW���չ	����W��h.�D�J~b�0�)�GW�z�.���1���)HDYO��x�|6�IPD�oJUa�_��ތc�+��;<	�'!��g�`(Z��~�XԀ+��+D`8d΢������dó���	�1>�w��A�sq�CܶHf�g_q�NշHf���&N�{r�;I��h�4�[ꈐ\.Z+����&4y�
)e�	%c�+�e}-�Z6�h)BlVX#�*)�.��E��5�|�� 掃;9L���Qhr�<�K�;4�6[�K*� Kj6��$�S����O6�'kV��I�b_U���o� H=L�?�a��*�������)�wܺǚob�d�_��G
��EWSca���d�[��T�C[�E�*�e.m��]ݴ�������&	�j�S47�9ǣQ�K.�Ď��`@G�=��E<����=��C�~��&��@N�^�X������!FZr��^��0�rR������n+$��\�s���}�5�W�4�S�>��b�~�0��N�Tb�A0��V�!J
t�A��{9�k�xx\���K���+]I1�I�ٔPC�"��Snu�J�ʊN�]�2ۄXWk�8\�	�4����a�ݧ�������\qڇf�=�M�,N� �'r�eɬ�r��������1�ˁ�aB?�P�6�o|׮$�3���;r@�,8I����|}�:���	[�
F_�������r��|?cy    � �O.x��y���1UnTǐPT��{���Py�gpK-����_>�oplvx�٩�
%�I;7�#C�&B&r������N���U6���m���낓��v~�o>�|A�|�q�`եq�mǬ6�>���W��m�Z�h2����}����̉Z�z�1gJ'	t�EI"!���@]�%��et2V3�dk烈o�Ɏ�S��܄:8��̧^ɡۧ8�;fw�l�f�A�0��D>͵�F'Ӡ��v�4��=�3�q��r0}�u��*e:��mEV���嶳�Ld���.�G�Q�b���2���D���y Ȧ��������:]�TD �<Kv��D>΂ZE�|Bn��1�����zc�r��9D�h��.� ǩ'|Ķ=�ֆ�0���-6���U���3�3]�v�219�(��SJfr<��D�sȈ|������O_�)	)�(�ΌZ�WE�՚ڲFL�oؚn�,��^�Z��JY�VՅj��{�=)�*��^\�tןz*�\��I�:�4ƵIfq�}�n6����G;��k�f����qS�9wݬI��e%�K��t�q�vt4�w��}�I��l�d����Ӎ���D�EtA�X�6��+0#�8��܋���͈kL�E�$�8��7�z�MαL{@b�gM�!"��I���D�@*�D9-_�;�%�`�3�	olGI������I7�R��a�f�<��Bj�&�B�.Y����t��Q%[����2���_Axƻ��=���,��AS+(1���.˄2��L㬑vh����Ն�vN��"A,�;�(猂1�%��G�����]lX���錽,G��x�=���ðY�Q��
m��jMP;Y�_q�F��f�xGnoq����J|��1�"��5���C�
#LZ�wX�-�o��Z���|���RMX���XU�v�fo�ނ+0˭����{�l�ҏ��IL1QLeas9�x"ǡ#�0�]�7D�CR�����#p�s�$oT]��!���FU]!B@Y�Z�F�R��\</Y��	\�rM��间iJ���')Y'��g'̰�)U>y"�e��y)j��ϙs_�`g�=f`~ߤ����+��f<5!���PC�υY�6Ȼ�9Iz����4x$-��i�0g�~1V���e� �3 ���|)�E#��F��a/���6���"oFs��6�.�o���P�H��׬�/��a&�h���������Û)>K�LUսE��F�EL��z]��}�%���H�.�b�b��DT�吥,h�GlI%�j�Ƅ�4U.n�$��ޟŝhn2��)G�y��D����b�X���W���$�<w���=��X�u�e|�4��A�pA6�`��9i��n1�s��21��08r�,#ޫ�m�r	��->�Y7��X]p������/�`K e�,�\�|�P�3Є\�/0�f��<�����c��<��}8���e���J�5���A/tml��
v�k�· m�E�9w����!4���s� r2���PX�	!�E)ƉEv{�*���L'�v��O�c[�\"*��M߶JD$��;n�X�	�u�Έ�/��?kb�sQ�q�d��Bc����4'�����S�w܉iœ�_x�KA^a%l�R�Z% +:P��Qc�7�O8u������E��M�l�h�Wt�ٺ3JwR4I�� C���[f^5�iA��`��y\R�ԇ�ߧ�/����3ǟ$�R*�M1:��x��"��C�~�2r\��yr(Q�ּ9i�[}���1�O��'m'��]@���Y���G�H
�%����8����#�H��b�B8�>��9$Ϫ���Ch�
k�>sM��y-E���3�r û:�棣��G��3&��m��z�B����d1T��;��;�["������j������Sh�S|��7o,��Ӧ��6P5�`Jzh��o8s�(�����96c%M.8?,
h0͍*� ���8��%I�ܔ�)ߪl.���BB�v]���Ķ!++µ��eU�IͶa�*��6���E7�1�� 	�5�N,ϜpW>bd��6)6zB|��/g���bt�j�9�*������_�"�=�U�#��<3ֈ%4��-{�iG$��M1��Xg�̫T_�G����T"�`��#�`�D��1����ԤN�K��&]�'tj��ލ?�r���!M�¨��
��m�k����^�NwE?�l�m؆�p�_{��V+4����)�=S?��D,�d5�_��u�d��R7M�����8�|D_U\�M���(0<���e�D���d����!����3�Id�c[A�l�?���X���u��q���G4�c���Z�Hg� ��	��0���̴�&��#��:��N�eJ��R*�>`�LZ�f������1��v`Cܦ�b�����U��y�ʶ�m]}�#r�֢�]s�JpV�@��Z�u��xD�.eW%3r)ut�������8bh1�N�/�$�(2��;�m��ǑPl�I�^���fS�l�C�u��$���C�/8�%��Bp�R��6"��i�Ƽ�G�A��܋a���N~�,�D�!�T6-��i�%��6~�;c�s��0~�iM��2[�T%B�_�^>�����@��s����a�|�@��` ���M�-zh[j�9iI��b+�0V��?��7lG�E�T�llC�������ѩ����s�d!F���vR �H��D[@���<2u������2i�'��$h���5RN��J��؄���(iJ��'1�Y���##>�G�\�dy�LHhMa�u5~x�a�� �x$�׻;Q?{��9�#ѻN���yc��iu+�kd''�����b��=K�J��%٫C<��t�����>0{v�K4�QI)e�F��?Mm{��FJ��0�(�JG��\b�g	Z�	�=�Z��Kt��`v����T���
�<d()a8�����l��GBN�����L��3@�K� ��o��m�2��]������e�5�Ԫ�}cĽn��������8�1����>�j<�����V�d
�)�C�+�95�ր�'�Jim��B64��7��8�4���|�2A#tK�*��$�!܄k�q��2��X$Bq�Hfx����08"�p���� �b������z�����_��ݮm��NE�mr���:R�T��94���^W>��p@=c�O�o�׃!ȳ��U�V���4J�J�ª���v}����Q�6�$��� ������m�����.>�u����8�����2����-u��������h_�����٧��?��0��85�^�1��ku-�"���.ɴ�t�����0#�)3�O)���Kj���Oi(��FG�r�&=�l1�/��&MH8DNM����}jU.�`Ǒ|�\~C��(����t�[�È���s�
a;m
��`�����U�;5�b�+��	yAL2�1���<�q�+��ʄj$��z"��x54
|�����lУPc~��f��z�,�5��V��(:��Ȯ�&C1/'r�cv�n��!��q~��#�p?�A
��M��F�[>����3~�Ie͸aa�[�=-m���Un��3�l¶�T��#i���F����i�)�%?n��LX�<s}�DeڮѕΫB�`_3�l��b�mo��18���$��1�ۤ������ԕ���p�⹈�-��*i��EH�r$��Aċ}������/�#���³D��fo;�#9c`7�ĶF1Pp�m���KS�_�#��_Ǒ<E�`TS15y���?�H2Uhi�B�����L2�Ne����B��1Q��:�'��-i��{��;%^�n]�Ae�{�#=2��{�����ă�Y����H/�I�Ѡ��8�~ �5���=%��f*���{?I;��!���扁��3��*z�U���}��~O�3��a>�����~"^���Gȉ�i5T�0�&���ˇ�q�6bd|��!b���i×̾,B/��8Z�g�D��<F��:�� \?A�8�&��%�j<{�s�9����dm�X�neL��8�<�$N�h�R �  �]��9NvYV���� �R������i���A����������	�c#���U�q�Ӫ�Mk��֕���`���mBr2ﭱ��Y��?��ő�ȳ^���9J'#��q��kL6��V~d���k�Ht�i��#��aw�s�L5�DXꝏ`[1yV8sHt��օr�TF�}0�,*��u��FgZd\!���W���Q���0h�:�
4'{C�*� �gN.y6���
+�bY�������0��»fc���(`+�x�/V�yC!"��!���=�Q���6;�+X�o,�:�U�M�H��U�A�!�E�f��,�!c�,�.NJZ
Z�LV��k�k�#G����λ�D�mrC`L}����e�y����J�3�������k*d!��[���	�SalT���tW��������>�/�2p)�$w��\��ygU
���4Xq�"�#��l�K������@�[p.�s��_�{�Af�i0���t�(�\��TBbѻ��i�:�9Y��.K;�>hiډ�qq��	zW���FS�	���K�6Y��b+x���(� P�"�H?�/�����/.yתr��L|J�gd����k�����q̈`����{�[���Q�CmD��C �`�Gg�ˇ �z��5���{8&_���4�Q���nsg�6�����=Q}�m$�7�|N=q\�>X*�����������kfI�ݩ�_Mt�1�����U�f         �  x��W�nG<O�������5>;��'_�<�˱����B3��fH�V%�MV�HY]Xm������xzz���/��7����ӇO�_>��B�Č����u�����{�>~�'�A2���;�4�4YGV�����9��lWYy���jw��0��Y����D�U�%�L�ȉ��6L�t�#�ė��e+\I�2PC��@���i3)!�
�*!���P�����5Wq3������o%�,Ym@fV���$iK��C��ڪth��u8O���[����2�[����'��ep�N�y��Yh�����SW�]5<�0�C�`�<�jrTc���1���C�q��4j��B����������V �cY:�(��\�Q���.�܍����LA���ky2���̖�E	l�3��9(�ډx�m5�B��l̐1 �vF��?jO�O�FE�ދ�Pk	��#;'�C�F��.�[��P7G4]y��O� �Iۼ�e+�/�����>z4��1}����%S�nC�ꠀ�s�I}K�>hs�d��J�!LƖ"�{_��U9��e[�px�L��"�a�$�������,�2�r��A�!M�Ѐ�ؙ�v���G��0�NB]�!+������v� e�&?"6_B=���ٺ���C]��@р�����PK���my��>%�h���!O�����p���wo�I�g�q(!47+^c"o�"8l�E�����ש)��:��5���\�1�_~ڼ�%�"�u�簍�4\!�5�Kd���دu����_v��w�p��:Ϡ�N\CH8���S�5���n��6.��J������:��=�|�W|�+XZ-�J�,wlj��U4r�ՊT����4�Bs�Q�>v����d2����o����PM���j��B�˺��4=���-�u�!���sJ�.��           x�}��q#1D��(&�p��X6�8�9��CIX��Z���H����CH�I�)y����IS��Ԛ�#�W>x�j'q��p�%������ӥep��h:���I�'��R4�&���Ir��Ƨ C��^Kx>�������I�)�Q�B�fZ6گ'�������8(W�权<��f���LO�������c8ג4S���O�p��CSIkɛ��x^I����M2�%�����˱"��`3��V�Y �9~q��PG�k)���� :=V�6��YJ���|L/<jDv��i���4�>�ǿ�a~zlW�����VK�9��z�Y�s}�;�^K��̶�\q�NNb�"��>��rdƈw3F�������X��Y�Z��0�W�J�g̇֊5����������Z�������a�F��ZK�=�'[������=R�������{r���ڣ�v�1�k	Ճ���yǊ�=���RRn�)m<���~����_��%i������փG���1K	�����=��]��B�k�?K��S}�5�z$̷H-Y�`��+�h��v��!zxOc���G�0v�k)���;�
a<�Q[�[�k	��{��W�p�RBj	��{:7~^����a�4�"m|^��i}��>;��h�3���ɹj�?��c��V�x���������1���x�t�n�,������D���ʯ���\w�.�D� |X��-�5��a򲔀�{nw!���"�ޙ�k	��|��W��]��dQ�R��9m<N�^�}tlf�YJ�����_7���            x������ � �      �      x��}[�븮��(j� ���������@ڦ(��}ODG�r���2�P)?�<�C���o��g?���*���lB�r�$������B���?�p���/�?!������F�a0R����B�1�qܴ������DS�h8<����ٿ([�1%�^�_Ѥ���D��/�M�J�WK�K,ٸ��X�����������R���)��?�Q����P�9>���!ć ��� �b�o�#�3���#Y�5��"%�j�M��+����!�O�%5�W~ o��?�-)[�%0_/�D��ԍ�&����0����VSgLK?���0�_���"�%^/�/0��3#�A~؉�!m&�Xh��p�	�P��g(�6E�_4&;%�r�����+2<WI��`������R*�������}P����p�z�� #��XiQ�F3:j��1�P*|_��?��Z��p]-�@�д;�������2�$��:6� {��X��יՏIf��L�_Æ<$lf��4<�'��b�r	��Mk�)�7���� o�G����V�8�.!�c�{���W)�c ؈�2�QXg��l$�x�Q�?٣G��#Q�|�O8
�T6QjFW53���AN��y���K ��I��� �C�ѿ/�#��)�܎'#���"J Bޒ�j����a�U7S�[ˬ�.��q��n�M�\.�J���&����1��ތXO{�D�d׾E!��(D+�Gitى���d"K�=�*vv���d�a	��7d�&�n�!����g+Iիj�h��
v����/|���twK�l?7�s�)^/��%�T���L6Ւ�ޣ����E��x�
W�̱�T4^/�����áMP,��MM0�o�1 PO���q}Rۆ�t�d}�S{�X����%L�ڤ$o���=2�G<�p)�� ��,���H9w7HH@I@i�L��)a����sF���h"�6Ȅ����m�� �%�@�|���elH��1�v�d|��"��g`��I#��Cvn�<���z/@镇��f���~��	e5��M$� 	d��c�#)��٬�������H�����>���җ���?�1[,��������};Iq>JÄ����Y���\$w��� 	�j�}�6҇�ԉ#3�t��Pv��6o���(�͐6�7s���v�)���ne����#g(x۬��{�%�e�f���)Xo�~X@��Yzs�"!�j$H����/������/3����r��!Nʎ�����t��z�7�l"����4�����>1Wa]�D���?%6����@�@�ݼB�n��Q	��|�] x{�	GVp��N��w�\�E>8<�g>�����̆���=L��?z<���1_����~$ǷS1�0�c}�`
��b�OU��奇p�d3�ǂ�(����e��Fɰ(�O�xd1~&xCA������P�s	�ƭ�Q޸c�������G�XL;���`�wφ�8c�����\@}�m�J5a��T��?�"n�pU��1	�N׼��ng�ڷ7I#�c#d�z܏��Z�����r��N�ވ�Y��]�7��Ք�"�f������ ��d�/�>8�[��n\�(F{��lW���o8f���3dK�1Z!
G�{&B�zi b�9ek ����I�.$�4���o@�] .��X!2����o@�} L�dM�c̫�߀̡�5�4s^-�d�_I�������~2K��&t�U�`l�,�d# av;u�[����,��3�jH�`=.�D�11nvQ%�e��n�7 w�yS(���4��j� ���#�`�d��̑J�5l�I��7z�&	�i�*4�.5ԲZ�is�����M��!���o���4
{����?���7g��f1��֭hUm��MĻ��qw2bk����?����ol���Y��-,5R��J#���/��ZPfm�fu&�=ǧP0&<�VR�#��^17A��\�1�vب���iû��c	Ŝ���1��|�)2���=�wɴ#�b�ґc�"�:����#�ؖ'}!�S���95$nv�˷�"��꿆��u�vG����q�j(���q��N�(�ez�i9@VF����]���.��������jh�����%�����lp<	���g�4+d��E�LsH#"��6,ƽ���XL#����|RA(�o@�2�/W��-XEB���ޭmʙ��/���&ZH:�����w� J�jߦ��(�a�;���/�k Y����yp)vU�N�SaĘ�0�w�/E������1Q��ـwI���7�6E[�!��6��-z�B��D���v����-y��8��D����<<���&����ps�j-�Y��7� �7��/~�1冉<~�A'Hj���� �vP8�N��t��K��5��<I's�)�9�`Z�b�f�R��ҧ��>��Si�g۟��ȫ��Sy�ϗ����i�������H�$f\�f"����\�+� )���x�1H�x���X��-w�A�@����Ґ7tU��HcY�Cr�P4�g��5W���V�.�.x?࠸�0�Am�H2ʹzĖ���3!�	�E�V��%���n'�u��E<�)���ϗ~ؗ�s���$�(��w"�ߑ�L��'���ʯ\�?�����S�9�q�4�$#�4�d��"��$V�����m�%ZT(6nM��*=�[}f�2qH�mO����m=�Wj��(���)���*�6E兽+��Z�	H�$�RDN8r�z�T���9C�_�vV��Q��-iɯ�!� ���-�fj���q����p0�Z<#�	��I��R�r`�����ᦄ��R��.�� �7���P�5�3�AG������Zk^-}#8�5/фTۗ<��t�^�,����WK/K�)����&P�ޭ�V�a���Ε�!����A��Ў�J��.���x���/i�a햪��@��n�#f�����z�KFd�y_)7g]���uj�K1"m��f㐆c�!Et��!Jn��T�1�N���U������t�8@�k��*3�0xnb��?1����3ذX�>̀����x1��0�$�h:E�O�%�����6�d�2e�z�iC`K��O[S���Q�N�w��J�$��p�*2+����*3��G>��K��I�S�I}�?ۚ�j_8s��U}�Q����՗w�Yi.L�e}�Uջ};�E(3����ql�+�b�.]{x�c��xC/��4�P�v:����w:�E+?���� b��7�(�Ww�
�W�H ���:����\��j�rL�.u�	�`�FZ�h��0��X�T��us��E�ֈ��rS}7A��4k�W���F���=t��D��P��e� �;;�K���-��$r}V�lX��U�6V�82E����lB]����u��<+&6��/�q^�����a��I' ��4�hU���(ׂt�B/�~�Vu�y�������k�K�a�|Q	�^�8A)�	MP�x����B~��!��8}�-�e�����ӌm�l�D6M�`��<�����d��mD�v���\T܋��sL�����o4^~���a�ҼC𱃛Ty�+��rqB[�߲��^S�Ą����%��e�p����D����Q�w�6�b{ʏ�S�*: I^��G�(F��2��S��"o(w��g9�P<_�q�*ɑ/B�P�T�%����e�L�^����;��E ������O,%�p92^~Ƣ�W�E��Wp(��r��Ԃ2�J�ʒW:���rRN�V��H�ȕР�;�0f�qQ��&R�XS�6Nd4־)l/�6��\ٔ�e�~�={�P�Gq"�c˓�tC����b.,�ƾ �e�y�9/,��Pz��R�t(܄���X�l�f�k���yY����,N�"Gs%\�8�\6g�?1�q��bj�[�1觮��B?m����g(qh�$(/�͓kސ�j�C�M��T!���v���9k\�    �b�^&���G�
j�C؃�!�m&�%��!b���AG��oV�SNq�@8/�M��2aC�b.�3Nx˒Hv6S��R�u �+���MB,e�/�W����	K�����1Ǵ◧ل~cD�.�m4Hyo�!+���F����<��B���l�;�qD��#��U��V$��o�$�!�A�"^��ǌ�Z0��I^�5�8/��^�K(�����^-��0�ג��GL^a�o�0��	�1c�O�*�6W��xM�w��y�����Pӄ��t(Qg(޹�yf5����+����7O�>�:����\F~��L�k$��>f�za�R��~�f�	�O1����01ǔ�.N��C:�U^�<���!���
����o�����q�0,�U��E���I?T_E7/�g�����3k�.R�((P@!���y�ݭ�+��H�ݲ6��Uu}ԧaPaT�T����f�i�9��%�Qa�j�|mZ����P:�˟�j-�6f��|5�����L�C�V�������u�3,�rH+�ɶ�9f���a�Oh*�*M����J�h��D])�CJ�������MT��Q�ݎ�����W8%A��W�Go)���@|B��f�m��k�
�weԊ]:�r��*��Ib�ژh!�����?��e�?�|�Z�~��?�yE��!�~�r�N8�C[@��@�FQ��T�w�b)�N�38}�Ch���KL�|�R���,�C�Vl���7�VP��$���慟��oH����'9�YƦ/)^�K�>7�b^8��ۿa��c����5��i�L�E�8�h9%Wϫ��#-g,��1�>�%�c�yF�����ܘօ�-�wJ
Jˆ��9�������8d���P��?�8����!�3�M��K�8C���|�i䜮핾5W(x���nt�y�XR�5z�&��ҽpcfݛ��1��C���W�W��I����І҈��=Q��!0]/��F����E�w�|%Ծ��H���o�$�Ə��<��y��b�{Ⱦ�>�.���2��)�پ��Ja�];,/T�y�zh�;m�9�N�>��IЃv�i���&栄��f�n��l1��{��61�k'��h���h7zn��}�o|,I鏑.�(��9].��r��J��Gq�ʕ�\	��[���Sh�,-�	7�ђ,��K�mH���*"IK�m�e#�/D�`'#$�a�A���o;���Di���S"�����;Y*�ơ��gv���\�\8�/^��r���RE M[���&���j�j\�Mkz3�����	�z�@�|��o�Q�%�BⰮ��:W�QFʸ����M}�9�NG4!����a��GK]��yk&F`�.���n%݄C�@G�8G�5�!���~D��ֆfʆ���@��h�t��]�<�Q�Y>��.kv,|��� ESYj��7�D#��h���������m��QDM������@�S��w�0
�����e?���|ai=�)��e7��g$�ҋ0�0�ZB+ĉ�������e➛�f2�yl�&%���rS�z�H�v�GS�9d�t��Ff*��Hж���i�S�#�:!�=�O�z��:�R/�fӠ$%�Y� �v�Qw�c:���<ޠvb��Z���,�9~�Q�o�} (��af��K�ij�k����@���DGMy��?�/r�z]�	N�L��U�h�3���<�L4D�x����1T�ѵ�7u�aD^���iopqf7�iw�[�4b��PU��Ҵ��Iq�7��T�W˓f��S���@6�����_g�P<���g-��垴W^ �ǁ��2��ƥ���p���dw��I>���H�.��� i�/�ԕ�&��R7�L~g���m�3��<���Ԝ�_ox��Ĥ�Ʊ�?.���ó(8ƭ>|2&ʙW�����<��sl�1�8�w[����#sN{C��&�R��N�33�x�P�[a���{;z`0���R/7��>J�������z�QG����oͪxO!I��_��Oh���y�;��O��k ep�uN'L9s�A߆��J5�gFc�y��Izg����F���j�TG��_�zqX���p�IF�Rn�h7Q0��y2z�
��F����0b��cfBP��&ƫ�H{� .]�WS�Pf_hO�.���W9�%��oEe�==��HM�p���OG����βGt!D�4��Mߌ{_\��sA�:e��#[�SL$h�n��s�&RwPN=��:�o��x&�lq瀘�Dރ��1�����9h��6oD�.�$\�M�g@\m��]��'����Ku(<g;+&�]��Қ�x'�]_pB��=m<a1���������ǔr]��S!���B�#�ht�Vc2�"�h��w��q}�3�IM�GƁm.m��<�>sL�N�2�����o._��w�ܵ���:�e��	HPdC����7��Y�J(�|_$�n��>�EKN�v#�(W����:��O$Ds�>f�|��R�V��;/�'�EX]�"�9&F�Y��要�&���)��v���[C>��0�ޡ��4y�ni�� O)4�ᐹ�z�Q��Z׌�a�(]<�~m؀E�:Ќ4�� ����[����s,���bp;d�p�Ζ�	�t��k�!���t)����u^k�U뽯�s�Q4�AՇ��sW��H(�͜ڨ����X! ?E9�X���n��'{? t��V�y�ЄŌQӅ�/�n�0M�˪��-7�QRN~)�I�t��	��v7�uk��� .~vmF���&!�tn�0i�쓚�So�]���)Tg��_���~��@���[!r�)�Ss���b,���?Y|�d+Ho���:�!0@��δ�<P��xR���b��ٲ�)���'ם���&��z7wD(�^ڍ잛8���a��L�}J�w�f'K�4�7��,1��̇����!m����L�A�ϯbߞ���$�g*�@-�ilۮ�0	���
��=��V�{��<�^Ǖ���zfW��E�"��H}��t�#U�ɞ��������J�X*��{Z�������f�F��	��eQ�|�P���xGj��q�P���iq"�O���S#���s�E�֘c�hr��0]�%uL�=E0���;3����S	��X{;s�H%�	���h� ����"�����Wƭm��=ء�\. )���%��dx-�o R����47*���t�<}��٧�F�!����,�H�l�A�>��QѬ"��,��ev���P<�q%{�:�pQ��>}���U`�����>���.��/5��ǅÞO�w��!)�ܮ��t���};�+.h�<?�,�.Ŕs6k�}����0����*��̇=,~Uk�s(�RαD�g���/�S�͋��}NkUJ�n�}���m��0MHR`�+.�>u|M�<�si�_X�(&iӘ��2�g�6ן���α���`I���>:q���fW����*<3r�x�)F�IT.�v8	uI�҃&����<�9:ȳ��Ig���2�jb�s͎x��z�B{td�d��/���j�g�iÍ�F;�!�KZ:���H�ViiU�&�%����`���3���j�J���gB�u���uh��J~��Ɗ��}1�7?z�߆>�!
c?���ʏ
����c�͇�5����R�����Q��va��m)�;��s窒Ol��H���n.E�+^���A���U�uh����n_�ٸ
�\v�����-L)��:���U�S I�l����}H�<�G@� �������0�5S9�}�ܙ�8����D=�O6�1�nπ)�9(����v�j0�1���h��2�j�P%���H'��yrrL�/�F�%=�Xr��)�=�|��:�3�v��Jh��d�l��ܒ�<>��Y�n���>"/?�q���P����'>j�<n�T5��1�Ͻ��6�t�C���Ϯ88���2(��
���>���B�
�'M�u��r�u��!��0J�$����B�o14�]�Qj���>j��% �  #��mp:?�)�<����%�p��(��Im���J����.�Q�|��yI�|��Q61��4M��l�#j)�xD(���z����=�!.G<�ү�Ìd"�ڟB,��4F�#�d�GF^�b =�!��d�X��_�ݤ͛��y���$u3�O�BL~��<]���p�L1G��	�8�"��W8�V�ƣ��?yH�'8��z�?��z�����f)�t��e����I%cf�L��bv�ӹI�R����(>���8[��d
��y��?�� �o!�����bۭ렏�[��܊C U�b��'���Ǹ�^����~��u���\@W�0�A΄2���:,�ébj�C8Y�nmxٹ�6bbr/�Bs�k��"�4���H$�a�j�]�:2������⃑C��Ż}.����2Ԑɳ���F��i-k�<���J|��9R���%�C��ј��!��C�g�J�f/��;,��	'��)Mr���i�,�^UE��Z��H��64�!Xy�2�A{{R�L�ϧ��}��#��.�DL�E����jۑɱ&=������HȒ}(�@��9{�L>P&�Jw��:�ݲQ=&Mz*���%��j7�¯Ƥ	KO���z|{g0�P�B��Cn�o���f`�]�/!��xo*�Z�*�^.I;���Th*��np��;���o�c�@��"�CH-.�����D�ؗ\ľ�_/
:vrV�z��E��
Oks�򲜞{�C�u�Sq�A0⇚}9/u}	�y&O'��g<����B�&<�@7�9ä�z��u6OA��7֯�4[4�,�ѭ%3��˸Pes�r���x���������u�
JZ�2"���ҥ�e��N�+E|�Ը� mZ��f��҃^��n���6ҥ������#�Z�j���m4�҈h�/=S�sh�ݦ��[
����.�K��JP��N�%��?����(L�      �      x������ � �      �      x������ � �      �   �  x����n�8������	r8ÿ;�#q�HI�{�ƺ�ة��>���nV٘��1>��p��(��Jh�3f��d\T6:��G�@-6Cw8�7�DÚ�CK	@Q�a��a�F\����=>��a�%�.P`��bռ�63����1QP���G|ڊj��?��'�6�7�ԘG<��W�0U�҄�m�4Ĉ�G�@b�n��~7�c%��r��5yētb�?t�K�s�(�3듵�y�]�"o��򪬗󦪮o%�cy�ln��v���MU�/�U#�R.*9�_t�,�ʠ%�<�1_��>����<eT.��
�⢾۬�EU���F��$��՛(�4��%;^Wf����|l����u��,�O��?����w����~�v��?:�M�gk��������ŀ�ML:*����(��x�^x%8M�{��ϐtd{r�
�bQ5e]����ź.eŭV�G�����.����h�����!�j|��)�*o�W�W���V!��#.Gb�>}�?���x����Xx���/Ƚe�\��aǫ�OdyԔ'ܕ�n8����$���Ў�{�`�?Bִ3Ǥq�����sg�}�=�w{��'��&�{�G<�(6�]�����{N|�(�Z��C='"d�+��a�n۳��&�]��OU�ߡ:�I      �   =  x��X�n�H�.������tb�!����bW�	�I�!!�d9��M�I�{����X�ݾ�j!/6�̟	�N�wZ��*W���|��
�a)���\��ɍw՚$�ﳿ��J�"E.q���p��4�4��B�z^�q���^EEز� ��\B	sQC.q���[�0A�}�j��WO�fw���<��@�ȵcSa�t��ڋ3�����;�t"u�t�5���.f�^f��ol10���pmw$$i�)�t�a��r���}�r{���2�Ӱc�8�����S�O��{�#�ia-�s6X��*,ܲ%����'��*Є-�έ(q� 0_�;KF�����{��٫Ԫ���}���&����I��e��ֽ���0�F�oo�� �m&���4˚���r%����ح���@r���Q�.�׮�H��_�c����_���ZͶ\�!�m�R�`]"2A`�_�L[� ����dGTR�WN��t��>A�ɵ� ��n��y��K3	��;����ݫ(*r(93�=��z��.����:Z]�ܾC�R�n��cw�V�e�#�!z�j�0�p������Pe� a�wJ,���E��.�A�K�ʛ( *4� �|�Gi\FJ��AI�`��Ly�)9��$=�g��r&��/C7`RJN1#����_���c�~n��n*w��p����'ë�A8mO��gi����y�c���.f���v�=�(��������k�����(���v�ܨ�P�>�X�Kn>��xd|i}����cCU���]���sJ����^��p�칵�W�o��Ҏǈ��Q�N��GG����0��c�O��pO��Q£���jcCK��i�V�,�uI:�b��	�t�%�/L`[dBm���n����b�G+�-��=d�go���o�4,h���ăb�Z��iőL�s�g�9syx���6�,h��\����!�&��Y&�tE���r��Ly�D�5� c3v��Q	�c(n����&�h��{6� ?��l�e�Hy=NP�覧��`��n�E�^��ڣi�+���w+9̬���~~r�	����~�p�$?"mm�3�=ͦ1=d�2XY�
0��p֥i���@�����h��F�q����I:���a�s�7�=��a�Ӄ_���ġY,��P�����t���Q?I>k��Y-I?<*�j-{H"�n�Y2���l�-�����lg�|����������H
����V�'�?���'ӱ���O~4���t2>��~-�5Tt�:^�A�X��ex{����2�ꙤM�7�q0o������=o�[��~�S���?G�=��Q�h��;r����Fb:Z��mIYڹM�R�;��O�;L����/,\H������U���m��L�Y]��x-��w'7���ݑ\찼Z�@��ک�U��ǵa�b�_����f�.1��
���%�i�gBK#��x描��	������6
�l#G��Mm%07�gd����7�(���p�盷R Vɉ��U��@&v�*��؟��/��3Cꏿ^���U!;)�IΪ&����@�=-���D��[-���k75r��C-�`rL����]���h���Y�Ko1�	��hC������$
�>��~��������Ƕc$��+x89�7
�0��ѯ�s���l8&a�M� �B���΢ȹ����Z��Di�c���r4�6�����m���I�+��^��!���|£Tx�v�x��zA��svʅo���S�Ʋ,i�e_��3rN�_��ռ�y�.�p�`�ׂ7g
��U��S��K^c����@���~�H��9� D��p
��Pky�Yi�Yi�U�P��-憯�����m5峡6^�Y��xf��������<��x	k?��ǯXR��$��Y�0�A(�3"�]N�;���x4},H>K���1Libze}�V�b��iL�ZL�|�&��0�^kz���ʒ;�af��l��)���� ����*jQR&>l�w��v����%�rq����˚��S^��ݫ�k��oH������_ H��t{X�T����      �   �   x���1
1�:{�)�%wu�R�66C1���$z'/`�Sb#��χ�Wb����@sĀ"��h�ńgSi���=+�PR�R�Kـ�˜o]Q��7�5&���O���{@nx�XLZ����j�vY�S��'ؼ�8�hb"�B";܎�F@��`��3�5e��Ywdɟ��UQO�[�         u  x��[ّ$������(q�J!���� � ##Xowl�l���	������0mqc-)����sd���C	Ǽ�čt���3d����_�׏�PS)��Ey��?$�V��*�BI�&5M%�d���.�28~��D�˻�LM�[n�%IR`|o	���lġk���#q��&�<�M�|�տ�?�| �Z�ѻH�I%4�C5�MMB�-�@���B�ѶXO/
mZ�{`�/�w��_�\!v4U��2þ���)���綵�%p���-�woT� �+W�/Bgh�W�R�"���rQ�dP��3�8Y�,I�/)�뻨�jҶ2�բcL��D-�~�W��s�)8}����p]�~\m�Cђ5��<f�U�,�����1m)�{�H�:�%�����&��&R�"�:,Q	e�Y���$Wh��*��GTj=�`�e��tR�9h�?*cuP�5 ��?���-�P��ȳ���*��sH�;+��_V�����,�wQ�βU����C���s�:�à�K7������f(p��d%2�0��)C(2�![IvzW��	����)�@��5�D�h��X[HC��^�S�+%��I�1(T���L�_ j�a'6�h97J��Mˇi6��bpfWs �B��w�+bA*�?�h(q
l"��E�@^N��6EG�Ɠ�5G��p<����q1gd_\�E���[[5M�y�������n�1�d:l�)�Z��Z��^DN�X0<�P��[@W���DD��O���T8���Z#;ъ5+�t#I�� ����D&�c�ѹ� �rXOH��7�#	��T]��j}��K(���4�P���޹J�O��h�n��wQ��°�#�*O���l�uʷG�q�`�|�_j����).D`q�n�H�o�*�盻(pQ$��{����iʯ�܍�����&ʣ/�����sIE~�[�H��W�e'�+N�j!�(1�Va��� +w�:�$56j�g?�w	u�\v�����wYi10o� �i%reuW5�C��N�V
�Jd�IT�a��A�ҵ��{��A3��H��ʁ�t�7�w��!�O��w�>���P����&�3S���	��f�N�Wn�wQOJ��bl����b�s��<f�=q���,��z�Š�<u�'^���|{Q���f��y:Gg¯M�^?7;1���O_��m������ t��QdP���5	�ᑯ9��:^��t�,�>�ô0��e�Z(5����x2��Z� �6�,>ڡ���D���lN��@�8`�8a��P����}�j�I�vP?���AD��P�Q�uT���Ѽ'����0$�wC���{Q��0f���4M��{��ɭ���	�2^W"?<@��+2��'�0 ��Ж$`��8VE�9��0J�{a���.�v�+�xW��|���@���wy�ϓ>�퀻���]��f2���>x�Y���<����o/<�E��ю#ty��%� ��_y������NјބC>���۫2�LH�Ȣ`�|E�o"�;���$TƜ�`�e®��C�3_-cM��|-���:(i�����]Խ��>"1�G�u�Mp|����'�ES�wQ)j�"��9<<���)Ƒ�!�cFp�4�ܕa��LR;�֗E�ƛ�c(3w���!�á�kb: �=���D�Y�N�XUγ�sg) %iE��H+f�����"}�ٖ8�Ξ!_>;�hH���a��z��wQGDw7�t�h�Y�.�����Gۿ��.j�I��4 ��A-��
Faf�9vlc&F�F���.�~JP1?QV�����mh@�dF�`��O��̪)b�� a(��K�;��r�/ 2�:���/&x�*t��y��;8v*^?-��jyup�6�N4	��#��!��[o[�qʵ��B9-�
1fی�����c^E�2�;�Ab���"���Դ����W~�@y%2��te�b4��Rl���4V����*�H�A+�M��nʁ}�9>꼆 c�(�Ɇ�����`�-�RV"O��� 1�[���g`��cΨ�M���F����*Y��i�]�f쵔�=ӉN^�3�)��e�-�>I�\�r0� �[*�D~��� � F��e��l���m�-LƷ (��b��L�G�{ Y�k0��t���MԔ����������d\i���78�Щ�'n�|�6��Ag��f�M艸2 ��<�ԩ�cOW� ��p:�Ф�0��%p�i�]���s"N3�, �Um)�Jd���x�2�`�K��ݝ>����,>�9fy>�h͘[H�5�3�wQ�n�w���.�ҭ?֐��'w�n��k~��j
w�<	��Lm�����~��_)���"�������,���;����/��R�A�*��
\�9C]	�+�!  ¶Z�$��*�(iY��O��(�"��Z@�z�nh>#+E��t=[6U�� T����d5,�c�s�_Ӆ�Ce��1`�����T�.���2��V��\+�D���ʧkj-��͹��Wn!�bn6�Wع��s�}����93Fx"� �T��G����c�M��D�5Z��������ź�G]�W*e%�#)A+������
<�UW�&+�� Y���3�ee�6ղ���E?C�-X,`X�T�����%X}(Àm :{6���	7S0n�gw��5�˻����r�9��M�i�t6#���#ԟ�8�MS-�m��=������(ʾJ�T�*G{�4ed���ɰ�k]�������#���zr�൯X�u�;1��9��zxF��ȦŘ4�� �ԇ";jH}0&{Pu��2�v�����DW�1�éJ�ֶ�v��~%Wێ8���F+��{:�=#����1yʲo{h����Ï"��ph3>߸�5��z�&,~=�0��ܩd�A�4E�;r�l�_	%Cw��v������W"?^9��P�c�[\~�{2v0��L8�7'�wQ�N�'׎eF���9�U���m%2'$v �Ki~�co�ʌ���f�YB�2�{A�IO|�����e�1z�����1�����<�ݪ�߷5'�	Z�&�f��/_'ZQ"(6�i�J�XĨ*c��q��6�U��Z��] �����S���Ӓ��h��P�	?.k9z�?*6���1R�V"�b:JY�x0�~�W�?˚�&���p���i�7$�xpJ�{,phz\���p�Vێ��ey��^�M�ǲ�kRJ0���`����0^��e��2��(���������"�D���=����1�L�������RG���=�'�-�c���dCih�^�%�-��2��	g����<��JiY��y 9|_Zk�iw+�6"���.*���qBv0�����L����� ��M+�<wz9|�GM�4�R�W"(�'���� d�         ^  x�}XA�#;[W����m|����_a$*��,���N&6���9��}����������[o��u�u�e~vv�-q�2|��>�����ao6�e�|�ߗ]�oFq�cm�ф�I#��k�	��
n�U�l��7l^�7a��ݱ��[2o>%lcu�ar7+q�jg�ǋ�_���ߧd���$����U����s��6HYߑp���<>R�d}�6h�I�
��B�BI���1!���t`k��>��l��y&0����II3J�дn�ٳ�m�臛ɒ(�������g\c�t���h&����R�y�$��� V�%a�	P�M�)�cdtֱ&K�`����qrYk!���a2Vt����PCD!�ò���r`�u�4�W�g��s�]�Q�5X��B���~�p��@�m�9m���nZ�±:XK�1�)��6�[��C��2b/�Ѽ��(#��ްy�~iZ��FG�c�(��B�n¶L h�m���>�0����]��VR �/���zV^�JV�%b�ǃ�I��j���֣9�dp��Q7T��$~-C-#���ƖЊ;q8ǤD�P����,diő1�P����x�V24�6���3W���ˎ5(��!���w�I%��7Lfus�y냛<e�M��yף��r�5d��2.m������7Lf���L�Y�`��&#@�xԔ���L�A�P7�Z-�_0-�t	��C�Z��a=%=hT�hO���K9���C9��.G�e/�Jc�=���,6N����n��i���H����90�<Eޥ�&����R`nػ��SJ�y� Ӑ���|��g����C(>(�Ita�Y�+�>�i<��0�,��i`=3įeе�_\�mگ��tZi�g:��}��x9���y��p)kg���͐#]֐�u�|zL�Lԝ )N	a/X�$-��$
bHѹa��Ɇ�N�[���31oU%�{����'�]�\���眅�+Bssʨ'B�c�� �&�8&fր�e�4�DY��1%�(�V�d�_4�\����`�ӻ��\�m�YjJ���^Ņ�o����JG�VE''�]���%9Br. l׻lA��Z�����K��]�1+��1E������/��S      �      x���׎���5z]~��4���(fJ�ŀ�9g>�O�wy��]�|7l�f�0�Xk.��G��W������9?��������iv� ����y��I�$�f��t��̀ج���U�pڴ��̖����bT2��_W���%%��C��ɯ��dd���6{��q?�W����u߈�
�@>��A $�������� AF���o8�EŚ��]���f���>'f���D6ȗ�W� �s*NRo��Q��Ͱ���{�H�{W枑^b�/��W1Pq�_�I]�
�!�a���tG�"7]�Z	�~`�j?���U֌k���-0�����(�')&���o8��Zȵ�:�V��q5K�9A�!����"&�7��ke?U��8]9%J`ב���Y"�gB�k�Ϥ!m��`�ӌ��<�<F��}v����!55d��1�^��a���X�����#?L��z���@�o1R ������0D�_C�7���P�ۖ9*I/�g!Y��R�����V��H�乸\�0(�n����&?�m23�m]�UF@^\1�����`iCb��h�[-��2Z�Я��
���xXI/�H;$]&���]k�l�ip�(�D~����� A@_B$�?bvx��Y3��y�,��>�Y�%Y��ƞ�Eߔ/ɾ6���*tE�Ϗg�=�pM��� �e����C��7��j3���KjF�N��c���|󖚴\}��̩S�ֶ��������8x�!�D��7����At�5�g
'�,Q����(2b��W�L�#>�wJ�����J!��8{���)�P�ml�J���Z؞ C~X�5���aH��U��ܟ@����)!��� eMy��b{X"�-ʕ�3����b<;���w
� ��
�A���"ْXl�E�k9<�*w��.���bđ�遁A��݁�#ʊ�R%(Ǻ�p����A��:2�48���J�m:׺(ɻ́}��"��z��d`o����S, �F�� ���G��7��lC�&����\����#B`��������\Z��9�gܨY��c-$mX�V"�/�t��>��FK���aB���,1�����������<�
�UՑ0�C��-�����7̫zP�@,m#S��,�#���`��(��S��ZA�B�7���)�xNL��P�k��������T~6�&87�L��u��A�� ��f%�a�@��e��u��Ÿ��b	9��:�vK/��(��
��~�����%��OaC��|8P���1UnB�d�iTkby�ɐ�����Is�w�Q�����Gȇ>�R�Bu�0@JCl��4�:Nr V�MEýX���=CP������Ӥ�0=7f�p>��?z��3��uh⸷�vnPu��zA��3�1��K�\��z��3��Gj+��FS��	��[*���&��	� �"���Q I�_C'MP�>f�*�yI~F&R�C�]aV���n�\���Ou�ŪNy%D�ג��E�:��@�;�w%�F#���a���_FP�l�Em��"<�I�!N�Q��EK���R�!m�֓e�@Zr��z*�x����?0�;���ȓ�+�$�q�ݰ/̜CW�>��!l��km�υG�d��Zj���(��_:����u�9�7E�gŢ9�_�kz}�-}�@ѯYQ��F�4z�8��pȅ��m�vcSRT_�[��b峮>���N�9G0�;�A0�~	A��#��~w|�ݝ���ti�c(��F�6U�yrl;��A)P����"Abx+��{��j������*jj1~[9�'�� *w��8��~�_��n��V\?�/�b��d��,K�����D�N}�}�P����!������Z��h�u�&��#k��3�^�wG]�i���}e��!Q�KB��`�A,���C����������3��������c,6��]�zI#��ѫi��f��̕ź*�d�:
�5��)��tA���M�A�@�
����ĩPH�k�F`�Q$3z/���|�/���U�٬�����*��Q\Xb��BiĦ#5�(���sM}�mq��{a�r�|�GSQU�IH��Ѧg�N]�k��p����G�����{W�\����2#
�M�w��w�A�9��S$����'?�p�.��vAn�
��B���ٻ��el�a[OtQ �$��a����Q��KD��,YlU\`����a*� c�ru�n�n���4_��y��ܞ76� ��j�hа��Q���:�j�L��`�$�Ʌ��V��o����#@�w�H�"��G�d����uR���_&@̟����ALC@�2B������H�(xb�rXN���K��~��i�P)o�
 o랋��v2�|_v�[�  �J��E+uV�M�0��R�}�������`΋e�?��=�ț��RD��(�a�%�B�p�#��@4�W���|u�����7�w��<�� ��}��u#)a�/]��P����I��A��q�{Q	�W��^��*hZ���{���j��H�X����R��4ڣ�Й����T��?, �!�� �!����o�NS��i�T�r�<����h�w�V�RD�@A�ި���"�$IS��h�+�~���h�0�O��0�e;���k�\��ә �P�FPw���C�"��ٛ�Z���FT��a��0' �i���0J����G>�Φ#���/lC��%!��|S��j��]3���v1D��"g'C�P
Ƌ�*8�B�P�f܂��v6����#��){,Db,���+B�o	�e:��tu�e�h��T~?j�r=������ʙx�t�p��:���'ybo�}1W��>t�]v����fM6�A�P�z�=�*�P]d��t����(��94{P�m�CBZ�*T)o�|g�"wsBQ1������U��	�ʝ���{��7F�=y3�v&)�@�/!�~D">�lh@^^6��"=��424�7��T1Z�ܙ\��:�E8� ^"����T?��̞<��3��y�\�/F/ν]��M|�CW�|%P�V���8�P}L��/��:a� z��	����@����	:�����}R�k(�"ݟU2�3|��'a��I�uqp((ע�qZ�5Hj��S ɪ���GM�w�R)2��6F���!��V�mԝ��� ���q�ɗ~���`Wk��i-��N�h�Bn�[�`�V��@%ߵ���'�H`�
'1���!�y��˜Y�~��6\|f�jJ��i��H �Q: `�]c���s�Y]wÓ��N�j�t��kQ��".+T�l�ъ��yOϐ�9U�ɟE.������0�hev��^Q,�l�t!.�f�Lz1�zHO Ag|���^�NOD�j��k����;wW�c��S
���yC�.�)b�s��QjEn.�;Sw�����*��Idɵ�kZ����ÜgGl��o�vT�$/ĒRFi�TJ��ֺ���O͖�i,�
��71��2E[��]�?��}�}�(�$�F�o��O�P�D��_�����J]S� "�j�n,��9��~u]��L���)�Vh4_��p<X�yp�V$
�[�ɑ�<��H�b�`2��Z|[w˓vy�S�"s�Pq���1|/e��ĥ<5�t�I���
�����o���U�/�G�W�Z��a���NK|D-�;M.��3F����/溩3{܆��Ҷ�a�թ�P::�D{W�F'�q�r�!aV�Y�pƑ7Q9��$�D� Z��,�8�><�"}+�gZ�ʽMX?�k�����v2QI*���v�_�������w�$!�:##?"�@��˷�+ǂ碽������Un��82���	�ꬾ�R\�������5���$���rRu-�M�/�(�tO�k�-�9b��YBF����A���ڋ�"ɉ�����l~�W Ş��2�?e�i���`�5t���l���ܤ�˭�(���K�6%���/��{��m'N��t�r��sc���Y��S6T�Z����>�[VVk���0��\z��Hv���    V��7�����&�����K�,����<I���yS�~���!��i��q(���g����=�U��1�rd��Ȣ��Q͝ذ��𨯐���g%ʬnv%���?$3�w!(�]��r�Ap��^�EQe�L׭eP��8�3#{�rh9����x^���E~���G���a?�	�k����!�WE�8�y�������>�i�v�����h�?��\�xַ�rm&u��6�}� �V�Wdj�4`��z��[Z�7,�e��0^u��E�x@���?���+{I����p�+�)dL{��������qM�C�7�˖_��-eGTiv�70yN��GZ��Q>u�^.���9rnA�xOI��j�I���^�^zL���''�҉�yѺu]�X8F�5_LE��c���D�qkO1�s���R0I��8�ޙ�Xύ��= �w������
����ɗ����[�2b���DY��|���'w���r�M�,ẖ��3#��"��"�"Hj8���c&V��#f�	7>/�N�([�#�gr
�az���H:m��?�&�Y�;1k�6vݍ�.�J��-���`����A��!�	��'p���tu��e寳{;��:�9��R�\0��'�D8%�W���3$o%�t��q�$���o�Hn͵�v=��k?�;r< a�כy*Bd���M祠�gmw�uw$�����u��� ��(���^GR����?�O�ï���S���ٻle�����[�Qf�H~�3E)={�8֚֎�.���Q
4�*6nu4����=���[r�h-.���]{!&@9�g�D$�k#�˱���`�=��$y�G��I��B�6$��6�˒��x ����.f�Gy1q-�1�)ˑ�FC��-��g�)	�tɄ�!J���n�-wκ�^���dv#��C*� ��w{�d�m�ULp���Z�`��
����m�9��w�T:�F�v�s�#Ꭾ��pf�O￴��n�GD{U�S�[�fu�v�66d>85)��������!<����%������QR2 Ef`/A�H�&�D�1�����3
�vƠ�1�q5i���F�L����ŇR?���0N�_A����i��/�x}���3ެ)�Q<�6׽�x�?e��ʍ8@m�]JNg ��I�@�x��Q����3��Q�-�͢ ��q�y���y?<���Q��-�F���m*�~�X'51]=;�W����"��0Ib�N|#OE���W����?=s��g�FB�v:U���(�4a����c���$' ���^J�B�N�h�1瘟�J�^'+A���MH�d�MJӯ��T����_bT���"xnf�(�2�Iz��$�{��[c��&O�� �5�}{����zs?J��e�Z�T?�q8z	_st��b�4YH	���	dm�N�wى5V�s�V�S���E�@�
���9����N !��E������Xʖ�����!�=#�i��9��]�u�O�l1����`	}��AB�GDwK����P�m��3�I �Y��뭘<���P�<�\E̍�k'�3�ZS��Ԩ]��#�>iJyn#�:&�,8-)/"l	 ��	��4��׮��|ʪ����H,�������`5(���x/�$��g#�'��7-~��DP���}�ȏ� �N/���ٔ���p���8��q��"�����K,�-k$��f�`���`b�����st$�N"^��(%���&��|��-A�燎��V<�CG3�On�]vI���D7�{Ξӳ�FV{�+�r}{���$����?A���؉ϱ�HY4�3�G�9f�Xp��[�F�8�ݘ-���m����~oV�Ws�.3���D�Q�|u���%�t�k���*u�%g�R�p8$
����ן@C��o������̛^��?T6|����>~��N�B�s	�O��ԩ�x��,��?#�jr�q;yت%�@-���/f��{'�=�gU�*� zF�^0Ԓ�[���{E�G��z��<*`zF���@P]�\V������B����xd�@��*� [�m�f?p�WҠ�E�Ip8H(�5�~;5z�(B=�L������I��+���T��RlyV�67Ω�/N�XA�I��G)�_�ma`��A$�N�.�`:E�~a��2)��4�V���=6�&��d��!��)2�'���I��%p�N�Lh��r�+���2#km�zm~_��Y(�mlҩ�aEô2�|>8n7Q�Ꮁ)ޓvX��
/�H8e�=jC�G=徻�AB2*�U�ë-����_�N�^5B�iKT�8&�/<D��z���_�������"��Of������}�?(��>(�K9���;�_�e����M�]1�-��l�c{��,N�V�3�6$D����t�u��?XC�������A�`������$A<�n#VA^��=��q	�7��.��{u������TNi��o��9���|q��!�|2g��ᮙ�th�-w���0F���<H���)��.{c�:oq� �E]�y!�K��}�2�!�]xfj#���RW^��5�ĕ��-���bf��|e_�������~sFE/�Ue��W�� �!���Ilԗ	}�ώ�끣�V����Z�ڈ�k����$..���϶<(v�.	�o�����f�0�q/�c��6M�A�XJ��v��^O��8K����x�m���jw���
�N�c��%^{��^��-4�g�oY�#�_C�B��d���4�d��'�6���筡�4���kP��G����������s�f3����0QU�q����]���5<&�FQ��t�Y���$ޗg�D|E�X���V�4weݤi	4���[yD�u�(�D�rj[���~F�d3�;�������3�o���:�%�!X�����
�%�e����2Y��0/�#�}�M��i�7A&�2�* ��F��\�D�\z�~��98�Wqd�g��ή�?��
5��Ct28�R���s�̀���Ң�����
#�ƕ `�¿��TR�GH\͢�C.i#�u���3��.xӦ�EK�S�)3�� s�0�}�Ex�ڄ�>�<�6�#l��MǹR�A�hG����HhFd�TVQ�e��fߤ�^֬�r|���b[�y���~K�_��sA�$����?@�9L�ӹ�O������+���x��O�&
a��8i����u�I�8��.���|�"o(|*�����y�`�=G ʍ���s/�Ru㭎v�g��4`�y	�E��S�\eL�����=����f��?�?a �ޖ��s2	��/��oCO�@?B�E	�&��)!G9�A=�+�� `^s��}r�e�RW�k�� D��B�2��A��.�m�e��ynk�x�Bv�95�3��rN�"5y �q�����A���jzۺ����X��9s���?n�K�����ED�B��GxN��]z��O�a[-�%o�5�nE�^<��(J��U蔚��g�s>Z�"��m�\����D�nM��5���@u���w�)P|>�۬)��l�Ge��q��&y�h��y��R�$�W���)��(�%�Na�"�9;�Щ1��/��'ݍ���4�Y�[~�.s�p�D-�t�!6�P}�֌cC��ͫgC��{B�rC,+Ӈ�
y�p٭�j��ja�s��e!��A��<�Q>I���]���Ae�P�H�1Sy���x�s`�X�g�������y�<���/ez� �g����"��򧽴�y�
�Ho�#l5qD#�i�`���@w�%-�%���l�Q+t �C��5afu_�yoZIsV��`�r��3�F( ��M������w����� ��x^����
��y��C$���G��2�!/o]᳿�.��w�	',fR�!O]ڀ��f6���H��&ƺU�!�@��-La��]��8тa�����%��f�4U86뀤&��L�h���lǧ;H�5�r��M�F��$D�[2 ����ȩdN��    �gI@~��<�T�j���`R��@�W]��t&�-�Z'Յ��g_ƉR����0�euͦ�"�䈊*����ql�[rWƼ�25]�����PW�����I�D�i��;�����B��B<�bq��ܲ��쥾�3J�4�a��\�HFW�� k3x�9���|�>��EGIűJZ��Lص{���e.z�nF3S���}g���]��������ϖ}���������'�8��߷0��B���q�k��g��-�N�%7�G��g@�(e�r��we]�롹˱̜qQO��H�Z�hi '�>�+������-�fA��⇵[���ɡD�LH!�rX�)��yZ��
��h��i���v`6t?�''6��Sʼ��� �:�%�|�Q��G�o��������@|A��~�����ő/�>A����k�UBր�C���ݖi3�(I&���1�,J���]םj�(�$D��C���ނ[��U¶�~@}��R繬E�����!�L��(�2 �sS��yaOP�ߤ�?���9'T�M8=g*������s��b�|�q�Y��pc|m{x��5�2=�5�t�G�����6��Z��l�LL-�<���R�֠�M1!t�L�/B���!�W�Rn�`�!D�Y_�S�֯Y����~z?���t�z��Wy*��eJ��p�QH����[~n�r��*��A��m1o��]C��r�<<��r��@篧��{�hﳾ?Q�&؝t��-7��Ġ��r�E��.Ԯ �=B��SnI�-�b���*��9M��b��,��u��9"�c$	�_#�7;��
.�Ē��>������'��W��nY/7F�I@'e���&2:蚿����J��]����hd��vX�2f8�{Qpe9�uo�����5����yq�Dft�mf�g4��M�nw��P��-�Mџ��/(���U%����:NƸ4nb�/F���@"�?��QHL�=qj2�T_�(��PG�"�ô��G��e��夈-[bL�i��r�*Ae�(��g��ߩ��Á�R�X�6��A<E(�nm�J���NBG~^Q J���|��W�eY���eW��U����紉�;j��n�+�o�M'����s;�0˽Ou~8��rK��
%J{_��|mb�XI�'�i�$��	�M8h��&���L�y��Z?��T����Hs�KL�ԇ�\K���_AR�+����=OЯ��a�M�x9I*@~�7"˩~�<,J�����%(�W�Q�-�l �Ry�K��z��^�R1��@�����0������̻�-YX�I�` dĞlO%9�
4"vN
�j� ��;�3/��Կ�(�>����#�5t
���e]� ����Ln�9V���>���o*��n��
��u3�+���i�b������ɋ��na�j��&�����ղ�,�/[1��!i�l+��*�͓t��l�Y�;;*��9���`��U5�kS������|X/�qj�YG(� q�uR��l����C,��t�^r�wЂ��,�0
3Y���Q[b�ˡ��Z�����rG��`�D������&[� 1 �7����x�D�K{���'b�!�#��eʷ6C�+K8A~	�g�g�%zS�&9E�Ye]Bl�~9Cn�u��;4HpD��B/�ɤ�;���;��q���9�����½�)��WD�8�2����p㮪h�����4T-L���K���Ӎ�C�Zٰ]X����CE����@���<;�D`�蟑o�^a'xu-m:̅����uZ�3F��+8��z��.Bp�Cw/�TlX�l&����/�g{S�޻�18l#�#����dt=tU�<�3�<SN�w�����AvTCn��!�����H)f�0�����<��6	.��e	}�Я!�BR�8KK_R0�y�`f��_�DD2�/��r��P�4=�={�zIRg��ܶ�)9P�q�.�C	��yr!r{�>�V�67W��@t�/�%ă
����+�;�F����.d���J�����7�*Խ�x+��2���?���b�C�7�d�� D4Ę�<���K�'�<@2��k?v��1B$i�R]͸b�yS*U4߅����PLB.q<tգ��(V5Q�v�HW�V�0�=�D������ �JG�N�8�ږM�S�	-�9��"w��FD޳$ޯ>1�;��]��3D}���F��t������ Ѳ9�@�-�Лܧ���L�p^7C{�O��ZQ�w�K���tr�x��:ŝ��򪽏�{��]�e���P��$T���N-�v�}��9��ъ]?*���ᅷ5�����������b_B0���?��2�\]��!�z�p!�����_-ڡ�7��D�h:��gBڞ|���АSu٢��a�W��>��{�-�0��f-q�@L� vQf񈒜!`3�� |@�[���O�N�7>a�lI�k��v��G�:�5��$n��\��z���&���-�o��<^Y�v���1��r_�o
�nC�������,&��W���7��<ԩ��kvk�֍��K�#-��(s+89�;C��V^
I����{X���F���9B�/!��l4�����>����~�t��.��m���W���mpfli������J:�d~�w�yN�w#��l{=���هx�{�,��CGrY/���l�"Gd7���ul����[K��MA��)�[���/�F`Ia_A?o�OZO�j�����Ȧ�S;$$F*y��`�̚�rPwd�BE
Tq<��y\ ȼ:�7���X	V�8��j��N��Cr��e!7F���F����}\�X6�;��J���1�����������H~'A�o�	����P���4��m���|P9WN�?wτ}+1"�&�X��\"��Jf�/�ۮ�����<ŷ��&pP�I݌ڑ�@�?�ul���g�U�Óp���jWŇ����3���{���ˋ�b��P�'P���_�<��oƆ�w���l��c��vL�T��Z�%�
�J�V/c<�80D5�.��]dH��Ӣmރv���)mʽĩ}��a��!=���v��&�k�2��O�W�վ�V�k�i�����'K�10 �j��%$�~O���"~����#�(�Ŀ��S�a������.�gh�]F	A�v�{��u�B�D����0�g���dY[�Z/�����V�eh�*T�+lZ��e�x7� o	S�[`�E#�kL��ɢ�>\G���̒n������m���sϿ({f�|o��
�u��g蔙���9%iqM����J�����+�Y*�i"|�!�BW��- 	��Ö 
�j85)��'�3^�$�,�%��y��y�K�g(�Cm�/��Pħ� P^�n�lVv4�t��`�S0:5Ts��A���+���c{�U���2���id�O����q?? ��!��
�rhWJ�k:Q(~kZg��������P���:��5X�~�iҶ��ԔO�/sFf�b��-k���ʵ��*�I������x� ^�c+��H���4y�O+t��'O���YH�_Cg�!�IL�r(-����u�!Fg�?f�����id\Cs���Rf���>�»Pq+��R�~!�tT���P�Z^m����7�����UP�)��L�r,-��
��Jsr�䷦����um�6 $����95Ow�u�n5�)�E�ްGs�A�<丑�b�ZY�)�O+�kװ�=oy~;���#*��A	���h�:� aJd$GBC�
�Uo���B����y�k��KEt<�x.�T���4���?�������\�d:��Τ�Q~��"���8�A����R
��2QW)Q��&w=�'pZn�3���"YR��a�^Z��>I�bp�].-VM��1��}�ҽ��>*J�~��^)$�Kv����e'�s��(j�3i�oI����!ϖ�N���_Cg�Q�G�0�	I���|��U0��@�"wcN��=
���x�r.���;� D  N��F���"���b	���!Z���;�aZ����N9N�D�	��2�K4���@�� t�'�|���h}���Y��չ�D�V��~�O������c����Ȓ����{����؈��F��P�n�X'O��-4��0�%I���?Xa��L΀�)rS!
�z��"�o�r���^���������b����BR2c���
�s�7�JR�����ϣ.���o�x*J"��`��y�+��l��T����s?��#X�C�Z�3N��������~Ŝ�m7E�w�&W���M��6� c��͔e� ��q��(�#�ؚՃ��V���d_L�(�hg��ӵ/,��� �ז���P��YI����;L��(�%���>Y<�����M:^b�C��ܵ���/!��Y��>�) ԗHO���䌟���50_��Z�����B�Y̥�-�ؽ�4��Q�pE�Z���#��d�ד�f�S���e(�Z�	<{}�q!�{����i�}��	�q%E��kA��*��_�S��p"��aU*z� &����^\��*��D����X����_���ʏ�PM�Ӧ>�UO�j�|�X��|��W�\\,]N#�09����7r�8���Y�������"q�����sX�o���a�z�x�݅#+�4,�ғ�n�O<vE�U���m#�X�L����#P�>�{VS��.�)Գt}�_��bs9��O�9�u	���S(G��w�k�i+�� ���{�B���[��������}"ݒܖ�
�P��+n|��N[��i`1�����!5���^��6�����Au���y]F�<�l��7:���6�c������dse��<��{�C�����i�	���E�ӊ�~�u��]���=�	&��ӯ��&���*�Ε'�4��.����S�ya��DN�+�,�"�K���1����|�%\]|��qr�oh�БG4 ��(�v�i�\�r(��r�nBN>�-ڮ�e�ڇ����dʵ����K�$�+��_��g4�w�N��5t
��݀��d�8�*UhӠ}�
��~\<��fW�=7�YT��ҏ�� %A�*yc�GE�w�	��)T����\���97:����q4Lb�Ӌ� ���UIx�B)�4^.ds��q�Wuu��3������/&Q�m�(���ů!��%��k7��|A�X���Rr��f�iV���b��@^/�y*�[�J$�M�/+e\k�`n�_����~��E7�Ÿ��O�꯮sD�S��nS�n��<�-�JS�ݣ>������	7�~#I� �!�����۷o��צX      �   7   x�3�tK�M�����,�4202�50�52R00�#lb\F����ɥ9������ �]�      �     x���=��6�k�W��{�DR�Qes-�I9�C�� M�?2�&� ��2����Ù�!����dv6��ş������^d]��+���_#_����V��8^Z1�a�&����#���E�a��E�s `Ep#����w�Ӆ�x��- ;&q�G�Κ�M����U�u[�m(� 9�!rz���nE��W"�=�}�ئ.pۈ[�,�5��5-��#[K�,`'�>�1�U����VTR�l��P��������]��v̎���D�:u5���ܰM]+����!${Գ�!fm�E�o�u��# ���+�~D����|��UX��Cb;�+��:JoG��x5H�j5Ô�-�#mǤW!VT��bXC�>�3'{��{`�6���*�>%(��za��j��V�^��9`�A�dm�IѮ����]�p*·��l��,
��k�e	��Qcs�%H��l��L��l���4�?g�〪�d�$��d+k���k�d~O'��,�j�#�����:�Ų))�G�X6����h(6Mq��&$W�5S�8���0C/̆�,���WO3ĳe�s�Y.�}��	R�����ja�#���Zx�?���]��݊�f�t/���7�Yh��f��9o�g�QF�[ϩ��$�J1�@RnSvBP�h#�ӆ`�1*�&���1��ì'�"mJ;�R���g4s��ڜb��ls@�4��DR?�hv
+4!�Ζ��� ^B��Ѿ�$�B�xİ��2�jtlU�S�ў�͢�n}'����Jɢ�~"�c��-�f_%w�E#�t�Yi�w�B��rQ��n	q�P���m�r�e��L::,��e���𘈷��͢�|��
�����e��^^���=�E�_��h����Z}/�y34�ӵ��cw���`D�r��ZٰDҞ-��-�[ə��!!طA���@cg��Z�S�J����'��7t|w���X;�y�H���3�P���x�b���d������z|���o_\���gv?����.�~�\.�Q�\      �   _  x��P]k�0}���?P�I��|8��:��ŗ��q�=���Kt��8X�p?r?�9���'�)�6z�[!�#0�0~}L���t��O�ٶm�yH��%��,$g���p�[,���{��q���!�
�
.F\�T���r)Y��3f�y��,�[H������*�چ3o����Lq����V6���s���2�i�����qe���f�x���S|7p"��\D�6�<b�c��"�@R^������?%Dh*�X� �,=Ҩ��N,@��ņD�ž!�	�!�B�B�#-UFY���H��9�5���1�ZYTuo��-'wh�\�S���Ve-�q'��:m����/����      �      x������ � �      �      x������ � �      �   �   x����
1D��W�NbN=�;N���f�v����M��=�-S�ٙ��ӵT��yW�U�un��/�x�Q�)�Q��5��5�!eL��A�BF�n	-���N�r	��NbV-��I$.��A(\�0��_����wʇg�S1fI�(j;�� �<3�<��q�      �      x��}I�$I��:�q�2�:����Kn�*#�	Te4�"����P�<1sw1u����)�XB��t�y�,�����_��_~����o_��������O_�����o?���?��������߾���?����_�����������ˏ/�8�9�?s�J���[n��ĵ$�7NK��r���o�|����Yd]����_����������o��߱��	�˖���߿�������~��	� �,ęIы|���o߾|Q��<t�7jKK�ӈ.�b�^#z������Jo�.��6a$��%)�mN��<���j^����#U۟�D.-.��:�f_��i)���Hj�v8�8B��.�k;�7-��)�$�}ɭ�D������%^�jMm$�7������4}�մ�F���᱆x�6 ��������$���%-���6�AԷlw����� ���a��v��@��J	�'\����2-�v��=�N;{G��v�K)��x1�@}>��ܗ���h�#��T��3Eޣ�/p��p�%7~&e�G)�ƣ�ӎ�^^1>�H�=z��MK����;� d���_��A8��k��@��9�-]~�iD�T{稂�4�cW�8z�J�T����]�)�w�05���)�y$�P2��r��^���������۝t��N.p�4� �/۝�#ąrju�L��M�&c���.�/R�vtڱ�\f�7<8*���S8L����{��g]:�7i�^�r{WD�����}��r�D�u�nu�Ĝ���ˬ+t�ub�n�{f���;S"�%]���[yM�%� N`g='�.���lF�ؓ&������8��Kj���C߁�� W��n�?>�ͭ��ۙ7������*L�U���1��L�;L�&�t�c�hՖiL��������\��^'29C�)�4�w��}"�:tY{����D.'f��:ѱpۣOds��L�V��Ｗ�D>�M:����{�N]�V�_\���@�6�.�	��DV�ZZ��;y]���A����L��O�u�a����Џ��i�N�Rr�I7����X�@�&0�4�N�A���Vǭ���K��Ocuf>)��z��P�h��t���=�eTz)�ߦ�:y���JM�f���i���3-Tv�!zt״i���q�!⤽s�w��X�@�e^Ծ��#`w��X<�f�-�5���F�^��1A\��쀌�Vؐ�)��H��S�����{m�̬ �t���~�ۯ��7|�mɷ�~��DL��"K����4��?��!_�t?�z��X�'=Rx�$D'Ob�7pU�e�r�$1��W�a�0+|mv�%���TFL�b����������$A���Y~oE̍�m��doM�C����.�XY���iӗMo��8�q�U�������f���v@M���Z�h~^CJ�R��n�z
3v a��N5��IX��&a	�ް�N���'�JN�[�{�ly-����5�؁l�D�n�9*�{t*�ߧi��@���.�[I�!�$�OS_�L�l
q�z����i�k��6����A���/�^�?F�Ց_"De� "�:�?>��sa�>Q�Vd�,R�����6`��ӪAg}=���4���嶘�D����C��A7�����]����n��G�����M4��7D�L�ك��Tk�Э8�����?'F�3��l���I��K��Gt��Np�bۻ�Y(��%n��O�'&�LҦV���Y�V�����>ݿO�b��#���wwn����(��&G�������kS�^�2��"ye�|����M"8O�.����D��Cgd���2�L]g�t_����C���z�������$��>��f�{��L�J��s�u�w�4���aF�H�$���^vwn����}��^)H�N#ZT�Q�T���%du$���1z4(�'�>�_vų�L���7}�iCw��W0��L�BO/s}&��W*���w�9� v^g6s2+Mw��[oLX8���,�/&����k<ٌ�Rc]1ad:�[rw���҅&�!���c���+�_=��9M�.�1�WP�0�[#"f�'��DP�XL��+(t5���hM�*9�q	���1L0.����NT�
؏�w�*�w8��X_����([�{����e����tzM����Q�	��<:a�OK���PS�;Ew��Ǜ��d_kf)�,��K�Ռ+3�w��&�Bq��i[������)����N�!)C�Kڸ�H�J��]����w�\��y���W�׏ ���1)�d�eW���i�Q[��!��rAJ�2}�a�d־�&_RGf�ƫw#Q�#�B��T�M;A��@�t��%ZxIh;ڷm�x
�W~�[P�H�:�w�0Ǻ��)�#$�ݬ_ʥE��s�>�~B�LJQ��w�>G�W��[iv��=j^y���B��¹3�!z�<7_��_]|]L�l��I<\�����R��2�.2\��x��Z�%ĳ�#���m1#�)����~F����?G�Q�*�:�L?F��>�y�
K1Y��5���"�3��Mw�~���7�Y]����]�#��st�^툞t��?��i�5f�:ޤ�K���V!o��4Qӱ�LA7��Hxc9L��=�'g&�x�w�6lp�����6��Q�d(��W��ǔ�ߵ^Ű�Δ:B�>�A^��E�!m�S���@��"�{|�3�8n�ZV���<z�gq�H�@��d]Տ�O�X�С���F���A�	�:�	E֝�w�;�9�6o�xΙ�����Z�@	M]�ve�x��YN�x�q]6Yͬ�T�̒&�B�Ժ-�"��.�<����\�I�s�kd��w�E���C2��ѳ3�Ǩ��0����;�k��cUyG����9��pr���Y>�>��o�^���Oos��lw2�������q[$�3ہ�9uW)��/jһ?�%�um6ɻ0Z�s����u�Y��pF��K�C-p��w�w�ާ�;�h���u{���$լ9��*YĻ��J.��j�.;�����V��k���QşQ�wG�BZ�\l���3*�V^K�HP򸿳�;�YJ��Pda%���Ϩ㺋r�]4�D�c�3
z���G7�@���o�^v�k��݌l�;�fդL	��;:#+��.Mǖ2��t��w�U��md�#i]�6ǲ.���fmhk�cn�6ōj\2>#x���)m�[xѳ@�.l֦�s����F������n�uO�b���*�!�u�~�QD��&�ݿ'�
�n�(�����B�����zW-7�����]ڹ���c��g�1W���C�5]W-7��zDG�!A��;~sݠ�z�q��)^�z]%��5z��u��n�Q%�2���~q�y8R�۫�St��]��N�9e@�\�$p���J�HBHN����&��%���ܙ���Z�I&���E^��'Co[�p
�oVs�=x�Յrrw�{}�m�i0�A��=�V�{�Q� �f�%�oJg-;
^?x��I�n�)P+Ҧ[4���kޑ���M�Z�"궈Z����E���2�H��US�b�Ƅ��;�0`)�S����O��4E��θwy�9�u�'�e����c,�^ɔ�e��.�xO�R�aBi��r��A
��R�[{gPI]���ϑ��]ɴ4��J�ӯ�8EvHr]��� ���{`����n��Q��6�N�`���]���ە��7�לA	����:��������Q��7w�ɓ;P�O�)�MW*�H�\���(&���i(��S��~=� =,��J��_|���}W|�����˰	ٕ���>�{˚�<r_�b|l��y{W��s|�ɍ�%��8�	��w �
��׈~�ճ1��P<�^�H$�w���T���P\Os�P��޼PeI�,H�;Y�1a��M���^�&����\I�V�7j�|�ǹ!x(Y��Y4��J���Y#t��nz@(X�Z�����NJ�ꊄ
��n�Y�$c�k���p�����[���%��q'p�G,��ПP�����|�[�D������5&�?��+1ݲ���?�ޔ ��XK�L�K�h�    ��ۿW�������;�����o��ϯ����_��ͷ�����(x��4�U����FRԷ����\;����q_1˘?�H����v��0;��"��5���|!�g��P�1k�L1����Cp�&���T)zL���^�Y�lt�YL��D� ̋iTc��������f�����I�$|� _5J|�P���}�Lu�Jl5�F3y�4%]h���f�O���D�i%%ۉR9���>����WE�A!S+R��Z����:�;��0��2��#��=��x��N�-%��k�"�k��l�VM��z_#�a�_�E�Q/�w����^���S�ss�"3H���ǩK� �~���'��#d�
�a�a|@� b��(�*ѭ��!�EȌ���N��Az��UH6A,��s{"$2�i�����a��"�Hkӑ�k##���32��9���s�~�H�o�5��q3�6�T�"�1�W|sD��2/���Ȃ	�M��ʚ�"�(؂�������9Ew��i��>�����,�Z�!���Ib����������}t�'H��G���G�%���9�"�'�}7�QL���&�mZ�K{n�����)��5�{Z\o���""�v��KU�7��]��sZ������"h!�M8�Y��w�q�s����H݇�t4j5��ʬ�}�5��:�����]0ŏ�KzhԜQ�,����rL�C�fB^�z�xz�Y�L:��K�ힶ�5S'���!����$k�c��8���iՃ�c�=���v�?'� �K�1��[A��Ȼ�Bh$աֶ�]'_s���^��\/0Cɾ������3��4u!k77��O�(C��ZӶ�+gr���J���L�4�A�]��U���3-��Kؓ���svA�pl�ٸ���[����73�Mc��#�l���d/�ޗ`��-�Ҫ���-<�t��S�=@��e�r�ƃ� �e��-.jim�h\�O��N˭��8 �[�G�焮���M?��#�7��ZPb�R�uk�{�68$Q�F;WP˂yT*Ǥ�i�Җ${~�rLy��-K�Bn����11�jA��}U9o���W��H#��K���yK����5���/#�O}4["�|L���X�̱6x+hㆋ�f);���l�J�P�֙��.��1𖤈��EJ-wK I^R3[4*��L��R���}hYEZ�3IxiIT(�A����>���*��kR�C!�Q��rG��ܰ�ZÃ{���n�>�ƛtH.�L������1��Q0�� �{n*�$Ǥ<��^�/�kֳ�kX'|��t6�4]���wW{"��k�d�!~!���<�zć��Tvȳ���9h]n�q?�l�m�f��zzs����Ľ�d8QJS�oӽ�^y���X�1��PKm���7��Z��rn�=`o	�Ջ�H8v��n��"|z�(�f�y�t�P�0�<�?��/Z���B-��f��M��;u�)U��cR�<A�_e �"�(U�7~��ǶW&�6�+E��%Z�!52�4E+Y�͔$��N����殬���H�7���_�b�djі�!s�ft2H�BfʽY#�<��nM�%V�c�7�S*Ly��ll��I�IOK(s�Z�CX�Gv��C��	޷��mq!��XO������̂d�C�(�'Uی
�4����})���'��X���~|/M�߁`�,�"(~��8��!A��o9c
Mn+E�Ζ�(�BTn��S#��k>��g�o������I�> 5��%�Z�$�݋ڋ��;��J�c��֩�n�p��8�#
d\�����U�p������:2�>=�;)�Jc?�������A�$`�>�����u�Pz��FT>m�ş��1/�H�b�r�Ԋ\����+؍�d�tf�kϨ��|�����9#z�؅��yQ�VQsœ�����.Ct��4��+;O�Q9�2!6���]�Ą�����+�(l�h�	�O�'�J�05̞-�c��#��F�n�XGB����~1��T���HQ5�s��/�xĵt�5�5<GF]������h��I׀�kx�:Y:����M��&@A>6��&�1�L���	�Y�~.o3�.���zf�It�$ָ͗�b�;��fs�޴����1i�f6�Lr����;����2�1i�K��r$���>C�ԭ��d=&�V�{Nkba	~��[���o��%I�� sv����\�r>&�q	�B��c	�����3��:�%�и�&d{�h�U?�bl�RI��T8�	��H&�_��R��a�q�r)��".t��e�����޸�Fn��[�����\i���|׮hy �������B�f��ۢ��}��H�^���f�Ʉ$��o]�u!ro�@j>䆴�,U�g��`�3���w+��7��$��e#�a�v�~H��LgD���v�,UFwD �{*�]�+��ғ�Az�=����TK��𽴨Z����H]K%�/��G���i���Rl��r:��{:C�U�!���������!W�%�wࣛ%�)zݖU}& ��1鉓�M����(u��=�	ZӶ��N�`��cӑ;��Ĩ�w���Z؟����פ>��B�K�y���V���2>b�%�gk*���~MhI��9X��j30eB}���<�Pʜx$�8H$�qt#S.�L�3�v��1|�Fc�v�~ץ�Er�^�cXǌ��s�l0����K{y���JV��?��w��K�W��d䥢Wc���쵴I�vwx�.�r��H�]Y9{}bd0�!"�x7�EWW�+�� ��IC�PC���=� �=$37��F�>�9����s�HIx$��B��ݣkN]7�.wMIޕ����� 7tӾc�q��C�+�n�İ��ܸ=ɮ��>��9~!�^��P���&�����T&�%�W*�P=S���{����3��k���j�۷�	����I	��n�p�t՝��m����:�v��-���S��T<n�m��:�Q�O�B{����1��]��r�)�E���������K�b��/8Z�\
�{P�{�h����#9'o����j>���|���K�� f�����@5:�����+��/�7y���s��ň�5��TM��x��t-���^U=5�3l��~_�:�lC}��+O*M�[�W�Eb�E�ͺ)̈́(�j2�fގ��^.���o��yi�RS����G�v��|��H�x��)=R��%�.{	=*ME�~H�VN;�O��ZTFҘ��ٱWa;�$�%�4���.��ے�H!�%�������F�Hk��Z�U{�=��[�QT��A�)/D��n�c�Y�ICKˆ�9�Z��]�,�;i���-��T�X*�<��R�����ٰhӨ�d+�!w�O��r=2�bd�ڵ0�1i�Ƈ����Ts�:KL6�m �+��xz�c�/�Iގ]�|<
�Ch�p�ٌe�B�4�~uD��n�����jn#���&�5�%j�N���/��Sm�(�rLr�[oW��8��w�K
�O�1Y��	��{};|�K��M��4��[�bl�#�MR���%�4�!���"+|�αhf֟�|���t�w�MN>:B�ҚsHH�_��^�9f��Y"� �b����W�5~|>i���w�D��8����\�j䤫K�&�tLt5��[}]W���K�ȓl�Z0i��"�%=���=bo�Av��S<�5�Zt��}>�8n �/)�m��k�P�ؑ,g�C���v9��x�|�M���T���X�'1�ƌ?R�w7͈�d���О�c�DG���-��bM����fx�c� 0��R���P�;�{NtL�qW����e����B1W��)��6Y�b����~�.{�Ëۑb����S�~M�ZE�i|�OZ���n���Ȼi��t�L���l�Y5pҵ�+���hd�:�o��;7��O�9�Q��C �H�UN��)�C���ϸ��7c�����1)�¤�f�񷥶�iGri�D0\�l�MPy��:{��5�޻�A7n�E�ʒg��:����D�ӎ��"={�_'�X?����'���C���@�qM �8nI����{����,D1ML{�4Ʃ*��Hݛ�#��D�@��#��e2:��^K~ �	  <qN[/;�C����1i�^�{�����3���Hy"��=�uX���D���X�����y1�qH���ߚ�\|t����N\-�
�-��Z��b{��v<'�#�;�SMAcf���2>��W� ����	���S<l3��=%�Z�>� ?���]tcujn>����&^�C��͓�]��	}�����5�@-�W64ܪ��m����Y�X���1�ο����tvw�,���oB���;�%�x�pΉ��'�Y�2�y蜔�[��:`:�l-�#��Mw�RJ3�8~��#��{aMi]#<2{.Da-q�zGG��iMޡf��l�n����$�������[x��r5��x�� gU�C�P���s�л�t������F�]���MwJ��I27J��S��~����(E��I?�������7ʈZOMaX�ƚ���ʚq �>H�1h	kϩ5��:��Q���̅�Ya���2�	�H�&ơ�a�sL�(�~�yn0�].Cϗ��1�W6(�b9������v�{ȓ+�j��6G���ϣMQ�i�8ݠ.�[����Q[�z��㣱)Y/�%�<��Q=��.դq��",��`�}���������0*f.��C��E�I�����Ic�o�C}�Tn�U4�_j&��!�h�03=��=W�"�ǒ�-^�F����Z�%d����h
<��2��tF葽���߽`���~l�İk�O���7�3Oo�������ˎ|c��J"jǤ�~�g��^��:ѣ�?/�Gu�=n���x�?���l�r�dC:�x���~D?�$�rgjIc˱^��������wK�R�I��.�zu�
�}N!��c���K���ح�����bIcJ���O������k�?Nu4:����Xzh�^EgÍ�����{��F#�Tû�`������z��bv̷��J	�����'f��)`�3�1i�g���9�;��8Qtw�"����4w�6Z�cʘ~P�Ik7��{pR;���L����&��^}�Fj���)��U=u���Oyu�6dI���.M���n����;�;���G�d����Z����U�.ahJ��lB�K��ｕ���x�ZP�d$n/���%C�0����@�.U���|��E�.«�'���9{�j�I�9�v�Z��;ݽ����R�.LyM��T��4������2��£����I��/H#+i2EKN��Wf[��+�������,�omܓ�霏Iu\��MH>e���!i���lq�d�os(��f*Ǥ�ou�l	��d������?� z&}�EM�9o��P�I��g���k�������$��b�\�H�>G"	z,<X
mf�I�<��f}�nP/H���e6Ws��P|��3�U�4�d:�y�n$���]B[�c������a	�.36(zLz�X����N�M�M>RM�'��A�uZ/���Y{��i�!ў����%�3֐|o�^��F&���6������T�h�� p�}���s�%a��^-^u���(|��J0�/M�6�j���|Lڿ;I�J;�p��7މ6�����K���]W(ygd��cR��O�d7MӳI�]���i�4�~2�t��ًe�I}��t��T���k7���c4����ԟ����?�,I>�a�{,-{{���D	��b�e����x���kC���6o����3�i�̻+����J�CF��H��܉rF����M�d����1���'����x�RR>&�U�NtPRH���D�5o�N������x��K�f.��$^�������]o3����bn�k��Za	�\$!�J�Z�>#)}�x�7+)g
�����y|��f+T)��9j$��+l'vE��d�����|�����ױ�1�����Ͷ���Z��X�BR�i������mAӍ��=.A�g�+� �IeP~P;9C\��$��ރ'���%��)[F��o|^�ImPH����%
�l�-�*��!v;�v\.��K���4{�rLz:�:�Yq0�
X:�4=-�
��/�y�,z�ȆF�C�3������l�����6aṁ���P�"Șo=����&ͽCF��kή���1���h ����x�A���M��I���ݺ�g.���x2�,�)6rL�|6!n�N��:�1q�I�(�-.}Kh��I�Iy�=�,�TG���#�hi���$�-T(>��4J��#M�o+��)K�O$a?�C��rы2�����y�}�\*�6H�m6�F��K��E��<�����O$s>���	]��q��6����W�G�cpG<���|L\�Dd�,�٤�%�C�ө_���[��{O��o��_�F7�^)yۯ��e��Z�IO�p�p�-A�e�����3e��t��`�20�5d�щQ�^���4>?��
����|Z��ng����tm�&�[ƥԵc�{��}H�.�ӟ�L}{�      �   �  x�uU˱�0;KU��h���Z�����p��gg����H����f��6!�;�]�F����g7�B��P��-�,�AZ_Xސw�v�9|~c�X:GN��=�]�I}mD�Ј��F@a�?c�u�=E-�1�(kO1�Xc���n\�uA�(#�"�:ZT��Qڌ�,r��	-��2҂�� I�&ԩjP��/��r	�T�-AӤ�po�����/6]�Pt���	4v�~(�-�-b]m�juia�#��ʮ�2�e�D"�؄�"hB�;�1�B��cC��CbĜR{D�S�×u�]k6�z��!t2����P�E�w�����\���I���W��T��7�1�\�JLP�ǻ�R\
C�E������1�,$��e����Kt�躇@#�-��Uy\��`��b��J�b�hlȥ�����H��-���5V���f��g㹌F��SF��͜��Sk�(�9g�M4����Υ�ȰQK�#�-[ �F\e�y��#�si�{��\�O^e;�C0"EN��w�>���k-�`��{ȻV�9��Nv�-�e%�2j�t,8�{ԗ����̈�$da'�>��KJT[��23b`͗�D�Ƒ$����Ɏ���������QANs14񆐱��YZ��P���No�~�����!X/��jMI�Go!�F��J0��      �   R   x�3��46�4202�50�54U00�#lb\F �D+7*7� Z�	H�%��M9Hq�X=�7�'��`�Ļ?F��� ��CM      �     x���]r�6���S��"H�?9K���!�3�Tn
^\��H� �HX��t)!��)|9B�)�E�����^��+A'�$��Է��(�9$�I����-!� �X��ף�$��A�)����[j�1:�X�E��,�[����;�9���������Մ�P���ۙ��Y�}�z�꒏`�ƺ�����)�����$���~@��qk-�����W�h�`\G�
��
�� ����ƺ /�Ձ�ɺ 3g}`���.���Vκd�����aA���m�7!+�u��ͺh�.+#�u����	>ξ�9���P�%��Z�he]r��L4���V0(�rY+���q����	G���� ��GhM�6�rr�r��i�K(���L(���Md�w�N��|�D1�}�D��v���[;!��ķv��Ÿ�����\؉�v� .��z� .��~�O����G �ҍZ��%7n�в�>��a!��!�a!��!~��n��gO�v#�P���t#�PV���x��x�F*P���@9ˮ���>n�搝�HU���H����F*���Ɔ���F*�uq#U���iZ�w�Hæ��iF��i�nۍ4P;��2�2�[-@<��21-\�t#�?0��d�&��3Y�&���3Y&'�����L^��D��9�ez2R�f�v����UP�%3A�`�|ڒu�2Z@��%�e���iL^	�D^%ף��~6(�ށ������#���Ç�����-��>��}z���Oh1�=|�P|z���9�誴��� uN�v:���x��"���_�H�`שuK�N�["��v�����D@�Ծ%����-(�4p����E�o�pۓ���"�J���E���vq`|n0�1?�0@���E�ٴ6�8��O[�h>�s�dIQ�jr�-�dR~�$J�V^�eH�Z��dϫ���԰��q�G�	}мe�GW�h|�0YJ�'oa���OVS-2Y�����`�v��U���J�Ч�5��ǕA��bHs�%b�A���&��?e0?�5ː���0�m(�O3d��4� `;�3H��R�8�L4H�A.��)v��9� %���c�A���L5H���;� t��l�u!������48~�F�Gْ��?5�2B��(��u1��1�~�Ѳ)���h�}�O������+���_a����ï0���Ư0ZM�ƍ_a�:�����7��ưbDO��6,�����eX�pP<=��Q	�`z�J<���
����d�q}>�w�
����e��� �i�A���ݙi@�g�A���z����5� ;�=H�wI��i�4v'��[�A�����k������8��C�;$���lul���Niٴ�ug��0+P�;;�D:�;;��=�z��)-����ةp��Niu��m��`0��u&|�r��)1 =�ʲ�Sb ��1� �^�(P{�P��2 ��1� �^�(\����s��"��9FI����1���>�()j�c��Y��QR�纻���>6�}���w�}�{賯/���e~�5B�M��#�\�7����@����&���L4�{���fڍG`�p��?=�-�q�-�����&�3���$0�`x���I ���}}m1 =���I`����k��������&�ֳ˿L�g__�F\�}��I`��F��)(*�T.�(-���r��2�r���I`�q5g_�0	�X:k��0%��]�o������wLB����c�m9����� m�g�      �   �   x��ұ
�0���)|���ҦꦝDG� 
�B����:��2����Spt~��"01Ud*��n~�L1(d8�O7�PD����ư@k��]�L��}ᠢ4\�T��n�$�������دLR܊��[ƿ�j��iC����n�ԩ�u��/�7y�      �     x��T�n�0��_�H ��\y��9��׬�M@���H�0�7���]��%-;)�� 2����l5lr�qt2!�3AS5�]���6����ߗgq�@s8X�=�XP>���\��d������S=��M(�X���X��EҤЪ}4��(�(/�}d_ ��z�h��/�;�f|w�Cע@L-�����"zE��+�XC����g�R�U�4��ԫ��	�D���7(}�U��zvm���
�آ��H^T<�5-ߗ`��v'MBH���32O�ж�pH�x�6S�8�.�!1���v���D���T��������4�c�ۑ���2������ߏ�&�=�J�=
���Nl%�p���pq[P�����.����dtY�%4�	�A���4��ϱ��`\���%��7�[s�n�`k��(Hw�An�lMZ�2?��dG�����
��khV�L��pi.����n�j��H��nي{�Y�,E���H�\q��v�	E۩�@��}Z�ӚKaHW���%�\���f�bH�T      �      x��]��59R\��Srf���X�
�`f��f6 $�x|"��9��OROk��q�Λ�Y�kO?E�O�m�I�����&M��Y������u�!�Wӯ�#5�ٞ��������_��o��?��O�.�.b��,�2���q����'hQ�4�t�U�<1��R�Tmh����E"�"%W�K�����d�d��K�a5����D2D���N"ua2��~��(�m"�hz��1���	<����M$B�H���HU��H_�r�-	�ǺZ�$$�55Y�cLD巔�4i��d�萰��.��٘`?M-:�hSP�/����J5~E���?@�����Se�eGd������,{[��ᵺ�h[��*���G]v~�6x���W-iU����7��bҟ�M.���"늕��l��ڞ�M>��TiE��Pe�Տ�,�Ue�68���J]U6��#����m_�����ô��G�c��'ǟ����́(�̐Fy��gAl19�e ��2oq��/�:�.az�6������Ӳb:�>r��_��ZK��C_��o�Te�1��
!��`H�a�ж/��T�/&y/�K�y�)*��IS}�V�Wj�R[�}�HJ�Ped�z���|��Va�<Z�6��"Sܗ�����Q�$��Ж�-!Z6F�ѭ�P�����	k��@��R��M��u�)�"u��FU��F@d�@�l�԰)T
lAN����dS�Ц�Pٓ�4�ƨ2V�"L �F[5"�I Nvz=��&��D�Y�����>A��$�����6?�$3$�~��Z��C�\���"(��'�;Sa���A��di%��I6��{[���i��i�-��v�-���\�ڢ`R�m{�6�������z+X��䏔~������*�R�tF.�@'��JC:<U?�Wh�����k�Y�NLt�߂
��h(���%(�
�I��RdL"Y�D�Ɉ�G�)= _�ގr�"CS�wd~��u/qѮ?A��դ��l˓��J�xd�f�m*p�A���`§��,�p�c`a�=A�
<~���!�}����*A/G��m"���]��<��Yd������xǐ� m"p�A���-[?�/��U��r�d�������`ޒ�A����18���@��E���E�L4h�8��r�6x��ǫ���Q�ME=!!�­S�K��D��c�H变k�4Q	o��j|A6�n��+N�!c�21�X�< �zmg�8����tQ�>��2MЦ�M�x�g-iQ���<kt�M{�6p��+,æZF<S�1��������]�&MV�g�U�~aӒ�r}��'�{]����|D@l,U�<A�
�$ю-���������#����M{"�d��M'T��*3L!XY?@�
�D�UlT�T��&*��d�m%�{�YhȆz�M"8nY�����O���ڞ�M�,4dT4�y��D��eNL6�	�T`�BCFF�i��3��\4��rhG�eOЦ#�7Ux���E�J�<(�6�Xm�Ц#�7Tp��7��	k�b�c��'��*�a���v�)�@B��`:Pʩ�2A�
,�W�8��2�d,W��̊�opҝs�
�2Äy���re��R���[�!(Mb[�=�����{ �'��Y4R��=�CqX�Ц�7
֞'����i�x�e��8�{�6�0/�Y��鞅*��yq7X�K��T`�����g�,+fUvC�𢺪LЦ+f���Q㊡r�� ����[5��m*�b�}���*�dۨ��~��<A�
��y�*lX�*��ʫ4�nk���U%KeއJ�����/�ni)��m*�b��BKV���p*�'5)��X1�&�2]��*m�*n�]�Q�	�T`ż����.*}��^��H�OȦf�D�RVo�(m�����Y'A�ڲ�9-T�ґK��OЦf�D-ˮdY�h�?�/�C��`�����r^�e���=4d�Vʺb������|��_fcE��;�#u��	�T`�vz>��}y�ɽE�� T����*H����Q(��<��<b+]b� -OЦ+6�|��Xml�b9;�Ƥ��>A�
����h��t����i��(��GbO���$��D9vcM*Ӛ++l�"��=A�#�xY"Q��%��P�
�i���*���xY"�Д���BmT����d�z/l����t�'y^�ԃ.0D���`���NKi�'8������ꡩ���,l��v<���GO���(3��Ye�6�,+#�������
���i�>A�J��2���8т{L��1�!�� 5� �!�L�u�kL��Pv����%��B{d�_T�E�2�J#�9U�5=/�[�;����Y���Z�R�c2�Λ��M�Q��m*�a�Eg�6e,v	e��?�;�)��m*�a�E���Æ\"�����̀��Ձ�?��hS��.���-*�P'�X�!�}�6�0*�����Tس��U�
=3��a��+����Q��M�AEŮ�"~���TM��}�m*�bTFM�d)ژ�'��"����U,K��l��.j�&9j`_B���:�3��_�����Q5lCTQ���ZY�d?��P4t*6h���FE]Ĺ��8	�c�I%�u�m�Q�����;����Q5��w��
w�_T���KlI7y�6x>�"��]��U�{�?T��8�p�z%avPQ�^y]������m�b��"�Л~�h(�_� �	��1!Cg�=�2͒���;����UJ��r�n}��G
���Ue�6�9̙*=���R�Bg��f}���Ц?GJ�����Y�+�;Ǚ�ry�V�OQQ�)my��*ъ�Z�-j�6x:�"�T�c~����8��Q,ɪ2A�
<�H̹�H�Q���Yį�t��A8�A�����QAM��� I��T�� �78#C�L��R��A�.yn��'hS���Z�E�S��|9�zs&�E
/i�Ц��?�J��d�K%/T�e�X�R��M��JQ�U��?����d\i�v�d9�"ծ�����߫�����W���+�|�E.RӘ�$]���,&e{�	ZT2������S��V��+?-��/Ц�G]�9�Y������DfC��m*�|�E� ��>�{,�x
"������I?����ע?V�IP�~����5���T8�IDaZ{�GTD�"�����wR��Зg�$y�g1���g�����|���<A�����<�9GJG���l���\"	_ڨ�a���mO��H�{E��å�r%�eo,�ԯ�K�j��Ц±�B8��#��LT~a��N�OЦ����*������R���ޛ=A�
�ͨ��RSYT�Dŕ� �jIv�����W���T@phO��/	𢦗{�F~�d/G2ɼ����\�|e���|S��.��F~��o=]ã����}�+$VD�̗R}����E�4t���O�$��U���>5�W(���	ѣ��l���x�\A">#��,�6ʵ���}r�%n������������y��a:��{�}��g���!�ji�G�(k�x]A���j��d4�Z��~]c�.P�/�>n�|�%W�{h2zo�����>�K�>w=|Z�����b8-g�c!(�_�H4y,k�@���v^#�eyw�,���,���fyqt����;H�Gywx�td{�cz���Q�ChE���@�"�7G���R8������^TT���o���yg$�g��5�7�r&q��s�D��,R�G̑�^�J�`c	t�L�0K�tQ$�P�o���Q��IXޔ{d��ƫ.ҏxu����z�I���Q�ϩ�4��.Qq��욿?2��6��}�e�_��'�A#�#��Ta����?6w�3��C��O��E~TV� ��co���'��ycN�ju�=�ӐJ�e��d|���G)���%�oed<��P�����A~��1�%�$�G���O��d�<�9���3-��������AW�'(��y��Rz4D6	$�?�>��؁|��W(��{�E]Q-pB��7�ϵ�b~��zr��>�@����p_�m �  ���Tҵ>�mB��q�-�	
�����rX��1��g���_[8�Xa�<A�����`j5��I���#䧵����(IPfXL�R�6��ى�%�<A?�I�[u����
��[ʑ��xrI��x��G>l�N�������'���g!{�.T��C1��8���(5�,�+�����ǹ%姁���Ş���2�̟��v&����5���@ѽrfg �*��Ɋ?l/����a&G��3���i��y:��1�(��A�A���2��'h2�/�N�^�įc&1�����4��}��uMKa�_3����Ty=�8�4��ba�ٙ���Ws(��]�8	=�9jc%yM�Þܷ�zU'�ǹW��yʧv�_�ԣ
���P��J���;f~�o �~��_�~ݠ�A�_�S��Q��'<����7���&�����e�;(��}Q�����-�3<��i~u�J���ߡh�캢D�J�F䇟���I�y;��mOP�gF���O��� H�/Z'Ęb��;(��e�̡�?�����2��!G�~M��ދ9�2�F�$+?���Hے'(���ep�9�?{�9�Hy�3�no��д>��w�L��5��&Q��;�s����?��!?2���_7���`�r�{/��W;l3].�
��ݙ��nw$���
߂D�J��}����/�pش\����E��[55��"��7��Hg�mG��P�-vRQ>��a�M�i�H"�+��sQ�ظ�b�g���&ӁG�����[�������OǱ�_e	�=5�N�۴��;-�C�4�6E���a~?K�q�H����@R+Z��8ẈE�wJ����I����_�3��������uaO෡If�O~ӥ���;(�I��8�2�=��i����=����&O����Q8��[�����"	��s8�g�P�^�EQ=t�]���?���^�!}KK�~v`ལ&�Cf�h#��d�G�P6w}�?{#�^�{�?�T	$�_nH�2X�H�'(��?��L������`����n;8�Z�-���?�ؗ��Hz�8�߬5��^Pb$}���>���{}����T$�0#�d�E���Ϧg�y�?��[���A?�<�	
�lwV��s.Ig�l���7&؃���#���l���l��	��a��$�<A��;�;v!��MT����O?(��#qy�.����{I_#	۾�l����ߠ��=E�0[�{=|=,θ=b��[h���xҫ��'z��?����aK�r\�����J�&�����B�ϔ(��M�Jh�[�2Ị�<+�?��2�d��S��ޯ;��P�6�ML�.��r���!�)���d���6�U�B����B��K����a��Y=��s�}
�/д�l_�w���\?���O>��8[�jy@bh;����pV��F��c��Jb��~vf�f�<����M��	���bc��@;<$���nqq�4,�9�T8�����PL,�]�t�7�$��Q5[���.�(�NP4�Gâ���>��Ixm�_L��Kow�|��6&j���Eui��ݢ�uؓ����[I�_b����u9��(P�t�� JԸ
ݫ=��*|�@1���� 3J/v��+g�H�y�����#��F������zU�$'~օ��������	
���u���yMz��X'�*�gC9��P���/2���آ�R �Hb�χ�4+/ȇ�m���aԚ��� ;�+� ��ך��˚�-T"=G��[-m���r��x��l�������o�`u�����@RY��~�㭵�����/�JZ\|�5,��#��Q[����E
�T�q��_0}HΏ��_�e��C����~X��-M�9M$LP�9G������? �~-�Ï�����[IPۗ���Ὠ��ϰ�ʯ�]���g�2�6�m��Ȩ�΋�atn���ũEB����?����-�٠���H�r��^���?���H�oF!a�]�������4�sv�`��9����5]��а�_k�Rf�*Y<��O}�h��Q@9���7�Vly�:��� Ǌ۸���@�)����X͆��@�ʼ�n<]��P������ui3H!���?��Ҫ��~N��`>x��7֞�^d�Ӄ$R�}j��P��h�$���S=-]$�WS~x���z�/���9EDB�ƿ��Uv�Jd�+v���?9�o�h�P�Ԩ��6��fG*����%* Z�p�3������|���x�.�a"
T��
���ͭ��ře>~f�-�<AA���(�P�[�"~�qL,�4��8�>AA��D�`���Ǘ����r
��� `(?��F�Иb��!7Wֿ�d���I�� �!P)�B����K��Ȣ��@,4����
��8��Sl%I����_�D��z�TϾ&��豝�ԛS��<ߐ��fY�>AA�����!R�>d͑���0"����=�	v6���⪴�&������>�E��vyp2ꇇ��( ޢ�h�B 5�J.�<A����G@��4���Ǎ��͝�R�}�|��.���Gj|���
5�#��	�\�¹��-�;((p�HO��������ҳ�{hz1a���6"�d�i�X�V�=��-Ne<����]��&��Y=z�>�q�v(����H���o�5B�����+��LI���ʀ���cR��T=2s¼�#vU���~�X�k\$�԰���>ߪ�����	2 rq��m��"�����E�6=�
M
��B�i8���I�"�CuW��r�j�f˜7Y�=�H��Ğ�͒=AA��Ftf�3��'�Y���Ԯ��P�ƶ��Y/c�)L�;�0��2�8&?��¯ny	���	
��j@`*1XxcO�hq��r�B=��h��#��jtf����4�l=���5wӚ�=��Fg.��������"�h��������b�`c��˥4��Q@�D���I�����83�]�{;8
��,(����tZ~�� ��)Pr��ʴF�?I��Cq��]�t����pQ�
yZ����o�o��
l�f:s�טb���C��5D��P��G(�� �r=��h
,ÿA�<w����|t��Ť��ĳ]�/%|bÞ� ��A:s��S���6�|:��P"��>AA ����5�v
�J<K!#��O�����B�M� _���Z���B����5��V$��	

p��\��N�0B�b��~��}��l��͙�\+��p-�Te�1�ɣ��Q�<AAapH
E^
���G��)����q��t��_�Sk�(D��y��*����p�������s�;7�8���OZ��J���������W((�����j��B��MP�b5^�<A�9���?���e      �   L   x�3�.M�I�/V�TN�I,��/�,UC��FF��F�HL.#N����̜D��D��D�h1L�1z\\\ H%O      �   �  x���Kn�0E��*��"E�����u�K�q\Ǽ(:�сe��(�{ȣ��&�Wʯ$O�[n[��޺�(/m��R=�ȠׇQݸ����E��?/(򔺩m6�d���]�݉�c4��G����摋m.�G�2C��R]	���� �ݓNt#h1��9��JÞ�7��t��\H
l�8f�5�H�{��b%�d��]aJ��9F\Q�K�*t̜�q���iK�O��c�e	�!�X.�t!Bֱ^2�K������rL�1�7<�k��ջ��=Fc�����R}JߒmR�ִ�#���b'O��^�x�=��'�mYVii��(/��W+y��(/y��!�9�18FʚRO�b����z�c�jV���Q���)��Z�!oc���O�0e�Q�#������}�
&o��js�3֒���yQQ;s�a�L7��w��?�%_�Q��^thI�^�nXp������M�c��j����y��v�)��%K���3�"�;�N�|�#z%:G�_�dGț�dL'�G_��%#z�	�>wY�Rʚ��� ����_�܎��g��q�t�����w={։~�A7�z�_�ܛ��G3����+�/�ˎ�����~��҆�)Z���3򳹹�i9�@��&���QGc1|�&���FK�>�z>��m��Q����?H���D�������s���G�M<D�w���������˂_ޓ�!��s_�������}�2��k��O�s��4�*Rľ�A�����>7�G��<�Z����r@����_���E敗�Bl/b���#��^b-��*�p=ԃ<�lilRW�k�Q��-0�;Aн��辻=��7��dYJ���%FؙQ���u�Nt2y�z�9�iLƵ�c.������#э ��+��%w@�W;�k�W���-ֳ~E�����K�ϑ?��wOG�н7�G����7��k�n9{m�n�b���g���n��_��^	��ߢ��Ϫ����禎m��okDoL��7��A �����lV�u�����<�G�����}]�D�gMt%���Lgh��?s0�Z�OkT/-ާu�W��2o�{r��)m����;ٻ��Bث捗�F�R�����>o�L/\����A����ygz���l����eY�Y�n�      �   {  x��X�NK��<�_ ��_,!���CЊ�HG��=�	�Yc�I�f�a���y�}��������DB���t�������d�r6���]m Q�˜j�M������ՔKMja\H�I.o�l?��eU�>!8WFkɂp��j^p1�bHŐ��0c�\k�����,�'ǡ	�r@ޅ�|UO	�q&emlc�Q5��&�`���9d�|�_9v�1��cZ+HC(��E�P:,�	:`z����JK!�Zc�q�lA�]���O޷~�Г��h��O}��k����/�oo��hH�p�Š\�1+��2���"����c�v�iy^=��҇	ܱ��?Z�]��?���~G��\�O�����;�{�w��ە�~��ñP��)�%N
Y9��2XՐ�d���k�Y�Qp���s��N��KϦ���#�:l�Ў�����K<���麅4���
�ڏ>����0]���r�W�	�3R#eũ���.5���X,:�`�H�P��ٟ��}�;޿ǲ�����7�����˴��&ax�C����4F�ɸE�k�|��<��U�9nG��׈�s����+��(��w�-���S���q:��c��.��s��yN�EH3"u�9Nh����R'�m �TY7��rg�N�<_�x_Wvf�f��Ͽ�u���#C>J7T��Z&n�b���z(�d�3n�I1zc(���ڎq��o5�嗒�Ig8,t� �f�Bj��CĠ*	��6T&��ikiJF�X� �&XnB{E��W�	�R�K(ǟ�����<y�~��Q3��p:�������	�R���@��Q�L����G�BT��-���Ȭ�=L�暆t�# Q��=2���H��ĕC!��*�@%�lձI�����$ZHJM��d�wu�PR��Z�BD%&�q�����?�0!<8j�u鞡%�px&]n���w!�����[�カ^�@�6�l�9(>��ΰ��v��~w5i��) y��:V����BW�0��c�����J:�7/�Y"N���Io�_ڴu?%�i"|p��^�j1F�ӊjN��1�1��=��z�~�~t�v����&�����:h.�S�֠ߠ��¿�������+��P��x܃���թ?������z��ys��R7d��i��� R	hgF�u&o-���pJ+X�6Z4��)<M@�Dկ���q,v�l%��V=6��)HLŲ�54���������Ĕ���4V�X�(j"L~"4uBo�}wn�j}��~ю��d:Eb��]ԧ�8]�+�Z�
d֨���8�] �yŝ��f̠��q�����u��^N��L�,SP���K�	�)@p4.�B"������<,��O_aCP��p��݌�-^^������1
%�YPq)�Xk��L)y�L���?�q����N�$+�Drfx�6s���%"rҸ����f��]ȄP�.4���lY�"�`4[cQ������Ҧ�ӓ��H����4b4�� �m���ث2� n����JDO92���§M�q-ND�q^�۠GMy?QF_�2
ᜠ*Ƙ�7P+�9N>e��q?��v�&/���`@ܽ��D�d���rUð*��U�
k,#������?�b���y���m�[T�p5L�15��k.�Zpo�%aD��=>���������5���X�9	�A7�6�I�jX������vt�{��������v��0M��gs�̢#��gf�I�8C�x/��21����jz���22'��,�c|TOdŭ���qB�&�+D5Gi�.��<�=�W��p��uq()��V�1i�b��|�i>��p���W��6�_�f�t��|��磴���F�E��5�
��Z�D)��/���TbI6)hA�ʺ�)sA��_H��cXÜ *�2��u	�h� &`R�����=��6c8������^JQ�u��c�0����Ȱ1\]����5AG�S]�����N!� �u4IC�1*I�����^�F�
P,澗L ��r��r:?�˞�9�q���}x3�)Ps'�O8��0��u&fb^��_xD٬(˒&�mr5u�0��
�A���[FM�b7Iv��
;�߻�ė��u���]'����D�dQ>i�'��'�ߪ�������     