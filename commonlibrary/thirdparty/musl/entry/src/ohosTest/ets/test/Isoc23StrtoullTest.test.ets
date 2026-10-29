import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import mod from 'libisoc23_strtoull_test.so';

export default function isoc23StrtoullTest() {
  describe('ActsIsoc23StrtoullTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   testMuslIsoc23Strtoull0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_0100
     * @tc.desc   base=0解析0b101成功返回5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_0100', 0, () => {
      let data: number = mod.Isoc23Strtoull_0100();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoull0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_0200
     * @tc.desc   解析-1返回ULLONG_MAX回绕值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_0200', 0, () => {
      let data: number = mod.Isoc23Strtoull_0200();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoull0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_0300
     * @tc.desc   十六进制溢出返回ULLONG_MAX并置ERANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_0300', 0, () => {
      let data: number = mod.Isoc23Strtoull_0300();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoull0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_0400
     * @tc.desc   仅前缀0B返回0且endptr指向B
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_0400', 0, () => {
      let data: number = mod.Isoc23Strtoull_0400();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoull0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_0500
     * @tc.desc   空字符串返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_0500', 0, () => {
      let data: number = mod.Isoc23Strtoull_0500();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoull0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_0600
     * @tc.desc   base=2解析0b1111返回15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_0600', 0, () => {
      let data: number = mod.Isoc23Strtoull_0600();
      expect(data).assertEqual(0);
    })
  })
}
