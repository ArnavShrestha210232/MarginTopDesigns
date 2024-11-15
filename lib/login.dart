import 'package:flutter/material.dart';
import 'package:margintopdesigns/utils/color_constant.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background2.png', 
              fit: BoxFit.cover,
            ),
          ),
          
          Column(
            children: [
             
              Image(
                  height: MediaQuery.sizeOf(context).height * 0.7,
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  image: const AssetImage('assets/logo.png')),
              // App Name
              const Text(
                'NIKKLE',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.1),
                child: const Text(
                  'Simplify everything with Nikkle: accounting, HR, CRM, project management, and credit applications!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.6,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'login2');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstant.primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize:
                        MainAxisSize.min, 
                    children: [
                      Text(
                        "LOGIN",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(
                          width: 8), 
                      CircleAvatar(
                          radius: 16,
                          backgroundColor: ColorConstant.whiteColor,
                          child: Icon(
                            Icons.login_sharp,
                            size: 20,
                            color: ColorConstant.primaryColor,
                          ))
                    ],
                  ),
                ),
              )
            
            ],
          ),
        ],
      ),
    );
  }
}
