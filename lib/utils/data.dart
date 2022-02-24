//Roll
//Name
//Roll No
//Phone No
//Picture

class PeopleData {
  final String? rollNo;
  final String name;
  final String phoneNo;
  final String pictureURL;

  PeopleData(
      {
      this.rollNo,
      required this.name,
      required this.phoneNo,
      required this.pictureURL});
}

var electedRepresentatives = {
  "boys": {"sec": [
    PeopleData(rollNo: 'CB.EN.U4CSE19651', name: 'Siddavarapu Sai Chandra Kaushik', phoneNo: '7993300123', pictureURL: 'pictureURL'),
    PeopleData(rollNo: 'CB.SC.I5DAS19016', name: 'Dhruva Sundararajan', phoneNo: '9686702844', pictureURL: 'pictureURL'),
    PeopleData(rollNo: 'CB.EN.U4ECE19214', name: 'Desiboyina Sharmendra', phoneNo: '8688856232', pictureURL: 'pictureURL'),
    PeopleData(rollNo: 'CB.EN.U4EEE19144', name: 'V G Sanjay', phoneNo: '9636339116', pictureURL: 'pictureURL')
  ], "joint_sec": [
    PeopleData(rollNo: 'CB.EN.U4CSE20640', name: 'Nallabantu Sri Charan', phoneNo: '9494260123', pictureURL: 'pictureURL'),
    PeopleData(rollNo: 'CB.SC.I5DAS20111', name: 'Hari Varshan S R', phoneNo: '8610343672', pictureURL: 'pictureURL'),
    PeopleData(rollNo: 'CB.EN.U4ECE20226', name: 'Kommula Subrahmanya Sai Pranav', phoneNo: '7995993258', pictureURL: 'pictureURL'),
    PeopleData(rollNo: 'CB.EN.U4CHE20022', name: 'Karthikeyan', phoneNo: '7010516256', pictureURL: 'pictureURL')
  ]},
  "girls": {"sec": [
    PeopleData(rollNo: 'CB.EN.U4CSE19019', name: 'Gudugunta Lakshmi Sreshta', phoneNo: '6301498232', pictureURL: 'pictureURL'),
    PeopleData(rollNo: 'CB.HS.U3ENG19024', name: 'S Shruta Kirti', phoneNo: '8870199862', pictureURL: 'pictureURL'),
    PeopleData(rollNo: 'CB.EN.U4CCE19007', name: 'Amalakatta Jyothi Priyanka', phoneNo: '8688957811', pictureURL: 'pictureURL'),
    PeopleData(rollNo: 'CB.EN.U4ELC19033', name: 'Nidhi Bharat Chhajer', phoneNo: '9840048854', pictureURL: 'pictureURL'),
  ], "joint_sec": [
    PeopleData(rollNo: 'CB.EN.U4CSE20202', name: 'Abirami S', phoneNo: '7904028134', pictureURL: 'pictureURL'),
    PeopleData(rollNo: 'CB.EN.U4AEE20044', name: 'Raghavi M', phoneNo: '9655758199', pictureURL: 'pictureURL'),
    PeopleData(rollNo: 'CB.EN.U4ECE20029', name: 'Karunakaram L S S Abinava', phoneNo: '9063688226', pictureURL: 'pictureURL'),
    PeopleData(rollNo: 'CB.EN.U4ELC20050', name: 'Prashansaa Waghray', phoneNo: '8712414648', pictureURL: 'pictureURL'),
  ]}
};

var centralCoordinatorsCultural = [
  PeopleData(rollNo: 'CB.EN.U4EIE18058', name: 'Varsha M K', phoneNo: '9500188307', pictureURL: 'pictureURL'),
  PeopleData(rollNo: 'CB.EN.U4CSE18252', name: 'Satyavada Hema Sai Teja', phoneNo: '9491583845', pictureURL: 'pictureURL')
];

var centralCoordinators = [
  PeopleData(rollNo: 'CB.EN.U4EEE18062', name: 'VIKKAS R B', phoneNo: '8610558837', pictureURL: "pictureURL"),
  PeopleData(rollNo: 'CB.EN.U4AEE18018', name: 'C HEMAVATHY AISSHWARYA', phoneNo: '7358307212', pictureURL: "pictureURL"),
  PeopleData(rollNo: 'CB.EN.U4CSE18043', name: 'PAVITRA B', phoneNo: '8870613607', pictureURL: "pictureURL"),
  PeopleData(rollNo: 'CB.EN.U4MEE18141', name: 'PANKAJRISHIKESH M', phoneNo: '8778577214', pictureURL: "pictureURL"),
  PeopleData(rollNo: 'CB.EN.U4ECE18154', name: 'SHARAN S', phoneNo: '9487005813', pictureURL: "pictureURL"),
  PeopleData(rollNo: 'CB.EN.U4CIE18014', name: 'KARTHIK R', phoneNo: '7760245548', pictureURL:" pictureURL"),
  PeopleData(rollNo: 'CB.EN.U4CHE19014', name: 'NIVAS S', phoneNo: '7397614302', pictureURL: "pictureURL"),
  PeopleData(rollNo: 'CB.SC.I5DAS19007', name: 'ANJALI MENON', phoneNo: '9020212180', pictureURL:" pictureURL"),
  PeopleData(rollNo: 'CB.EN.U4CSE19046', name: 'RAGAVI RAJKUMAR', phoneNo: '7812829965', pictureURL:" pictureURL"),
  PeopleData(rollNo: 'CB.EN.U4ELC19056', name: 'UPADRASTA KRISHNA VISWAS', phoneNo: '7287882876', pictureURL:" pictureURL"),
  PeopleData(rollNo: 'CB.MC.U3MAC19025', name: 'SOWMYA T A', phoneNo: '9497141200', pictureURL:" pictureURL"),
  PeopleData(rollNo: 'CB.HS.U3ENG19002', name: 'ADVAITH KRISHNAN R', phoneNo: '7034816928', pictureURL:" pictureURL"),
  PeopleData(rollNo: 'CB.EN.U4CCE19025', name: 'HARINI V', phoneNo: '7904231368', pictureURL:" pictureURL"),
  PeopleData(rollNo: 'CB.SC.I5PHY19060', name: 'SRUTHI K', phoneNo: '9074764726', pictureURL:" pictureURL"),
  PeopleData(rollNo: 'CB.SC.I5CHE19014', name: 'ASWADH KRISHNA', phoneNo: '8129748162', pictureURL:" pictureURL"),
  PeopleData(rollNo: 'CB.EN.U4MEE20120', name: 'VENKATA ROSHAN M', phoneNo: '9121582002', pictureURL:" pictureURL"),
  PeopleData(rollNo: 'CB.EN.U4CHE20050', name: 'VISHNU M', phoneNo: '6369527993', pictureURL:" pictureURL"),
  PeopleData(rollNo: 'CB.EN.U4CIE20039', name: 'SACHITHANANTHA JOTHI S', phoneNo: '9655199299', pictureURL:" pictureURL"),
  PeopleData(rollNo: 'CB.EN.U4AEE20030', name: 'JEEVAN VARMA K', phoneNo: '9550254195', pictureURL:" pictureURL"),
  PeopleData(rollNo: 'CB.SC.I5MAT20001', name: 'ABHIJITH B', phoneNo: '9207826353', pictureURL:" pictureURL"),
];

var digitalContenTeam = [
  PeopleData(rollNo: "CB.EN.U4EEE18133", name: "KIRUTHIK KARUN R", phoneNo: "9442940695", pictureURL: "pictureURL"),
  PeopleData(rollNo: "CB.EN.U4CSE19352", name: "SOORYA S", phoneNo: "9080336540", pictureURL: "pictureURL"),
  PeopleData(rollNo: "CB.EN.U4CSE19038", name: "NIRMAL K", phoneNo: "8220589062", pictureURL: "pictureURL"),
];


var facultyCoordinators = [
  PeopleData(name: "MR. Sri PRAKASH A S", phoneNo: "9443473725", pictureURL: "pictureURL"),
  PeopleData(name: "MR. Sri PUSHPARAJ M", phoneNo: "9944685515", pictureURL: "pictureURL"),
  PeopleData( name: "Dr. RAMKUMAR A S", phoneNo: "9944205630", pictureURL: "pictureURL"),
  PeopleData( name: "Dr. JANCI RANI P R ", phoneNo: "9486034723", pictureURL: "pictureURL"),
];

var multimediaTeam = [
  PeopleData(name: "VEERAMANOHAR A", phoneNo: "9566899955", pictureURL: "pictureURL", rollNo: "CB. EN. U4EEE19145"),
  PeopleData(name: "VISHAL KARTHIKEYAN", phoneNo: "9176390702", pictureURL: "pictureURL", rollNo: "CB.EN.U4CSE19361"),
  PeopleData(name: "CHETANYA MIGLANI", phoneNo: "7404481201", pictureURL: "pictureURL", rollNo: "CB.EN.U4CSE20015"),
  PeopleData(name: "PRAWIN SUBRAJITH", phoneNo: "8903875479", pictureURL: "pictureURL", rollNo: "CB.EN.U4MEE20230"),
  PeopleData(name: "VISHWA", phoneNo: "6383598421", pictureURL: "pictureURL", rollNo: "CB.EN.U4CSE19262"),
  PeopleData(name: "MADDULA SRI RAM GUPTA", phoneNo: "7287878705", pictureURL: "pictureURL", rollNo: "CB.EN.U4EEE20124"),
  PeopleData(name: "VIJAYARAJA T", phoneNo: "8712730820", pictureURL: "pictureURL", rollNo: "CB.EN.U4EEE20056"),
];