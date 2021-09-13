import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_clean_arch/features/presenter/controllers/home_controller.dart';
import 'package:nasa_clean_arch/features/presenter/widgets/custom_app_bar.dart';
import 'package:nasa_clean_arch/features/presenter/widgets/round_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'APOD'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Welcome to Astronomy Picture of the day!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(
                  height: 150.0,
                ),
                RoundButtom(
                  label: 'Select datetime',
                  onTap: () async {
                    var datePicked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1995, 01, 01),
                      lastDate: DateTime.now(),
                    );

                    store.getSpaceMediaFromDate(datePicked);
                    Modular.to.navigate('/picture');
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
