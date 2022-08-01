import 'package:flutter/material.dart';
import 'package:pogo/Widgets/dropdown.dart';
import 'package:pogo/Widgets/minidropdown.dart';

class ListBox extends StatefulWidget {
  ListBox({required this.title, Key? key}) : super(key: key);

  String title;

  @override
  State<ListBox> createState() => _ListBoxState();
}

class _ListBoxState extends State<ListBox> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 100;
    var width = MediaQuery.of(context).size.width / 100;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      Container(
                        height: height * 1,
                        width: height * 1,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isExpanded
                                ? Colors.green
                                : Colors.grey.withOpacity(0.6)),
                      ),
                      SizedBox(
                        width: width * 1,
                      ),
                      Text(
                        widget.title,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Heebo',
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: MiniDropDown(onChanged: (value) {
                      print('value');
                    })),
                SizedBox(
                  width: width * 2,
                ),
                Expanded(
                  flex: 8,
                  child: CustomDropDown(
                    isBorder: true,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey.withOpacity(0.5),
                      size: 20,
                    ),
                    onChanged: () {},
                    backgroudColor: Colors.white,
                    borderColor: Colors.grey.withOpacity(0.5),
                  ),
                ),
                SizedBox(
                  width: width * 1,
                ),
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.5), width: 0.5)),
                      child: Icon(
                        Icons.more_vert,
                        color: Colors.grey,
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: height * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: height*2,
                    width: height*2,
                      color: isExpanded
                          ? Colors.grey
                          :  const Color.fromRGBO(239, 239, 243, 1),
                      padding:  const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Image.asset(
                        'assets/images/arrow.png',
                        color: isExpanded ? Colors.white : Colors.black,
                      )),
                ),
                SizedBox(width: width*1,),
                Expanded(
                  flex: 6,
                  child: contentBox(
                    height: height,
                    width: width,
                    title: '23 תחנות',
                    image: 'assets/images/drop.png',
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: contentBox(
                    height: height,
                    width: width,
                    title: '45 ק״מ',
                    image: 'assets/images/clock.png',
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: contentBox(
                    height: height,
                    width: width,
                    title: '2:34 ש׳',
                    image: 'assets/images/watch.png',
                  ),
                ),
                Expanded(
                    flex: 6,
                    child: TextButton.icon(
                        onPressed: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        label: Text(
                          'הצג תחנות',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                              color: Colors.black),
                        ))),
              ],
            ),
            SizedBox(
              height: height * 1.5,
            ),
            if (isExpanded)
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: height*2,
                    width: height*2,
                      color: Colors.transparent,
                        
                      padding:  const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: Image.asset(
                        'assets/images/arrow.png',
                        color: isExpanded ? Colors.transparent : Colors.transparent,
                      )),
                ),
                SizedBox(width: width*1,),
                Expanded(
                  flex: 6,
                  child: contentBox(
                    height: height,
                    width: width,
                    title: '23 תחנות',
                    image: 'assets/images/drop.png',
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: contentBox(
                    height: height,
                    width: width,
                    title: '45 ק״מ',
                    image: 'assets/images/clock.png',
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: contentBox(
                    height: height,
                    width: width,
                    title: '2:34 ש׳',
                    image: 'assets/images/watch.png',
                  ),
                ),
                Expanded(
                    flex: 6,
                    child: Container(),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class contentBox extends StatelessWidget {
  contentBox({
    Key? key,
    required this.height,
    required this.width,
    required this.image,
    required this.title,
  }) : super(key: key);

  final double height;
  final double width;
  String image;
  String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          height: height * 2,
          width: height * 2,
          fit: BoxFit.contain,
        ),
        SizedBox(
          width: width * 0.3,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 11,
          ),
        )
      ],
    );
  }
}
