import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/Env/env_config.dart';
import 'package:flutter_training/data/repositories/individual_repository/individual_repository.dart';
import 'package:flutter_training/models/individual/individual_model.dart';
import 'package:flutter_training/services/urls.dart';
import 'package:flutter_training/utils/localization_constants/i18_key_constants.dart'
    as i18;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/remote_client.dart';

part 'search_individual_bloc.freezed.dart';

typedef SearchIndividualEmitter = Emitter<SearchIndividualState>;

class SearchIndividualBloc
    extends Bloc<SearchIndividualEvent, SearchIndividualState> {
  SearchIndividualBloc() : super(const SearchIndividualState.initial()) {
    on<IndividualSearchEvent>(_onCreate);
  }

  FutureOr<void> _onCreate(
      IndividualSearchEvent event, SearchIndividualEmitter emit) async {
    Client client = Client();
    try {
      emit(const SearchIndividualState.loading());
      IndividualListModel individualList =
          await IndividualRepository(client.init()).searchIndividuals(
              url: Urls.wageSeekerServices.individualSearch,
              body: {
            'Individual': {
              if (event.name != null) 'name': {'givenName': event.name},
              if (event.mobileNumber != null)
                'mobileNumber': event.mobileNumber,
              if (event.individualId != null)
                'individualId': event.individualId,
            }
          },
              queryParameters: {
            'tenantId': envConfig.variables.tenantId,
          });
      if (individualList.Individual != null &&
          (individualList.Individual ?? []).isNotEmpty) {
        emit(SearchIndividualState.loaded(individualList.Individual));
      } else {
        emit(SearchIndividualState.error(i18.common.someErrorOccurred));
      }
    } on DioError catch (e) {
      emit(SearchIndividualState.error(e.response?.data['Errors'][0]['code']));
    }
  }
}

@freezed
class SearchIndividualEvent with _$SearchIndividualEvent {
  const factory SearchIndividualEvent.search({
    String? name,
    String? mobileNumber,
    String? individualId,
  }) = IndividualSearchEvent;
}

@freezed
class SearchIndividualState with _$SearchIndividualState {
  const SearchIndividualState._();
  const factory SearchIndividualState.initial() = _Initial;
  const factory SearchIndividualState.loading() = _Loading;
  const factory SearchIndividualState.loaded(
      List<IndividualModel>? individuals) = _Loaded;
  const factory SearchIndividualState.error(String? error) = _Error;
}
