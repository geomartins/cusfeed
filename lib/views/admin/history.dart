import 'package:cusfeed/app/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../app/repositories/repository.dart';
import '../../app/repositories/rating_conversion.dart';

class History extends StatefulWidget {
  static const String id = '/history';

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  List<RatingModel> datas = [];

  Future<void> _fetchData() async {
    List<Map<String, dynamic>> rawDatas =
        await Repository().readData(kTableName);

    for (Map<String, dynamic> rawData in rawDatas) {
      Map<String, dynamic> convertedRawData =
          RatingConversion(rating: rawData).percentageConversion();
      datas.add(RatingModel.json(convertedRawData));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'History',
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: kPrimaryColor,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/cool_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemBuilder: (context, int index) {
            return ListTile(
              title: Text(datas[index].createdAt),
            );
          },
          itemCount: datas.length,
        ),
      ),
    );
  }
}

//
//Column(
//mainAxisAlignment: MainAxisAlignment.start,
//crossAxisAlignment: CrossAxisAlignment.stretch,
//children: <Widget>[
//ReusableHistoryExpansionTile(
//title: 'April 16, 1990',
//subtitle: '20 response',
//initiallyExpanded: true,
//child: Wrap(
//children: <Widget>[
//ActionChip(
//avatar: CircleAvatar(
//radius: 40.0,
//backgroundColor: Colors.grey.shade800,
//child: Text('10%'),
//),
//label: Text('Aaron Burr'),
//onPressed: () {
//print(
//"If you stand for nothing, Burr, what’ll you fall for?");
//},
//),
//ActionChip(
//avatar: CircleAvatar(
//radius: 40.0,
//backgroundColor: Colors.grey.shade800,
//child: Text('10%'),
//),
//label: Text('Aaron Burr'),
//onPressed: () {
//print(
//"If you stand for nothing, Burr, what’ll you fall for?");
//},
//),
//ActionChip(
//avatar: CircleAvatar(
//radius: 40.0,
//backgroundColor: Colors.grey.shade800,
//child: Text('10%'),
//),
//label: Text('Aaron Burr'),
//onPressed: () {
//print(
//"If you stand for nothing, Burr, what’ll you fall for?");
//},
//),
//ActionChip(
//avatar: CircleAvatar(
//radius: 40.0,
//backgroundColor: Colors.grey.shade800,
//child: Text('SD'),
//),
//label: Text('Aaron Burr'),
//onPressed: () {
//print(
//"If you stand for nothing, Burr, what’ll you fall for?");
//},
//),
//ActionChip(
//avatar: CircleAvatar(
//radius: 40.0,
//backgroundColor: Colors.grey.shade800,
//child: Text('10%'),
//),
//label: Text('Aaron Burr'),
//onPressed: () {
//print(
//"If you stand for nothing, Burr, what’ll you fall for?");
//},
//),
//],
//)),
//ReusableHistoryExpansionTile(
//title: 'April 16, 1990',
//subtitle: '20 response',
//),
//],
//)
