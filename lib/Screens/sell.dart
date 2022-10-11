import 'package:checkout_screen_ui/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:scrap/Screens/cameras.dart';
import 'package:scrap/Screens/check_out.dart';
import 'package:scrap/Screens/date.dart';
import 'package:scrap/database.dart';
import 'package:selectable_container/selectable_container.dart';

class Sell extends StatefulWidget {
  const Sell({Key? key, required this.selected, required this.selected1, required this.selected2, required this.selected3, required this.selected4}) : super(key: key);
  final bool selected;
  final bool selected1;
  final bool selected2;
  final bool selected3;
  final bool selected4;
  @override
  State<Sell> createState() => _SellState();
}

class _SellState extends State<Sell> {
  final List<PriceItem> _priceItems = [

  ];
  bool _select=false;
  Database database=Database();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sell scrap"),
        backgroundColor: const Color.fromARGB(255,130,36,50),
      ),
      bottomNavigationBar: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.all(20),
        height: 50,
        child: ElevatedButton(
            style: ButtonStyle(backgroundColor: _priceItems.isNotEmpty?MaterialStateProperty.all(const Color.fromARGB(255,130,36,50)):MaterialStateProperty.all(const Color.fromARGB(100,130,36,50))
            ),
            onPressed: (){
              if(_priceItems.isNotEmpty) {
                Navigator.push(context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>const PickDate()
                          // CheckOut(priceItems: _priceItems)
                    // const TakePictureScreen(picture: []),
                  ),
                );
              }
            },
            child: Container(margin: const EdgeInsets.only(left: 20,right: 20),child: const Text("Continue",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            widget.selected?Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20,top: 20),
                  child: Text("Paper",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),

                buildContainer(database.paper,database.paperPrice,database.paper.length),
              ],
            ):const SizedBox(),
            widget.selected1?Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20,top: 20),
                  child: Text("Plastic",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                buildContainer(database.plastic,database.plasticPrice,database.plastic.length),
              ],
            ):const SizedBox(),
            widget.selected2?Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20,top: 20),
                  child: Text("Metal",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                buildContainer(database.metals,database.metalsPrice,database.metals.length),
              ],
            ):const SizedBox(),
            widget.selected3?Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20,top: 20),
                  child: Text("E-Waste",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                buildContainer(database.ewaste,database.ewastePrice,database.ewaste.length),
              ],
            ):const SizedBox(),
            widget.selected4?Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20,top: 20),
                  child: Text("Other items",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                buildContainer(database.other,database.otherPrice,database.other.length),
              ],
            ):const SizedBox(),

          ],
        ),
      ),
    );
  }

  Container buildContainer(List<dynamic> value,  List<dynamic> price,int? itemCount) {
    return Container(
                height: 60,
                  width:  double.maxFinite,
                  margin: const EdgeInsets.all(20),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: MultiSelectContainer(
                            itemsDecoration: MultiSelectDecorations(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    const Color.fromARGB(255,130,36,50).withOpacity(0.1),
                                    Colors.yellow.withOpacity(0.1),
                                  ]),
                                  border: Border.all(color: const Color.fromARGB(255,130,36,50)),
                                  borderRadius: BorderRadius.circular(20)),
                              selectedDecoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Color.fromARGB(255,130,36,50),
                                    Color.fromARGB(255,130,36,50)
                                  ]),
                                  border: Border.all(color: const Color.fromARGB(255,130,36,50)),
                                  borderRadius: BorderRadius.circular(5)),
                              disabledDecoration: BoxDecoration(
                                  color: Colors.grey,
                                  border: Border.all(color: Colors.grey[500]!),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            items: [
                              MultiSelectCard(value: value[index],
                                  child: SizedBox(
                                height: 50,
                                width: 150,
                                child: Center(child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(value[index],style: const TextStyle(fontWeight: FontWeight.bold)),
                                            Text('${'₹'+price[index]}/kg'),
                                          ],
                                        )),
                              )),
                            ],
                            onChange: (allSelectedItems, selectedItem) {
                              for(int i=0;i<allSelectedItems.length;i++){
                                print(allSelectedItems.toList());
                              }
                              if(allSelectedItems.contains(selectedItem)) {
                                setState(() {
                                  _priceItems.add(PriceItem(name: value[index],
                                      quantity: 1,
                                      totalPriceCents: int.parse(
                                          price[index])));
                                }
                                );
                              }
                              else{
                                setState(() {
                                  _priceItems.removeWhere((item) =>
                                  item.name == value[index]);
                                }
                                );
                                }
                            }),
                      );

                    }),
              );
  }
}
