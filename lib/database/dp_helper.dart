import 'package:meals_app/models/meal_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    // Initialize database if not already initialized
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'meals.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate, // pass the function directly
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE meals (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        mealName TEXT,
        mealImageUrl TEXT,
        mealDescription TEXT,
        mealCalories TEXT,
        mealCookingTime TEXT,
        mealRating TEXT
      )
    ''');
  }

  Future<int> insertMeal(MealModel meal) async {
    final db = await database;
    return await db.insert('meals', meal.toJson());
  }

  Future<List<MealModel>> getMeals() async {
    final db = await database;
    final mealsJson = await db.query('meals');
    return mealsJson.map((mealJson) => MealModel.fromJson(mealJson)).toList();
  }
}
