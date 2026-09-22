import 'package:flutter/material.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';

class SpicySlider extends StatefulWidget {
  final double initialValue;
  final ValueChanged<double>? onChanged;

  const SpicySlider({super.key, this.initialValue = 0, this.onChanged});

  @override
  State<SpicySlider> createState() => _SpicySliderState();
}

class _SpicySliderState extends State<SpicySlider> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // عنوان Spicy
        const Text(
          'Spicy',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D2727),
          ),
        ),
        const SizedBox(height: 8),

        // شريط السلايدر بتخصيص الحجم والشكل
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 10.0,

            activeTrackColor: AppColors.primary,
            inactiveTrackColor: AppColors.unselected,
            thumbColor: AppColors.primary,
            overlayColor: Colors.black.withAlpha(20),
            //
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 22),
            trackShape: const RoundedRectSliderTrackShape(),
          ),
          child: Slider(
            min: 0,
            max: 10,
            divisions: 10,
            value: _currentValue,
            onChanged: (value) {
              setState(() => _currentValue = value);
              widget.onChanged?.call(value);
            },
          ),
        ),

        // الإيموجي أسفل السلايدر
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('🥶', style: TextStyle(fontSize: 22)),
              Text(
                '${_currentValue.toInt()} ',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const Text('🌶️', style: TextStyle(fontSize: 22)),
            ],
          ),
        ),
      ],
    );
  }
}
