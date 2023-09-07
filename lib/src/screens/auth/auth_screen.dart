import 'package:Afoq/src/blocs/auth/auth_cubit.dart';
import 'package:Afoq/src/constants/gaps.dart';
import 'package:Afoq/src/constants/paddings.dart';
import 'package:Afoq/src/services/logger/logger.dart';
import 'package:Afoq/src/services/service_locator/locator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../constants/themes.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _storeNameController = TextEditingController();
  final TextEditingController _adminNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phone1Controller = TextEditingController();
  final TextEditingController _phone2Controller = TextEditingController();
  bool _isConfirmPasswordVisible = true;
  bool _isPasswordVisible = true;
  bool _isSignup = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _storeNameController.dispose();
    _adminNameController.dispose();
    _confirmPasswordController.dispose();
    _addressController.dispose();
    _phone1Controller.dispose();
    _phone2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: primaryGradient,
            ),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: SizedBox(
              // height: 300,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: paddingH64,
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //const Spacer(),
          // gap32,
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: double.infinity,
              height: _isSignup
                  ? MediaQuery.of(context).size.height * 0.8
                  : MediaQuery.of(context).size.height * 0.6,
              margin: paddingH16,
              decoration: roundedRectangleFromTop,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: paddingH16,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        gapH32,
                        Text(
                          _isSignup
                              ? AppLocalizations.of(context)!.register
                              : AppLocalizations.of(context)!.login,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        gapH32,
                        if (_isSignup)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _storeNameController,
                                decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)!
                                      .storeNameHint,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Colors.grey,
                                      ),
                                  border: defaultInputBorder,
                                  prefixIcon: const Icon(
                                    Icons.email_outlined,
                                    color: Colors.grey,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .storeNameRequired;
                                  }
                                  return null;
                                },
                              ),
                              gapH16,
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _adminNameController,
                                decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)!
                                      .adminNameHint,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Colors.grey,
                                      ),
                                  border: defaultInputBorder,
                                  prefixIcon: const Icon(
                                    Icons.email_outlined,
                                    color: Colors.grey,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .adminNameRequired;
                                  }
                                  return null;
                                },
                              ),
                              gapH16,
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _addressController,
                                decoration: InputDecoration(
                                  hintText:
                                      AppLocalizations.of(context)!.addressHint,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Colors.grey,
                                      ),
                                  border: defaultInputBorder,
                                  prefixIcon: const Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.grey,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .addressRequired;
                                  }
                                  return null;
                                },
                              ),
                              gapH16,
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _phone1Controller,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText:
                                      AppLocalizations.of(context)!.phoneHint,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Colors.grey,
                                      ),
                                  border: defaultInputBorder,
                                  prefixIcon: const Icon(
                                    Icons.phone_outlined,
                                    color: Colors.grey,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .phoneRequired;
                                  }
                                  return null;
                                },
                              ),
                              gapH16,
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _phone2Controller,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText:
                                      AppLocalizations.of(context)!.phoneHint,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Colors.grey,
                                      ),
                                  border: defaultInputBorder,
                                  prefixIcon: const Icon(
                                    Icons.phone_outlined,
                                    color: Colors.grey,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppLocalizations.of(context)!
                                        .phoneRequired;
                                  }
                                  return null;
                                },
                              ),
                              gapH16,
                            ],
                          ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.emailHint,
                            hintStyle:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.grey,
                                    ),
                            border: defaultInputBorder,
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .emailRequired;
                            } else if (!RegExp(
                                    '^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]')
                                .hasMatch(value)) {
                              return AppLocalizations.of(context)!.emailInvalid;
                            }
                            return null;
                          },
                        ),
                        gapH16,
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _isPasswordVisible,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Colors.grey,
                              ),
                            ),
                            hintText:
                                AppLocalizations.of(context)!.passwordHint,
                            hintStyle:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Colors.grey,
                                    ),
                            border: defaultInputBorder,
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Colors.grey,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)!
                                  .passwordRequired;
                            } else if (value.length < 6) {
                              return AppLocalizations.of(context)!
                                  .passwordLengthError;
                            }
                            return null;
                          },
                        ),
                        gapH16,
                        if (_isSignup)
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _confirmPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _isConfirmPasswordVisible,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: toggleConfirmPasswordVisibility,
                                icon: Icon(
                                  _isConfirmPasswordVisible
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                              hintText:
                                  AppLocalizations.of(context)!.passwordHint,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.grey,
                                  ),
                              border: defaultInputBorder,
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: Colors.grey,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!
                                    .confirmPasswordRequired;
                              } else if (value.length < 6) {
                                return AppLocalizations.of(context)!
                                    .passwordLengthError;
                              } else if (value != _passwordController.text) {
                                return AppLocalizations.of(context)!
                                    .passwordsNotMatch;
                              }
                              return null;
                            },
                          ),
                        if (_isSignup) gapH16,
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: FilledButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (_isSignup) {
                                  register();
                                } else {
                                  login();
                                }
                              }
                            },
                            child: Text(
                              _isSignup
                                  ? AppLocalizations.of(context)!.register
                                  : AppLocalizations.of(context)!.login,
                            ),
                          ),
                        ),
                        gapH16,
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _isSignup = !_isSignup;
                              });

                              //AutoRouter.of(context).push(HomeRoute());
                            },
                            child: Text(
                              _isSignup
                                  ? AppLocalizations.of(context)!.login
                                  : AppLocalizations.of(context)!.register,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                        gap64,
                        FutureBuilder(
                          future: PackageInfo.fromPlatform(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Text(
                                snapshot.data!.version,
                                style: Theme.of(context).textTheme.bodySmall,
                              );
                            }
                            return Container();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void login() {
    locator<Log>().info("Login button pressed");
    locator<AuthCubit>().login(_emailController.text, _passwordController.text);
  }

  void register() {
    locator<Log>().info("Register button pressed");
    locator<AuthCubit>().register(
        _emailController.text,
        _passwordController.text);
  }

  void togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }
}
