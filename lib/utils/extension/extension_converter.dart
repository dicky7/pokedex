String convertCmToFeet(int cm) {
  double inches = cm / 2.54; // Convert cm to inches
  int feet = (inches / 12).floor(); // Calculate the number of feet
  int remainingInches = (inches % 12).round(); // Calculate the remaining inches

  return '$feet\' $remainingInches" ($cm cm)'; // Format the string as "feet' inches" (cm cm)"
}

String convertKgToPound(int kg) {
  double pounds = kg * 2.20462; // Convert kg to pounds
  double decimalKg = kg / 10; // Convert kg to decimal representation
  return '${pounds.toStringAsFixed(2)} lbs (${decimalKg.toStringAsFixed(1)} kg)'; // Format the string as "pounds lbs (kg kg)"
}

