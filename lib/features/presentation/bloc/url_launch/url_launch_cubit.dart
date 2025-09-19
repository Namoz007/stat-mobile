import 'package:stat_edu_mobile/sources.dart';
part 'url_launch_state.dart';

class UrlLaunchCubit extends Cubit<UrlLaunchState> {
  UrlLaunchCubit() : super(UrlLaunchState(error: null));

  void launchUrl(String url) async {
    try {
      final UrlLauncherPlatform launcher = UrlLauncherPlatform.instance;
      if (await launcher.canLaunch(url)) {
        await launcher.launch(
          url,
          useSafariVC: true,
          useWebView: true,
          enableJavaScript: true,
          enableDomStorage: true,
          universalLinksOnly: true,
          headers: <String, String>{'my_header_key': 'my_header_value'},
        );
      } else {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      emit(
        UrlLaunchState(error: Failure(message: "Sorry,something went wron!")),
      );
      emit(UrlLaunchState(error: null));
    }
  }
}
