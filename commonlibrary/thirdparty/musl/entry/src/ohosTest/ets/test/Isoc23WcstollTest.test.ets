import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import mod from 'libisoc23_wcstoll_test.so';

export default function isoc23WcstollTest() {
  describe('ActsIsoc23WcstollTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   testMuslIsoc23Wcstoll0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOLL_0100
     * @tc.desc   宽字符十进制溢出返回LLONG_MAX并置ERANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOLL_0100', 0, () => {
      expect(mod.Isoc23Wcstoll_0100()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstoll0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOLL_0200
     * @tc.desc   宽字符仅前缀0b返回0并置EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOLL_0200', 0, () => {
      expect(mod.Isoc23Wcstoll_0200()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstoll0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOLL_0300
     * @tc.desc   宽字符解析-9223372036854775807成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOLL_0300', 0, () => {
      expect(mod.Isoc23Wcstoll_0300()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstoll0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOLL_0400
     * @tc.desc   宽字符负溢出返回LLONG_MIN并置ERANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOLL_0400', 0, () => {
      expect(mod.Isoc23Wcstoll_0400()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstoll0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOLL_0500
     * @tc.desc   宽字符base=1非法返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOLL_0500', 0, () => {
      expect(mod.Isoc23Wcstoll_0500()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstoll0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOLL_0600
     * @tc.desc   宽字符解析123abc返回123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOLL_0600', 0, () => {
      expect(mod.Isoc23Wcstoll_0600()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstoll0700
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOLL_0700
     * @tc.desc   宽字符解析xyz返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOLL_0700', 0, () => {
      expect(mod.Isoc23Wcstoll_0700()).assertEqual(0);
    })
  })
}
