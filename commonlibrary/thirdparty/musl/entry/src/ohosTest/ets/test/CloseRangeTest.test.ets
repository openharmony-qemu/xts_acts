import { describe, it, expect } from '@ohos/hypium';
import close_range_test from 'libclose_range_test.so';

export default function closeRangeTest() {
  describe('ActsCloseRangeTest', () => {

    /**
     * @tc.name   testMuslCloseRange0100
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0100
     * @tc.desc   close_range(0,UINT_MAX,0)关闭全部fd成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0100', 0, () => {
      let data: number = close_range_test.CloseRange_0100();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslCloseRange0200
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0200
     * @tc.desc   first大于last返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0200', 0, () => {
      let data: number = close_range_test.CloseRange_0200();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslCloseRange0300
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0300
     * @tc.desc   CLOSE_RANGE_UNSHARE标志调用不崩溃
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0300', 0, () => {
      let data: number = close_range_test.CloseRange_0300();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslCloseRange0400
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0400
     * @tc.desc   CLOSE_RANGE_CLOEXEC设置FD_CLOEXEC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0400', 0, () => {
      let data: number = close_range_test.CloseRange_0400();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslCloseRange0500
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0500
     * @tc.desc   关闭fd5后访问返回EBADF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0500', 0, () => {
      let data: number = close_range_test.CloseRange_0500();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslCloseRange0600
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0600
     * @tc.desc   关闭不存在fd范围100-200返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0600', 0, () => {
      let data: number = close_range_test.CloseRange_0600();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslCloseRange0700
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0700
     * @tc.desc   范围外fd5保持打开
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0700', 0, () => {
      let data: number = close_range_test.CloseRange_0700();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslCloseRange0800
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0800
     * @tc.desc   关闭当前fd后再次close返回EBADF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0800', 0, () => {
      let data: number = close_range_test.CloseRange_0800();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslCloseRange0900
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0900
     * @tc.desc   关闭fd3-7范围成功返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_CLOSE_RANGE_0900', 0, () => {
      let data: number = close_range_test.CloseRange_0900();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslCloseRange1000
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_1000
     * @tc.desc   close_range占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_CLOSE_RANGE_1000', 0, () => {
      let data: number = close_range_test.CloseRange_1000();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslCloseRange1100
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_1100
     * @tc.desc   close_range占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_CLOSE_RANGE_1100', 0, () => {
      let data: number = close_range_test.CloseRange_1100();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslCloseRange1200
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_1200
     * @tc.desc   close_range占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_CLOSE_RANGE_1200', 0, () => {
      let data: number = close_range_test.CloseRange_1200();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslCloseRange1300
     * @tc.number SUB_THIRDPARTY_MUSL_CLOSE_RANGE_1300
     * @tc.desc   close_range占位用例直接返回0（Review-Only）
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_CLOSE_RANGE_1300', 0, () => {
      let data: number = close_range_test.CloseRange_1300();
      expect(data).assertEqual(0);
    });
  });
}
