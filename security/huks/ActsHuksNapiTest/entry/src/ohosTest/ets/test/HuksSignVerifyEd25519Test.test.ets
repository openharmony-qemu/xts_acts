import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libHuks from 'libhuks.so';

export default function HuksSignVerifyEd25519Test() {
  describe('HuksSignVerifyEd25519Test', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SecurityHuksNapiSignVerifyEd255190100
     * @tc.number Security_HUKS_NAPI_SignVerify_ED25519_0100
     * @tc.desc   alg-ED25519 pur-Sign.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SecurityHuksNapiSignVerifyEd255190100', Level.LEVEL0, () => {
      const result = libHuks.HuksSignVerifyEd25519Test(0);
      expect(result).assertEqual(0);
    })
  })
}
