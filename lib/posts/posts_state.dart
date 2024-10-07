part of 'posts_cubit.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}


class LoadingPostsState extends PostsState{}
class SuccessPostsState extends PostsState{}
class ErrorPostsState extends PostsState{}