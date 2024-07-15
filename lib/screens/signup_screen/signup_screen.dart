import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase/auth_provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/signup.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 15),
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildTextField(
                        controller: nameController,
                        hint: 'Name',
                        icon: FontAwesomeIcons.user,
                      ),
                      const SizedBox(height: 10),
                      _buildTextField(
                        controller: emailController,
                        hint: 'Email',
                        icon: FontAwesomeIcons.envelope,
                      ),
                      const SizedBox(height: 10),
                      _buildTextField(
                        controller: passwordController,
                        hint: 'Password',
                        icon: FontAwesomeIcons.lock,
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),
                      _buildTextField(
                        controller: confirmPasswordController,
                        hint: 'Confirm Password',
                        icon: FontAwesomeIcons.lock,
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              // Handle forgot password
                            },
                            child: const Text(
                              'Have an Account?',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: () async {
                          // Validate inputs
                          if (nameController.text.isEmpty ||
                              emailController.text.isEmpty ||
                              passwordController.text.isEmpty ||
                              confirmPasswordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please fill in all fields')),
                            );
                            return;
                          }
                          if (passwordController.text != confirmPasswordController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Passwords do not match')),
                            );
                            return;
                          }

                          try {
                            await authProvider.signUp(
                              nameController.text,
                              emailController.text,
                              passwordController.text,
                              confirmPasswordController.text,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Sign up successful')),
                            );
                          } on Exception catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error: ${e.toString()}')),
                            );
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 247, 98, 12),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'SignUp',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscureText = false,
  }) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 31, 30, 30).withOpacity(0.6),
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(color: Color.fromARGB(255, 219, 217, 217)),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 219, 217, 217),
            fontSize: 14,
          ),
          prefixIcon: Icon(
            icon,
            color: const Color.fromARGB(255, 219, 217, 217),
            size: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }
}















// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_firebase/auth_provider.dart';

// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context);
//     final nameController = TextEditingController();
//     final emailController = TextEditingController();
//     final passwordController = TextEditingController();
//     final confirmPasswordController = TextEditingController();

//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           Image.asset(
//             'assets/images/signup.jpg',
//             fit: BoxFit.cover,
//           ),
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.all(30.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       const SizedBox(height: 15),
//                       const Text(
//                         'Sign Up',
//                         style: TextStyle(
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: Color.fromARGB(255, 0, 0, 0),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       _buildTextField(
//                         controller: nameController,
//                         hint: 'Name',
//                         icon: FontAwesomeIcons.user,
//                       ),
//                       const SizedBox(height: 10),
//                       _buildTextField(
//                         controller: emailController,
//                         hint: 'Email',
//                         icon: FontAwesomeIcons.envelope,
//                       ),
//                       const SizedBox(height: 10),
//                       _buildTextField(
//                         controller: passwordController,
//                         hint: 'Password',
//                         icon: FontAwesomeIcons.lock,
//                         obscureText: true,
//                       ),
//                       const SizedBox(height: 10),
//                       _buildTextField(
//                         controller: confirmPasswordController,
//                         hint: 'Confirm Password',
//                         icon: FontAwesomeIcons.lock,
//                         obscureText: true,
//                       ),
//                       const SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           GestureDetector(
//                             onTap: () {
//                               // Handle forgot password
//                             },
//                             child: const Text(
//                               'Have an Account?',
//                               style: TextStyle(
//                                   color: Color.fromARGB(255, 0, 0, 0),
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pushNamed(context, '/login');
//                             },
//                             child: const Text(
//                               'Login',
//                               style: TextStyle(
//                                   color: Color.fromARGB(255, 0, 0, 0),
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       GestureDetector(
//                         onTap: () {
//                           authProvider.signUp(
//                             nameController.text,
//                             emailController.text,
//                             passwordController.text,
//                             confirmPasswordController.text,
//                           );
//                         },
//                         child: Container(
//                           width: double.infinity,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             color: const Color.fromARGB(255, 247, 98, 12),
//                             borderRadius: BorderRadius.circular(40),
//                           ),
//                           alignment: Alignment.center,
//                           child: const Text(
//                             'SignUp',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String hint,
//     required IconData icon,
//     bool obscureText = false,
//   }) {
//     return Container(
//       width: double.infinity,
//       height: 40,
//       decoration: BoxDecoration(
//         color: const Color.fromARGB(255, 31, 30, 30).withOpacity(0.6),
//         borderRadius: BorderRadius.circular(40),
//       ),
//       child: TextField(
//         controller: controller,
//         obscureText: obscureText,
//         style: const TextStyle(color: Color.fromARGB(255, 219, 217, 217)),
//         decoration: InputDecoration(
//           hintText: hint,
//           hintStyle: const TextStyle(
//             color: Color.fromARGB(255, 219, 217, 217),
//             fontSize: 14,
//           ),
//           prefixIcon: Icon(
//             icon,
//             color: const Color.fromARGB(255, 219, 217, 217),
//             size: 14,
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(40),
//             borderSide: BorderSide.none,
//           ),
//           contentPadding: const EdgeInsets.symmetric(vertical: 18),
//         ),
//       ),
//     );
//   }
// }
