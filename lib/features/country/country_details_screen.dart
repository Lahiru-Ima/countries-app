import 'package:countries_app/models/country_model.dart';
import 'package:flutter/material.dart';

class CountryDetails extends StatelessWidget {
  final CountryModel country;

  const CountryDetails({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(country.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.1),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  country.flag,
                  width: size.width * 0.8,
                  height: size.height * 0.2,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text('Name: ${country.name}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              Text('Official Name: ${country.official}',
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center),
              Text('Capital: ${country.capital}',
                  style: const TextStyle(fontSize: 16)),
              Text('Population: ${country.population}',
                  style: const TextStyle(fontSize: 16)),
              Text('Region: ${country.region}',
                  style: const TextStyle(fontSize: 16)),
              Text(
                'Languages: ${country.languages.values.join(', ')}',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
