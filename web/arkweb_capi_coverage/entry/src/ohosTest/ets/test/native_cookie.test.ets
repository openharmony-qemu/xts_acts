import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level }
    from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Utils from './Utils.test';
import nativeFunc from 'libentry.so';

export default function native_cookieTest() {
  describe('native_cookieTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    });

    /**
     * @tc.name TestArkWebCookieManager_SaveCookieAsync
     * @tc.number SUB_ARkWEB_CAPI_TestArkWebCookieManager_SaveCookieAsync
     * @tc.desc Test OH_ArkWebCookieManager_SaveCookieAsync
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWebCookieManager_SaveCookieAsync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWebCookieManager_SaveCookieAsync()).assertEqual(0);
        done();
      });

  });
}
