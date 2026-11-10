import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import huksndk from 'libhuksndk.so';

export default function HuksSignVerifyEccTest() {
  describe('HuksSignVerifyEccTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    
    /**
     * @tc.name   SUB_SECURITY_HUKS_NAPI_SIGN_VERIFY_ECC_0100
     * @tc.number SUB_SECURITY_HUKS_NAPI_SIGN_VERIFY_ECC_0100
     * @tc.desc   alg-ECC pur-Sign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_SECURITY_HUKS_NAPI_SIGN_VERIFY_ECC_0100', Level.LEVEL0, () => {
      const result = huksndk.HuksSignVerifyEccTest(0);
      expect(result).assertEqual(0);
    })
  })
}
