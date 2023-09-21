import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'utils/Global.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var tap = false;
  int? dropdownvalue;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Row(
          children: [
            Icon(
              Icons.location_on_rounded,
              color: Colors.black,
            ),
            Text(
              'Habiganj City',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                letterSpacing: -1,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              const CircleAvatar(
                  backgroundColor: Color(0xfff4f4f4), radius: 20),
              IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pushNamed('third');
                  });
                },
                icon: const Icon(
                  CupertinoIcons.line_horizontal_3_decrease,
                  color: Colors.black,
                  size: 27,
                ),
              ),
            ],
          ),
        ],
        elevation: 0,
      ),
      backgroundColor: const Color(0xffffffff),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(left: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text.rich(
                      TextSpan(
                        text: 'Find The ',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Best\n',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Food',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' Around You\n',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        DropdownButton(
                          value: dropdownvalue,
                          hint: const Text("Select Category..."),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),

                          dropdownColor: const Color(0xfff4f4f4),
                          //      focusColor: Color(0xfff4f4f4),
                          items: Global.allProducts.map(
                            (e) {
                              return DropdownMenuItem(
                                value: Global.allProducts.indexOf(e),
                                child: Text("${e['CategoryName']}"),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(
                              () {
                                dropdownvalue = val!;
                              },
                            );
                          },
                        ),
                        Visibility(
                          visible: (dropdownvalue != null) ? true : false,
                          child: ActionChip(
                            label: const Row(
                              children: [
                                Icon(Icons.clear, size: 15),
                                Text(
                                  'Clear',
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              setState(() {
                                dropdownvalue = null;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (dropdownvalue == null)
                          ? const Row(
                              children: [
                                SizedBox(width: 20),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Find',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '  5km>',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: Colors.deepOrange,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            )
                          : Container(),
                      ...Global.allProducts.map(
                        (e) {
                          List d = e['data'];
                          return (dropdownvalue == null)
                              ? Container(
                                  width: 383,
                                  height: 320,
                                  child: Column(
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            ...d.map(
                                              (e) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      Navigator.of(context)
                                                          .pushNamed('second',
                                                              arguments: e);
                                                    });
                                                  },
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    width: 180,
                                                    height: 280,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color(0xffdee0e5),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10),
                                                      ),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            child: Stack(
                                                              children: [
                                                                Center(
                                                                  child:
                                                                      CircleAvatar(
                                                                    backgroundImage:
                                                                        NetworkImage(
                                                                            "${e['thumbnail']}"),
                                                                    radius: 70,
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topRight,
                                                                  child:
                                                                      IconButton(
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        (e['fav'] ==
                                                                                true)
                                                                            ? e['fav'] =
                                                                                false
                                                                            : e['fav'] =
                                                                                true;
                                                                        Global
                                                                            .likeProducts
                                                                            .add(e);
                                                                      });
                                                                    },
                                                                    icon: (e['fav'] ==
                                                                            false)
                                                                        ? const Icon(
                                                                            CupertinoIcons.heart,
                                                                            color:
                                                                                Colors.black,
                                                                          )
                                                                        : const Icon(
                                                                            CupertinoIcons.heart_fill,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Container(
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  "${e['title']}",
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    height: 20),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    const SizedBox(
                                                                        width:
                                                                            20),
                                                                    const Text(
                                                                      "10min",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .grey,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "⭐ ${e['rating']}",
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .grey,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            20),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Stack(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                const SizedBox(
                                                                    width: 20),
                                                                Text(
                                                                    "${e['price']}.00",
                                                                    style: const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontSize:
                                                                            20)),
                                                              ],
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .topRight,
                                                              child: Container(
                                                                height: 40,
                                                                width: 50,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .greenAccent
                                                                      .shade700,
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            20),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10),
                                                                  ),
                                                                ),
                                                                child:
                                                                    IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      Global
                                                                          .cartProducts
                                                                          .add(
                                                                              e);
                                                                      Global.totalPrice =
                                                                          Global
                                                                              .TotalPrice();
                                                                    });
                                                                  },
                                                                  icon:
                                                                      const Icon(
                                                                    Icons.add,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).toList(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : (dropdownvalue == Global.allProducts.indexOf(e)
                                  ? Container(
                                      width: 383,
                                      height: 320,
                                      child: Column(
                                        children: [
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                ...d.map(
                                                  (e) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          Navigator.of(context)
                                                              .pushNamed(
                                                                  'second',
                                                                  arguments: e);
                                                        });
                                                      },
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .only(left: 10),
                                                        width: 180,
                                                        height: 280,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0xffdee0e5),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(10),
                                                          ),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                child: Stack(
                                                                  children: [
                                                                    Center(
                                                                      child:
                                                                          CircleAvatar(
                                                                        backgroundImage:
                                                                            NetworkImage("${e['thumbnail']}"),
                                                                        radius:
                                                                            70,
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topRight,
                                                                      child:
                                                                          IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          setState(
                                                                            () {
                                                                              (e['fav'] == true) ? e['fav'] = false : e['fav'] = true;
                                                                              (e['fav'] == true) ? Global.likeProducts.add(e) : Global.likeProducts.remove(e);
                                                                            },
                                                                          );
                                                                        },
                                                                        icon: (e['fav'] ==
                                                                                false)
                                                                            ? const Icon(
                                                                                CupertinoIcons.heart,
                                                                                color: Colors.black,
                                                                              )
                                                                            : const Icon(
                                                                                CupertinoIcons.heart_fill,
                                                                                color: Colors.black,
                                                                              ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                child: Column(
                                                                  children: [
                                                                    Text(
                                                                      "${e['title']}",
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            20,
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                        height:
                                                                            20),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        const SizedBox(
                                                                            width:
                                                                                20),
                                                                        const Text(
                                                                          "10min",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            color:
                                                                                Colors.grey,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          "⭐ ${e['rating']}",
                                                                          style:
                                                                              const TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            color:
                                                                                Colors.grey,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                            width:
                                                                                20),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Stack(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    const SizedBox(
                                                                        width:
                                                                            20),
                                                                    Text(
                                                                        "${e['price']}.00",
                                                                        style: const TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            fontSize: 20)),
                                                                  ],
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topRight,
                                                                  child:
                                                                      Container(
                                                                    height: 40,
                                                                    width: 50,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .greenAccent
                                                                          .shade700,
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(20),
                                                                        bottomRight:
                                                                            Radius.circular(10),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        IconButton(
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                            () {
                                                                          e['inCart'] =
                                                                              !false;
                                                                          Global.totalPrice =
                                                                              Global.TotalPrice();

                                                                          Global
                                                                              .cartProducts
                                                                              .add(e);
                                                                        });
                                                                      },
                                                                      icon: (e['inCart'] ==
                                                                              false)
                                                                          ? const Icon(
                                                                              Icons.remove,
                                                                              color: Colors.white,
                                                                            )
                                                                          : const Icon(
                                                                              Icons.add,
                                                                              color: Colors.white,
                                                                            ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).toList(),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container());
                        },
                      ).toList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
