import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libHuks from 'libhuks.so';

export default function HuksCipherAesTest() {
  describe('HuksCipherAesTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    
    /**
     * @tc.name   SecurityHuksNapiCipherAes0100
     * @tc.number Security_HUKS_NAPI_Cipher_AES_0100
     * @tc.desc   alg-AES pur-ENCRYPT&DECRYPT mod-CBC pad-NONE size-256.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SecurityHuksNapiCipherAes0100', Level.LEVEL0, () => {
      const result = libHuks.HuksCipherAesTest(0);
      expect(result).assertEqual(0);
    })
  })
}
