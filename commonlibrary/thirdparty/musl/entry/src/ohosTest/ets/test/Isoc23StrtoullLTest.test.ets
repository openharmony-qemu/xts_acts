import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import mod from 'libisoc23_strtoull_l_test.so';

export default function isoc23StrtoullLTest() {
  describe('ActsIsoc23StrtoullLTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   testMuslIsoc23StrtoullL0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_L_0100
     * @tc.desc   base=0解析0b101成功返回5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_L_0100', 0, () => {
      let data: number = mod.Isoc23StrtoullL_0100();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23StrtoullL0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_L_0200
     * @tc.desc   解析-1返回ULLONG_MAX回绕值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_L_0200', 0, () => {
      let data: number = mod.Isoc23StrtoullL_0200();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23StrtoullL0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_L_0300
     * @tc.desc   base=2解析0b1111返回15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_L_0300', 0, () => {
      let data: number = mod.Isoc23StrtoullL_0300();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23StrtoullL0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_L_0400
     * @tc.desc   十六进制溢出返回ULLONG_MAX并置ERANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_L_0400', 0, () => {
      let data: number = mod.Isoc23StrtoullL_0400();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23StrtoullL0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_L_0500
     * @tc.desc   仅前缀0b返回0且endptr指向b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_L_0500', 0, () => {
      let data: number = mod.Isoc23StrtoullL_0500();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23StrtoullL0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_L_0600
     * @tc.desc   base=1非法返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOULL_L_0600', 0, () => {
      let data: number = mod.Isoc23StrtoullL_0600();
      expect(data).assertEqual(0);
    })
  })
}
