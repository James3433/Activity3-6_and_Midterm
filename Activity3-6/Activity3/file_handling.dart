import 'dart:io';

void main() {
  final inputFilePath = 'numbers.txt';
  final outputFilePath = 'sum.txt';

  // Calculate row sums and total sum
  int totalSum = calculateAndPrintRowSums(inputFilePath);

  // Write the total sum to the output file
  writeContentToFile(outputFilePath, totalSum);
}

int calculateAndPrintRowSums(String filePath) {
  final file = File(filePath);
  final lines = file.readAsLinesSync();
  int count = 1;
  int allSum = 0;

  for (var line in lines) {
    final numbers = line.split(',');
    int rowSum = 0;

    for (var numStr in numbers) {
      rowSum += int.parse(numStr);
    }
    print('Row $count: $line');
    print('Sum of row $count: $rowSum');
    allSum += rowSum;
    count++;
  }
  print('Total Sum: $allSum');
  return allSum;
}

void writeContentToFile(String filePath, int totalSum) {
  final file = File(filePath);
  file.writeAsStringSync('Total Sum: $totalSum');

  print('Total Sum written to $filePath');
}