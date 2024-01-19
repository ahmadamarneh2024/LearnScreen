import 'package:flutter/material.dart';

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
