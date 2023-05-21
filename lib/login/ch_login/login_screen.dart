import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../shared/components/components.dart';
import '../../ch_widgets/items.dart';
import '../ch_forget/forgetscreen.dart';
import '../ch_registration/info_page.dart';
import '../login_cubit/log_in_cubit.dart';

class LogInScreen extends StatelessWidget {

  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var keyForm = GlobalKey<FormState>();
  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }
  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => LogInCubit(),
      child: BlocConsumer<LogInCubit, LogInState>(
        listener: (context, state)
        {
        },
        builder: (context, state) {
          var cubit = LogInCubit.get(context);
          return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        children: [
                          SvgPicture.asset('assets/images/login.svg',
                            height: 200,
                            width: double.infinity,
                          ),
                          SizedBox(height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.05),
                          Text(
                            'Welcome back!',
                            style: Theme
                                .of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text('Please login to access and start App'),
                          const SizedBox(height: 15),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleSmall,
                                ),
                                const SizedBox(height: 10),
                                defaultForm(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  prefix: Icons.email,
                                  validator: _emailValidator,
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  'Password',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .titleSmall,
                                ),
                                const SizedBox(height: 10),
                                defaultForm(
                                  controller: _passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  prefix: Icons.lock,
                                  suffix: cubit.suffix,
                                  isobscureText: cubit.isPassword,
                                  suffixPressed: () {
                                    cubit.changePasswordVisibility();
                                  },
                                  validator: _passwordValidator,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: defaultTextButton(
                                      function: () {
                                        navigateTo(context, ForgetScreen());
                                      },
                                      text: 'Forget Password? '
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ConditionalBuilder(
                                    condition: state is! LogInInLoading,
                                    builder: (BuildContext context) =>
                                        ElevatedButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {}
                                          },
                                          style: ButtonStyle(
                                            minimumSize: MaterialStateProperty
                                                .all(const Size(double.infinity, 48)),
                                          ),
                                          child: const Text('Log in'),
                                        ),
                                    fallback: (BuildContext context) =>
                                    const Center(
                                      child: CircularProgressIndicator(),)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Don't have an account? ",
                                      style: const TextStyle(
                                          color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Sign up',
                                          style: const TextStyle(
                                              color: Color(0xFF3D80DE)),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              navigateTo(
                                                  context, RegistrationScreen());
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: size.height * 0.02),
                                  width: size.width * 0.8,
                                  child: Row(
                                    children: <Widget>[
                                      buildDivider(),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Text(
                                          "OR",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      buildDivider(),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    socialIcon(
                                      path: 'assets/images/fb.jpg',),
                                    socialIcon(
                                        path: 'assets/images/google.jpg'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]
                    ),
                  ),
                ),
              )
          );
        }),
    );
  }
}
