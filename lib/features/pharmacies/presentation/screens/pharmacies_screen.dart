import 'package:flutter/material.dart';
import 'package:shefaa/core/theme/colors.dart';
import 'package:shefaa/core/theme/text_styles.dart';
import 'package:shefaa/core/utils/constants/constants.dart';
import 'package:shefaa/core/utils/constants/spacing.dart';
import 'package:shefaa/features/pharmacies/presentation/widgets/pharmacy_card_widget.dart';
import 'package:shefaa/features/pharmacies/presentation/widgets/pharmacy_filter_chips_widget.dart';
import 'package:shefaa/features/pharmacies/presentation/widgets/pharmacy_search_bar_widget.dart';

class PharmaciesScreen extends StatefulWidget {
  const PharmaciesScreen({super.key});

  @override
  State<PharmaciesScreen> createState() => _PharmaciesScreenState();
}

class _PharmaciesScreenState extends State<PharmaciesScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.surfacePrimary.withValues(alpha: 0.98),
      appBar: AppBar(
        title: Text(
          appTranslation().get('nearby_pharmacies'),
          style: TextStylesManager.bold18.copyWith(color: ColorsManager.primaryAction),
        ),
        centerTitle: true,
        backgroundColor: ColorsManager.surfacePrimary,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.tune, color: ColorsManager.textPrimary),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward, color: ColorsManager.primaryAction),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            verticalSpace16,
            PharmacySearchBarWidget(controller: _searchController),
            verticalSpace16,
            const PharmacyFilterChipsWidget(),
            verticalSpace16,
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                separatorBuilder: (context, index) => verticalSpace16,
                itemBuilder: (context, index) => const PharmacyCardWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
