import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('True/False Example'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: MultipleChoiceOptions(
              options: [
                Option('True', true, 1),
                Option('False', false, 2),
                Option('False', false, 3),
                Option('False', false, 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MultipleChoiceOptions extends StatefulWidget {
  final List<Option> options;

  const MultipleChoiceOptions({
    Key? key,
    required this.options,
  }) : super(key: key);

  @override
  _MultipleChoiceOptionsState createState() => _MultipleChoiceOptionsState();
}

class _MultipleChoiceOptionsState extends State<MultipleChoiceOptions> {
  Option? selectedOption;
  bool showCorrectAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.options.map((option) => _buildOption(option)).toList(),
        ElevatedButton(
          onPressed: _submitAnswer,
          child: Text('Submit'),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: _newButtonAction,
          child: Text('New Button'),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: _clearSelections,
          child: Text('Clear Selections'),
        ),
      ],
    );
  }

  Widget _buildOption(Option option) {
    bool isCorrect = option.isCorrect && showCorrectAnswer;
    bool isSelected = selectedOption == option;
    bool isFalseSelected = isSelected && !option.isCorrect && showCorrectAnswer;

    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: isCorrect
              ? Color(0xff4caf50)
              : isFalseSelected
              ? Colors.red
              : isSelected
              ? Color(0xff234acd)
              : Color(0xffc1c2c2),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: ListTile(
        tileColor: isCorrect
            ? Color(0xffecf6ed)
            : isFalseSelected
            ? Color(0xfffbdcd6)
            : isSelected
            ? Color(0xfffffff)
            : null,
        title: Text(
          option.text,
          style: TextStyle(
            color: isCorrect
                ? Color(0xff4caf50)
                : isFalseSelected
                ? Colors.red
                : isSelected
                ? Color(0xff234acd)
                : null,
          ),
        ),
        leading: Stack(
          children: [
            Radio<Option>(
              value: option,
              groupValue: selectedOption,
              onChanged: (Option? value) {
                setState(() {
                  // Toggle selection if the user taps on the already selected option
                  selectedOption = (value == selectedOption) ? null : value;
                });
              },
              activeColor: Colors.transparent,
            ),
            if (isSelected || isCorrect)
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 18.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isCorrect
                          ? Color(0xff4caf50)
                          : isFalseSelected
                          ? Colors.red
                          : isSelected
                          ? Color(0xff234acd)
                          : Color(0xff234acd),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        onTap: () {
          setState(() {
            // Toggle selection when the user taps on an option
            selectedOption = (selectedOption == option) ? null : option;
          });
        },
      ),
    );
  }

  void _submitAnswer() {
    setState(() {
      // Always show the correct answer after submitting
      showCorrectAnswer = true;
    });
  }

  void _newButtonAction() {
    // Implement the action for your new button here
    print('New Button Pressed');
  }

  void _clearSelections() {
    setState(() {
      // Clear selected options and reset colors
      selectedOption = null;
      showCorrectAnswer = false;
    });
  }
}

class Option {
  final String text;
  final bool isCorrect;
  final int id;

  Option(this.text, this.isCorrect, this.id);
}
