import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/urls.dart';
import '../../domain/entities/weather_entity.dart';

class WeatherTile extends StatelessWidget {
  final WeatherEntity weather;
  final bool showLocation;

  const WeatherTile({
    super.key,
    required this.weather,
    this.showLocation = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showLocation) ...[
                Text(weather.location.name,
                    style: Theme.of(context).textTheme.titleLarge),
              ],
              Text(weather.time),
            ],
          ),
          Text('${weather.temp.toStringAsFixed(2)}º',
              style: Theme.of(context).textTheme.titleLarge),
          CachedNetworkImage(
            imageUrl: Urls.iconUrl(weather.icon),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: 50,
            height: 50,
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Min: ${weather.tempMin}º '),
              Text('Max: ${weather.tempMax}º '),
              Text('Feels like: ${weather.feelsLike}º'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\nPressure: ${weather.pressure} hPa'),
              Text('humidity: ${weather.humidity}% '),
              Text('Wind speed: ${weather.wind} m/s'),
            ],
          ),
        ],
      ),
    );
  }
}
