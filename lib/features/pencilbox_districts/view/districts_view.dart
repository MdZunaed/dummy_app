import 'package:dummy_app/common/widgets/back_button.dart';
import 'package:dummy_app/features/pencilbox_districts/view_model/district_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DistrictsView extends StatefulWidget {
  const DistrictsView({super.key});

  @override
  State<DistrictsView> createState() => _DistrictsViewState();
}

class _DistrictsViewState extends State<DistrictsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Provider.of<DistrictViewModel>(context, listen: false).districts.isEmpty) {
        Provider.of<DistrictViewModel>(context, listen: false).getDistricts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DistrictViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("Districts"), leading: AppBarBackButton()),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            provider.loading
                ? const CircularProgressIndicator()
                : ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: provider.districts.length,
                    itemBuilder: (context, index) {
                      final district = provider.districts[index];
                      return DropdownButtonHideUnderline(
                        child: DropdownMenuItem(child: Text(district.name ?? "data")),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
