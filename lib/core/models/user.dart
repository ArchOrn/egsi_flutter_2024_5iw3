class User {
  final int id;
  final String name;
  final String address;

  User({
    required this.id,
    required this.name,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final address = json['address'] as Map<String, dynamic>;
    return User(
      id: json['id'],
      name: json['name'],
      address: '${address['street']} ${address['suite']} ${address['city']}',
    );
  }
}
