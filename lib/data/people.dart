class Person {
  final String name;
  final String phone;
  final String picture;
  const Person(this.name, this.phone, this.picture);
}

final List<Person> people = _people
    .map((e) => Person(
        e['name'] as String, e['phone'] as String, e['picture'] as String))
    .toList(growable: false);

final List<Map<String, Object>> _people = [
  {
    "_id": "66fa2fce02a6a9314c154556",
    "index": 0,
    "guid": "65eeadea-cc56-475c-ba32-026ee22596bb",
    "isActive": false,
    "balance": "\$2,681.56",
    "picture": "http://placehold.it/32x32",
    "age": 28,
    "eyeColor": "brown",
    "name": "Dina Turner",
    "gender": "female",
    "company": "INJOY",
    "email": "dinaturner@injoy.com",
    "phone": "+1 (835) 582-2467",
    "address": "351 Menahan Street, Norvelt, Michigan, 5230",
    "about":
        "Lorem cupidatat magna laborum fugiat deserunt reprehenderit enim mollit non. Occaecat elit reprehenderit adipisicing amet aute aute minim tempor laboris pariatur eiusmod laboris. Do dolore deserunt quis Lorem cillum ea dolor est veniam est. Aliqua aute duis labore culpa commodo enim ea aliquip laborum adipisicing. Labore deserunt esse sint mollit Lorem ut ipsum laboris. Adipisicing esse amet id mollit.\r\n",
    "registered": "2015-10-12T04:16:36 -07:00",
    "latitude": 34.17749,
    "longitude": 178.104336,
    "tags": [
      "proident",
      "est",
      "ut",
      "laboris",
      "officia",
      "adipisicing",
      "laboris"
    ],
    "friends": [
      {"id": 0, "name": "Richmond Maxwell"},
      {"id": 1, "name": "Weber Craig"},
      {"id": 2, "name": "Rosalie Allen"}
    ],
    "greeting": "Hello, Dina Turner! You have 4 unread messages.",
    "favoriteFruit": "banana"
  },
  {
    "_id": "66fa2fceb689179c36530d9e",
    "index": 1,
    "guid": "4fc8976d-5725-4920-bcf7-02fa08ddba39",
    "isActive": true,
    "balance": "\$1,246.27",
    "picture": "http://placehold.it/32x32",
    "age": 31,
    "eyeColor": "brown",
    "name": "Alfreda Nash",
    "gender": "female",
    "company": "DOGNOSIS",
    "email": "alfredanash@dognosis.com",
    "phone": "+1 (971) 564-2659",
    "address": "812 Union Street, Nadine, Mississippi, 7225",
    "about":
        "Id ea ut velit veniam irure tempor consequat duis. Minim reprehenderit ipsum deserunt sint consectetur esse sunt qui. Nisi amet ad id proident ex. Excepteur duis elit veniam ipsum velit ea consectetur dolor ut officia anim fugiat ea. Do nulla velit cillum anim. Incididunt pariatur anim nulla dolor. Consectetur est qui commodo sint quis ut laborum quis do irure et id esse.\r\n",
    "registered": "2019-08-19T05:00:05 -07:00",
    "latitude": -6.229242,
    "longitude": -161.526823,
    "tags": [
      "tempor",
      "laborum",
      "adipisicing",
      "mollit",
      "tempor",
      "sunt",
      "laborum"
    ],
    "friends": [
      {"id": 0, "name": "Albert Atkins"},
      {"id": 1, "name": "Geraldine Murray"},
      {"id": 2, "name": "Whitney Barker"}
    ],
    "greeting": "Hello, Alfreda Nash! You have 3 unread messages.",
    "favoriteFruit": "banana"
  },
  {
    "_id": "66fa2fce7f4b973e47f24597",
    "index": 2,
    "guid": "427c8262-b3af-401d-bcc1-a8ea469fa583",
    "isActive": true,
    "balance": "\$2,423.54",
    "picture": "http://placehold.it/32x32",
    "age": 20,
    "eyeColor": "brown",
    "name": "Preston Charles",
    "gender": "male",
    "company": "ENTHAZE",
    "email": "prestoncharles@enthaze.com",
    "phone": "+1 (946) 591-2783",
    "address": "358 Bush Street, Eagletown, Kentucky, 8185",
    "about":
        "Aliqua ut nulla quis eiusmod aute labore eu cillum enim velit eu id cupidatat. Tempor sunt commodo eu pariatur est. Tempor amet amet eiusmod reprehenderit laborum. Duis in sint excepteur qui nulla proident pariatur mollit minim laboris ex nisi. Cupidatat commodo qui enim elit. Consequat minim proident velit nostrud consequat sunt enim exercitation laboris quis.\r\n",
    "registered": "2016-06-14T11:41:45 -07:00",
    "latitude": 33.908725,
    "longitude": -121.486423,
    "tags": ["amet", "Lorem", "elit", "aute", "deserunt", "nisi", "nostrud"],
    "friends": [
      {"id": 0, "name": "Hayden Olsen"},
      {"id": 1, "name": "Holcomb Greer"},
      {"id": 2, "name": "Jenifer Cruz"}
    ],
    "greeting": "Hello, Preston Charles! You have 9 unread messages.",
    "favoriteFruit": "strawberry"
  },
  {
    "_id": "66fa2fce0bd7cf2e1cdaebd9",
    "index": 3,
    "guid": "7dd6b4ea-99b5-44e5-aa3b-90662cafb4ea",
    "isActive": true,
    "balance": "\$1,274.85",
    "picture": "http://placehold.it/32x32",
    "age": 27,
    "eyeColor": "brown",
    "name": "Clements Rutledge",
    "gender": "male",
    "company": "ISOTERNIA",
    "email": "clementsrutledge@isoternia.com",
    "phone": "+1 (991) 575-2039",
    "address": "663 Celeste Court, Lewis, Idaho, 4038",
    "about":
        "Voluptate quis velit duis voluptate laborum ea deserunt. Amet esse est nulla adipisicing nisi dolor officia ex adipisicing est aliquip ex. Proident in aliquip occaecat incididunt deserunt ullamco.\r\n",
    "registered": "2022-12-19T01:34:21 -07:00",
    "latitude": -81.230851,
    "longitude": -85.686633,
    "tags": ["mollit", "eiusmod", "consequat", "amet", "quis", "ipsum", "qui"],
    "friends": [
      {"id": 0, "name": "Carissa Carroll"},
      {"id": 1, "name": "Donovan Flynn"},
      {"id": 2, "name": "Trujillo Graves"}
    ],
    "greeting": "Hello, Clements Rutledge! You have 3 unread messages.",
    "favoriteFruit": "strawberry"
  },
  {
    "_id": "66fa2fce22a32612adc7ac98",
    "index": 4,
    "guid": "7f90c74e-d011-47b5-a55a-55a0524fad35",
    "isActive": true,
    "balance": "\$1,349.31",
    "picture": "http://placehold.it/32x32",
    "age": 40,
    "eyeColor": "blue",
    "name": "Lula Scott",
    "gender": "female",
    "company": "FLYBOYZ",
    "email": "lulascott@flyboyz.com",
    "phone": "+1 (962) 407-3005",
    "address": "374 Campus Road, Northchase, Vermont, 9611",
    "about":
        "Ea exercitation non sint pariatur cupidatat labore esse minim voluptate qui dolore consequat. Lorem esse quis incididunt occaecat aute. Quis consectetur sit cupidatat incididunt exercitation ullamco laboris aute sunt ex sint.\r\n",
    "registered": "2022-07-21T02:04:06 -07:00",
    "latitude": -45.517726,
    "longitude": 117.594453,
    "tags": ["enim", "quis", "occaecat", "et", "ullamco", "nisi", "irure"],
    "friends": [
      {"id": 0, "name": "Nadia Dalton"},
      {"id": 1, "name": "Vera Harrell"},
      {"id": 2, "name": "Hicks George"}
    ],
    "greeting": "Hello, Lula Scott! You have 5 unread messages.",
    "favoriteFruit": "apple"
  },
  {
    "_id": "66fa2fce2a22921f85e53420",
    "index": 5,
    "guid": "71f4e93e-2591-4365-ad66-f22e8df7583a",
    "isActive": false,
    "balance": "\$3,207.85",
    "picture": "http://placehold.it/32x32",
    "age": 39,
    "eyeColor": "blue",
    "name": "Bettie Curry",
    "gender": "female",
    "company": "PARAGONIA",
    "email": "bettiecurry@paragonia.com",
    "phone": "+1 (969) 539-3748",
    "address": "340 Marconi Place, Navarre, Northern Mariana Islands, 278",
    "about":
        "Cillum dolore Lorem consequat pariatur eiusmod aliquip nulla nisi labore do exercitation adipisicing eiusmod. Fugiat ut consequat amet aliqua magna ut. Reprehenderit culpa incididunt pariatur nostrud reprehenderit. Quis voluptate mollit officia deserunt sunt id consequat mollit. Occaecat aliqua et laboris veniam ipsum fugiat.\r\n",
    "registered": "2015-06-21T01:42:40 -07:00",
    "latitude": -48.856057,
    "longitude": 25.22415,
    "tags": [
      "laborum",
      "non",
      "commodo",
      "veniam",
      "veniam",
      "ullamco",
      "occaecat"
    ],
    "friends": [
      {"id": 0, "name": "Koch Key"},
      {"id": 1, "name": "Jeannette Oneil"},
      {"id": 2, "name": "Shields Blackwell"}
    ],
    "greeting": "Hello, Bettie Curry! You have 8 unread messages.",
    "favoriteFruit": "apple"
  },
  {
    "_id": "66fa2fcef945e765bdd454e2",
    "index": 6,
    "guid": "334867ee-d3b3-49be-be72-a1f2d005853b",
    "isActive": false,
    "balance": "\$2,613.24",
    "picture": "http://placehold.it/32x32",
    "age": 21,
    "eyeColor": "blue",
    "name": "Gay Rosales",
    "gender": "male",
    "company": "QUANTALIA",
    "email": "gayrosales@quantalia.com",
    "phone": "+1 (905) 585-2675",
    "address": "340 Irving Avenue, Cetronia, Palau, 7815",
    "about":
        "Non aliqua eiusmod consequat anim veniam reprehenderit veniam sunt nulla mollit. Aliqua laboris minim laboris exercitation officia amet sit ea Lorem pariatur ipsum. Non ad sint ad aliquip do non reprehenderit occaecat anim sint adipisicing consequat voluptate. Sit ipsum est velit velit reprehenderit enim adipisicing ipsum officia Lorem eiusmod aliqua esse. Veniam qui do veniam commodo adipisicing incididunt proident dolor minim. Labore nostrud aute adipisicing ex do sunt proident ad qui.\r\n",
    "registered": "2020-12-13T12:50:32 -07:00",
    "latitude": -83.278347,
    "longitude": 4.258476,
    "tags": ["minim", "nisi", "culpa", "id", "excepteur", "sunt", "cupidatat"],
    "friends": [
      {"id": 0, "name": "Rena Vang"},
      {"id": 1, "name": "Soto Cummings"},
      {"id": 2, "name": "Elizabeth Mcdowell"}
    ],
    "greeting": "Hello, Gay Rosales! You have 3 unread messages.",
    "favoriteFruit": "banana"
  }
];
