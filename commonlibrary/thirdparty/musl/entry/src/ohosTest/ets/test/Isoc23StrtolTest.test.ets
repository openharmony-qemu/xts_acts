import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import mod from 'libisoc23_strtol_test.so';

export default function isoc23StrtolTest() {
  describe('ActsIsoc23StrtolTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   testMuslIsoc23Strtol0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0100
     * @tc.desc   base=0解析0b101二进制成功返回5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0100', 0, () => {
      let data: number = mod.Isoc23Strtol_0100();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtol0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0200
     * @tc.desc   base=2解析0B101成功返回5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0200', 0, () => {
      let data: number = mod.Isoc23Strtol_0200();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtol0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0300
     * @tc.desc   仅前缀0b时返回0且endptr指向b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0300', 0, () => {
      let data: number = mod.Isoc23Strtol_0300();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtol0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0400
     * @tc.desc   十进制溢出返回LONG_MAX并置ERANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0400', 0, () => {
      let data: number = mod.Isoc23Strtol_0400();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtol0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0500
     * @tc.desc   base=0解析负二进制成功返回-3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0500', 0, () => {
      let data: number = mod.Isoc23Strtol_0500();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtol0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0600
     * @tc.desc   base=1非法返回EINVAL且endptr等于nptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0600', 0, () => {
      let data: number = mod.Isoc23Strtol_0600();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtol0700
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0700
     * @tc.desc   空字符串返回EINVAL且endptr等于nptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0700', 0, () => {
      let data: number = mod.Isoc23Strtol_0700();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtol0800
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0800
     * @tc.desc   endptr为NULL时解析123成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0800', 0, () => {
      let data: number = mod.Isoc23Strtol_0800();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtol0900
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0900
     * @tc.desc   strtol(-1)与strtoul(-1)边界值验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_0900', 0, () => {
      let data: number = mod.Isoc23Strtol_0900();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtol1000
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_1000
     * @tc.desc   base=16解析0b101成功返回0xB101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_1000', 0, () => {
      let data: number = mod.Isoc23Strtol_1000();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtol1100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_1100
     * @tc.desc   连续解析0b前缀多种输入验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_1100', 0, () => {
      let data: number = mod.Isoc23Strtol_1100();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtol1200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_1200
     * @tc.desc   isoc23_strtol占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOL_1200', 0, () => {
      let data: number = mod.Isoc23Strtol_1200();
      expect(data).assertEqual(0);
    })
  })
}
