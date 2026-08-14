import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level }
    from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Utils from './Utils.test';
import nativeFunc from 'libentry.so';

export default function request_headerTest() {
  describe('request_headerTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    });

    /**
     * @tc.name TestArkWebRequestHeaderList_Destroy
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_REQUEST_HEADER_LIST_DESTROY_0030
     * @tc.desc Test OH_ArkWebRequestHeaderList_Destroy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebRequestHeaderList_Destroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebRequestHeaderList_Destroy()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWebRequestHeaderList_GetHeader
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_REQUEST_HEADER_LIST_GET_HEADER_0031
     * @tc.desc Test OH_ArkWebRequestHeaderList_GetHeader
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebRequestHeaderList_GetHeader', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebRequestHeaderList_GetHeader()).assertEqual(0);
        done();
      });

  });
}
