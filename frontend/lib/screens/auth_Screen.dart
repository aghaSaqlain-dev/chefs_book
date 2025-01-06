import 'package:chefs_book/screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:chefs_book/constants/global_variables.dart';
import 'package:chefs_book/services/auth_services.dart';

enum Auth { signup, signin }

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signin;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _profilePictureUrlController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _specialtiesController = TextEditingController();
  final TextEditingController _experienceYearsController =
      TextEditingController();
  final TextEditingController _currentRoleController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _restaurantNameController =
      TextEditingController();
  final TextEditingController _restaurantLocationController =
      TextEditingController();
  final TextEditingController _restaurantWebsiteController =
      TextEditingController();
  final AuthService authService = AuthService();
  String? welcomeNote = 'register account as a chef';

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _profilePictureUrlController.dispose();
    _phoneController.dispose();
    _specialtiesController.dispose();
    _experienceYearsController.dispose();
    _currentRoleController.dispose();
    _locationController.dispose();
    _restaurantNameController.dispose();
    _restaurantLocationController.dispose();
    _restaurantWebsiteController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
      profilePictureUrl: _profilePictureUrlController.text,
      phone: _phoneController.text,
      specialties: _specialtiesController.text.split(','),
      experienceYears: int.parse(_experienceYearsController.text),
      currentRole: _currentRoleController.text,
      location: _locationController.text,
      restaurantName: _restaurantNameController.text,
      restaurantLocation: _restaurantLocationController.text,
      restaurantWebsite: _restaurantWebsiteController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_auth == Auth.signup) {
      welcomeNote = 'register account as a chef';
    } else {
      welcomeNote = 'sign in, chef!';
    }
    return Scaffold(
      backgroundColor: GlobalVariables.unselectedNavBarColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color: GlobalVariables.greyBackgroundCOlor),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  welcomeNote!,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: GlobalVariables.greyBackgroundCOlor),
                ),
                ListTile(
                  tileColor: _auth == Auth.signup
                      ? GlobalVariables.blackShade
                      : GlobalVariables.blackShadeTwo,
                  title: const Text(
                    'Create Account',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: GlobalVariables.greyBackgroundCOlor),
                  ),
                  leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signup,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    },
                  ),
                ),
                if (_auth == Auth.signup)
                  Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(labelText: 'Name'),
                        ),
                        TextFormField(
                          controller: _emailController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(labelText: 'Email'),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                        ),
                        TextFormField(
                          controller: _profilePictureUrlController,
                          style: TextStyle(color: Colors.white),
                          decoration:
                              InputDecoration(labelText: 'Profile Picture URL'),
                        ),
                        TextFormField(
                          controller: _phoneController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(labelText: 'Phone'),
                        ),
                        TextFormField(
                          controller: _specialtiesController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              labelText: 'Specialties (comma separated)'),
                        ),
                        TextFormField(
                          controller: _experienceYearsController,
                          style: TextStyle(color: Colors.white),
                          decoration:
                              InputDecoration(labelText: 'Experience Years'),
                          keyboardType: TextInputType.number,
                        ),
                        TextFormField(
                          controller: _currentRoleController,
                          style: TextStyle(color: Colors.white),
                          decoration:
                              InputDecoration(labelText: 'Current Role'),
                        ),
                        TextFormField(
                          controller: _locationController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(labelText: 'Location'),
                        ),
                        TextFormField(
                          controller: _restaurantNameController,
                          style: TextStyle(color: Colors.white),
                          decoration:
                              InputDecoration(labelText: 'Restaurant Name'),
                        ),
                        TextFormField(
                          controller: _restaurantLocationController,
                          style: TextStyle(color: Colors.white),
                          decoration:
                              InputDecoration(labelText: 'Restaurant Location'),
                        ),
                        TextFormField(
                          controller: _restaurantWebsiteController,
                          style: TextStyle(color: Colors.white),
                          decoration:
                              InputDecoration(labelText: 'Restaurant Website'),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: signUpUser,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: GlobalVariables.secondaryColor,
                          ),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ListTile(
                  tileColor: _auth == Auth.signin
                      ? GlobalVariables.blackShade
                      : GlobalVariables.blackShadeTwo,
                  title: const Text(
                    'Sign In',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: GlobalVariables.greyBackgroundCOlor),
                  ),
                  leading: Radio(
                    activeColor: GlobalVariables.secondaryColor,
                    value: Auth.signin,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    },
                  ),
                ),
                if (_auth == Auth.signin)
                  Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(labelText: 'Email'),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: GlobalVariables.secondaryColor,
                          ),
                          onPressed: signInUser,
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 50),
                Container(
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TabsScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                      child: Text(
                        'continue as user',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
