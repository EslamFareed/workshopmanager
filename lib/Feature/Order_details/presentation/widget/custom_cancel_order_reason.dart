import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workshopmanager/Core/func/validation.dart';
import 'package:workshopmanager/di.dart';
import '../../../../Core/constant/app_sized.dart';
import '../../../../Core/func/show_toast.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widget/custom_app_button.dart';
import '../../../../Core/widget/custom_app_text.dart';
import '../../../add_workshop/Presentation/widgets/custom_text_form_filed.dart';
import '../cubit/order_details_cubit.dart';

Future<void> cancellationReason({
  required BuildContext context,
  // Function()? onPressed,
  required int orderId,
}) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: BlocProvider(
            create: (context) => OrderDetailsCubit(getIt()),
            child: BlocConsumer<OrderDetailsCubit, OrderDetailsState>(
              listener: (context, state) {
                if (state is SuccessCancelOrderState) {
                  showSuccessToast(message: "Order Cancelled Successfully");
                  Navigator.pop(context);
                  Navigator.pop(context);
                  // context.push(Routes.workshopOrders);
                }
              },
              builder: (context, state) {
                final cubit = context.read<OrderDetailsCubit>();
                return Container(
                  height: heightSize(context) * 0.39,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Form(
                    key: cubit.formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const CustomAppText(text: "ما هى اسباب رفض الحجز"),
                          height(16),
                          CustomTextFormFiled(
                            controller: cubit.cancelController,
                            hint: "اضف تعليق...",
                            maxLines: 5,
                            validator: (val) {
                              return AppValidation.cancellationReason(
                                  cubit.cancelController.text);
                            },
                          ),
                          height(16),
                          CustomAppButton(
                            text: "ارسال",
                            radius: 24,
                            width: double.infinity,
                            onPressed: () {
                              cubit.cancelOrder(
                                  orderId, cubit.cancelController.text);
                            },
                            // onPressed: onPressed,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      });
}
