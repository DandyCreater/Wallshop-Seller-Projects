// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:skeletons/skeletons.dart';
import 'package:wallshop_seller/presentation/bloc/product-bloc/product_bloc.dart';
import 'package:wallshop_seller/presentation/bloc/product-terpopuler-bloc/product_terpopuler_bloc.dart';
import 'package:wallshop_seller/presentation/screen/homepage/widget/overview_card_widget.dart';
import 'package:wallshop_seller/presentation/screen/homepage/widget/traffic_card_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    Widget utama() => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 0, right: 20, left: 20),
            child: Column(
              children: [
                Container(
                  height: 155,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                          spreadRadius: 0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Overview",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            OverviewCardWidget(title: "Produk", price: "2900"),
                            OverviewCardWidget(
                                title: "Transaksi", price: "1000"),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 155,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                          spreadRadius: 0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Traffic",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            TrafficCardWidget(title: "Pengikut", price: "5000"),
                            TrafficCardWidget(
                                title: "Kunjungan", price: "29000")
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 350,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                          spreadRadius: 0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 30,
                                child: Center(
                                  child: Text(
                                    "Product Terpopuler",
                                    style: GoogleFonts.inter(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                width: 80,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      border:
                                          Border.all(color: Color(0xff70767F))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/option_icon.svg'),
                                      Text(
                                        'Rubah',
                                        style: GoogleFonts.roboto(
                                            fontSize: 13,
                                            color: Color(0xff70767F),
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                              height: 200,
                              child: BlocBuilder<ProductTerpopulerBloc,
                                  ProductTerpopulerState>(
                                builder: (context, state) {
                                  if (state is ProductTerpopulerSuccess) {
                                    var items = state.value!.items;
                                    return ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: items!.length,
                                        itemBuilder: ((context, index) {
                                          return SizedBox(
                                            width: width,
                                            height: 70,
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 70,
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              items[index]
                                                                  .imageUrl!))),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                SizedBox(
                                                  height: 70,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        items[index].title!,
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        // ignore: prefer_const_literals_to_create_immutables
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .visibility_outlined,
                                                            size: 15,
                                                            color: Color(
                                                                0xff333333),
                                                          ),
                                                          const SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            "${items[index].count} Dilihat",
                                                            style: GoogleFonts.inter(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Color(
                                                                    0xff333333)),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        }));
                                  }
                                  return const SkeletonAvatar();
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 50,
                              width: width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Color(0xff818181))),
                              child: Center(
                                child: Text(
                                  "Lihat Semua",
                                  style: GoogleFonts.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff818181)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        );
    Widget product() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 155,
              width: width,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 0, right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xff7C7C7C),
                        ),
                        isDense: true,
                        isCollapsed: true,
                        fillColor: Color(0xffF0F3F8),
                        filled: true,
                        hintText: "cari barang atau toko",
                        hintStyle: GoogleFonts.roboto(
                          fontSize: 13,
                          color: Color(0xff7C7C7C),
                          fontWeight: FontWeight.w400,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(7, 13, 4, 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(11),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              border: Border.all(color: Color(0xffC4C4C4))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/option_icon.svg',
                                height: 20,
                                width: 20,
                              ),
                              Text(
                                "Filter",
                                style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    color: Color(0xff70767F),
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              border: Border.all(color: Color(0xffC4C4C4))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Aktif",
                                style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    color: Color(0xff70767F),
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "(1500)",
                                style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    color: Color(0xff70767F),
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              border: Border.all(color: Color(0xffC4C4C4))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Nonaktif",
                                style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    color: Color(0xff70767F),
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "(500)",
                                style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    color: Color(0xff70767F),
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "2000 Produk",
                      style: GoogleFonts.roboto(
                          fontSize: 13,
                          color: Color(0xff3A3C42),
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: height * 0.59,
                child: BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is ProductSuccess) {
                      var items = state.value!.product;
                      return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: items!.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              children: [
                                Container(
                                  color: Color(0xffF0F0F0),
                                  height: 15,
                                  width: width,
                                ),
                                Container(
                                  height: 110,
                                  width: width,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        items[index].imageUrl!),
                                                    fit: BoxFit.cover)),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            height: 60,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      items[index].title!,
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Color(
                                                              0xff3A3C42)),
                                                    ),
                                                    Text(
                                                      NumberFormat.currency(
                                                              decimalDigits: 0,
                                                              symbol: "Rp")
                                                          .format(
                                                        int.tryParse(
                                                            items[index]
                                                                .price!),
                                                      ),
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                              0xff3A3C42)),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      height: 20,
                                                      child: Center(
                                                        child: Text(
                                                          "Stok : ${items[index].stok}",
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Color(
                                                                      0xff3A3C42)),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                      height: 20,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xffA0FFD2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Center(
                                                        child: Text(
                                                          "Aktif",
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontSize: 9,
                                                                  color: Color(
                                                                      0xff006D34)),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 40,
                                            width: width * 0.35,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xffC4C4C4)),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Ubah Harga",
                                                style: GoogleFonts.roboto(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 40,
                                            width: width * 0.35,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xffC4C4C4)),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Ubah Stok",
                                                style: GoogleFonts.roboto(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                          RotatedBox(
                                            quarterTurns: 1,
                                            child: Icon(Icons.keyboard_control),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }));
                    }
                    return const SkeletonAvatar();
                  },
                ),
              ),
            )
          ],
        );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Manado Exotic Island",
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: DecoratedBox(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Color(0xffD9D9D9)))),
            child: TabBar(
                labelStyle: GoogleFonts.inter(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                indicatorWeight: 0,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const MD2Indicator(
                    indicatorHeight: 5,
                    indicatorColor: Colors.black,
                    indicatorSize: MD2IndicatorSize.full),
                controller: _tabController,
                // ignore: prefer_const_literals_to_create_immutables
                tabs: [
                  Tab(
                    text: "Utama",
                  ),
                  Tab(
                    text: "Produk",
                  )
                ]),
          ),
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          utama(),
          product(),
        ],
      ),
    );
  }
}
