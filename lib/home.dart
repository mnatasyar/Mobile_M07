import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:m07/provider.dart';
import 'package:provider/provider.dart';

class m07 extends StatefulWidget {
  const m07({super.key});

  @override
  State<m07> createState() => _m07State();
}

class _m07State extends State<m07> {
  String title = "Home";
  bool _isVisible = true;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<providertugas>(context);

    List<Widget> _widgeditem = prov.item
        .map(
          (e) => MyCard(text: e),
        )
        .toList();

    Widget _bodyaja() {
      if (_currentIndex == 0) {
        return HomeCard();
      } else if (_currentIndex == 1) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: _widgeditem,
          ),
        );
      } else if (_currentIndex == 2) {
        return AboutCard();
      } else {
        return Container();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: _bodyaja(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: new Visibility(
        visible: _isVisible,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              prov.additem();
            });
          },
          child: Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Exercise", icon: Icon(Icons.work)),
          BottomNavigationBarItem(label: "About", icon: Icon(Icons.people))
        ],
        onTap: (value) {
          if (value == 0) {
            _isVisible = false;
            title = "Home";
          }
          ;
          if (value == 1) {
            _isVisible = true;
            title = "Exercise";
          }
          ;
          if (value == 2) {
            _isVisible = false;
            title = "About";
          }
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  String text = "";
  MyCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.assignment),
      title: Text(text),
      trailing: Container(
        decoration: BoxDecoration(color: Colors.red),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Text(
          "Not Complete",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class AboutCard extends StatelessWidget {
  const AboutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 400,
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.purple,
        width: 5,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "M. Natasya Ramadana\n211112080",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          Image.network(
              "https://th.bing.com/th/id/OIP.t4MmBOjrUlo7SgyUVeONmgHaD4?w=345&h=181&c=7&r=0&o=5&pid=1.7"),
          const Text("Halo Gaes, Perkenalkan nama saya M. Natasya Ramadana"),
        ],
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 200,
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.purple,
        width: 5,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "INI NAMANYA HALAMAN HOMEPAGE",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
