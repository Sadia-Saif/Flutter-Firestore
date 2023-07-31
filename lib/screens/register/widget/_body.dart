part of '../register.dart';

class _Body extends StatefulWidget {
  const _Body();

  static final _formKey = GlobalKey<FormBuilderState>();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _Body._formKey,
      child: Column(
        children: [
          FormBuilderTextField(
              name: 'name',
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ])),
          const SizedBox(height: 10),
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
          isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    final form = _Body._formKey.currentState;
                    final isValid = form!.saveAndValidate();
                    if (!isValid) return;

                    final data = form.value;
                    setState(() {
                      isLoading = true;
                    });

                    await AuthProvider.register(
                      data['password'],
                      data['email'],
                      data['name'],
                    );
                    
                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: const Text("Register")),
        ],
      ),
    );
  }
}
