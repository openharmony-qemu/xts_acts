import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import mod from 'libisoc23_wcstoul_test.so';

export default function isoc23WcstoulTest() {
  describe('ActsIsoc23WcstoulTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   testMuslIsoc23Wcstoul0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOUL_0100
     * @tc.desc   宽字符base=0解析0b101成功返回5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOUL_0100', 0, () => {
      expect(mod.Isoc23Wcstoul_0100()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstoul0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOUL_0200
     * @tc.desc   宽字符仅前缀0b返回0并置EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOUL_0200', 0, () => {
      expect(mod.Isoc23Wcstoul_0200()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstoul0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOUL_0300
     * @tc.desc   宽字符解析-5返回ULONG_MAX回绕值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOUL_0300', 0, () => {
      expect(mod.Isoc23Wcstoul_0300()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstoul0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOUL_0400
     * @tc.desc   宽字符十进制溢出返回ULONG_MAX并置ERANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOUL_0400', 0, () => {
      expect(mod.Isoc23Wcstoul_0400()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstoul0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOUL_0500
     * @tc.desc   宽字符base=1非法返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOUL_0500', 0, () => {
      expect(mod.Isoc23Wcstoul_0500()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstoul0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOUL_0600
     * @tc.desc   宽字符解析42xyz返回42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOUL_0600', 0, () => {
      expect(mod.Isoc23Wcstoul_0600()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstoul0700
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOUL_0700
     * @tc.desc   宽字符解析abc返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOUL_0700', 0, () => {
      expect(mod.Isoc23Wcstoul_0700()).assertEqual(0);
    })
  })
}
