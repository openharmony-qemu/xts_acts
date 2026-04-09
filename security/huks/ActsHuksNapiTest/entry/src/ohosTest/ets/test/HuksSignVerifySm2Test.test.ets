import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libHuks from 'libhuks.so';

export default function HuksSignVerifySm2Test() {
  describe('HuksSignVerifySm2Test', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SecurityHuksNapiSignVerifySm20100
     * @tc.number Security_HUKS_NAPI_SignVerify_SM2_0100
     * @tc.desc   normal parameter test case : alg-SM2, pur-Sign/Verify, keySize-256 and dig-SM3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SecurityHuksNapiSignVerifySm20100', Level.LEVEL0, () => {
      const result = libHuks.HuksSignVerifySm2Test(0);
      expect(result).assertEqual(0);
    })
  })
}
