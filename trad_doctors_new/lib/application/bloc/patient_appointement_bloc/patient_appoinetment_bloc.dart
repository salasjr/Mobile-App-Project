import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'patient_appoinetment_bloc_event.dart';
part 'patient_appoinetment_bloc_state.dart';

class PatientAppoinetmentBlocBloc extends Bloc<PatientAppoinetmentBlocEvent, PatientAppoinetmentBlocState> {
  PatientAppoinetmentBlocBloc() : super(PatientAppoinetmentBlocInitial()) {
    on<PatientAppoinetmentBlocEvent>((event, emit) {  
      
      });
  }
}
