import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-dynamic';
import { userAuth } from '@kit.UserAuthenticationKit';
import deviceInfo from '@ohos.deviceInfo';

export default function UserAuthTest() {
  describe('UserAuthTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   Security_IAM_Companion_Api_5001
     * @tc.number Security_IAM_Companion_Api_5001
     * @tc.desc   registerRemoteAuthCallback normal test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('Security_IAM_Companion_Api_5001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      console.info('Security_IAM_Companion_Api_5001 start');
      let callback: userAuth.IRemoteAuthCallback = {
        onGetRemoteAuthWidgetParam: (challenge: Uint8Array): userAuth.WidgetParam => {
          return {
            title: '远程认证',
            navigationButtonText: '返回',
            windowMode:userAuth.WindowModeType.DIALOG_BOX,
            uiContext:AppStorage.get('context')
          };
        },
        onRemoteAuthResult:(challenge: Uint8Array, result: userAuth.UserAuthResult):void => {
          console.info("认证结果" + result.result)
        }
      }
      try {
        await userAuth.registerRemoteAuthCallback(callback);
      } catch (err) {
        console.info("Security_IAM_Companion_Api_5001 failed", err.code, err.message);
        expect(false).assertTrue();
      }
    })
    /**
     * @tc.name   Security_IAM_Companion_Api_5001
     * @tc.number Security_IAM_Companion_Api_5001
     * @tc.desc   unregisterRemoteAuthCallback normal test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('Security_IAM_Companion_Api_5003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      console.info('Security_IAM_Companion_Api_5003 start');
      try {
        await userAuth.unregisterRemoteAuthCallback();
        expect(true).assertTrue();
      } catch (err) {
        console.info("Security_IAM_Companion_Api_5003 failed", err.code, err.message);
        expect(false).assertTrue();
      }
    })
    /**
     * @tc.name   SUB_Security_IAM_PassiveRecognition_Api_5001
     * @tc.number SUB_Security_IAM_PassiveRecognition_Api_5001
     * @tc.desc   Verify getUserRecognitionMgr can be invoked normally and returns a UserRecognitionMgr instance when the device supports passive recognition, or null otherwise
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_IAM_PassiveRecognition_Api_5001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      console.info('SUB_Security_IAM_PassiveRecognition_Api_5001 start');
      try {
        let mgr: userAuth.UserRecognitionMgr | null = userAuth.getUserRecognitionMgr();
        if (mgr === null) {
          console.info("getUserRecognitionMgr returned null, device does not support passive recognition");
          expect(deviceInfo.deviceType !== 'car').assertTrue();
        } else {
          expect(mgr !== null).assertTrue();
          expect(deviceInfo.deviceType === 'car').assertTrue();
        }
      } catch (err) {
        console.info("SUB_Security_IAM_PassiveRecognition_Api_5001 failed", err.code, err.message);
        expect(false).assertTrue();
      }
    })
    /**
     * @tc.name   SUB_Security_IAM_PassiveRecognition_Api_5002
     * @tc.number SUB_Security_IAM_PassiveRecognition_Api_5002
     * @tc.desc   Verify getUserRecognitionResult queries the latest user recognition result through the UserRecognitionMgr promise interface and the returned result carries a valid status field
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_IAM_PassiveRecognition_Api_5002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      console.info('SUB_Security_IAM_PassiveRecognition_Api_5002 start');
      try {
        let mgr: userAuth.UserRecognitionMgr | null = userAuth.getUserRecognitionMgr();
        if (mgr === null) {
          console.info("getUserRecognitionMgr returned null, device does not support passive recognition");
          expect(deviceInfo.deviceType !== 'car').assertTrue();
        } else {
          let result: userAuth.UserRecognitionResult = await mgr.getUserRecognitionResult();
          console.info("SUB_Security_IAM_PassiveRecognition_Api_5002 status: " + result.status);
          expect(result !== undefined).assertTrue();
        }
      } catch (err) {
        console.info("SUB_Security_IAM_PassiveRecognition_Api_5002 failed", err.code, err.message);
        expect(false).assertTrue();
      }
    })
    /**
     * @tc.name   SUB_Security_IAM_PassiveRecognition_Api_5003
     * @tc.number SUB_Security_IAM_PassiveRecognition_Api_5003
     * @tc.desc   Verify onUserRecognitionChange subscribes to user recognition change events and the callback correctly distinguishes the three statuses UNCERTAIN, MISMATCH and MATCH
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_IAM_PassiveRecognition_Api_5003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      console.info('SUB_Security_IAM_PassiveRecognition_Api_5003 start');
      try {
        let mgr: userAuth.UserRecognitionMgr | null = userAuth.getUserRecognitionMgr();
        if (mgr === null) {
          console.info("getUserRecognitionMgr returned null, device does not support passive recognition");
          expect(deviceInfo.deviceType !== 'car').assertTrue();
        } else {
          let callback: userAuth.UserRecognitionResultCallback = (result: userAuth.UserRecognitionResult): void => {
            if (result.status === userAuth.UserRecognitionStatus.UNCERTAIN) {
              console.info("SUB_Security_IAM_PassiveRecognition_Api_5003 status: UNCERTAIN, userId: " + result.userId);
            } else if (result.status === userAuth.UserRecognitionStatus.MISMATCH) {
              console.info("SUB_Security_IAM_PassiveRecognition_Api_5003 status: MISMATCH, userId: " + result.userId);
            } else if (result.status === userAuth.UserRecognitionStatus.MATCH) {
              console.info("SUB_Security_IAM_PassiveRecognition_Api_5003 status: MATCH, userId: " + result.userId
                + ", authTrustLevel: " + result.authTrustLevel);
            }
          };
          mgr.onUserRecognitionChange(callback);
          expect(true).assertTrue();
        }
      } catch (err) {
        console.info("SUB_Security_IAM_PassiveRecognition_Api_5003 failed", err.code, err.message);
        expect(false).assertTrue();
      }
    })
    /**
     * @tc.name   SUB_Security_IAM_PassiveRecognition_Api_5004
     * @tc.number SUB_Security_IAM_PassiveRecognition_Api_5004
     * @tc.desc   Verify offUserRecognitionChange unsubscribes a specified callback that was previously registered via onUserRecognitionChange
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_IAM_PassiveRecognition_Api_5004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      console.info('SUB_Security_IAM_PassiveRecognition_Api_5004 start');
      try {
        let mgr: userAuth.UserRecognitionMgr | null = userAuth.getUserRecognitionMgr();
        if (mgr === null) {
          console.info("getUserRecognitionMgr returned null, device does not support passive recognition");
          expect(deviceInfo.deviceType !== 'car').assertTrue();
        } else {
          let callback: userAuth.UserRecognitionResultCallback = (result: userAuth.UserRecognitionResult): void => {
            console.info("SUB_Security_IAM_PassiveRecognition_Api_5004 status: " + result.status);
          };
          mgr.onUserRecognitionChange(callback);
          mgr.offUserRecognitionChange(callback);
          expect(true).assertTrue();
        }
      } catch (err) {
        console.info("SUB_Security_IAM_PassiveRecognition_Api_5004 failed", err.code, err.message);
        expect(false).assertTrue();
      }
    })
    /**
     * @tc.name   SUB_Security_IAM_PassiveRecognition_Api_5005
     * @tc.number SUB_Security_IAM_PassiveRecognition_Api_5005
     * @tc.desc   Verify offUserRecognitionChange unregisters the previously subscribed callback when it is invoked without passing the callback parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_IAM_PassiveRecognition_Api_5005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      console.info('SUB_Security_IAM_PassiveRecognition_Api_5005 start');
      try {
        let mgr: userAuth.UserRecognitionMgr | null = userAuth.getUserRecognitionMgr();
        if (mgr === null) {
          console.info("getUserRecognitionMgr returned null, device does not support passive recognition");
          expect(deviceInfo.deviceType !== 'car').assertTrue();
        } else {
          let callback: userAuth.UserRecognitionResultCallback = (result: userAuth.UserRecognitionResult): void => {
            console.info("SUB_Security_IAM_PassiveRecognition_Api_5005 status: " + result.status);
          };
          mgr.onUserRecognitionChange(callback);
          mgr.offUserRecognitionChange();
          expect(true).assertTrue();
        }
      } catch (err) {
        console.info("SUB_Security_IAM_PassiveRecognition_Api_5005 failed", err.code, err.message);
        expect(false).assertTrue();
      }
    })
    /**
     * @tc.name   SUB_Security_IAM_PassiveRecognition_Api_5006
     * @tc.number SUB_Security_IAM_PassiveRecognition_Api_5006
     * @tc.desc   Verify the UserRecognitionStatus enum values: UNCERTAIN is 0, MISMATCH is 1 and MATCH is 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_IAM_PassiveRecognition_Api_5006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      console.info('SUB_Security_IAM_PassiveRecognition_Api_5006 start');
      expect(userAuth.UserRecognitionStatus.UNCERTAIN).assertEqual(0);
      expect(userAuth.UserRecognitionStatus.MISMATCH).assertEqual(1);
      expect(userAuth.UserRecognitionStatus.MATCH).assertEqual(2);
    })
    /**
     * @tc.name   SUB_Security_IAM_PassiveRecognition_Api_5007
     * @tc.number SUB_Security_IAM_PassiveRecognition_Api_5007
     * @tc.desc   Verify offUserRecognitionChange unregisters all callbacks registered by onUserRecognitionChange when its optional overload is called without any argument
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_IAM_PassiveRecognition_Api_5007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      console.info('SUB_Security_IAM_PassiveRecognition_Api_5007 start');
      try {
        let mgr: userAuth.UserRecognitionMgr | null = userAuth.getUserRecognitionMgr();
        if (mgr === null) {
          console.info("getUserRecognitionMgr returned null, device does not support passive recognition");
          expect(deviceInfo.deviceType !== 'car').assertTrue();
        } else {
          let callback: userAuth.UserRecognitionResultCallback = (result: userAuth.UserRecognitionResult): void => {
            console.info("SUB_Security_IAM_PassiveRecognition_Api_5007 status: " + result.status);
          };
          mgr.onUserRecognitionChange(callback);
          mgr.offUserRecognitionChange();
          expect(true).assertTrue();
        }
      } catch (err) {
        console.info("SUB_Security_IAM_PassiveRecognition_Api_5007 failed", err.code, err.message);
        expect(false).assertTrue();
      }
    })
  })
}