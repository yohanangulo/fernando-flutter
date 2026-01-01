import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String apiKey = dotenv.env['THE_MOVIEDB_KEY'].toString();
}
