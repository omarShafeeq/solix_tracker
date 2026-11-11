import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class DetailRow {
  const DetailRow(this.label, this.value);

  final String label;
  final String value;
}

class DetailSection extends StatelessWidget {
  const DetailSection({
    super.key,
    required this.title,
    required this.icon,
    required this.rows,
    this.initiallyExpanded = true,
  });

  final String title;
  final IconData icon;
  final List<DetailRow> rows;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          leading: Icon(icon, color: AppColors.accent),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: AppColors.primary,
            ),
          ),
          children: [
            for (final row in rows)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 148,
                      child: Text(
                        row.label,
                        style: const TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        row.value,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.text,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
