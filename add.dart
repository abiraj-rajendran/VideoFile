 Future<String> getJson() async {
    return await rootBundle.loadString('assets/latlong.json');
  }

  Future getData() async {
    var d = json.decode(await getJson());
    return d;
  }

  Future addAll() async {
    var data = await getData();
    data.forEach((val) {
      createUser(val["mobile"],val);
    });
  }

  Future<void> createUser(docID, json) async {
    await Firebase.initializeApp();
var numberPh=json["mobile"];
    var name = json["stationName"].substring(json["stationName"].indexOf(' ') + 1);
    CollectionReference refU =
        FirebaseFirestore.instance.collection('EmergencyRequests');
    refU.doc('$docID').set({
      "stationName": "${name}",
      "latitude": ${json["latitude"]},
      "longitude": ${json["longitude"]},
      "mobile": "${numberPh}",
      "district": "${json["district"]}"
    });

    return;
  }
