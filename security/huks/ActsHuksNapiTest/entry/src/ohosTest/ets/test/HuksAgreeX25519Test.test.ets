import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libHuks from 'libhuks.so';

export default function HuksAgreeX25519Test() {
  describe('HuksAgreeX25519Test', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    
    /**
     * @tc.name   SecurityHuksNapiAgreeX255190100
     * @tc.number Security_HUKS_NAPI_Agree_X25519_0100
     * @tc.desc   alg-x25519, pur-AGREE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SecurityHuksNapiAgreeX255190100', Level.LEVEL1, () => {
      const result = libHuks.HuksAgreeX25519Test(0);
      expect(result).assertEqual(0);
    })
  })
}
