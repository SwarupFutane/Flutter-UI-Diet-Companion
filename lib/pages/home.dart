
import 'package:firstuiproject/models/category_models.dart';
import 'package:firstuiproject/models/diet_model.dart';
import 'package:firstuiproject/models/popular_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Homepage extends StatefulWidget {
   Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<CategoryModel> categories=[];
  List<DietModel> diets=[];
  List<PopularModel> Popular =[];

  void getCategories(){
    categories = CategoryModel.getCategories();
  }

  void getDiet(){
    diets = DietModel.getDiet();
  }

  void getPopular(){
    Popular=PopularModel.getPopular();
  }

@override
  void initState() {
    getCategories();
    getDiet();
    getPopular();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getCategories();
    getDiet();
    getPopular();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchfield(),
          _categorysection(),
          SizedBox(height: 40,),
          dietsection(),
          SizedBox(height: 60,),

        Container(
          height: 20,
          child:  Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("Popular Diets ",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 18
            ),
            ),
          ),
        ),
          SizedBox(height: 25,),
          Container(
            height: 300,
            width: 400,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
                itemBuilder: (context,index){
                 return Container(
                   height: 100,
                    decoration: BoxDecoration(
                      color: Popular[index].boxIsSelected?Colors.white:Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: Popular[index].boxIsSelected?[
                        BoxShadow(
                          color: Color(0xFF1D1617).withValues(alpha: 0.07),
                          spreadRadius: 0,
                          blurRadius: 40,
                          offset: Offset(0, 10),
                        )
                      ]: []
                    ),
                  child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(Popular[index].iconPath,height: 65,width: 65,),


                      Column( mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Popular[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16
                          ),
                          ),
                          Text(Popular[index].level+" |"+Popular[index].duration+" |"+Popular[index].calorie ,
                          style: TextStyle(
                              color: Color(0xff7B6F72),
                              fontSize: 13,
                              fontWeight: FontWeight.w400
                          ),)
                        ],
                      ),
                      GestureDetector(
                          onTap: (){

                          },
                          child: SvgPicture.asset('assets/icons/button.svg',height: 30,width: 30,))
                    ],
                  ),
                 );
                },
                shrinkWrap: true,
                separatorBuilder: (context,index)=>SizedBox(height: 15,),
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20
                ),
                itemCount: Popular.length),
          )


        ],
      ),

    );
  }

  Column dietsection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 200,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text('Recommendation for Diet',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 18
                ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 240,

              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return Container(
                        width: 210,
                      decoration: BoxDecoration(
                        color: diets[index].boxColor.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(diets[index].iconpath),
                          Text(diets[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 16
                          ),
                          ),
                          Text(diets[index].level+' | '+diets[index].duration+' | '+diets[index].calorie,
                          style: TextStyle(
                            color: Color(0xff7B6F72),
                            fontSize: 13,
                            fontWeight: FontWeight.w400
                          ),
                          ),
                          Container(
                            height: 45,
                            width: 130,
                            child: Center(
                              child: Text("View",
                                style:
                                TextStyle(
                                  color: diets[index].viewIsSelected?Colors.white:Color(0xffC58BF2),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14
                                ),),
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                diets[index].viewIsSelected?Color(0xff9DCEFF):Colors.transparent,
                                diets[index].viewIsSelected?Color(0xff92A3FD):Colors.transparent
                              ]
                              ),
                              borderRadius: BorderRadius.circular(50)
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder:(context,index)=>SizedBox(width: 25,),
                  padding: EdgeInsets.only(left: 20,right: 20),
                  itemCount: diets.length),
            ),








          ],
        );
  }

  Column _categorysection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Categories",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 18
              ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 120,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (context,index)=>SizedBox(width: 25,),
                  padding: EdgeInsets.only(left: 20,right: 20),
                  itemBuilder: (context,index)=>Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(categories[index].iconpath),
                            ),
                          ),
                          Text(categories[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14
                          ),),
                        ],
                    ) ,
                  ),

              ),
            )
          ],
        );
  }

  Container _searchfield() {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,top:40 ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.11),
            blurRadius:40,
            spreadRadius: 0,
          )
        ]
      ),
      child: Column(
        children: [
          TextField(

            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(15),
              hintText: "Search Pancakes",
              hintStyle: TextStyle(
                fontSize: 14,
                color: Color(0xffDDDADA)
              ),
              border: OutlineInputBorder(
                borderRadius:BorderRadius.circular(15) ,
                borderSide:BorderSide.none,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset('assets/icons/Search.svg'),
              ),
              suffixIcon:  Container(
                width: 100,
                child: IntrinsicHeight(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      VerticalDivider(
                        thickness: 0.1,
                        color: Colors.black,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset('assets/icons/Filter.svg'),
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

  AppBar appBar() {
    return AppBar(
      title: Text("Breakfast",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: (){

        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.center,
            child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg'),
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(10),

            ),
          ),
        ),
      ),

      actions: [
        GestureDetector(
          onTap: (){

          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.center,
              width: 37,
              child: SvgPicture.asset('assets/icons/dots.svg'),
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(10),

              ),
            ),
          ),
        ),
      ],
    );
  }
}
