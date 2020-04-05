import 'dart:html' as html;

class LinkerService {
  LinkerService();

  Future<void> openLink(String url) async {
    html.window.open(url, '_blank');
  }
}
