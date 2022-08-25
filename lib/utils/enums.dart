enum EndPoints {
  guruPhoneValidator,
  guruOTPValidator,
  staffAcademyCategoryAndBatch,
  customerListByBatchAndCategory,
  setCustomerAttendanceIn,
  getStaffAttendanceList,
  setStaffAttendanceOut,
  setStaffAttendanceIn,
  customerListForOut
}

extension EndPointsConfig on EndPoints {
  String get apiValue {
    switch (this) {
      case EndPoints.customerListByBatchAndCategory:
        return 'CustomerListByBatchAndCategory';
      case EndPoints.staffAcademyCategoryAndBatch:
        return 'StaffAcademyCategoryAndBatch';
      case EndPoints.getStaffAttendanceList:
        return 'GetStaffAttendanceList';
      case EndPoints.setStaffAttendanceOut:
        return 'SetStaffAttendanceOut';
      case EndPoints.setStaffAttendanceIn:
        return 'SetStaffAttendanceIn';
      case EndPoints.guruPhoneValidator:
        return 'GuruPhoneValidator';
      case EndPoints.guruOTPValidator:
        return 'GuruOTPValidator';
      case EndPoints.setCustomerAttendanceIn:
        return 'SetCustomerAttendanceIn';
      case EndPoints.customerListForOut:
        return 'CustomerListForOut';
    }
  }
}

enum SportType {
  Batch,
  Category,
}

extension SportTypeConfig on SportType {
  String get apiValue {
    switch (this) {
      case SportType.Batch:
        return 'Batch';
      case SportType.Category:
        return 'Category';
    }
  }
}
