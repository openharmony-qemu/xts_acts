import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import mod from 'libstrtol_l_test.so';

export default function strtolLTest() {
  describe('ActsStrtolLTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   testMuslStrtolL0100
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_L_0100
     * @tc.desc   base=0不识别0b前缀返回0且endptr指向b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_STRTOL_L_0100', 0, () => {
      let data: number = mod.StrtolL_0100();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslStrtolL0200
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_L_0200
     * @tc.desc   base=0解析0xff十六进制返回255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_STRTOL_L_0200', 0, () => {
      let data: number = mod.StrtolL_0200();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslStrtolL0300
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_L_0300
     * @tc.desc   base=0解析0777八进制返回511
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_STRTOL_L_0300', 0, () => {
      let data: number = mod.StrtolL_0300();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslStrtolL0400
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_L_0400
     * @tc.desc   base=0解析123十进制返回123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_STRTOL_L_0400', 0, () => {
      let data: number = mod.StrtolL_0400();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslStrtolL0500
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_L_0500
     * @tc.desc   十进制溢出返回LONG_MAX并置ERANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_STRTOL_L_0500', 0, () => {
      let data: number = mod.StrtolL_0500();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslStrtolL0600
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_L_0600
     * @tc.desc   仅前缀0b返回0且endptr指向b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_STRTOL_L_0600', 0, () => {
      let data: number = mod.StrtolL_0600();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslStrtolL0700
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_L_0700
     * @tc.desc   base=0解析0b101返回0且endptr指向b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_STRTOL_L_0700', 0, () => {
      let data: number = mod.StrtolL_0700();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslStrtolL0800
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_L_0800
     * @tc.desc   base=16解析0b101返回5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_STRTOL_L_0800', 0, () => {
      let data: number = mod.StrtolL_0800();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslStrtolL0900
     * @tc.number SUB_THIRDPARTY_MUSL_STRTOL_L_0900
     * @tc.desc   不同locale下base=0均不识别0b前缀
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_STRTOL_L_0900', 0, () => {
      let data: number = mod.StrtolL_0900();
      expect(data).assertEqual(0);
    })
  })
}
