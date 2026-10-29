import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import mod from 'libisoc23_wcstol_test.so';

export default function isoc23WcstolTest() {
  describe('ActsIsoc23WcstolTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   testMuslIsoc23Wcstol0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0100
     * @tc.desc   宽字符base=0解析0b101成功返回5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0100', 0, () => {
      expect(mod.Isoc23Wcstol_0100()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstol0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0200
     * @tc.desc   宽字符仅前缀0b返回0并置EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0200', 0, () => {
      expect(mod.Isoc23Wcstol_0200()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstol0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0300
     * @tc.desc   宽字符解析-5成功返回-5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0300', 0, () => {
      expect(mod.Isoc23Wcstol_0300()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstol0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0400
     * @tc.desc   宽字符十进制溢出返回LONG_MAX并置ERANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0400', 0, () => {
      expect(mod.Isoc23Wcstol_0400()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstol0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0500
     * @tc.desc   宽字符base=1非法返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0500', 0, () => {
      expect(mod.Isoc23Wcstol_0500()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstol0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0600
     * @tc.desc   宽字符解析42abc返回42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0600', 0, () => {
      expect(mod.Isoc23Wcstol_0600()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstol0700
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0700
     * @tc.desc   宽字符解析abc返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0700', 0, () => {
      expect(mod.Isoc23Wcstol_0700()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstol0800
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0800
     * @tc.desc   宽字符重复解析0b101返回5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0800', 0, () => {
      expect(mod.Isoc23Wcstol_0800()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstol0900
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0900
     * @tc.desc   宽字符base=1非法返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOL_0900', 0, () => {
      expect(mod.Isoc23Wcstol_0900()).assertEqual(0);
    })
  })
}
