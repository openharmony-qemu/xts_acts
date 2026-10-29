import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import mod from 'libstrtol_legacy_test.so';

export default function strtolLegacyTest() {
  describe('ActsStrtolLegacyTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   testMuslStrtolLegacy0100
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_0100
     * @tc.desc   scanf %b解析0b101返回5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_STRTOL_0100', 0, () => {
      expect(mod.Strtol_0100()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslStrtolLegacy0200
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_0200
     * @tc.desc   scanf %i解析0b101返回5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_STRTOL_0200', 0, () => {
      expect(mod.Strtol_0200()).assertEqual(0);
    })
  })
}
