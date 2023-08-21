import 'package:flutter/material.dart';

import '../../domain/entities/weather_entity.dart';
import '../widgets/weather_tile.dart';
import 'current_weather_controller.dart';

class CurrentWeatherPage extends StatefulWidget {
  final CurrentWeatherController controller;

  const CurrentWeatherPage({
    super.key,
    required this.controller,
  });

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.updateWeatherList();
  }

  @override
  Widget build(BuildContext context) {
    final locationsList = widget.controller.locationsList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Navegar para a tela de adicionar localização
              // Navigator.of(context).pushNamed('/add_location');
            },
          ),
        ],
      ),
      body: ValueListenableBuilder<List<WeatherEntity>>(
        valueListenable: locationsList,
        builder: (context, value, child) => Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          child: RefreshIndicator(
            onRefresh: () async {
              await widget.controller.updateWeatherList();
            },
            child: ListView.builder(
              itemCount: locationsList.value.length,
              itemBuilder: (context, index) {
                final weather = locationsList.value[index];

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
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: const Text('Não'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
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
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    locationsList.value.removeAt(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('${weather.location.name} excluído')),
                    );
                  },
                  child: GestureDetector(
                    child: WeatherTile(weather: weather),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/forecast_weather',
                        arguments: weather,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
