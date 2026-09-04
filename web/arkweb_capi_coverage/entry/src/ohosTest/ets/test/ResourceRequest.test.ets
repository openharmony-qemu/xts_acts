import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level }
    from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Utils from './Utils.test';
import nativeFunc from 'libentry.so';

export default function resource_requestTest() {
  describe('resource_requestTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    });

    /**
     * @tc.name TestArkWebResourceRequest_SetUserData
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_REQUEST_SET_USER_DATA_0036
     * @tc.desc Test OH_ArkWebResourceRequest_SetUserData
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_SetUserData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_SetUserData()).assertEqual(17100100);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetMethod
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_REQUEST_GET_METHOD_0037
     * @tc.desc Test OH_ArkWebResourceRequest_GetMethod
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetMethod()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetUrl
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_REQUEST_GET_URL_0038
     * @tc.desc Test OH_ArkWebResourceRequest_GetUrl
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetUrl()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetResourceType
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_REQUEST_GET_RESOURCE_TYPE_0039
     * @tc.desc Test OH_ArkWebResourceRequest_GetResourceType
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetResourceType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetResourceType()).assertEqual(-1);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetFrameUrl
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_REQUEST_GET_FRAME_URL_0040
     * @tc.desc Test OH_ArkWebResourceRequest_GetFrameUrl
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetFrameUrl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetFrameUrl()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_Destroy
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_REQUEST_DESTROY_0041
     * @tc.desc Test OH_ArkWebResourceRequest_Destroy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_Destroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_Destroy()).assertEqual(17100100);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetReferrer
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_REQUEST_GET_REFERRER_0042
     * @tc.desc Test OH_ArkWebResourceRequest_GetReferrer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetReferrer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetReferrer()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebResourceRequest_GetRequestHeaders
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_REQUEST_GET_REQUEST_HEADERS_0043
     * @tc.desc Test OH_ArkWebResourceRequest_GetRequestHeaders
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceRequest_GetRequestHeaders', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceRequest_GetRequestHeaders()).assertEqual(0);
        done();
      });

  });
}
