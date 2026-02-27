import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libHuks from 'libhuks.so';

export default function HuksNullptrTest() {
  describe('HuksNullptrTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })
    
    /**
     * @tc.name   SecurityHuksNapiNullptr0100
     * @tc.number Security_HUKS_NAPI_nullptr_0100
     * @tc.desc   use nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SecurityHuksNapiNullptr0100', Level.LEVEL0, () => {
      const result = libHuks.HuksNullptrTest(0);
      expect(result).assertEqual(0);
    })
  })
}
