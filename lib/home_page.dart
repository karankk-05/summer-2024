import 'package:flutter/material.dart';
import 'ProfilePage.dart';
import 'CartPage.dart';
import 'ProductPage.dart';
import 'compose.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;


class HomePage extends StatefulWidget {
  final String? name;
  final String? phone;

  HomePage({this.name, this.phone});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 600) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: Text(
                'Welcome to MyMail  :)',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              leading: IconButton(
                color: Theme.of(context).colorScheme.onPrimary,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Confirm'),
                        content: Text('Do you want to logout?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('No'),
                          ),
                          TextButton(
                            onPressed: () async {
                                // Log out from Firebase
                                await FirebaseAuth.instance.signOut();
                                Navigator.of(context).pop(); // Pop the dialog
                                Navigator.of(context).popUntil((route) => route.isFirst); // Pop the screen
                              },
                            child: Text('Yes'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              actions: [
                Card(
                  child: Row(
                    children: [
                      IconButton(
                        color: Theme.of(context).colorScheme.primary,
                        icon: Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            selectedIndex = 0;
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Search'),
                                  content: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Enter your search query...',
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Close'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Search'),
                                    ),
                                  ],
                                );
                              },
                            );
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child: Text(
                          'Search',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: Transform.scale(
                    scale: 0.8,
                    child: Image.asset('assets/logo.png',
                        height: 100, width: 50),
                  ),
                ),
              ],
            ),
            body: Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    extended: true,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(
                          Icons.inbox,
                          color: selectedIndex == 0 ? Theme.of(context).colorScheme.primary : null,
                        ),
                        label: Text(
                          'Inbox',
                          style: TextStyle(
                            fontSize: 18,
                            color: selectedIndex == 0 ? Theme.of(context).colorScheme.primary : null,
                          ),
                        ),
                      ),
                      NavigationRailDestination(
                        icon: Icon(
                          Icons.star,
                          color: selectedIndex == 1 ? Theme.of(context).colorScheme.primary : null,
                        ),
                        label: Text(
                          'Starred',
                          style: TextStyle(
                            fontSize: 18,
                            color: selectedIndex == 1 ? Theme.of(context).colorScheme.primary : null,
                          ),
                        ),
                      ),
                      NavigationRailDestination(
                        icon: Icon(
                          Icons.person,
                          color: selectedIndex == 2 ? Theme.of(context).colorScheme.primary : null,
                        ),
                        label: Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 18,
                            color: selectedIndex == 2 ? Theme.of(context).colorScheme.primary : null,
                          ),
                        ),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: getPage(),
                  ),
                ),
              ],
              
            ),
            floatingActionButton: Align(alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                child: FloatingActionButton.extended(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ComposeEmailPage()),
                    );
                  },
                  label: Text('Compose',style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                  icon: Icon(Icons.email,color: Theme.of(context).colorScheme.onPrimary,),
                ),
              ),
            ),

          
        
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: Text(
                'Welcome',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              leading: IconButton(
                color: Theme.of(context).colorScheme.onPrimary,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Confirm'),
                        content: Text('Do you want to logout?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('No'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            child: Text('Yes'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: IconButton(
                    color: Theme.of(context).colorScheme.onPrimary,
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        selectedIndex = 0;
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Search'),
                              content: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Enter your search query...',
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Close'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Search'),
                                ),
                              ],
                            );
                          },
                        );
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: Transform.scale(
                    scale: 0.8,
                    child: Image.asset('assets/logo.png',
                        height: 100, width: 50),
                  ),
                ),
              ],
            ),
            body: getPage(),
            bottomNavigationBar: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: BottomNavigationBar(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                key: ValueKey<int>(selectedIndex),
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.inbox,
                      color: selectedIndex == 0 ? Theme.of(context).colorScheme.primary : null,
                    ),
                    label: 'Inbox',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.star,
                      color: selectedIndex == 1 ? Theme.of(context).colorScheme.primary : null,
                    ),
                    label: 'Starred',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person,
                      color: selectedIndex == 2 ? Theme.of(context).colorScheme.primary : null,
                    ),
                    label: 'Profile',
                  ),
                ],
                currentIndex: selectedIndex,
                onTap: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            floatingActionButton: SizedBox(height: 75,width: 130,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(55, 0, 0, 0),
                child: FloatingActionButton(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  
                   
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ComposeEmailPage()),
                    );
                  },
                  
                  child: Icon(Icons.email,color: Theme.of(context).colorScheme.onPrimary),
              ),
                        ),
            ));
        }
      },
    );
  }

  Widget getPage() {
    switch (selectedIndex) {
      case 0:
        return Inbox();
      case 1:
        return CartPage();
      case 2:
        return ProfilePage(
          name: '${widget.name}',
          phone: '${widget.phone}',
        );
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
  }
}
