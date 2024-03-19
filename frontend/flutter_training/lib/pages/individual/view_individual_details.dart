import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/blocs/localization/app_localization.dart';
import 'package:flutter_training/utils/common_widgets.dart';
import 'package:flutter_training/utils/localization_constants/i18_key_constants.dart'
    as i18;

import '../../blocs/individual/search_individual_bloc.dart';
import '../../utils/date_formats.dart';
import '../../widgets/Back.dart';
import '../../widgets/SideBar.dart';
import '../../widgets/atoms/app_bar_logo.dart';
import '../../widgets/drawer_wrapper.dart';

class ViewIndividualPage extends StatefulWidget {
  const ViewIndividualPage({super.key});

  @override
  ViewIndividualPageState createState() => ViewIndividualPageState();
}

/*
  * @author Ramkrishna
  * ramkrishna.sahoo@egovernments.org
  *
  * */
class ViewIndividualPageState extends State<ViewIndividualPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: const AppBarLogo(),
        ),
        drawer: const DrawerWrapper(Drawer(child: SideBar())),
        body: BlocBuilder<SearchIndividualBloc, SearchIndividualState>(
            builder: (context, searchState) {
          return searchState.maybeWhen(
              orElse: () => const SizedBox.shrink(),
              loading: () => Loaders.circularLoader(context),
              loaded: (individuals) => ScrollableContent(
                    header: Column(
                      children: [
                        const Back(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              t.translate(i18.bnd.viewCertificate),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                    footer: const PoweredByDigit(),
                    children: (individuals ?? [])
                        .map((e) => DigitCard(
                                child: Column(
                              children: [
                                //CommonWidgets.getItemWidget(context,title: 'title',description: 'description),
                                // A card field widget to show the card title and the description in row
                                CommonWidgets.getItemWidget(context,
                                    title: t.translate(i18.common.nameLabel),
                                    description: e.name?.givenName ?? 'NA'),
                                CommonWidgets.getItemWidget(context,
                                    title: t.translate(i18.common.fatherName),
                                    description: e.fatherName ?? 'NA'),
                                CommonWidgets.getItemWidget(context,
                                    title: t.translate('Date of Birth'),
                                    description: e.dateOfBirth != null
                                        ? e.dateOfBirth ?? "NA"
                                        : i18.common.noValue),
                                CommonWidgets.getItemWidget(context,
                                    title: t.translate(i18.bnd.gender),
                                    description: e.gender ?? 'NA'),

                                CommonWidgets.getItemWidget(context,
                                    title: t.translate('Aadhaar No.'),
                                    description: e.identifiers
                                            ?.where((element) =>
                                                element.identifierType ==
                                                'AADHAAR')
                                            .first
                                            .identifierId ??
                                        'NA'),
                                CommonWidgets.getItemWidget(context,
                                    title: t.translate('Address'),
                                    description: (e.address ?? []).isNotEmpty
                                        ? '${e.address?.first.locality}, ${e.address?.first.ward}, ${e.address?.first.pincode}'
                                        : 'NA'),
                              ],
                            )))
                        .toList(),
                  ));
        }));
  }
}
