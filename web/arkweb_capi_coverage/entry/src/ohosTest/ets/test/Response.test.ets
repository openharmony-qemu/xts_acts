import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level }
    from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Utils from './Utils.test';
import nativeFunc from 'libentry.so';

export default function responseTest() {
  describe('responseTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    });

    /**
     * @tc.name TestArkWebResponse_GetHeaderByName
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RESPONSE_GET_HEADER_BY_NAME_0044
     * @tc.desc Test OH_ArkWebResponse_GetHeaderByName
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebResponse_GetHeaderByName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebResponse_GetHeaderByName()).assertEqual(0);
        done();
      });

  });
}
