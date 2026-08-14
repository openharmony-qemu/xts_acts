import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level }
    from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Utils from './Utils.test';
import nativeFunc from 'libentry.so';

export default function native_jsTest() {
  describe('native_jsTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    });

    /**
     * @tc.name TestNativeArkWeb_RunJavaScript
     * @tc.number SUB_ARkWEB_CAPI_TestNativeArkWeb_RunJavaScript
     * @tc.desc Test OH_NativeArkWeb_RunJavaScript
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestNativeArkWeb_RunJavaScript', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestNativeArkWeb_RunJavaScript()).assertEqual(0);
        done();
      });

  });
}
