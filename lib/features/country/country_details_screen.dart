import 'package:countries_app/models/country_model.dart';
import 'package:flutter/material.dart';

class CountryDetails extends StatelessWidget {
  final CountryModel country;

  const CountryDetails({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  country.flag,
                  width: 400,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
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
