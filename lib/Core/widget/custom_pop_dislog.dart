import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/utils/app_colors.dart';
import 'package:workshopmanager/Core/widget/custom_container_button.dart';

popupDropDownDialogs(
    {required BuildContext context,
    void Function(String)? onChanged,
    void Function(String?)? onSubmitted,
    required List<Widget> children,
    String? hintText,
    String? value,
    required TextEditingController controller}) {
  showDialog(
    context: context,
    builder: ((context) {
      return (Dialog(
        child: Container(
          height: MediaQuery.sizeOf(context).height * .5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: AppColors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16)),
                    color: AppColors.primary,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    onChanged: onChanged,
                    onFieldSubmitted: onSubmitted,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: AppColors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: AppColors.white)),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.white,
                      ),
                      fillColor: AppColors.primary,
                      hintText: hintText,
                      //    hintStyle: getTextTheme(kOnPrimary).displaySmall,
                    ),
                  )),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: children,
                    ),
                  ),
                ),
              ),
              CustomContainerButton(
                text: "استمرار",
                onPressed: () {
                  context.pop();
                },
              )
            ],
          ),
        ),
      ));
    }),
  );
}
