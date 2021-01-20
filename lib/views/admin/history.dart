import 'package:cusfeed/components/reusable_history_expansion_tile.dart';
import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../app/repositories/repository.dart';
import '../../app/repositories/rating_conversion.dart';
import 'package:cusfeed/models/rating_model.dart';

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
    print(rawDatas);

    for (Map<String, dynamic> rawData in rawDatas) {
      Map<String, dynamic> convertedRawData =
          RatingConversion(rating: rawData).percentageConversion();
      setState(() {
        datas.add(RatingModel.json(convertedRawData));
      });
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
            int total = datas[index].total;
            String response = total > 1 ? 'responses' : 'response';
            return ReusableHistoryExpansionTile(
              title: datas[index].createdAt,
              subtitle: '$total $response',
              initiallyExpanded: index == datas.length - 1 ? true : false,
              child: Wrap(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      border: TableBorder.all(
                          color: Colors.black26,
                          width: 2,
                          style: BorderStyle.none),
                      children: [
                        TableRow(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: kPrimaryColor,
                            ),
                          ),
                          children: [
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text('Bad'),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text('Fair')),
                              ),
                            ),
                            TableCell(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text('Good')),
                            )),
                            TableCell(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text('V- Good')),
                            )),
                            TableCell(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text('Excellent')),
                            )),
                          ],
                        ),
                        TableRow(children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(datas[index].bad.toString() + '%'),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child:
                                      Text(datas[index].fair.toString() + '%')),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(datas[index].good.toString() + '%'),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                    datas[index].veryGood.toString() + '%'),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                    datas[index].excellent.toString() + '%'),
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
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
