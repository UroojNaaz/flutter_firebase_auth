import 'package:flutter/material.dart';
import 'package:flutter_firebase/auth_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "assets/images/forgot_pw.jpg", // Ensure the path is correct
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
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: emailController,
                        hint: 'Email',
                        icon: FontAwesomeIcons.envelope,
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () async {
                          final authProvider = Provider.of<AuthProvider>(context, listen: false);
                          try {
                            await authProvider.resetPassword(emailController.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Password reset email sent.')),
                            );
                            // Navigate back to login screen after resetting password
                            Navigator.pushNamed(context, '/login');
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error: ${e.toString()}')),
                            );
                          }
                        },
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 247, 98, 12),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            'Reset Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16, // Adjusted font size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
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
      height: 40,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 31, 30, 30).withOpacity(0.6),
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(color: Color.fromARGB(255, 219, 217, 217), fontSize: 16), // Adjusted text size
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 219, 217, 217)),
          prefixIcon: Icon(icon, color: const Color.fromARGB(255, 219, 217, 217), size: 18), // Adjusted icon size
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none,
          ),
          // contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:flutter_firebase/auth_provider.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';

// class ForgotPasswordScreen extends StatelessWidget {
//   const ForgotPasswordScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final emailController = TextEditingController();

//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           Image.asset(
//             "assets/images/forgot_pw.jpg", // Ensure the path is correct
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
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.arrow_back, color: Colors.white),
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                       ),
//                       Expanded(
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: <Widget>[
//                                 const SizedBox(height: 15),
//                                 const Text(
//                                   'Forgot Password',
//                                   style: TextStyle(
//                                     fontSize: 30,
//                                     fontWeight: FontWeight.bold,
//                                     color: Color.fromARGB(255, 0, 0, 0),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 _buildTextField(
//                                   controller: emailController,
//                                   hint: 'Email',
//                                   icon: FontAwesomeIcons.envelope,
//                                 ),
//                                 const SizedBox(height: 12),
//                                 GestureDetector(
//                                   onTap: () async {
//                                     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//                                     try {
//                                       await authProvider.resetPassword(emailController.text);
//                                       ScaffoldMessenger.of(context).showSnackBar(
//                                         const SnackBar(content: Text('Password reset email sent.')),
//                                       );
//                                       // Navigate back to login screen after resetting password
//                                       Navigator.pushNamed(context, '/login');
//                                     } catch (e) {
//                                       ScaffoldMessenger.of(context).showSnackBar(
//                                         SnackBar(content: Text('Error: ${e.toString()}')),
//                                       );
//                                     }
//                                   },
//                                   child: Container(
//                                     width: double.infinity,
//                                     height: 35,
//                                     decoration: BoxDecoration(
//                                       color: const Color.fromARGB(255, 247, 98, 12),
//                                       borderRadius: BorderRadius.circular(40),
//                                     ),
//                                     alignment: Alignment.center,
//                                     child: const Text(
//                                       'Reset Password',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 10),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
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
//     return TextField(
//       controller: controller,
//       obscureText: obscureText,
//       style: const TextStyle(color: Color.fromARGB(255, 219, 217, 217)),
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: const TextStyle(color: Color.fromARGB(255, 219, 217, 217)),
//         prefixIcon: Icon(icon, color: const Color.fromARGB(255, 219, 217, 217)),
//         filled: true,
//         fillColor: const Color.fromARGB(255, 31, 30, 30).withOpacity(0.6),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(40),
//           borderSide: BorderSide.none,
//         ),
//         contentPadding: const EdgeInsets.symmetric(vertical: 18),
//       ),
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'package:flutter_firebase/auth_provider.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';

// class ForgotPasswordScreen extends StatelessWidget {
//   const ForgotPasswordScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final emailController = TextEditingController();
//     final oldPasswordController = TextEditingController();
//     final newPasswordController = TextEditingController();
//     final confirmPasswordController = TextEditingController();

//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           Image.asset(
//             "assets/images/forgot_pw.jpg", // Ensure the path is correct
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
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.arrow_back, color: Colors.white),
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                       ),
//                       Expanded(
//                         child: Center(
//                           child: Container(
//                             // decoration: BoxDecoration(
//                             //   color: const Color.fromARGB(255, 241, 241, 241).withOpacity(0.2),
//                             //   borderRadius: BorderRadius.circular(15),
//                             // ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: <Widget>[
//                                   const SizedBox(height: 15),
//                                   const Text(
//                                     'Forgot Password',
//                                     style: TextStyle(
//                                       fontSize: 30,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color.fromARGB(255, 0, 0, 0),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 10),
//                                   _buildTextField(
//                                     controller: emailController,
//                                     hint: 'Email',
//                                     icon: FontAwesomeIcons.envelope,
//                                   ),
//                                   const SizedBox(height: 10),
//                                   _buildTextField(
//                                     controller: oldPasswordController,
//                                     hint: 'Old Password',
//                                     icon: FontAwesomeIcons.lock,
//                                     obscureText: true,
//                                   ),
//                                   const SizedBox(height: 10),
//                                   _buildTextField(
//                                     controller: newPasswordController,
//                                     hint: 'New Password',
//                                     icon: FontAwesomeIcons.lock,
//                                     obscureText: true,
//                                   ),
//                                   const SizedBox(height: 10),
//                                   _buildTextField(
//                                     controller: confirmPasswordController,
//                                     hint: 'Confirm Password',
//                                     icon: FontAwesomeIcons.lock,
//                                     obscureText: true,
//                                   ),
//                                   const SizedBox(height: 12),
//                                   GestureDetector(
//                                     onTap: () {
//                                       final authProvider = Provider.of<AuthProvider>(context, listen: false);
//                                       authProvider.resetPassword(
//                                         emailController.text,
//                                         oldPasswordController.text,
//                                         newPasswordController.text,
//                                         confirmPasswordController.text,
//                                       );
//                                       // Navigate back to login screen after resetting password
//                                       Navigator.pushNamed(context, '/login');
//                                     },
//                                     child: Container(
//                                       width: double.infinity,
//                                       height: 35,
//                                       decoration: BoxDecoration(
//                                         color: const Color.fromARGB(255, 247, 98, 12),
//                                         borderRadius: BorderRadius.circular(40),
//                                       ),
//                                       alignment: Alignment.center,
//                                       child: const Text(
//                                         'Reset Password',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 14,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 10),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
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
//     return TextField(
//       controller: controller,
//       obscureText: obscureText,
//       style: const TextStyle(color: Color.fromARGB(255, 219, 217, 217)),
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: const TextStyle(color: Color.fromARGB(255, 219, 217, 217)),
//         prefixIcon: Icon(icon, color: const Color.fromARGB(255, 219, 217, 217)),
//         filled: true,
//         fillColor: const Color.fromARGB(255, 31, 30, 30).withOpacity(0.6),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(40),
//           borderSide: BorderSide.none,
//         ),
//         contentPadding: const EdgeInsets.symmetric(vertical: 22),
//       ),
//     );
//   }
// }


