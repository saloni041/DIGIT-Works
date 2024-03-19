import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/utils/localization_constants/i18_key_constants.dart'
    as i18;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/remote_client.dart';
import '../../data/repositories/individual_repository/individual_repository.dart';
import '../../models/individual/individual_model.dart';
import '../../services/urls.dart';

part 'create_individual_bloc.freezed.dart';

typedef IndividualCreateEmitter = Emitter<CreateIndividualState>;

class CreateIndividualBloc
    extends Bloc<CreateIndividualEvent, CreateIndividualState> {
  IndividualModel? _individualDetails;
  IndividualAddress? _individualAddressDetails;

  CreateIndividualBloc() : super(const CreateIndividualState.initial()) {
    on<IndividualCreateEvent>(_onCreate);
  }
  Future<void> _onCreate(
      IndividualCreateEvent event, IndividualCreateEmitter emit) async {
    Client client = Client();
    try {
      _individualDetails = event.individualModel;

      emit(const CreateIndividualState.loading());

      IndividualModel createIndividualResponse =
          await IndividualRepository(client.init()).createIndividual(
              url: Urls.wageSeekerServices.individualCreate,
              body: {'Individual': _individualDetails?.toMap()});

      if (createIndividualResponse != null) {
        emit(CreateIndividualState.loaded(createIndividualResponse));
      } else {
        emit(CreateIndividualState.error(i18.common.someErrorOccurred));
      }
    } catch (e) {
      print(e);
      emit(CreateIndividualState.error(i18.common.someErrorOccurred));
    }
  }
}

@freezed
class CreateIndividualEvent with _$CreateIndividualEvent {
  const factory CreateIndividualEvent.create({
    required IndividualModel individualModel,
  }) = IndividualCreateEvent;
}

@freezed
class CreateIndividualState with _$CreateIndividualState {
  const CreateIndividualState._();
  const factory CreateIndividualState.initial() =
      _Initial; //Initial State is the first state,
  const factory CreateIndividualState.loading() =
      _Loading; // Loading state will show a loader on the page when the API call is made
  const factory CreateIndividualState.loaded(IndividualModel individualModel) =
      _Loaded; // after the successful response in API call, emit the loaded state
  const factory CreateIndividualState.error(String? error) =
      _Error; // If API response fails with error status or we do not get the desired response, Error state will be emitted
}
