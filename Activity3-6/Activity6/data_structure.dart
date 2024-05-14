import 'dart:io';

class Stack {
  List<dynamic> _stack = [];

  void push(dynamic element) {
    _stack.add(element);
  }

  dynamic pop() {
    if (!isEmpty()) {
      return _stack.removeLast();
    } else {
      return null; // Return null if stack is empty
    }
  }

  void displayStack() {
    print('Stack contents:');
    for (dynamic element in _stack.reversed) {
      print(element);
    }
  }

  bool isEmpty() {
    return _stack.isEmpty;
  }
}

void main() {
  Stack stack = Stack();

  while (true) {
    print('Enter your choice (push/pop/exit):');
    String choice = stdin.readLineSync()!.toLowerCase();
    String input = '';

    if (choice == 'push') {
      while (input != 'stop') {
        print('Enter an element to push onto the stack (enter "stop" to end):');
        input = stdin.readLineSync()!;
        
        if (input != 'stop') {
          stack.push(input);
          print('Element $input pushed onto the stack.');
          print('Is the stack empty? ${stack.isEmpty()}');
        }
      }

      print('Displaying the final stack contents:');
      stack.displayStack();
    } else if (choice == 'pop') {
      dynamic poppedElement = stack.pop();
      if (poppedElement != null) {
        print('Popped element: $poppedElement');
        print('Is the stack empty? ${stack.isEmpty()}');
      } else {
        print('Stack is empty. Cannot pop.');
      }
    } else if (choice == 'exit') {
      print('Exiting the program.');
      break;
    } else {
      print('Invalid choice. Please enter push, pop, or exit.');
    }

  }
}