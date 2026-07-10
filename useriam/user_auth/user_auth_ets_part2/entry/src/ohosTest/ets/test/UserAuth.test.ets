import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { userAuth } from '@kit.UserAuthenticationKit';

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
  })
}