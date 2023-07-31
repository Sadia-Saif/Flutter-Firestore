import 'package:firebase_crud/services/auth/auth_provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      // body: StreamBuilder(
      //   stream: UserProvider.fetchUser(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else if (snapshot.hasData) {
      //       final users = snapshot.data!.docs;
      //       return ListView.builder(
      //         itemCount: users.length,
      //         itemBuilder: (context, index) {
      //           final user = users[index].data();
      //           return ListTile(
      //             title: Text(user['name']),
      //             subtitle: Text(user['likes']),
      //           );
      //         },
      //       );
      //     } else {
      //       return const Center(
      //         child: Text('No data found.'),
      //       );
      //     }
      //   },
      // ),

      body: Column(
        children: [
          const Text("Home Screen"),
          isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    await AuthProvider.logout();
                    
                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: const Text("Logout"),
                )
        ],
      ),
    );
  }
}
