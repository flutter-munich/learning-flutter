
String scream(int length) => "A${'a' * length}h!";

main() {
  final values = [1, 2, 3, 5, 10, 50];
  imperativeScream(values);
  functionalScream(values);
  iterableScream(values);
}

imperativeScream(List<int> lengths) {
  for (var l in lengths) {
    print(scream(l));
  }
}

functionalScream(List<int> lengths) {
  lengths
    // Map lengths to their screamed version
    // Note: a function being passed as argument
    .map(scream)
    // Then print the strings
    .forEach(print);
}

iterableScream(List<int> lengths) {
  // Skip the first item, then take 3, then scream and print
  lengths.skip(1).take(3).map(scream).forEach(print);
}