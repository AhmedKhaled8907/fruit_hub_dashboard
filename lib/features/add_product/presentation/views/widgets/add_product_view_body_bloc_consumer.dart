import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/build_bar.dart';
import '../../../../../core/widgets/custom_loading_hud.dart';
import '../../cubits/cubit/add_product_cubit.dart';
import 'add_product_view_body.dart';

class AddProductViewBodyBlocConsumer extends StatelessWidget {
  const AddProductViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          buildBar(context, 'Product added successfully');
        }
        if (state is AddProductFailure) {
          buildBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomLoadingHud(
          isLoading: state is AddProductLoading,
          child: const AddProductViewBody(),
        );
      },
    );
  }
}
