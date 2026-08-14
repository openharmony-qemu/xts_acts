import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level }
    from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Utils from './Utils.test';
import nativeFunc from 'libentry.so';

export default function native_blanklessTest() {
  describe('native_blanklessTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessLoadingWithKey
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_SET_BLANKLESS_LOADING_WITH_KEY_0010
     * @tc.desc Test OH_NativeArkWeb_SetBlanklessLoadingWithKey
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessLoadingWithKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        const result = nativeFunc.TestNativeArkWeb_SetBlanklessLoadingWithKey();
        expect(result == 0 || result == -1 || result == -2 || result == -3 || result == -4 ||
          result == -5 || result == 801).assertTrue();
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_ClearBlanklessLoadingCache
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_CLEAR_BLANKLESS_LOADING_CACHE_0011
     * @tc.desc Test OH_NativeArkWeb_ClearBlanklessLoadingCache
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_ClearBlanklessLoadingCache', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_ClearBlanklessLoadingCache()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_GetBlanklessInfoWithKey
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_GET_BLANKLESS_INFO_WITH_KEY_0012
     * @tc.desc Test OH_NativeArkWeb_GetBlanklessInfoWithKey
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_GetBlanklessInfoWithKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_GetBlanklessInfoWithKey()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetBlanklessLoadingCacheCapacity
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_SET_BLANKLESS_LOADING_CACHE_CAPACITY_0013
     * @tc.desc Test OH_NativeArkWeb_SetBlanklessLoadingCacheCapacity
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetBlanklessLoadingCacheCapacity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_SetBlanklessLoadingCacheCapacity()).assertEqual(0);
        done();
      });

  });
}
