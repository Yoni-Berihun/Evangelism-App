# Frontend Refactoring Summary

## Overview
This document summarizes the refactoring work done to align the Flutter frontend with the FastAPI backend structure.

## Completed Changes

### 1. API Constants (`lib/core/constants/api_constants.dart`)
- ✅ Updated all endpoints to include `/v1` prefix
- ✅ Added refresh token endpoint
- ✅ Updated endpoint paths to match backend structure

### 2. Models Updated
- ✅ **User Model**: Updated to match backend schema
  - Changed `fullName` to use `full_name` JSON key
  - Added `isActive` field (from `is_active`)
  - Changed `createdAt` to string format (ISO 8601)
  - Removed `profilePictureUrl` and `updatedAt` (not in backend response)

- ✅ **Mission Model**: Completely restructured
  - Changed `missionName` → `name`
  - Changed `location` from String → `Map<String, dynamic>?` (JSON object)
  - Removed `latitude`, `longitude`, `teamName`, `assignedMissionaryId`, `assignedMissionaryName`
  - Changed date fields to optional strings (ISO 8601 format)
  - Added `createdBy`, `deletedAt`, `updatedAt` fields

- ✅ **Expense Model**: Updated structure
  - Changed `category` from enum → `String`
  - Made `missionId` optional (can be account-level expenses)
  - Removed `userName`, `date` fields
  - Changed `createdAt` to string format
  - Added `updatedAt`, `deletedAt` fields

- ✅ **OutreachData Model**: Restructured
  - Changed from tracking `soulsSaved`, `baptisms`, `testimonies`
  - Now tracks individual contacts: `fullName`, `phoneNumber`, `status`
  - Added `createdByUserId`, `deletedAt`, `updatedAt` fields

- ✅ **OutreachNumber Model**: Restructured
  - Changed from `soulsSaved`, `baptisms` → `interested`, `heared`, `saved`
  - Added `accountId`, `deletedAt`, `updatedAt` fields

### 3. API Client (`lib/data/api/api_client.dart`)
- ✅ Updated to handle both `access_token` and `refresh_token`
- ✅ Added automatic token refresh on 401 errors
- ✅ Updated token storage keys

### 4. API Services Updated
- ✅ **AuthApi**: 
  - Updated endpoints to use `/v1/auth/*`
  - Handles `AuthResponse` structure with nested `user` object
  - Stores both access and refresh tokens

- ✅ **MissionApi**:
  - Updated to use `/v1/missions`
  - Changed query parameters to match backend (`account_id`, `skip`, `limit`)
  - Updated create/update to accept `Map<String, dynamic>` instead of Mission objects

- ✅ **ExpenseApi**:
  - Updated to use `/v1/expenses`
  - Made `missionId` optional in queries
  - Updated create/update to accept `Map<String, dynamic>`

- ✅ **OutreachApi**:
  - Updated to use `/v1/outreach/data` and `/v1/outreach/numbers`
  - `getOutreachNumbers` now returns single object or null (not list)
  - Added `createOrUpdateOutreachNumbers` method

### 5. Repositories Updated
- ✅ All repositories updated to pass `Map<String, dynamic>` for create/update operations
- ✅ Updated method signatures to match new API structure

### 6. Providers Updated
- ✅ **AuthProvider**: Updated token storage key from `auth_token` → `access_token`
- ✅ **MissionProvider**: Updated to use new API structure
- ✅ **ExpenseProvider**: Updated to handle optional `missionId`
- ✅ **OutreachProvider**: Updated to work with new outreach structure

### 7. UI Files Updated
- ✅ **MissionDetailCard**: Updated to use `name` instead of `missionName`, handle location as JSON
- ✅ **AdminAddMissionScreen**: Updated to create missions with correct structure
- ✅ **MissionaryHomeScreen**: Updated to use `name` and outreach numbers
- ✅ **MissionaryLogExpenseScreen**: Changed from enum to string category
- ✅ **MissionaryLogImpactScreen**: Updated to use outreach numbers API

## Remaining Work

### 1. Model File Generation
- ⚠️ Need to run `flutter pub run build_runner build --delete-conflicting-outputs` to regenerate freezed/json_serializable files

### 2. UI Files That May Need Updates
The following files may still reference old model fields and need review:
- `lib/ui/admin/admin_analysis_screen.dart` - May reference old mission/expense fields
- `lib/ui/admin/admin_expense_details_screen.dart` - Uses ExpenseCategory enum
- `lib/ui/missionary/missionary_analysis_screen.dart` - May reference old outreach fields
- `lib/ui/widgets/filter_bar.dart` - May need updates for new filter structure
- `lib/ui/widgets/map_marker.dart` - May need updates for location handling

### 3. Account ID Handling
- ⚠️ Currently using hardcoded `'default_account_id'` in `auth_provider.dart`
- Need to implement proper account selection/retrieval from backend

### 4. Error Handling
- Consider adding better error messages for API failures
- Add retry logic for failed requests

### 5. Date Handling
- Many UI files parse date strings - ensure consistent date parsing
- Consider creating a date utility helper

### 6. Location Handling
- Mission location is now JSON - update all UI that displays/edits location
- Consider creating a location utility helper

## Testing Checklist

- [ ] Login/Register flow
- [ ] Mission creation/editing
- [ ] Expense logging
- [ ] Outreach data entry
- [ ] Outreach numbers tracking
- [ ] Token refresh on 401 errors
- [ ] All screens render correctly with new data structure

## Notes

1. **Backend Endpoint Structure**: All endpoints now use `/api/v1/*` prefix
2. **Authentication**: Uses JWT with access and refresh tokens
3. **Data Format**: Dates are ISO 8601 strings, locations are JSON objects
4. **Outreach Tracking**: Split into individual contacts (OutreachData) and aggregated numbers (OutreachNumbers)

## Next Steps

1. Run build_runner to regenerate model files
2. Test all API endpoints
3. Update remaining UI files that reference old model fields
4. Implement proper account management
5. Add comprehensive error handling
6. Test on both iOS and Android
