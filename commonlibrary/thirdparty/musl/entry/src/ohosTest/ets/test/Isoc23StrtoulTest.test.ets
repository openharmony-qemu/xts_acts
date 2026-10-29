import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import mod from 'libisoc23_strtoul_test.so';

export default function isoc23StrtoulTest() {
  describe('ActsIsoc23StrtoulTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   testMuslIsoc23Strtoul0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOUL_0100
     * @tc.desc   base=0解析0b101成功返回5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOUL_0100', 0, () => {
      let data: number = mod.Isoc23Strtoul_0100();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoul0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOUL_0200
     * @tc.desc   解析-1返回ULONG_MAX回绕值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOUL_0200', 0, () => {
      let data: number = mod.Isoc23Strtoul_0200();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoul0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOUL_0300
     * @tc.desc   仅前缀0b返回0且endptr指向b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOUL_0300', 0, () => {
      let data: number = mod.Isoc23Strtoul_0300();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoul0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOUL_0400
     * @tc.desc   base=1非法返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOUL_0400', 0, () => {
      let data: number = mod.Isoc23Strtoul_0400();
      expect(data).assertEqual(0);
    })

    /**
     * @tc.name   testMuslIsoc23Strtoul0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_STRTOUL_0500
     * @tc.desc   base=16解析255成功返回255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_STRTOUL_0500', 0, () => {
      let data: number = mod.Isoc23Strtoul_0500();
      expect(data).assertEqual(0);
    })
  })
}
