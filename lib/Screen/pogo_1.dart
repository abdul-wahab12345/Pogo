import 'package:flutter/material.dart';
import 'package:pogo/Widgets/dropdown.dart';
import 'package:pogo/Widgets/input_feild.dart';
import 'package:pogo/Widgets/listbox.dart';
import 'package:pogo/Widgets/minidropdown.dart';
import 'package:pogo/constant.dart';

class PogoScreen extends StatefulWidget {
  PogoScreen({Key? key}) : super(key: key);

  @override
  State<PogoScreen> createState() => _PogoScreenState();
}

class _PogoScreenState extends State<PogoScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      backgroundColor: backgroudColor,
      body: Column(
        children: [
          //navigation bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            color: Colors.white,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      // color: Colors.orange,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset('assets/images/finallogo.png'),
                              Text(
                                'מאגר שליחים לשליחותך',
                                style: TextStyle(color: primaryColor),
                              ),
                            ],
                          ),
                          Image.asset('assets/images/icon.png'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: Container(
                        // color: Colors.black,
                        ),
                  ),
                  //icon
                  Expanded(
                    flex: 1,
                    child: Container(
                      // color: Colors.blue,
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Color.fromRGBO(246, 246, 246, 1),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 16),
                          child: Image.asset('assets/images/inbox.png')),
                    ),
                  ),
                  //icon
                  Expanded(
                    flex: 2,
                    child: Container(
                      // color: Colors.red,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'שם החברה',
                              style: TextStyle(
                                fontFamily: 'Heebo',
                                fontWeight: FontWeight.w700,
                                fontSize: 19,
                              ),
                            ),
                            Text(
                              '379011-03',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15.46,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //navighation end

          //Mian Area
          Expanded(
            child: Row(
              children: [
                //form area
                Expanded(
                  flex: 3,
                  child: Container(
                    color: const Color.fromRGBO(247, 247, 252, 1),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 35),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'כל המסלולים',
                            style: TextStyle(
                                fontWeight: FontWeight.w100,
                                fontSize: 25,
                                letterSpacing: -1),
                          ),
                        ),
                        SizedBox(
                          height: height * 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 1,
                                child: InputFeild(
                                    prefix: Icon(
                                      Icons.search,
                                      size: 20,
                                      color: Colors.grey,
                                    ),
                                    hinntText: 'חיפוש מסלול',
                                    validatior: () {},
                                    inputController: _searchController)),
                            SizedBox(
                              width: width * 1,
                            ),
                            Expanded(
                              flex: 1,
                              child: CustomDropDown(
                                backgroudColor:
                                    Color.fromRGBO(236, 236, 242, 1),
                                onChanged: () {},
                                prefixIcon: Icon(
                                  Icons.inbox,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 1,
                            ),
                            Expanded(
                              flex: 1,
                              child: CustomDropDown(
                                backgroudColor:
                                    Color.fromRGBO(236, 236, 242, 1),
                                onChanged: () {},
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Colors.black,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        //list start
                        SizedBox(
                          height: height * 3,
                        ),
                        ListBox(
                          title: 'קו 1 - נצרת',
                        ),
                        SizedBox(height: height*1.5,),
                         ListBox(
                          title: 'קו 2 - משולש',
                        ),
                        SizedBox(height: height*1.5,),
                             ListBox(
                          title: 'קו 3 - נצרת',
                        ),
                        SizedBox(height: height*1.5,),
                             ListBox(
                          title: 'קו41 - נצרת',
                        ),
                        SizedBox(height: height*1.5,),
                             ListBox(
                          title: 'קו 5 - נצרת',
                        ),
                        


                        //list end
                      ],
                    ),
                  ),
                ),

                //form area end
                //map area
                Expanded(
                  flex: 7,
                  child: Image.asset(
                    'assets/images/map.png',
                    fit: BoxFit.cover,
                  ),
                ),
                //map area end
              ],
            ),
          ),

          //main Area end
        ],
      ),
    );
  }
}
