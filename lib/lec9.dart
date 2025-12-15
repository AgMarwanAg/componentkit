import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Lec9 extends StatelessWidget {
  static const String path = '/lec9';

  const Lec9({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => StudentController(),
        builder: (context, child) => Consumer<StudentController>(
              builder: (context, ctr, child) => Scaffold(
                  appBar: AppBar(
                    actions: [
                      IconButton(
                          onPressed: () async {
                            await ctr.addStudent('New Student', 20);
                          },
                          icon: Icon(Icons.add))
                    ],
                  ),
                  body: ListView.builder(
                      itemCount: ctr.students.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(ctr.students[index]['name'].toString()),
                          subtitle: Text(ctr.students[index]['age'].toString()),
                        );
                      })),
            ));
  }
}

class StudentController extends ChangeNotifier {
  StudentController() {
    getAllStudents();
  }
  List students = [];
  getAllStudents() async {
    final result = await ApiHelper.get('http://10.0.2.2/api_lecture/students/getall.php');
    if (result != null) {
      students = result.data;
    }
    notifyListeners();
  }

  addStudent(String name, int age) async {
    final result = await ApiHelper.post('http://10.0.2.2/api_lecture/students/add.php', data: <String, dynamic>{
      'name': name,
      'age': age,
    });
    print(result);

    if (result != null) {
      getAllStudents();
    }
  }
}

class ApiHelper {
  static Future? get(String path) async {
    try {
      final result = await Dio().get(path);
      return result;
    } catch (e) {
      print(e);

      return null;
    }
  }

  static Future? post(String path, {Map<String, dynamic>? data}) async {
    try {
      final result = await Dio().post(
        path,
        data: data,
      );
      return result;
    } catch (e) {
      print(e);

      return null;
    }
  }
}
// PHP CODES
// go to C:\xampp\htdocs\api_lecture
// create php file name db.php
// put the following code in db.php

/*
<?php
$host = "localhost";
$dbname = "students_example";
$username = "root"; 
$password = "";

try {
    $pdo = new PDO("mysql:host=$host", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec("CREATE DATABASE IF NOT EXISTS $dbname");
    $pdo->exec("USE $dbname");
    $pdo->exec("
        CREATE TABLE IF NOT EXISTS students (   
            id INT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(100) NOT NULL,
            age INT
        );
    ");
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}
?>
*/
// then create Folder name students
// add these files getall.php and add.php and delete.php 

// getall.php
/*
<?php
include '../db.php';
header("Content-Type: application/json");

$sql = "SELECT * FROM students";
$result = $pdo->query($sql);

echo json_encode($result->fetchAll(PDO::FETCH_ASSOC));
?>
*/
// add.php
/*
<?php
include '../db.php';
header("Content-Type: application/json");

$data = json_decode(file_get_contents("php://input"), true);
$errors = [];

if (!isset($data['name']) || empty(trim($data['name']))) {
    $errors[] = "Name is required";
}

if (!isset($data['age']) || !is_numeric($data['age']) || $data['age'] <= 0) {
    $errors[] = "Age must be a positive number";
}

if (!empty($errors)) {
    http_response_code(500);
    echo json_encode([
        "success" => false,
        "errors" => $errors
    ]);
    exit;
}

$name = $data['name'];
$age = (int)$data['age'];

$sql = "INSERT INTO students (name, age) VALUES ('$name', '$age')";
$pdo->query($sql);

echo json_encode([
    "success" => true,
    "message" => "Student added successfully"
]);
?>
*/

// delete.php
/*
<?php
include '../db.php';
header("Content-Type: application/json");

$data = json_decode(file_get_contents("php://input"), true);

if (!isset($data['id']) || !is_numeric($data['id']) || $data['id'] <= 0) {
    http_response_code(500);
    echo json_encode([
        "success" => false,
        "errors" => ["Valid student ID is required"]
    ]);
    exit;
}

$id = (int)$data['id'];

$check = $pdo->query("SELECT * FROM students WHERE id=$id")->fetch(PDO::FETCH_ASSOC);
if (!$check) {
    http_response_code(500);
    echo json_encode([
        "success" => false,
        "errors" => ["Student not found"]
    ]);
    exit;
}

$pdo->query("DELETE FROM students WHERE id=$id");

echo json_encode([
    "success" => true,
    "message" => "Student deleted successfully"
]);
?>
*/