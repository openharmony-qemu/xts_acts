import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libHuks from 'libhuks.so';

export default function HuksCipherSm4Test() {
  describe('HuksCipherSm4Test', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    
    /**
     * @tc.name   SecurityHuksNapiCipherSm40100
     * @tc.number Security_HUKS_NAPI_Cipher_SM4_0100
     * @tc.desc   alg-SM4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SecurityHuksNapiCipherSm40100', Level.LEVEL0, () => {
      const result = libHuks.HuksCipherSm4Test(0);
      expect(result).assertEqual(0);
    })
  })
}
