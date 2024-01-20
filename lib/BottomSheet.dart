
import 'package:flutter/material.dart';

class ShowBottomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(
            Icons.error_outlined,
            color: Colors.red,
            size: 90,
          ),
          const Text(
            'Your answer is incorrect.',
            style: TextStyle(
                fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Correct Answer",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green),
              ),
              SizedBox(width: 8), // Add some spacing between the texts
              Expanded(
                child: Text(
                  "[Exhibit no anatomical diversity, unlike the variable anatomically modern humans.]",
                  style: TextStyle(
                    color: Colors.green, /*fontSize:15*/
                  ),
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "More Details:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Text(
                      "data data data data data data data data data data data data data")),
            ],
          ),
          const SizedBox(height: 10,),



          Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(style: const ButtonStyle( ),
                onPressed: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: const Text('Continue'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
