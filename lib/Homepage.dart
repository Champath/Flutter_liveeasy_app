import 'package:liveeasy_app/Number.dart';
import 'package:flutter/material.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String selectedValue ="English";
  void NextPage()
{
    Navigator.push(context, MaterialPageRoute(builder: (context)=>
    const Number()) );
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
         backgroundColor: Colors.white,
         body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top:200),
            child: Column(
            children: [
              const Icon(Icons.photo,
              size: 60,),
              const SizedBox(height: 10,),
             const Text("Please Select Your Language",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),),
              const SizedBox(height: 10,),
              const Text("You can change your language", style: TextStyle(fontFamily: "Inter",color: Color.fromARGB(255, 109, 108, 108)),),
            const Text("at any time",style: TextStyle(fontFamily: "Inter",color: Color.fromARGB(255, 109, 108, 108),),),
              const SizedBox(height:20),
              _Languageselector(),
              const SizedBox(height: 20,),              
              _CntButton(NextPage:NextPage),
              const Spacer(),
               Image.asset('img/bottom.png'),
            ],
          ),
         ),
         ),
    );
  }
  Widget _Languageselector() {
    List<String> languages = ["English", "Hindi"];
    return SizedBox(
      width:300,
      height: 65,
      child:
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(0),
              value: selectedValue,
              items: languages.map((String val) {
                return DropdownMenuItem<String>(
                  value: val,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10,3,0,7),
                    child: Text(val,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                });
              },
              isExpanded: true,
            ),
          ),
        ),
    );
  }


   Widget _CntButton({required Function() NextPage}) {
   
    return  ElevatedButton(onPressed:NextPage,
          style: ElevatedButton.styleFrom(
               backgroundColor: const Color.fromARGB(255, 30, 71, 147),
               shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
               ),
               fixedSize:  const Size(300, 65),
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

//flutter build apk --split-per-abi


