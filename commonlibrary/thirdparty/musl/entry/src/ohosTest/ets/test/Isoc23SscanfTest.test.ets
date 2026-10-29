import { describe, it, expect } from '@ohos/hypium';
import isoc23_sscanf_test from 'libisoc23_sscanf_test.so';

export default function isoc23SscanfTest() {
  describe('ActsIsoc23SscanfTest', () => {

    /**
     * @tc.name   testMuslIsoc23Sscanf0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0100
     * @tc.desc   sscanf %b解析二进制10110返回22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0100', 0, () => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_0100();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Sscanf0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0200
     * @tc.desc   sscanf %i连续解析0b111/0x1F/010返回7/31/8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0200', 0, () => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_0200();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Sscanf0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0300
     * @tc.desc   sscanf %w8d限制宽度读取12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0300', 0, () => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_0300();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Sscanf0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0400
     * @tc.desc   sscanf %ms动态分配字符串读取hello
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0400', 0, () => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_0400();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Sscanf0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0500
     * @tc.desc   sscanf %f解析nan(123)成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0500', 0, () => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_0500();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Sscanf0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0600
     * @tc.desc   sscanf %p解析空指针(nil)成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0600', 0, () => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_0600();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Sscanf0700
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0700
     * @tc.desc   sscanf %d解析非数字abc返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0700', 0, () => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_0700();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Sscanf0800
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0800
     * @tc.desc   sscanf %d空输入返回EOF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0800', 0, () => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_0800();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Sscanf0900
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0900
     * @tc.desc   sscanf %ls空宽字符串返回EOF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_0900', 0, () => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_0900();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Sscanf1000
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_1000
     * @tc.desc   sscanf %*[^:]:%s跳过前缀解析42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_1000', 0, () => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_1000();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Sscanf1100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_1100
     * @tc.desc   sscanf %i解析0b101返回5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_1100', 0, () => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_1100();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Sscanf1200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_1200
     * @tc.desc   sscanf %u连续解析3和7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_1200', 0, () => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_1200();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Sscanf1300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_1300
     * @tc.desc   sscanf %ms动态分配字符串读取hello
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_1300', 0, () => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_1300();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Sscanf1400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_1400
     * @tc.desc   sscanf %i重复解析0b101返回5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SSCANF_1400', 0, () => {
      let data: number = isoc23_sscanf_test.Isoc23Sscanf_1400();
      expect(data).assertEqual(0);
    });
  })
}
