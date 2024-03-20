// app model
class App {
  // apps data
  int? id;
  String text;
  int icon;
  bool individual;

  // apps theming
  int bgColour;
  int mnColour;
  int txtColour;

  App({
    // apps data
    this.id,
    required this.text,
    required this.icon,
    required this.individual,

    // apps theming
    required this.bgColour,
    required this.mnColour,
    required this.txtColour,
  });
}
