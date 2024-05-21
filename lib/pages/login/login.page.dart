import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cours_2024_ism/core/components/custom_form_field.dart';
import 'package:flutter_cours_2024_ism/core/components/widget.bar.dart';
import 'package:flutter_cours_2024_ism/core/constantes/colors.constantes.dart';
import 'package:flutter_cours_2024_ism/core/models/client.model.dart';
import 'package:flutter_cours_2024_ism/core/models/login_model.dart';
import 'package:flutter_cours_2024_ism/core/models/token_response_model.dart';
import 'package:flutter_cours_2024_ism/core/providers/cart.providers.dart';
import 'package:flutter_cours_2024_ism/core/repositories/produit.repository.dart';
import 'package:flutter_cours_2024_ism/core/repositories/security_repository.dart';
import 'package:flutter_cours_2024_ism/core/services/login_service.dart';
import 'package:flutter_cours_2024_ism/pages/home/home.page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginOrRegisterPage extends StatefulWidget {
  static String routeName = "/loginOrRegister";
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  final ProduitRepository produitRepository = ProduitRepository();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passworController = TextEditingController();
  String errorText = "";
  bool _rememberMe = false;
  LoginModel? _loginModel;
  @override
  void initState() {
    super.initState();
    //_loadPreferences();
  }

  void _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _loginModel = prefs.getString('user') == null
          ? null
          : LoginModel.fromMap(json.decode(prefs.getString('user')!));
      _rememberMe = prefs.getBool('rememberMe') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<CartPovider>(context, listen: true);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login or Register"),
          //backgroundColor:bbwPrimaryColor,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.login),
                text: "Login",
              ),
              Tab(
                icon: Icon(Icons.app_registration),
                text: "Register",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 480,
                  decoration: BoxDecoration(
                    color: bbwPrimaryColor.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        16.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          higgerText(text: "Fomulaire de Connexion"),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(errorText),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomFormField(
                            controller: _loginController,
                            hintText: 'Login',
                            validator: (val) {
                              if (val != null && val.isEmpty) {
                                return 'Enter valid name';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomFormField(
                            controller: _passworController,
                            hintText: 'Password',
                            obscureText: true,
                            validator: (val) {
                              if (val != null && val.isEmpty) {
                                return 'Enter un Mot de Passe  Valide';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 4.4 * MediaQuery.of(context).size.width / 5,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () async {
                               /*  final prefs =
                                        await SharedPreferences.getInstance(); */
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  LoginModel loginModel;
                                  
                                     loginModel = LoginModel(
                                      password: _passworController.text,
                                      username: _loginController.text);
                                   
                               
                                  await LoginService.getUserConnect(loginModel);
                                  if (LoginService.user != null) {
                                    
                                  /*   prefs.setString(
                                        "user", loginModel.toJson()); */
                                    if (dataProvider
                                        .cart.articlesPanier.isNotEmpty) {
                                      dataProvider.cart.client = ClientModel(
                                          id: LoginService.user!.id,
                                          nomComplet: "",
                                          telephone: "");
                                      produitRepository.add(dataProvider.cart);
                                      dataProvider.clearCart();
                                    }
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => const HomePage(),
                                      ),
                                    );
                                  } else {
                                    setState(() {
                                      errorText =
                                          "Login ou Mot de Passe incorrect";
                                    });
                                  }
                                }
                              },
                              child: const Text(
                                'Connexion',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          const  SizedBox(height: 10,),
                          CheckboxListTile(
                            title: Text('Remember me'),
                             value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                 _rememberMe = value??false;
                                // print(_loginModel);
                        
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
