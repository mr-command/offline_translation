import 'package:flutter/material.dart';
import 'package:mmd_translate/logic/translation.dart';

class TranslatePage extends StatelessWidget {
  const TranslatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final translatecontroller = TextEditingController();
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        // backgroundColor: Colors.black,
        title:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text("مترجم افلاین",style: TextStyle(
                    fontFamily: "Estedad",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.deepPurple
                    
                  
                  ),),

                  SizedBox(width: 20,),
                  Text("ممد ترنسلیت",style: TextStyle(
                    fontFamily: "Estedad",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple
                  
                  ),),
                ],
              ),

            ],
          )
        ,
      ),


      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            child: TextField(
              maxLines: 20,
              minLines: 10,
              controller: translatecontroller,
              decoration: InputDecoration(
                hintText: "متن رو وارد کن",
                hintStyle: TextStyle(
                    fontFamily: "Estedad",
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.deepPurple
                  
                  ),
                border: OutlineInputBorder(

                )
              ),
            ),
          ),


          TextButton(
            onPressed: () => translate(translatecontroller.text),
            child: Text("ترجمه",style: TextStyle(
                    fontFamily: "Estedad",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple
                  
                  ),),
            )
        ],
      ),



    );
  }
}