import 'package:flutter/material.dart';
import 'package:chefs_book/services/dish_service.dart';

class AddDishScreen extends StatefulWidget {
  @override
  _AddDishScreenState createState() => _AddDishScreenState();
}

class _AddDishScreenState extends State<AddDishScreen> {
  final _formKey = GlobalKey<FormState>();
  String _categories = '';
  String _title = '';
  String _affordability = '';
  String _complexity = '';
  String _imageUrl = '';
  int _duration = 0;
  String _ingredients = '';
  String _steps = '';
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final data = {
        'categories': _categories.split(','),
        'title': _title,
        'affordability': _affordability,
        'complexity': _complexity,
        'imageUrl': _imageUrl,
        'duration': _duration,
        'ingredients': _ingredients.split(','),
        'steps': _steps.split(','),
        'isGlutenFree': _isGlutenFree,
        'isVegan': _isVegan,
        'isVegetarian': _isVegetarian,
        'isLactoseFree': _isLactoseFree,
      };

      addDish(context: context, data: data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Dish'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Categories (comma separated)'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter categories';
                  }
                  return null;
                },
                onSaved: (value) {
                  _categories = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Affordability'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter affordability';
                  }
                  return null;
                },
                onSaved: (value) {
                  _affordability = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Complexity'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter complexity';
                  }
                  return null;
                },
                onSaved: (value) {
                  _complexity = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  return null;
                },
                onSaved: (value) {
                  _imageUrl = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Duration (in minutes)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter duration';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _duration = int.parse(value!);
                },
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Ingredients (comma separated)'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter ingredients';
                  }
                  return null;
                },
                onSaved: (value) {
                  _ingredients = value!;
                },
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Steps (comma separated)'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter steps';
                  }
                  return null;
                },
                onSaved: (value) {
                  _steps = value!;
                },
              ),
              SwitchListTile(
                title: Text('Gluten Free'),
                value: _isGlutenFree,
                onChanged: (value) {
                  setState(() {
                    _isGlutenFree = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Vegan'),
                value: _isVegan,
                onChanged: (value) {
                  setState(() {
                    _isVegan = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Vegetarian'),
                value: _isVegetarian,
                onChanged: (value) {
                  setState(() {
                    _isVegetarian = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Lactose Free'),
                value: _isLactoseFree,
                onChanged: (value) {
                  setState(() {
                    _isLactoseFree = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add Dish'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
