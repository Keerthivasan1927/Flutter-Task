import 'package:flutter/material.dart';
import 'package:my_sample_app/controllers/home_controller.dart';
import 'package:my_sample_app/utils/home_widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    final provider = context.watch<HomeController>();

    if (provider.form == null) {
      Future.microtask(() {
        context.read<HomeController>().loadFormFromAssets();
      });

      return const Scaffold(
        body: Center(child: CircularProgressIndicator(color: Colors.green)),
      );
    }

    final form = provider.form!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          form.formName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Expanded(
            child: Form(
              key: _formKey,
              child: ListView.builder(
                controller: provider.scrollController,
                padding: const EdgeInsets.all(12),
                itemCount:
                    provider.visibleFields.length +
                    (provider.visibleFields.length <
                            provider.form!.fields.length
                        ? 1
                        : 0),

                itemBuilder: (context, index) {
                  if (index < provider.visibleFields.length) {
                    final field = provider.visibleFields[index];

                    return HomeWidgets.dynamicField(field, context);
                  }

                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.green),
                    ),
                  );
                },
              ),
            ),
          ),
          HomeWidgets.submitButton(
            title: form.buttonType,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print("Form valid");
              }
            },
          ),
        ],
      ),
    );
  }
}
