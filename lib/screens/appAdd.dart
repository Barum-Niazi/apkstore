import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// app addition screen
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
  String buttonText = 'Submit';

  Future<void> addNewApp() async {
    var url = Uri.parse('https://appstash-api.onrender.com/add-app');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': '$name',
        'images': {
          'logo': '$logoImageUrl',
          'img1': '$displayImageUrl1',
          'img2': '$displayImageUrl2',
          'img3': '$displayImageUrl3',
        },
        'description': '$description',
        'category': '$category',
        'downloadLink': '$downloadLink',
        'size': '$size',
        'rating': '$rating',
      }),
    );

    if (response.statusCode == 201) {
      print('App added successfully');
    } else {
      print('Failed to add app. Status code: ${response.statusCode}');
    }
  }

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
                    if (value!.isEmpty) {
                      return 'Please enter image url';
                    }
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
                    if (value!.isEmpty) {
                      return 'Please enter image url';
                    }
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
                    if (value!.isEmpty) {
                      return 'Please enter image url';
                    }
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
                    if (value!.isEmpty) {
                      return 'Please enter image url';
                    }
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
                    if (value!.isEmpty) {
                      return 'Please enter description';
                    }
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
                    if (value!.isEmpty) {
                      return 'Please enter download link';
                    }
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
                    if (value!.isEmpty) {
                      return 'Please enter size';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Rating'),
                  onChanged: (value) {
                    setState(() {
                      rating = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter rating';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
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
                      if (buttonText == 'Submit') {
                        addNewApp();
                        setState(() {
                          buttonText = 'Submitted';
                        });
                      } else
                        print('App already submitted.');
                    }
                  },
                  child: Text('$buttonText',
                      style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
