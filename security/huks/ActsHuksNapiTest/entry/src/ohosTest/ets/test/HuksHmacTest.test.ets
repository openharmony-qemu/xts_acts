import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libHuks from 'libhuks.so';

export default function HuksHmacTest() {
  describe('HuksHmacTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    
    /**
     * @tc.name   SecurityHuksNapiHmacHmac0100
     * @tc.number Security_HUKS_NAPI_HMAC_hmac_0100
     * @tc.desc   alg-HMAC pur-MAC dig-SHA384.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SecurityHuksNapiHmacHmac0100', Level.LEVEL1, () => {
      const result = libHuks.HuksHmacTest(0);
      expect(result).assertEqual(0);
    })
    
    /**
     * @tc.name   SecurityHuksNapiHmacSm30100
     * @tc.number Security_HUKS_NAPI_HMAC_SM3_0100
     * @tc.desc   alg-HMAC pur-MAC dig-sm3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SecurityHuksNapiHmacSm30100', Level.LEVEL1, () => {
      const result = libHuks.HuksHmacTest(1);
      expect(result).assertEqual(0);
    })
  })
}
