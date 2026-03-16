import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libHuks from 'libhuks.so';

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
     * @tc.name   SecurityHuksNapiSignVerifyEcc0100
     * @tc.number Security_HUKS_NAPI_SignVerify_ECC_0100
     * @tc.desc   alg-ECC pur-Sign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SecurityHuksNapiSignVerifyEcc0100', Level.LEVEL0, () => {
      const result = libHuks.HuksSignVerifyEccTest(0);
      expect(result).assertEqual(0);
    })
  })
}
