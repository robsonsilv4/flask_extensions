import 'package:flutter/material.dart';

import '../../data/model/category.dart';
import '../../data/model/extension.dart';
import '../../data/model/license.dart';
import '../../data/model/uptime.dart';
import '../../data/repository/extension_repository.dart';

class HomeScreen extends StatefulWidget {
  final ExtensionRepository repository;

  HomeScreen({this.repository});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final uptimes = <Uptime>[
    const Uptime(5),
    const Uptime(10),
    const Uptime(15),
  ];

  final categories = <Category>[
    const Category('ORM'),
    const Category('REST'),
    const Category('Admin'),
  ];

  final licenses = <License>[
    const License('MIT'),
    const License('BSD'),
    const License('GPL'),
  ];
  Uptime selectedUptime;
  Category selectedCategory;
  License selectedLicense;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flask Extensions',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Column _buildBody() {
    final extensions = widget.repository.getAllExtensions();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Center(
            child: Text(
              'Select by',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 8.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: DropdownButton<Uptime>(
                  hint: Text('Uptime'),
                  style: TextStyle(color: Colors.black54),
                  value: selectedUptime,
                  underline: SizedBox(),
                  elevation: 2,
                  items: uptimes.map(
                    (Uptime uptime) {
                      return DropdownMenuItem<Uptime>(
                        value: uptime,
                        child: Text(
                          uptime.days.toString(),
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (Uptime currentUptime) {
                    setState(() {
                      selectedUptime = currentUptime;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 8.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: DropdownButton<Category>(
                  hint: Text('Category'),
                  style: TextStyle(color: Colors.black54),
                  value: selectedCategory,
                  underline: SizedBox(),
                  elevation: 2,
                  items: categories.map(
                    (Category category) {
                      return DropdownMenuItem<Category>(
                        value: category,
                        child: Text(
                          category.name,
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (Category currentCategory) {
                    setState(() {
                      selectedCategory = currentCategory;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 8.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: DropdownButton<License>(
                  value: selectedLicense,
                  underline: SizedBox(),
                  hint: Text('License'),
                  elevation: 2,
                  style: TextStyle(color: Colors.black54),
                  items: licenses.map(
                    (License license) {
                      return DropdownMenuItem<License>(
                        value: license,
                        child: Text(
                          license.name,
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (License currentLicense) {
                    setState(() {
                      selectedLicense = currentLicense;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: extensions.length,
            itemBuilder: (context, index) {
              Extension extension = extensions[index];
              return _buildItem(extension);
            },
          ),
        ),
      ],
    );
  }

  Card _buildItem(Extension extension) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 4.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              extension.name,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              extension.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 10.0),
            Text('- ${extension.maintainer}'),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.star, size: 16),
                    SizedBox(width: 2.0),
                    Text('STARS ${extension.stars.toString()}'),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today, size: 16),
                    SizedBox(width: 2.0),
                    Text(extension.lastUpdate.toUpperCase()),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.edit, size: 16),
                    SizedBox(width: 2.0),
                    Text('COMMITS ${extension.commits.toString()}'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
