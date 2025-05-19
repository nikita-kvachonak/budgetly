enum ExpenseCategory {
  food,
  entertainment,
  transport,
  travel,
  clothing,
  utilities,
  education,
  healthcare,
  pets,
  other,
}

extension ExpenseCategoryExt on ExpenseCategory {
  String get label {
    switch (this) {
      case ExpenseCategory.food: return 'Food';
      case ExpenseCategory.entertainment: return 'Entertainment';
      case ExpenseCategory.transport: return 'Transport';
      case ExpenseCategory.travel: return 'Travel';
      case ExpenseCategory.clothing: return 'Clothing';
      case ExpenseCategory.utilities: return 'Utilities';
      case ExpenseCategory.education: return 'Education';
      case ExpenseCategory.healthcare: return 'Healthcare';
      case ExpenseCategory.pets: return 'Pets';
      case ExpenseCategory.other: return 'Other';
    }
  }
}