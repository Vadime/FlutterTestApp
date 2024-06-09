import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class DataProcessingPage extends StatefulWidget {
  const DataProcessingPage({super.key});

  @override
  DataProcessingPageState createState() => DataProcessingPageState();
}

class DataProcessingPageState extends State<DataProcessingPage> {
  final List<User> _dataList = []; // Replace Data with your own data model
  late List<User> _filteredDataList;
  String? filterValue;
  @override
  void initState() {
    _dataList.addAll(generateUsers(100));
    _filteredDataList = _dataList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Data Processing',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        // Filter the data list based on the search value
                        setState(() {
                          if (value.isEmpty) {
                            _filteredDataList = _dataList;
                          } else {
                            _filteredDataList = _dataList
                                .where((user) => user.name
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                          }
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Search',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  DropdownButton<String>(
                    hint: const Text('Sort By'),
                    value: filterValue,
                    borderRadius: BorderRadius.circular(10),
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(
                        value: 'name',
                        child: Text('Name'),
                      ),
                      DropdownMenuItem(
                        value: 'age',
                        child: Text('Age'),
                      ),
                      DropdownMenuItem(
                        value: 'jobTitle',
                        child: Text('Job Title'),
                      ),
                    ],
                    onChanged: (String? value) {
                      // Sort the data list based on the selected value
                      setState(() {
                        if (value == 'name') {
                          _filteredDataList
                              .sort((a, b) => a.name.compareTo(b.name));
                        } else if (value == 'age') {
                          _filteredDataList
                              .sort((a, b) => a.age.compareTo(b.age));
                        } else if (value == 'jobTitle') {
                          _filteredDataList
                              .sort((a, b) => a.jobTitle.compareTo(b.jobTitle));
                        }
                      });
                    },
                  ),
                ],
              ),
            ),

            // Add UI elements for data filtering and sorting here

            Expanded(
              child: ListView.builder(
                itemCount: _filteredDataList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(_filteredDataList[index].imageUrl),
                    ),
                    subtitle: Text(_filteredDataList[index].jobTitle),
                    title: Text(_filteredDataList[index].name),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<User> generateUsers(int count) {
    var faker = Faker();
    List<User> users = [];

    for (int i = 0; i < count; i++) {
      String name = faker.person.name();
      String email = faker.internet.email();
      String pictureUrl = faker.image
          .image(width: 100, height: 100, keywords: ['person'], random: true);

      users.add(
        User(
          name: name,
          email: email,
          imageUrl: pictureUrl,
          age: faker.randomGenerator.integer(100),
          phone: faker.phoneNumber.us(),
          address: faker.address.streetAddress(),
          company: faker.company.name(),
          jobTitle: faker.company.position(),
          bio: faker.lorem.sentence(),
          dateOfBirth: faker.date.dateTime(minYear: 1950, maxYear: 2000),
        ),
      );
    }
    return users;
  }
}

class User {
  // Define your data model here

  final String name;
  final int age;
  final String email;
  final String phone;
  final String address;
  final String company;
  final String jobTitle;
  final String imageUrl;
  final String bio;
  final DateTime dateOfBirth;

  User({
    required this.name,
    required this.age,
    required this.email,
    required this.phone,
    required this.address,
    required this.company,
    required this.jobTitle,
    required this.imageUrl,
    required this.bio,
    required this.dateOfBirth,
  });
}
