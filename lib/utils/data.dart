//Roll
//Name
//Roll No
//Phone No
//Picture

class PeopleData {
  final String? rollNo;
  final String name;
  final String phoneNo;
  final String? pictureURL;
  String? instagram;
  String? mail;

  PeopleData(
      {this.instagram,
      this.mail,
      this.rollNo,
      required this.name,
      required this.phoneNo,
      this.pictureURL});

  String getImageDestination() {
    if (rollNo != null) {
      if (rollNo!.isNotEmpty) {
        String? formattedRollNumber =
            rollNo?.replaceAll(".", "").toLowerCase().trim();
        if (formattedRollNumber != null) {
          return "assets/profiles/$formattedRollNumber.jpg";
        }
      }
    }
    return "";
  }
}

var electedRepresentatives = {
  "boys": {
    "sec": [
      PeopleData(
        rollNo: 'CB.EN.U4CSE19651',
        name: 'Siddavarapu Sai Chandra Kaushik',
        phoneNo: '7993300123',
      ),
      PeopleData(
        rollNo: 'CB.SC.I5DAS19016',
        name: 'Dhruva Sundararajan',
        phoneNo: '9686702844',
      ),
      PeopleData(
        rollNo: 'CB.EN.U4ECE19214',
        name: 'Desiboyina Sharmendra',
        phoneNo: '8688856232',
      ),
      PeopleData(
        rollNo: 'CB.EN.U4EEE19144',
        name: 'V G Sanjay',
        phoneNo: '9636339116',
      )
    ],
    "joint_sec": [
      PeopleData(
        rollNo: 'CB.EN.U4CSE20640',
        name: 'Nallabantu Sri Charan',
        phoneNo: '9494260123',
      ),
      PeopleData(
        rollNo: 'CB.SC.I5DAS20111',
        name: 'Hari Varshan S R',
        phoneNo: '8610343672',
      ),
      PeopleData(
        rollNo: 'CB.EN.U4ECE20226',
        name: 'Kommula Subrahmanya Sai Pranav',
        phoneNo: '7995993258',
      ),
      PeopleData(
        rollNo: 'CB.EN.U4CHE20022',
        name: 'Karthikeyan',
        phoneNo: '7010516256',
      )
    ]
  },
  "girls": {
    "sec": [
      PeopleData(
        rollNo: 'CB.EN.U4CSE19019',
        name: 'Gudugunta Lakshmi Sreshta',
        phoneNo: '6301498232',
      ),
      PeopleData(
        rollNo: 'CB.HS.U3ENG19024',
        name: 'S Shruta Kirti',
        phoneNo: '8870199862',
      ),
      PeopleData(
        rollNo: 'CB.EN.U4CCE19007',
        name: 'Amalakatta Jyothi Priyanka',
        phoneNo: '8688957811',
      ),
      PeopleData(
        rollNo: 'CB.EN.U4ELC19033',
        name: 'Nidhi Bharat Chhajer',
        phoneNo: '9840048854',
      ),
    ],
    "joint_sec": [
      PeopleData(
        rollNo: 'CB.EN.U4CSE20202',
        name: 'Abirami S',
        phoneNo: '7904028134',
      ),
      PeopleData(
        rollNo: 'CB.EN.U4AEE20044',
        name: 'Raghavi M',
        phoneNo: '9655758199',
      ),
      PeopleData(
        rollNo: 'CB.EN.U4ECE20029',
        name: 'Karunakaram L S S Abinava',
        phoneNo: '9063688226',
      ),
      PeopleData(
        rollNo: 'CB.EN.U4ELC20050',
        name: 'Prashansaa Waghray',
        phoneNo: '8712414648',
      ),
    ]
  }
};

var centralCoordinatorsCultural = [
  PeopleData(
    rollNo: 'CB.EN.U4EIE18058',
    name: 'Varsha M K',
    phoneNo: '9500188307',
  ),
  PeopleData(
    rollNo: 'CB.EN.U4CSE18252',
    name: 'Satyavada Hema Sai Teja',
    phoneNo: '9491583845',
  )
];

var centralCoordinators = [
  PeopleData(
    rollNo: 'CB.EN.U4EEE18062',
    name: 'VIKKAS R B',
    phoneNo: '8610558837',
  ),
  PeopleData(
    rollNo: 'CB.EN.U4AEE18018',
    name: 'C HEMAVATHY AISSHWARYA',
    phoneNo: '7358307212',
  ),
  PeopleData(
    rollNo: 'CB.EN.U4CSE18043',
    name: 'PAVITRA B',
    phoneNo: '8870613607',
  ),
  PeopleData(
    rollNo: 'CB.EN.U4MEE18141',
    name: 'PANKAJRISHIKESH M',
    phoneNo: '8778577214',
  ),
  PeopleData(
      name: "Roobin Raj S",
      phoneNo: "6383867604",
      rollNo: "CB.EN.U4EEE18144"),
  PeopleData(
    rollNo: 'CB.EN.U4ECE18154',
    name: 'SHARAN S',
    phoneNo: '9487005813',
  ),
  PeopleData(
      rollNo: 'CB.EN.U4CIE18014',
      name: 'KARTHIK R',
      phoneNo: '7760245548',
      pictureURL: " pictureURL"),
  PeopleData(
    rollNo: 'CB.EN.U4CHE19014',
    name: 'NIVAS S',
    phoneNo: '7397614302',
  ),
  PeopleData(
      rollNo: 'CB.SC.I5DAS19007',
      name: 'ANJALI MENON',
      phoneNo: '9020212180',
      pictureURL: " pictureURL"),
  PeopleData(
      rollNo: 'CB.EN.U4CSE19046',
      name: 'RAGAVI RAJKUMAR',
      phoneNo: '7812829965',
      pictureURL: " pictureURL"),
  PeopleData(
      rollNo: 'CB.EN.U4ELC19056',
      name: 'UPADRASTA KRISHNA VISWAS',
      phoneNo: '7287882876',
      pictureURL: " pictureURL"),
  PeopleData(
      rollNo: 'CB.MC.U3MAC19025',
      name: 'SOWMYA T A',
      phoneNo: '9497141200',
      pictureURL: " pictureURL"),
  PeopleData(
      rollNo: 'CB.HS.U3ENG19002',
      name: 'ADVAITH KRISHNAN R',
      phoneNo: '7034816928',
      pictureURL: " pictureURL"),
  PeopleData(
      rollNo: 'CB.EN.U4CCE19025',
      name: 'HARINI V',
      phoneNo: '7904231368',
      pictureURL: " pictureURL"),
  PeopleData(
      rollNo: 'CB.SC.I5PHY19060',
      name: 'SRUTHI K',
      phoneNo: '9074764726',
      pictureURL: " pictureURL"),
  PeopleData(
      rollNo: 'CB.SC.I5CHE19014',
      name: 'ASWADH KRISHNA',
      phoneNo: '8129748162',
      pictureURL: " pictureURL"),
  PeopleData(
      rollNo: 'CB.EN.U4MEE20120',
      name: 'VENKATA ROSHAN M',
      phoneNo: '9121582002',
      pictureURL: " pictureURL"),
  PeopleData(
      rollNo: 'CB.EN.U4CHE20050',
      name: 'VISHNU M',
      phoneNo: '6369527993',
      pictureURL: " pictureURL"),
  PeopleData(
      rollNo: 'CB.EN.U4CIE20039',
      name: 'SACHITHANANTHA JOTHI S',
      phoneNo: '9655199299',
      pictureURL: " pictureURL"),
  PeopleData(
      rollNo: 'CB.EN.U4AEE20030',
      name: 'JEEVAN VARMA K',
      phoneNo: '9550254195',
      pictureURL: " pictureURL"),
  PeopleData(
      rollNo: 'CB.SC.I5MAT20001',
      name: 'ABHIJITH B',
      phoneNo: '9207826353',
      pictureURL: " pictureURL"),
];

var digitalContentTeam = [
  PeopleData(
      rollNo: "CB.EN.U4CSE19352",
      name: "SOORYA S",
      phoneNo: "9080336540",
      pictureURL: "assets/developer_pictures/soorya.jpeg",
      mail: "soorya.s27@gmail.com",
      instagram: "https://www.instagram.com/the_convoluted_soul/"),
  PeopleData(
      rollNo: "CB.EN.U4CSE19038",
      name: "NIRMAL K",
      instagram: "https://www.instagram.com/homenum_.revelio/",
      phoneNo: "8220589062",
      mail: "nirmalkarthikeyan1503@gmail.com",
      pictureURL: "assets/developer_pictures/nirmal.png"),
  PeopleData(
    rollNo: "CB.EN.U4EEE18133",
    name: "KIRUTHIK KARUN R",
    phoneNo: "9442940695",
  ),
];

var facultyCoordinators = [
  PeopleData(
      name: "Sri PRAKASH A S",
      phoneNo: "9443473725",
      pictureURL: "assets/profiles/mr_prakaash_a_s.jpg"),
  PeopleData(
      name: "Sri PUSHPARAJ M",
      phoneNo: "9944685515",
      pictureURL: "assets/profiles/mr_pushparaj_m.jpg"),
  PeopleData(
    name: "Dr. RAMKUMAR A S",
    phoneNo: "9944205630",
    pictureURL: "assets/profiles/dr_ramkumar.jpg",
  ),
  PeopleData(
      name: "Dr. JANCI RANI P R ",
      phoneNo: "9486034723",
      pictureURL: "assets/profiles/dr_janci_rani.jpg"),
];

var multimediaTeam = [
  PeopleData(
      name: "VEERAMANOHAR A",
      phoneNo: "9566899955",
      rollNo: "CB.EN.U4EEE19145"),
  PeopleData(
      name: "VISHAL KARTHIKEYAN",
      phoneNo: "9176390702",
      rollNo: "CB.EN.U4CSE19361"),
  PeopleData(
      name: "CHETANYA MIGLANI",
      phoneNo: "7404481201",
      rollNo: "CB.EN.U4CSE20015"),
  PeopleData(
      name: "PRAWIN SUBRAJITH",
      phoneNo: "8903875479",
      rollNo: "CB.EN.U4MEE20230"),
  PeopleData(name: "VISHWA", phoneNo: "6383598421", rollNo: "CB.EN.U4CSE19262"),
  PeopleData(
      name: "MADDULA SRI RAM GUPTA",
      phoneNo: "7287878705",
      rollNo: "CB.EN.U4EEE20124"),
  PeopleData(
      name: "VIJAYARAJA T", phoneNo: "8712730820", rollNo: "CB.EN.U4EEE20056"),
];
