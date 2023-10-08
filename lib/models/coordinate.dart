class Coordinate {
  double? lon;
  double? lat;

  Coordinate({this.lon, this.lat});

  factory Coordinate.fromJson(Map<String, dynamic> json) {
    return Coordinate(
      lon: json['lon']?.toDouble(),
      lat: json['lat']?.toDouble(),
    );
  }
}
