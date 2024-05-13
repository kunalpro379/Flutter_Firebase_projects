/*
Asynchronous operations let your program complete work while waiting for another operation to finish. Here are some common asynchronous operations:

Fetching data over a network.
Writing to a database.
Reading data from a file.

*/
//incorrect-->
import 'dart:async';
import 'dart:io';

String CreateOrderMsg() {
  var order = fetchUserOrder();
  return 'Your order is: $order';
}

Future<String>
    fetchUserOrder() => //asynchronous function --- after delay provides
        Future.delayed(const Duration(seconds: 2), () => "Kunal Patil");
// void main() {
//   print(CreateOrderMsg());
// }

/*
A future (lower case "f") is an instance of the Future (capitalized "F") class. A future represents the result of an asynchronous operation, and can have two states: uncompleted or completed.
*/
Future<void> fetchUserOrder2() {
  return Future.delayed(const Duration(seconds: 2), () => print("Kunal Patil"));
}

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (final value in stream) {
    sum += value;
  }
  return sum;
}

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i;
  }
}

Future<void> main() async {
  fetchUserOrder2();
  var stream = countStream(19);
  var sum = await sumStream(stream);
  print(sum);
  print('Fetching user order...');
}
