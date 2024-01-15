import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String logoImageUrl = '';
  String displayImageUrl1 = '';
  String displayImageUrl2 = '';
  String displayImageUrl3 = '';
  String description = '';
  String category = '';
  String downloadLink = '';
  String size = '';
  String rating = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Logo Image URL'),
                  onChanged: (value) {
                    setState(() {
                      logoImageUrl = value;
                    });
                  },
                  validator: (value) {
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Display Image URL 1'),
                  onChanged: (value) {
                    setState(() {
                      displayImageUrl1 = value;
                    });
                  },
                  validator: (value) {
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Display Image URL 2'),
                  onChanged: (value) {
                    setState(() {
                      displayImageUrl2 = value;
                    });
                  },
                  validator: (value) {
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Display Image URL 3'),
                  onChanged: (value) {
                    setState(() {
                      displayImageUrl3 = value;
                    });
                  },
                  validator: (value) {
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  onChanged: (value) {
                    setState(() {
                      description = value;
                    });
                  },
                  validator: (value) {
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: 'Category'),
                  items: ['Game', 'Social', 'Entertainment', 'Editor']
                      .map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      category = value!;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please choose a category';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Download Link'),
                  onChanged: (value) {
                    setState(() {
                      downloadLink = value;
                    });
                  },
                  validator: (value) {
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Size'),
                  onChanged: (value) {
                    setState(() {
                      size = value;
                    });
                  },
                  validator: (value) {
                    // Add validation logic if needed
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Rating'),
                  onChanged: (value) {
                    setState(() {
                      rating = value;
                    });
                  },
                  validator: (value) {
                    // Add validation logic if needed
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform form submission logic here
                      // You can print the values for now
                      print('Name: $name');
                      print('Logo Image URL: $logoImageUrl');
                      print('Display Image URL 1: $displayImageUrl1');
                      print('Display Image URL 2: $displayImageUrl2');
                      print('Display Image URL 3: $displayImageUrl3');
                      print('Description: $description');
                      print('Category: $category');
                      print('Download Link: $downloadLink');
                      print('Size: $size');
                      print('Rating: $rating');
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
