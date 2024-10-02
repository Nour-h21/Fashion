import 'package:fashion_get/service/FashionApi.dart';
import 'package:flutter/material.dart';

class FashionPage extends StatefulWidget {
  const FashionPage({super.key});

  @override
  State<FashionPage> createState() => _FashionPageState();
}

class _FashionPageState extends State<FashionPage> {
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 6,
          shadowColor: const Color.fromARGB(255, 33, 66, 94),
          backgroundColor: const Color.fromARGB(255, 52, 98, 140),
          title: const Padding(
            padding: EdgeInsets.all(5),
            child: Text(
              'Clothes ',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 249, 242),
                fontSize: 35,
                fontFamily: 'Arima',
                fontWeight: FontWeight.w800,
                height: 2,
                letterSpacing: 0.5,
              ),
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.account_circle,
                color: Color.fromARGB(255, 255, 249, 242),
                size: 28,
              ),
            )
          ],
        ),
        body: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: SizedBox(
                  width: 335,
                  height: 50,
                  child: TextField(
                    cursorColor: const Color(0xFF064469),
                    controller: name,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF8F7FA),
                      labelText: 'Search..',
                      labelStyle: const TextStyle(
                        fontFamily: 'Arima',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF064469),
                      ),
                      prefixIcon: const Icon(
                        Icons.search_outlined,
                        size: 19,
                        color: Color(0xFF064469),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFF064469), width: 1),
                        borderRadius: BorderRadius.circular(
                          150,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFF064469), width: 1),
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.only(left:20,top:10),
              //   child: Text('Dresses ',
              //   style: TextStyle(
              //               fontFamily: 'Arima',
              //               fontSize: 40,
              //               fontWeight: FontWeight.w800,
              //               color: Color(0xFF064469),),),
              // ),

              Center(
                child: FutureBuilder(
                    future: getDataOfDress(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(left: 4, right: 4, top: 25),
                          child: SizedBox(
                            height: 615,
                            width: 380,
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 6,
                                        crossAxisSpacing: 6),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 2,
                                    shadowColor: const Color(0xFF064469),
                                    color: Colors.grey.shade100,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          height: 110,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                snapshot.data![index].image,
                                              ),
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 3),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                snapshot.data![index].name,
                                                style: const TextStyle(
                                                    color: Color(0xFF064469),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15,
                                                    letterSpacing: 0.5),
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              Row(
                                                children: [
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        'Size :',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xFF064469),
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      const SizedBox(
                                                        width: 3,
                                                      ),
                                                      Text(
                                                        snapshot
                                                            .data![index].size,
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 90,
                                                  ),
                                                  Text(
                                                    snapshot.data![index].price,
                                                    style: const TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.redAccent,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const Text(
                                                    'Color :',
                                                    style: TextStyle(
                                                      color: Color(0xFF064469),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 3,
                                                  ),
                                                  Text(
                                                    snapshot.data![index].color,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
