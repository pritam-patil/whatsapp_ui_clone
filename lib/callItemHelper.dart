import 'package:whatsapp_ui_clone/callItemTemplate.dart';
import 'package:faker/faker.dart';

class CallHelper {
  static var callList = [
    CallItemModel(faker.person.name(), "Today, 10.13 PM", "http://loremflickr.com/64/64/smile", "incoming"),
    CallItemModel(faker.person.name(), "Yesterday, 8.07 AM", "http://loremflickr.com/64/64/user", "outgoing"),
    CallItemModel(faker.person.name(), "1/22/19, 8.36 PM", "http://loremflickr.com/64/64/profile", "outgoing"),
    CallItemModel(faker.person.name(), "1/21/19, 8.11 PM", "http://loremflickr.com/64/64/john", "outgoing"),
    CallItemModel(faker.person.name(), "1/20/19 6.16 PM", "http://loremflickr.com/64/64/doe", "outgoing"),
    CallItemModel(faker.person.name(), "1/19/19, 12.27 PM", "http://loremflickr.com/64/64/face", "missed"),
    CallItemModel(faker.person.name(), "1/19/19, 11.55 AM", "http://pipsum.com/64x64.jpg", "outgoing"),
  ];

  static CallItemModel getItem (position) {
    return callList[position];
  }

  static var itemCount = callList.length;
}