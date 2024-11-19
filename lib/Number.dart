// ignore_for_file: non_constant_identifier_names, constant_identifier_names, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:liveeasy_app/Otp_verification_page.dart';

class Number extends StatefulWidget {
  const Number({super.key});

  @override
  State<Number> createState() => _NumberState();
}


class _NumberState extends State<Number> {
   
  String Mobile_number="";
  bool isloading = false;

  final FocusNode _focusNode = FocusNode();
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isloading = false;
    });
    _focusNode.addListener(() {
      setState(() {
        _isKeyboardVisible = _focusNode.hasFocus;
      });
    });
  }


  void getNum(String Num,String countryCode)
  {
   Mobile_number = countryCode+Num;
  }

  void NextPage() async {

    setState(() {
      isloading = true;
    });

  try {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: Mobile_number,
      verificationCompleted: (PhoneAuthCredential credential) {
        // Auto-verification completed
      },

      verificationFailed: (FirebaseAuthException error) {
        // Show error to the user
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          isloading = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Otp_Verify(
              code: verificationId,
              Mobile_number: Mobile_number,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
      },
    );
  } catch (e) {
    // print("Error during phone number verification: $e");
  }
}


  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
   void _dismiss()
   {
    _focusNode.unfocus();
   }
  @override
  Widget build(BuildContext context) {
     return  Scaffold(
      backgroundColor: Colors.white,
      body: Padding(padding: const EdgeInsets.only(top:50),
      child:Column(
        children: [ 
        if(_isKeyboardVisible)
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(onPressed:_dismiss, icon: const Icon(Icons.close))
        ),
        Center(
        child:Column(
          children: [
            _HeaderData(),
            const SizedBox(height: 12),
            const Text("You will receive a 6 digit code", style: TextStyle(fontFamily: "Inter",color: Color.fromARGB(255, 109, 108, 108)),),
            const Text("to verify next",style: TextStyle(fontFamily: "Inter",color: Color.fromARGB(255, 109, 108, 108),),),
            const SizedBox(height: 20,),
            _PhoneNumberField(focusNode: _focusNode,getNum: getNum),
            if (isloading ) LoadingIndicator(),
            const SizedBox(height: 20,),
            _CntButton(NextPage: NextPage),
          ],
        ),
      ),
      ],
      )
      )
    );
  }
  Widget _HeaderData ()
  
  {
    return const Padding(padding:EdgeInsets.only(top:100),
    child :Text("Please enter your mobile number",
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Inter",
              fontWeight: FontWeight.w900,
            ),
            ),
           
    );
  }
Widget _PhoneNumberField({required FocusNode focusNode,required 
Function(String,String) getNum}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: IntlPhoneField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        initialCountryCode: "IN",
        onChanged: (value)  =>
        {
        setState(() {
          isloading = false;
        }),
        getNum(value.number,value.countryCode),
        print(value)
        },
        focusNode: focusNode,
        decoration: const InputDecoration(
          hintText: "Mobile Number",
          hintStyle: TextStyle(fontFamily: "Rubik"),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          counterText: "",
        ),
        textAlign: TextAlign.left,
      ),
    );
  }


  Widget _CntButton({required Function() NextPage}) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width; 
    return  ElevatedButton(onPressed:NextPage,
          style: ElevatedButton.styleFrom(
               backgroundColor: const Color.fromARGB(255, 30, 71, 147),
               shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
               ),
               fixedSize:  Size(width*0.95, height*0.07),
          ), child: const Text('CONTINUE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w900,
            fontFamily: 'Rubik',
          ),
        ),
     );
  }


   LoadingIndicator()
  {
     return const Padding(
      padding: EdgeInsets.all(8.0),
      child: CircularProgressIndicator(),
    );
  }
  }

  



