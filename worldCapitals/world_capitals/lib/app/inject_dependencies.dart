import 'package:flutter_meedu/meedu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:world_capitals/app/data/repository_impl/account_repository_impl.dart';
import 'package:world_capitals/app/data/repository_impl/authentication_repository_impl.dart';
import 'package:world_capitals/app/domain/repository/account_repository.dart';
import 'data/repository_impl/sign_up_repository_impl.dart';
import 'domain/repository/authentication_repository.dart';
import 'domain/repository/sign_up_repository.dart';

void injectDependencies() {
  Get.put<AuthenticationRepository>(
    AuthenticationRepositoryImpl(FirebaseAuth.instance),
  );
  Get.put<SignUpRepository>(
    SignUpRepositoryImpl(FirebaseAuth.instance),
  );
  Get.lazyPut<AccountRepository>(
    () => AccountRepositoryImpl(
      FirebaseAuth.instance,
    ),
  );
}
