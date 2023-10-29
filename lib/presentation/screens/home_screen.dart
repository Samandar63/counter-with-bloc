import 'package:counter_app_bloc/cubit/counter_cubit.dart';
import 'package:counter_app_bloc/cubit/counter_state.dart';
import 'package:counter_app_bloc/presentation/utils/dimentions.dart';
import 'package:counter_app_bloc/presentation/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final String titleName;
  final Color HomePageColor;

  const HomeScreen(
      {super.key, required this.titleName, required this.HomePageColor});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(Dimentions.AppBarHeight),

          // AppBar
          child: AppBar(
            backgroundColor: HomePageColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            title: Center(
                child: Text(
              titleName,
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25),
            )),
          )),

      // The Text and state number part
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter App",
              style: TextStyle(fontSize: 30, color: HomePageColor),
            ),

            SizedBox(
              height: Dimentions.height20,
            ),

            BlocConsumer<CounterCubit, CounterState>(
              builder: (context, state) {
                if (state.counterValue! < 0) {
                  return Text(
                    "${state.counterValue} negative integer value",
                    style: textStyle.counterTextStyle,
                  );
                } else if (state.counterValue! % 2 == 0) {
                  return Text("${state.counterValue} even integer value",
                      style: textStyle.counterTextStyle);
                } else {
                  return Text("${state.counterValue} odd integer value",
                      style: textStyle.counterTextStyle);
                }
              },
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Incremented"),
                      duration: Duration(microseconds: 300),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Decremented"),
                    duration: Duration(microseconds: 300),
                  ));
                }
              },
            ),

            SizedBox(
              height: Dimentions.height20,
            ),

            // increment and decrement FloatingActionButtons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: "$titleName #1",
                  backgroundColor: HomePageColor,
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: "$titleName #2",
                  backgroundColor: HomePageColor,
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  child: const Icon(Icons.add),
                )
              ],
            ),

            MaterialButton(onPressed: () {
              Navigator.of(context).pushNamed('/second');
            },
              color: Colors.redAccent,
              child: Text("Second Screen"),
            ),

            SizedBox(
              height: Dimentions.height20,
            ),

            MaterialButton(onPressed: () {
              Navigator.of(context).pushNamed('/third');
            },
              
              color:Colors.greenAccent ,
              child: Text("Third Screen"),
            ),
            
          ],
        ),
      ),
    );
  }
}
