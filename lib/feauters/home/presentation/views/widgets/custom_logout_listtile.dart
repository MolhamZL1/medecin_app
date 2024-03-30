import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rosemary/constants.dart';
import 'package:rosemary/core/shared/shared.dart';
import 'package:rosemary/core/utils/go_route.dart';

class CustomLogoutListTile extends StatelessWidget {
  const CustomLogoutListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        customDialog(context);
      },
      leading: const Icon(Icons.logout),
      title: const Text(
        "Logout",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }

  Future<dynamic> customDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
            onPressed: () => GoRouter.of(context).pop(),
            child: Row(
              children: [
                TextButton(
                  onPressed: () => GoRouter.of(context).pop(),
                  child: const Text("No"),
                ),
                TextButton(
                  onPressed: () async {
                    await CacheNetwork.deleteCacheItem(key: "token");
                    GoRouter.of(context).pushReplacement(Routes.kLoginView);
                  },
                  child: const Text("Yes"),
                ),
              ],
            ),
          )
        ],
        title: const Text(
          "Logout",
          style: TextStyle(),
        ),
        contentPadding: const EdgeInsets.all(20),
        content: Text(
          "Are you sure",
          style: TextStyle(color: kColor),
        ),
      ),
    );
  }
}
