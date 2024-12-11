import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/utils/app_imgaes.dart';
import '../../../../Core/widget/custom_app_text.dart';

class CustomSuggestedContainerButton extends StatelessWidget {
  const CustomSuggestedContainerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthSize(context) * 0.3,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary),
      ),
      child: Row(
        children: [
          const Flexible(
            child: FittedBox(
              child: CustomAppText(
                text: " اضافة خدمة",
                color: AppColors.primary,
              ),
            ),
          ),
          width(16),
          SvgPicture.asset(AppImages.add),
        ],
      ),
    );
  }
}
