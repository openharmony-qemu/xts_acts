import { describe, it, expect } from '@ohos/hypium';
import isoc23_swscanf_test from 'libisoc23_swscanf_test.so';

export default function isoc23SwscanfTest() {
  describe('ActsIsoc23SwscanfTest', () => {

    /**
     * @tc.name   testMuslIsoc23Swscanf0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_0100
     * @tc.desc   swscanf %b解析二进制10110返回22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_0100', 0, () => {
      let data: number = isoc23_swscanf_test.Isoc23Swscanf_0100();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Swscanf0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_0200
     * @tc.desc   swscanf %i解析0b111返回7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_0200', 0, () => {
      let data: number = isoc23_swscanf_test.Isoc23Swscanf_0200();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Swscanf0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_0300
     * @tc.desc   swscanf %w8d限制宽度读取12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_0300', 0, () => {
      let data: number = isoc23_swscanf_test.Isoc23Swscanf_0300();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Swscanf0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_0400
     * @tc.desc   swscanf %ms动态分配字符串读取hello
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_0400', 0, () => {
      let data: number = isoc23_swscanf_test.Isoc23Swscanf_0400();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Swscanf0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_0500
     * @tc.desc   swscanf %f解析nan(123)成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_0500', 0, () => {
      let data: number = isoc23_swscanf_test.Isoc23Swscanf_0500();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Swscanf0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_0600
     * @tc.desc   swscanf %p解析空指针(nil)成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_0600', 0, () => {
      let data: number = isoc23_swscanf_test.Isoc23Swscanf_0600();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Swscanf0700
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_0700
     * @tc.desc   swscanf %d解析非数字abc返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_0700', 0, () => {
      let data: number = isoc23_swscanf_test.Isoc23Swscanf_0700();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Swscanf0800
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_0800
     * @tc.desc   swscanf %d空输入返回EOF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_0800', 0, () => {
      let data: number = isoc23_swscanf_test.Isoc23Swscanf_0800();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Swscanf0900
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_0900
     * @tc.desc   swscanf %s遇到非法宽字符返回EILSEQ
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_0900', 0, () => {
      let data: number = isoc23_swscanf_test.Isoc23Swscanf_0900();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Swscanf1000
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_1000
     * @tc.desc   swscanf %mls动态分配宽字符串读取hello
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_1000', 0, () => {
      let data: number = isoc23_swscanf_test.Isoc23Swscanf_1000();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Swscanf1100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_1100
     * @tc.desc   swscanf符号就绪占位用例返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SWSCANF_1100', 0, () => {
      let data: number = isoc23_swscanf_test.Isoc23Swscanf_1100();
      expect(data).assertEqual(0);
    });
  })
}
