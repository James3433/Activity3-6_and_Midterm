import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  var apiKey = '75304fbaf4736b6703a9fd1a1194e74a';
  var latitude = 44.34;
  var longitude = 10.99;
  
  var url = 'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';
  
  var response = await http.get(Uri.parse(url));
  
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    
    // Extract relevant information from the JSON response
    var temperature = data['main']['temp'];
    var description = data['weather'][0]['description'];
    var humidity = data['main']['humidity'];
    var windSpeed = data['wind']['speed'];
    
    // Display the extracted information to the user
    print('Location: ${data['name']}');
    print('Temperature: ${temperature.toStringAsFixed(2)} K');
    print('Description: $description');
    print('Humidity: $humidity%');
    print('Wind Speed: $windSpeed m/s');
  } else {
    print('Failed to fetch data. Error code: ${response.statusCode}');
  }
}
