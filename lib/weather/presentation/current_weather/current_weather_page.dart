import 'package:flutter/material.dart';

import '../../domain/entities/weather_entity.dart';
import '../../errors/errors.dart';
import '../widgets/weather_tile.dart';
import 'current_weather_controller.dart';

class CurrentWeatherPage extends StatelessWidget {
  final CurrentWeatherController controller;

  CurrentWeatherPage({
    super.key,
    required this.controller,
  });

  final TextEditingController tECName = TextEditingController();

  final TextEditingController tECCountry = TextEditingController();

  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    controller.updateWeatherList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    controller: tECName,
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um nome';
                      } else if (value.length < 3) {
                        return 'O nome deve ter pelo menos 3 letras';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: tECCountry,
                    decoration: const InputDecoration(
                      labelText: 'País',
                      counterText: '',
                    ),
                    maxLength: 2,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o país';
                      } else if (!RegExp(r'^[A-Z]{2}$').hasMatch(value)) {
                        return 'Informe apenas 2 letras maiúsculas';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () async {
                    try {
                      FocusScope.of(context).unfocus();
                      await controller.addLocation(
                          tECName.text, tECCountry.text);
                    } catch (e) {
                      final snackBarContent = (e is WeatherError)
                          ? e.toString()
                          : 'An unknown error occurred.';
                      final snackBar = SnackBar(
                          content: Text(snackBarContent),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                          showCloseIcon: true,
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: MediaQuery.of(context).size.height - 90,
                          ));

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: controller.updateWeatherList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong!'));
                }
                return ValueListenableBuilder<List<WeatherEntity>>(
                  valueListenable: controller.locationsList,
                  builder: (context, value, child) => RefreshIndicator(
                    onRefresh: controller.updateWeatherList,
                    child: ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        final weather = value[index];
                        return Dismissible(
                          key: ValueKey(weather.location.name),
                          direction: DismissDirection.endToStart,
                          confirmDismiss: (direction) {
                            return showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Tem certeza?'),
                                content: const Text(
                                  'Deseja remover esta localização?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(false),
                                    child: const Text('Não'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: const Text('Sim'),
                                  ),
                                ],
                              ),
                            );
                          },
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            child:
                                const Icon(Icons.delete, color: Colors.white),
                          ),
                          onDismissed: (direction) {
                            controller.locationsList.value.removeAt(index);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('${weather.location.name} excluído'),
                              ),
                            );
                          },
                          child: GestureDetector(
                            child: WeatherTile(weather: weather),
                            onTap: () => Navigator.of(context).pushNamed(
                              '/forecast_weather',
                              arguments: weather,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
