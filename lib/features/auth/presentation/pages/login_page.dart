import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../cubits/auth_cubit.dart';
import '../cubits/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    final auth = context.read<AuthCubit>();
    if (auth.state.isLoading) {
      return;
    }
    if (_formKey.currentState?.validate() != true) {
      return;
    }
    auth.login(_usernameController.text, _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            if (width < 600) {
              return _MobileLogin(form: _form(showLogo: false));
            }
            final brandingFlex = width < 900 ? 40 : 45;
            final formFlex = width < 900 ? 60 : 55;
            return Row(
              children: [
                Expanded(
                  flex: brandingFlex,
                  child: _BrandingPanel(showSubtitle: width >= 900),
                ),
                Expanded(flex: formFlex, child: _formColumn()),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _formColumn() {
    return ColoredBox(
      color: AppColors.white,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: _form(showLogo: true),
                ),
              ),
            ),
          ),
          const _LoginFooter(),
        ],
      ),
    );
  }

  Widget _form({required bool showLogo}) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (showLogo) ...[
                const Center(child: _SolixLogo(height: 64)),
                const SizedBox(height: 28),
              ],
              Text(
                'Welcome Back',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              const Text(
                'Sign in to continue to your SOLIX account.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: AppColors.textMuted, height: 1.4),
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: _usernameController,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.username],
                decoration: const InputDecoration(
                  hintText: 'اسم المستخدم',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'أدخل اسم المستخدم';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                textInputAction: TextInputAction.done,
                autofillHints: const [AutofillHints.password],
                onFieldSubmitted: (_) => _submit(),
                decoration: InputDecoration(
                  hintText: 'كلمة المرور',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    tooltip: _obscurePassword ? 'إظهار كلمة المرور' : 'إخفاء كلمة المرور',
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'أدخل كلمة المرور';
                  }
                  return null;
                },
              ),
              if (state.errorMessage != null) ...[
                const SizedBox(height: 12),
                Text(
                  state.errorMessage!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColors.offline, fontSize: 13),
                ),
              ],
              const SizedBox(height: 24),
              SizedBox(
                height: 48,
                child: FilledButton(
                  onPressed: state.isLoading ? null : _submit,
                  child: state.isLoading
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.4,
                            color: AppColors.white,
                          ),
                        )
                      : const Text('تسجيل الدخول'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MobileLogin extends StatelessWidget {
  const _MobileLogin({required this.form});

  final Widget form;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: AppColors.primary,
          padding: const EdgeInsets.fromLTRB(24, 48, 24, 28),
          child: const Column(
            children: [
              _SolixLogo(height: 56),
              SizedBox(height: 16),
              Text(
                'Welcome to SOLIX',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 16),
            child: form,
          ),
        ),
        const _LoginFooter(),
      ],
    );
  }
}

class _BrandingPanel extends StatelessWidget {
  const _BrandingPanel({required this.showSubtitle});

  final bool showSubtitle;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primary,
      child: Stack(
        children: [
          const Positioned.fill(child: CustomPaint(painter: _BrandBackdropPainter())),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _SolixLogo(height: 72),
                const Spacer(),
                const Text(
                  'Welcome to SOLIX',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    height: 1.15,
                  ),
                ),
                if (showSubtitle) ...[
                  const SizedBox(height: 16),
                  const Text(
                    'Smart Business Management. Connected Operations. Complete Control.',
                    style: TextStyle(
                      color: Color(0xFFD6E8F7),
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SolixLogo extends StatelessWidget {
  const _SolixLogo({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Image.asset(
        'assets/images/solix_logo.png',
        height: height,
        fit: BoxFit.contain,
      ),
    );
  }
}

class _LoginFooter extends StatelessWidget {
  const _LoginFooter();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(24, 8, 24, 20),
      child: Text(
        '© 2026 SOLIX. All rights reserved.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12, color: AppColors.textSubtle),
      ),
    );
  }
}

class _BrandBackdropPainter extends CustomPainter {
  const _BrandBackdropPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final cyan = Paint()..color = AppColors.accent.withValues(alpha: 0.16);
    final soft = Paint()..color = AppColors.white.withValues(alpha: 0.06);
    final line = Paint()
      ..color = AppColors.accent.withValues(alpha: 0.35)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    canvas.drawCircle(Offset(size.width * 0.85, size.height * 0.12), 90, cyan);
    canvas.drawCircle(Offset(size.width * 0.1, size.height * 0.82), 120, soft);
    canvas.drawCircle(Offset(size.width * 0.72, size.height * 0.78), 46, line);
    canvas.drawLine(
      Offset(size.width * 0.08, size.height * 0.22),
      Offset(size.width * 0.34, size.height * 0.22),
      line,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(size.width * 0.62, size.height * 0.38, 70, 70),
        const Radius.circular(16),
      ),
      line,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
