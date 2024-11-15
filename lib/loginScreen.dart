import 'package:flutter/material.dart';
import 'package:margintopdesigns/utils/color_constant.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/2ndbackground.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.21),
                  Container(
                    child: Image(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.sizeOf(context).width * 0.35,
                      image: const AssetImage(
                          'assets/logo2.png'), 
                    ),
                  ),
                  const Text(
                    "Let's get something",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Good to see you back.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Container(height: MediaQuery.sizeOf(context).height * 0.05),
                  const Text("Email",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  TextFormField(
                    controller: TextEditingController(
                        text: 'margintopsolutions@gmail.com'),
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      focusColor: Colors.black,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),         
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Password",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("Forgot?",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  TextFormField(
                    obscureText: true,
                    obscuringCharacter: "*",
                    controller: TextEditingController(text: '123456789101112'),
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      focusColor: Colors.black,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),

                  const SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "homepage");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstant.primaryColor,
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                              color: ColorConstant.whiteColor, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
     
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               'assets/2ndbackground.jpg', // Replace with your actual path to the background image
//               fit: BoxFit.cover,
//             ),
//           ),
//           SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: SafeArea(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                       height:
//                           80), // Space for the UI to not clash with the keyboard
//                   const CircleAvatar(
//                     radius: 40,
//                     backgroundImage: AssetImage(
//                         'assets/logo.png'), // Replace with the path to your logo
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     "Let's get something",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const Text(
//                     "Good to see you back.",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   TextFormField(
//                     decoration: const InputDecoration(
//                       labelText: 'Email',
//                       border: UnderlineInputBorder(),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: TextFormField(
//                           obscureText: true,
//                           decoration: const InputDecoration(
//                             labelText: 'Password',
//                             border: UnderlineInputBorder(),
//                           ),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           // Handle 'Forgot?' action
//                         },
//                         child: const Text('Forgot?'),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 30),
//                   Center(
//                     child: SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Handle login action
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: ColorConstant.primaryColor,
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 15,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ),
//                         child: const Text(
//                           'Log In',
//                           style: TextStyle(
//                             color: ColorConstant.whiteColor,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Center(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text("Don't have an account? "),
//                         GestureDetector(
//                           onTap: () {
//                             // Handle sign-up action
//                           },
//                           child: const Text(
//                             'Sign Up',
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                       height: 40), // Space below for scrolling to feel natural
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
