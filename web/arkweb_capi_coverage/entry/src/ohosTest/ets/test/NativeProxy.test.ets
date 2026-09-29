import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level }
    from '@ohos/hypium-dynamic';
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
     * @tc.name TestArkWeb_ProxyMethod_UserData
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_PROXY_METHOD_USER_DATA_5200
     * @tc.desc Test ArkWeb_ProxyMethod userData field declaration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWeb_ProxyMethod_UserData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWeb_ProxyMethod_UserData()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWeb_ControllerAPI_DeleteJavaScriptRegister
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_CONTROLLER_API_DELETE_JS_REGISTER_5300
     * @tc.desc Test ArkWeb_ControllerAPI deleteJavaScriptRegister field
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWeb_ControllerAPI_DeleteJavaScriptRegister', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWeb_ControllerAPI_DeleteJavaScriptRegister()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWeb_ControllerAPI_RegisterJavaScriptProxyEx
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_CONTROLLER_API_REGISTER_JS_PROXY_EX_5400
     * @tc.desc Test ArkWeb_ControllerAPI registerJavaScriptProxyEx field
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWeb_ControllerAPI_RegisterJavaScriptProxyEx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWeb_ControllerAPI_RegisterJavaScriptProxyEx()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWeb_WebMessagePortAPI_PostMessage
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_WEB_MESSAGE_PORT_API_POST_MESSAGE_5500
     * @tc.desc Test ArkWeb_WebMessagePortAPI postMessage field
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWeb_WebMessagePortAPI_PostMessage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWeb_WebMessagePortAPI_PostMessage()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWeb_WebMessageAPI_SetData
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_WEB_MESSAGE_API_SET_DATA_5600
     * @tc.desc Test ArkWeb_WebMessageAPI setData field
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWeb_WebMessageAPI_SetData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWeb_WebMessageAPI_SetData()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestNativeArkWeb_RegisterJavaScriptProxy
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_REGISTER_JAVA_SCRIPT_PROXY_5700
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
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_UNREGISTER_JAVA_SCRIPT_PROXY_5800
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
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_SET_JAVA_SCRIPT_PROXY_VALID_CALLBACK_5900
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
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_GET_JAVA_SCRIPT_PROXY_VALID_CALLBACK_6000
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
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_NATIVE_ARK_WEB_REGISTER_ASYNC_THREAD_JAVA_SCRIPT_PROXY_6100
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
