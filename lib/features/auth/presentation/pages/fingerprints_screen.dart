import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:yammyapp/core/constants/app_appbar.dart';
import 'package:yammyapp/core/constants/constants.dart';
import 'package:yammyapp/core/router/app_router.dart';
import '../../../../core/widgets/navigation_bar.dart';
import '../widgets/fingerprint_body.dart';

class FingerprintScreen extends StatefulWidget {
  const FingerprintScreen({super.key});

  @override
  State<FingerprintScreen> createState() => _FingerprintScreenState();
}

class _FingerprintScreenState extends State<FingerprintScreen> {
  bool _isScanned = false;
  final LocalAuthentication _auth = LocalAuthentication();

Future<void> _scanFingerprint() async {
  final List<BiometricType> availableBiometrics =
      await _auth.getAvailableBiometrics();

  print('Available: $availableBiometrics');

  final bool authenticated = await _auth.authenticate(
    localizedReason: 'Scan your fingerprint',
    options: const AuthenticationOptions(
      biometricOnly: false,
      stickyAuth: true,
    ),
  );

  if (authenticated) {
    if(!mounted) return;
  setState(() => _isScanned = true);
  await Future.delayed(const Duration(milliseconds: 500));
  } else {
    if(!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fingerprint scan failed. Please try again.')),
    );
  }

}
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    _scanFingerprint();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.activeCategory,
      extendBody: true,
      bottomNavigationBar: const NavBar(),
      appBar: AppAppBar(
        function: () => Navigator.pop(context),
          text: "Set Your Fingerprint"
      ),
      body: FingerprintBody(
            isScanned: _isScanned),
    );
  }
}
