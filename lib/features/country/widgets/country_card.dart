import 'package:flutter/material.dart';
import '../../../models/country_model.dart';
import '../country_details_screen.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({
    super.key,
    required this.country,
  });

  final CountryModel country;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            country.flag,
            width: 50,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(country.name),
        subtitle: Text(country.capital),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CountryDetails(country: country),
            ),
          );
        },
      ),
    );
  }
}
