class Trainer {
  final String name;
  final String phone;
  final String tinggi;
  final String beratBadan;
  final String picture;
  const Trainer(
      this.name, this.beratBadan, this.tinggi, this.phone, this.picture);
}

final List<Trainer> trainer = _trainer
    .map((e) => Trainer(
        e['name'] as String,
        e['phone'] as String,
        e['tinggi'] as String,
        e['beratBadan'] as String,
        e['picture'] as String))
    .toList(growable: false);

final List<Map<String, Object>> _trainer = [
  {
    "_id": "66f56f34842f4b652b988f16",
    "index": 0,
    "guid": "ac2261fe-e4ee-4808-a59d-281a6a956a7e",
    "isActive": true,
    "balance": "\$3,936.32",
    "picture": "http://placehold.it/32x32",
    "age": 38,
    "eyeColor": "green",
    "name": "Angelina Derrel",
    "gender": "female",
    "company": "KENGEN",
    "email": "angelina@kengen.com",
    "phone": "+1 (920) 438-2080",
    "tinggi": "160 cm",
    "beratbadan": " 67 kg",
    "address": "551 Overbaugh Place, Newcastle, North Dakota, 9872",
    "about":
        "Occaecat exercitation aliquip magna eu nisi cillum. Sunt ad do duis cupidatat aliquip cupidatat sit anim incididunt cillum ut. Laborum nostrud proident amet elit ipsum. Eiusmod aute adipisicing id exercitation eiusmod culpa incididunt id aute consequat incididunt mollit. Exercitation anim pariatur ullamco minim enim consequat.\r\n",
    "registered": "2017-12-10T06:54:08 -07:00",
    "latitude": -19.587592,
    "longitude": 112.545658,
    "tags": ["quis", "amet", "fugiat", "nisi", "consequat", "do", "labore"],
    "friends": [
      {"id": 0, "name": "Alison Payne"},
      {"id": 1, "name": "Maddox Palmer"},
      {"id": 2, "name": "Rasmussen Shaw"}
    ],
    "greeting": "Hello, Beryl Lyons! You have 8 unread messages.",
    "favoriteFruit": "apple"
  },
  {
    "_id": "66f56f343ec6ceaaa83d5787",
    "index": 1,
    "guid": "5caa942a-ebce-4b63-aaec-d7d9831bbc2c",
    "isActive": false,
    "balance": "\$3,664.44",
    "picture": "http://placehold.it/32x32",
    "age": 20,
    "eyeColor": "blue",
    "name": "Stewart",
    "gender": "male",
    "company": "ONTALITY",
    "email": "metalika@ontality.com",
    "phone": "+1 (872) 474-2300",
    "tinggi": "160 cm",
    "beratbadan": " 67 kg",
    "address": "917 Gem Street, Berwind, Oregon, 1698",
    "about":
        "Sint cillum Lorem cillum sunt. Dolor anim dolore sunt et ut excepteur ullamco et laboris velit. Fugiat in do laborum et cupidatat culpa dolore minim. Occaecat nisi eu est pariatur sunt. Esse occaecat mollit ullamco enim proident sint est laboris ut aliquip enim ipsum.\r\n",
    "registered": "2016-12-11T10:27:29 -07:00",
    "latitude": -86.17539,
    "longitude": 25.303523,
    "tags": [
      "consectetur",
      "esse",
      "minim",
      "consequat",
      "sunt",
      "minim",
      "ut"
    ],
    "friends": [
      {"id": 0, "name": "Clarissa Clay"},
      {"id": 1, "name": "Milagros Kirk"},
      {"id": 2, "name": "Adela Ingram"}
    ],
    "greeting": "Hello, Price Kemp! You have 3 unread messages.",
    "favoriteFruit": "apple"
  },
  {
    "_id": "66f56f349e8f4628eae7e4b5",
    "index": 2,
    "guid": "f297feec-d3f4-42a7-8641-b7a55da90518",
    "isActive": false,
    "balance": "\$2,633.61",
    "picture": "http://placehold.it/32x32",
    "age": 22,
    "eyeColor": "green",
    "name": "Noveno",
    "gender": "female",
    "company": "SPLINX",
    "email": "siskabina@splinx.com",
    "phone": "+1 (912) 478-2966",
    "tinggi": "160 cm",
    "beratbadan": " 67 kg",
    "address": "392 Kermit Place, Logan, Alabama, 4530",
    "about":
        "Commodo culpa dolore enim consequat nostrud laborum nisi ea adipisicing do sit culpa ex tempor. Aute adipisicing nostrud quis Lorem. Veniam sit ipsum labore ipsum dolore adipisicing amet do nostrud deserunt. Labore amet ad sint exercitation anim aliqua sit dolor ullamco proident duis esse cupidatat eiusmod.\r\n",
    "registered": "2022-07-21T06:30:37 -07:00",
    "latitude": -30.916219,
    "longitude": -46.9509,
    "tags": ["do", "nisi", "tempor", "adipisicing", "consequat", "ea", "qui"],
    "friends": [
      {"id": 0, "name": "Gibbs Hurst"},
      {"id": 1, "name": "Jennifer William"},
      {"id": 2, "name": "Jill Tate"}
    ],
    "greeting": "Hello, Silvia Tran! You have 6 unread messages.",
    "favoriteFruit": "banana"
  },
  {
    "_id": "66f56f344026edba11d1d93f",
    "index": 3,
    "guid": "6e4c7ae4-1a54-4610-9d21-720c02b1c0f2",
    "isActive": false,
    "balance": "\$1,659.76",
    "picture": "http://placehold.it/32x32",
    "age": 40,
    "eyeColor": "blue",
    "name": "Mario",
    "gender": "female",
    "company": "BUZZWORKS",
    "email": "bobbieduard@buzzworks.com",
    "phone": "+1 (808) 420-3187",
    "tinggi": "160 cm",
    "beratbadan": " 67 kg",
    "address": "137 Hampton Place, Accoville, Texas, 5559",
    "about":
        "Tempor enim sunt laborum sint veniam adipisicing nulla labore. Labore esse eu id ullamco labore aliqua id excepteur exercitation eiusmod ipsum. Eu reprehenderit ex dolore non dolor veniam do consequat pariatur qui non cillum sint culpa. Labore tempor proident duis enim exercitation occaecat.\r\n",
    "registered": "2015-01-19T02:56:25 -07:00",
    "latitude": -31.216024,
    "longitude": 173.299443,
    "tags": ["in", "non", "laborum", "labore", "aute", "nostrud", "pariatur"],
    "friends": [
      {"id": 0, "name": "Peterson Walker"},
      {"id": 1, "name": "Douglas Leblanc"},
      {"id": 2, "name": "Waters Holden"}
    ],
    "greeting": "Hello, Bobbie Camacho! You have 2 unread messages.",
    "favoriteFruit": "apple"
  },
  {
    "_id": "66f56f34db088a5ac81dc72f",
    "index": 4,
    "guid": "4e9d1c17-2eba-4ec4-91c9-62d9c3f3cc3b",
    "isActive": true,
    "balance": "\$1,136.19",
    "picture": "http://placehold.it/32x32",
    "age": 23,
    "eyeColor": "brown",
    "name": "Russel",
    "gender": "female",
    "company": "TEMORAK",
    "email": "patrica@temorak.com",
    "phone": "+1 (938) 516-3993",
    "tinggi": "160 cm",
    "beratbadan": " 67 kg",
    "address": "585 Girard Street, Worcester, New York, 1816",
    "about":
        "Irure cillum minim deserunt elit ex ullamco laborum exercitation commodo adipisicing do fugiat id consectetur. In duis dolor incididunt quis minim minim amet tempor aliqua est sit ullamco sit ullamco. Magna cupidatat labore amet ex ullamco proident aute. Et nostrud excepteur elit ipsum deserunt velit esse est nostrud dolore. Nisi dolor dolor ad consequat culpa minim aliquip consequat ex amet labore. Mollit est ex ullamco mollit Lorem est in excepteur sit consequat eu.\r\n",
    "registered": "2015-09-07T10:11:55 -07:00",
    "latitude": 28.036356,
    "longitude": 87.590269,
    "tags": ["sit", "sunt", "dolor", "consectetur", "sint", "duis", "dolor"],
    "friends": [
      {"id": 0, "name": "Vonda Wilkerson"},
      {"id": 1, "name": "Cleo Love"},
      {"id": 2, "name": "Rowena Mayo"}
    ],
    "greeting": "Hello, Patrica Valdez! You have 2 unread messages.",
    "favoriteFruit": "strawberry"
  }
];
