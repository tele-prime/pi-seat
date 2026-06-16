import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:pichair/app/routes/app_routes.dart';
import 'package:pichair/app/service/sss_global.dart';
import 'package:pichair/app/theme/color_theme.dart';
import 'package:pichair/presentation/entertainment_page/pages/movie_page/controller/movie_page_controller.dart';
import 'package:pichair/presentation/entertainment_page/pages/movie_page/widgets/movie_page_appbar.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<MoviePageController>(
      builder: (controller) => NeumorphicTheme(
        themeMode: currentThemeMode.value,
        darkTheme: NeumorphicThemeData.dark(
          shadowLightColor: SssColor.grey.withAlpha(140),
        ),
        child: Scaffold(
          body: Stack(children: [
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: controller.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : !controller.isUsbFound
                  ? const Center(child: Text('No USB drive detected'))
                  : controller.movies.isEmpty
                  ? const Center(child: Text('No movies found on USB'))
                  : GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: controller.movies.length,
                itemBuilder: (context, index) {
                  final file = controller.movies[index];
                  final fileName = file.path.split('/').last;
                  final movieName = fileName.replaceAll('.${fileName.split('.').last}', '') ;
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        AppRoutes.entertainmentMoviePlayer,
                        arguments: file.path,
                      );
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                              ),
                              child: const Icon(
                                Icons.movie_creation_outlined,
                                size: 48,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              movieName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            MoviePageAppbar(),
          ]),
        ),
      ),
    );
  }
}
