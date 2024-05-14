import 'dart:io';

void main() {
  print('Enter the file name: ');
  String? fileNameInput = stdin.readLineSync();

  if (fileNameInput != null) {
    try {
      File file = File(fileNameInput);
      if (!file.existsSync()) {
        throw FileSystemException('File not found');
      }

      List<String> lines = file.readAsLinesSync();
      print('File found and its contents:');
      for (String line in lines) {
        print(line);
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
