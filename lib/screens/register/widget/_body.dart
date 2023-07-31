part of '../register.dart';

class _Body extends StatelessWidget {
  const _Body();

  static final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          FormBuilderTextField(
              name: 'name',
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
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
          ElevatedButton(onPressed: () {}, child: const Text("Login"))
        ],
      ),
    );
  }
}
