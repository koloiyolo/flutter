

class Customer {
  int customerId;
  String name;
  String surname;

    Customer ({
      required this.customerId,
      required this.name,
      required this.surname,
    }); 

    String get(){
      return "$name $surname";
    }

    factory Customer.fromList(List list) => Customer(
      customerId: list.elementAt(0),
      name: list.elementAt(1),
      surname: list.elementAt(2),
      );

  List toList() {
    return List.from([customerId, name, surname]);
  }
}

List<Customer> toListOfCustomers (List list){
  List<Customer> dummy = [];
  for (var element in list){
    dummy.add(Customer.fromList(element));
  }
  return dummy;
}

void addCustomer(String name, String surname){
  customerList.add(Customer(name: name, surname: surname, customerId: customerList.length));
}

List<Customer> customerList = [
  Customer(
    customerId: 1 ,
    name: "Jakub", 
    surname:"Kolodziej",
  ),

  Customer(
    customerId: 2,
    name: "Roman", 
    surname:"Siminski",
  ),

  Customer(
    customerId: 3,
    name: "Jan", 
    surname:"Kowalski",
  ),
  Customer(
    customerId: 4 ,
    name: "Mateusz", 
    surname:"Morawiecki",
  ),
];

int currentCustomerId = 0;