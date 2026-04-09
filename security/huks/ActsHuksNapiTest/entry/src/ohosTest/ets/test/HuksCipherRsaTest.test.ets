import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libHuks from 'libhuks.so';

export default function HuksCipherRsaTest() {
  describe('HuksCipherRsaTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SecurityHuksNapiCipherRsa0100
     * @tc.number Security_HUKS_NAPI_Cipher_RSA_0100
     * @tc.desc   alg-RSA pur-ENCRYPT-DECRYPT size-4096 pad-OAEP dig-SHA384 mode-ECB.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SecurityHuksNapiCipherRsa0100', Level.LEVEL1, async () => {
      try {
        const result = await libHuks.HuksCipherRsaTestAsync(0);
        expect(result).assertEqual(0);
      } catch (error) {
        expect(error).assertEqual(0);
      }
    })
  })
}
