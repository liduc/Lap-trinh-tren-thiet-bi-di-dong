import '../models/api_service.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../models/post.dart';

class PostScreen extends StatefulWidget {

  const PostScreen({super.key});

  @override
  _PostScreen createState() => _PostScreen();

}

class _PostScreen extends State<PostScreen> {
  late Future<List<Post>> futurePosts;
  @override
  void initState() {
    super.initState();
    futurePosts = ApiService().fetchAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(child: FutureBuilder<List<Post>>(
          future: futurePosts,
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(snapshot.hasError){
              return Text('Lỗi: ${snapshot.error}');
            }
            else if(snapshot.hasData){
              List<Post> posts = snapshot.data!;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(posts[index].title!),
                    subtitle: Text(posts[index].body!),
                  );
                },
              );
            }
            else {
              return const Text('Không có dữ liệu');
            }
          }),
      ),
    );
  }

}