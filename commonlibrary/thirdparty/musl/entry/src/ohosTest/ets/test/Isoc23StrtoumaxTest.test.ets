import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import mod from 'libisoc23_strtoumax_test.so';

export default function isoc23StrtoumaxTest() {
  describe('ActsIsoc23StrtoumaxTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   testMuslIsoc23Strtoumax0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOUMAX_0100
     * @tc.desc   base=0解析0b101成功返回5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOUMAX_0100', 0, () => {
      let data: number = mod.Isoc23Strtoumax_0100();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoumax0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOUMAX_0200
     * @tc.desc   解析-1返回UINTMAX_MAX回绕值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOUMAX_0200', 0, () => {
      let data: number = mod.Isoc23Strtoumax_0200();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoumax0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOUMAX_0300
     * @tc.desc   十六进制溢出返回UINTMAX_MAX并置ERANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOUMAX_0300', 0, () => {
      let data: number = mod.Isoc23Strtoumax_0300();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoumax0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOUMAX_0400
     * @tc.desc   仅前缀0b返回0且endptr指向b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOUMAX_0400', 0, () => {
      let data: number = mod.Isoc23Strtoumax_0400();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoumax0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOUMAX_0500
     * @tc.desc   base=1非法返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOUMAX_0500', 0, () => {
      let data: number = mod.Isoc23Strtoumax_0500();
      expect(data).assertEqual(0);
    })
  })
}
