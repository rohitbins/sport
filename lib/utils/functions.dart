String hexColor(String _colorhexcode) =>
    '0xff$_colorhexcode'.replaceAll('#', '');

List<String> playDuration(String duration) {
  duration = duration.replaceAll('hr', '').replaceAll('min', '');
  if (duration.isEmpty) {
    return ['00', '00'];
  }
  List<String> value = duration.split(' ');
  value = value.map((e) => e.length == 1 ? '0${e}' : e).toList();
  return value;
}
