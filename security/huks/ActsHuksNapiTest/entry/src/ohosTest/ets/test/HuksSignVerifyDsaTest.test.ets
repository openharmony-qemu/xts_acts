import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libHuks from 'libhuks.so';

export default function HuksSignVerifyDsaTest() {
  describe('HuksSignVerifyDsaTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SecurityHuksNapiSignVerifyDsa0100
     * @tc.number Security_HUKS_NAPI_SignVerify_DSA_0100
     * @tc.desc   alg-DSA pur-Sign-verify dig-SHA1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SecurityHuksNapiSignVerifyDsa0100', Level.LEVEL0, () => {
      const result = libHuks.HuksSignVerifyDsaTest(0);
      expect(result).assertEqual(0);
    })
  })
}
