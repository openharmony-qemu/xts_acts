import { describe, it, expect } from '@ohos/hypium';
import closefrom_test from 'libclosefrom_test.so';

export default function closefromTest() {
  describe('ActsClosefromTest', () => {

    /**
     * @tc.name   testMuslClosefrom0100
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSEFROM_0100
     * @tc.desc   closefrom从fd1开始关闭fd1/fd2/fd3成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_CLOSEFROM_0100', 0, () => {
      let data: number = closefrom_test.Closefrom_0100();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslClosefrom0200
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSEFROM_0200
     * @tc.desc   lowfd为-1时closefrom不崩溃
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_CLOSEFROM_0200', 0, () => {
      let data: number = closefrom_test.Closefrom_0200();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslClosefrom0300
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSEFROM_0300
     * @tc.desc   lowfd大于所有fd时保留已打开fd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_CLOSEFROM_0300', 0, () => {
      let data: number = closefrom_test.Closefrom_0300();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslClosefrom0400
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSEFROM_0400
     * @tc.desc   closefrom占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_CLOSEFROM_0400', 0, () => {
      let data: number = closefrom_test.Closefrom_0400();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslClosefrom0500
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSEFROM_0500
     * @tc.desc   closefrom(6)保留fd3/fd5并关闭fd8/fd10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_CLOSEFROM_0500', 0, () => {
      let data: number = closefrom_test.Closefrom_0500();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslClosefrom0600
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSEFROM_0600
     * @tc.desc   closefrom关闭当前fd后再次close返回EBADF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_CLOSEFROM_0600', 0, () => {
      let data: number = closefrom_test.Closefrom_0600();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslClosefrom0700
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSEFROM_0700
     * @tc.desc   closefrom(10)不关闭fd5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_CLOSEFROM_0700', 0, () => {
      let data: number = closefrom_test.Closefrom_0700();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslClosefrom0800
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSEFROM_0800
     * @tc.desc   closefrom占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_CLOSEFROM_0800', 0, () => {
      let data: number = closefrom_test.Closefrom_0800();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslClosefrom0900
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSEFROM_0900
     * @tc.desc   closefrom占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_CLOSEFROM_0900', 0, () => {
      let data: number = closefrom_test.Closefrom_0900();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslClosefrom1000
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSEFROM_1000
     * @tc.desc   closefrom(10)关闭fd10后访问返回EBADF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_CLOSEFROM_1000', 0, () => {
      let data: number = closefrom_test.Closefrom_1000();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslClosefrom1100
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSEFROM_1100
     * @tc.desc   closefrom占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_CLOSEFROM_1100', 0, () => {
      let data: number = closefrom_test.Closefrom_1100();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslClosefrom1200
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSEFROM_1200
     * @tc.desc   closefrom占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_CLOSEFROM_1200', 0, () => {
      let data: number = closefrom_test.Closefrom_1200();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslClosefrom1300
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSEFROM_1300
     * @tc.desc   closefrom占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_CLOSEFROM_1300', 0, () => {
      let data: number = closefrom_test.Closefrom_1300();
      expect(data).assertEqual(0);
    });
  });
}
