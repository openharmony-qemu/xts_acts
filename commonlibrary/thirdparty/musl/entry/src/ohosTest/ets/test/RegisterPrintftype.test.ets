import { beforeEach, describe, expect, it, TestType, Size, Level } from "@ohos/hypium-dynamic"
import Utils from './Utils'
import registerprintftype from 'libregisterprintftype.so'

export default function RegisterPrintftypeTest() {
  describe('MuslPrintfRegTypeTest', () => {
    beforeEach(async () => { await Utils.sleep(50) })

    /**
     * @tc.name   testMuslPrintfRegTypeTest0100
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGTYPE_0100
     * @tc.desc   register_printf_type-正常注册返回ID>=PA_LAST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPrintfRegTypeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = registerprintftype.RegPrintfType_0100();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegTypeTest0200
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGTYPE_0200
     * @tc.desc   register_printf_type-首次注册ID等于PA_LAST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPrintfRegTypeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = registerprintftype.RegPrintfType_0200();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegTypeTest0300
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGTYPE_0300
     * @tc.desc   register_printf_type-二次注册返回递增ID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegTypeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintftype.RegPrintfType_0300();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegTypeTest0400
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGTYPE_0400
     * @tc.desc   register_printf_type-连续注册100次ID严格递增
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegTypeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintftype.RegPrintfType_0400();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegTypeTest0500
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGTYPE_0500
     * @tc.desc   register_printf_type-fct为NULL返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegTypeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintftype.RegPrintfType_0500();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegTypeTest0600
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGTYPE_0600
     * @tc.desc   register_printf_type-errno精确性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegTypeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintftype.RegPrintfType_0600();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegTypeTest0700
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGTYPE_0700
     * @tc.desc   register_printf_type-自定义类型配合specifier输出
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPrintfRegTypeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = registerprintftype.RegPrintfType_0700();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegTypeTest0800
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGTYPE_0800
     * @tc.desc   register_printf_type-自定义类型指针语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegTypeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintftype.RegPrintfType_0800();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegTypeTest0900
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGTYPE_0900
     * @tc.desc   register_printf_type-自定义类型值语义
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegTypeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintftype.RegPrintfType_0900();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegTypeTest1000
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGTYPE_1000
     * @tc.desc   register_printf_type-提取long+double组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegTypeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintftype.RegPrintfType_1000();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegTypeTest1100
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGTYPE_1100
     * @tc.desc   register_printf_type-提取单个double
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegTypeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintftype.RegPrintfType_1100();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegTypeTest1200
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGTYPE_1200
     * @tc.desc   register_printf_type-第248次注册成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegTypeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintftype.RegPrintfType_1200();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegTypeTest1300
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGTYPE_1300
     * @tc.desc   register_printf_type-第249次注册返回ENOSPC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegTypeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintftype.RegPrintfType_1300();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegTypeTest1400
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGTYPE_1400
     * @tc.desc   register_printf_type-上限后继续调用稳定ENOSPC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegTypeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintftype.RegPrintfType_1400();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegTypeTest1500
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGTYPE_1500
     * @tc.desc   register_printf_type-上限后已有类型仍可用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegTypeTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintftype.RegPrintfType_1500();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegTypeTest1600
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGTYPE_1600
     * @tc.desc   register_printf_type-未知类型ID不崩溃
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegTypeTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintftype.RegPrintfType_1600();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegTypeTest1700
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGTYPE_1700
     * @tc.desc   register_printf_type-多线程并发注册ID无重复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegTypeTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintftype.RegPrintfType_1700();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegTypeTest1800
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGTYPE_1800
     * @tc.desc   register_printf_type-多线程同时首次注册竞态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegTypeTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintftype.RegPrintfType_1800();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegTypeTest1900
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGTYPE_1900
     * @tc.desc   register_printf_type-多线程接近上限无超限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegTypeTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintftype.RegPrintfType_1900();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegTypeTest2000
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGTYPE_2000
     * @tc.desc   register_printf_type-循环注册使用无泄漏
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegTypeTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintftype.RegPrintfType_2000();
      expect(data).assertEqual(0);
      done();
    });
  })
}
