import { describe, it, expect } from '@ohos/hypium';
import isoc23_vfscanf_test from 'libisoc23_vfscanf_test.so';

export default function isoc23VfscanfTest() {
  describe('ActsIsoc23VfscanfTest', () => {

    /**
     * @tc.name   testMuslIsoc23Vfscanf0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0100
     * @tc.desc   vfscanf %b解析二进制10110返回22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0100', 0, () => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_0100();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Vfscanf0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0200
     * @tc.desc   vfscanf %i解析0b111返回7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0200', 0, () => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_0200();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Vfscanf0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0300
     * @tc.desc   vfscanf %w8d限制宽度读取12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0300', 0, () => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_0300();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Vfscanf0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0400
     * @tc.desc   vfscanf %ms动态分配字符串读取hello
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0400', 0, () => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_0400();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Vfscanf0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0500
     * @tc.desc   vfscanf %lf解析nan(0x2A)成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0500', 0, () => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_0500();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Vfscanf0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0600
     * @tc.desc   vfscanf %p解析空指针(nil)成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0600', 0, () => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_0600();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Vfscanf0700
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0700
     * @tc.desc   vfscanf %d解析非数字abc返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0700', 0, () => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_0700();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Vfscanf0800
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0800
     * @tc.desc   vfscanf %d空输入返回EOF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0800', 0, () => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_0800();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Vfscanf0900
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0900
     * @tc.desc   vfscanf %d解析42成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_0900', 0, () => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_0900();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Vfscanf1000
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_1000
     * @tc.desc   vfscanf %i重复解析0b111返回7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_1000', 0, () => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_1000();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Vfscanf1100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_1100
     * @tc.desc   vfscanf %ms动态字符串分配验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_VFSCANF_1100', 0, () => {
      let data: number = isoc23_vfscanf_test.Isoc23Vfscanf_1100();
      expect(data).assertEqual(0);
    });
  })
}
