import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fyp_plant_identification/models/plant_data.dart';
import 'package:fyp_plant_identification/screens/plant_health.dart';
import 'package:fyp_plant_identification/screens/scan_plant.dart';
import 'package:fyp_plant_identification/widgets/plant_item.dart';

//////below is a list of plant information data which is displayed at the homepage//////
////// it contains the plant information and a network image url//////

class HomeScreen extends StatelessWidget {
  final List<Plants> loadedPlant = [
    Plants(
        common_name: "Blackberry",
        family: "Rosaceae",
        genus: "Rubus",
        id: "c9b6e827-f105-4cb1-92c0-d701ceacd42f",
        image_url:
            "https://www.victoriananursery.co.uk/images/800/sq_blackberry_oregon_thornless_002.jpg",
        scientific_name: "Rubus ulmifolius",
        about:
            '''Blackberries are perennial plants which typically bear biennial stems ("canes") from the perennial root system. ... The University of Arkansas has developed primocane fruiting blackberries that grow and flower on first-year growth much as the primocane-fruiting (also called fall bearing or everbearing) red raspberries do.''',
        wiki_url: "https://en.wikipedia.org/wiki/Blackberry"),
    Plants(
        common_name: "Sunflower",
        family: "Asteraceae",
        genus: "Helianthus",
        id: "e48e86c1-b2fe-4b0d-8820-hhdhdhddhdhdhd",
        image_url:
            "https://www.clareflorist.co.uk/images/product/sunflower-surprise-2020-main.jpg",
        scientific_name: "Helianthus",
        about:
            '''Helianthus is a genus comprising about 70 species of annual and perennial flowering plants in the daisy family Asteraceae. Except for three South American species, the species of Helianthus are native to North America and Central America''',
        wiki_url: "<https://en.wikipedia.org/wiki/Helianthus>"),
    Plants(
        common_name: "Sugarcane",
        family: "Poaceae",
        genus: "Saccharum",
        id: "33d89073-c3c3-48ae-af30-b24f8910fcfe",
        image_url:
            "https://d3hnfqimznafg0.cloudfront.net/images/Article_Images/ImageForArticle_1175_16139910450192493.jpg",
        scientific_name: "Saccharum officinarum",
        about:
            '''Sugarcane or sugar cane refers to several species and hybrids of tall perennial grass in the genus Saccharum, tribe Andropogoneae, that are used for sugar production. The plants are 2-6 m tall with stout, jointed, fibrous stalks that are rich in sucrose, which accumulates in the stalk internodes''',
        wiki_url: "https://en.wikipedia.org/wiki/Sugarcane"),
    Plants(
        common_name: "Rosemary",
        family: "Lamiaceae",
        genus: "Salvia",
        id: "fca6468a-ba90-444a-af42-10910fea4cec",
        image_url:
            "https://plantscapers.com/wp-content/uploads/2017/12/blue-flowers-rosemary-bush.jpg",
        scientific_name: "Salvia rosmarinus",
        about:
            '''Salvia rosmarinus, commonly known as rosemary, is a shrub with fragrant, evergreen, needle-like leaves and white, pink, purple, or blue flowers, native to the Mediterranean region. Until 2017, it was known by the scientific name Rosmarinus officinalis, now a synonym.''',
        wiki_url: "https://en.wikipedia.org/wiki/Rosemary"),
    Plants(
        common_name: "Cabbage",
        family: "Brassicaceae",
        genus: "Brassica",
        id: "4351e1f2-be03-4788-9934-985b79cf1b83",
        image_url:
            "https://plantinstructions.com/wp-content/uploads/2017/05/cabbage-in-garden-1024x768.jpg",
        scientific_name: "Brassica oleracea",
        about:
            '''Cabbage belongs to the cole crop family, and there are over 400 different cabbage varieties you can grow. You'll be able to successfully grow and care for a variety of cabbage plants such as red cabbage, green cabbage, and savoy cabbage''',
        wiki_url: "https://en.wikipedia.org/wiki/Cabbage"),
    Plants(
        common_name: "Transvaal daisy ",
        family: "Asteraceae ",
        genus: "Gerbera",
        id: "cb7a03a3-a71d-4c6c-9c6b-666hfhfhdhgh",
        image_url:
            "https://www.amazevegegarden.com/wp-content/uploads/2019/09/how-to-get-gerbera-daisy-bloom.jpg",
        scientific_name: "Gerbera",
        about:
            ''' Gerbera L. is a genus of plants in the Asteraceae. It was named in honour of German botanist and medical doctor Traugott Gerber who travelled extensively in Russia and was a friend of Carl Linnaeus. Gerbera is native to tropical regions of South America, Africa and Asia. ''',
        wiki_url: "https://en.wikipedia.org/wiki/Gerbera"),
    Plants(
        common_name: "Wild mint",
        family: "Lamiaceae",
        genus: "Mentha",
        id: "1199e965-9f77-4d1e-97df-d6100c39ffb5",
        image_url:
            "https://www.offthegridnews.com/wp-content/uploads/2015/09/quercus-robur-850733_640-400x300.jpg",
        scientific_name: "Mentha arvensis",
        about:
            '''Late summer and early fall are great times to harvest some of nature’s most nutritious bounty – nuts.For both Native Americans and early colonists of our country, foraging for nuts was a large part of preparing for the winter months. Nuts are compact, easy to store and are rich sources of protein, dietary fiber, vitamins and antioxidants''',
        wiki_url: "<https://en.wikipedia.org/wiki/Wild mint>"),
    Plants(
        common_name: "Coriander",
        family: "Apiaceae",
        genus: "Coriandrum",
        id: "316a010a-2112-478a-8f16-bad20522ecaf",
        image_url:
            "https://i1.wp.com/www.indoindians.com/wp-content/uploads/2015/09/coriander-plant-in-pot.jpg?resize=696%2C451&ssl=1",
        scientific_name: "Coriandrum sativum",
        about:
            '''Like many herbs, cilantro, coriander or dhaniya (Coriandrum sativum) is native to the Mediterranean area but has been spread wide across the world. Today, the herb is prominent especially in Asian and South American cooking.''',
        wiki_url: "<https://en.wikipedia.org/wiki/Coriander>"),
    Plants(
        common_name: "Peanut",
        family: "Fabaceae",
        genus: "Arachis",
        id: "75f7b51c-07dc-48e0-87b7-7d8b9c024e66",
        image_url:
            "https://www.handyman.net.au/wp-content/uploads/2019/09/g-fruit-and-veg-how-to-plant-peanuts-thumbnail.jpg",
        scientific_name: "Arachis hypogaea",
        about:
            '''The peanut, also known as the groundnut, goober, pindar or monkey nut, and taxonomically classified as Arachis hypogaea, is a legume crop grown mainly for its edible seeds. It is widely grown in the tropics and subtropics, being important to both small and large commercial producers.''',
        wiki_url: "https://en.wikipedia.org/wiki/Peanut"),
    Plants(
        common_name: "Garden tomato",
        family: "Solanaceae",
        genus: "Solanum",
        id: "67cd0dc7-2994-47ff-9f29-7f7eb3d9b08a",
        image_url:
            "https://deepharvestfarm.com/wp/wp-content/uploads/Washington-Cherry-Tomato-e1511231386430-360x360.jpg",
        scientific_name: "Solanum lycopersicum",
        about:
            '''The tomato is the edible berry of the plant Solanum lycopersicum, commonly known as a tomato plant. The species originated in western South America and Central America. The Nahuatl word tomatl gave rise to the Spanish word tomate, from which the English word tomato derived''',
        wiki_url: "<https://en.wikipedia.org/wiki/Garden tomato>"),
    Plants(
        common_name: "Corn",
        family: "Poaceae",
        genus: "Zea",
        id: "8709b3cc-f2be-4f84-853d-a775ec40f4cb",
        image_url:
            "https://www.mayoclinichealthsystem.org/-/media/national-files/images/hometown-health/2018/corn.jpg",
        scientific_name: "Zea mays",
        about:
            '''Corn is a starchy vegetable and cereal grain that has been eaten all over the world for centuries. It's rich in fiber, vitamins and minerals. However, the health benefits of corn are controversial''',
        wiki_url: "https://en.wikipedia.org/wiki/Corn"),
    Plants(
        common_name: "Kidney bean",
        family: "Fabaceae",
        genus: "Phaseolus",
        id: "a8e1e51e-cbfe-44d7-ae41-b9cec1bc5623",
        image_url:
            "https://www.garden.eco/wp-content/uploads/2018/01/growing-kidney-beans.jpg",
        scientific_name: "Phaseolus vulgaris",
        about:
            '''The kidney bean is a variety of the common bean. It is named for its visual resemblance in shape and – for the red variety – colour to a human kidney. Red kidney beans should not be confused with other red beans, such as adzuki beans''',
        wiki_url: "<https://en.wikipedia.org/wiki/Kidney bean>"),
    Plants(
        common_name: "Sweet marjoram",
        family: "Lamiaceae",
        genus: "Or   iganum",
        id: "e48e86c1-b2fe-4b0d-8820-20c25288bf9f",
        image_url:
            "https://e-shop.valentine.gr/wp-content/uploads/2018/09/tk208_700.jpg",
        scientific_name: "Origanum majorana",
        about:
            '''An annual plant. Fresh and dried marjoram leaves are used as a seasoning for meats, cold cuts, soups, etc. It facilitates digestion.The infusion of the plant is used for headaches, colds and indigestion.Grow sweet marjoram in full sun and well-drained soil with average fertility''',
        wiki_url: "<https://en.wikipedia.org/wiki/Sweet marjoram>"),
    Plants(
        common_name: "Chickpea",
        family: "Fabaceae",
        genus: "Astragalus",
        id: "633067c7-9efc-41ff-b261-5ca6236bd8eb",
        image_url:
            "https://www.chilternseeds.co.uk/images/products/zoom/img_10440_10898.jpg",
        scientific_name: "Astragalus cicer",
        about:
            ''' The plant is very attractive with ferny silver leaves and is very easy to grow. The pods, which are produced in profusion, can be eaten young in much the same way as a petits pois or small French beans, and with sunshine these can be left to develop into the larger, characteristic chickpea''',
        wiki_url: "<https://en.wikipedia.org/wiki/Cicer milk-vetch>"),
    Plants(
        common_name: "Potato",
        family: "Solanaceae",
        genus: "Solanum",
        id: "304cc22f-634b-49bb-9620-f5364da5d4d8",
        image_url:
            "https://c.ndtvimg.com/p5qg74v8_potato_625x300_01_August_18.jpg",
        scientific_name: "Solanum tuberosum",
        about:
            '''The potato is a root vegetable native to the Americas, a starchy tuber of the plant Solanum tuberosum, and the plant itself is a perennial in the nightshade family, Solanaceae. ''',
        wiki_url: "https://en.wikipedia.org/wiki/Potato"),
    Plants(
        common_name: "Summer squash",
        family: "Cucurbitaceae",
        genus: "Cucurbita",
        id: "15c7d456-1e06-4200-8b3e-29749c826ab5",
        image_url:
            "https://www.chatelaine.com/wp-content/uploads/2012/09/cdab84a84565888c08852f008f2b.jpg",
        scientific_name: "Cucurbita pepo",
        about:
            '''Summer squash are squashes that are harvested when immature, while the rind is still tender and edible. Nearly all summer squashes are varieties of Cucurbita pepo, though not all Cucurbita pepo are considered summer squashe''',
        wiki_url: "<https://en.wikipedia.org/wiki/Summer squash>"),
    Plants(
        common_name: "Hibiscus",
        family: "Malvaceae",
        genus: " Hibisceae",
        id: "e48e86c1-b2fe-4b0d-8820-267e7ebcbcbddh",
        image_url:
            "https://ak.picdn.net/shutterstock/videos/3905999/thumb/1.jpg",
        scientific_name: "Hibiscus rosa-sinensis",
        about:
            '''The flowers are large, conspicuous, trumpet-shaped, with five petals and their colors can be white to pink, red, orange, peach, and yellow or purple that are 4–18 cm broad. The flowers from various cultivars and hybrids can be either a single flower or a double flower.''',
        wiki_url: "<https://en.wikipedia.org/wiki/Hibiscus_rosa-sinensis>"),
    Plants(
        common_name: "Tulip",
        family: "Liliaceae",
        genus: "Tulipa",
        id: "cb7a0nsh3-a71d-4c6c-9c6b-dshytsg67hh",
        image_url:
            "https://www.alkarty.com/images/product/resized/500-500/161259213406-02-202151EWMl2Tv5L.jpg",
        scientific_name: "Tulipa",
        about:
            ''' Tulips form a genus of spring-blooming perennial herbaceous bulbiferous geophytes. The flowers are usually large, showy and brightly colored, generally red, pink, yellow, or white. They often have a different colored blotch at the base of the tepals, internally.''',
        wiki_url: "https://en.wikipedia.org/wiki/Tulip"),
    Plants(
        common_name: "Mung bean",
        family: "Fabaceae",
        genus: "Vigna",
        id: "1db8d122-6533-4fb9-938d-f10dbf94862b",
        image_url:
            "https://lh3.googleusercontent.com/proxy/fRryyc3hgg007uzNHbiiI89dwkZsf6yAvZrya7Fq3rA4ICyiOOwup1ulmqDC3PUzWcy6NoC9PeoPvtQaBIrEORmKvzb5ioamauwZfUT4XozRVYJBvvQMVGBfSFpC",
        scientific_name: "Vigna radiata",
        about:
            '''The mung bean, alternatively known as the green gram, maash, moong, monggo, or munggo is a plant species in the legume family. The mung bean is mainly cultivated in East Asia, Southeast Asia and the Indian subcontinent. It is used as an ingredient in both savoury and sweet dishes''',
        wiki_url: "<https://en.wikipedia.org/wiki/Mung bean>"),
    Plants(
        common_name: "Carrot",
        family: "Apiaceae",
        genus: "Daucus",
        id: "8c15e369-4c5a-4584-b4af-fe439f073fe1",
        image_url:
            "https://www.aicr.org/wp-content/uploads/2019/12/carrots-thumb-1.jpg",
        scientific_name: "Daucus glochidiatus",
        about:
            '''The carrot is a root vegetable, usually orange in color, though purple, black, red, white, and yellow cultivars exist. They are a domesticated form of the wild carrot, Daucus carota, native to Europe and Southwestern Asia. The plant probably originated in Persia and was originally cultivated for its leaves and seeds.''',
        wiki_url: "https://en.wikipedia.org/wiki/Carrot"),
    Plants(
        common_name: "Lentil",
        family: "Fabaceae",
        genus: "Vicia",
        id: "cb7a03a3-a71d-4c6c-9c6b-540c29c9ae4a",
        image_url:
            "https://plantinstructions.com/wp-content/uploads/2017/08/lentil-plant.jpg",
        scientific_name: "Vicia lens",
        about:
            '''Lentils are an ancient Mediterranean crop that have been cultivated for thousands of years. Highly nutritious, lentils are grown as an annual crop during cool seasons and in areas where there is little rainfall.''',
        wiki_url: "https://en.wikipedia.org/wiki/Lentil"),
    Plants(
        common_name: "Aji pepper",
        family: "Solanaceae",
        genus: "Capsicum",
        id: "641d9fcc-81fb-4d6e-9f12-0a8be8c956c8",
        image_url:
            "https://thumbs.dreamstime.com/b/sweet-pepper-aji-serves-to-spice-all-meals-around-world-148254515.jpg",
        scientific_name: "Capsicum chinense",
        about:
            '''The aji amarillo is a member of capsicum baccatum, one of the five domesticated pepper species, and is grown all over Peru. The aji amarillo—aji means chili pepper and amarillo means yellow in Spanish''',
        wiki_url: "<https://en.wikipedia.org/wiki/Aji pepper>"),
    Plants(
        common_name: "Spinach",
        family: "Amaranthaceae",
        genus: "Spinacia",
        id: "021a3e36-6b1b-45d7-aba0-df7c12713473",
        image_url:
            "https://www.almanac.com/sites/default/files/styles/opengraph/public/image_nodes/spinach-leaves.jpg?itok=0r293mlw",
        scientific_name: "Spinacia oleracea",
        about:
            '''Spinach is one of the most nutritious vegetables you can grow, and having it in your garden means plenty of healthy, delicious meals! A super cold hardy vegetable, this tender leaf crop can be planted very early in the spring, the fall, and even in the winter.''',
        wiki_url: "https://en.wikipedia.org/wiki/Spinach"),
    Plants(
        common_name: "Inca-peanut",
        family: "Euphorbiaceae",
        genus: "Plukenetia",
        id: "5397bd6b-9974-4b58-bc34-b764fd4d0f85",
        image_url:
            "https://www.cmira-biotrade.com/wp-content/uploads/2017/03/cuadro_estrella.jpg",
        scientific_name: "Plukenetia volubilis",
        about:
            '''Plukenetia volubilis, commonly known as sacha inchi, sacha peanut, mountain peanut, Inca nut or Inca-peanut, is a perennial plant in the family Euphorbiaceae, having small trichomes on its leaves. It is native to much of tropical South America, as well as some of the Windward Islands in the Caribbean.''',
        wiki_url: "https://en.wikipedia.org/wiki/Inca-peanut"),
    Plants(
        common_name: "Red ginger",
        family: "Zingiberaceae",
        genus: "Alpinia",
        id: "40e17775-ab2e-4ac1-ae8a-926c2cc5e0da",
        image_url:
            "https://lh3.googleusercontent.com/proxy/zAYaGTjVk3-9XM9n2Asal98I3VixPWuNsfsJlt2ojZikYroQ-UHAoh8adp6CCUQGcmup3tdAwiA-RXY3pezh6sGja-K1NTRVnAhGmPfV9CisfvDDSWY8AUYY",
        scientific_name: "Alpinia purpurata",
        about:
            '''Ginger is one of the healthiest and most beneficial herbs. There are several types of ginger that are often found in the market. One of them is red ginger. Red ginger is somewhat different from other types of ginger. In addition to the reddish color, it is also more often used for medicines than as a cooking spice and has a spicier flavor compared with other ginger.''',
        wiki_url: "<https://en.wikipedia.org/wiki/Red ginger>"),
    Plants(
        common_name: "Soybean",
        family: "Fabaceae",
        genus: "Glycine",
        id: "19dc1c29-878b-489c-9ad8-1535e2729a21",
        image_url:
            "https://i.pinimg.com/originals/fa/2e/fd/fa2efd9f7685e9e3f1989904367b306b.jpg",
        scientific_name: "Glycine max",
        about:
            '''The soybean or soya bean is a species of legume native to East Asia, widely grown for its edible bean, which has numerous uses. Traditional unfermented food uses of soybeans include soy milk, from which tofu and tofu skin are made''',
        wiki_url: "https://en.wikipedia.org/wiki/Soybean"),
    Plants(
        common_name: "Garden cucumber",
        family: "Cucurbitaceae",
        genus: "Cucumis",
        id: "f240cbea-c691-4e72-af2a-1ac9e4611880",
        image_url: "https://evegro.com/wp-content/uploads/2020/08/Cucumber.png",
        scientific_name: "Cucumis sativus",
        about:
            '''Cucumber is a widely-cultivated creeping vine plant in the Cucurbitaceae gourd family that bears cucumiform fruits, which are used as vegetables. There are three main varieties of cucumber—slicing, pickling, and burpless/seedless—within which several cultivars have been created''',
        wiki_url: "<https://en.wikipedia.org/wiki/Garden cucumber>"),
    Plants(
        common_name: "Highbush blueberry",
        family: "Ericaceae",
        genus: "Vaccinium",
        id: "371baa68-eaea-43c7-89b4-bc12beec93c4",
        image_url:
            "https://hayloft.co.uk/persImages/views/01_50543036424530312d494e3231.jpg",
        scientific_name: "Vaccinium corymbosum",
        about:
            '''Vaccinium corymbosum, the northern highbush blueberry, is a North American species of blueberry which has become a food crop of significant economic importance. It is native to eastern Canada and the eastern and southern United States, from Ontario east to Nova Scotia and south as far as Florida and eastern Texa''',
        wiki_url: "<https://en.wikipedia.org/wiki/Highbush blueberry>"),
    Plants(
        common_name: "Cantaloupe",
        family: "Cucurbitaceae",
        genus: "Cucumis",
        id: "10fa1276-3683-4be3-a144-87b04a910276",
        image_url:
            "https://upload.wikimedia.org/wikipedia/commons/2/28/Cantaloupes.jpg",
        scientific_name: "Cucumis melo",
        about:
            '''The cantaloupe, rockmelon, sweet melon, or spanspek is a melon that is a variety of the muskmelon species from the family Cucurbitaceae. Cantaloupes range in weight from 0.5 to 5 kilograms''',
        wiki_url: "https://en.wikipedia.org/wiki/Cantaloupe"),
    Plants(
        common_name: "Garden pea",
        family: "Fabaceae",
        genus: "Pisum",
        id: "1d483437-26d1-40b7-8ebf-7e9f6308957e",
        image_url:
            "https://www.collinsdictionary.com/images/full/pea_104904434.jpg",
        scientific_name: "Pisum sativum",
        about:
            '''The pea is most commonly the small spherical seed or the seed-pod of the pod fruit Pisum sativum. Each pod contains several peas, which can be green or yellow. Botanically, pea pods are fruit, since they contain seeds and develop from the ovary of a flower.''',
        wiki_url: "<https://en.wikipedia.org/wiki/Garden pea>"),
    Plants(
        common_name: "Cassava",
        family: "Euphorbiaceae",
        genus: "Manihot",
        id: "661c268d-d760-4039-bb86-cc7cc17ba020",
        image_url:
            "https://www.gardeningknowhow.com/wp-content/uploads/2018/04/tapioca-root.jpg",
        scientific_name: "Manihot esculenta",
        about:
            '''Manihot esculenta, commonly called cassava, manioc, or yuca is a woody shrub native to South America of the spurge family, Euphorbiaceae.''',
        wiki_url: "https://en.wikipedia.org/wiki/Cassava"),
    Plants(
        common_name: "Cumin",
        family: "Apiaceae",
        genus: "Cuminum",
        id: "2afb1fd0-c351-4b80-a725-2e3b4803c14d",
        image_url:
            "https://www.turkeydalal.com/wp-content/uploads/2019/04/Cumin-seeds.jpeg",
        scientific_name: "Cuminum cyminum",
        about:
            '''Cumin is a flowering plant in the family Apiaceae, native to a territory including the Middle East and stretching east to India. Its seeds – each one contained within a fruit, which is dried – are used in the cuisines of many cultures in both whole and ground form''',
        wiki_url: "https://en.wikipedia.org/wiki/Cumin"),
  ];

  @override
  Widget build(BuildContext context) {

//////connectivityWidget is to check if the user has internt connection or not. if no internt then the page dosent..
//////..show but rather a no internet connection picture. This is because the images are loaded over the internet..
//////.. and connection is need to send images of plant to the sever.
//////if internet is avaible the homepage is displayed to the user.//////
    return ConnectivityWidget(
      builder: (context, isOnline) => Scaffold(
        body: isOnline
            ? Scaffold(
                floatingActionButton: SpeedDial(

                  animatedIcon: AnimatedIcons.menu_home,
                  animatedIconTheme: IconThemeData(size: 26),
                  backgroundColor: Colors.white,
                  activeBackgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).accentColor,
                  buttonSize: 50,
                  elevation: 10,
                  curve: Curves.bounceInOut,
                  children: [
                          SpeedDialChild(
                        child: Icon(
                          Icons.eco_rounded,
                          color: Theme.of(context).accentColor,
                        ),
                        backgroundColor: Colors.white,
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => PlantHealth());
                        },
                        label: 'Check plant health',
                        labelStyle:
                            TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 18, 
                            fontFamily: 'Futura')
                            ),

                    SpeedDialChild(
                        child: Icon(
                          Icons.photo_camera,
                          color: Theme.of(context).accentColor,
                        ),
                        backgroundColor: Colors.white,
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => ScanPlantScreen());
                        },
                        label: 'Identify plant',
                        labelStyle:
                            TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 18, 
                              fontFamily: 'Futura')
                              ),
              
                  ],
                ),
                
                backgroundColor: Theme.of(context).primaryColor,


//////below is the code for sending the data in the list to the plantItem which will display the...
//////...name, family and the rest of the information provided when the plant item is tapped//////
//////the information is contained in loadedPlant with each plant having its name family n details sent..
//////...provide information of the plant//////

                body: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  itemCount: loadedPlant.length,
                  itemBuilder: (ctx, i) => PlantItem(
                    loadedPlant[i].common_name,
                    loadedPlant[i].family,
                    loadedPlant[i].genus,
                    loadedPlant[i].id,
                    loadedPlant[i].image_url,
                    loadedPlant[i].scientific_name,
                    loadedPlant[i].about,
                    loadedPlant[i].wiki_url,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                ),
              )
            : Center(
                child: Image.asset(
                  'images/internet.png',
                  height: 120,
                  width: 100,
                ),
              ),
      ),
    );
  }
}
