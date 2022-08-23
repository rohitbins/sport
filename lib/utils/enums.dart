enum EndPoints {
  staffAcademyCategoryAndBatch,
  customerListByBatchAndCategory,
}

extension EndPointsConfig on EndPoints {
  String get apiValue {
    switch (this) {
      case EndPoints.customerListByBatchAndCategory:
        return 'CustomerListByBatchAndCategory';
      case EndPoints.staffAcademyCategoryAndBatch:
        return 'StaffAcademyCategoryAndBatch';
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
