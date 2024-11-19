// ignore_for_file: camel_case_types, non_constant_identifier_names, file_names

// import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liveeasy_app/Number.dart';
import 'package:liveeasy_app/roleSelector.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otp_Verify extends StatefulWidget {
  final String Mobile_number;
  final String code;
  const Otp_Verify({super.key,required this.code, required this.Mobile_number});

  @override
  State<Otp_Verify> createState() => _Otp_VerifyState();
}

class _Otp_VerifyState extends State<Otp_Verify> {

  bool isinvalid = false;
  bool isload = false;
  bool resent  = false;
  
  @override
  void initState()
  {
    super.initState();
    setState(() {
  isinvalid = false;
  isload = false;
  resent = false;
  controller.clear();
});
  }

  TextEditingController controller =  TextEditingController();
  void NextPage () async
  {
    setState(() {
      isload = true;
      isinvalid = false;
    });
    try{
      final cred = PhoneAuthProvider.credential(verificationId: widget.code, smsCode: controller.text);
      await FirebaseAuth.instance.signInWithCredential(cred);

      setState(() {
        isload = false;
        isinvalid  = false;
        resent = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context)=>

           const Roleselector(),
    )
    );
    } catch(e){
      isload = false;
      Future.delayed(const Duration(seconds: 2),
      (){
          setState(() {
            isinvalid = true;
          });
      });
    }
  }

  void resentFunc()
  {
     setState(() {
       isload =true;
       isinvalid =false;
     });

      Future.delayed(const Duration(seconds: 2),(){
      setState(() {
  isload = false;
  resent  =true;
});
      });
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body:Padding(padding:const EdgeInsets.only(top:50),
      child: Column(
        children: [
          _PrevButton(),
          Center(
            child: Column(
              children: [
                _InfoData(),
                Text("Code is Sent to ${widget.Mobile_number}"),
                const SizedBox(height: 18,
                ),
                _OtpInput(),
                  Text.rich(
                  TextSpan(children: [
                  const TextSpan(text: "Didn't receive the Code?  ",),
                  TextSpan(text: "Request Again", 
                  recognizer: TapGestureRecognizer()..onTap = () => resentFunc(),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 3, 9, 81),
                  )),
                  ]
                  ),
                ),
                const SizedBox(height: 14),
                  if (isload) LoadingIndicator(),
                  if (!isload && isinvalid) InvalidMsg(),
                  if(!isload && resent && !isinvalid) resentText(),
                const SizedBox(height: 20,),
                _CntButton(NextPage: NextPage),
              ],     
            ),
          )
        ],
      ),
      
      ),
    );
  }
    Widget _PrevButton() {
    return Align(
          alignment: Alignment.topLeft,
          child: IconButton(onPressed:(){
      Navigator.push(context, 
        MaterialPageRoute( builder: (context) => 
            const Number())); 
          }, icon: const Icon(Icons.arrow_back,
          size: 30,))
    );
  }

    Widget _InfoData() {
    return const Padding(padding:EdgeInsets.only(top:100),
    child :Text("Verify Phone",
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Inter",
              fontWeight: FontWeight.w900,
            ),
            ),
           
    );
  }

   Widget _OtpInput()
   {
    return Container(
      margin: const EdgeInsets.fromLTRB(15,5,15,0),
      child: PinCodeTextField(appContext: context, 
      controller: controller,
      length:6,
      enableActiveFill: true,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        fieldHeight: 52,
        fieldWidth: 52,
        inactiveColor: Colors.blue,
        inactiveFillColor: Colors.lightBlue,
        activeColor: Colors.lightBlue,
        activeFillColor: Colors.lightBlue,
      ),
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
          ), child: const Text('VERIFY AND CONTINUE',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w900,
            fontFamily: 'Rubik',
          ),
        ),
     );
  }
  
  InvalidMsg() {
   return const Text("Invalid otp!!",style: 
   TextStyle(
    color: Colors.red,
   ),);
  }

  LoadingIndicator()
  {
     return const Padding(
      padding: EdgeInsets.all(8.0),
      child: CircularProgressIndicator(),
    );
  }

  resentText()
  {
    return const Text("OTP Resent",style: TextStyle(
      color: Colors.blue,
      ),);
   }

}





  
