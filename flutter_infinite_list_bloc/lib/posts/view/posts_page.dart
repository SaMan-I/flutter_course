import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list_bloc/posts/view/view.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_infinite_list_bloc/posts/bloc/posts_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Posts'),
      ),
      body: BlocProvider(
        create: (_) => PostsBloc(httpClient: http.Client())..add(PostFetched()),
        child: const PostsList(),
      ),
    );
  }
}
