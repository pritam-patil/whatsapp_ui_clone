import 'package:whatsapp_ui_clone/statusItemTemplate.dart';
import 'package:faker/faker.dart';

class StatusHelper {
  static var statusList = [
    StatusItemModel(faker.person.name(), "17 minutes ago", "http://loremflickr.com/200/200/nature"),
    StatusItemModel(faker.person.name(), "25 minutes ago", "http://loremflickr.com/200/200/animal"),
    StatusItemModel(faker.person.name(), "Today 10.13 AM", "http://loremflickr.com/200/200/world"),
    StatusItemModel(faker.person.name(), "Today 8.13 AM", "http://loremflickr.com/200/200/random"),
    StatusItemModel(faker.person.name(), "Today 7.53 AM", "http://loremflickr.com/200/200/bird"),
    StatusItemModel(faker.person.name(), "Today 2.10 AM", "http://loremflickr.com/200/200/magic"),
  ];

  static StatusItemModel getItem(position) {
    return statusList[position];
  }

  static var itemCount = statusList.length;
}