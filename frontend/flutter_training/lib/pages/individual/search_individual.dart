import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/blocs/localization/app_localization.dart';
import 'package:flutter_training/router/app_router.dart';
import 'package:flutter_training/utils/localization_constants/i18_key_constants.dart'
    as i18;
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/individual/search_individual_bloc.dart';
import '../../utils/notifiers.dart';
import '../../widgets/Back.dart';
import '../../widgets/SideBar.dart';
import '../../widgets/atoms/app_bar_logo.dart';
import '../../widgets/drawer_wrapper.dart';

class SearchIndividualPage extends StatefulWidget {
  const SearchIndividualPage({super.key});

  @override
  SearchIndividualPageState createState() => SearchIndividualPageState();
}

/*
  * @author Ramkrishna
  * ramkrishna.sahoo@egovernments.org
  *
  * */
class SearchIndividualPageState extends State<SearchIndividualPage> {
  String nameKey = 'name';
  String mobileNoKey = 'mobileNo';
  String individualIdKey = 'individualId';

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
        body: ScrollableContent(
          header: Column(
            children: [
              const Back(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  t.translate('Search Individuals'),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          footer: const PoweredByDigit(),
          children: [
            DigitCard(
                child: ReactiveFormBuilder(
                    form: buildForm,
                    builder: (context, form, child) {
                      return Column(
                        children: [
                          DigitTextFormField(
                            label: t.translate(i18.common.nameLabel),
                            formControlName: nameKey,
                          ),
                          DigitTextFormField(
                            label: t.translate(i18.common.mobileNumber),
                            formControlName: mobileNoKey,
                          ),
                          DigitTextFormField(
                            label: t.translate('Individual ID'),
                            formControlName: individualIdKey,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          BlocListener<SearchIndividualBloc,
                                  SearchIndividualState>(
                              listener: (context, searchState) {
                                searchState.maybeWhen(
                                    orElse: () => false,
                                    loading: () =>
                                        Loaders.circularLoader(context),
                                    loaded: (individuals) {
                                      context.router
                                          .push(const ViewIndividualRoute());
                                    },
                                    error: (String? error) =>
                                        Notifiers.getToastMessage(context,
                                            error.toString(), 'ERROR'));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: DigitElevatedButton(
                                    onPressed: () {
                                      form.markAllAsTouched();
                                      if (form.controls.values.isEmpty) return;

                                      context
                                          .read<SearchIndividualBloc>()
                                          .add(IndividualSearchEvent(
                                            name: form.control(nameKey).value,
                                            individualId: form
                                                .control(individualIdKey)
                                                .value,
                                            mobileNumber:
                                                form.control(mobileNoKey).value,
                                          ));
                                    },
                                    child:
                                        Text(t.translate(i18.common.submit))),
                              )),
                        ],
                      );
                    }))
          ],
        ));
  }

  FormGroup buildForm() => fb.group(<String, Object>{
        nameKey: FormControl<String>(),
        individualIdKey: FormControl<String>(),
        mobileNoKey: FormControl<String>(),
      });
}
