import 'package:flutter/material.dart';
import 'package:flutter_cours_2024_ism/core/models/login_model.dart';
import 'package:flutter_cours_2024_ism/core/models/token_response_model.dart';
import 'package:flutter_cours_2024_ism/core/repositories/security_repository.dart';

class LoginService  extends ChangeNotifier {
    static TokenResponseModel? user;
     static Future<void> getUserConnect(LoginModel loginModel) async{
           final TokenResponseModel? token=  await SecurityRepository.findUserByLoginAndPassword(loginModel);
                                    user=token;
            }
    }
