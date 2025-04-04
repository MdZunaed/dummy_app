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
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            provider.loading
                ? const CircularProgressIndicator()
                : ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: provider.districts.length,
                    separatorBuilder: (c, i) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final district = provider.districts[index];
                      return ExpansionTile(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        collapsedBackgroundColor: Theme.of(context).primaryColor.withAlpha(50),
                        childrenPadding: EdgeInsets.all(5),
                        title: Text(district.name ?? "dfkjd"),
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        expandedAlignment: Alignment.centerLeft,
                        children: [
                          Text("Bangla Name: ${district.bnName ?? "Not Found"}"),
                          Text("Division: ${district.divisionId ?? "Not Found"}"),
                          Text("Latitude: ${district.lat ?? "Not Found"}"),
                          Text("Longitude: ${district.lon ?? "Not Found"}"),
                        ],
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
