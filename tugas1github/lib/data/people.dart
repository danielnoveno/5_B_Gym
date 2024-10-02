// 1. Kelas Person
class Person {
  final String name;
  final String phone;
  final String picture;

  const Person(this.name, this.phone, this.picture);
}

// 2. Variabel List dengan nama people yang memiliki data bertipe object Person, yang merupakan
// hasil mapping data list pada baris 14 kebawah
final List<Person> people = _people
    .map((e) => Person(
        e['name'] as String, e['phone'] as String, e['picture'] as String))
    .toList(growable: false);

final List<Map<String, Object>> _people = [
  {
    "_id": "66fb9e08a2ce7246abdc096d",
    "index": 0,
    "guid": "d283ad54-5c34-41c3-93e7-601683592049",
    "isActive": false,
    "balance": "\$1,516.44",
    "picture": "http://placehold.it/32x32",
    "age": 25,
    "eyeColor": "brown",
    "name": "Graves Serrano",
    "gender": "male",
    "company": "OBONES",
    "email": "gravesserrano@obones.com",
    "phone": "+1 (966) 446-2838",
    "address": "945 Croton Loop, Greenfields, Utah, 5275",
    "about":
        "Ad occaecat est fugiat nostrud culpa enim do adipisicing adipisicing cillum cillum. Lorem consequat nulla ipsum anim minim consequat mollit dolore pariatur. Exercitation ea ipsum dolor excepteur adipisicing fugiat ex elit enim officia dolor reprehenderit. Et anim in reprehenderit veniam reprehenderit non ea ipsum. Enim ea irure nulla excepteur. Anim aliqua et ex enim id elit dolore ipsum.\r\n",
    "registered": "2023-07-20T06:50:43 -07:00",
    "latitude": 33.453793,
    "longitude": 148.066763,
    "tags": ["aute", "excepteur", "amet", "ea", "ex", "sit", "eu"],
    "friends": [
      {"id": 0, "name": "Amanda Lowery"},
      {"id": 1, "name": "Aimee Foreman"},
      {"id": 2, "name": "Cristina Summers"}
    ],
    "greeting": "Hello, Graves Serrano! You have 1 unread messages.",
    "favoriteFruit": "strawberry"
  },
  {
    "_id": "66fb9e08f07ff592956807e3",
    "index": 1,
    "guid": "c033d97a-a222-473a-b453-814028d4a106",
    "isActive": true,
    "balance": "\$3,069.91",
    "picture": "http://placehold.it/32x32",
    "age": 29,
    "eyeColor": "green",
    "name": "Frost Dawson",
    "gender": "male",
    "company": "QUAREX",
    "email": "frostdawson@quarex.com",
    "phone": "+1 (844) 566-3588",
    "address": "171 Beekman Place, Jessie, Montana, 7456",
    "about":
        "Duis adipisicing duis ea et ad sit minim dolor do consequat officia. Quis tempor voluptate ex adipisicing pariatur officia Lorem. Tempor et non nulla incididunt adipisicing aute eiusmod fugiat et laborum pariatur do. Aliquip mollit nulla aliquip enim ipsum in deserunt id. Nulla in consequat amet laboris ut ut id ad dolore esse minim duis velit. Commodo reprehenderit tempor et officia do dolor. Culpa do nisi aliquip exercitation sit occaecat sint amet in est consequat in nostrud aliquip.\r\n",
    "registered": "2019-09-10T01:57:03 -07:00",
    "latitude": -27.073149,
    "longitude": 179.8583,
    "tags": [
      "fugiat",
      "incididunt",
      "sit",
      "ex",
      "commodo",
      "nulla",
      "consectetur"
    ],
    "friends": [
      {"id": 0, "name": "Lucinda Clemons"},
      {"id": 1, "name": "Leanne Willis"},
      {"id": 2, "name": "Latoya Bradley"}
    ],
    "greeting": "Hello, Frost Dawson! You have 6 unread messages.",
    "favoriteFruit": "apple"
  },
  {
    "_id": "66fb9e0852dc5e8fc5861562",
    "index": 2,
    "guid": "854705f1-f85a-4c97-89fd-cb62efb39375",
    "isActive": false,
    "balance": "\$3,614.98",
    "picture": "http://placehold.it/32x32",
    "age": 27,
    "eyeColor": "green",
    "name": "Bernadine Brock",
    "gender": "female",
    "company": "SUPPORTAL",
    "email": "bernadinebrock@supportal.com",
    "phone": "+1 (852) 421-3882",
    "address": "819 Cherry Street, Woodruff, Maine, 4000",
    "about":
        "In dolore aliquip anim nisi occaecat qui veniam officia ullamco anim ex magna. Anim deserunt sunt laborum aliqua incididunt in anim non excepteur anim duis eiusmod tempor irure. Duis ut excepteur eu consequat cillum laborum magna quis quis id pariatur Lorem elit.\r\n",
    "registered": "2022-07-11T07:28:13 -07:00",
    "latitude": 87.020246,
    "longitude": -8.574174,
    "tags": ["nisi", "do", "aliqua", "enim", "deserunt", "enim", "laboris"],
    "friends": [
      {"id": 0, "name": "Trujillo Gallegos"},
      {"id": 1, "name": "Bernadette Bentley"},
      {"id": 2, "name": "Stone Mays"}
    ],
    "greeting": "Hello, Bernadine Brock! You have 9 unread messages.",
    "favoriteFruit": "apple"
  },
  {
    "_id": "66fb9e08e1f27239827dbe72",
    "index": 3,
    "guid": "655a5ae3-8ac8-4a03-93d0-ba1968d879b8",
    "isActive": false,
    "balance": "\$2,141.06",
    "picture": "http://placehold.it/32x32",
    "age": 33,
    "eyeColor": "brown",
    "name": "Mcintosh Hancock",
    "gender": "male",
    "company": "INRT",
    "email": "mcintoshhancock@inrt.com",
    "phone": "+1 (920) 483-3517",
    "address": "953 Crosby Avenue, Gallina, Oklahoma, 1156",
    "about":
        "In irure occaecat eiusmod minim irure incididunt qui laboris amet est eiusmod. Sunt ea voluptate amet excepteur officia. Anim enim mollit minim consectetur do dolor ex. Proident reprehenderit labore sunt incididunt ullamco qui amet cillum elit. Laborum fugiat minim culpa sit in pariatur sit Lorem voluptate in.\r\n",
    "registered": "2015-05-08T09:36:49 -07:00",
    "latitude": 72.95195,
    "longitude": -32.901621,
    "tags": [
      "occaecat",
      "pariatur",
      "mollit",
      "cupidatat",
      "commodo",
      "sint",
      "enim"
    ],
    "friends": [
      {"id": 0, "name": "Osborn Jones"},
      {"id": 1, "name": "Lynda Shepherd"},
      {"id": 2, "name": "Barnett Garcia"}
    ],
    "greeting": "Hello, Mcintosh Hancock! You have 10 unread messages.",
    "favoriteFruit": "strawberry"
  },
  {
    "_id": "66fb9e086daceca53cd52ff3",
    "index": 4,
    "guid": "425f549e-b19d-4660-a831-84ecf53b41c8",
    "isActive": false,
    "balance": "\$2,584.62",
    "picture": "http://placehold.it/32x32",
    "age": 26,
    "eyeColor": "brown",
    "name": "Tracey Bowers",
    "gender": "female",
    "company": "MENBRAIN",
    "email": "traceybowers@menbrain.com",
    "phone": "+1 (928) 574-3504",
    "address": "642 Beadel Street, Roy, Missouri, 9528",
    "about":
        "Reprehenderit sunt irure non excepteur sint ullamco dolor quis et officia. Ex ut aute consectetur eiusmod aliqua non. Voluptate elit aute sunt elit et nulla aliqua deserunt minim. Enim mollit officia nostrud id ex amet amet consectetur consectetur. Commodo eiusmod commodo dolor ut deserunt deserunt consequat. Fugiat id adipisicing aliqua dolore ex ex qui ipsum consequat cupidatat sunt ullamco adipisicing minim.\r\n",
    "registered": "2023-11-22T04:31:01 -07:00",
    "latitude": -63.434879,
    "longitude": -118.223754,
    "tags": ["elit", "aute", "cillum", "veniam", "nulla", "eu", "et"],
    "friends": [
      {"id": 0, "name": "Josephine Tyson"},
      {"id": 1, "name": "Elba Wiley"},
      {"id": 2, "name": "Garner Coffey"}
    ],
    "greeting": "Hello, Tracey Bowers! You have 1 unread messages.",
    "favoriteFruit": "apple"
  }
];
