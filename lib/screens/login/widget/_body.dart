part of '../login.dart';

class _Body extends StatelessWidget {
  const _Body();

  static final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FormBuilderTextField(
                name: 'email',
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ])),
            const SizedBox(height: 10),
            FormBuilderTextField(
              name: 'password',
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(6),
              ]),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text("Login")),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: const Text("Register"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
