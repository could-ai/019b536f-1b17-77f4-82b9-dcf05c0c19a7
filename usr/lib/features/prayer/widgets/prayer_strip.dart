import 'package:flutter/material.dart';
import 'package:couldai_user_app/core/data/mock_data.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PrayerStrip extends StatelessWidget {
  const PrayerStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: MockData.prayerTimes.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final prayer = MockData.prayerTimes[index];
          return _PrayerCard(prayer: prayer);
        },
      ),
    );
  }
}

class _PrayerCard extends StatelessWidget {
  final PrayerTime prayer;

  const _PrayerCard({required this.prayer});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isNext = prayer.isNext;

    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isNext ? theme.colorScheme.primary : theme.cardTheme.color,
        borderRadius: BorderRadius.circular(16),
        border: isNext ? null : Border.all(color: theme.dividerColor.withOpacity(0.1)),
        boxShadow: isNext
            ? [
                BoxShadow(
                  color: theme.colorScheme.primary.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
              ]
            : [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _getIconForPrayer(prayer.name),
            size: 20,
            color: isNext ? theme.colorScheme.onPrimary : theme.colorScheme.secondary,
          ),
          const SizedBox(height: 8),
          Text(
            prayer.name,
            style: theme.textTheme.labelMedium?.copyWith(
              color: isNext ? theme.colorScheme.onPrimary : theme.textTheme.bodyMedium?.color,
              fontWeight: isNext ? FontWeight.bold : FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            prayer.time,
            style: theme.textTheme.labelSmall?.copyWith(
              color: isNext ? theme.colorScheme.onPrimary.withOpacity(0.8) : theme.textTheme.bodySmall?.color,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForPrayer(String name) {
    switch (name.toLowerCase()) {
      case 'fajr':
        return LucideIcons.sunrise;
      case 'dhuhr':
        return LucideIcons.sun;
      case 'asr':
        return LucideIcons.cloudSun;
      case 'maghrib':
        return LucideIcons.sunset;
      case 'isha':
        return LucideIcons.moon;
      default:
        return LucideIcons.clock;
    }
  }
}
