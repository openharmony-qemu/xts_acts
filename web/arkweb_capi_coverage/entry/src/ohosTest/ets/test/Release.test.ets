import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level }
    from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Utils from './Utils.test';
import nativeFunc from 'libentry.so';

export default function releaseTest() {
  describe('releaseTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(500);
      done();
    });

    /**
     * @tc.name TestArkWeb_ReleaseString
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RELEASE_STRING_0028
     * @tc.desc Test OH_ArkWeb_ReleaseString
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWeb_ReleaseString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWeb_ReleaseString()).assertEqual(0);
        done();
      });

    /**
     * @tc.name TestArkWeb_ReleaseByteArray
     * @tc.number SUB_WEB_ARKWEB_CAPI_TEST_ARK_WEB_RELEASE_BYTE_ARRAY_0029
     * @tc.desc Test OH_ArkWeb_ReleaseByteArray
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('TestArkWeb_ReleaseByteArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        expect(nativeFunc.TestArkWeb_ReleaseByteArray()).assertEqual(0);
        done();
      });

  });
}
