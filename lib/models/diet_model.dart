import 'dart:ui';

class DietModel{

  String name;
  String iconpath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

DietModel({
  required this.name,
  required this.iconpath,
  required this.calorie,
  required this.duration,
  required this.level,
  required this.boxColor,
  required this.viewIsSelected,
}
);

static List<DietModel> getDiet(){
  List<DietModel> diets=[];

  diets.add(
      DietModel(
          name: 'Honey Pancake',
          iconpath: 'assets/icons/honey-pancakes.svg',
          level: 'Easy',
          duration: '30mins',
          calorie: '180kCal',
          viewIsSelected: true,
          boxColor: Color(0xff9DCEFF),
      )
  );

  diets.add(
      DietModel(
          name: 'Canai Bread',
          iconpath: 'assets/icons/canai-bread.svg',
          level: 'Easy',
          duration: '20mins',
          calorie: '230kCal',
          viewIsSelected: false,
          boxColor: Color(0xffEEA4CE),
      )
  );
return diets;
}

}