class Speed {
  final double? metersPerSecond;
  final double? kilometersPerHour;
  final double? milesPerHour;

  Speed({
    this.metersPerSecond,
    this.kilometersPerHour,
    this.milesPerHour,
  });

  factory Speed.fromMetersPerSecond(double metersPerSecond) {
    return Speed(
      metersPerSecond: metersPerSecond,
      kilometersPerHour: metersPerSecond * 3.6,
      milesPerHour: metersPerSecond * 2.23693629,
    );
  }

  factory Speed.fromKilometersPerHour(double kilometersPerHour) {
    return Speed(
      metersPerSecond: kilometersPerHour / 3.6,
      kilometersPerHour: kilometersPerHour,
      milesPerHour: kilometersPerHour * 0.621371192,
    );
  }

  factory Speed.fromMilesPerHour(double milesPerHour) {
    return Speed(
      metersPerSecond: milesPerHour / 2.23693629,
      kilometersPerHour: milesPerHour / 0.621371192,
      milesPerHour: milesPerHour,
    );
  }

  @override
  String toString() {
    return 'Speed{metersPerSecond: $metersPerSecond, kilometersPerHour: $kilometersPerHour, milesPerHour: $milesPerHour}';
  }
}