class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  Main.fromJson(Map<String, dynamic> json) {
    try {
      temp =
          json['temp'] is int ? (json['temp'] as int).toDouble() : json['temp'];
      feelsLike = json['feels_like'] is int
          ? (json['feels_like'] as int).toDouble()
          : json['feels_like'];
      tempMin = json['temp_min'] is int
          ? (json['temp_min'] as int).toDouble()
          : json['temp_min'];
      tempMax = json['temp_max'] is int
          ? (json['temp_max'] as int).toDouble()
          : json['temp_max'];
      pressure = json['pressure'];
      humidity = json['humidity'];
      seaLevel = json['sea_level'];
      grndLevel = json['grnd_level'];
    } catch (e) {
      temp = null;
      feelsLike = null;
      tempMin = null;
      tempMax = null;
      pressure = null;
      humidity = null;
      seaLevel = null;
      grndLevel = null;
    }
  }
}
