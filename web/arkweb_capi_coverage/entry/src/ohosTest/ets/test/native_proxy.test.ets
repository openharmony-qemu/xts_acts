import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level }
    from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Utils from './Utils.test';
import nativeFunc from 'libentry.so';

export default function native_proxyTest() {
  describe('native_proxyTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    });

    /**
     * @tc.name TestNativeArkWeb_RegisterJavaScriptProxy
     * @tc.number SUB_ARkWEB_CAPI_TestNativeArkWeb_RegisterJavaScriptProxy
     * @tc.desc Test OH_NativeArkWeb_RegisterJavaScriptProxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_RegisterJavaScriptProxy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_RegisterJavaScriptProxy()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_UnregisterJavaScriptProxy
     * @tc.number SUB_ARkWEB_CAPI_TestNativeArkWeb_UnregisterJavaScriptProxy
     * @tc.desc Test OH_NativeArkWeb_UnregisterJavaScriptProxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_UnregisterJavaScriptProxy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_UnregisterJavaScriptProxy()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_SetJavaScriptProxyValidCallback
     * @tc.number SUB_ARkWEB_CAPI_TestNativeArkWeb_SetJavaScriptProxyValidCallback
     * @tc.desc Test OH_NativeArkWeb_SetJavaScriptProxyValidCallback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_SetJavaScriptProxyValidCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_SetJavaScriptProxyValidCallback()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_GetJavaScriptProxyValidCallback
     * @tc.number SUB_ARkWEB_CAPI_TestNativeArkWeb_GetJavaScriptProxyValidCallback
     * @tc.desc Test OH_NativeArkWeb_GetJavaScriptProxyValidCallback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_GetJavaScriptProxyValidCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_GetJavaScriptProxyValidCallback()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_RegisterAsyncThreadJavaScriptProxy
     * @tc.number SUB_ARkWEB_CAPI_TestNativeArkWeb_RegisterAsyncThreadJavaScriptProxy
     * @tc.desc Test OH_NativeArkWeb_RegisterAsyncThreadJavaScriptProxy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_RegisterAsyncThreadJavaScriptProxy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_RegisterAsyncThreadJavaScriptProxy()).assertEqual(0);
        done();
      });

  });
}
