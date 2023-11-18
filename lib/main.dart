import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  String bmiResult = "";
  String bmiInterpretation = "";

  void calculateBMI() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100; // แปลงเซนติเมตรเป็นเมตร
    double bmi = weight / (height * height);
    String interpretation;
    if (bmi >= 25) {
      interpretation = 'น้ำหนักเกินเกณฑ์มาตรฐาน!'; // อ้วน
    } else if (bmi > 18.5) {
      interpretation = 'น้ำหนักอยู่ในเกณฑ์ปกติ ^^'; // ปกติ
    } else {
      interpretation = 'น้ำหนักต่ำกว่าเกณฑ์มาตรฐาน!'; // ผอม
    }
    setState(() {
      bmiResult = "Your BMI is ${bmi.toStringAsFixed(2)}";
      bmiInterpretation = interpretation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Your Body', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          // Background image container
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fitness.jpg'), // ตรวจสอบเส้นทางรูปภาพ
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Positioned(
            top: 10,
            right: 10,
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.food_bank_outlined),
                  onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoodPage()),
                  );
                    // เพิ่มโค้ดสำหรับการทำงานของไอคอนที่นี่
                  },
                ),
                Text('Food for healths'), // ข้อความใต้ไอคอน
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 130, // เปลี่ยนตำแหน่งตามความต้องการ
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.handshake),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExercisePage()),
                    );

                  },
                ),
                Text('Exercise table'), // ข้อความใต้ไอคอน
              ],
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Height (cm)', textAlign: TextAlign.center),
                  ),
                  TextField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter your height',
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Weight (kg)', textAlign: TextAlign.center),
                  ),

                  TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter your weight',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  ElevatedButton(
                    onPressed: calculateBMI,
                    child: Text('Calculate BMI'),
                  ),
                  Text(bmiResult),
                  Text(bmiInterpretation), // แสดงการตีความผลลัพธ์
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class FoodPage extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/food1.jpg',
    'assets/food2.jpg',
    'assets/food3.jpg',
    'assets/food3.5.jpg',
    'assets/food4.jpg',
    'assets/food5.jpg',
    'assets/food6.jpg',
    'assets/food7.jpg',
    // ระบุเส้นทางของรูปภาพที่คุณต้องการแสดง
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เลือกทานอย่างถูกวิธี เพื่อรักษาค่า BMI กันเถอะ', style: TextStyle(color: Colors.deepOrange)),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // จำนวนคอลัมน์
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Center(
            child: Image.asset(imagePaths[index]), // ใช้รูปภาพจากรายการ
          );
        },
      ),
    );
  }
}


class ExercisePage extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/exercise1.jpg',
    'assets/exercise2.jpg',
    'assets/exercise3.jpg',
    'assets/Exercise4.jpg',
    // ระบุเส้นทางของรูปภาพที่คุณต้องการแสดง
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ออกกำลังกายอย่างไรให้ได้ผลลัพธิ์ที่ดี', style: TextStyle(color: Colors.red)),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // จำนวนคอลัมน์
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Center(
            child: Image.asset(imagePaths[index]), // ใช้รูปภาพจากรายการ
          );
        },
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // กำหนดค่าเริ่มต้นสำหรับ TextEditingController
  final TextEditingController emailController = TextEditingController(text: "kings");
  final TextEditingController passwordController = TextEditingController(text: "1234");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfect Body',  style: TextStyle(color: Colors.black),),

        centerTitle: true,

      ),
      body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bmi.jpg'), // ตรวจสอบเส้นทางนี้
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 8.0),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    child: Text('Confirm'),
                    onPressed: () {
                      // รับค่าจาก TextEditingController
                      String email = emailController.text;
                      String password = passwordController.text;
                      print('Username: $email, Password: $password');

                      // ตรวจสอบ username และ password และนำทางไปยังหน้าใหม่
                      if (email == 'kings' && password == '1234') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),

                        );
                      } else {
                        final snackBar = SnackBar(content: Text('Username or Password is incorrect'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  ),
                ],
              ),
            ),
          ]
      ),

    );

  }
}
