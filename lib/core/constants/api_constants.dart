class ApiConstants {
  // Base URL - update this to match your backend server
  static const String baseUrl = 'https://09x20bsv-8000.uks1.devtunnels.ms/api';
  
  // Auth endpoints (v1)
  static const String login = '/v1/auth/login';
  static const String register = '/v1/auth/register';
  static const String me = '/v1/auth/me';
  static const String refresh = '/v1/auth/refresh';
  static const String logout = '/v1/auth/logout';
  static const String switchAccount = '/v1/auth/switch-account';
  
  // Account endpoints (v1)
  static const String accounts = '/v1/accounts/';
  static const String myAccounts = '/v1/users/accounts';
  
  // Mission endpoints (v1)
  static const String missions = '/v1/missions';
  
  // Outreach endpoints (v1)
  static const String outreachData = '/v1/outreach/data';
  static const String outreachNumbers = '/v1/outreach/numbers';
  
  // Expense endpoints (v1)
  static const String expenses = '/v1/expenses';
  
  // User endpoints (v1)
  static const String users = '/v1/users';
}

