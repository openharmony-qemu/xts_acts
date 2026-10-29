import { describe, it, expect } from '@ohos/hypium';
import isoc23_vsscanf_test from 'libisoc23_vsscanf_test.so';

export default function isoc23VsscanfTest() {
  describe('ActsIsoc23VsscanfTest', () => {

    /**
     * @tc.name   testMuslIsoc23Vsscanf0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VSSCANF_0100
     * @tc.desc   vsscanf %b解析二进制10110返回22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_VSSCANF_0100', 0, () => {
      let data: number = isoc23_vsscanf_test.Isoc23Vsscanf_0100();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Vsscanf0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VSSCANF_0200
     * @tc.desc   vsscanf %i连续解析0b111和0x1F返回7/31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_VSSCANF_0200', 0, () => {
      let data: number = isoc23_vsscanf_test.Isoc23Vsscanf_0200();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Vsscanf0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VSSCANF_0300
     * @tc.desc   vsscanf %w8d限制宽度读取12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_VSSCANF_0300', 0, () => {
      let data: number = isoc23_vsscanf_test.Isoc23Vsscanf_0300();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Vsscanf0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VSSCANF_0400
     * @tc.desc   vsscanf %ms动态分配字符串读取hello
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_VSSCANF_0400', 0, () => {
      let data: number = isoc23_vsscanf_test.Isoc23Vsscanf_0400();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Vsscanf0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VSSCANF_0500
     * @tc.desc   vsscanf %f解析nan(123)成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_VSSCANF_0500', 0, () => {
      let data: number = isoc23_vsscanf_test.Isoc23Vsscanf_0500();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Vsscanf0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VSSCANF_0600
     * @tc.desc   vsscanf %p解析空指针(nil)成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_VSSCANF_0600', 0, () => {
      let data: number = isoc23_vsscanf_test.Isoc23Vsscanf_0600();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Vsscanf0700
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VSSCANF_0700
     * @tc.desc   vsscanf %d解析非数字abc返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_VSSCANF_0700', 0, () => {
      let data: number = isoc23_vsscanf_test.Isoc23Vsscanf_0700();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Vsscanf0800
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VSSCANF_0800
     * @tc.desc   vsscanf %d空输入返回EOF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_VSSCANF_0800', 0, () => {
      let data: number = isoc23_vsscanf_test.Isoc23Vsscanf_0800();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Vsscanf0900
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VSSCANF_0900
     * @tc.desc   vsscanf %ls空宽字符串返回EOF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_VSSCANF_0900', 0, () => {
      let data: number = isoc23_vsscanf_test.Isoc23Vsscanf_0900();
      expect(data).assertEqual(0);
    });
  })
}
