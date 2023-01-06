import 'dart:core';

class User {
  String name;
  String email;
  String email_verified_at;
  String bio;
  String phone;
  String job;
  String current_team_id;
  String created_at;
  String updated_at;
  String profile_photo_url;

  User(
      this.name,
      this.email,
      this.email_verified_at,
      this.bio,
      this.phone,
      this.job,
      this.current_team_id,
      this.created_at,
      this.updated_at,
      this.profile_photo_url);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        email_verified_at = json['email_verified_at'],
        bio = json['bio'],
        phone = json['phone'],
        job = json['job'],
        current_team_id = json['current_team_id'],
        created_at = json['created_at'],
        updated_at = json['updated_at'],
        profile_photo_url = json['profile_photo_url'];
}
