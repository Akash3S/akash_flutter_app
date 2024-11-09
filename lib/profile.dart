import 'package:akash_flutter_app/Screens/phonelogin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'SocialButton.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool _isSigningIn = false;
  bool _obscurePassword = true;



  Widget _buildLoginForm(bool isSmallScreen) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Work Email",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: email,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email_outlined),
              hintText: 'Enter your email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: (value) {
              if (value?.isEmpty ?? true) return 'Please enter your email';
              if (!GetUtils.isEmail(value!)) return 'Please enter a valid email';
              return null;
            },
          ),
          const SizedBox(height: 24),
          _buildPasswordField(),
          _buildForgotPassword(),
          const SizedBox(height: 16),
          _buildLoginButton(),
        ],
      ),
    );
  }
  Future<void> signIn() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text,
        );
        // Navigate to home on success
        Get.offAllNamed('/crm');
      } catch (e) {
        Get.snackbar(
          'Error',
          'Failed to sign in: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red,
        );
      }
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        GoogleAuthProvider authProvider = GoogleAuthProvider();
        return await _auth.signInWithPopup(authProvider);
      }

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to sign in with Google: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
      rethrow;
    }
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: password,
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock_outline),
            hintText: 'Enter your password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            suffixIcon: IconButton(
              icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
              onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
            ),
          ),
          validator: (value) {
            if (value?.isEmpty ?? true) return 'Please enter your password';
            if ((value?.length ?? 0) < 6) return 'Password must be at least 6 characters';
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.topLeft,
      child: TextButton(
        onPressed: () => Get.toNamed('/forgot-password'),
        child: const Text("Forgot password?", style: TextStyle(color: Colors.black87)),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isSigningIn ? null : signIn,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: _isSigningIn
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text('Log in', style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }

  Widget _buildSocialLoginSection(bool isSmallScreen) {
    return Column(
      children: [
        const Text("Or continue with", style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 16),
        if (isSmallScreen)
          _buildVerticalSocialButtons()
        else
          _buildHorizontalSocialButtons(),
        const SizedBox(height: 16),
        _buildPhoneLoginButton(),
      ],
    );
  }

  Widget _buildVerticalSocialButtons() {
    return Column(
      children: _socialButtons(),
    );
  }

  Widget _buildHorizontalSocialButtons() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: _socialButtons(),
    );
  }

  List<Widget> _socialButtons() {
    return [
      Column(

        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              SocialButton(
                text: 'Continue with Google',
                icon: FontAwesomeIcons.google,
                onPressed: () async {
                  setState(() => _isSigningIn = true);
                  try {
                    final userCredential = await signInWithGoogle();
                    if (userCredential != null && mounted) {
                      Get.offAllNamed('/home');
                    }
                  } finally {
                    if (mounted) setState(() => _isSigningIn = false);
                  }
                },
                color: Colors.red,

              ),
              SizedBox(width: 10,),
              SocialButton(

                text: 'Continue with Microsoft',
                icon: FontAwesomeIcons.microsoft,
                onPressed: () {},
                color: Colors.blue,
              ),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              SocialButton(

                text: 'Continue with Facebook',
                icon: FontAwesomeIcons.facebook,
                onPressed: () {},
                color: Colors.blue,

              ),
              SizedBox(width: 10,),
              SocialButton(

                text: 'Continue with Apple',
                icon: FontAwesomeIcons.apple,
                onPressed: () {},
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),



    ];
  }

  Widget _buildPhoneLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => Get.to(() =>  PhoneLogin(),),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
        child: const Text('Login with Mobile no', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 800;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              padding: EdgeInsets.all(isSmallScreen ? 16 : 32),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Login Section
                  Expanded(
                    flex: isSmallScreen ? 1 : 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(),
                        const SizedBox(height: 32),
                        Text(
                          "Log in",
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 32,),
                        _buildLoginForm(isSmallScreen),
                        const SizedBox(height: 32,),
                        _buildSocialLoginSection(isSmallScreen),
                      ],
                    ),
                  ),

                  // Image Section for desktop
                  if (!isSmallScreen) ...[
                    Expanded(
                      flex: 1,

                      child: Column(
                        children: [
                          SizedBox(height: 140,),

                          Text('                 Lorem ipsum dolor sit amet.',style: TextStyle( fontSize: 15, color: Colors.black),),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 70),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    SizedBox(height: 30,),
                                    Icon(Icons.mark_as_unread_sharp,size: 40,),
                                    SizedBox(height: 20,),
                                    Text("Lorem ipsum dolor sit amet, consecteture "
                                        "adipiscing elit.Sed sucipit nunc sit amet elit "
                                        "graviida"),
                                  ],
                                ),
                              ),
                              height: 250,
                              width: 400,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(left: 80,right: 40),
                            child: const Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Sed sucipit nunc sit amet elit graviida',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const FlutterLogo(size: 40),
        const Spacer(),
        Text(
          "Not a member yet?",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
        ),
        TextButton(
          onPressed: () => Get.toNamed('/signup'),
          child: const Text(
            "Join",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ],
    );
  }
}