import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level }
    from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Utils from './Utils.test';
import nativeFunc from 'libentry.so';

export default function native_engineTest() {
  describe('native_engineTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    });

    /**
     * @tc.name TestNativeArkWeb_SetActiveWebEngineVersion
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_SET_ACTIVE_WEB_ENGINE_VERSION_0017
     * @tc.desc Test OH_NativeArkWeb_SetActiveWebEngineVersion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetActiveWebEngineVersion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        nativeFunc.TestNativeArkWeb_SetActiveWebEngineVersion();
        const version = nativeFunc.TestNativeArkWeb_GetActiveWebEngineVersion();
        expect(version == 0 || version == 1 || version == 2 || version == 3 || version == 99999).assertTrue();
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_GetActiveWebEngineVersion
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_GET_ACTIVE_WEB_ENGINE_VERSION_0018
     * @tc.desc Test OH_NativeArkWeb_GetActiveWebEngineVersion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_GetActiveWebEngineVersion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const version = nativeFunc.TestNativeArkWeb_GetActiveWebEngineVersion();
        expect(version == 0 || version == 1 || version == 2 || version == 3 || version == 99999).assertTrue();
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_IsActiveWebEngineEvergreen
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_IS_ACTIVE_WEB_ENGINE_EVERGREEN_0019
     * @tc.desc Test OH_NativeArkWeb_IsActiveWebEngineEvergreen
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_IsActiveWebEngineEvergreen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const evergreen = nativeFunc.TestNativeArkWeb_IsActiveWebEngineEvergreen();
        expect(evergreen == 0 || evergreen == 1).assertTrue();
        done();
      });

  });
}
