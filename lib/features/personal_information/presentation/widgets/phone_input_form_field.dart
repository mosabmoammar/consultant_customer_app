import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_spacing.dart';
import '../../../../core/utils/extensions.dart';
import '../../../auth/domain/onboarding/entities/country_entity.dart';
import '../../../auth/presentation/onboarding/providers/onboarding_providers.dart';

class PhoneInputFormField extends ConsumerWidget {
  const PhoneInputFormField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text('Phone Number', style: context.textTheme.titleMedium),
        const SizedBox(height: AppSpacing.s4),
        Container(
          height: AppSpacing.s44,
          decoration: BoxDecoration(
            color: AppColors.lightGray2,
            borderRadius: BorderRadius.circular(AppSpacing.s4),
          ),
          child: Row(
            children: [
              _DialCodeButton(onTap: () => _showCountryPicker(context, ref)),
              Container(
                width: 1,
                height: AppSpacing.s16,
                color: AppColors.gray,
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) => ref
                      .read(onboardingProvider.notifier)
                      .setPhoneNumber(value),
                  style: context.textTheme.labelSmall,
                  decoration: InputDecoration(
                    hintText: '1234567890',
                    hintStyle: context.textTheme.labelSmall?.copyWith(
                      color: AppColors.gray,
                    ),
                    fillColor: AppColors.lightGray2,
                    filled: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showCountryPicker(BuildContext context, WidgetRef ref) {
    ref
        .read(countriesProvider)
        .whenData(
          (value) => value.fold(
            (failure) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(failure.message),
                backgroundColor: context.colorScheme.error,
                behavior: SnackBarBehavior.floating,
              ),
            ),
            (countries) => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (_) => _CountryPickerSheet(
                countries: countries,
                onSelected: (country) {
                  ref
                      .read(onboardingProvider.notifier)
                      .selectedCountry(country);
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        );
  }
}

// Country picker bottom sheet
class _CountryPickerSheet extends StatefulWidget {
  final List<CountryEntity> countries;
  final ValueChanged<CountryEntity> onSelected;

  const _CountryPickerSheet({
    required this.countries,
    required this.onSelected,
  });

  @override
  State<_CountryPickerSheet> createState() => __CountryPickerSheetState();
}

class __CountryPickerSheetState extends State<_CountryPickerSheet> {
  late List<CountryEntity> _filtered;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filtered = widget.countries;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filter(String query) {
    setState(() {
      _filtered = query.isEmpty
          ? widget.countries
          : widget.countries
                .where(
                  (country) =>
                      country.name.toLowerCase().contains(
                        query.toLowerCase(),
                      ) ||
                      country.dialCode.contains(query),
                )
                .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.75,
      maxChildSize: 0.92,
      builder: (context, scrollController) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: [
            const SizedBox(height: 12.0),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(AppSpacing.s2),
              ),
            ),
            const SizedBox(height: AppSpacing.s16),
            TextField(
              controller: _searchController,
              onChanged: _filter,
              style: context.textTheme.labelSmall,
              decoration: InputDecoration(
                hintText: 'Search country or dial code',
                hintStyle: context.textTheme.labelSmall?.copyWith(
                  color: AppColors.gray,
                ),
                prefixIcon: const Icon(Icons.search, size: 20),
                filled: true,
                fillColor: AppColors.textFieldColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
            const SizedBox(height: AppSpacing.s8),
            Expanded(
              child: ListView.separated(
                controller: scrollController,
                itemBuilder: (context, index) {
                  final country = _filtered[index];

                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 2,
                    ),
                    leading: Text(
                      country.flag,
                      style: const TextStyle(fontSize: AppSpacing.s16),
                    ),
                    title: Text(country.name),
                    trailing: Text(
                      country.dialCode,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () => widget.onSelected(country),
                  );
                },
                separatorBuilder: (context, index) =>
                    Divider(height: 1, color: Colors.grey.shade100),
                itemCount: _filtered.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dial code button
class _DialCodeButton extends ConsumerWidget {
  final VoidCallback onTap;
  const _DialCodeButton({required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final country = ref.watch(
      onboardingProvider.select((value) => value.selectedCountry),
    );

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              country?.dialCode ?? '+91',
              style: context.textTheme.labelLarge,
            ),
            const SizedBox(width: 2),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: AppSpacing.s16,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
