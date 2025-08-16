import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class Lec7 extends StatelessWidget {
    static const String path = '/lec7';

  const Lec7({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeworkController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Homeworks', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: GetBuilder<HomeworkController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.homeworks.isEmpty) {
            return const Center(
              child: Text('No homeworks yet. Add one!', style: TextStyle(fontSize: 18, color: Colors.grey)),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: controller.homeworks.length,
            itemBuilder: (context, index) {
              final homework = controller.homeworks[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  title: Text(homework.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const SizedBox(height: 4), Text(homework.description), const SizedBox(height: 8)]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.amber),
                        onPressed: () => _showHomeworkDialog(context, homework: homework),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.redAccent),
                        onPressed: () => controller.deleteHomework(homework.id!),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
         onPressed: () => _showHomeworkDialog(context),
        tooltip: 'Add Homework',
        child: const Icon(Icons.add),
      ),
    );
  }

   void _showHomeworkDialog(BuildContext context, {HomeWork? homework}) {
    final titleController = TextEditingController(text: homework?.title ?? '');
    final descriptionController = TextEditingController(text: homework?.description ?? '');
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(homework == null ? 'Add Homework' : 'Edit Homework'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title', border: OutlineInputBorder()),
                  validator: (value) => value!.isEmpty ? 'Please enter a title' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description', border: OutlineInputBorder()),
                  validator: (value) => value!.isEmpty ? 'Please enter a description' : null,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final newHomework = HomeWork(
                    id: homework?.id,
                    title: titleController.text,
                    description: descriptionController.text,
                  );

                  if (homework == null) {
                    Get.find<HomeworkController>()
                    .addHomework(newHomework);
                  } else {
                    Get.find<HomeworkController>().updateHomework(newHomework);
                  }
                 Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class DBHelper {
  Database? database;

  Future<Database> getDatabase() async {
    if (database != null) return database!;
    database = await _initDB();
    return database!;
  }

  Future<Database> _initDB() async {
    final path = '${await getDatabasesPath()}/todo.db';
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE HomeWorks(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        description TEXT NOT NULL
      )
    ''');
  }

 
   Future<int> insertHomeWork(HomeWork homeWork) async {
    final db = await getDatabase();
    // rawInsert('INSERT INTO HomeWorks(title, description) VALUES(?, ?)', [homeWork.title, homeWork.description]);
     return await db.insert('HomeWorks', homeWork.toMap());
  }

  Future<List<HomeWork>> getHomeWorks() async {
    final db = await getDatabase();
    // rawQuery('SELECT * FROM HomeWorks ORDER BY id DESC');
    final List<Map<String, dynamic>> maps = await db.query('HomeWorks', orderBy: 'id DESC');
    return List.generate(maps.length, (i) {
      return HomeWork.fromMap(maps[i]);
    });
  }

  Future<int> updateHomeWork(HomeWork homeWork) async {
    final db = await getDatabase();
    // rawUpdate('UPDATE HomeWorks SET title = ?, description = ? WHERE id = ?', [homeWork.title, homeWork.description, homeWork.id]);
    return await db.update('HomeWorks', homeWork.toMap(), where: 'id = ?', whereArgs: [homeWork.id]);
  }

  Future<int> deleteHomeWork(int id) async {
    final db = await getDatabase();
    // rawDelete('DELETE FROM HomeWorks WHERE id = ?', [id]);
    return await db.delete('HomeWorks', where: 'id = ?', whereArgs: [id]);
  }
 
}
class HomeworkController extends GetxController {
  final DBHelper _dbHelper = DBHelper();

  List<HomeWork> homeworks = [];
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    fetchHomeworks();
  }

  Future<void> fetchHomeworks() async {
    isLoading = true;
    update();  

    homeworks = await _dbHelper.getHomeWorks();
    
    isLoading = false;
    update();
  }

  Future<void> addHomework(HomeWork homework) async {
    await _dbHelper.insertHomeWork(homework);
    await fetchHomeworks();
  }

  Future<void> updateHomework(HomeWork homework) async {
    await _dbHelper.updateHomeWork(homework);
    await fetchHomeworks();
  }

  Future<void> deleteHomework(int id) async {
    await _dbHelper.deleteHomeWork(id);
    await fetchHomeworks();
  }
}

class HomeWork {
  final int? id;
  final String title;
  final String description;
 
  HomeWork({this.id, required this.title, required this.description});

  factory HomeWork.fromMap(Map<String, dynamic> map) {
    return HomeWork(
      id: map['id'],
      title: map['title'],
      description: map['description'],
     );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
