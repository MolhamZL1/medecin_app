import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rosemary/constants.dart';

class CustomLanguageListTile extends StatelessWidget {
  const CustomLanguageListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        customDialog(context);
      },
      leading: const Icon(Icons.language),
      title: const Text(
        "Language",
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
                  child: const Text("Close"),
                )
              ],
              title: const Text("Language"),
              contentPadding: const EdgeInsets.all(20),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () async {},
                    child: Text("Arabic", style: TextStyle(color: kColor)),
                  ),
                  TextButton(
                      onPressed: () async {},
                      child: Text(
                        "English",
                        style: TextStyle(color: kColor),
                      ))
                ],
              ),
            ));
  }
}
