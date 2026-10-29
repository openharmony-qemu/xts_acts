import { describe, it, expect } from '@ohos/hypium';
import isoc23_fscanf_test from 'libisoc23_fscanf_test.so';

export default function isoc23FscanfTest() {
  describe('ActsIsoc23FscanfTest', () => {

    /**
     * @tc.name   testMuslIsoc23Fscanf0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0100
     * @tc.desc   fscanf %b解析二进制10110返回22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0100', 0, () => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_0100();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Fscanf0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0200
     * @tc.desc   fscanf %i解析0b10110和0x1F返回22/31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0200', 0, () => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_0200();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Fscanf0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0300
     * @tc.desc   fscanf %w8d限制宽度读取12345678
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0300', 0, () => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_0300();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Fscanf0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0400
     * @tc.desc   fscanf %ms动态分配字符串读取hello
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0400', 0, () => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_0400();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Fscanf0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0500
     * @tc.desc   fscanf %f解析nan(123)成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0500', 0, () => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_0500();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Fscanf0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0600
     * @tc.desc   fscanf %p解析空指针(nil)成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0600', 0, () => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_0600();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Fscanf0700
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0700
     * @tc.desc   fscanf符号就绪占位用例返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0700', 0, () => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_0700();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Fscanf0800
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0800
     * @tc.desc   fscanf %d解析非数字abc返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0800', 0, () => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_0800();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Fscanf0900
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0900
     * @tc.desc   fscanf %d空输入返回EOF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_0900', 0, () => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_0900();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Fscanf1000
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1000
     * @tc.desc   fscanf %ls读取失败返回EOF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1000', 0, () => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_1000();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Fscanf1100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1100
     * @tc.desc   直接调用__isoc23_sscanf %b解析0b10110返回22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1100', 0, () => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_1100();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Fscanf1200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1200
     * @tc.desc   fscanf %ms动态分配字符串读取hello成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1200', 0, () => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_1200();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Fscanf1300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1300
     * @tc.desc   fscanf %ms %d混合解析部分成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1300', 0, () => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_1300();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Fscanf1400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1400
     * @tc.desc   fscanf %ms空输入返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1400', 0, () => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_1400();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Fscanf1500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1500
     * @tc.desc   fscanf符号就绪占位用例返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1500', 0, () => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_1500();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Fscanf1600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1600
     * @tc.desc   fscanf %ms循环1000次分配释放无泄漏
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_FSCANF_1600', 0, () => {
      let data: number = isoc23_fscanf_test.Isoc23Fscanf_1600();
      expect(data).assertEqual(0);
    });
  })
}
