import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/Env/env_config.dart';
import 'package:flutter_training/blocs/localization/app_localization.dart';
import 'package:flutter_training/models/individual/individual_model.dart';
import 'package:flutter_training/utils/localization_constants/i18_key_constants.dart'
    as i18;
import 'package:flutter_training/widgets/SideBar.dart';
import 'package:flutter_training/widgets/atoms/app_bar_logo.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/individual/create_individual_bloc.dart';
import '../../router/app_router.dart';
import '../../utils/constants.dart';
import '../../utils/date_formats.dart';
import '../../utils/notifiers.dart';
import '../../widgets/Back.dart';
import '../../widgets/atoms/radio_button_list.dart';
import '../../widgets/drawer_wrapper.dart';

class CreateIndividualPage extends StatefulWidget {
  const CreateIndividualPage({super.key});

  @override
  State<CreateIndividualPage> createState() => _CreateIndividualPageState();
}

class _CreateIndividualPageState extends State<CreateIndividualPage> {
  static const aadharNoKey = 'aadhaar';
  static const nameKey = 'name';
  static const houseNoKey = 'houseno';
  static const dobKey = 'dob';
  static const genderKey = 'gender';
  static const pinCodeKey = 'pincode';
  static var relationshipKey = 'relationship';
  static var wardKey = 'ward';
  static var socialCategoryKey = 'socialcategory';
  static var cityKey = 'city';
  static const mobileNoKey = 'mobileno';
  static var localityKey = 'locality';
  static const streetNameKey = 'streetname';
  static const guardianNameKey = 'guardianname';
  static const skillKey = 'skillkey';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(titleSpacing: 0, title: const AppBarLogo()),
      drawer: const DrawerWrapper(Drawer(child: SideBar())),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ScrollableContent(
            header: const Back(),
            children: [
              ReactiveFormBuilder(
                  form: buildForm,
                  builder: (context, form, child) {
                    return Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        DigitCard(
                            child: Column(children: [
                          const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Enter individual details',
                                style: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.w700),
                                textAlign: TextAlign.left,
                              )),
                          DigitTextFormField(
                            label: t.translate(i18.common.aadhaarNumber),
                            formControlName: aadharNoKey,
                            isRequired: true,
                            validationMessages: {
                              'required': (_) =>
                                  t.translate(i18.wageSeeker.aadhaarRequired),
                              'minLength': (_) => t.translate(
                                  i18.wageSeeker.minAadhaarCharacters),
                              'maxLength': (_) => t.translate(
                                  i18.wageSeeker.maxAadhaarCharacters),
                            },
                          ),

                          DigitTextFormField(
                            label: t.translate(i18.wageSeeker.nameOfWageSeeker),
                            formControlName: nameKey,
                            isRequired: true,
                            validationMessages: {
                              'required': (_) =>
                                  t.translate(i18.wageSeeker.nameRequired),
                              'minLength': (_) =>
                                  t.translate(i18.wageSeeker.minNameCharacters),
                              'maxLength': (_) =>
                                  t.translate(i18.wageSeeker.maxNameCharacters),
                            },
                          ),
                          DigitTextFormField(
                            label: t.translate(i18.common.guardianName),
                            formControlName: guardianNameKey,
                            isRequired: true,
                            validationMessages: {
                              'required': (_) => t
                                  .translate(i18.wageSeeker.fatherNameRequired),
                              'minLength': (_) => t.translate(
                                  i18.wageSeeker.minFatherNameCharacters),
                              'maxLength': (_) => t.translate(
                                  i18.wageSeeker.maxFatherNameCharacters),
                            },
                          ),
                          DigitReactiveDropdown<String>(
                            label: 'relationship',
                            menuItems: Constants.relationshipList,
                            isRequired: true,
                            formControlName: relationshipKey,
                            valueMapper: (value) => t.translate('$value'),
                            onChanged: (value) {},
                            validationMessages: {
                              'required': (_) => t.translate(
                                    i18.wageSeeker.relationshipRequired,
                                  ),
                            },
                          ),

                          DigitRadioButtonList(
                              labelText: t.translate(i18.common.gender),
                              formControlName: genderKey,
                              valueMapper: (value) => value,
                              options: Constants.bndGenderList),

                          DigitRadioButtonList(
                              labelText: t.translate(i18.common.selectSkill),
                              formControlName: skillKey,
                              valueMapper: (value) => value,
                              options: Constants.wageSeekerSkillList),

                          DigitDateFormPicker(
                            label: t.translate(i18.common.dateOfBirth),
                            isRequired: true,
                            icon: Icons.info_outline_rounded,
                            formControlName: dobKey,
                            autoValidation: AutovalidateMode.always,
                            requiredMessage:
                                t.translate(i18.common.dateOfBirthRequired),
                            cancelText: 'Cancel',
                            confirmText: 'OK',
                          ),

                          DigitTextFormField(
                            label: t.translate(i18.common.mobileNumber),
                            formControlName: mobileNoKey,
                            isRequired: true,
                            validationMessages: {
                              'required': (_) =>
                                  t.translate(i18.wageSeeker.mobileRequired),
                              'minLength': (_) => t.translate(
                                  i18.wageSeeker.minMobileCharacters),
                              'maxLength': (_) => t.translate(
                                  i18.wageSeeker.maxMobileCharacters),
                            },
                          ),
                          //TO INSERT SKILLS FIELD and PHOTOGRAPH FIELD
                        ])),
                        DigitCard(
                            child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                t.translate(i18.common.addressDetails),
                                style: const TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.w700),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            DigitTextFormField(
                              label: t.translate(i18.common.houseNo),
                              formControlName: houseNoKey,
                              isRequired: true,
                              validationMessages: {
                                'required': (_) =>
                                    t.translate(i18.common.houseNoRequired),
                                'maxLength': (_) =>
                                    t.translate(i18.common.maxHouseNoChars)
                              },
                            ),
                            DigitTextFormField(
                              label: t.translate(i18.common.streetName),
                              formControlName: streetNameKey,
                              validationMessages: {
                                'maxLength': (_) =>
                                    t.translate(i18.common.streetNameMaxChars),
                              },
                            ),
                            DigitReactiveDropdown<String>(
                              label: 'City',
                              menuItems: Constants.cityList,
                              isRequired: true,
                              formControlName: cityKey,
                              valueMapper: (value) => t.translate(value),
                              onChanged: (value) {},
                              validationMessages: {
                                'required': (_) => t.translate(
                                      i18.wageSeeker.cityRequired,
                                    ),
                              },
                            ),
                            DigitReactiveDropdown<String>(
                              label: 'Ward',
                              menuItems: Constants.wardList,
                              isRequired: true,
                              formControlName: wardKey,
                              valueMapper: (value) => t.translate(value),
                              onChanged: (value) {},
                              validationMessages: {
                                'required': (_) => t.translate(
                                      i18.wageSeeker.wardRequired,
                                    ),
                              },
                            ),
                            DigitReactiveDropdown<String>(
                              label: 'Locality',
                              menuItems: Constants.localityList,
                              isRequired: true,
                              formControlName: localityKey,
                              valueMapper: (value) => t.translate(value),
                              onChanged: (value) {},
                              validationMessages: {
                                'required': (_) => t.translate(
                                      i18.wageSeeker.localityRequired,
                                    ),
                              },
                            ),
                            DigitTextFormField(
                              label: t.translate(i18.common.pinCode),
                              formControlName: pinCodeKey,
                              isRequired: true,
                              maxLength: 6,
                              minLength: 6,
                              validationMessages: {
                                'required': (_) =>
                                    t.translate(i18.common.pinCodeRequired),
                                'minLength': (_) =>
                                    t.translate(i18.common.pinCodeMinChars),
                              },
                            ),
                          ],
                        )),
                        const SizedBox(
                          height: 16.0,
                        ),
                        BlocListener<CreateIndividualBloc,
                                CreateIndividualState>(
                            listener: (context, createState) {
                              createState.maybeWhen(
                                  orElse: () => false,
                                  loading: () =>
                                      Loaders.circularLoader(context),
                                  loaded: (individual) {
                                    context.router.popAndPush(
                                        SuccessResponseRoute(
                                            header:
                                                'Individual created successfully',
                                            subHeader: individual.individualId,
                                            backButton: true,
                                            callBack: () => context.router
                                                .push(const HomeRoute()),
                                            buttonLabel: t.translate(
                                                i18.common.backToHome)));
                                  },
                                  error: (String? error) =>
                                      Notifiers.getToastMessage(
                                          context, error.toString(), 'ERROR'));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: DigitElevatedButton(
                                  onPressed: () {
                                    form.markAllAsTouched();
                                    if (!form.valid) return;
                                    DigitDialog.show(context,
                                        options: DigitDialogOptions(
                                            titleIcon: const Icon(
                                              Icons.warning,
                                              color: Colors.red,
                                            ),
                                            titleText:
                                                t.translate(i18.common.warning),
                                            contentText: t.translate(i18
                                                .bnd.confirmCertificateDetails),
                                            primaryAction: DigitDialogActions(
                                              label: t.translate(
                                                  i18.common.confirm),
                                              action: (BuildContext context) {
                                                if (form.valid) {
                                                  DateTime dob =
                                                      form.value[dobKey]
                                                          as DateTime;
                                                  final String? name = form
                                                      .control(nameKey)
                                                      .value;
                                                  final String? doorNo = form
                                                      .control(houseNoKey)
                                                      .value;
                                                  final String? street = form
                                                      .control(streetNameKey)
                                                      .value;

                                                  final String? mobile = form
                                                      .control(mobileNoKey)
                                                      .value as String?;
                                                  final String? fatherName =
                                                      form
                                                          .control(
                                                              guardianNameKey)
                                                          .value;
                                                  final String? gender = form
                                                      .control(genderKey)
                                                      .value;
                                                  final String? relationship =
                                                      form
                                                          .control(
                                                              relationshipKey)
                                                          .value;
                                                  final String? locality = form
                                                      .control(localityKey)
                                                      .value;
                                                  final String? ward = form
                                                      .control(wardKey)
                                                      .value;
                                                  final String? skill = form
                                                      .control(skillKey)
                                                      .value;
                                                  final String? pinCode = (form
                                                      .control(pinCodeKey)
                                                      .value);
                                                  final String? aadhaar = form
                                                      .control(aadharNoKey)
                                                      .value;
                                                  context
                                                      .read<
                                                          CreateIndividualBloc>()
                                                      .add(
                                                        IndividualCreateEvent(
                                                            individualModel: IndividualModel(
                                                                name: IndividualName(
                                                                    givenName:
                                                                        name),
                                                                tenantId: envConfig
                                                                    .variables
                                                                    .tenantId,
                                                                dateOfBirth: DateFormats
                                                                    .getFilteredDate(
                                                                        (dob)
                                                                            .toString()),
                                                                fatherName:
                                                                    fatherName,
                                                                relationship:
                                                                    relationship,
                                                                mobileNumber:
                                                                    mobile,
                                                                gender: gender,
                                                                address: [
                                                              IndividualAddress(
                                                                type:
                                                                    "PERMANENT",
                                                                locality:
                                                                    IndividualLocalityOrWard(
                                                                  code:
                                                                      locality,
                                                                ),
                                                                ward:
                                                                    IndividualLocalityOrWard(
                                                                  code: ward,
                                                                ),
                                                                pincode:
                                                                    pinCode,
                                                                street: street,
                                                                doorNo: doorNo,
                                                              )
                                                            ],
                                                                identifiers: [
                                                              IndividualIdentifiers(
                                                                identifierType:
                                                                    'AADHAAR',
                                                                identifierId:
                                                                    aadhaar,
                                                              )
                                                            ])),
                                                      );
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                          content: Text(
                                                              'Oops ! Please fill the mandatory details')));
                                                }
                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .pop();
                                              },
                                            ),
                                            secondaryAction: DigitDialogActions(
                                              label:
                                                  t.translate(i18.common.back),
                                              action: (BuildContext context) =>
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .pop(),
                                            )));
                                  },
                                  child: Text(t.translate(i18.common.submit))),
                            )),
                      ],
                    ));
                  })
            ],
          )),
    );
  }

  FormGroup buildForm() => fb.group(<String, Object>{
        aadharNoKey: FormControl<String>(validators: [
          Validators.required,
          Validators.minLength(12),
          Validators.maxLength(12)
        ]),
        nameKey: FormControl<String>(validators: [
          Validators.required,
          Validators.minLength(2),
          Validators.maxLength(128)
        ]),
        guardianNameKey: FormControl<String>(validators: [
          Validators.required,
          Validators.minLength(2),
          Validators.maxLength(128)
        ]),
        relationshipKey: FormControl<String>(),
        socialCategoryKey: FormControl<String>(),
        dobKey: FormControl<DateTime>(
            value: null, validators: [Validators.required]),
        genderKey: FormControl<String>(),
        skillKey: FormControl<String>(),
        mobileNoKey: FormControl<String>(validators: [
          Validators.minLength(10),
          Validators.maxLength(10),
        ]),
        houseNoKey: FormControl<String>(validators: [
          Validators.minLength(2),
          Validators.required,
          Validators.maxLength(128)
        ]),
        streetNameKey:
            FormControl<String>(validators: [Validators.maxLength(64)]),
        localityKey: FormControl<String>(validators: [Validators.required]),
        cityKey: FormControl<String>(validators: [
          Validators.required,
        ]),
        wardKey: FormControl<String>(validators: [
          Validators.required,
        ]),
        pinCodeKey: FormControl<String>(validators: [
          Validators.minLength(6),
          Validators.required,
          Validators.maxLength(6)
        ]),
      });
}
