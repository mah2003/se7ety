import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:se7ety/Core/enums/User_type_enum.dart';
import 'package:se7ety/Feature/Auth/Presentation/bloc/auth_event.dart';
import 'package:se7ety/Feature/Auth/Presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(login);
    on<RegisterEvent>(register);
  }

  login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email, password: event.password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('المستخدم غير موجود');
      } else if (e.code == 'wrong-password') {
        print('كلمه المرور غير صحيحه');
      }
    } catch (e) {
      emit(AuthErrorState(error: "حدث خطا ما "));
    }
  }

  register(RegisterEvent event, Emitter<AuthState> emit) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      User? user = credential.user;
      user?.updateDisplayName(event.name);
      if (event.userType == UserType.doctor) {
        FirebaseFirestore.instance.collection("doctors").doc(user?.uid).set({
          'name': event.name,
          'image': '',
          'specialization': '',
          'rating': 3,
          'email': event.email,
          'phone1': '',
          'phone2': '',
          'bio': '',
          'openHour': '',
          'closeHour': '',
          'address': '',
          'uid': user?.uid,
        });
      } else {
        FirebaseFirestore.instance.collection('patients').doc(user?.uid).set({
          'name': event.name,
          'image': '',
          'age': '',
          'email': event.name,
          'phone': '',
          'bio': '',
          'city': '',
          'uid': user?.uid
        }, SetOptions(merge: true));
        emit(RegisterSuccessState());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthErrorState(error: "كلمه مرور ضعيفه"));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthErrorState(error: "هذا الاحساب موجود بالفعل"));
      }
    } catch (e) {
      emit(AuthErrorState(error: "حدث خطا ما"));
    }
    emit(RegisterLoadingState());
  }
}
