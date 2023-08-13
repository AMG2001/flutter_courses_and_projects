import 'package:firebase_database/firebase_database.dart';

class Contact {
  late String _id;
  late String _firstName;
  late String _lastName;
  late String _phone;
  late String _email;
  late String _address;
  late String _photoUrl;

  /**
   * Setters and Getters 
   */
  get id => this._id;

  set id(value) => this._id = value;

  get firstName => this._firstName;

  set firstName(value) => this._firstName = value;

  get lastName => this._lastName;

  set lastName(value) => this._lastName = value;

  get phone => this._phone;

  set phone(value) => this._phone = value;

  get email => this._email;

  set email(value) => this._email = value;

  get address => this._address;

  set address(value) => this._address = value;

  get photoUrl => this._photoUrl;

  set photoUrl(value) => this._photoUrl = value;

  Contact(this._firstName, this._lastName, this._phone, this._email,
      this._address, this._photoUrl);

  Contact.withId(this._id, this._firstName, this._lastName, this._phone,
      this._email, this._address, this._photoUrl);

  Contact.fromSnapShot({required DataSnapshot snapshot}) {
    this._id = snapshot.key!;
    this._firstName = snapshot.value["first_name"]!;
    this._lastName = snapshot.value["last_name"]!;
  }
}
