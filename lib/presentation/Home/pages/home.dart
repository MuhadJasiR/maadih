import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:madh/common/helper/is_dark_mode.dart';
import 'package:madh/core/colors/const_colors.dart';
import 'package:madh/core/size/const_size.dart';
import 'package:madh/presentation/Home/widgets/news_songs.dart';
import 'package:madh/presentation/Home/widgets/play_list.dart';
import 'package:madh/presentation/splash/widgets/main_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const MaadihLogo(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Column(
            children: [
              const CustomTopCard(),
              kHeight(25),
              TabBar(
                  indicatorColor: kPrimaryColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  labelColor: context.isDarkMode ? kWhiteColor : kBlackColor,
                  controller: tabController,
                  labelStyle: const TextStyle(fontSize: 15),
                  unselectedLabelColor: kGreyColor,
                  tabs: const [
                    Text("News"),
                    Text("Videos"),
                    Text("Artists"),
                    Text("Podcasts"),
                  ]),
              const NewsSongs(),
              kHeight(20),
              PlayList()
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTopCard extends StatelessWidget {
  const CustomTopCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset("assets/png/maadih card (1).png"),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Image.asset("assets/png/pngwing.com.png"))
        ],
      ),
    );
  }
}
