import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hps/features/core/controllers/home_stats_ratings_controller.dart';

class CrimeIncidents extends StatelessWidget {
  final HomeStatsRatingController homeStatsRatingController = Get.find();

  CrimeIncidents({super.key}) {
    crimeIncidentsInit();
  }

  Future<void> crimeIncidentsInit() async {
    debugPrint(
      "homeStatsRatingController.crimeClusterId.value: ${homeStatsRatingController.crimeClusterId.value}",
    );
    if (homeStatsRatingController.crimeClusterId.value != -2) {
      await homeStatsRatingController.crimeIncidentsMarker();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Coming Soon")));
  }
}
/*
Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 15, 69, 79),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Crime Incidents",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            // --Header
            Row(
              children: [
                /// Circular Score
                StatsHeaderCircularScore(
                    homeStatsRatingRate: homeStatsRatingController.crimeRate),

                /// Current Address and Button
                StatsHeaderCurrentAddressAndButton(
                  homeStatsRatingController: homeStatsRatingController,
                  buttonText: "Add SOS",
                  onPressed: () => Get.off(() => const SOSScreen(),
                      duration: Durations.extralong1,
                      curve: Curves.easeInOutCubicEmphasized),
                )
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            // --Marker Post List
            Obx(
              () => StatsPostList(
                  homeStatsRatingList:
                      homeStatsRatingController.crimeMarkerMapList),
            )
          ],
        ),
      ),
    );

*/
