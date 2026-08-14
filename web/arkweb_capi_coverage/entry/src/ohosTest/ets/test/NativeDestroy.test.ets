import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level }
    from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Utils from './Utils.test';
import nativeFunc from 'libentry.so';

export default function native_destroyTest() {
  describe('native_destroyTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    });

    /**
     * @tc.name TestNativeArkWeb_SetDestroyCallback
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_SET_DESTROY_CALLBACK_0015
     * @tc.desc Test OH_NativeArkWeb_SetDestroyCallback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetDestroyCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_SetDestroyCallback()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_GetDestroyCallback
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_GET_DESTROY_CALLBACK_0016
     * @tc.desc Test OH_NativeArkWeb_GetDestroyCallback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_GetDestroyCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_GetDestroyCallback()).assertEqual(-1);
        done();
      });

  });
}
