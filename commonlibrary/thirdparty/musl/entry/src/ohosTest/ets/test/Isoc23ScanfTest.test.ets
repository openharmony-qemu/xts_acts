import { describe, it, expect } from '@ohos/hypium';
import isoc23_scanf_test from 'libisoc23_scanf_test.so';

export default function isoc23ScanfTest() {
  describe('ActsIsoc23ScanfTest', () => {

    /**
     * @tc.name   testMuslIsoc23Scanf0100
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SCANF_0100
     * @tc.desc   scanf %b解析二进制10110返回22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SCANF_0100', 0, () => {
      let data: number = isoc23_scanf_test.Isoc23Scanf_0100();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Scanf0200
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SCANF_0200
     * @tc.desc   scanf %i解析0b111返回7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SCANF_0200', 0, () => {
      let data: number = isoc23_scanf_test.Isoc23Scanf_0200();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Scanf0300
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SCANF_0300
     * @tc.desc   scanf %w4d限制宽度读取1234
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SCANF_0300', 0, () => {
      let data: number = isoc23_scanf_test.Isoc23Scanf_0300();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Scanf0400
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SCANF_0400
     * @tc.desc   scanf %ms动态分配字符串读取test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SCANF_0400', 0, () => {
      let data: number = isoc23_scanf_test.Isoc23Scanf_0400();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Scanf0500
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SCANF_0500
     * @tc.desc   scanf %d解析非数字xyz返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SCANF_0500', 0, () => {
      let data: number = isoc23_scanf_test.Isoc23Scanf_0500();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Scanf0600
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SCANF_0600
     * @tc.desc   scanf %d输入结束返回EOF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SCANF_0600', 0, () => {
      let data: number = isoc23_scanf_test.Isoc23Scanf_0600();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslIsoc23Scanf0700
     * @tc.number SUB_THIRDPARTY_MUSL_ISOC23_SCANF_0700
     * @tc.desc   scanf %lf解析nan(0x1)成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_ISOC23_SCANF_0700', 0, () => {
      let data: number = isoc23_scanf_test.Isoc23Scanf_0700();
      expect(data).assertEqual(0);
    });
  })
}
