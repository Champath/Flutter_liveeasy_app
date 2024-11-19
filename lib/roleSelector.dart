// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

class Roleselector extends StatefulWidget {
  const Roleselector({super.key});

  @override
  State<Roleselector> createState() => _RoleselectorState();
}

class _RoleselectorState extends State<Roleselector> {

 String selectedVal ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
        body:Padding(padding: const EdgeInsets.only(top:100),
        child: Column(
          children: [
                Center(
                child: Column(
                  children: [
                    _HeaderData(),
                    _RoleButton(),
                    _CntButton(),
                  ],
                ),
                ),
          ],
        ),
        ),
    );
  }

 Widget _HeaderData ()
  {
    return const Padding(padding:EdgeInsets.only(top:100),
    child :Text("Please select your profile",
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Inter",
              fontWeight: FontWeight.w900,
            ),
            ),
           
    );
  }

Widget _RoleButton()
{
  double screenWidth = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.fromLTRB(20,40,20,20),
    child: Column(
      children: [
        SizedBox(
          height: 100,
          width:screenWidth ,
          child: RadioMenuButton(
          value: "Shipper",
           groupValue: selectedVal, 
          onChanged: (value)
          {
            setState(() =>selectedVal = value!);
          },
          style: ButtonStyle(
             shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: 
              BorderRadius.circular(0),
              ),
              ),
              side: const WidgetStatePropertyAll(
                BorderSide(color: Colors.black, width: 1),
              )
          ), 
            child: const Row(
              children: [
                Icon(Icons.warehouse,
                size: 60,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(13,13,0,16),
                  child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Shipper',
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 16, 16, 16),
                          
                        ),
                        ),
                        SizedBox(height: 9,),
                      Text("Lorem ipsum dolor sit amet,",
                      style: TextStyle(
                        color: Color.fromARGB(255, 100, 99, 99),
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                      ),
                      Text("conectetur adpiscing",
                       style: TextStyle(
                        color:  Color.fromARGB(255, 100, 99, 99),
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                      ),
                      ],
                    ),
                  ),
                
              ],
            ),
          ),
          
          ),
          const SizedBox(height:30),
          SizedBox(
          height: 100,
          width:screenWidth ,
          child: RadioMenuButton(value: "Buyer"
          , groupValue: selectedVal, 
          onChanged: (selVal)
          {
            setState(() =>
              selectedVal = selVal!);
          },
          style: ButtonStyle(
             shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: 
              BorderRadius.circular(0),
              )
              ),
              side: const WidgetStatePropertyAll(
                BorderSide(color: Colors.black, width: 1),
              )
          ), 
            child: const Row(
              children: [
                Icon(Icons.local_shipping,
                size: 60,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(13,13,0,16),
                  child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Transporter',
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 16, 16, 16),
                          
                        ),
                        ),
                        SizedBox(height: 9,),
                      Text("Lorem ipsum dolor sit amet,",
                      style: TextStyle(
                        color: Color.fromARGB(255, 100, 99, 99),
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                      ),
                      Text("conectetur adpiscing",
                       style: TextStyle(
                        color:  Color.fromARGB(255, 100, 99, 99),
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
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

Widget _CntButton() {
  
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width; 
    return  ElevatedButton(onPressed:()=>{},
          style: ElevatedButton.styleFrom(
               backgroundColor: const Color.fromARGB(255, 30, 71, 147),
               shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
               ),
               fixedSize:  Size(width*0.9, height*0.07),
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

}