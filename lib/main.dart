import 'package:flutter/material.dart';

void main() {
  runApp(DesignApp());
}
class DesignApp extends StatefulWidget {
  DesignApp({Key? key}) : super(key: key);

  @override
  State<DesignApp> createState() => _DesignAppState();
}

class _DesignAppState extends State<DesignApp> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 1;

    void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  };
    return MaterialApp(
      title: 'App Design',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: Colors.white
      )),
      home: Scaffold(
        backgroundColor: Color(0xffF2F0EE),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0), 
        child: AppBar(
          title: Center(
            child: Text(' \n Discovery', style: TextStyle(fontWeight: FontWeight.bold, 
            color: Colors.black.withOpacity(1.0))),),
        )),
        body: Padding(
          padding: EdgeInsets. fromLTRB(10.0, 25.0, 10.0, 5.0),
          
          child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
              ),
              itemCount: pilihan.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey.shade100,
                  child: GridPilihan(pilihan2: pilihan[index],)
                );
              },
            ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedFontSize: 12,
          selectedIconTheme: IconThemeData(color: Colors.amberAccent),
          selectedItemColor: Colors.amberAccent,
          unselectedIconTheme: IconThemeData(
            color: Colors.grey,
          ),
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.place),
              label: 'Discovery',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Bookmark',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events_sharp),
              label: 'Top Foodle',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class Pilihan{
  const Pilihan({required this.icon, required this.title,});
  final IconData icon;
  final String title;
}

const List<Pilihan> pilihan = const <Pilihan>[
  Pilihan(icon: Icons.sports_bar, title: 'Beers & Hotels'),
  Pilihan(icon: Icons.dinner_dining, title: 'Fine Dining'),
  Pilihan(icon: Icons.storefront, title: 'Cafes'),
  Pilihan(icon: Icons.router, title: 'Nearby'),
  Pilihan(icon: Icons.fastfood, title: 'Fast Foods'),
  Pilihan(icon: Icons.local_pizza, title: 'Featured Foods'),
];

class GridPilihan extends StatelessWidget{
  const GridPilihan({required this.pilihan2});  
  final Pilihan pilihan2;  

  @override
  Widget build(BuildContext context){
    final TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;  
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,  
        children: [ 
        Expanded(child: Icon(pilihan2.icon, size:80.0, color: textStyle?.color)),  
        Text(pilihan2.title, style: textStyle),
        ],
      ),
    );
  }
}
