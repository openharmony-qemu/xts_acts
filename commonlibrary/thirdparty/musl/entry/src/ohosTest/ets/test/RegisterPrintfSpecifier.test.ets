import { beforeEach, describe, expect, it, TestType, Size, Level } from "@ohos/hypium"
import Utils from './Utils'
import registerprintfspecifier from 'libregisterprintfspecifier.so'

export default function RegisterPrintfSpecifierTest() {
  describe('MuslPrintfRegSpecifierTest', () => {
    beforeEach(async () => { await Utils.sleep(50) })

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest0100
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_0100
     * @tc.desc   register_printf_specifier-注册小写字母返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPrintfRegSpecifierTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_0100();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest0200
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_0200
     * @tc.desc   register_printf_specifier-注册大写字母返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPrintfRegSpecifierTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_0200();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest0300
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_0300
     * @tc.desc   register_printf_specifier-注册后snprintf输出正确
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPrintfRegSpecifierTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_0300();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest0400
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_0400
     * @tc.desc   register_printf_specifier-注册后fprintf输出正确
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPrintfRegSpecifierTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_0400();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest0500
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_0500
     * @tc.desc   register_printf_specifier-注册后asprintf输出正确
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPrintfRegSpecifierTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_0500();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest0600
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_0600
     * @tc.desc   register_printf_specifier-注册后宽字符swprintf输出正确
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPrintfRegSpecifierTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_0600();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest0700
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_0700
     * @tc.desc   register_printf_specifier-spec=-1返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPrintfRegSpecifierTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_0700();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest0800
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_0800
     * @tc.desc   register_printf_specifier-spec=256返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPrintfRegSpecifierTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_0800();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest0900
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_0900
     * @tc.desc   register_printf_specifier-spec=INT_MIN返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_0900();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest1000
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_1000
     * @tc.desc   register_printf_specifier-spec=INT_MAX返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_1000();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest1100
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_1100
     * @tc.desc   register_printf_specifier-func为NULL返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_1100();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest1200
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_1200
     * @tc.desc   register_printf_specifier-arginfo为NULL返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_1200();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest1300
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_1300
     * @tc.desc   register_printf_specifier-func与arginfo均为NULL返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_1300();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest1400
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_1400
     * @tc.desc   register_printf_specifier-spec=0下限注册成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_1400();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest1500
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_1500
     * @tc.desc   register_printf_specifier-spec=255上限注册成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_1500();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest1600
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_1600
     * @tc.desc   register_printf_specifier-重复注册同spec返回0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_1600();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest1700
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_1700
     * @tc.desc   register_printf_specifier-重复注册替换旧handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_1700();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest1800
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_1800
     * @tc.desc   register_printf_specifier-连续注册10次同spec全部成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegSpecifierTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_1800();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest1900
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_1900
     * @tc.desc   register_printf_specifier-内置字符d不可被覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPrintfRegSpecifierTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_1900();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest2000
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_2000
     * @tc.desc   register_printf_specifier-内置字符s不可被覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPrintfRegSpecifierTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_2000();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest2100
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_2100
     * @tc.desc   register_printf_specifier-内置字符f不可被覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_2100();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest2200
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_2200
     * @tc.desc   register_printf_specifier-无注册时未识别字符走EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_2200();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest2300
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_2300
     * @tc.desc   register_printf_specifier-无注册表时零额外开销
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegSpecifierTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_2300();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest2400
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_2400
     * @tc.desc   register_printf_specifier-handler返回-2回退
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_2400();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest2500
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_2500
     * @tc.desc   register_printf_specifier-handler返回-1报错
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_2500();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest2600
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_2600
     * @tc.desc   register_printf_specifier-handler返回0输出0字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegSpecifierTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_2600();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest2700
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_2700
     * @tc.desc   register_printf_specifier-arginfo返回0参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_2700();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest2800
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_2800
     * @tc.desc   register_printf_specifier-arginfo返回32参数上限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegSpecifierTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_2800();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest2900
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_2900
     * @tc.desc   register_printf_specifier-info.pad在-0组合时清空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_2900();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest3000
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_3000
     * @tc.desc   register_printf_specifier-仅零填充时pad为0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegSpecifierTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_3000();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest3100
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_3100
     * @tc.desc   register_printf_specifier-.* 负精度归一化为-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_3100();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest3200
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_3200
     * @tc.desc   register_printf_specifier-.* 正精度保持
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegSpecifierTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_3200();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest3300
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_3300
     * @tc.desc   register_printf_specifier-无精度时prec为-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegSpecifierTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_3300();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest3400
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_3400
     * @tc.desc   register_printf_specifier-注册后不影响内置printf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_3400();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest3500
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_3500
     * @tc.desc   register_printf_specifier-同时注册多个格式字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegSpecifierTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_3500();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest3600
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_3600
     * @tc.desc   register_printf_specifier-多线程并发注册不同spec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_3600();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest3700
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_3700
     * @tc.desc   register_printf_specifier-多线程并发注册同spec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_3700();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest3800
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_3800
     * @tc.desc   register_printf_specifier-首次注册calloc竞态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_3800();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest3900
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_3900
     * @tc.desc   register_printf_specifier-注册与输出并发
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_3900();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest4000
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_4000
     * @tc.desc   register_printf_specifier-纯并发输出已注册字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegSpecifierTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_4000();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest4100
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_4100
     * @tc.desc   register_printf_specifier-长时间并发压力无泄漏
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegSpecifierTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_4100();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegSpecifierTest4200
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGSPECIFIER_4200
     * @tc.desc   register_printf_specifier-多线程errno隔离
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegSpecifierTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfspecifier.RegPrintfSpecifier_4200();
      expect(data).assertEqual(0);
      done();
    });
  })
}
