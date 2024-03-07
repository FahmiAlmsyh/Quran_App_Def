import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/components/tab_item.dart';
import 'package:quran_app/pages/tabs/doa_tab.dart';
import 'package:quran_app/pages/tabs/dzikir_tab.dart';
import 'package:quran_app/pages/tabs/surah_tab.dart';
import 'package:quran_app/theme.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      body: _body(),
    );
  }
}

AppBar _appBar() => AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          onPressed: () {}, icon: SvgPicture.asset('assets/svg/menu_icon.svg')),
      title: Text(
        "Quran App",
        style: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.w600, color: primary),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/svg/search_icon.svg'))
      ],
    );

Column _salam() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        Text(
          'Assalamualaikum',
          style: GoogleFonts.poppins(
              fontSize: 12, fontWeight: FontWeight.w600, color: secondary),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          "Fahm",
          style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            Container(
              height: 131,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xffdf98fa), Color(0xff9055ff)]),
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: SvgPicture.asset('assets/svg/quran_banner.svg')),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/svg/book.svg'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Last Read",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Ibrahim",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  Text(
                    "Ayah no: 35",
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );

BottomNavigationBarItem _bottomNavigationBarItem(
        {required String icon, required String label}) =>
    BottomNavigationBarItem(
        icon: SvgPicture.asset(
          icon,
          color: secondary,
        ),
        activeIcon: SvgPicture.asset(
          icon,
          color: primary,
        ),
        label: label);

BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: [
        _bottomNavigationBarItem(
          icon: 'assets/svg/quran_icon.svg',
          label: 'Quran',
        ),
        _bottomNavigationBarItem(
          icon: 'assets/svg/doa_icon.svg',
          label: 'Doa',
        ),
        _bottomNavigationBarItem(
          icon: 'assets/svg/bookmark_icon.svg',
          label: 'Bookmark',
        )
      ],
    );

DefaultTabController _body() => DefaultTabController(
    length: 3,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
                    SliverToBoxAdapter(
                      child: _salam(),
                    ),
                    SliverAppBar(
                      pinned: true,
                      elevation: 0,
                      automaticallyImplyLeading: false,
                      shape: Border(
                          bottom: BorderSide(
                              width: 3, color: Colors.grey.withOpacity(0.1))),
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(0),
                        child: TabBar(
                            labelColor: primary,
                            indicatorColor: primary,
                            indicatorWeight: 3,
                            tabs: [
                              itemtab(label: "Surah"),
                              itemtab(label: "Dzikir"),
                              itemtab(label: "Doa"),
                            ]),
                      ),
                    ),
                  ],
          body: const TabBarView(
            children: [TabSurah(), TabDzikir(), TabDoa()],
          )),
    ));
