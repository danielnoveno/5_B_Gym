//* 1. Kelas Person
class Person{
  final String name ;
  final String phone ;
  final String picture;
  const Person(this.name, this.phone, this.picture);
}

//* 2. Variabel List dengan nama people yang memiliki data bertipe object Person, yang merupakan
//* hasil mapping data list pada baris 14 kebawaH
final List<Person> people =
    _people.map((e) => Person(e['name'] as String,e['phone'] as String, e['picture'] as String)).toList(growable: false);

final List<Map<String,Object>> _people =
    [
  {
    "_id": "66fbc6b546ac59f7e6c2376f",
    "index": 0,
    "guid": "591a675a-0dfb-43ab-8efc-295e0e1e4bc3",
    "isActive": true,
    "balance": "\$3,696.70",
    "picture": "http://placehold.it/32x32",
    "age": 31,
    "eyeColor": "blue",
    "name": "Gray Newman",
    "gender": "male",
    "company": "NETBOOK",
    "email": "graynewman@netbook.com",
    "phone": "+1 (837) 451-2993",
    "address": "800 Glenmore Avenue, Delwood, Delaware, 1550",
    "about": "Quis aliquip Lorem id culpa tempor eu eu cillum occaecat. Laborum cupidatat occaecat culpa excepteur duis nostrud. Laboris amet commodo proident laboris ea nostrud. Ullamco aliquip cillum incididunt dolore ullamco anim aliquip duis adipisicing ex magna ipsum commodo nostrud. Consectetur ullamco esse est irure in non in laboris laborum do labore cupidatat. Ad enim id ex aliquip. Labore aliqua qui nulla in ullamco consequat cillum.\r\n",
    "registered": "2016-02-18T12:22:48 -07:00",
    "latitude": -77.445654,
    "longitude": 26.550423,
    "tags": [
      "tempor",
      "fugiat",
      "culpa",
      "commodo",
      "aute",
      "commodo",
      "est"
    ],
    "friends": [
      {
        "id": 0,
        "name": "Cindy Fischer"
      },
      {
        "id": 1,
        "name": "Colette Coffey"
      },
      {
        "id": 2,
        "name": "Carey Vega"
      }
    ],
    "greeting": "Hello, Gray Newman! You have 1 unread messages.",
    "favoriteFruit": "apple"
  },
  {
    "_id": "66fbc6b582eb2ae3b078f340",
    "index": 1,
    "guid": "c7859e64-4218-44b8-bc48-9b7061745dff",
    "isActive": false,
    "balance": "\$2,906.38",
    "picture": "http://placehold.it/32x32",
    "age": 23,
    "eyeColor": "blue",
    "name": "Elnora Freeman",
    "gender": "female",
    "company": "ZORK",
    "email": "elnorafreeman@zork.com",
    "phone": "+1 (871) 588-3616",
    "address": "380 Stoddard Place, Staples, Massachusetts, 166",
    "about": "Sit Lorem aute culpa duis. Non commodo labore excepteur est veniam aliquip cupidatat anim amet. Ex nisi Lorem officia ipsum. Ipsum laboris veniam labore irure minim excepteur anim sunt cupidatat eiusmod culpa incididunt culpa. Sint magna nisi enim nisi ullamco ea incididunt aliquip pariatur ea.\r\n",
    "registered": "2022-07-10T06:50:10 -07:00",
    "latitude": 1.407795,
    "longitude": 48.343531,
    "tags": [
      "aute",
      "do",
      "est",
      "consequat",
      "in",
      "amet",
      "cillum"
    ],
    "friends": [
      {
        "id": 0,
        "name": "Gilbert Chaney"
      },
      {
        "id": 1,
        "name": "Moran Norton"
      },
      {
        "id": 2,
        "name": "Porter Robles"
      }
    ],
    "greeting": "Hello, Elnora Freeman! You have 7 unread messages.",
    "favoriteFruit": "strawberry"
  },
  {
    "_id": "66fbc6b5f1570545304e48de",
    "index": 2,
    "guid": "b4471a57-e28e-44e7-9975-c09f71e64a30",
    "isActive": false,
    "balance": "\$2,853.40",
    "picture": "http://placehold.it/32x32",
    "age": 30,
    "eyeColor": "brown",
    "name": "Mary Garrett",
    "gender": "female",
    "company": "GEEKKO",
    "email": "marygarrett@geekko.com",
    "phone": "+1 (900) 475-2344",
    "address": "319 Rogers Avenue, Ribera, Arizona, 8840",
    "about": "Magna est sint tempor exercitation mollit mollit duis. Dolor sunt sit nostrud reprehenderit dolor eiusmod voluptate culpa excepteur. Aute qui exercitation eu aliquip esse ut minim.\r\n",
    "registered": "2016-02-11T08:03:21 -07:00",
    "latitude": 48.715511,
    "longitude": -22.885054,
    "tags": [
      "voluptate",
      "laborum",
      "non",
      "occaecat",
      "mollit",
      "nulla",
      "ipsum"
    ],
    "friends": [
      {
        "id": 0,
        "name": "Gale Wilcox"
      },
      {
        "id": 1,
        "name": "Jones Cortez"
      },
      {
        "id": 2,
        "name": "Watson Buck"
      }
    ],
    "greeting": "Hello, Mary Garrett! You have 10 unread messages.",
    "favoriteFruit": "strawberry"
  },
  {
    "_id": "66fbc6b57d6724814cef4295",
    "index": 3,
    "guid": "d445c9ca-55de-43da-a57b-b2bd3c0061ec",
    "isActive": false,
    "balance": "\$1,338.92",
    "picture": "http://placehold.it/32x32",
    "age": 20,
    "eyeColor": "brown",
    "name": "Aguilar Dejesus",
    "gender": "male",
    "company": "KEEG",
    "email": "aguilardejesus@keeg.com",
    "phone": "+1 (814) 566-2636",
    "address": "387 Seton Place, Spelter, Virgin Islands, 2215",
    "about": "Ullamco elit sint dolor eiusmod ad esse. Irure qui occaecat dolor non non proident consectetur cupidatat in enim incididunt nostrud. Amet velit proident fugiat qui. Amet nisi culpa aute culpa aliquip adipisicing et ut aliqua commodo amet ipsum.\r\n",
    "registered": "2022-09-26T06:59:36 -07:00",
    "latitude": -20.7056,
    "longitude": 158.458831,
    "tags": [
      "nostrud",
      "laborum",
      "elit",
      "laboris",
      "magna",
      "fugiat",
      "irure"
    ],
    "friends": [
      {
        "id": 0,
        "name": "Kelli Mcgee"
      },
      {
        "id": 1,
        "name": "Savage Boyle"
      },
      {
        "id": 2,
        "name": "Claudia Stout"
      }
    ],
    "greeting": "Hello, Aguilar Dejesus! You have 7 unread messages.",
    "favoriteFruit": "strawberry"
  },
  {
    "_id": "66fbc6b507f4cb6f19051dac",
    "index": 4,
    "guid": "1429f658-5614-44a3-81a8-07f9adaacc73",
    "isActive": true,
    "balance": "\$1,466.73",
    "picture": "http://placehold.it/32x32",
    "age": 39,
    "eyeColor": "brown",
    "name": "Whitney Prince",
    "gender": "female",
    "company": "INSECTUS",
    "email": "whitneyprince@insectus.com",
    "phone": "+1 (887) 458-2892",
    "address": "607 Lamont Court, Allendale, New York, 9210",
    "about": "Duis sunt excepteur aliqua ullamco deserunt culpa aliqua ad incididunt dolor exercitation aliquip laborum culpa. In sunt deserunt in minim velit esse duis enim in eiusmod veniam esse Lorem ad. Aliqua in minim in cillum do labore proident laborum qui cillum laborum laboris amet. Excepteur sit ipsum ex esse do laboris nulla ex culpa minim cillum aliqua ullamco sit. Laborum elit occaecat excepteur officia velit cupidatat exercitation sint aute qui. Ullamco minim eu ex labore ad proident.\r\n",
    "registered": "2021-12-12T07:00:42 -07:00",
    "latitude": 38.828124,
    "longitude": -37.810374,
    "tags": [
      "eu",
      "pariatur",
      "dolore",
      "eiusmod",
      "aliqua",
      "est",
      "cillum"
    ],
    "friends": [
      {
        "id": 0,
        "name": "Cecilia Zimmerman"
      },
      {
        "id": 1,
        "name": "Loraine Greene"
      },
      {
        "id": 2,
        "name": "Henry Fulton"
      }
    ],
    "greeting": "Hello, Whitney Prince! You have 1 unread messages.",
    "favoriteFruit": "banana"
  },
  {
    "_id": "66fbc6b580b859b7f2acf76b",
    "index": 5,
    "guid": "5d7130b2-d24f-4cf8-a80a-130eeb12c1d6",
    "isActive": false,
    "balance": "\$1,534.94",
    "picture": "http://placehold.it/32x32",
    "age": 30,
    "eyeColor": "green",
    "name": "Mccoy Carter",
    "gender": "male",
    "company": "VORATAK",
    "email": "mccoycarter@voratak.com",
    "phone": "+1 (866) 571-2663",
    "address": "980 Columbia Place, Soudan, Wisconsin, 1567",
    "about": "Id ex est deserunt eiusmod voluptate proident duis. Aliqua culpa non velit cupidatat et minim minim. Sit adipisicing consequat dolore elit consequat consectetur irure dolore cillum qui minim labore duis.\r\n",
    "registered": "2021-12-31T06:34:43 -07:00",
    "latitude": 76.423776,
    "longitude": 69.703097,
    "tags": [
      "enim",
      "laboris",
      "elit",
      "qui",
      "et",
      "minim",
      "eu"
    ],
    "friends": [
      {
        "id": 0,
        "name": "Adams Morris"
      },
      {
        "id": 1,
        "name": "Sherman Holder"
      },
      {
        "id": 2,
        "name": "Elliott Bentley"
      }
    ],
    "greeting": "Hello, Mccoy Carter! You have 2 unread messages.",
    "favoriteFruit": "strawberry"
  }
];