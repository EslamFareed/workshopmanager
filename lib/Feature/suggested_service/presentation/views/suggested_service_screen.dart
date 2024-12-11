import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workshopmanager/Core/constant/app_sized.dart';
import 'package:workshopmanager/Core/func/show_toast.dart';
import 'package:workshopmanager/Feature/suggested_service/presentation/cubit/suggested_service_cubit.dart';
import 'package:workshopmanager/Feature/suggested_service/presentation/widget/custom_service_list_view_ody.dart';
import 'package:workshopmanager/Feature/suggested_service/presentation/widget/custom_suggested_container_button.dart';
import 'package:workshopmanager/di.dart';
import '../../../../Core/widget/custom_container_button.dart';
import '../../../../Core/widget/custom_drop_down_container.dart';
import '../../../../Core/widget/custom_loader_widget.dart';
import '../widget/custom_conatiner_title.dart';

class SuggestedServiceScreen extends StatefulWidget {
  final int id;
  final int orderId;
  const SuggestedServiceScreen(
      {super.key, required this.id, required this.orderId});

  @override
  State<SuggestedServiceScreen> createState() => _SuggestedServiceScreenState();
}

class _SuggestedServiceScreenState extends State<SuggestedServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SuggestedServiceCubit(getIt())..service(widget.id.toString()),
      child: BlocConsumer<SuggestedServiceCubit, SuggestedServiceState>(
        listener: (context, state) {
          if (state is SuggestedSuccessState) {
            showToast(message: "Added successfully");
            context.pop();
          } else if (state is SuggestedFailureState) {
            showToast(message: state.errorMessage);
          }
        },
        builder: (context, state) {
          final cubit = context.read<SuggestedServiceCubit>();

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 34),
              child: Column(
                children: [
                  const CustomConatinerTitle(),
                  height(16),
                  state is SuggestedServiceSuccessState
                      ? Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomSuggestedContainerButton(),
                                height(16),
                                const CustomDropDownContainer(
                                  hint: "اختار الخدمات",
                                ),
                                Expanded(
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        height(2),
                                    itemCount: state.service.length,
                                    itemBuilder: (context, index) {
                                      return CustomServiceListViewOdy(
                                        isChecked: cubit.selectedServices
                                            .contains(state.service[index]),
                                        onChanged: (value) {
                                          setState(() {
                                            cubit.toggleServiceSelection(
                                                state.service[index]);
                                          });
                                        },
                                        serviceName: state
                                            .service[index].service!.arName!,
                                        price: state.service[index].price!
                                            .toString(),
                                      );
                                    },
                                  ),
                                ),
                                CustomContainerButton(
                                  text: "تحديث حالة الطلب",
                                  onPressed: () {
                                    cubit.suggestedService(
                                      brandList: cubit.selectedServices
                                          .map((e) => e.service!.id.toString())
                                          .toList(),
                                      id: widget.orderId.toString(),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      : const Center(
                          child: CustomLoaderWidget(),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
