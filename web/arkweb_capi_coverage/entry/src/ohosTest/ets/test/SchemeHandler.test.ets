import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level }
    from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Utils from './Utils.test';
import nativeFunc from 'libentry.so';

export default function scheme_handlerTest() {
  describe('scheme_handlerTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    });

    /**
     * @tc.name TestArkWebSchemeHandler_SetUserData
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_SCHEME_HANDLER_SET_USER_DATA_0045
     * @tc.desc Test OH_ArkWebSchemeHandler_SetUserData
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebSchemeHandler_SetUserData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebSchemeHandler_SetUserData()).assertEqual(17100100);
        done();
      });

  });
}
