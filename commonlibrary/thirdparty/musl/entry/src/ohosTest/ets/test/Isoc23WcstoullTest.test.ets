import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import mod from 'libisoc23_wcstoull_test.so';

export default function isoc23WcstoullTest() {
  describe('ActsIsoc23WcstoullTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   testMuslIsoc23Wcstoull0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0100
     * @tc.desc   宽字符base=0解析0b101成功返回5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0100', 0, () => {
      expect(mod.Isoc23Wcstoull_0100()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstoull0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0200
     * @tc.desc   宽字符仅前缀0b返回0并置EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0200', 0, () => {
      expect(mod.Isoc23Wcstoull_0200()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstoull0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0300
     * @tc.desc   宽字符解析-5返回ULLONG_MAX回绕值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0300', 0, () => {
      expect(mod.Isoc23Wcstoull_0300()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstoull0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0400
     * @tc.desc   宽字符十进制溢出返回ULLONG_MAX并置ERANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0400', 0, () => {
      expect(mod.Isoc23Wcstoull_0400()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstoull0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0500
     * @tc.desc   宽字符base=1非法返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0500', 0, () => {
      expect(mod.Isoc23Wcstoull_0500()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstoull0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0600
     * @tc.desc   宽字符解析99abc返回99
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0600', 0, () => {
      expect(mod.Isoc23Wcstoull_0600()).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Wcstoull0700
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0700
     * @tc.desc   宽字符解析xyz返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_WCSTOULL_0700', 0, () => {
      expect(mod.Isoc23Wcstoull_0700()).assertEqual(0);
    })
  })
}
