import 'package:whatsapp_ui_clone/chatItemTemplate.dart';
import 'package:faker/faker.dart';

class ChatHelper {
  static var chatList = [
    ChatItemModel(faker.person.firstName(), "See you in the evening!", "3.10 PM", "https://placehold.it/64x64?text=AG"),
    ChatItemModel(faker.person.firstName(), "Cool!", "10.16 AM", "http://loremflickr.com/red/64/64/profile"),
    ChatItemModel(faker.person.firstName(), "Meet this weekend?", "Yesterday", "http://loremflickr.com/blue/64/64/face"),
    ChatItemModel(faker.person.name(), "Gotcha!", "1/23/19", "http://loremflickr.com/red/64/64/smile"),
    ChatItemModel(faker.person.lastName(), "I might join you too!", "1/22/19", "http://pipsum.com/64x64.jpg"),
    ChatItemModel(faker.person.firstName(), "Hi John", "1/22/19", "http://loremflickr.com/red/64/64/sea"),
    ChatItemModel(faker.person.firstName(), "I'm fine.", "1/21/19", "http://loremflickr.com/red/64/64/walk"),
    ChatItemModel(faker.person.firstName(), faker.food.dish(), "1/20/19", "http://loremflickr.com/red/64/64/run"),
  ];

  static getItem(position) {
    return chatList[position];
  }

  static var itemCount = chatList.length;
}