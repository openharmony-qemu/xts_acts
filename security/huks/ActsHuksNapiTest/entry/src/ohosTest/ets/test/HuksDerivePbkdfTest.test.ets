import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libHuks from 'libhuks.so';

export default function HuksDerivePbkdfTest() {
  describe('HuksDerivePbkdfTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    
    /**
     * @tc.name   SecurityHuksNapiDerivePbkdf0100
     * @tc.number Security_HUKS_NAPI_Derive_pbkdf_0100
     * @tc.desc   alg-PBKDF2 pur-Derive dig-SHA256.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SecurityHuksNapiDerivePbkdf0100', Level.LEVEL1, () => {
      const result = libHuks.HuksDerivePbkdfTest(0);
      expect(result).assertEqual(0);
    })
  })
}
