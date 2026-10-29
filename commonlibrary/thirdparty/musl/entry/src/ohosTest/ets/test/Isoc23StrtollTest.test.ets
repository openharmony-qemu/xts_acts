import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import mod from 'libisoc23_strtoll_test.so';

export default function isoc23StrtollTest() {
  describe('ActsIsoc23StrtollTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   testMuslIsoc23Strtoll0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_0100
     * @tc.desc   base=0解析0b1010二进制成功返回10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_0100', 0, () => {
      let data: number = mod.Isoc23Strtoll_0100();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoll0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_0200
     * @tc.desc   仅前缀0b返回0且endptr指向b并置EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_0200', 0, () => {
      let data: number = mod.Isoc23Strtoll_0200();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoll0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_0300
     * @tc.desc   十进制溢出返回LLONG_MAX并置ERANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_0300', 0, () => {
      let data: number = mod.Isoc23Strtoll_0300();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoll0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_0400
     * @tc.desc   base=16解析0x7fffffffffffffff返回LLONG_MAX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_0400', 0, () => {
      let data: number = mod.Isoc23Strtoll_0400();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoll0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_0500
     * @tc.desc   base=0解析负二进制-0b11返回-3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_0500', 0, () => {
      let data: number = mod.Isoc23Strtoll_0500();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoll0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_0600
     * @tc.desc   base=1非法返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_0600', 0, () => {
      let data: number = mod.Isoc23Strtoll_0600();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoll0700
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_0700
     * @tc.desc   endptr为NULL时解析100成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_0700', 0, () => {
      let data: number = mod.Isoc23Strtoll_0700();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoll0800
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_0800
     * @tc.desc   连续解析0b11111111验证返回值255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_0800', 0, () => {
      let data: number = mod.Isoc23Strtoll_0800();
      expect(data).assertEqual(0);
    })
  })
}
