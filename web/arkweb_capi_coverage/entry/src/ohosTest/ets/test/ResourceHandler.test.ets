import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level }
    from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Utils from './Utils.test';
import nativeFunc from 'libentry.so';

export default function resource_handlerTest() {
  describe('resource_handlerTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    });

    /**
     * @tc.name TestArkWebResourceHandler_Destroy
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_HANDLER_DESTROY_0032
     * @tc.desc Test OH_ArkWebResourceHandler_Destroy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceHandler_Destroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceHandler_Destroy()).assertEqual(17100101);
        done();
      });

    /**
     * @tc.name TestArkWebResourceHandler_DidReceiveResponse
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_HANDLER_DID_RECEIVE_RESPONSE_0033
     * @tc.desc Test OH_ArkWebResourceHandler_DidReceiveResponse
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceHandler_DidReceiveResponse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceHandler_DidReceiveResponse()).assertEqual(17100101);
        done();
      });

    /**
     * @tc.name TestArkWebResourceHandler_DidReceiveData
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_HANDLER_DID_RECEIVE_DATA_0034
     * @tc.desc Test OH_ArkWebResourceHandler_DidReceiveData
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceHandler_DidReceiveData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceHandler_DidReceiveData()).assertEqual(17100101);
        done();
      });

    /**
     * @tc.name TestArkWebResourceHandler_DidFinish
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESOURCE_HANDLER_DID_FINISH_0035
     * @tc.desc Test OH_ArkWebResourceHandler_DidFinish
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResourceHandler_DidFinish', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResourceHandler_DidFinish()).assertEqual(17100101);
        done();
      });

  });
}
