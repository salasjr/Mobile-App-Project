part of 'patient_appoinetment_bloc.dart';

abstract class PatientAppoinetmentBlocState extends Equatable {
  const PatientAppoinetmentBlocState();
  
  @override
  List<Object> get props => [];
}

class PatientAppoinetmentBlocInitial extends PatientAppoinetmentBlocState {}
