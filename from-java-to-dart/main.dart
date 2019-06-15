

// If you need access to command line arguments, write:
// main(List<String> args)
main() {
  // Type inference: nalyzer infers that var bike defines a Bicycle instance.
  var bike = Bicycle(2, 0, 0);
  // Prints:
  // Instance of 'Bicycle'
  print(bike);
}

class Bicycle {
  // Instance variables

  /// Cadence is the number of revolutions of the crank per minute.
  ///
  /// This is the rate at which a cyclist is pedalling/turning the pedals.
  /// Cadence is directly proportional to wheel speed, but is a distinct
  /// measurement and changes with gearing—which determines the ratio of
  /// crank rpm to wheel rpm.
  int cadence;

  // To mark an identifier as private to its library, start its name
  // with an underscore
  int _speed;

  /// Speed of the bike.
  ///
  /// For a bicycle to travel at the same speed, using a lower gear
  /// (larger mechanical advantage) requires the rider to pedal at a
  /// faster cadence, but with less force. 
  int get speed => _speed;

  /// Gearing is the aspect of a bicycle drivetrain that determines the
  /// relation between the cadence, the rate at which the rider pedals, 
  ///and the rate at which the drive wheel turns.
  int gear;

  // Constructor has no body.
  // Using this in a constructor's parameter list is a handy shortcut
  // for assigning values to instance variables.
  Bicycle(this.cadence, this.gear);


  // The @override annotation tells the analyzer that you are intentionally
  // overriding a member. The analyzer raises an error if you've failed to
  // perform the override properly.
  @override
  // Fat arrow notation => can be used to shorten simple functions
  // String interpolation '$variable'
  String toString() => 'Bicycle: $speed mph';

  /// Decrease bike's [speed] by [decrement].
  void applyBrake(int decrement) {
    _speed -= decrement;
  }

  /// Increase bike's [speed] by [increment].
  void speedUp(int increment) {
    _speed += increment;
  }
}