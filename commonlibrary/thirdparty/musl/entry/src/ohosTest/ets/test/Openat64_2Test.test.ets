import { describe, it, expect } from '@ohos/hypium';
import openat64_2_test from 'libopenat64_2_test.so';

export default function openat64_2Test() {
  describe('ActsOpenat64_2Test', () => {

    /**
     * @tc.name   testMuslOpenat64_20100
     * @tc.number SUB_THIRDPARTY_MUSL_OPENAT64_2_0100
     * @tc.desc   openat64_2符号就绪占位用例返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_OPENAT64_2_0100', 0, () => {
      let data: number = openat64_2_test.Openat64_2_0100();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslOpenat64_20200
     * @tc.number SUB_THIRDPARTY_MUSL_OPENAT64_2_0200
     * @tc.desc   openat64_2符号就绪占位用例返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_OPENAT64_2_0200', 0, () => {
      let data: number = openat64_2_test.Openat64_2_0200();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslOpenat64_20300
     * @tc.number SUB_THIRDPARTY_MUSL_OPENAT64_2_0300
     * @tc.desc   AT_FDCWD打开/dev/null并读取成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_OPENAT64_2_0300', 0, () => {
      let data: number = openat64_2_test.Openat64_2_0300();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslOpenat64_20400
     * @tc.number SUB_THIRDPARTY_MUSL_OPENAT64_2_0400
     * @tc.desc   基于目录fd打开相对路径null成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_OPENAT64_2_0400', 0, () => {
      let data: number = openat64_2_test.Openat64_2_0400();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslOpenat64_20500
     * @tc.number SUB_THIRDPARTY_MUSL_OPENAT64_2_0500
     * @tc.desc   以只写方式打开/dev/null成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_OPENAT64_2_0500', 0, () => {
      let data: number = openat64_2_test.Openat64_2_0500();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslOpenat64_20600
     * @tc.number SUB_THIRDPARTY_MUSL_OPENAT64_2_0600
     * @tc.desc   打开不存在路径返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_OPENAT64_2_0600', 0, () => {
      let data: number = openat64_2_test.Openat64_2_0600();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslOpenat64_20700
     * @tc.number SUB_THIRDPARTY_MUSL_OPENAT64_2_0700
     * @tc.desc   无效dirfd返回EBADF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_OPENAT64_2_0700', 0, () => {
      let data: number = openat64_2_test.Openat64_2_0700();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslOpenat64_20800
     * @tc.number SUB_THIRDPARTY_MUSL_OPENAT64_2_0800
     * @tc.desc   openat64_2占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_OPENAT64_2_0800', 0, () => {
      let data: number = openat64_2_test.Openat64_2_0800();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslOpenat64_20900
     * @tc.number SUB_THIRDPARTY_MUSL_OPENAT64_2_0900
     * @tc.desc   openat64_2占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_OPENAT64_2_0900', 0, () => {
      let data: number = openat64_2_test.Openat64_2_0900();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslOpenat64_21000
     * @tc.number SUB_THIRDPARTY_MUSL_OPENAT64_2_1000
     * @tc.desc   openat64_2占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_OPENAT64_2_1000', 0, () => {
      let data: number = openat64_2_test.Openat64_2_1000();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslOpenat64_21100
     * @tc.number SUB_THIRDPARTY_MUSL_OPENAT64_2_1100
     * @tc.desc   openat64_2占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_OPENAT64_2_1100', 0, () => {
      let data: number = openat64_2_test.Openat64_2_1100();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslOpenat64_21200
     * @tc.number SUB_THIRDPARTY_MUSL_OPENAT64_2_1200
     * @tc.desc   openat64_2符号就绪占位用例返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_OPENAT64_2_1200', 0, () => {
      let data: number = openat64_2_test.Openat64_2_1200();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslOpenat64_21300
     * @tc.number SUB_THIRDPARTY_MUSL_OPENAT64_2_1300
     * @tc.desc   openat64_2占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_OPENAT64_2_1300', 0, () => {
      let data: number = openat64_2_test.Openat64_2_1300();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslOpenat64_21400
     * @tc.number SUB_THIRDPARTY_MUSL_OPENAT64_2_1400
     * @tc.desc   openat64_2占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_OPENAT64_2_1400', 0, () => {
      let data: number = openat64_2_test.Openat64_2_1400();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslOpenat64_21500
     * @tc.number SUB_THIRDPARTY_MUSL_OPENAT64_2_1500
     * @tc.desc   openat64_2占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_OPENAT64_2_1500', 0, () => {
      let data: number = openat64_2_test.Openat64_2_1500();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslOpenat64_21600
     * @tc.number SUB_THIRDPARTY_MUSL_OPENAT64_2_1600
     * @tc.desc   openat64_2占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_OPENAT64_2_1600', 0, () => {
      let data: number = openat64_2_test.Openat64_2_1600();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslOpenat64_21700
     * @tc.number SUB_THIRDPARTY_MUSL_OPENAT64_2_1700
     * @tc.desc   openat64_2占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_OPENAT64_2_1700', 0, () => {
      let data: number = openat64_2_test.Openat64_2_1700();
      expect(data).assertEqual(0);
    });
  });
}
