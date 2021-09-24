class User {
  String username;
  String password;
  var fullName;
  var companyName;
  var email;
  var phoneNumber;

  User(
    this.username,
    this.password, [
    this.fullName,
    this.companyName,
    this.email,
    this.phoneNumber,
  ]);
  //   learn how to use sqflite 
  
  void setUsername(String newUsername) {
    username = newUsername;
  }

  void setPassword(String newPassword) {
    password = newPassword;
  }

  void setFullname(String newFullname) {
    fullName = newFullname;
  }

  void setCompanyName(String newCompanyName) {
    companyName = newCompanyName;
  }

  void setEmail(String newEmail) {
    email = newEmail;
  }

  void setPhoneNumber(String newPhoneNumber) {
    phoneNumber = newPhoneNumber;
  }
}


// class NewUser {
//   final String fullName;
//   final String companyName;
//   final String email;
//   final String phoneNumber;

//   NewUser(
//     this.fullName,
//     this.companyName,
//     this.email,
//     this.phoneNumber,
//   );
// }
