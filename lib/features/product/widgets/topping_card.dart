import 'package:flutter/material.dart';
import 'package:hungry_food_app/core/constants/app_colors.dart';

class ToppingCard extends StatefulWidget {
  final String title;
  final String imagePath;
  final ValueChanged<int>? onCountChanged;
  final double width;

  const ToppingCard({
    super.key,
    required this.title,
    required this.imagePath,
    this.onCountChanged,
    this.width = 95,
  });

  @override
  State<ToppingCard> createState() => _ToppingCardState();
}

class _ToppingCardState extends State<ToppingCard> {
  int count = 0;

  void _updateCount(int newCount) {
    setState(() => count = newCount.clamp(0, 99));
    widget.onCountChanged?.call(count);
  }

  Widget _actionButton({
    required IconData icon,
    required Color bg,
    required Color fg,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
        child: Icon(icon, color: fg, size: 14),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        elevation: 10,
        shadowColor: Colors.transparent, // يخفي الظل تماماً
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: widget.width,
          decoration: BoxDecoration(
            color: AppColors.backgroundCard,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // مساحة الصورة والطبقة الشفافة
              Container(
                height: 80,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: AppColors.selected,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(widget.imagePath, fit: BoxFit.contain),
                    ),
                    if (count > 0) ...[
                      Container(color: Colors.black.withValues(alpha: 0.45)),
                      Positioned(
                        top: 6,
                        right: 6,

                        child: _actionButton(
                          icon: Icons.remove,
                          bg: Colors.white,
                          fg: Colors.black87,
                          onTap: () => _updateCount(count - 1),
                        ),
                      ),
                      Positioned(
                        top: 6,
                        left: 6,

                        child: _actionButton(
                          icon: Icons.close,
                          bg: const Color(0xFFE53935),
                          fg: Colors.white,
                          onTap: () => _updateCount(0),
                        ),
                      ),
                      Text(
                        '$count',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              // الشريط السفلي (العنوان وزر الإضافة)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 7.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _updateCount(count + 1),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE53935),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
