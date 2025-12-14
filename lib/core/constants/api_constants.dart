class ApiConstants {
  // Base URL - update this to match your backend server
  static const String baseUrl = 'http://localhost:8000/api';
  
  // Auth endpoints (v1)
  static const String login = '/v1/auth/login';
  static const String register = '/v1/auth/register';
  static const String me = '/v1/auth/me';
  static const String refresh = '/v1/auth/refresh';
  static const String logout = '/v1/auth/logout';
  
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

