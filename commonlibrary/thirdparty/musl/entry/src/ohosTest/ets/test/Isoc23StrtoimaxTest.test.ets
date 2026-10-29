import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import mod from 'libisoc23_strtoimax_test.so';

export default function isoc23StrtoimaxTest() {
  describe('ActsIsoc23StrtoimaxTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   testMuslIsoc23Strtoimax0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0100
     * @tc.desc   base=0解析0b101成功返回5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0100', 0, () => {
      let data: number = mod.Isoc23Strtoimax_0100();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoimax0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0200
     * @tc.desc   仅前缀0b返回0且endptr指向b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0200', 0, () => {
      let data: number = mod.Isoc23Strtoimax_0200();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoimax0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0300
     * @tc.desc   十进制溢出返回INTMAX_MAX并置ERANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0300', 0, () => {
      let data: number = mod.Isoc23Strtoimax_0300();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoimax0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0400
     * @tc.desc   base=0解析负二进制-0b11返回-3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0400', 0, () => {
      let data: number = mod.Isoc23Strtoimax_0400();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoimax0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0500
     * @tc.desc   base=1非法返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0500', 0, () => {
      let data: number = mod.Isoc23Strtoimax_0500();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoimax0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0600
     * @tc.desc   base=0重复解析0b101成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0600', 0, () => {
      let data: number = mod.Isoc23Strtoimax_0600();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoimax0700
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0700
     * @tc.desc   连续解析0b101验证intmax返回值5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOIMAX_0700', 0, () => {
      let data: number = mod.Isoc23Strtoimax_0700();
      expect(data).assertEqual(0);
    })
  })
}
