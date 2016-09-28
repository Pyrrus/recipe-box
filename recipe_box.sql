--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    tag character varying
);


ALTER TABLE categories OWNER TO "Guest";

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO "Guest";

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE clients (
    id integer NOT NULL,
    name character varying,
    phone character varying,
    stylist_id integer
);


ALTER TABLE clients OWNER TO "Guest";

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clients_id_seq OWNER TO "Guest";

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE clients_id_seq OWNED BY clients.id;


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE recipes (
    id integer NOT NULL,
    name character varying,
    ingredients text,
    instructions text,
    rating integer
);


ALTER TABLE recipes OWNER TO "Guest";

--
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE recipes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recipes_id_seq OWNER TO "Guest";

--
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE recipes_id_seq OWNED BY recipes.id;


--
-- Name: recipes_tags; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE recipes_tags (
    id integer NOT NULL,
    recipes_id integer,
    categories_id integer
);


ALTER TABLE recipes_tags OWNER TO "Guest";

--
-- Name: recipes_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE recipes_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recipes_tags_id_seq OWNER TO "Guest";

--
-- Name: recipes_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE recipes_tags_id_seq OWNED BY recipes_tags.id;


--
-- Name: stylists; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE stylists (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE stylists OWNER TO "Guest";

--
-- Name: stylists_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE stylists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stylists_id_seq OWNER TO "Guest";

--
-- Name: stylists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE stylists_id_seq OWNED BY stylists.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY clients ALTER COLUMN id SET DEFAULT nextval('clients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY recipes ALTER COLUMN id SET DEFAULT nextval('recipes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY recipes_tags ALTER COLUMN id SET DEFAULT nextval('recipes_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY stylists ALTER COLUMN id SET DEFAULT nextval('stylists_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY categories (id, tag) FROM stdin;
13	Fast
14	Decadent
15	Classic
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('categories_id_seq', 15, true);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY clients (id, name, phone, stylist_id) FROM stdin;
\.


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('clients_id_seq', 1, false);


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY recipes (id, name, ingredients, instructions, rating) FROM stdin;
13	test	<p>Adam the great</p>	<p>one of the best person on nowhere.</p>	\N
12	Oatmeal Raisin Cookies	<ol>\r\n<li>Clook in oil with 200 F</li>\r\n</ol>	<h1>Take some ingredients, make a <span style="text-decoration: line-through;">cookie</span> delicious cookie.</h1>	\N
14	Bacon and Egg Nachos	<ul>\r\n<li><em><span style="color: #1c1c1c; font-family: 'Lucida Grande', Helvetica, Arial, sans-serif; font-size: 13px; background-color: #efece3;">1 pound crumbled cooked bacon with the beans</span></em></li>\r\n<li><em><span style="color: #1c1c1c; font-family: 'Lucida Grande', Helvetica, Arial, sans-serif; font-size: 13px; background-color: #efece3;">crack 4 eggs on top</span></em></li>\r\n<li><em><span style="color: #1c1c1c; font-family: 'Lucida Grande', Helvetica, Arial, sans-serif; font-size: 13px; background-color: #efece3;">Top tortilla chips with 1 can refried beans</span></em></li>\r\n<li><em><span style="color: #1c1c1c; font-family: 'Lucida Grande', Helvetica, Arial, sans-serif; font-size: 13px; background-color: #efece3;">3 cups shredded cheddar</span></em></li>\r\n</ul>	<p><span style="color: #1c1c1c; font-family: 'Lucida Grande', Helvetica, Arial, sans-serif; font-size: 13px; background-color: #efece3;">Spread 8 cups of chips on a rimmed baking sheet or in a shallow dish. Add cheese and other toppings, then bake at 475 degrees F in the upper third of the oven until melted, about 7 minutes.</span></p>	\N
15	Chocolate Souffle	<ul>\r\n<li>\r\n<h3>Unsalted butter, room temperature, for baking dish</h3>\r\n</li>\r\n<li>\r\n<h3>1/4 cup sugar, plus more for baking dish</h3>\r\n</li>\r\n<li>\r\n<h3>8 ounces semisweet chocolate, finely chopped, or semisweet chocolate chips (1 cup)</h3>\r\n</li>\r\n<li>\r\n<h3>1 teaspoon pure vanilla extract</h3>\r\n</li>\r\n<li>\r\n<h3>3 large egg yolks, lightly beaten, plus 4 large egg whites</h3>\r\n</li>\r\n<li>\r\n<h3>1/4 teaspoon cream of tartar</h3>\r\n</li>\r\n</ul>	<ol class="directions-list" style="box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 1.5rem; color: #666666; font-family: Georgia, serif; font-size: 16px; letter-spacing: 0.4px; -webkit-tap-highlight-color: rgba(255, 255, 255, 0) !important; outline: none !important;">\r\n<li class="directions-item" style="box-sizing: border-box; -webkit-tap-highlight-color: rgba(255, 255, 255, 0) !important; outline: none !important; margin: 0px 0px 1em; padding: 0px;">\r\n<p class="directions-item-text" style="box-sizing: border-box; -webkit-tap-highlight-color: rgba(255, 255, 255, 0) !important; outline: none !important; margin: 0px; padding: 0px;">Preheat oven to 350 degrees. Lightly butter a 1 1/2-quart tall-sided baking dish. Coat with sugar, tapping out excess. Set dish on a rimmed baking sheet.</p>\r\n</li>\r\n<li class="directions-item" style="box-sizing: border-box; -webkit-tap-highlight-color: rgba(255, 255, 255, 0) !important; outline: none !important; margin: 0px 0px 1em; padding: 0px;">\r\n<p class="directions-item-text" style="box-sizing: border-box; -webkit-tap-highlight-color: rgba(255, 255, 255, 0) !important; outline: none !important; margin: 0px; padding: 0px;">In a large heatproof bowl set over a pot of simmering water, combine chocolate, vanilla, and 1/4 cup water. Stir until chocolate is melted and mixture is smooth, about 10 minutes. Remove from heat and let cool to room temperature, 20 minutes.</p>\r\n</li>\r\n<li class="directions-item" style="box-sizing: border-box; -webkit-tap-highlight-color: rgba(255, 255, 255, 0) !important; outline: none !important; margin: 0px 0px 1em; padding: 0px;">\r\n<p class="directions-item-text" style="box-sizing: border-box; -webkit-tap-highlight-color: rgba(255, 255, 255, 0) !important; outline: none !important; margin: 0px; padding: 0px;">Stir egg yolks into cooled chocolate mixture until well combined. Set souffle base aside.</p>\r\n</li>\r\n<li class="directions-item" style="box-sizing: border-box; -webkit-tap-highlight-color: rgba(255, 255, 255, 0) !important; outline: none !important; margin: 0px 0px 1em; padding: 0px;">\r\n<p class="directions-item-text" style="box-sizing: border-box; -webkit-tap-highlight-color: rgba(255, 255, 255, 0) !important; outline: none !important; margin: 0px; padding: 0px;">In a large bowl, using an electric mixer, beat egg whites and cream of tartar on medium-high until soft peaks form, about 2 minutes. Gradually add sugar and beat until stiff, glossy peaks form, about 5 minutes (do not overbeat).</p>\r\n</li>\r\n<li class="directions-item" style="box-sizing: border-box; -webkit-tap-highlight-color: rgba(255, 255, 255, 0) !important; outline: none !important; margin: 0px 0px 1em; padding: 0px;">\r\n<p class="directions-item-text" style="box-sizing: border-box; -webkit-tap-highlight-color: rgba(255, 255, 255, 0) !important; outline: none !important; margin: 0px; padding: 0px;">In two additions, fold egg-white mixture into souffle base: With a rubber spatula, gently cut down through center and lift up some base from bottom of bowl. Turning bowl, steadily continue to cut down and lift up base until just combined.</p>\r\n</li>\r\n<li class="directions-item" style="box-sizing: border-box; -webkit-tap-highlight-color: rgba(255, 255, 255, 0) !important; outline: none !important; margin: 0px 0px 1em; padding: 0px;">\r\n<p class="directions-item-text" style="box-sizing: border-box; -webkit-tap-highlight-color: rgba(255, 255, 255, 0) !important; outline: none !important; margin: 0px; padding: 0px;">Transfer mixture to dish, taking care not to get batter on top edge of dish; smooth top. Bake souffle until puffed and set, 30 to 35 minutes. (Do not open oven for first 25 minutes.) Serve immediately.</p>\r\n</li>\r\n</ol>	\N
16	Mac and Cheese	<ul>\r\n<li>1 pound pasta, any shape</li>\r\n<li>1 1/2 cups whole or 2% milk</li>\r\n<li>2 tablespoons all-purpose flour</li>\r\n<li>2 to 3 cups shredded cheese, like cheddar, Monterey Jack, or Colby</li>\r\n<li>1/2 teaspoon salt</li>\r\n<li>1/4 teaspoon powdered mustard</li>\r\n<li>Optional extras (cook before adding): Ham, bacon, onions, peas, mushrooms, peppers, broccoli, cauliflower</li>\r\n</ul>	<ol style="box-sizing: inherit; margin: 0px auto 16px; padding: 0px 0px 0px 16px; font-size: 15.5px; list-style-position: initial; list-style-image: initial; color: #423e3d; max-width: 640px; font-family: 'HCo Whitney SSm', Roboto, 'San Francisco', Futura, 'Trebuchet MS', Arial, sans-serif;">\r\n<li style="box-sizing: inherit; margin-bottom: 8px;"><span style="box-sizing: inherit; font-weight: 600;">Boil the pasta:</span>&nbsp;Bring about 4 quarts of water to a boil over high heat in the pasta pot. Add the pasta and a tablespoon of salt. Cook until the pasta is&nbsp;<a style="box-sizing: inherit; background-color: transparent; text-decoration: none; color: #f37600;" href="http://www.thekitchn.com/thekitchn/word-of-mouth/word-of-mouth-al-dente-064357">al dente</a>, about 8 minutes. Drain and set aside.</li>\r\n<li style="box-sizing: inherit; margin-bottom: 8px;"><span style="box-sizing: inherit; font-weight: 600;">Warm the milk:</span>&nbsp;When the pasta has finished cooking, prepare the cheese sauce. Begin warming 1 cup of the milk in the saucepan over medium heat. Whisk together the remaining 1/2 cup of milk and the flour until there are no lumps. When you just start to see tendrils of steam rising from the warming milk, whisk in the milk-and-flour mixture. Continue whisking gently until the milk thickens slightly to the consistency of heavy cream, 3 to 4 minutes.</li>\r\n<li style="box-sizing: inherit; margin-bottom: 8px;"><span style="box-sizing: inherit; font-weight: 600;">Make the cheese sauce:</span>&nbsp;Turn the heat to low and begin mixing handfuls of cheese into the milk. Stir in the salt and mustard. Stir until all the cheese has melted and the sauce is creamy. Taste and adjust the seasonings as desired. Remove the sauce from heat.</li>\r\n<li style="box-sizing: inherit; margin-bottom: 8px;"><span style="box-sizing: inherit; font-weight: 600;">Combine the pasta and cheese sauce:</span>&nbsp;In a large serving bowl, combine the pasta and 1/2 of the cheese sauce. Stir to coat the pasta evenly. Add the second half of the sauce and any extra add-ins.</li>\r\n<li style="box-sizing: inherit; margin-bottom: 8px;"><span style="box-sizing: inherit; font-weight: 600;">Serving and storing leftovers:</span>&nbsp;Serve the mac and cheese immediately while still warm. Leftovers will keep for up to a week and can be reheated in the microwave. If the sauce is a little dry after reheating, mix in a splash of milk to make it creamy again.</li>\r\n</ol>	\N
17	Chocolate Fudge Cookies	<p style="text-align: center;"><span class="quantity" style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif; box-sizing: border-box;">3</span><span style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif;">&nbsp;</span><span class="unit" style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif; box-sizing: border-box;">cups</span><span style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif;">&nbsp;</span><span class="name" style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif; box-sizing: border-box;">gluten-free powdered sugar</span><br /><span class="quantity" style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif; box-sizing: border-box;">&frac34;</span><span style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif;">&nbsp;</span><span class="unit" style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif; box-sizing: border-box;">cup</span><span style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif;">&nbsp;</span><span class="name" style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif; box-sizing: border-box;">unsweetened cocoa powder</span><br /><span class="quantity" style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif; box-sizing: border-box;">1</span><span style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif;">&nbsp;</span><span class="unit" style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif; box-sizing: border-box;">teaspoon</span><span style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif;">&nbsp;</span><span class="name" style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif; box-sizing: border-box;">kosher salt</span><br /><span class="quantity" style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif; box-sizing: border-box;">2</span><span style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif;">&nbsp;</span><span class="name" style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif; box-sizing: border-box;">large egg whites</span><br /><span class="quantity" style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif; box-sizing: border-box;">1</span><span style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif;">&nbsp;</span><span class="name" style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif; box-sizing: border-box;">large egg</span><br /><span class="quantity" style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif; box-sizing: border-box;">4</span><span style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif;">&nbsp;</span><span class="name" style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif; box-sizing: border-box;">oz. bittersweet chocolate, chopped</span><br /><span class="quantity" style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif; box-sizing: border-box;">3</span><span style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif;">&nbsp;</span><span class="unit" style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif; box-sizing: border-box;">tablespoons</span><span style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif;">&nbsp;</span><span class="name" style="font-size: 14px; color: #333333; font-family: 'Graphik Web Medium', Helvetica, Arial, sans-serif; box-sizing: border-box;">cacao nibs</span></p>	<ol>\r\n<li class="step" style="box-sizing: border-box; list-style: none; margin: 0px; padding: 0px 0px 0.9rem;">\r\n<div class="text" style="box-sizing: border-box;">Place racks in lower and upper thirds of oven; preheat to 350&deg;. Whisk powdered sugar, cocoa powder, and salt in a large bowl, then whisk in egg whites and egg; fold in chocolate and cacao nibs. Spoon batter by the tablespoonful onto 2 parchment-lined baking sheets, spacing 2&rdquo; apart.</div>\r\n</li>\r\n<li class="step" style="box-sizing: border-box; list-style: none; margin: 0px; padding: 0px 0px 0.9rem;">\r\n<div class="text" style="box-sizing: border-box;">Bake, rotating sheets once, until cookies are puffed, cracked, and set just around the edges, 14&ndash;16 minutes.</div>\r\n</li>\r\n<li class="step" style="box-sizing: border-box; list-style: none; margin: 0px; padding: 0px 0px 0.9rem;">\r\n<div class="text" style="box-sizing: border-box;">Transfer baking sheets to wire racks and let cookies cool on pan (they&rsquo;ll firm up).</div>\r\n</li>\r\n</ol>	\N
\.


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('recipes_id_seq', 17, true);


--
-- Data for Name: recipes_tags; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY recipes_tags (id, recipes_id, categories_id) FROM stdin;
24	14	13
25	15	14
26	16	15
27	17	13
28	17	14
29	17	15
\.


--
-- Name: recipes_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('recipes_tags_id_seq', 29, true);


--
-- Data for Name: stylists; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY stylists (id, name) FROM stdin;
\.


--
-- Name: stylists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('stylists_id_seq', 1, false);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: clients_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- Name: recipes_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY recipes_tags
    ADD CONSTRAINT recipes_tags_pkey PRIMARY KEY (id);


--
-- Name: stylists_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY stylists
    ADD CONSTRAINT stylists_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: epicodus
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM epicodus;
GRANT ALL ON SCHEMA public TO epicodus;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

