import 'dart:convert';

class AdminAcc {
  int? id;
  String email;
  int? number;
  String password;
  String? companyName;
  String? proofOfBiz_link;
  String? category;
  String? loc_firstLine;
  String? loc_secondLine;
  int? loc_pincode;
  bool? isAgreementAccpeted;
  bool? isAdminVerified;
  AdminAcc({
    this.id,
    required this.email,
    this.number,
    required this.password,
    this.companyName,
    this.proofOfBiz_link,
    this.category,
    this.loc_firstLine,
    this.loc_secondLine,
    this.loc_pincode,
    this.isAgreementAccpeted,
    this.isAdminVerified,
  });

  AdminAcc copyWith({
    int? id,
    String? email,
    int? number,
    String? password,
    String? companyName,
    String? proofOfBiz_link,
    String? category,
    String? loc_firstLine,
    String? loc_secondLine,
    int? loc_pincode,
    bool? isAgreementAccpeted,
    bool? isAdminVerified,
  }) {
    return AdminAcc(
      id: id ?? this.id,
      email: email ?? this.email,
      number: number ?? this.number,
      password: password ?? this.password,
      companyName: companyName ?? this.companyName,
      proofOfBiz_link: proofOfBiz_link ?? this.proofOfBiz_link,
      category: category ?? this.category,
      loc_firstLine: loc_firstLine ?? this.loc_firstLine,
      loc_secondLine: loc_secondLine ?? this.loc_secondLine,
      loc_pincode: loc_pincode ?? this.loc_pincode,
      isAgreementAccpeted: isAgreementAccpeted ?? this.isAgreementAccpeted,
      isAdminVerified: isAdminVerified ?? this.isAdminVerified,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'number': number,
      'password': password,
      'companyName': companyName,
      'proofOfBiz_link': proofOfBiz_link,
      'category': category,
      'loc_firstLine': loc_firstLine,
      'loc_secondLine': loc_secondLine,
      'loc_pincode': loc_pincode,
      'isAgreementAccpeted': isAgreementAccpeted,
      'isAdminVerified': isAdminVerified,
    };
  }

  factory AdminAcc.fromMap(Map<String, dynamic> map) {
    return AdminAcc(
      id: map['id'] != null ? map['id'] as int : null,
      email: map['email'] as String,
      number: map['number'] != null ? map['number'] as int : null,
      password: map['password'] as String,
      companyName:
          map['companyName'] != null ? map['companyName'] as String : null,
      proofOfBiz_link: map['proofOfBiz_link'] != null
          ? map['proofOfBiz_link'] as String
          : null,
      category: map['category'] != null ? map['category'] as String : null,
      loc_firstLine:
          map['loc_firstLine'] != null ? map['loc_firstLine'] as String : null,
      loc_secondLine: map['loc_secondLine'] != null
          ? map['loc_secondLine'] as String
          : null,
      loc_pincode:
          map['loc_pincode'] != null ? map['loc_pincode'] as int : null,
      isAgreementAccpeted: map['isAgreementAccpeted'] != null
          ? map['isAgreementAccpeted'] as bool
          : null,
      isAdminVerified: map['isAdminVerified'] != null
          ? map['isAdminVerified'] as bool
          : null,
    );
  }

  static fromMapList(rawData) {
    List parsedJsonList = rawData;
    List dartObjList = parsedJsonList.map((i) => AdminAcc.fromMap(i)).toList();
    return dartObjList;
  }

  String toJson() => json.encode(toMap());

  factory AdminAcc.fromJson(String source) =>
      AdminAcc.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AdminAcc(id: $id, email: $email, number: $number, password: $password, companyName: $companyName, proofOfBiz_link: $proofOfBiz_link, category: $category, loc_firstLine: $loc_firstLine, loc_secondLine: $loc_secondLine, loc_pincode: $loc_pincode, isAgreementAccpeted: $isAgreementAccpeted, isAdminVerified: $isAdminVerified)';
  }

  @override
  bool operator ==(covariant AdminAcc other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.number == number &&
        other.password == password &&
        other.companyName == companyName &&
        other.proofOfBiz_link == proofOfBiz_link &&
        other.category == category &&
        other.loc_firstLine == loc_firstLine &&
        other.loc_secondLine == loc_secondLine &&
        other.loc_pincode == loc_pincode &&
        other.isAgreementAccpeted == isAgreementAccpeted &&
        other.isAdminVerified == isAdminVerified;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        number.hashCode ^
        password.hashCode ^
        companyName.hashCode ^
        proofOfBiz_link.hashCode ^
        category.hashCode ^
        loc_firstLine.hashCode ^
        loc_secondLine.hashCode ^
        loc_pincode.hashCode ^
        isAgreementAccpeted.hashCode ^
        isAdminVerified.hashCode;
  }
}

// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// class AdminAcc {
//   int? id;
//   String email;
//   int number;
//   String password;
//   String companyName;
//   String proofOfBiz_link;
//   String category;
//   String loc_firstLine;
//   String loc_secondLine;
//   String loc_pincode;
//   bool isAgreementAccpeted;
//   bool isAdminVerified;
//   AdminAcc({
//     this.id,
//     required this.email,
//     required this.number,
//     required this.password,
//     required this.companyName,
//     required this.proofOfBiz_link,
//     required this.category,
//     required this.loc_firstLine,
//     required this.loc_secondLine,
//     required this.loc_pincode,
//     required this.isAgreementAccpeted,
//     required this.isAdminVerified,
//   });

//   AdminAcc copyWith({
//     int? id,
//     String? email,
//     int? number,
//     String? password,
//     String? companyName,
//     String? proofOfBiz_link,
//     String? category,
//     String? loc_firstLine,
//     String? loc_secondLine,
//     String? loc_pincode,
//     bool? isAgreementAccpeted,
//     bool? isAdminVerified,
//   }) {
//     return AdminAcc(
//       id: id ?? this.id,
//       email: email ?? this.email,
//       number: number ?? this.number,
//       password: password ?? this.password,
//       companyName: companyName ?? this.companyName,
//       proofOfBiz_link: proofOfBiz_link ?? this.proofOfBiz_link,
//       category: category ?? this.category,
//       loc_firstLine: loc_firstLine ?? this.loc_firstLine,
//       loc_secondLine: loc_secondLine ?? this.loc_secondLine,
//       loc_pincode: loc_pincode ?? this.loc_pincode,
//       isAgreementAccpeted: isAgreementAccpeted ?? this.isAgreementAccpeted,
//       isAdminVerified: isAdminVerified ?? this.isAdminVerified,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'email': email,
//       'number': number,
//       'password': password,
//       'companyName': companyName,
//       'proofOfBiz_link': proofOfBiz_link,
//       'category': category,
//       'loc_firstLine': loc_firstLine,
//       'loc_secondLine': loc_secondLine,
//       'loc_pincode': loc_pincode,
//       'isAgreementAccpeted': isAgreementAccpeted,
//       'isAdminVerified': isAdminVerified,
//     };
//   }

//   factory AdminAcc.fromMap(Map<String, dynamic> map) {
//     return AdminAcc(
//       id: map['id'] != null ? map['id'] as int : null,
//       email: map['email'] as String,
//       number: map['number'] as int,
//       password: map['password'] as String,
//       companyName: map['companyName'] as String,
//       proofOfBiz_link: map['proofOfBiz_link'] as String,
//       category: map['category'] as String,
//       loc_firstLine: map['loc_firstLine'] as String,
//       loc_secondLine: map['loc_secondLine'] as String,
//       loc_pincode: map['loc_pincode'] as String,
//       isAgreementAccpeted: map['isAgreementAccpeted'] as bool,
//       isAdminVerified: map['isAdminVerified'] as bool,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory AdminAcc.fromJson(String source) =>
//       AdminAcc.fromMap(json.decode(source) as Map<String, dynamic>);

//   static fromJsonList(rawData) {
//     List parsedJsonList = json.decode(rawData);
//     List dartObjList = parsedJsonList.map((i) => AdminAcc.fromMap(i)).toList();
//     return dartObjList;
//   }

//   @override
//   String toString() {
//     return 'AdminAcc(id: $id, email: $email, number: $number, password: $password, companyName: $companyName, proofOfBiz_link: $proofOfBiz_link, category: $category, loc_firstLine: $loc_firstLine, loc_secondLine: $loc_secondLine, loc_pincode: $loc_pincode, isAgreementAccpeted: $isAgreementAccpeted, isAdminVerified: $isAdminVerified)';
//   }

//   @override
//   bool operator ==(covariant AdminAcc other) {
//     if (identical(this, other)) return true;

//     return other.id == id &&
//         other.email == email &&
//         other.number == number &&
//         other.password == password &&
//         other.companyName == companyName &&
//         other.proofOfBiz_link == proofOfBiz_link &&
//         other.category == category &&
//         other.loc_firstLine == loc_firstLine &&
//         other.loc_secondLine == loc_secondLine &&
//         other.loc_pincode == loc_pincode &&
//         other.isAgreementAccpeted == isAgreementAccpeted &&
//         other.isAdminVerified == isAdminVerified;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         email.hashCode ^
//         number.hashCode ^
//         password.hashCode ^
//         companyName.hashCode ^
//         proofOfBiz_link.hashCode ^
//         category.hashCode ^
//         loc_firstLine.hashCode ^
//         loc_secondLine.hashCode ^
//         loc_pincode.hashCode ^
//         isAgreementAccpeted.hashCode ^
//         isAdminVerified.hashCode;
//   }
// }

// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// class AdminAcc {
//   int? id;
//   String email;
//   int? number;
//   String password;
//   AdminAcc({
//     this.id,
//     required this.email,
//     this.number,
//     required this.password,
//   });

//   AdminAcc copyWith({
//     int? id,
//     String? email,
//     int? number,
//     String? password,
//   }) {
//     return AdminAcc(
//       id: id ?? this.id,
//       email: email ?? this.email,
//       number: number ?? this.number,
//       password: password ?? this.password,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'email': email,
//       'number': number,
//       'password': password,
//     };
//   }

//   factory AdminAcc.fromMap(Map<String, dynamic> map) {
//     return AdminAcc(
//       id: map['id'] != null ? map['id'] as int : null,
//       email: map['email'] as String,
//       number: map['number'] != null ? map['number'] as int : null,
//       password: map['password'] as String,
//     );
//   }

//   static fromMapList(rawData) {
//     List parsedJsonList = rawData;
//     List dartObjList = parsedJsonList.map((i) => AdminAcc.fromMap(i)).toList();
//     return dartObjList;
//   }

//   String toJson() => json.encode(toMap());

//   factory AdminAcc.fromJson(String source) =>
//       AdminAcc.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'AdminAcc(id: $id, email: $email, number: $number, password: $password)';
//   }

//   @override
//   bool operator ==(covariant AdminAcc other) {
//     if (identical(this, other)) return true;

//     return other.id == id &&
//         other.email == email &&
//         other.number == number &&
//         other.password == password;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^ email.hashCode ^ number.hashCode ^ password.hashCode;
//   }
// }
