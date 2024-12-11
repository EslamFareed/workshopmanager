import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/app/routes.dart';

import '../../../../Core/constant/tile_svgs.dart';
import '../../../../Core/constant/tile_titles.dart';
import '../../../../Core/utils/app_imgaes.dart';
import '../../../settings/presentation/widget/custom_list_tile_body.dart';

class CustomHomeDrawer extends StatelessWidget {
  const CustomHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Image.asset(
              AppImages.shahm,
              height: 150,
              width: 150,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: title.length,
                itemBuilder: (context, index) {
                  return CustomListTileBody(
                    leading: icons[index],
                    text: title[index],
                    onTap: () {
                      switch (index) {
                        case 0:
                          context.push(Routes.manageProfile);
                          break;
                        case 1:
                          context.push(Routes.addWorkshopManagers);
                          break;
                        case 2:
                          context.push(Routes.managersAccount);
                          break;
                        case 3:
                          context.push(Routes.manageWorkshops);
                          break;
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
