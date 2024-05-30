import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class UserCache {
  static final UserCache _instance = UserCache._internal();

  UserCache._internal();

  factory UserCache() {
    return _instance;
  }

  static final Map<int, Map<String, dynamic>> _cache = {};

  Map<String, dynamic>? getUserById(int id) {
    if (_cache.containsKey(id)) {
      return _cache[id];
    } else {
      var user = {
        "id": id,
        "first_name": faker.person.firstName(),
        "last_name": faker.person.lastName(),
        "about": faker.lorem.sentence(),
        "image": faker.image.image(random: true),
        "email": faker.internet.email(),
      };

      _cache[id] = user;

      return user;
    }
  }
}

class QuestionTwoListView extends StatelessWidget {
  const QuestionTwoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: buildUserList([0, 1, 2, 3], UserCache())));
  }
}

Widget buildUserList(List<int> userIds, UserCache userCache) {
  return ListView.builder(
    itemCount: userIds.length,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        title: Text('User ${userIds[index]}'),
        onTap: () {
          var user = userCache.getUserById(userIds[index]);
          if (user != null) {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.network(user['image']),
                    Text('${user['first_name']} ${user['last_name']}'),
                    Text(user['email']),
                    Text(user['about']),
                  ],
                );
              },
            );
          }
        },
      );
    },
  );
}
