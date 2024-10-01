import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView( //buat ngecustom sendiri scroll effect viewnya mau kayak gimana pake sliver.
            scrollDirection: Axis.horizontal,
            slivers: [
              SliverToBoxAdapter(
                  child: Container(
                width: 50,
                height: 50,
                color: Colors.amber,
              )),
              SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                  child: Container(
                width: 50,
                height: 50,
                color: Colors.pink,
              )),
              SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                child: Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ),
              ),
              
              SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
              ),
              SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                child: Container(
                width: 50,
                height: 50,
                color: Colors.indigo,
              ),
              ),
              SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                child: Container(
                width: 50,
                height: 50,
                color: Colors.indigo,
              ),
              ),
              SliverPadding(padding: EdgeInsets.all(10)),
            ],
          ),
      ),
    );
  }
}