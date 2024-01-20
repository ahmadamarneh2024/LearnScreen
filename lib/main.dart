import 'package:flutter/material.dart';
import 'BottomSheet.dart';


void main() {
  runApp(const Learn());
}

class Learn extends StatelessWidget {
  const Learn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Learn",
            style: TextStyle(color: Color.fromRGBO(44, 63, 124, 1)),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.exit_to_app_outlined, color: Colors.grey),
            onPressed: () {

            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.grey),
              onPressed: () {
                // Add the code to show the menu here
                print('Three dots menu pressed');
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Divider(
                color: Color.fromRGBO(169, 169, 169, 0.6),
                height: 0.5,
                thickness: 1.0,
              ),
            ),
            Expanded(
              child: LearnScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

class LearnScreen extends StatelessWidget {
  const LearnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(width: 10, height: 10),
            RoundedCardWithShadow(),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: Image.asset(
                      'lib/assest/goldcup.PNG',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  "You've got this!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "10/60 Questions learnt ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(72, 72, 72, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Text(
                    "Learnt in this round: ",
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _showBottomSheet(context);
              },
              child: Text("Show Bottom Sheet"),
            ),
          ],
        ),
      ),
    );
  }
}
void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
  //  isScrollControlled: true,
    builder: (BuildContext context) {
      return ShowBottomPage();
    },
  );
}




class RoundedCardWithShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.access_time_filled_sharp,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Total Review Time: ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '00:00:00',
                    style: TextStyle(
                      color: Color(0xFF3E62D4),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8 ,),
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Divider(
                  color: Color.fromRGBO(
                    169,
                    169,
                    169,
                    0.6,
                  ),
                  height: 2,
                  thickness: 0.5,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.cloud_done_rounded, color: Colors.green),
                  SizedBox(width: 8),
                  Text(
                    'Reviewed Terms: ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '10/100',
                    style: TextStyle(
                      color: Color(0xFF3E62D4),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
