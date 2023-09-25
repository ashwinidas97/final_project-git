class HomeResponse {
  List<Posts>? posts;

  HomeResponse({this.posts});


  HomeResponse.fromJson(Map<String, dynamic> json) {

    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  String? profileName;
  String? profileImageUrl;
  String? postImage;
  String? postDescription;
  int? likesCount;
  int? commentsCount;

  Posts(
      {this.profileName,
        this.profileImageUrl,
        this.postImage,
        this.postDescription,
        this.likesCount,
        this.commentsCount});

  Posts.fromJson(Map<String, dynamic> json) {
    profileName = json['profile_name'];
    profileImageUrl = json['profile_image_url'];
    postImage = json['post_image'];
    postDescription = json['post_description'];
    likesCount = json['likes_count'];
    commentsCount = json['comments_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_name'] = this.profileName;
    data['profile_image_url'] = this.profileImageUrl;
    data['post_image'] = this.postImage;
    data['post_description'] = this.postDescription;
    data['likes_count'] = this.likesCount;
    data['comments_count'] = this.commentsCount;
    return data;
  }
}
