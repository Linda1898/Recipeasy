create database Foodstories2504;
use foodstories2504;

create table food_group (
	food_group_id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    group_name VARCHAR (20) NOT NULL,
    group_chart TINYBLOB,
    group_fact VARCHAR (500)
);

create table food_source (
	source_id int AUTO_INCREMENT PRIMARY KEY,
    source_name VARCHAR (15),
    source_image TINYBLOB,
    source_fact1 VARCHAR (500),
    source_fact2 VARCHAR (500),
    source_fact3 VARCHAR (500)
);

create table nutrition (
	nutrition_id int AUTO_INCREMENT PRIMARY KEY,
    energy_kcal int,
    energy_kj int,
    fat FLOAT (10),
    saturate FLOAT (10),
    carbohydrate FLOAT (10),
    sugar FLOAT (10),
    starch FLOAT (10),
    fibre FLOAT (10),
    protein FLOAT (10),
    salt FLOAT (10)
);

create table gender (
	gender_id int AUTO_INCREMENT PRIMARY KEY,
    gender_name VARCHAR (20)
);

create table user_table (
	user_id int AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR (20) NOT NULL,
    user_surname VARCHAR(30),
    gender_id INT,
    FOREIGN KEY (gender_id) REFERENCES gender(gender_id),
    user_age int,
    username varchar(20) NOT NULL UNIQUE,
    password varbinary(100) default null
);

create table recipe (
	recipe_id int AUTO_INCREMENT PRIMARY KEY,
    recipe_name VARCHAR (50),
    recipe_description VARCHAR (200),
    recipe_method varchar(1500) not null,
    ingredient_quantity varchar(1000) not null,
    course VARCHAR (20) NOT NULL,
    cuisine VARCHAR (30) NOT NULL,
    prep_time VARCHAR (20) NOT NULL,
    cook_time VARCHAR (20) NOT NULL,
    serving int NOT NULL
);
select * from recipe;

create table food_item (
	food_id int AUTO_INCREMENT PRIMARY KEY,
    food_name VARCHAR (50) NOT NULL,
    ghg_emission FLOAT (10) NOT NULL,
    land_use FLOAT (10) NOT NULL,
    freshwater_withdraw FLOAT (10) NOT NULL,
    food_group_id INT NOT NULL,
    FOREIGN KEY (food_group_id) REFERENCES food_group(food_group_id),
    source_id INT NOT NULL,
    FOREIGN KEY (source_id) REFERENCES food_source(source_id),
    nutrition_id INT NOT NULL,
    FOREIGN KEY (nutrition_id) REFERENCES nutrition(nutrition_id)
);

create table ingredient (
	ingredient_id int AUTO_INCREMENT PRIMARY KEY,
    food_id int,
    FOREIGN KEY (food_id) REFERENCES food_item(food_id),
    recipe_id int,
    FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id),
    category VARCHAR (50)
    );


    create table liked (
    liked_id int AUTO_INCREMENT PRIMARY KEY,
	user_id int,
    FOREIGN KEY (user_id) REFERENCES user_table(user_id),
    recipe_id int,
    FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id)
);

create table collection (
	collection_id int AUTO_INCREMENT PRIMARY KEY,
    collection_name VARCHAR(50),
    collection_description VARCHAR (100)
    );


create table recipe_collection (
	recipe_collection_id int AUTO_INCREMENT PRIMARY KEY,
    collection_id int,
    FOREIGN KEY (collection_id) references collection(collection_id),
    recipe_id int,
    FOREIGN KEY (recipe_id) references recipe(recipe_id)
    );

INSERT INTO food_group (food_group_id, group_name, group_fact)
 values(1, "Starchy Carbs", "Carbs give us energy and the slow release carbs are best"),
	   (2, "Fruit", "Contains vitamins and minerals, an apple a day keeps the doctor away"),
       (3, "Dairy", "Contains calcium for healthy teeth and stong bones"),
       (4, "Protein", "Helps muscles to grow and repair, perfect for people who are doing lots of exercise"),
       (5, "Fats", "Fat helps keep our organs safe but too much of it can be bad for your health"),
       (6, "Vegetables", "Keep us healthy, make sure you have your five a day");

INSERT INTO food_group (food_group_id, group_name, group_chart, group_fact)
values  (7, "TEST","jetbrains://pycharm/navigate/reference?project=TEAMC&path=templates/Images/chicksquare.jpeg", "Does this image work");

INSERT INTO food_source (source_id, source_name, source_fact1, source_fact2, source_fact3)
values(1, "Vegetable", "Potatoes were the first food to be grown in space. In 1996, potato plants were taken into space with the space shuffle Columbia", "Broccoli in general has a great deal of protein. Calorie for calorie, there is more protein in broccoli than steak. Since it doesn’t come with all those saturated and trans fats or cholesterol, you can get all the protein you need with a significantly lower risk of cardiovascular disease.", "Fruits and veggies have a ton of fiber. It can help keep your bowel movements regular, help lower cholesterol, regulate blood sugar, and help you feel fuller for longer. Pretty much all of those things can lead to you feeling healthier, losing weight, and eating less bad food."),
	(2, "Root", "The exact balance between sugar, starch and water determines how sweet the root is — from mellow carrots to spiky radishes, from potatoes to peppery turnips", "In the 1600s, Dutch agriculturalists developed carrots that emphasized orange tints and phased out purple. The tinkering didn’t stop there: Researchers at Southern Illinois University report that the British developed high-carotene carrots during World War II in order to enhance pilots’ night vision. Today, geneticists are breeding carrots in a wide color spectrum, including purple, red and yellow, all with slightly different nutritional properties", "Roots’ main job is to deliver water and minerals. They are, in essence, the starting point of the plant’s vascular system. But roots also serve as a plant’s anchor; act as a repository for carbohydrates, sugars, and proteins; and ensure the plant’s survival during the long cold winter months"),
    (3, "Stem", "Did you know that you can actually eat the stems of many different types of vegetables? For example, broccoli stems can be sliced thinly and sauteed in sesame oil. With that being said, though, the stem vegetable definition tends to focus on plants that are largely just, well, stems and stalks", "Many interesting products come from stems. Granulated sugar is processed from the above-ground stems of sugar cane and sugar beets. Maple sugar is obtained from the trunks of maple trees. Cinnamon comes from the bark of trees in the Cinnamomum genus.", "A stem is one of two main structural axes of a vascular plant, the other being the root. It supports leaves, flowers and fruits, transports water and dissolved substances between the roots and the shoots in the xylem and phloem, stores nutrients, and produces new living tissue."),
    (4, "Leaf", "Basil fights cancer, lifts mood, combats stress and is beneficial in the flu. There are different types of basil leaves like sweet, Greek, Thai, holy, cinnamon, and lettuce basil, each with its unique set of health benefits. Sweet basil is considered healthy for the heart as well as the brain since it helps to reduce blood pressure, cholesterol, and also improve mental alertness.", "Many leaves of plants are edible and are grown for food. Edible leaves include cabbage, lettuce, grape leaves, parsley, spinach, mustard greens, and Swiss chard.", "The main function of a plant’s leaves is to gather energy from the sun to carry out photosynthesis and make food for the plant. During photosynthesis, leaves use light energy to convert carbon dioxide and water into sugar"),
    (5, "Flower", "Herb flowers include think chives, lavender, rosemary, thyme, basil, dill, mint, sage, bee balm", "Chamomile is a floral herb used in cooking and traditional medicine for centuries. Medicinally, chamomile is often consumed to reduce anxiety and improve sleep quality", "Cauliflower and Broccoli are two plants whose flower are eaten as vegetables. Cauliflower and broccoli are the plants from cabbage family, whose flower is used to eat as vegetable."),
    (6, "Fruit", "Tomatoes are very high in the carotenoid Lycopene; eating foods with carotenoids can lower your risk of cancer", "Bananas are a favorite fruit around the world. It tastes good, it’s high in potassium, and it’s delicious when placed in a dish with ice cream and chocolate syrup. Bananas are technically herbs.", "Fruits are an excellent source of essential vitamins and minerals, and they are high in fiber. Fruits also provide a wide range of health-boosting antioxidants, including flavonoids. Eating a diet high in fruits and vegetables can reduce a person's risk of developing heart disease, cancer, inflammation, and diabetes."),
    (7, "Cereal", "People have been eating whole grains for more than 17,000 years – they picked seeds, rubbed off the husks and chewed the kernels raw or boiled them in water.", "Wheat is the most widely grown cereal grain. It’s grown on over 17 per cent of the total cultivated land in the world, and is the staple food for 35 per cent of the world’s population. It provides more calories and protein in the world’s diet than any other crop.", "Oats and rye were weeds that evolved to imitate wheat and barley to confuse farmers, and only later were farmed on purpose. "),
    (8, "Oil", "Oils, depending upon the cuisine and the food, can be used in different ways: • For baking: Use butter or a vegetable oil (as it has medium smoking point) • For sautés: Use olive oil • For salads: Use nut oil like almond oil or fruit oil like olive oil", "fats give you energy and cooking oil contains a portion of Omega 3 and Omega 6 fatty acids, which the body cannot do without because it cannot produce these on its own.", "A small amount of dietary fat is an essential part of the diet. It provides us with essential fatty acids (those the body cannot make itself) and helps us to absorb the fat soluble vitamins A, D, E and K"),
    (9, "Spices", "Spices were among the most demanded and expensive products available in Europe in the Middle Ages, the most common being black pepper, cinnamon (and the cheaper alternative cassia), cumin, nutmeg, ginger and cloves.", "Black pepper is the world’s most traded spice, and is one of the most common spices added to cuisines around the world. It is often described as the “king of spices,” and it shares a place on most dinner tables with salt.", "Fresh vanilla beans have no taste or aroma. They must undergo an extensive curing process that results in the release of vanillin with its distinct aroma and flavor. The traditional method begins with subjecting the harvested beans to a process of nightly sweating and daily exposure to the sun for about 10 days, until they become deep chocolate brown in color. This processing and the need for manual pollination make vanilla the second-most expensive spice after saffron."),
    (10, "Milk", "Milk is white because of its fat content. Although milk is composed of approximately 87% water, which is colorless, the fat and protein molecules floating inside it reflect all light wavelengths, making it appear white.", "Milk alternatives now command over 13% of the milk market. And the numbers are growing. Dairy Milk sales were down more than a billion dollars in 2018, largely due to the growing popularity of plant-based products. The US diary industry has repeatedly attempted to sue producers of dairy alternatives. They believe only animal milk deserves the label “milk.” ", "5 billion litres of milk is sold for drinking each year – that’s enough to fill 2000 Olympic swimming pools or if we were to drink a glass of milk a day for 54 million years"),
    (11, "Eggs", "Both the egg white and egg yolk contain 3 grams of protein each. So while we traditionally associate egg whites with protein, they don't really have an advantage over their yellow counterpart. The main difference, however, is in the calories. While a single yolk contains 3 grams of protein for 60 calories, a single egg white provides you with 3 grams of protein for just 15 calories. ", "Egg yolks will range in color—from pale yellow to deep orange to even a bright red—based on a hen's diet. Because free-range hens often eat more pigmented, nutritious foods that range from insects to grasses, eggs from these chickens often have richer-colored yolks.", "Eggshells are porous. That means they allow air to move through them. As eggs age, they take in air and develop an air pocket. In general, you can test an egg's freshness by placing it in a cup of water. If the egg floats, it indicates the egg is old and has a large air pocket, in which case you should pass on eating it. If it remains on the bottom, the egg is usually safe to eat."),
    (12, "Animal", "94% of mammal biomass (excluding humans) is livestock.", "The world now produces more that three times the quantity of meat as it did fifty years ago. ", "Animals are fed corn, wheat and soy that are grown through intensive industrial farming that use large amounts of pesticides, which can remain in their bodies and are passed on to the people who eat them, creating serious health hazards in humans."),
    (13, "Fish", "Fish is high in heart-healthy omega-3 fatty acids which can reduce inflammation, help protect your heart, and stave off chronic disease.", "Those who consume fish regularly had more grey brain matter, which reduces brain shrinkage and deterioration that can lead to brain function complications", "Aquaculture is one of the fastest growing forms of food production. Global marine and freshwater aquaculture production rose by 527 percent between 1990 and 2018 according to the United Nations Food and Agriculture Organization. "),
    (14, "Crustacean", "Shellfish aquaculture can  improve water quality. Oysters, clams, and other shellfish eat by filtering nutrients from the water. They remove excess nitrogen from ecosystems, helping to prevent an overgrowth of algae that can lead to dead zones. More than 10 million tons of crustaceans are produced by fishery or farming for human consumption, the majority of it being shrimps and prawn.", "Crustaceans are a very diverse group of invertebrate animals that includes the familiar crabs, lobsters, shrimps, prawns, krill, crayfish, woodlice, and barnacles. Some species extend down to the greatest depths in the sea and have been found in oceanic trenches at depths of up to 10,000 meters (32,800 feet).", "A study found that approximately 2% of the population (around 6 million people) has a seafood allergy (meaning they are allergic to fish, shellfish or both). Shellfish allergy symptoms generally develop within minutes to an hour of eating shellfish. They may include: Hives, itching or eczema (atopic dermatitis) Swelling of the lips, face, tongue and throat, or other parts of the body. Anaphylaxis can be treated with an emergency injection of epinephrine (adrenaline).");


INSERT INTO nutrition (nutrition_id, energy_kcal, energy_kj, fat, saturate, carbohydrate, sugar, starch, fibre, protein, salt)
values(	1	,	120	,	29	,	0.6	,	0.10	,	2.0	,	1.9	,	0.1	,	1.7	,	2.9	,	0.00	),
(	2	,	934	,	225	,	16.2	,	6.94	,	0.0	,	0.0	,	0.0	,	0.0	,	19.7	,	0.20	),
(	3	,	1162	,	276	,	9.2	,	3.51	,	30.5	,	1.8	,	28.7	,	0.0	,	17.8	,	36.40	),
(	4	,	511	,	124	,	3.3	,	1.39	,	0.6	,	0.6	,	0.0	,	25.3	,	10.4	,	0.05	),
(	5	,	460	,	109	,	1.0	,	0.30	,	0.0	,	0.0	,	0.0	,	0.0	,	24.9	,	0.73	),
(	6	,	161	,	38	,	0.5	,	0.10	,	5.9	,	5.5	,	0.2	,	3.9	,	0.7	,	0.10	),
(	7	,	1700	,	400	,	0.0	,	0.00	,	100.0	,	100.0	,	0.0	,	0.0	,	0.0	,	0.01	),
(	8	,	1601	,	385	,	17.3	,	2.60	,	31.7	,	31.7	,	0.0	,	27.2	,	12.0	,	0.08	),
(	9	,	97	,	23	,	0.5	,	0.01	,	1.2	,	0.9	,	0.3	,	2.8	,	2.1	,	0.12	),
(	10	,	1716	,	414	,	34.9	,	21.68	,	0.1	,	0.1	,	0.0	,	0.0	,	24.9	,	1.81	),
(	11	,	108	,	26	,	0.5	,	0.10	,	3.6	,	3.6	,	0.0	,	1.3	,	1.1	,	0.01	),
(	12	,	729	,	173	,	6.4	,	0.90	,	0.0	,	0.0	,	0.0	,	0.0	,	28.9	,	0.15	),
(	13	,	818	,	196	,	10.9	,	2.89	,	0.0	,	0.0	,	0.0	,	0.0	,	24.4	,	0.25	),
(	14	,	818	,	196	,	10.9	,	2.89	,	0.0	,	0.0	,	0.0	,	0.0	,	24.4	,	0.25	),
(	15	,	1645	,	397	,	32.2	,	12.00	,	2.2	,	1.0	,	1.2	,	1.0	,	24.0	,	3.50	),
(	16	,	106	,	25	,	0.3	,	0.20	,	4.7	,	4.7	,	0.0	,	1.1	,	0.4	,	0.28	),
(	17	,	1457	,	343	,	0.7	,	0.10	,	83.6	,	0.0	,	83.6	,	0.0	,	0.6	,	0.03	),
(	18	,	65	,	16	,	0.6	,	0.20	,	1.2	,	1.2	,	0.0	,	0.7	,	1.0	,	0.01	),
(	19	,	172	,	41	,	1.6	,	0.20	,	1.4	,	1.3	,	0.1	,	3.8	,	3.4	,	0.11	),
(	20	,	275	,	66	,	3.9	,	2.36	,	4.6	,	4.6	,	0.0	,	0.0	,	3.1	,	0.14	),
(	21	,	1700	,	400	,	0.0	,	0.00	,	99.5	,	99.5	,	0.0	,	0.0	,	0.5	,	0.01	),
(	22	,	2041	,	496	,	53.7	,	33.39	,	1.6	,	1.6	,	0.0	,	0.0	,	1.6	,	0.06	),
(	23	,	548	,	132	,	9.0	,	2.52	,	0.0	,	0.0	,	0.0	,	0.0	,	12.6	,	0.39	),
(	24	,	727	,	174	,	10.5	,	0	,	3.4	,	0.5	,	2.9	,	2.6	,	15.3	,	1.08	),
(	25	,	183	,	44	,	1.3	,	0.16	,	2.7	,	2.3	,	0.4	,	5.0	,	2.9	,	0.08	),
(	26	,	461	,	111	,	2.5	,	1.20	,	12.9	,	0.6	,	12.3	,	12.3	,	3.0	,	0.05	),
(	27	,	444	,	105	,	0.6	,	0.10	,	14.9	,	1.6	,	13.4	,	4.1	,	7.9	,	0.01	),
(	28	,	133	,	32	,	0.4	,	0.08	,	3.1	,	2.2	,	0.9	,	3.4	,	2.1	,	0.00	),
(	29	,	95	,	23	,	0.6	,	0.06	,	0.7	,	0.7	,	0.0	,	1.5	,	2.9	,	0.02	),
(	30	,	170	,	40	,	0.1	,	0.00	,	7.8	,	6.1	,	0.0	,	2.2	,	1.0	,	0.01	),
(	31	,	85	,	20	,	0.3	,	0.10	,	2.6	,	2.4	,	0.1	,	1.6	,	0.8	,	0.01	),
(	32	,	1276	,	303	,	4.8	,	0.12	,	37.9	,	7.3	,	30.6	,	10.4	,	21.8	,	0.53	),
(	33	,	1914	,	458	,	22.3	,	1.54	,	41.3	,	2.3	,	39.0	,	10.5	,	17.8	,	0.42	),
(	34	,	1319	,	313	,	3.3	,	1.57	,	56.3	,	19.8	,	36.5	,	14.1	,	7.4	,	0.09	),
(	35	,	1321	,	319	,	12.9	,	2.14	,	19.1	,	10.3	,	8.8	,	34.9	,	14.1	,	0.17	),
(	36	,	535	,	130	,	12.7	,	2.67	,	1.3	,	1.3	,	0.0	,	2.5	,	1.4	,	0.01	),
(	37	,	1305	,	307	,	0.0	,	0.00	,	76.4	,	76.4	,	0.0	,	0.0	,	0.4	,	0.03	),
(	38	,	1263	,	299	,	1.9	,	0.20	,	41.6	,	1.1	,	40.5	,	17.3	,	24.4	,	0.03	),
(	39	,	121	,	29	,	0.3	,	0.10	,	0.7	,	0.7	,	0.0	,	2.8	,	0.7	,	0.01	),
(	40	,	227	,	54	,	0.6	,	0.15	,	10.4	,	10.1	,	0.3	,	1.1	,	0.7	,	0.01	),
(	41	,	88	,	21	,	0.2	,	0.04	,	0.3	,	0.3	,	0.0	,	0.7	,	2.5	,	0.01	),
(	42	,	382	,	91	,	2.2	,	0.34	,	0.0	,	0.0	,	0.0	,	0.0	,	17.7	,	1.00	),
(	43	,	3696	,	899	,	99.9	,	14.30	,	0.0	,	0.0	,	0.0	,	0.0	,	0.0	,	0.00	),
(	44	,	454	,	111	,	11.0	,	1.70	,	0.0	,	0.0	,	0.0	,	4.0	,	0.9	,	3.33	),
(	45	,	1716	,	412	,	29.7	,	19.25	,	0.9	,	0.9	,	0.0	,	0.0	,	35.4	,	1.65	),
(	46	,	392	,	93	,	1.5	,	0.56	,	10.4	,	2.2	,	6.4	,	5.3	,	6.9	,	0.00	),
(	47	,	1505	,	355	,	1.4	,	0.44	,	73.6	,	0.6	,	73.0	,	4.0	,	10.0	,	0.01	),
(	48	,	357	,	84	,	0.1	,	0.03	,	17.9	,	0.9	,	17.0	,	2.0	,	1.9	,	0.01	),
(	49	,	3696	,	899	,	99.9	,	6.60	,	0.0	,	0.0	,	0.0	,	0.0	,	0.0	,	0.00	),
(	50	,	125	,	30	,	0.3	,	0.00	,	4.2	,	4.2	,	0.0	,	1.5	,	1.8	,	0.03	),
(	51	,	170	,	40	,	0.1	,	0.00	,	7.8	,	6.1	,	0.0	,	2.2	,	1.0	,	0.01	),
(	52	,	112	,	27	,	0.2	,	0.05	,	4.3	,	4.2	,	0.0	,	2.2	,	0.8	,	0.00	),
(	53	,	317	,	76	,	0.0	,	0.00	,	0.2	,	0.2	,	0.0	,	0.0	,	0.2	,	0.02	),
(	54	,	718	,	173	,	8.6	,	2.54	,	12.1	,	1.3	,	10.8	,	9.3	,	7.1	,	0.22	),
(	55	,	76	,	18	,	0.1	,	0.00	,	0.9	,	0.9	,	0.0	,	1.4	,	0.9	,	0.01	),
(	56	,	1465	,	345	,	0.5	,	0.14	,	76.1	,	0.1	,	76.0	,	1.1	,	8.5	,	0.00	),
(	57	,	3062	,	745	,	82.2	,	52.09	,	0.6	,	0.6	,	0.0	,	0.0	,	0.6	,	1.83	),
(	58	,	1300	,	314	,	25.0	,	9.15	,	8.8	,	2.6	,	6.2	,	2.8	,	11.9	,	1.18	),
(	59	,	1213	,	290	,	15.4	,	3.76	,	21.9	,	7.7	,	14.2	,	0.6	,	15.6	,	40.75	),
(	60	,	736	,	178	,	15.2	,	4.40	,	6.3	,	2.7	,	3.6	,	0.1	,	3.8	,	0.38	),
(	61	,	1474	,	349	,	2.5	,	0.40	,	62.3	,	3.8	,	58.5	,	11.7	,	13.4	,	0.01	),
(	62	,	121	,	29	,	0.8	,	0.10	,	1.6	,	1.5	,	0.1	,	2.1	,	2.8	,	0.35	),
(	63	,	1103	,	266	,	21.3	,	1.70	,	10.6	,	6.7	,	3.9	,	6.8	,	4.7	,	3.80	),
(	64	,	305	,	73	,	4.2	,	0.50	,	0.6	,	0.2	,	0.3	,	0.4	,	8.1	,	0.01	),
(	65	,	340	,	81	,	0.2	,	0.04	,	12.9	,	12.9	,	0.0	,	4.7	,	4.4	,	0.12	),
(	66	,	1220	,	289	,	5.7	,	2.50	,	49.1	,	1.9	,	47.2	,	3.6	,	8.6	,	1.56	),
(	67	,	3062	,	745	,	82.2	,	52.09	,	0.6	,	0.6	,	0.0	,	0.0	,	0.6	,	0.02	),
(	68	,	891	,	215	,	16.5	,	6.20	,	0.0	,	0.0	,	0.0	,	0.0	,	16.5	,	2.85	),
(	69	,	3696	,	899	,	99.9	,	6.60	,	0.0	,	0.0	,	0.0	,	0.0	,	0.0	,	0.00	),
(	70	,	1474	,	349	,	2.5	,	0.40	,	62.3	,	3.8	,	58.5	,	11.7	,	13.4	,	0.01	),
(	71	,	413	,	97	,	0.1	,	0.00	,	22.7	,	20.5	,	2.2	,	0.0	,	1.4	,	3.75	),
(	72	,	71	,	17	,	0.1	,	0.03	,	3.0	,	3.0	,	0.0	,	1.0	,	0.5	,	0.01	),
(	73	,	377	,	89	,	0.3	,	0.10	,	19.0	,	8.0	,	10.9	,	2.7	,	1.1	,	0.09	),
(	74	,	317	,	76	,	0.0	,	0.00	,	3.0	,	3.0	,	0.0	,	0.0	,	0.1	,	0.03	),
(	75	,	1466	,	345	,	1.1	,	0.27	,	76.7	,	0.0	,	76.7	,	0.8	,	6.8	,	0.00	),
(	76	,	1499	,	354	,	3.1	,	0.58	,	70.6	,	0.8	,	69.8	,	3.3	,	9.3	,	0.00	);

INSERT INTO gender ( gender_id, gender_name)
values
	(1, "Female"),
    (2, "Male"),
    (3, "Non-binary"),
    (4, "Transgender"),
    (5, "Intersex"),
    (6, "prefer not to say");

INSERT INTO user_table (user_id, user_name, user_surname, gender_id, user_age, username, password)
values(1, "Winston", "Churchill", "2", 78, "Win1", aes_encrypt('church789', 'key1234')),
	  (2, "Justin", "Timberlake", "2", 41, "JB", aes_encrypt('password895', 'key1234')),
	  (3, "David", "Beckham", "2", 43, "GoldenBalls", aes_encrypt('Balls5', 'key1234')),
	  (4, "Elvis", "Presley", "2", 61, "Vegas", aes_encrypt('shookup73', 'key1234')),
	  (5, "Elizabeth", "Hurley", "1", 57, "Hurls", aes_encrypt('Granty', 'key1234')),
	  (6, "Martha", "Stewart", "1", 18, "MSTEW", aes_encrypt('Food4587', 'key1234')),
	  (7, "Judi", "Dench", "1", 82, "Jench", aes_encrypt('password3625', 'key1234')),
	  (8, "James", "Nesbitt", "1", 17, "Jbitt", aes_encrypt('Nessy1', 'key1234')),
	  (9, "Sam", "Smith", "6", 25, "Smithy", aes_encrypt('password7841', 'key1234')),
	  (10, "Nigella", "Lawson", "1", 29, "Ellaw", aes_encrypt('Cookery789', 'key1234'));

 select user_id, username, cast(aes_decrypt(password, 'key1234') as char(100)) from user_table;

INSERT INTO recipe
values(1, "Spaghetti Bolognese", 'Minced beef with tomato sauce and spaghetti pasta', "Heat a large saucepan over a medium heat. Add a tablespoon of olive oil and once hot add the beef mince and a pinch of salt and pepper. Cook the mince until well browned over a medium-high heat (be careful not to burn the mince. It just needs to be a dark brown colour). Once browned, transfer the mince to a bowl and set aside.
Add another tablespoon of oil to the saucepan you browned the mince in and turn the heat to medium. Add the onions and a pinch of salt and fry gently for 5-6 minutes, or until softened and translucent. Add the garlic and cook for another 2 minutes. Add the grated carrot then pour the mince and any juices in the bowl back into the saucepan.
Add the tomatoes to the pan and stir well to mix. Pour in the stock, bring to a simmer and then reduce the temperature to simmer gently for 45 minutes, or until the sauce is thick and rich. Taste and adjust the seasoning as necessary.
When ready to cook the spaghetti, heat a large saucepan of water and add a pinch of salt. Cook according to the packet instructions. Once the spaghetti is cooked through, drain and add to the pan with the bolognese sauce. Mix well and serve.", "2 tbsp olive oil, 400g/14oz beef mince, 1 onion, diced, 2 garlic cloves, chopped, 100g/3½oz carrot, grated, 2 x 400g tin chopped tomatoes, 400ml/14fl oz stock made from stock cube. Ideally beef, but any will do, 400g/14oz dried spaghetti, salt and pepper", 'Dinner', "Italian", 30, 45, 4),

	 (2, "Chicken Thai Green Curry", "Chicken with vegetables in a mild/spicy sauce, served with rice", "Heat the oil in a wok over a high heat until smoking. Add the green curry paste and stir fry for 1–2 minutes, or until fragrant.
Add the chicken strips and stir until coated in the curry paste. Continue to stir-fry for 1–2 minutes, or until the chicken has browned on all sides.
Add the coconut milk, lime leaves, fish sauce and sugar and stir well. Bring the mixture to the boil, then reduce the heat until the mixture is simmering. Continue to simmer for 8–10 minutes, or until the sauce has thickened.
Add the green beans and asparagus and continue to simmer for 2–3 minutes, stirring regularly, until just tender. Season with salt and pepper.
To serve, spoon the rice into four serving bowls, then ladle over the Thai green chicken curry. Sprinkle over the coriander leaves.", "1 tbsp vegetable oil, 2 tbsp ready-made Thai green curry paste, 6 chicken thighs, skin and bones removed, meat cut into strips, 400ml tin coconut milk, 2 lime leaves (optional), 2 tbsp Thai fish sauce, 1 tbsp caster sugar, handful green beans, trimmed, handful asparagus spears, salt and freshly ground black pepper, Thai fragrant rice, cooked according to packet instructions, handful fresh coriander leaves (optional)", "Dinner", "Thai", 30, 20, 4),
	  (3, "Cottage Pie", "Cooked minced meat and vegetables in a gravy with mashed potato on top", "Heat half of the oil in a large heavy-based pan. Add the onion and cook until softened. Tip it onto a plate.
Return the pan to the heat and add the remaining oil. When it's hot, fry the mince, in batches if needed, for 4–5 minutes, or until browned all over. Stir in the cooked onion and tomato purée and cook for 1 minute. Stir in the flour and cook for a further minute. Pour in the red wine, scraping up any caramelised bits with a wooden spoon, and add the thyme.
Add the stock and simmer for 45 minutes, or until the mince is tender and the mixture has thickened. Season to taste, and add a few dashes of Worcestershire sauce. Keep warm over a very low heat. Preheat the grill to high.
Meanwhile, for the mash, put the potatoes in a pan of salted water and bring to the boil. Reduce the heat and simmer for 12–15 minutes, or until they are tender. Drain and return the potatoes to the pan, then place over the heat for about 1 minute to drive off any excess moisture. Mash well, then add the butter and milk, beating to form a smooth mash. Season to taste.
Put the cottage pie filling in a baking dish and spoon the mash over the top. Grill for 8–10 minutes, or until golden-brown.
Meanwhile, boil the peas in boiling water in a small saucepan for 3–4 minutes, then drain and add the butter. Serve the cottage pie with the peas.","50ml/2fl oz olive oil, 1 large onion or 3–4 banana shallots, finely chopped, 650g/1lb 7oz beef mince, 2 tbsp tomato purée, 1 tbsp plain flour, 150ml/5fl oz red wine, 4 sprigs fresh thyme, leaves only, 400ml/14fl oz beef stock, Worcestershire sauce, salt and freshly ground black pepper, 900g/2lb King Edward potatoes, peeled and chopped, 115g/4oz butter, 125ml/4½fl oz milk, 150g/5½oz frozen peas, 50g/1¾oz butter", "Dinner", "British", 30, 120, 6),
      (4, "Breakfast Wrap", "Wraps filled with breakfast items, can be made into a vegetarian version", "Heat a non-stick frying pan and add the peppers and mushrooms, fry for a few minutes until softened, then add the spinach and paprika. (If your pan tends to stick you will need to use a little oil or cooking spray.)
Crack in the eggs and cook to allow the eggs scramble with the vegetables all in the one pan. Add plenty of black pepper and the parsley.
Place the tortilla on a microwave-safe plate and heat on high for 10 seconds.
To serve, spoon the egg and vegetable mixture onto the tortilla, fold up one end, then fold in the sides.", "45g/1½oz pepper (about half a pepper), sliced, 2 mushrooms, sliced, 80g/2¾oz spinach, pinch ground paprika, 2 free-range eggs, freshly ground black pepper, 1 tsp freshly chopped parsley, 1 tortilla wrap", "Breakfast", "British", 30, 10, 1),
      (5, "Rhubarb Crumble", "A butter and flour crumble served on top of stewed rhubarb", "Preheat the oven to 180C/160C Fan/Gas 4.
Cut the rhubarb into 7½cm/3in long sticks and place on an oven tray. Sprinkle with 4 tablespoons of water and the caster sugar. Roast for 10 minutes. Sprinkle over the ginger and mix well.
Fill an ovenproof dish about 4cm/1½in deep with the rhubarb.
Rub the butter into the flour then mix in the demerara sugar to make the crumble topping. Sprinkle over the rhubarb and bake for 35–45 minutes, or until the crumble topping is crisp and golden-brown and the rhubarb filling has softened and is bubbling.
Allow to cool slightly before serving with double cream.", "10 sticks of rhubarb, 8 tbsp caster sugar, 1 tsp ground ginger, 110g/4oz butter, softened, 110g/4oz demerara sugar, 200g/7oz plain flour, double cream", "Dessert", "British", 25, 45, 4),
      (6, "Spicy Tofu Fajitas", "Chilli spiced vegeatbles and tofu fried together and served in wraps", "Preheat the oven to 180C/160C Fan/Gas 4. Wrap the tortillas in kitchen foil and place in the oven to warm.
Cut the tofu into triangles, each around 5mm thick. Sprinkle the cornflour over a plate and roll the tofu in the cornflour, a piece at a time, then place on a clean plate.
Heat the oil in a frying pan over a medium heat. Add the tofu pieces and fry for 3–4 minutes, turning once or twice, until golden brown and crisp. Drain on a plate lined with kitchen paper.
Add the peppers and onion to the pan and stir-fry for 3 minutes. Stir in the spices and cook for a few seconds more, then add the kale and tomatoes. Season with a little salt and lots of black pepper. Cook for 2 minutes, or until the tomatoes are soft. Add in the tofu and gently heat through.
Pile into warmed tortillas and serve with the yoghurt, coriander and a squeeze of lime juice.", "4 small wholemeal tortillas, 200g/7oz very firm tofu, drained, 2 tbsp cornflour or easy-cook polenta, 2 tbsp extra virgin olive oil or cold pressed rapeseed oil, 2 peppers, deseeded and thinly sliced, ½ red onion, cut into thin wedges, 1 tsp smoked paprika, ½ tsp ground cumin, ½ tsp ground coriander, 50g/1¾oz curly kale, thickly shredded and any tough stalks removed, 2 tomatoes, roughly chopped, salt and freshly ground black pepper, 4 tbsp non-dairy yoghurt, fresh coriander, lime wedge", "Lunch", "Mexican", 30, 10, 2),
      (7, "Sausage and Lentil Stew", "Meaty sausages and lentils are combined in a thick sauce", "Heat one tablespoon of the oil in a large, deep frying pan or shallow casserole and fry the sausages over a medium heat for 6–8 minutes, or until lightly browned on all sides. Transfer to a plate and return the pan to the heat.
Add the remaining oil and onion and gently fry for 4–5 minutes, or until softened and lightly browned, stirring regularly. Add the tomatoes and lentils, crumble over the stock cube and add the red wine (or the equivalent extra stock). Add 500ml/18fl oz of water to the pan.
Cover loosely with a lid and bring to a gentle simmer. Cook for 15 minutes, stirring occasionally. Return the sausages to the pan and cook for 10–15 minutes, or until the lentils are tender and the sausages cooked, stirring regularly. Add a little extra water if needed.
Serve with lots of freshly cooked green leafy vegetables, or warmed, crusty bread.", "2 tbsp olive oil, 400g/14oz sausages, ideally spicy sausages such as Toulouse or Spanish-style pork, 1 onion, thinly sliced, 400g chopped tomatoes with herbs, 160g/5¾oz Puy lentils, 1 chicken or pork stock cube, 75ml/2½fl oz oz red wine, or extra stock", "Dinner", "French", 20, 45, 4),
      (8, "Chicken and Chorizo Paella", "Paella rice with chicken and chorizo fried together in a pan", "Preheat the oven to 180C/160C Fan/Gas 4.
Heat the oil in a large, lidded, heatproof pan or paella pan. Fry the chicken until the pieces are evenly browned, turning them regularly as they cook. You may need to do this in two batches, depending on the size of your pan. Remove the chicken from the pan and set aside.
Fry the slices of chorizo in the pan until crisp. They will release their juices into the pan, which adds a lot of flavour to the dish. Add the onion to the pan, and cook gently until soft, then add the garlic and fry for a further 2–3 minutes. Add the red peppers, chillies and smoked paprika, cook for another 2–3 minutes. Return the chicken pieces to the pan and pour in the stock. Simmer gently for 20–25 minutes until the chicken is tender.
Add the rice to the pan, cover with the lid and put into the preheated oven. Cook for 30 minutes, or until all the liquid has been absorbed and the rice is cooked. Alternatively, if using a paella pan which won’t fit in the oven, cover tightly with foil and continue cooking on the stove over a low heat for the same cooking time. If using mussels or clams, add them to the pan for the final 20 minutes cooking time. Discard any shells that remain closed after cooking. Check the chicken is cooked by piercing the thickest part of a piece with a skewer – if the juices run clear the chicken is cooked.
Sprinkle with parsley before bringing the pan to the table. Let your guests help themselves.", "1–2 tbsp oil, 12 whole chicken pieces (legs or thighs), on the bone, 1 chorizo sausage, sliced into 3mm/⅛in thick slices, 1 large onion, finely chopped, 3 garlic cloves, crushed, 2 red peppers, seeds removed, sliced, 2–3 red chillies, seeds removed, chopped, 2 tsp smoked paprika, 1.5 litres/2½ pints chicken stock, 400g/14oz paella rice, 12 mussels or clams, (optional) cleaned, open and damaged shells discarded, handful parsley, roughly chopped", "Dinner", "Spanish", 30, 120, 6),
      (9, "Breakfast Quesadillas", "Refried beans, tomatoes and meat sprinkled with cheddar cheese and served toasted in a wrap", "First make the salsas. For the tomato salsa, put the tomatoes in a bowl. Mix in the onion and jalapeños. Add the honey, lime juice, cayenne pepper, salt and pepper and mix well. Add the coriander and set aside for 30 minutes. Make the mango salsa in the same way, in a separate bowl.
Preheat the oven to 180C/160C Fan/Gas 4. Lightly grease a large baking sheet.
Heat a frying pan over a high heat and add a knob of butter. Cook the bacon for a few minutes until crisp. Remove from the heat and leave to cool a little.
Whisk the eggs together with salt and pepper and a splash of milk. Melt a large knob of butter in a non-stick saucepan. Add the eggs and cook over a low heat, stirring until the eggs are softly scrambled. Remove from the heat.
To assemble, melt a little more butter. Lay the tortillas on a board and lightly brush with the melted butter. Place a quarter of the bacon on one half of each tortilla. Top with the scrambled egg, and a couple of tablespoons of tomato salsa. Sprinkle on some chopped red onion, grated cheese and a little chopped coriander; don’t overfill.
Fold over the tortilla to make a semicircle shape, brush the top with more melted butter and sprinkle over a pinch of cayenne pepper. Cut each tortilla in half and carefully place on the baking sheet.
Bake for 10 minutes. Leave to cool slightly and serve with the mango salsa, soured cream, guacamole, refried beans and any remaining tomato salsa.","unsalted butter, for cooking, 6 rashers unsmoked bacon, chopped, 6 large free-range eggs, splash milk, 4 flour tortillas, ½ small red onion, finely chopped, 4 tbsp cheddar or Monterey Jack cheese, grated, small handful chopped fresh coriander, cayenne pepper, 150g/5½oz small cherry tomatoes, chopped, ½ red onion, finely chopped, 1–2 tsp finely chopped hot green jalapeño chillies (from a jar), 1 tbsp honey, 1 lime, juice only, pinch cayenne peppe, ¼ tsp salt pinch freshly ground black pepper, 4 tbsp chopped fresh coriander, 1 ripe mango, peeled, stone removed, finely chopped, ½ red onion, finely chopped, 1–2 tsp finely chopped hot green jalapeño chillies (from a jar), 1 lime, juice only, pinch cayenne pepper, ¼ tsp salt pinch freshly ground black pepper, 4 tbsp chopped fresh coriander, 4 tbsp soured cream, guacamole, refried beans", "Breakfast", "Mexican", 40, 25, 4),
      (10, "Healthy Tuna Pasta Salad", "Healthy salad vegetables served with tinned tuna ", "Place the cooked penne into a large bowl with all the other ingredients (the residual heat from the pasta will heat the other ingredients to give you a warm pasta dish).
Place the grated carrot, cucumber and chopped tomatoes into a separate bowl and mix together.Serve both bowls of salad together at the table, warm, or refrigerate and mix together for a packed lunch salad.","150g/5oz whole wheat pasta, cooked according to packet instructions (to al dente) and drained, 150g/5oz olives, chopped, 150g/5oz canned tuna, drained, 75g/2½oz Parmesan, grated, 2 tbsp olive oil, 3 tbsp chopped fresh flatleaf parsley, 3 carrots, grated or sliced into ribbons using a vegetable peeler, 1 cucumber, seeds removed and grated or sliced into ribbons using a vegetable peeler, 2 tomatoes, chopped", "Lunch", "British", 30, 10, 5);



INSERT INTO food_item (food_id, food_name, ghg_emission, land_use, freshwater_withdraw, food_group_id, source_id, nutrition_id)
values(	1	,	"asparagus"	,	0.53	,	0.38	,	102.5	,	6	,	3	,	1	),
(	2	,	"beef mince"	,	99.48	,	326.21	,	1451.2	,	4	,	12	,	2	),
(	3	,	"beef stock"	,	99.48	,	326.21	,	1451.2	,	4	,	12	,	3	),
(	4	,	"black pepper"	,	1.81	,	1.83	,	217.7	,	6	,	9	,	4	),
(	5	,	"tuna"	,	13.63	,	8.41	,	3691.3	,	4	,	12	,	5	),
(	6	,	"carrot"	,	0.43	,	0.33	,	28.4	,	6	,	2	,	6	),
(	7	,	"caster sugar"	,	3.2	,	2.04	,	620.1	,	5	,	3	,	7	),
(	8	,	"cayenne pepper"	,	0.53	,	0.38	,	102.5	,	2	,	9	,	8	),
(	9	,	"fresh corriander"	,	0.53	,	0.38	,	102.5	,	6	,	4	,	9	),
(	10	,	"cheddar cheese"	,	23.88	,	87.79	,	5605.2	,	3	,	10	,	10	),
(	11	,	"cherry tomato"	,	2.09	,	0.8	,	369.8	,	2	,	6	,	11	),
(	12	,	"chicken breast"	,	9.87	,	12.22	,	660	,	4	,	12	,	12	),
(	13	,	"chicken leg"	,	9.87	,	12.22	,	660	,	4	,	12	,	13	),
(	14	,	"chicken thigh"	,	9.87	,	12.22	,	660	,	4	,	12	,	14	),
(	15	,	"chorizo"	,	12.31	,	17.36	,	1795.8	,	4	,	12	,	15	),
(	16	,	"coconut milk"	,	0.98	,	0.66	,	27.8	,	2	,	6	,	16	),
(	17	,	"cornflour"	,	1.57	,	3.85	,	647.5	,	1	,	7	,	17	),
(	18	,	"cucumber"	,	0.53	,	0.38	,	102.5	,	6	,	6	,	18	),
(	19	,	"curly kale"	,	0.51	,	0.55	,	119.4	,	6	,	4	,	19	),
(	20	,	"dairy milk"	,	3.15	,	8.95	,	628.2	,	3	,	10	,	20	),
(	21	,	"demerara sugar"	,	3.2	,	2.04	,	620.1	,	5	,	3	,	21	),
(	22	,	"double cream"	,	3.15	,	8.95	,	628.2	,	3	,	10	,	22	),
(	23	,	"egg"	,	4.67	,	6.27	,	577.7	,	4	,	11	,	23	),
(	24	,	"fish sauce"	,	1.81	,	1.83	,	217.7	,	4	,	9	,	24	),
(	25	,	"fresh parsley"	,	1.81	,	1.83	,	217.7	,	6	,	4	,	25	),
(	26	,	"fresh thyme"	,	1.81	,	1.83	,	217.7	,	6	,	4	,	26	),
(	27	,	"garlic"	,	1.53	,	2.41	,	419.6	,	6	,	2	,	27	),
(	28	,	"green bean"	,	0.98	,	7.46	,	396.6	,	6	,	1	,	28	),
(	29	,	"green chilli"	,	1.81	,	1.83	,	217.7	,	2	,	6	,	29	),
(	30	,	"green onion"	,	0.5	,	0.39	,	14.3	,	6	,	1	,	30	),
(	31	,	"green pepper"	,	1.81	,	1.83	,	217.7	,	2	,	6	,	31	),
(	32	,	"ground coriander"	,	1.81	,	1.83	,	217.7	,	6	,	9	,	32	),
(	33	,	"ground cumin"	,	1.81	,	1.83	,	217.7	,	6	,	9	,	33	),
(	34	,	"ground ginger"	,	1.81	,	1.83	,	217.7	,	6	,	9	,	34	),
(	35	,	"ground paprika"	,	1.81	,	1.83	,	217.7	,	6	,	9	,	35	),
(	36	,	"guacomole"	,	1.53	,	2.41	,	419.6	,	2	,	6	,	36	),
(	37	,	"honey"	,	3.2	,	2.04	,	620.1	,	5	,	12	,	37	),
(	38	,	"lentil"	,	1.79	,	15.57	,	435.7	,	1	,	7	,	38	),
(	39	,	"lime"	,	0.39	,	0.86	,	82.7	,	2	,	6	,	39	),
(	40	,	"mango"	,	0.39	,	0.86	,	82.7	,	2	,	6	,	40	),
(	41	,	"mushroom"	,	0.53	,	0.38	,	102.5	,	6	,	1	,	41	),
(	42	,	"mussels"	,	26.87	,	2.97	,	3515.4	,	4	,	14	,	42	),
(	43	,	"olive oil"	,	1.53	,	2.41	,	419.6	,	5	,	8	,	43	),
(	44	,	"olives"	,	1.53	,	2.41	,	419.6	,	2	,	6	,	44	),
(	45	,	"parmesan cheese"	,	23.88	,	87.79	,	5605.2	,	3	,	10	,	45	),
(	46	,	"peas"	,	0.98	,	7.46	,	396.6	,	6	,	1	,	46	),
(	47	,	"plain flour"	,	1.18	,	1.11	,	17.1	,	1	,	7	,	47	),
(	48	,	"potato"	,	0.46	,	0.88	,	59.1	,	1	,	2	,	48	),
(	49	,	"rapeseed oil"	,	1.53	,	2.41	,	419.6	,	5	,	8	,	49	),
(	50	,	"red chilli"	,	0.53	,	0.38	,	102.5	,	2	,	6	,	50	),
(	51	,	"red onion"	,	0.5	,	0.39	,	14.3	,	6	,	1	,	51	),
(	52	,	"red pepper"	,	0.53	,	0.38	,	102.5	,	2	,	6	,	52	),
(	53	,	"red wine"	,	1.79	,	1.78	,	78.9	,	2	,	6	,	53	),
(	54	,	"refried beans"	,	0.53	,	0.38	,	102.5	,	1	,	1	,	54	),
(	55	,	"rhubarb"	,	0.53	,	0.38	,	102.5	,	2	,	3	,	55	),
(	56	,	"basmati rice"	,	4.45	,	2.8	,	2248.4	,	1	,	7	,	56	),
(	57	,	"salted butter"	,	3.15	,	8.95	,	628.2	,	3	,	10	,	57	),
(	58	,	"sausage"	,	12.31	,	17.36	,	1795.8	,	4	,	12	,	58	),
(	59	,	"chicken stock"	,	9.87	,	12.22	,	660	,	4	,	12	,	59	),
(	60	,	"sour cream"	,	3.15	,	8.95	,	628.2	,	3	,	10	,	60	),
(	61	,	"spaghetti"	,	1.57	,	3.85	,	647.5	,	1	,	7	,	61	),
(	62	,	"spinach"	,	0.53	,	0.38	,	102.5	,	6	,	4	,	62	),
(	63	,	"thai green curry paste"	,	2.48	,	7.6	,	482.4	,	6	,	9	,	63	),
(	64	,	"tofu"	,	3.16	,	3.52	,	148.6	,	4	,	1	,	64	),
(	65	,	"tomato puree"	,	2.09	,	0.8	,	369.8	,	2	,	6	,	65	),
(	66	,	"tortilla"	,	1.18	,	1.11	,	17.1	,	1	,	7	,	66	),
(	67	,	"unsalted butter"	,	3.15	,	8.95	,	628.2	,	3	,	10	,	67	),
(	68	,	"unsmoked bacon"	,	12.31	,	17.36	,	1795.8	,	4	,	12	,	68	),
(	69	,	"vegetable oil"	,	0.53	,	0.38	,	102.5	,	5	,	8	,	69	),
(	70	,	"whole wheat pasta"	,	1.57	,	3.85	,	647.5	,	1	,	7	,	70	),
(	71	,	"worcestershire sauce"	,	0.53	,	0.38	,	102.5	,	5	,	9	,	71	),
(	72	,	"tomato"	,	2.09	,	0.8	,	369.8	,	2	,	5	,	72	),
(	73	,	"sweet potato"	,	0.46	,	0.88	,	59.1	,	1	,	2	,	73	),
(	74	,	"white wine"	,	1.79	,	1.78	,	78.9	,	2	,	6	,	74	),
(	75	,	"thai rice"	,	4.45	,	2.8	,	2248.4	,	1	,	7	,	75	),
(	76	,	"brown rice"	,	4.45	,	2.8	,	2248.4	,	1	,	7	,	76	);

INSERT INTO collection
values(1, "Easy Meals", "Easy meals to make recipes"),
	  (2, "Vegan", "Meals and snacks suitable for vegans"),
	  (3, "Winter Warmers", "Hearty meals ideal for the cold weather"),
	  (4, "Brunch", "Filling meals suitable to eat bewteen breakfast and lunch"),
	  (5, "Seasonal", "Recipes using ingredients that are available seasonally"),
	  (6, "Vegetarian", "Recipes suitable for vegetarians"),
	  (7, "Curries", "All things curry"),
	  (8, "Dinner Party", "Showstopping recipes for dinner parties or to impress your friends and family"),
	  (9, "Baby Food", "Recipes for babies and toddlers"),
	  (10, "Healthy", "Healthy recipes for the whole family");

INSERT INTO recipe_collection
values(1, 1, 1),
	  (2, 2, 7),
	  (3, 3, 3),
	  (4, 4, 1),
	  (5, 5, 5),
	  (6, 6, 6),
	  (7, 7, 3),
	  (8, 8, 8),
	  (9, 9, 4),
	  (10, 10, 10);

INSERT INTO nutrition (nutrition_id, energy_kcal, energy_kj, fat, saturate, carbohydrate, sugar, starch, fibre, protein, salt)
values (77,  0,	0,	0,	0,	0,	0,	0,	0,	0,	3.7),
( 78, 	325,	77,	2.0,	0.32,	10.7,	10.4,	0.3,	1.0,	3.6,	0.06);

INSERT INTO food_item (food_id, food_name, ghg_emission, land_use, freshwater_withdraw, food_group_id, source_id, nutrition_id)
values(77, "salt", 1.81	,	1.83	,	217.7	,	6	,	9	,	77	),
(78, "non dairy yogurt", 0.98	,	0.66	,	27.8	,	2	,	6	,	78	);

INSERT INTO ingredient (ingredient_id, food_id, recipe_id)
values(	1	,	43	,	1	)	,
(	2	,	2	,	1	)	,
(	3	,	30	,	1	)	,
(	4	,	27	,	1	)	,
(	5	,	6	,	1	)	,
(	6	,	72	,	1	)	,
(	7	,	3	,	1	)	,
(	8	,	61	,	1	)	,
(	9	,	77	,	1	)	,
(	10	,	4	,	1	)	,
(	11	,	69	,	2	)	,
(	12	,	63	,	2	)	,
(	13	,	14	,	2	)	,
(	14	,	16	,	2	)	,
(	15	,	39	,	2	)	,
(	16	,	24	,	2	)	,
(	17	,	7	,	2	)	,
(	18	,	28	,	2	)	,
(	19	,	1	,	2	)	,
(	20	,	4	,	2	)	,
(	21	,	77	,	2	)	,
(	22	,	43	,	3	)	,
(	23	,	30	,	3	)	,
(	24	,	2	,	3	)	,
(	25	,	65	,	3	)	,
(	26	,	47	,	3	)	,
(	27	,	53	,	3	)	,
(	28	,	26	,	3	)	,
(	29	,	3	,	3	)	,
(	30	,	71	,	3	)	,
(	31	,	77	,	3	)	,
(	32	,	4	,	3	)	,
(	33	,	48	,	3	)	,
(	34	,	57	,	3	)	,
(	35	,	20	,	3	)	,
(	36	,	46	,	3	)	,
(	37	,	52	,	4	)	,
(	38	,	41	,	4	)	,
(	39	,	62	,	4	)	,
(	40	,	35	,	4	)	,
(	41	,	23	,	4	)	,
(	42	,	4	,	4	)	,
(	43	,	25	,	4	)	,
(	44	,	66	,	4	)	,
(	45	,	55	,	5	)	,
(	46	,	7	,	5	)	,
(	47	,	34	,	5	)	,
(	48	,	67	,	5	)	,
(	49	,	21	,	5	)	,
(	50	,	47	,	5	)	,
(	51	,	22	,	5	)	,
(	52	,	66	,	6	)	,
(	53	,	64	,	6	)	,
(	54	,	17	,	6	)	,
(	55	,	49	,	6	)	,
(	56	,	52	,	6	)	,
(	57	,	51	,	6	)	,
(	58	,	35	,	6	)	,
(	59	,	33	,	6	)	,
(	60	,	32	,	6	)	,
(	61	,	19	,	6	)	,
(	62	,	72	,	6	)	,
(	63	,	4	,	6	)	,
(	64	,	77	,	6	)	,
(	65	,	78	,	6	)	,
(	66	,	9	,	6	)	,
(	67	,	39	,	6	)	,
(	68	,	43	,	7	)	,
(	69	,	58	,	7	)	,
(	70	,	51	,	7	)	,
(	71	,	72	,	7	)	,
(	72	,	38	,	7	)	,
(	73	,	59	,	7	)	,
(	74	,	53	,	7	)	,
(	75	,	43	,	8	)	,
(	76	,	14	,	8	)	,
(	77	,	15	,	8	)	,
(	78	,	30	,	8	)	,
(	79	,	27	,	8	)	,
(	80	,	52	,	8	)	,
(	81	,	50	,	8	)	,
(	82	,	35	,	8	)	,
(	83	,	59	,	8	)	,
(	84	,	76	,	8	)	,
(	85	,	42	,	8	)	,
(	86	,	25	,	8	)	,
(	87	,	67	,	9	)	,
(	88	,	68	,	9	)	,
(	89	,	23	,	9	)	,
(	90	,	20	,	9	)	,
(	91	,	66	,	9	)	,
(	92	,	51	,	9	)	,
(	93	,	10	,	9	)	,
(	94	,	9	,	9	)	,
(	95	,	8	,	9	)	,
(	96	,	11	,	9	)	,
(	97	,	29	,	9	)	,
(	98	,	37	,	9	)	,
(	99	,	39	,	9	)	,
(	100	,	77	,	9	)	,
(	101	,	4	,	9	)	,
(	102	,	40	,	9	)	,
(	103	,	60	,	9	)	,
(	104	,	36	,	9	)	,
(	105	,	54	,	9	)	,
(	106	,	70	,	10	)	,
(	107	,	44	,	10	)	,
(	108	,	5	,	10	)	,
(	109	,	45	,	10	)	,
(	110	,	43	,	10	)	,
(	111	,	25	,	10	)	,
(	112	,	6	,	10	)	,
(	113	,	18	,	10	)	,
(	114	,	72	,	10	)	;



