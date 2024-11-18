import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruit_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruit_hub_dashboard/core/widgets/custom_check_box.dart';

class IsFeatured extends StatefulWidget {
  const IsFeatured({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<bool> onChanged;

  @override
  State<IsFeatured> createState() => _IsFeaturedState();
}

class _IsFeaturedState extends State<IsFeatured> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.textFormFieldColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xffE6E9EA),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Is Featured Product?',
                  style: TextStyles.bold13.copyWith(
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(width: 16),
          CustomCheckBox(
            isChecked: isTermsAccepted,
            onChecked: (value) {
              isTermsAccepted = value;
              widget.onChanged(value);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
