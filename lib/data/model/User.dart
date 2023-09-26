import 'Address.dart';
import 'Company.dart';
import 'dart:convert';

/// id : 1
/// name : "Leanne Graham"
/// username : "Bret"
/// email : "Sincere@april.biz"
/// address : {"street":"Kulas Light","suite":"Apt. 556","city":"Gwenborough","zipcode":"92998-3874","geo":{"lat":"-37.3159","lng":"81.1496"}}
/// phone : "1-770-736-8031 x56442"
/// website : "hildegard.org"
/// company : {"name":"Romaguera-Crona","catchPhrase":"Multi-layered client-server neural-net","bs":"harness real-time e-markets"}

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      num? id, 
      String? name, 
      String? username, 
      String? email, 
      Address? address, 
      String? phone, 
      String? website, 
      Company? company,}){
    _id = id;
    _name = name;
    _username = username;
    _email = email;
    _address = address;
    _phone = phone;
    _website = website;
    _company = company;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _username = json['username'];
    _email = json['email'];
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _phone = json['phone'];
    _website = json['website'];
    _company = json['company'] != null ? Company.fromJson(json['company']) : null;
  }
  num? _id;
  String? _name;
  String? _username;
  String? _email;
  Address? _address;
  String? _phone;
  String? _website;
  Company? _company;
User copyWith({  num? id,
  String? name,
  String? username,
  String? email,
  Address? address,
  String? phone,
  String? website,
  Company? company,
}) => User(  id: id ?? _id,
  name: name ?? _name,
  username: username ?? _username,
  email: email ?? _email,
  address: address ?? _address,
  phone: phone ?? _phone,
  website: website ?? _website,
  company: company ?? _company,
);
  num? get id => _id;
  String? get name => _name;
  String? get username => _username;
  String? get email => _email;
  Address? get address => _address;
  String? get phone => _phone;
  String? get website => _website;
  Company? get company => _company;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['username'] = _username;
    map['email'] = _email;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    map['phone'] = _phone;
    map['website'] = _website;
    if (_company != null) {
      map['company'] = _company?.toJson();
    }
    return map;
  }

}