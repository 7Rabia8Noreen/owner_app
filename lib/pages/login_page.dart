import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:owner_app/pages/home_page.dart';
import 'package:owner_app/pages/register_page.dart';
import 'package:owner_app/providers/login_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/show_alert_dialog.dart';
import '../widgets/text_field.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool obsecure= false;

  final _globalKeyLoginForm = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
 
 final box = GetStorage();
  void _submitLoginForm(BuildContext context) async {
    bool isValid = _globalKeyLoginForm.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (!isValid) {
      return;
    }
    box.write('isLoading', true);
    _globalKeyLoginForm.currentState!.save();
     if(box.read('isLoading') == true)
    {
      showAlertDialog(context);
    }
    Provider.of<LoginProvider>(context, listen: false).submitLoginForm(
        _emailController,
        _passwordController,
        context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2E4D9),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 190,
              child: Stack(
                children: [
                   Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset('assets/images/background_art.png',
                    fit: BoxFit.fill,
                    )
                   ),
                   Positioned(
                    top: 64,
                    left: 24,
                    child: Text('Login',
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                    ),
                    )
                   ),
                   Positioned(
                    bottom: 0,
                    left: 24,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a member yet?',
                       style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF3A2228)
                    ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                       InkWell(
                        onTap: (){
                          Navigator.push(context,
                             MaterialPageRoute(builder: (context) => RegisterPage())
                          );
                        },
                         child: Text('Register now',
                         style: GoogleFonts.poppins(
                                             fontSize: 14,
                                             fontWeight: FontWeight.w400,
                                             color: const Color(0xFF555C4B)
                                           ),
                                             ),
                       ),
                    ],
                  ),
                   )
            
                ],
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Form(
                key: _globalKeyLoginForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                    
                   
                     Text('Enter your email',
                         style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF5F383C)
                      ),
                   
                        ),
                        TextFormField(
                    
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFD5AC94)
                          ),
                      decoration: kTextFieldDecor.copyWith(
                        contentPadding: const EdgeInsets.all(0),
                        fillColor: Colors.transparent,
                        hintText: 'abc@gmail.com',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFD5AC94)
                          ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                       validator: (value) {
                          if (value == null || value.isEmpty)
                           {
                            return 'Please enter email';
                          }
                          return null;
                        },
                        ),
                        const SizedBox(
                      height: 20,
                        ),
                         Text('Enter your password',
                          style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF5F383C)
                      ),
                        ),
                        const SizedBox(
                      height: 10,
                        ),
                        TextFormField(
                           style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFD5AC94)
                          ),
                      decoration: kTextFieldDecor.copyWith(
                        contentPadding: const EdgeInsets.all(0),
                        hintStyle:  GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFD5AC94)
                          ),
                        hintText: '*******',
                        suffixIcon: GestureDetector(
                          onTap: () {
                setState(() => obsecure = !obsecure);
                          },
                          child: Icon(
                obsecure ? Icons.visibility_off : Icons.visibility,
                color:  const Color(0xFFCA987E),
                          ),
                        ),
                      ),
                      obscureText: obsecure,
                      controller: _passwordController,
                       validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              } else if (value.length < 7) {
                                return 'Please enter at least 8 characters password';
                              }
                              return null;
                            },
                        ),
                        const SizedBox(
                      height: 100,
                        ),
                        SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        
                      style: OutlinedButton.styleFrom(
                        
                        backgroundColor: const Color(0xFFCA987E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      onPressed: (){
                          _submitLoginForm(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 19),
                        child: Text(
                          'Login',
                          style:GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white
                          ),
                        ),
                      ),
                      ),
                        )
                    
                   ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}