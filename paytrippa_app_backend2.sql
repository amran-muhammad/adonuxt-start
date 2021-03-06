PGDMP                         x            paytrippa_app_backend    12.1    12.1 �    1           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            2           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            3           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            4           1262    17469    paytrippa_app_backend    DATABASE     �   CREATE DATABASE paytrippa_app_backend WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United Kingdom.1252' LC_CTYPE = 'English_United Kingdom.1252';
 %   DROP DATABASE paytrippa_app_backend;
                postgres    false            �            1259    17810    partner_ac_pro_contents    TABLE     �   CREATE TABLE public.partner_ac_pro_contents (
    id bigint NOT NULL,
    ac_pro_id bigint,
    ac_pro_content text,
    ac_pro_photo character varying
);
 +   DROP TABLE public.partner_ac_pro_contents;
       public         heap    postgres    false            �            1259    17816    partner_ac_pro_contents_id_seq    SEQUENCE     �   CREATE SEQUENCE public.partner_ac_pro_contents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.partner_ac_pro_contents_id_seq;
       public          postgres    false    202            5           0    0    partner_ac_pro_contents_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.partner_ac_pro_contents_id_seq OWNED BY public.partner_ac_pro_contents.id;
          public          postgres    false    203            �            1259    17818    partner_ac_vid_contents    TABLE     �   CREATE TABLE public.partner_ac_vid_contents (
    id bigint NOT NULL,
    ac_vid_id bigint,
    ac_vid_link character varying
);
 +   DROP TABLE public.partner_ac_vid_contents;
       public         heap    postgres    false            �            1259    17824    partner_ac_vid_contents_id_seq    SEQUENCE     �   CREATE SEQUENCE public.partner_ac_vid_contents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.partner_ac_vid_contents_id_seq;
       public          postgres    false    204            6           0    0    partner_ac_vid_contents_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.partner_ac_vid_contents_id_seq OWNED BY public.partner_ac_vid_contents.id;
          public          postgres    false    205            �            1259    17826    partner_activity_products    TABLE     e   CREATE TABLE public.partner_activity_products (
    id bigint NOT NULL,
    sponsorship_id bigint
);
 -   DROP TABLE public.partner_activity_products;
       public         heap    postgres    false            �            1259    17829     partner_activity_products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.partner_activity_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.partner_activity_products_id_seq;
       public          postgres    false    206            7           0    0     partner_activity_products_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.partner_activity_products_id_seq OWNED BY public.partner_activity_products.id;
          public          postgres    false    207            �            1259    17831    partner_activity_surveys    TABLE     �   CREATE TABLE public.partner_activity_surveys (
    id bigint NOT NULL,
    sponsorship_id bigint,
    survey_url character varying,
    number_of_pages integer
);
 ,   DROP TABLE public.partner_activity_surveys;
       public         heap    postgres    false            �            1259    17837    partner_activity_surveys_id_seq    SEQUENCE     �   CREATE SEQUENCE public.partner_activity_surveys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.partner_activity_surveys_id_seq;
       public          postgres    false    208            8           0    0    partner_activity_surveys_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.partner_activity_surveys_id_seq OWNED BY public.partner_activity_surveys.id;
          public          postgres    false    209            �            1259    17839    partner_activity_videos    TABLE     c   CREATE TABLE public.partner_activity_videos (
    id bigint NOT NULL,
    sponsorship_id bigint
);
 +   DROP TABLE public.partner_activity_videos;
       public         heap    postgres    false            �            1259    17842    partner_activity_videos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.partner_activity_videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.partner_activity_videos_id_seq;
       public          postgres    false    210            9           0    0    partner_activity_videos_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.partner_activity_videos_id_seq OWNED BY public.partner_activity_videos.id;
          public          postgres    false    211            �            1259    17844    partner_audiences    TABLE       CREATE TABLE public.partner_audiences (
    id bigint NOT NULL,
    sponsorship_id bigint,
    age integer,
    gender character varying,
    occupation character varying,
    employment character varying,
    marital_status character varying,
    ethnicity character varying
);
 %   DROP TABLE public.partner_audiences;
       public         heap    postgres    false            �            1259    17850    partner_audiences_id_seq    SEQUENCE     �   CREATE SEQUENCE public.partner_audiences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.partner_audiences_id_seq;
       public          postgres    false    212            :           0    0    partner_audiences_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.partner_audiences_id_seq OWNED BY public.partner_audiences.id;
          public          postgres    false    213            �            1259    17857    partner_representatives    TABLE     5  CREATE TABLE public.partner_representatives (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    password character varying,
    role character varying,
    phone character varying,
    notes character varying,
    company_id bigint
);
 +   DROP TABLE public.partner_representatives;
       public         heap    postgres    false            �            1259    17863     partner_representatives.0_id_seq    SEQUENCE     �   CREATE SEQUENCE public."partner_representatives.0_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public."partner_representatives.0_id_seq";
       public          postgres    false    214            ;           0    0     partner_representatives.0_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public."partner_representatives.0_id_seq" OWNED BY public.partner_representatives.id;
          public          postgres    false    215            �            1259    17865    partner_sponsorship_activities    TABLE     �   CREATE TABLE public.partner_sponsorship_activities (
    id bigint NOT NULL,
    sponsorship_id bigint,
    company_id bigint,
    activity_type character varying,
    sponsorship_offer_page_media character varying,
    activity_details text
);
 2   DROP TABLE public.partner_sponsorship_activities;
       public         heap    postgres    false            �            1259    17871 %   partner_sponsorship_activities_id_seq    SEQUENCE     �   CREATE SEQUENCE public.partner_sponsorship_activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.partner_sponsorship_activities_id_seq;
       public          postgres    false    216            <           0    0 %   partner_sponsorship_activities_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.partner_sponsorship_activities_id_seq OWNED BY public.partner_sponsorship_activities.id;
          public          postgres    false    217            �            1259    17873     partner_sponsorship_participants    TABLE     �   CREATE TABLE public.partner_sponsorship_participants (
    id bigint NOT NULL,
    user_id bigint,
    sponsorship_id bigint,
    trip_id bigint
);
 4   DROP TABLE public.partner_sponsorship_participants;
       public         heap    postgres    false            �            1259    17876 '   partner_sponsorship_participants_id_seq    SEQUENCE     �   CREATE SEQUENCE public.partner_sponsorship_participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.partner_sponsorship_participants_id_seq;
       public          postgres    false    218            =           0    0 '   partner_sponsorship_participants_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.partner_sponsorship_participants_id_seq OWNED BY public.partner_sponsorship_participants.id;
          public          postgres    false    219            �            1259    17878    partner_sponsorships    TABLE     *  CREATE TABLE public.partner_sponsorships (
    id bigint NOT NULL,
    sponsorship_name character varying,
    company_id bigint,
    representative_id bigint,
    status character varying,
    website character varying,
    overview text,
    start_date date,
    end_date date,
    sponsorship_logo character varying,
    budget real,
    current_spending real,
    user_paytrippa_points integer,
    driver_paytrippa_points integer,
    max_daily_run integer,
    max_number_of_run integer,
    current_number_of_run integer,
    cost_per_run real
);
 (   DROP TABLE public.partner_sponsorships;
       public         heap    postgres    false            �            1259    17884    partner_sponsorships_id_seq    SEQUENCE     �   CREATE SEQUENCE public.partner_sponsorships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.partner_sponsorships_id_seq;
       public          postgres    false    220            >           0    0    partner_sponsorships_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.partner_sponsorships_id_seq OWNED BY public.partner_sponsorships.id;
          public          postgres    false    221            �            1259    17886    partner_users    TABLE       CREATE TABLE public.partner_users (
    id bigint NOT NULL,
    company_name character varying,
    email character varying,
    password character varying NOT NULL,
    company_type character varying,
    industry_type character varying,
    duns_number character varying,
    phone character varying,
    country character varying,
    address_line1 character varying,
    address_line2 character varying,
    zip_code character varying,
    city character varying,
    state character varying,
    user_type character varying
);
 !   DROP TABLE public.partner_users;
       public         heap    postgres    false            �            1259    17892    partner_users_id_seq    SEQUENCE     }   CREATE SEQUENCE public.partner_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.partner_users_id_seq;
       public          postgres    false    222            ?           0    0    partner_users_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.partner_users_id_seq OWNED BY public.partner_users.id;
          public          postgres    false    223            �            1259    17894    phone_verifications    TABLE       CREATE TABLE public.phone_verifications (
    id bigint NOT NULL,
    phone character varying,
    "phoneActivationCode" character varying,
    "codeExpirationDate" timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 '   DROP TABLE public.phone_verifications;
       public         heap    postgres    false            �            1259    17900    phone_verifications_id_seq    SEQUENCE     �   CREATE SEQUENCE public.phone_verifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.phone_verifications_id_seq;
       public          postgres    false    224            @           0    0    phone_verifications_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.phone_verifications_id_seq OWNED BY public.phone_verifications.id;
          public          postgres    false    225            �            1259    17902    user_age_ranges    TABLE     �   CREATE TABLE public.user_age_ranges (
    id bigint NOT NULL,
    "startValue" integer,
    "endValue" integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 #   DROP TABLE public.user_age_ranges;
       public         heap    postgres    false            �            1259    17905    user_age_ranges_id_seq    SEQUENCE        CREATE SEQUENCE public.user_age_ranges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.user_age_ranges_id_seq;
       public          postgres    false    226            A           0    0    user_age_ranges_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.user_age_ranges_id_seq OWNED BY public.user_age_ranges.id;
          public          postgres    false    227            �            1259    17907    user_educations    TABLE     �   CREATE TABLE public.user_educations (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 #   DROP TABLE public.user_educations;
       public         heap    postgres    false            �            1259    17913    user_educations_id_seq    SEQUENCE        CREATE SEQUENCE public.user_educations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.user_educations_id_seq;
       public          postgres    false    228            B           0    0    user_educations_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.user_educations_id_seq OWNED BY public.user_educations.id;
          public          postgres    false    229            �            1259    17915    user_employments    TABLE     �   CREATE TABLE public.user_employments (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 $   DROP TABLE public.user_employments;
       public         heap    postgres    false            �            1259    17921    user_employments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_employments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.user_employments_id_seq;
       public          postgres    false    230            C           0    0    user_employments_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.user_employments_id_seq OWNED BY public.user_employments.id;
          public          postgres    false    231            �            1259    17923    user_ethnicities    TABLE     �   CREATE TABLE public.user_ethnicities (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 $   DROP TABLE public.user_ethnicities;
       public         heap    postgres    false            �            1259    17929    user_ethnicities_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_ethnicities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.user_ethnicities_id_seq;
       public          postgres    false    232            D           0    0    user_ethnicities_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.user_ethnicities_id_seq OWNED BY public.user_ethnicities.id;
          public          postgres    false    233            �            1259    17931    user_household_income_ranges    TABLE     �   CREATE TABLE public.user_household_income_ranges (
    id bigint NOT NULL,
    "startValue" real,
    "endValue" real,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 0   DROP TABLE public.user_household_income_ranges;
       public         heap    postgres    false            �            1259    17934 #   user_household_income_ranges_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_household_income_ranges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.user_household_income_ranges_id_seq;
       public          postgres    false    234            E           0    0 #   user_household_income_ranges_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.user_household_income_ranges_id_seq OWNED BY public.user_household_income_ranges.id;
          public          postgres    false    235            �            1259    17936    user_invited_users    TABLE        CREATE TABLE public.user_invited_users (
    id bigint NOT NULL,
    "referrerUserId" bigint NOT NULL,
    "referredUserId" bigint,
    "referrerUserPoint" integer,
    "referredUserPoint" integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 &   DROP TABLE public.user_invited_users;
       public         heap    postgres    false            �            1259    18037    user_invited_users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_invited_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.user_invited_users_id_seq;
       public          postgres    false    236            F           0    0    user_invited_users_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.user_invited_users_id_seq OWNED BY public.user_invited_users.id;
          public          postgres    false    244            �            1259    18043 %   user_invited_users_referrerUserId_seq    SEQUENCE     �   CREATE SEQUENCE public."user_invited_users_referrerUserId_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public."user_invited_users_referrerUserId_seq";
       public          postgres    false    236            G           0    0 %   user_invited_users_referrerUserId_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public."user_invited_users_referrerUserId_seq" OWNED BY public.user_invited_users."referrerUserId";
          public          postgres    false    245            �            1259    17939    user_occupations    TABLE     �   CREATE TABLE public.user_occupations (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 $   DROP TABLE public.user_occupations;
       public         heap    postgres    false            �            1259    17945    user_occupations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_occupations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.user_occupations_id_seq;
       public          postgres    false    237            H           0    0    user_occupations_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.user_occupations_id_seq OWNED BY public.user_occupations.id;
          public          postgres    false    238            �            1259    17947    user_saved_addresses    TABLE     f  CREATE TABLE public.user_saved_addresses (
    id bigint NOT NULL,
    name character varying,
    "userId" bigint,
    address1 character varying,
    address2 character varying,
    city character varying,
    state character varying,
    zipcode character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 (   DROP TABLE public.user_saved_addresses;
       public         heap    postgres    false            �            1259    18051    user_saved_addresses_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_saved_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.user_saved_addresses_id_seq;
       public          postgres    false    239            I           0    0    user_saved_addresses_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.user_saved_addresses_id_seq OWNED BY public.user_saved_addresses.id;
          public          postgres    false    246            �            1259    17950    user_trip_activities    TABLE     �  CREATE TABLE public.user_trip_activities (
    id bigint NOT NULL,
    "tripId" bigint,
    "companyId" bigint,
    "activityId" bigint,
    "userId" bigint,
    "sponsorshipId" bigint,
    "activityType" character varying,
    "activityDuration" character varying,
    "totalPointsEarned" character varying,
    "startDateTime" timestamp without time zone,
    "endDateTime" timestamp without time zone,
    "startLocationLat" character varying,
    "startLocationLong" character varying,
    "endLocationLat" character varying,
    "endLocationLong" character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 (   DROP TABLE public.user_trip_activities;
       public         heap    postgres    false            �            1259    18109    user_trip_activities_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_trip_activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.user_trip_activities_id_seq;
       public          postgres    false    240            J           0    0    user_trip_activities_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.user_trip_activities_id_seq OWNED BY public.user_trip_activities.id;
          public          postgres    false    248            �            1259    17953    user_trip_deatils    TABLE       CREATE TABLE public.user_trip_deatils (
    id bigint NOT NULL,
    "userId" bigint,
    "fromLocaitonLat" character varying,
    "fromLocaitonLong" character varying,
    "toLocaitonLat" character varying,
    "toLocaitonLong" character varying,
    "startDateTime" timestamp without time zone,
    "endDateTime" timestamp without time zone,
    "tripDuration" character varying,
    "totalFare" character varying,
    "tripStatus" character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 %   DROP TABLE public.user_trip_deatils;
       public         heap    postgres    false            �            1259    18098    user_trip_deatils_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_trip_deatils_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.user_trip_deatils_id_seq;
       public          postgres    false    241            K           0    0    user_trip_deatils_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.user_trip_deatils_id_seq OWNED BY public.user_trip_deatils.id;
          public          postgres    false    247            �            1259    17956    users    TABLE     �  CREATE TABLE public.users (
    id bigint NOT NULL,
    phone character varying,
    "firstName" character varying,
    "lastName" character varying,
    email character varying,
    age character varying,
    gender character varying,
    "marititalStatus" character varying,
    education character varying,
    employment character varying,
    occupation character varying,
    "householdIncome" character varying,
    ethnicity character varying,
    "profilePicture" character varying,
    "phoneActivationCode" character varying,
    "accountStatus" character varying,
    "deviceToken" character varying,
    "invitationCode" character varying,
    password character varying,
    "checkAge" character varying,
    "checkGender" character varying,
    "checkMarititalStatus" character varying,
    "checkEducation" character varying,
    "checkEmployment" character varying,
    "checkOccupation" character varying,
    "checkHouseholdIncome" character varying,
    "checkEthnicity" character varying,
    "stripeCardholderId" character varying,
    "stripeCardId" character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    17962    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    242            L           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    243                       2604    17964    partner_ac_pro_contents id    DEFAULT     �   ALTER TABLE ONLY public.partner_ac_pro_contents ALTER COLUMN id SET DEFAULT nextval('public.partner_ac_pro_contents_id_seq'::regclass);
 I   ALTER TABLE public.partner_ac_pro_contents ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202                       2604    17965    partner_ac_vid_contents id    DEFAULT     �   ALTER TABLE ONLY public.partner_ac_vid_contents ALTER COLUMN id SET DEFAULT nextval('public.partner_ac_vid_contents_id_seq'::regclass);
 I   ALTER TABLE public.partner_ac_vid_contents ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204                       2604    17966    partner_activity_products id    DEFAULT     �   ALTER TABLE ONLY public.partner_activity_products ALTER COLUMN id SET DEFAULT nextval('public.partner_activity_products_id_seq'::regclass);
 K   ALTER TABLE public.partner_activity_products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206                       2604    17967    partner_activity_surveys id    DEFAULT     �   ALTER TABLE ONLY public.partner_activity_surveys ALTER COLUMN id SET DEFAULT nextval('public.partner_activity_surveys_id_seq'::regclass);
 J   ALTER TABLE public.partner_activity_surveys ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208                       2604    17968    partner_activity_videos id    DEFAULT     �   ALTER TABLE ONLY public.partner_activity_videos ALTER COLUMN id SET DEFAULT nextval('public.partner_activity_videos_id_seq'::regclass);
 I   ALTER TABLE public.partner_activity_videos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210                       2604    17969    partner_audiences id    DEFAULT     |   ALTER TABLE ONLY public.partner_audiences ALTER COLUMN id SET DEFAULT nextval('public.partner_audiences_id_seq'::regclass);
 C   ALTER TABLE public.partner_audiences ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212                       2604    17971    partner_representatives id    DEFAULT     �   ALTER TABLE ONLY public.partner_representatives ALTER COLUMN id SET DEFAULT nextval('public."partner_representatives.0_id_seq"'::regclass);
 I   ALTER TABLE public.partner_representatives ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214                       2604    17972 !   partner_sponsorship_activities id    DEFAULT     �   ALTER TABLE ONLY public.partner_sponsorship_activities ALTER COLUMN id SET DEFAULT nextval('public.partner_sponsorship_activities_id_seq'::regclass);
 P   ALTER TABLE public.partner_sponsorship_activities ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216                       2604    17973 #   partner_sponsorship_participants id    DEFAULT     �   ALTER TABLE ONLY public.partner_sponsorship_participants ALTER COLUMN id SET DEFAULT nextval('public.partner_sponsorship_participants_id_seq'::regclass);
 R   ALTER TABLE public.partner_sponsorship_participants ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218                       2604    17974    partner_sponsorships id    DEFAULT     �   ALTER TABLE ONLY public.partner_sponsorships ALTER COLUMN id SET DEFAULT nextval('public.partner_sponsorships_id_seq'::regclass);
 F   ALTER TABLE public.partner_sponsorships ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220                        2604    17975    partner_users id    DEFAULT     t   ALTER TABLE ONLY public.partner_users ALTER COLUMN id SET DEFAULT nextval('public.partner_users_id_seq'::regclass);
 ?   ALTER TABLE public.partner_users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222            !           2604    17976    phone_verifications id    DEFAULT     �   ALTER TABLE ONLY public.phone_verifications ALTER COLUMN id SET DEFAULT nextval('public.phone_verifications_id_seq'::regclass);
 E   ALTER TABLE public.phone_verifications ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224            "           2604    17977    user_age_ranges id    DEFAULT     x   ALTER TABLE ONLY public.user_age_ranges ALTER COLUMN id SET DEFAULT nextval('public.user_age_ranges_id_seq'::regclass);
 A   ALTER TABLE public.user_age_ranges ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226            #           2604    17978    user_educations id    DEFAULT     x   ALTER TABLE ONLY public.user_educations ALTER COLUMN id SET DEFAULT nextval('public.user_educations_id_seq'::regclass);
 A   ALTER TABLE public.user_educations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228            $           2604    17979    user_employments id    DEFAULT     z   ALTER TABLE ONLY public.user_employments ALTER COLUMN id SET DEFAULT nextval('public.user_employments_id_seq'::regclass);
 B   ALTER TABLE public.user_employments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230            %           2604    17980    user_ethnicities id    DEFAULT     z   ALTER TABLE ONLY public.user_ethnicities ALTER COLUMN id SET DEFAULT nextval('public.user_ethnicities_id_seq'::regclass);
 B   ALTER TABLE public.user_ethnicities ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232            &           2604    17981    user_household_income_ranges id    DEFAULT     �   ALTER TABLE ONLY public.user_household_income_ranges ALTER COLUMN id SET DEFAULT nextval('public.user_household_income_ranges_id_seq'::regclass);
 N   ALTER TABLE public.user_household_income_ranges ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    234            '           2604    18039    user_invited_users id    DEFAULT     ~   ALTER TABLE ONLY public.user_invited_users ALTER COLUMN id SET DEFAULT nextval('public.user_invited_users_id_seq'::regclass);
 D   ALTER TABLE public.user_invited_users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    236            (           2604    18045 !   user_invited_users referrerUserId    DEFAULT     �   ALTER TABLE ONLY public.user_invited_users ALTER COLUMN "referrerUserId" SET DEFAULT nextval('public."user_invited_users_referrerUserId_seq"'::regclass);
 R   ALTER TABLE public.user_invited_users ALTER COLUMN "referrerUserId" DROP DEFAULT;
       public          postgres    false    245    236            )           2604    17982    user_occupations id    DEFAULT     z   ALTER TABLE ONLY public.user_occupations ALTER COLUMN id SET DEFAULT nextval('public.user_occupations_id_seq'::regclass);
 B   ALTER TABLE public.user_occupations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    237            *           2604    18053    user_saved_addresses id    DEFAULT     �   ALTER TABLE ONLY public.user_saved_addresses ALTER COLUMN id SET DEFAULT nextval('public.user_saved_addresses_id_seq'::regclass);
 F   ALTER TABLE public.user_saved_addresses ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    239            +           2604    18111    user_trip_activities id    DEFAULT     �   ALTER TABLE ONLY public.user_trip_activities ALTER COLUMN id SET DEFAULT nextval('public.user_trip_activities_id_seq'::regclass);
 F   ALTER TABLE public.user_trip_activities ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    240            ,           2604    18100    user_trip_deatils id    DEFAULT     |   ALTER TABLE ONLY public.user_trip_deatils ALTER COLUMN id SET DEFAULT nextval('public.user_trip_deatils_id_seq'::regclass);
 C   ALTER TABLE public.user_trip_deatils ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    241            -           2604    17983    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    242                       0    17810    partner_ac_pro_contents 
   TABLE DATA           ^   COPY public.partner_ac_pro_contents (id, ac_pro_id, ac_pro_content, ac_pro_photo) FROM stdin;
    public          postgres    false    202   z                0    17818    partner_ac_vid_contents 
   TABLE DATA           M   COPY public.partner_ac_vid_contents (id, ac_vid_id, ac_vid_link) FROM stdin;
    public          postgres    false    204   �                0    17826    partner_activity_products 
   TABLE DATA           G   COPY public.partner_activity_products (id, sponsorship_id) FROM stdin;
    public          postgres    false    206   �                0    17831    partner_activity_surveys 
   TABLE DATA           c   COPY public.partner_activity_surveys (id, sponsorship_id, survey_url, number_of_pages) FROM stdin;
    public          postgres    false    208   �                0    17839    partner_activity_videos 
   TABLE DATA           E   COPY public.partner_activity_videos (id, sponsorship_id) FROM stdin;
    public          postgres    false    210   �      
          0    17844    partner_audiences 
   TABLE DATA              COPY public.partner_audiences (id, sponsorship_id, age, gender, occupation, employment, marital_status, ethnicity) FROM stdin;
    public          postgres    false    212                   0    17857    partner_representatives 
   TABLE DATA           }   COPY public.partner_representatives (id, first_name, last_name, email, password, role, phone, notes, company_id) FROM stdin;
    public          postgres    false    214   1                0    17865    partner_sponsorship_activities 
   TABLE DATA           �   COPY public.partner_sponsorship_activities (id, sponsorship_id, company_id, activity_type, sponsorship_offer_page_media, activity_details) FROM stdin;
    public          postgres    false    216   v                0    17873     partner_sponsorship_participants 
   TABLE DATA           `   COPY public.partner_sponsorship_participants (id, user_id, sponsorship_id, trip_id) FROM stdin;
    public          postgres    false    218   �                0    17878    partner_sponsorships 
   TABLE DATA           7  COPY public.partner_sponsorships (id, sponsorship_name, company_id, representative_id, status, website, overview, start_date, end_date, sponsorship_logo, budget, current_spending, user_paytrippa_points, driver_paytrippa_points, max_daily_run, max_number_of_run, current_number_of_run, cost_per_run) FROM stdin;
    public          postgres    false    220   �                0    17886    partner_users 
   TABLE DATA           �   COPY public.partner_users (id, company_name, email, password, company_type, industry_type, duns_number, phone, country, address_line1, address_line2, zip_code, city, state, user_type) FROM stdin;
    public          postgres    false    222   :                0    17894    phone_verifications 
   TABLE DATA           }   COPY public.phone_verifications (id, phone, "phoneActivationCode", "codeExpirationDate", created_at, updated_at) FROM stdin;
    public          postgres    false    224   �                0    17902    user_age_ranges 
   TABLE DATA           _   COPY public.user_age_ranges (id, "startValue", "endValue", created_at, updated_at) FROM stdin;
    public          postgres    false    226   ,                0    17907    user_educations 
   TABLE DATA           K   COPY public.user_educations (id, name, created_at, updated_at) FROM stdin;
    public          postgres    false    228   g                0    17915    user_employments 
   TABLE DATA           L   COPY public.user_employments (id, name, created_at, updated_at) FROM stdin;
    public          postgres    false    230   �                0    17923    user_ethnicities 
   TABLE DATA           L   COPY public.user_ethnicities (id, name, created_at, updated_at) FROM stdin;
    public          postgres    false    232   �                 0    17931    user_household_income_ranges 
   TABLE DATA           l   COPY public.user_household_income_ranges (id, "startValue", "endValue", created_at, updated_at) FROM stdin;
    public          postgres    false    234   I      "          0    17936    user_invited_users 
   TABLE DATA           �   COPY public.user_invited_users (id, "referrerUserId", "referredUserId", "referrerUserPoint", "referredUserPoint", created_at, updated_at) FROM stdin;
    public          postgres    false    236   �      #          0    17939    user_occupations 
   TABLE DATA           L   COPY public.user_occupations (id, name, created_at, updated_at) FROM stdin;
    public          postgres    false    237   �      %          0    17947    user_saved_addresses 
   TABLE DATA           �   COPY public.user_saved_addresses (id, name, "userId", address1, address2, city, state, zipcode, created_at, updated_at) FROM stdin;
    public          postgres    false    239   �      &          0    17950    user_trip_activities 
   TABLE DATA           1  COPY public.user_trip_activities (id, "tripId", "companyId", "activityId", "userId", "sponsorshipId", "activityType", "activityDuration", "totalPointsEarned", "startDateTime", "endDateTime", "startLocationLat", "startLocationLong", "endLocationLat", "endLocationLong", created_at, updated_at) FROM stdin;
    public          postgres    false    240   �      '          0    17953    user_trip_deatils 
   TABLE DATA           �   COPY public.user_trip_deatils (id, "userId", "fromLocaitonLat", "fromLocaitonLong", "toLocaitonLat", "toLocaitonLong", "startDateTime", "endDateTime", "tripDuration", "totalFare", "tripStatus", created_at, updated_at) FROM stdin;
    public          postgres    false    241         (          0    17956    users 
   TABLE DATA           �  COPY public.users (id, phone, "firstName", "lastName", email, age, gender, "marititalStatus", education, employment, occupation, "householdIncome", ethnicity, "profilePicture", "phoneActivationCode", "accountStatus", "deviceToken", "invitationCode", password, "checkAge", "checkGender", "checkMarititalStatus", "checkEducation", "checkEmployment", "checkOccupation", "checkHouseholdIncome", "checkEthnicity", "stripeCardholderId", "stripeCardId", created_at, updated_at) FROM stdin;
    public          postgres    false    242   8      M           0    0    partner_ac_pro_contents_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.partner_ac_pro_contents_id_seq', 1, false);
          public          postgres    false    203            N           0    0    partner_ac_vid_contents_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.partner_ac_vid_contents_id_seq', 1, false);
          public          postgres    false    205            O           0    0     partner_activity_products_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.partner_activity_products_id_seq', 1, false);
          public          postgres    false    207            P           0    0    partner_activity_surveys_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.partner_activity_surveys_id_seq', 1, false);
          public          postgres    false    209            Q           0    0    partner_activity_videos_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.partner_activity_videos_id_seq', 1, false);
          public          postgres    false    211            R           0    0    partner_audiences_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.partner_audiences_id_seq', 1, false);
          public          postgres    false    213            S           0    0     partner_representatives.0_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public."partner_representatives.0_id_seq"', 1, true);
          public          postgres    false    215            T           0    0 %   partner_sponsorship_activities_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.partner_sponsorship_activities_id_seq', 1, false);
          public          postgres    false    217            U           0    0 '   partner_sponsorship_participants_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.partner_sponsorship_participants_id_seq', 1, false);
          public          postgres    false    219            V           0    0    partner_sponsorships_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.partner_sponsorships_id_seq', 2, true);
          public          postgres    false    221            W           0    0    partner_users_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.partner_users_id_seq', 2, true);
          public          postgres    false    223            X           0    0    phone_verifications_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.phone_verifications_id_seq', 4, true);
          public          postgres    false    225            Y           0    0    user_age_ranges_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.user_age_ranges_id_seq', 3, true);
          public          postgres    false    227            Z           0    0    user_educations_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.user_educations_id_seq', 3, true);
          public          postgres    false    229            [           0    0    user_employments_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.user_employments_id_seq', 3, true);
          public          postgres    false    231            \           0    0    user_ethnicities_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.user_ethnicities_id_seq', 5, true);
          public          postgres    false    233            ]           0    0 #   user_household_income_ranges_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.user_household_income_ranges_id_seq', 3, true);
          public          postgres    false    235            ^           0    0    user_invited_users_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.user_invited_users_id_seq', 1, false);
          public          postgres    false    244            _           0    0 %   user_invited_users_referrerUserId_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."user_invited_users_referrerUserId_seq"', 1, false);
          public          postgres    false    245            `           0    0    user_occupations_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.user_occupations_id_seq', 3, true);
          public          postgres    false    238            a           0    0    user_saved_addresses_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.user_saved_addresses_id_seq', 1, false);
          public          postgres    false    246            b           0    0    user_trip_activities_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.user_trip_activities_id_seq', 1, false);
          public          postgres    false    248            c           0    0    user_trip_deatils_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.user_trip_deatils_id_seq', 1, false);
          public          postgres    false    247            d           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 2, true);
          public          postgres    false    243            0           2606    17985 4   partner_ac_pro_contents partner_ac_pro_contents_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.partner_ac_pro_contents
    ADD CONSTRAINT partner_ac_pro_contents_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.partner_ac_pro_contents DROP CONSTRAINT partner_ac_pro_contents_pkey;
       public            postgres    false    202            3           2606    17987 4   partner_ac_vid_contents partner_ac_vid_contents_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.partner_ac_vid_contents
    ADD CONSTRAINT partner_ac_vid_contents_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.partner_ac_vid_contents DROP CONSTRAINT partner_ac_vid_contents_pkey;
       public            postgres    false    204            6           2606    17989 8   partner_activity_products partner_activity_products_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.partner_activity_products
    ADD CONSTRAINT partner_activity_products_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.partner_activity_products DROP CONSTRAINT partner_activity_products_pkey;
       public            postgres    false    206            8           2606    17991 6   partner_activity_surveys partner_activity_surveys_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.partner_activity_surveys
    ADD CONSTRAINT partner_activity_surveys_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.partner_activity_surveys DROP CONSTRAINT partner_activity_surveys_pkey;
       public            postgres    false    208            :           2606    17993 4   partner_activity_videos partner_activity_videos_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.partner_activity_videos
    ADD CONSTRAINT partner_activity_videos_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.partner_activity_videos DROP CONSTRAINT partner_activity_videos_pkey;
       public            postgres    false    210            <           2606    17995 (   partner_audiences partner_audiences_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.partner_audiences
    ADD CONSTRAINT partner_audiences_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.partner_audiences DROP CONSTRAINT partner_audiences_pkey;
       public            postgres    false    212            >           2606    17999 6   partner_representatives partner_representatives.0_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.partner_representatives
    ADD CONSTRAINT "partner_representatives.0_pkey" PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.partner_representatives DROP CONSTRAINT "partner_representatives.0_pkey";
       public            postgres    false    214            A           2606    18001 B   partner_sponsorship_activities partner_sponsorship_activities_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.partner_sponsorship_activities
    ADD CONSTRAINT partner_sponsorship_activities_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.partner_sponsorship_activities DROP CONSTRAINT partner_sponsorship_activities_pkey;
       public            postgres    false    216            E           2606    18003 F   partner_sponsorship_participants partner_sponsorship_participants_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.partner_sponsorship_participants
    ADD CONSTRAINT partner_sponsorship_participants_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.partner_sponsorship_participants DROP CONSTRAINT partner_sponsorship_participants_pkey;
       public            postgres    false    218            H           2606    18005 .   partner_sponsorships partner_sponsorships_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.partner_sponsorships
    ADD CONSTRAINT partner_sponsorships_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.partner_sponsorships DROP CONSTRAINT partner_sponsorships_pkey;
       public            postgres    false    220            J           2606    18007     partner_users partner_users_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.partner_users
    ADD CONSTRAINT partner_users_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.partner_users DROP CONSTRAINT partner_users_pkey;
       public            postgres    false    222            L           2606    18009 ,   phone_verifications phone_verifications_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.phone_verifications
    ADD CONSTRAINT phone_verifications_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.phone_verifications DROP CONSTRAINT phone_verifications_pkey;
       public            postgres    false    224            N           2606    18011 $   user_age_ranges user_age_ranges_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.user_age_ranges
    ADD CONSTRAINT user_age_ranges_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.user_age_ranges DROP CONSTRAINT user_age_ranges_pkey;
       public            postgres    false    226            P           2606    18013 $   user_educations user_educations_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.user_educations
    ADD CONSTRAINT user_educations_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.user_educations DROP CONSTRAINT user_educations_pkey;
       public            postgres    false    228            R           2606    18015 &   user_employments user_employments_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.user_employments
    ADD CONSTRAINT user_employments_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.user_employments DROP CONSTRAINT user_employments_pkey;
       public            postgres    false    230            T           2606    18017 &   user_ethnicities user_ethnicities_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.user_ethnicities
    ADD CONSTRAINT user_ethnicities_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.user_ethnicities DROP CONSTRAINT user_ethnicities_pkey;
       public            postgres    false    232            V           2606    18019 >   user_household_income_ranges user_household_income_ranges_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.user_household_income_ranges
    ADD CONSTRAINT user_household_income_ranges_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.user_household_income_ranges DROP CONSTRAINT user_household_income_ranges_pkey;
       public            postgres    false    234            Z           2606    18050 *   user_invited_users user_invited_users_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.user_invited_users
    ADD CONSTRAINT user_invited_users_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.user_invited_users DROP CONSTRAINT user_invited_users_pkey;
       public            postgres    false    236            \           2606    18021 &   user_occupations user_occupations_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.user_occupations
    ADD CONSTRAINT user_occupations_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.user_occupations DROP CONSTRAINT user_occupations_pkey;
       public            postgres    false    237            _           2606    18061 .   user_saved_addresses user_saved_addresses_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.user_saved_addresses
    ADD CONSTRAINT user_saved_addresses_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.user_saved_addresses DROP CONSTRAINT user_saved_addresses_pkey;
       public            postgres    false    239            e           2606    18119 .   user_trip_activities user_trip_activities_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.user_trip_activities
    ADD CONSTRAINT user_trip_activities_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.user_trip_activities DROP CONSTRAINT user_trip_activities_pkey;
       public            postgres    false    240            g           2606    18108 (   user_trip_deatils user_trip_deatils_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.user_trip_deatils
    ADD CONSTRAINT user_trip_deatils_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.user_trip_deatils DROP CONSTRAINT user_trip_deatils_pkey;
       public            postgres    false    241            i           2606    18023    users users_phone_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_unique UNIQUE (phone);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_phone_unique;
       public            postgres    false    242            k           2606    18025    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    242            .           1259    18177    fki_ac_pro_id    INDEX     V   CREATE INDEX fki_ac_pro_id ON public.partner_ac_pro_contents USING btree (ac_pro_id);
 !   DROP INDEX public.fki_ac_pro_id;
       public            postgres    false    202            1           1259    18183    fki_ac_vid_id    INDEX     V   CREATE INDEX fki_ac_vid_id ON public.partner_ac_vid_contents USING btree (ac_vid_id);
 !   DROP INDEX public.fki_ac_vid_id;
       public            postgres    false    204            `           1259    18155    fki_activityId    INDEX     Y   CREATE INDEX "fki_activityId" ON public.user_trip_activities USING btree ("activityId");
 $   DROP INDEX public."fki_activityId";
       public            postgres    false    240            a           1259    18149    fki_companyId    INDEX     W   CREATE INDEX "fki_companyId" ON public.user_trip_activities USING btree ("companyId");
 #   DROP INDEX public."fki_companyId";
       public            postgres    false    240            ?           1259    18230    fki_company_id    INDEX     _   CREATE INDEX fki_company_id ON public.partner_sponsorship_activities USING btree (company_id);
 "   DROP INDEX public.fki_company_id;
       public            postgres    false    216            W           1259    18131    fki_referredUserId    INDEX     _   CREATE INDEX "fki_referredUserId" ON public.user_invited_users USING btree ("referredUserId");
 (   DROP INDEX public."fki_referredUserId";
       public            postgres    false    236            X           1259    18125    fki_referrerUserId    INDEX     _   CREATE INDEX "fki_referrerUserId" ON public.user_invited_users USING btree ("referrerUserId");
 (   DROP INDEX public."fki_referrerUserId";
       public            postgres    false    236            F           1259    18258    fki_representative_id    INDEX     c   CREATE INDEX fki_representative_id ON public.partner_sponsorships USING btree (representative_id);
 )   DROP INDEX public.fki_representative_id;
       public            postgres    false    220            b           1259    18166    fki_sponsorshipId    INDEX     _   CREATE INDEX "fki_sponsorshipId" ON public.user_trip_activities USING btree ("sponsorshipId");
 '   DROP INDEX public."fki_sponsorshipId";
       public            postgres    false    240            4           1259    18189    fki_sponsorship_id    INDEX     b   CREATE INDEX fki_sponsorship_id ON public.partner_activity_products USING btree (sponsorship_id);
 &   DROP INDEX public.fki_sponsorship_id;
       public            postgres    false    206            c           1259    18143 
   fki_tripId    INDEX     Q   CREATE INDEX "fki_tripId" ON public.user_trip_activities USING btree ("tripId");
     DROP INDEX public."fki_tripId";
       public            postgres    false    240            B           1259    18247    fki_trip_id    INDEX     [   CREATE INDEX fki_trip_id ON public.partner_sponsorship_participants USING btree (trip_id);
    DROP INDEX public.fki_trip_id;
       public            postgres    false    218            ]           1259    18137 
   fki_userId    INDEX     Q   CREATE INDEX "fki_userId" ON public.user_saved_addresses USING btree ("userId");
     DROP INDEX public."fki_userId";
       public            postgres    false    239            C           1259    18236    fki_user_id    INDEX     [   CREATE INDEX fki_user_id ON public.partner_sponsorship_participants USING btree (user_id);
    DROP INDEX public.fki_user_id;
       public            postgres    false    218            l           2606    18172 !   partner_ac_pro_contents ac_pro_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.partner_ac_pro_contents
    ADD CONSTRAINT ac_pro_id FOREIGN KEY (ac_pro_id) REFERENCES public.partner_activity_products(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.partner_ac_pro_contents DROP CONSTRAINT ac_pro_id;
       public          postgres    false    202    2870    206            m           2606    18178 !   partner_ac_vid_contents ac_vid_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.partner_ac_vid_contents
    ADD CONSTRAINT ac_vid_id FOREIGN KEY (ac_vid_id) REFERENCES public.partner_activity_videos(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.partner_ac_vid_contents DROP CONSTRAINT ac_vid_id;
       public          postgres    false    210    2874    204            ~           2606    18150    user_trip_activities activityId    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_trip_activities
    ADD CONSTRAINT "activityId" FOREIGN KEY ("activityId") REFERENCES public.partner_sponsorship_activities(id) ON UPDATE SET NULL ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.user_trip_activities DROP CONSTRAINT "activityId";
       public          postgres    false    2881    240    216            }           2606    18144    user_trip_activities companyId    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_trip_activities
    ADD CONSTRAINT "companyId" FOREIGN KEY ("companyId") REFERENCES public.partner_users(id) ON UPDATE SET NULL ON DELETE SET NULL;
 J   ALTER TABLE ONLY public.user_trip_activities DROP CONSTRAINT "companyId";
       public          postgres    false    222    240    2890            s           2606    18225 )   partner_sponsorship_activities company_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.partner_sponsorship_activities
    ADD CONSTRAINT company_id FOREIGN KEY (company_id) REFERENCES public.partner_users(id) ON UPDATE SET NULL ON DELETE SET NULL;
 S   ALTER TABLE ONLY public.partner_sponsorship_activities DROP CONSTRAINT company_id;
       public          postgres    false    216    222    2890            w           2606    18248    partner_sponsorships company_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.partner_sponsorships
    ADD CONSTRAINT company_id FOREIGN KEY (company_id) REFERENCES public.partner_users(id) ON UPDATE SET NULL ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.partner_sponsorships DROP CONSTRAINT company_id;
       public          postgres    false    2890    220    222            z           2606    18126 !   user_invited_users referredUserId    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_invited_users
    ADD CONSTRAINT "referredUserId" FOREIGN KEY ("referredUserId") REFERENCES public.users(id) ON UPDATE SET NULL ON DELETE SET NULL;
 M   ALTER TABLE ONLY public.user_invited_users DROP CONSTRAINT "referredUserId";
       public          postgres    false    2923    236    242            y           2606    18120 !   user_invited_users referrerUserId    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_invited_users
    ADD CONSTRAINT "referrerUserId" FOREIGN KEY ("referrerUserId") REFERENCES public.users(id) ON UPDATE SET NULL ON DELETE SET NULL;
 M   ALTER TABLE ONLY public.user_invited_users DROP CONSTRAINT "referrerUserId";
       public          postgres    false    2923    236    242            x           2606    18253 &   partner_sponsorships representative_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.partner_sponsorships
    ADD CONSTRAINT representative_id FOREIGN KEY (representative_id) REFERENCES public.partner_representatives(id) ON UPDATE SET NULL ON DELETE SET NULL;
 P   ALTER TABLE ONLY public.partner_sponsorships DROP CONSTRAINT representative_id;
       public          postgres    false    214    220    2878            �           2606    18161 "   user_trip_activities sponsorshipId    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_trip_activities
    ADD CONSTRAINT "sponsorshipId" FOREIGN KEY ("sponsorshipId") REFERENCES public.partner_sponsorships(id) ON UPDATE SET NULL ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.user_trip_activities DROP CONSTRAINT "sponsorshipId";
       public          postgres    false    240    2888    220            n           2606    18184 (   partner_activity_products sponsorship_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.partner_activity_products
    ADD CONSTRAINT sponsorship_id FOREIGN KEY (sponsorship_id) REFERENCES public.partner_sponsorships(id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.partner_activity_products DROP CONSTRAINT sponsorship_id;
       public          postgres    false    2888    220    206            p           2606    18195 &   partner_activity_videos sponsorship_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.partner_activity_videos
    ADD CONSTRAINT sponsorship_id FOREIGN KEY (sponsorship_id) REFERENCES public.partner_sponsorships(id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.partner_activity_videos DROP CONSTRAINT sponsorship_id;
       public          postgres    false    210    220    2888            q           2606    18205     partner_audiences sponsorship_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.partner_audiences
    ADD CONSTRAINT sponsorship_id FOREIGN KEY (sponsorship_id) REFERENCES public.partner_sponsorships(id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.partner_audiences DROP CONSTRAINT sponsorship_id;
       public          postgres    false    2888    212    220            o           2606    18210 '   partner_activity_surveys sponsorship_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.partner_activity_surveys
    ADD CONSTRAINT sponsorship_id FOREIGN KEY (sponsorship_id) REFERENCES public.partner_sponsorships(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.partner_activity_surveys DROP CONSTRAINT sponsorship_id;
       public          postgres    false    2888    220    208            r           2606    18220 -   partner_sponsorship_activities sponsorship_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.partner_sponsorship_activities
    ADD CONSTRAINT sponsorship_id FOREIGN KEY (sponsorship_id) REFERENCES public.partner_sponsorships(id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.partner_sponsorship_activities DROP CONSTRAINT sponsorship_id;
       public          postgres    false    2888    220    216            u           2606    18237 /   partner_sponsorship_participants sponsorship_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.partner_sponsorship_participants
    ADD CONSTRAINT sponsorship_id FOREIGN KEY (sponsorship_id) REFERENCES public.partner_sponsorships(id) ON UPDATE SET NULL ON DELETE SET NULL;
 Y   ALTER TABLE ONLY public.partner_sponsorship_participants DROP CONSTRAINT sponsorship_id;
       public          postgres    false    2888    218    220            |           2606    18138    user_trip_activities tripId    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_trip_activities
    ADD CONSTRAINT "tripId" FOREIGN KEY ("tripId") REFERENCES public.user_trip_deatils(id) ON UPDATE SET NULL ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.user_trip_activities DROP CONSTRAINT "tripId";
       public          postgres    false    2919    240    241            v           2606    18242 (   partner_sponsorship_participants trip_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.partner_sponsorship_participants
    ADD CONSTRAINT trip_id FOREIGN KEY (trip_id) REFERENCES public.user_trip_deatils(id) ON UPDATE SET NULL ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.partner_sponsorship_participants DROP CONSTRAINT trip_id;
       public          postgres    false    241    2919    218            {           2606    18132    user_saved_addresses userId    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_saved_addresses
    ADD CONSTRAINT "userId" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.user_saved_addresses DROP CONSTRAINT "userId";
       public          postgres    false    239    242    2923                       2606    18156    user_trip_activities userId    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_trip_activities
    ADD CONSTRAINT "userId" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE SET NULL ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.user_trip_activities DROP CONSTRAINT "userId";
       public          postgres    false    2923    240    242            �           2606    18167    user_trip_deatils userId    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_trip_deatils
    ADD CONSTRAINT "userId" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE SET NULL ON DELETE SET NULL;
 D   ALTER TABLE ONLY public.user_trip_deatils DROP CONSTRAINT "userId";
       public          postgres    false    241    242    2923            t           2606    18231 (   partner_sponsorship_participants user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.partner_sponsorship_participants
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE SET NULL ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.partner_sponsorship_participants DROP CONSTRAINT user_id;
       public          postgres    false    218    2923    242                   x������ � �            x������ � �            x�3������� 
C�            x������ � �            x�3�4����� ]      
      x������ � �         5   x�3��N�-J��L��MM�r�s3s���s9���R�8c��Ȉ+F��� A�         /   x�3�4���,�LI��L-O/OLO�,NM/OMO-/JO-����� ��            x������ � �         X   x�3�t,Mɴ�4�4�,*����K��!##]C �2MAL�������@C�\F`��fh
e�@M� 3�@3�����qqq �M!#         �   x�m���0E�x�Hq�� �~[��&� ��Ŷ��P����H��E���-^���$��%�)�jYO8��Wx�S5�^0��t{n�F�
�h�U\�"�q����o��1y?Nũ+��o�y!| �TK         M   x�u˱ !C�:��89��,�?�]u��'
I��˅ *Z�*lIf��l\L�����6��� ������t?��$�\         +   x�3�4��42��".#N#SNcC(Ϙ�؈��ʋ���� ��/         =   x�3�tJL�H��/R�OSp�K��KM-��".#IǢ�b��1�Dprfj^r*T.F��� �B�         6   x�3�t�L�,I�QpLO�K���".#N�Ģ��(ט�?--39ʍ���� �M�         ?   x�3�t���K-N��".#N��Ԣ���<��1�cq&�g�锓���r�gd�����qqq s��          '   x�3�4400�41~@�eငaB�P�)�X� XQ
�      "      x������ � �      #   4   x�3�(��JM.Q�M�KLO-��".#ΐ���8ߘӥ(�΍���� (��      %      x������ � �      &      x������ � �      '      x������ � �      (   �   x���OW�@�׏O�m3��+!%K20���9����b@�O�hu\�{��߹�{.�l��e�vI2"���c�M���]��ΰm=�sf���a�v�� �}t�Zγݡ�^S'a��.IX>�*RCv
wiEX��]�hp3@:�I���թ@Ox,$$�K��B�l��L��x*���Bh�����ߡ-��1f��m藫 ��"*�X�I�.���͉y�6�xl����UC7�$Iߙ�k�     