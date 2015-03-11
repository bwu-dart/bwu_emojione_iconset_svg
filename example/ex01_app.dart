library bwu_fontawesome_iconset_svg.example.example01;

import 'dart:html' as dom;
import 'dart:js' as js;
import 'package:polymer/polymer.dart';

@CustomTag('ex01-app')
class Ex03App extends PolymerElement {
  Ex03App.created() : super.created();

  Map iconNames = toObservable({});
  List categories = toObservable([
  ]); //['emoticons', 'dingbats', 'transport_and_map', 'enclosed_characters', 'uncategorized'];
  Map prefixes = toObservable({});

  String getPrefix(String category) {
    return prefixes[category];
  }

  List<String> getIconNames(String category) {
    return iconNames[category];
  }

  attached() {
    super.attached();

    shadowRoot.querySelectorAll('[is-iconset]').forEach((dom.Element iconset) {
      String category = iconset.id;
      categories.add(category);
      String prefix = iconset.shadowRoot.querySelector('core-iconset-svg').id;
      prefixes[category] = prefix;
      List<dom.Element> icons = iconset.shadowRoot
          .querySelector('core-iconset-svg > svg')
          .querySelectorAll('defs > g[id]');
      var tmp = icons.map((i) => '${prefix}:${i.id}').toList()..sort();
      iconNames[category] = tmp;
    });
  }
}
