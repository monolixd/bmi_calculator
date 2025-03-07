import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BMICalculatorScreen(),
    );
  }
}

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double? bmi;
  String result = "";

  void calculateBMI() {
    double? weight = double.tryParse(weightController.text);
    double? height = double.tryParse(heightController.text);

    if (weight != null && height != null && height > 0) {
      double bmiValue = weight / (height * height);
      setState(() {
        bmi = bmiValue;
        result = getBMICategory(bmiValue);
      });
    } else {
      setState(() {
        bmi = null;
        result = "กรุณากรอกข้อมูลให้ถูกต้อง";
      });
    }
  }

  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return "น้ำหนักน้อย/ผอม\nภาวะเสี่ยง: มากกว่าคนปกติ";
    } else if (bmi < 23) {
      return "ปกติ (สุขภาพดี)\nภาวะเสี่ยง: เท่าคนปกติ";
    } else if (bmi < 25) {
      return "ท้วม / โรคอ้วนระดับ 1\nภาวะเสี่ยง: อันตรายระดับ 1";
    } else if (bmi < 30) {
      return "อ้วน / โรคอ้วนระดับ 2\nภาวะเสี่ยง: อันตรายระดับ 2";
    } else {
      return "อ้วนมาก / โรคอ้วนระดับ 3\nภาวะเสี่ยง: อันตรายระดับ 3";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'คำนวณดัชนีมวลกาย (BMI)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'น้ำหนัก (kg)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'ส่วนสูง (m)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateBMI,
              child: Text('คำนวณ BMI'),
            ),
            SizedBox(height: 20),
            if (bmi != null) ...[
              Text(
                'ค่า BMI: ${bmi!.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                result,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ],
            SizedBox(height: 20),
            BMIReferenceTable(),
          ],
        ),
      ),
    );
  }
}

class BMIReferenceTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'ตารางเกณฑ์ BMI',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Table(
          border: TableBorder.all(),
          columnWidths: {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(2),
          },
          children: [
            _buildTableRow('BMI (kg/m²)', 'เกณฑ์น้ำหนัก', 'ภาวะเสี่ยง'),
            _buildTableRow('< 18.5', 'น้ำหนักน้อย/ผอม', 'เสี่ยงมากกว่าคนปกติ'),
            _buildTableRow('18.5 - 22.9', 'ปกติ (สุขภาพดี)', 'เสี่ยงเท่าคนปกติ'),
            _buildTableRow('23 - 24.9', 'ท้วม/อ้วนระดับ 1', 'อันตรายระดับ 1'),
            _buildTableRow('25 - 29.9', 'อ้วน/อ้วนระดับ 2', 'อันตรายระดับ 2'),
            _buildTableRow('≥ 30', 'อ้วนมาก/อ้วนระดับ 3', 'อันตรายระดับ 3'),
          ],
        ),
      ],
    );
  }

  TableRow _buildTableRow(String col1, String col2, String col3) {
    return TableRow(children: [
      Padding(padding: EdgeInsets.all(8), child: Text(col1, textAlign: TextAlign.center)),
      Padding(padding: EdgeInsets.all(8), child: Text(col2, textAlign: TextAlign.center)),
      Padding(padding: EdgeInsets.all(8), child: Text(col3, textAlign: TextAlign.center)),
    ]);
  }
}
