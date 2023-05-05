import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../shared/components/components.dart';
import '../../screens/ch_home/myhome.dart';
import '../../shared/network/local/cashe_helper.dart';
import '../ch_forget/forgetscreen.dart';
import '../login_cubit/log_in_cubit.dart';

class LogInScreen extends StatelessWidget {

  var emailController = TextEditingController();
  var pwController = TextEditingController();
  var keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInCubit(),
      child: BlocConsumer<LogInCubit, LogInState>(
        listener: (context, state)
        {
        },
        builder: (context, state) {
          var cubit = LogInCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key:keyForm ,
                    child: Column(
                      children: [
                        Text(
                          'Log In',
                          style: Theme
                              .of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(color: Colors.black),
                        ),
                        const SizedBox(height: 20,),
                        defaultForm(
                          controller: emailController,
                          KBtype: TextInputType.emailAddress,
                          label: 'E-mail address',
                          prefix: Icons.email,
                          validate: (val) {
                            if (val?.isEmpty == true) {
                              return 'Email Address must not be  empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultForm(
                          controller: pwController,
                          KBtype: TextInputType.visiblePassword,
                          label: 'Password',
                          suffix: cubit.suffix,
                          isobscureText: cubit.isPassword,
                          suffPressed: ()
                          {
                            cubit.changePasswordVisibility();
                          },
                          prefix: Icons.lock,
                          validate: (val) {
                            if (val?.isEmpty == true) {
                              return 'Password Address must not be empty';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultTextButton(
                            function: () {
                              navigateTo(context, ForgetScreen());
                            },
                            text: 'Forget Password '
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(
                          condition: state is ! LogInInLoading,
                          builder: (BuildContext context)=>defaultButton(
                              function: ()
                              {
                                if (keyForm.currentState?.validate() == true)
                                {

                                }
                              },
                              text: "Log in"),
                          fallback: (BuildContext context)=>const Center(child:CircularProgressIndicator(),)


                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultTextButton(
                            function: () {
                              navigateTo(context, ForgetScreen());
                            },
                            text: 'New to app , Register now '
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
