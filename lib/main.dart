import 'package:flutter/material.dart';

void main() {
  runApp(MyContactsApp());
}

class MyContactsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.grey[300], // Set background color for the whole app
      ),
      home: ContactsPage(),
    );
  }
}

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> contacts = [
Contact(name: 'John Doe', phoneNumber: '123-456-7890', address: '123 Main St, Springfield, IL 62701'),
Contact(name: 'Jane Smith', phoneNumber: '987-654-3210', address: '456 Elm St, Nashville, TN 37201'),
Contact(name: 'Alice Johnson', phoneNumber: '456-789-0123', address: '789 Oak St, Austin, TX 78701'),
Contact(name: 'Michael Brown', phoneNumber: '123-456-7890', address: '321 Pine St, Boston, MA 02101'),
Contact(name: 'Jennifer Davis', phoneNumber: '987-654-3210', address: '654 Cedar St, Denver, CO 80201'),
Contact(name: 'William Wilson', phoneNumber: '456-789-0123', address: '789 Maple St, San Francisco, CA 94101'),
Contact(name: 'Patricia Taylor', phoneNumber: '123-456-7890', address: '987 Birch St, Seattle, WA 98101'),
Contact(name: 'David Martinez', phoneNumber: '987-654-3210', address: '147 Walnut St, Philadelphia, PA 19101'),
Contact(name: 'Susan Anderson', phoneNumber: '456-789-0123', address: '369 Willow St, Chicago, IL 60601'),
Contact(name: 'Joseph Thomas', phoneNumber: '123-456-7890', address: '258 Pine St, Los Angeles, CA 90001'),
Contact(name: 'Jessica Hernandez', phoneNumber: '987-654-3210', address: '852 Elm St, Miami, FL 33101'),
Contact(name: 'Charles Young', phoneNumber: '456-789-0123', address: '753 Oak St, Atlanta, GA 30301'),
Contact(name: 'Karen King', phoneNumber: '123-456-7890', address: '159 Maple St, Dallas, TX 75201'),
Contact(name: 'Margaret Lee', phoneNumber: '987-654-3210', address: '369 Cedar St, Houston, TX 77001'),
Contact(name: 'James Perez', phoneNumber: '456-789-0123', address: '987 Birch St, New York, NY 10001'),
Contact(name: 'Betty Scott', phoneNumber: '123-456-7890', address: '654 Pine St, Phoenix, AZ 85001'),
Contact(name: 'Richard Green', phoneNumber: '987-654-3210', address: '123 Elm St, Portland, OR 97201'),
Contact(name: 'Linda Adams', phoneNumber: '456-789-0123', address: '456 Cedar St, San Antonio, TX 78201'),
Contact(name: 'Mark Baker', phoneNumber: '123-456-7890', address: '789 Oak St, San Diego, CA 92101'),
Contact(name: 'Barbara Gonzalez', phoneNumber: '987-654-3210', address: '147 Pine St, Las Vegas, NV 89101'),
Contact(name: 'Robert Nelson', phoneNumber: '456-789-0123', address: '369 Elm St, Orlando, FL 32801'),
Contact(name: 'Jessica Carter', phoneNumber: '123-456-7890', address: '753 Maple St, Washington, DC 20001'),
Contact(name: 'Dorothy Mitchell', phoneNumber: '987-654-3210', address: '852 Birch St, New Orleans, LA 70101'),
Contact(name: 'Paul Wright', phoneNumber: '456-789-0123', address: '159 Cedar St, Minneapolis, MN 55401'),
Contact(name: 'Ronald Perez', phoneNumber: '123-456-7890', address: '654 Pine St, Honolulu, HI 96801'),
Contact(name: 'Sarah Scott', phoneNumber: '987-654-3210', address: '123 Oak St, Anchorage, AK 99501'),
Contact(name: 'Laura Lewis', phoneNumber: '456-789-0123', address: '456 Elm St, Charleston, SC 29401'),
Contact(name: 'Kevin Martinez', phoneNumber: '123-456-7890', address: '789 Maple St, Burlington, VT 05401'),
Contact(name: 'Sharon Jackson', phoneNumber: '987-654-3210', address: '147 Cedar St, Boise, ID 83701'),
Contact(name: 'Jason Hernandez', phoneNumber: '456-789-0123', address: '369 Pine St, Providence, RI 02901'),
Contact(name: 'Michelle Perez', phoneNumber: '123-456-7890', address: '753 Elm St, Columbia, SC 29201'),
Contact(name: 'Daniel Hall', phoneNumber: '987-654-3210', address: '852 Oak St, Jackson, MS 39201'),
Contact(name: 'Emily Young', phoneNumber: '456-789-0123', address: '159 Maple St, Little Rock, AR 72201'),
Contact(name: 'Stephen Lewis', phoneNumber: '123-456-7890', address: '654 Cedar St, Louisville, KY 40201'),
Contact(name: 'Angela King', phoneNumber: '987-654-3210', address: '123 Birch St, Salt Lake City, UT 84101'),
Contact(name: 'Lisa Garcia', phoneNumber: '456-789-0123', address: '456 Pine St, Oklahoma City, OK 73101'),
Contact(name: 'Ryan Miller', phoneNumber: '123-456-7890', address: '789 Elm St, Albuquerque, NM 87101'),
Contact(name: 'Christine Brown', phoneNumber: '987-654-3210', address: '147 Cedar St, Richmond, VA 23218'),
Contact(name: 'Carol Johnson', phoneNumber: '456-789-0123', address: '369 Birch St, Des Moines, IA 50301'),
  ];

  List<Contact> filteredContacts = [];

  @override
  void initState() {
    super.initState();
    filteredContacts = contacts;
  }

  void _addContact(String name, String phoneNumber, String address) {
    setState(() {
      contacts.add(Contact(name: name, phoneNumber: phoneNumber, address: address));
      filteredContacts = contacts;
    });
  }

  void _searchContact(String query) {
    setState(() {
      filteredContacts = contacts
          .where((contact) => contact.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: ContactSearchDelegate(contacts));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredContacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredContacts[index].name),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => CustomDialog(
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Name: ${filteredContacts[index].name}'),
                      Text('Phone: ${filteredContacts[index].phoneNumber}'),
                      Text('Address: ${filteredContacts[index].address}'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => CustomDialog(
              contentHeight: MediaQuery.of(context).size.height * 0.7,
              content: AddContactDialog(
                onAddContact: _addContact,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor:Color.fromARGB(255, 97, 96, 96),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final Widget content;
  final double? contentHeight;

  const CustomDialog({Key? key, required this.content, this.contentHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 8.0,
      backgroundColor: Colors.white,
      child: SizedBox(
        height: contentHeight,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: content,
        ),
      ),
    );
  }
}

class Contact {
  final String name;
  final String phoneNumber;
  final String address;

  Contact({required this.name, required this.phoneNumber, required this.address});
}

class AddContactDialog extends StatefulWidget {
  final Function(String name, String phoneNumber, String address) onAddContact;

  AddContactDialog({required this.onAddContact});

  @override
  _AddContactDialogState createState() => _AddContactDialogState();
}

class _AddContactDialogState extends State<AddContactDialog> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(labelText: 'Name'),
        ),
        TextField(
          controller: _phoneNumberController,
          decoration: const InputDecoration(labelText: 'Phone Number'),
          keyboardType: TextInputType.phone,
        ),
        TextField(
          controller: _addressController,
          decoration: const InputDecoration(labelText: 'Address'),
          keyboardType: TextInputType.streetAddress,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                widget.onAddContact(
                  _nameController.text,
                  _phoneNumberController.text,
                  _addressController.text,
                );
                Navigator.of(context).pop();
              },
              child: const Text('Add', style: TextStyle(color: Colors.blue)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        ),
      ],
    );
  }
}

class ContactSearchDelegate extends SearchDelegate<Contact> {
  final List<Contact> contacts;

  ContactSearchDelegate(this.contacts);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, Contact(name: '', phoneNumber: '', address: ''));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Contact> suggestionList = query.isEmpty
        ? contacts
        : contacts
            .where((contact) => contact.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].name),
          onTap: () {
            close(context, suggestionList[index]);
          },
        );
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: Colors.white,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
      textTheme: theme.textTheme.copyWith(titleLarge: const TextStyle(color: Colors.grey)),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
      ),
    );
  }
}
