import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import mod from 'libisoc23_strtoll_l_test.so';

export default function isoc23StrtollLTest() {
  describe('ActsIsoc23StrtollLTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   testMuslIsoc23StrtollL0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_L_0100
     * @tc.desc   base=0解析0b1010二进制成功返回10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_L_0100', 0, () => {
      let data: number = mod.Isoc23StrtollL_0100();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23StrtollL0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_L_0200
     * @tc.desc   base=16解析0xff成功返回255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_L_0200', 0, () => {
      let data: number = mod.Isoc23StrtollL_0200();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23StrtollL0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_L_0300
     * @tc.desc   仅前缀0b返回0且endptr指向b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_L_0300', 0, () => {
      let data: number = mod.Isoc23StrtollL_0300();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23StrtollL0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_L_0400
     * @tc.desc   十进制溢出返回LLONG_MAX并置ERANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_L_0400', 0, () => {
      let data: number = mod.Isoc23StrtollL_0400();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23StrtollL0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_L_0500
     * @tc.desc   base=1非法返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOLL_L_0500', 0, () => {
      let data: number = mod.Isoc23StrtollL_0500();
      expect(data).assertEqual(0);
    })
  })
}
