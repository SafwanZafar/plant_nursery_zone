class User {
  String email;
  String name;
  String address;
  String contactNumber;
  int userId;
  String role;

  // Constructor to initialize the class properties
  User({
    required this.email,
    required this.name,
    required this.address,
    required this.contactNumber,
    required this.userId,
    required this.role,
  });

  // Factory method to create an instance of the class from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      name: json['name'],
      address: json['address'],
      contactNumber: json['contact_number'],
      userId: json['user_id'],
      role: json['role'],
    );
  }

  // Method to convert the instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'address': address,
      'contact_number': contactNumber,
      'user_id': userId,
      'role': role,
    };
  }
}
