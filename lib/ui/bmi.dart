import 'package:flutter/material.dart';

class bmi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return bmistate();
  }
}

class bmistate extends State<bmi> {
  // BMI	Weight Status
  // Below 18.5	Underweight
  // 18.5 – 24.9	Normal
  // 25.0 – 29.9	Overweight
  // 30.0 and Above	Obese

  final TextEditingController _age = new TextEditingController();
  final TextEditingController _height = new TextEditingController();
  final TextEditingController _weight = new TextEditingController();
  double inches = 0.0;
  double result =0.0;
  String _resultReading = "";
  String _finalResult ="";

  void _calculate() {
    setState(() {
      int age = int.parse(_age.text);
      double height = double.parse(_height.text);
      inches = height * 12; //feet to inches
      double weight = double.parse(_weight.text);

      if ((_age.text.isNotEmpty || age > 0) &&
          (_height.text.isNotEmpty || height > 0) &&
          (_weight.text.isNotEmpty || weight > 0)) {

        result = weight / (inches * inches) * 703; //our BMI
        
        //Do the Reading
        
        if(double.parse(result.toStringAsFixed(1))< 18.5)
          {
            _resultReading = "Underweight";
            print(_resultReading);
          }
        else if(double.parse(result.toStringAsFixed(1))>=18.5 && result < 25)
          {
            _resultReading = "Great Shape!";
            print(_resultReading);
          }
        else if(double.parse(result.toStringAsFixed(1))>=25.0 &&
        result < 30)
          {
            _resultReading = "Overweight";
            print(_resultReading);
          }

        else if(double.parse(result.toStringAsFixed(1)) >= 30.0 )
          {
            _resultReading = "Obese";
            print(_resultReading);
          }
      }
      else {
        result = 0.0;
      }
    });
    
    _finalResult ="Your BMI: ${result.toStringAsFixed(1)}";

}


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "BMI",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            Image.asset(
              'images/bmilogo.png',
              height: 90,
              width: 90,
            ),
            new Container(
              height: 300.0,
              width: 380.0,
              color: Colors.grey.shade300,
              child: ListView(
                children: <Widget>[
                  new TextField(
                    controller: _age,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Age",
                      hintText: "e.g 20",
                      icon: new Icon(Icons.person),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(9.0),
                  ),
                  new TextField(
                    controller: _height,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Height in Feet",
                      hintText: "e.g 6.5",
                      icon: new Icon(Icons.bar_chart),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(9.0),
                  ),
                  new TextField(
                    controller: _weight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Weight in lb",
                      hintText: "e.g 70",
                      icon: new Icon(Icons.line_weight),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(9.0),
                  ),
                  new Center(
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.only(left: 150.0),
                          child: new ElevatedButton(
                            onPressed: _calculate,
                            child: new Text("Calculate"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.pinkAccent,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              textStyle: TextStyle(
                                fontSize: 16.9,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "BMI: $_finalResult",
                    style: new TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 19.9,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  new Padding(padding: EdgeInsets.all(5.0)),
                  new Text(
                    "$_resultReading",
                    style: new TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 19.9,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}

