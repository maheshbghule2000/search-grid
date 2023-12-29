// lib/screens/grid/grid_view.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/text_widget.dart';
import 'grid_view_model.dart'; // Import your view model

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GridViewModel>.reactive(
      viewModelBuilder: () => GridViewModel(),
      onViewModelReady: (model) async {},
      builder: (context, model, child) => Scaffold(
          appBar: CustomAppBar(
              title: 'Search Words',
              titleColor: kcWhiteColor,
              headingStyle: const TextStyle(color: kScaffoldBackgroundColor),
              backgroundColor: kPrimaryColor,
              actions: <Widget>[
                ActionBarMenuItem(
                  key: const ValueKey("Clear"),
                  child: IconButton(
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 26,
                    ),
                    onPressed: () => model.clear(),
                  ),
                )
              ]),
          // backgroundColor: Colors.white,
          body: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (context, value) {
              return [
                SliverToBoxAdapter(
                  child: Container(
                    padding: mPagePadding,
                    color: Colors.white,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: model.mController,
                          label: "Enter Number",
                          keyboardType: TextInputType.number,
                          hintText: 'Enter value (Numbers only)',
                          onSubmitted: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a value';
                            }
                            return null;
                          },
                          additionalInputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                        xsHeightSpan,
                        CustomTextFormField(
                          controller: model.nController,
                          label: "Enter Number ",
                          hintText: 'Enter  value(Numbers only)',
                          keyboardType: TextInputType.number,
                          additionalInputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a value';
                            }
                            return null;
                          },
                          onChange: (value) {
                            model.createGrid();
                          },
                          onSubmitted: (value) {
                            // model.createGrid();
                          },
                        ),
                          xsHeightSpan,
                        CustomTextFormField(
                          controller: model.entervaluesController,
                          label: "Enter Alphabet",
                          onSubmitted: (value) {
                            model.setAlphabet(value.toUpperCase());
                          },
                        ),
                          xsHeightSpan,
                        CustomTextFormField(
                          controller: model.searchController,
                          label: "Search Alphabet",
                          onChange: (value) {
                            model.search();
                          },
                          onSubmitted: (value) {
                            // model.search();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: Container(
              color: kScaffoldBackgroundColor,
              child: Padding(
                padding:slPagePadding,
                child: model.grid.isEmpty
                    ? Center(
                        child: TextWidget(
                        data: 'Grid is empty , Create a grid to display.',
                        fontSize: 16,
                        color: kPrimaryLightTextColor,
                      ))
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: model.grid.isEmpty
                              ? 1
                              : model.grid[0].isNotEmpty
                                  ? model.grid[0].length
                                  : 1,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: model.grid.length *
                            (model.grid.isEmpty ? 1 : model.grid[0].length),
                        itemBuilder: (context, index) {
                          int row = index ~/
                              (model.grid.isEmpty ? 1 : model.grid[0].length);
                          int col = index %
                              (model.grid.isEmpty ? 1 : model.grid[0].length);
                          return GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: getBoxShadow(context, kPrimaryColor),
                                  color: model.highlighted[row][col]
                                      ? kBorderOrangeColor
                                      : kPrimaryColor,
                                ),
                                child: Center(
                                    child: TextWidget(
                                  data: model.grid[row][col],
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: kScaffoldBackgroundColor,
                                )),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          )),
    );
  }
}

class ActionBarMenuItem extends StatelessWidget {
  final Widget child;

  const ActionBarMenuItem({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: child,
    );
  }
}
