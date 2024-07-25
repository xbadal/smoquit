class User {
  String? msg;
  int? userId;
  String? userType;
  String? designationName;
  String? userCode;
  String? userName;
  String? userEmailId;
  String? userMobileNo;
  String? countryCode;
  String? userPassword;
  String? deviceId;
  String? ipAddress;
  String? dateOfEntry;
  String? fCMTOKEN;
  String? profilePic;
  String? jsonToken;
  bool? userIsActive;
  String? filePath;
  bool? isApproved;
  bool? isBlocked;

  User(
      {this.msg,
        this.userId,
        this.userType,
        this.designationName,
        this.userCode,
        this.userName,
        this.userEmailId,
        this.userMobileNo,
        this.countryCode,
        this.userPassword,
        this.deviceId,
        this.ipAddress,
        this.dateOfEntry,
        this.fCMTOKEN,
        this.profilePic,
        this.jsonToken,
        this.userIsActive,
        this.filePath,
        this.isApproved,
        this.isBlocked});

  User.fromJson(Map<String, dynamic> json) {
    msg = json['Msg'];
    userId = json['UserId'];
    userType = json['UserType'];
    designationName = json['DesignationName'];
    userCode = json['UserCode'];
    userName = json['UserName'];
    userEmailId = json['UserEmailId'];
    userMobileNo = json['UserMobileNo'];
    countryCode = json['CountryCode'];
    userPassword = json['UserPassword'];
    deviceId = json['DeviceId'];
    ipAddress = json['IpAddress'];
    dateOfEntry = json['DateOfEntry'];
    fCMTOKEN = json['FCMTOKEN'];
    profilePic = json['ProfilePic'];
    jsonToken = json['JsonToken'];
    userIsActive = json['UserIsActive'];
    filePath = json['filePath'];
    isApproved = json['IsApproved'];
    isBlocked = json['IsBlocked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Msg'] = this.msg;
    data['UserId'] = this.userId;
    data['UserType'] = this.userType;
    data['DesignationName'] = this.designationName;
    data['UserCode'] = this.userCode;
    data['UserName'] = this.userName;
    data['UserEmailId'] = this.userEmailId;
    data['UserMobileNo'] = this.userMobileNo;
    data['CountryCode'] = this.countryCode;
    data['UserPassword'] = this.userPassword;
    data['DeviceId'] = this.deviceId;
    data['IpAddress'] = this.ipAddress;
    data['DateOfEntry'] = this.dateOfEntry;
    data['FCMTOKEN'] = this.fCMTOKEN;
    data['ProfilePic'] = this.profilePic;
    data['JsonToken'] = this.jsonToken;
    data['UserIsActive'] = this.userIsActive;
    data['filePath'] = this.filePath;
    data['IsApproved'] = this.isApproved;
    data['IsBlocked'] = this.isBlocked;
    return data;
  }
}