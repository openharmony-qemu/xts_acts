import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level }
    from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Utils from './Utils.test';
import nativeFunc from 'libentry.so';

export default function scrollTest() {
  describe('scrollTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    });

    /**
     * @tc.name TestArkWeb_RegisterScrollCallback
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_REGISTER_SCROLL_CALLBACK_0046
     * @tc.desc Test OH_ArkWeb_RegisterScrollCallback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWeb_RegisterScrollCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWeb_RegisterScrollCallback()).assertEqual(-1);
        done();
      });

  });
}
