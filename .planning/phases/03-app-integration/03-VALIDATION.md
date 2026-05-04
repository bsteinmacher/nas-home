# Phase 3 Validation: App Integration & UI Refinement

## Validation Requirements

### VR-03-01: Secure Key Storage
- **Requirement:** Sensitive API keys must be encrypted at rest on the mobile device.
- **Test Case:**
  1. Sync configuration with the Registry.
  2. Verify that keys are not present in `SharedPreferences` XML/Plist files.
  3. Verify that keys can be successfully read by the app via `SecureStorageService`.

### VR-03-02: Seamless Discovery Sync
- **Requirement:** User must be able to sync all service keys with a single button click using only the Registry Token.
- **Test Case:**
  1. Clear all service keys from the app.
  2. Enter valid NAS URL and Registry Token in Settings.
  3. Click "RUN AUTO DISCOVERY SYNC".
  4. Verify that Lidarr and Seerr functionality becomes active without manual key entry.

### VR-03-03: Error Resilience
- **Requirement:** The app must handle invalid tokens or network issues gracefully.
- **Test Case:**
  1. Enter an invalid Registry Token.
  2. Click Sync.
  3. Verify that an appropriate error message (e.g., "Unauthorized" or "Sync Failed") is displayed.
  4. Verify that existing keys (if any) are not corrupted.

## Testing Strategy

### Automated Tests
- **SecureStorageService Tests:** Verify that writing/reading values works as expected (using mocks for FlutterSecureStorage).
- **RegistryRepository Tests:** Verify that it correctly parses Registry response and calls SecureStorage for each key.

### Manual Verification (UAT)
1. **Initial Setup:** Install app on a fresh device/emulator.
2. **Connectivity:** Ensure phone can reach the NAS Registry (via local network or VPN).
3. **The Sync:** Perform the "Auto Discovery Sync".
4. **End-to-End Functional Check:**
   - Search for an artist in Lidarr.
   - Search for a movie in Seerr.
   - Both should work immediately after sync.

## Success Sign-off
- [ ] Secure storage implemented and used for all API keys.
- [ ] Sync button correctly updates the app's internal configuration.
- [ ] No sensitive data stored in plain-text `shared_preferences`.
- [ ] UI provides feedback for all sync states (loading, success, error).
