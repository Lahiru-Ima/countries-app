import 'package:countries_app/providers/country_provider.dart';
import 'package:countries_app/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/country_card.dart';

class CountryListScreen extends StatelessWidget {
  const CountryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CountryProvider(ApiService(Dio())),
      child: Consumer<CountryProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Countries'),
              actions: [
                DropdownButton<String>(
                  value: provider.sortType,
                  items: const [
                    DropdownMenuItem(
                        value: 'name', child: Text('Sort by Name')),
                    DropdownMenuItem(
                        value: 'population', child: Text('Sort by Population')),
                    DropdownMenuItem(
                        value: 'capital', child: Text('Sort by Capital')),
                  ],
                  underline: const SizedBox(),
                  onChanged: (String? value) {
                    provider.setSortType(value!);
                  },
                )
              ],
            ),
            body: provider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : provider.isError
                    ? const Center(
                        child: Text('Error'),
                      )
                    : provider.countries.isEmpty
                        ? const Center(child: Text('No Countries Found'))
                        : Scrollbar(
                          thickness: 3.0,
                          child: ListView.separated(
                              itemCount: provider.countries.length,
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                              itemBuilder: (context, index) {
                                final country = provider.countries[index];
                                return CountryCard(country: country);
                              },
                            ),
                        ),
          );
        },
      ),
    );
  }
}

