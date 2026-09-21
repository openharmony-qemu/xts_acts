import { beforeEach, describe, expect, it, TestType, Size, Level } from "@ohos/hypium-dynamic"
import Utils from './Utils'
import registerprintfmodifier from 'libregisterprintfmodifier.so'

export default function RegisterPrintfModifierTest() {
  describe('MuslPrintfRegModifierTest', () => {
    beforeEach(async () => { await Utils.sleep(50) })

    /**
     * @tc.name   testMuslPrintfRegModifierTest0100
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_0100
     * @tc.desc   register_printf_modifier-单字符修饰符注册成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPrintfRegModifierTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_0100();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest0200
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_0200
     * @tc.desc   register_printf_modifier-多字符修饰符注册成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPrintfRegModifierTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_0200();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest0300
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_0300
     * @tc.desc   register_printf_modifier-修饰符与specifier组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPrintfRegModifierTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_0300();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest0400
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_0400
     * @tc.desc   register_printf_modifier-修饰符与内置字符组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_0400();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest0500
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_0500
     * @tc.desc   register_printf_modifier-修饰符与宽字符组合
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_0500();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest0600
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_0600
     * @tc.desc   register_printf_modifier-空字符串返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_0600();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest0700
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_0700
     * @tc.desc   register_printf_modifier-str为NULL返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_0700();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest0800
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_0800
     * @tc.desc   register_printf_modifier-字符0x100返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_0800();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest0900
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_0900
     * @tc.desc   register_printf_modifier-字符0xFFFF返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_0900();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest1000
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_1000
     * @tc.desc   register_printf_modifier-恰255字符注册成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_1000();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest1100
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_1100
     * @tc.desc   register_printf_modifier-256字符返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_1100();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest1200
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_1200
     * @tc.desc   register_printf_modifier-单字符最小值0x01注册成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegModifierTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_1200();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest1300
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_1300
     * @tc.desc   register_printf_modifier-单字符最大值0xFF注册成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegModifierTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_1300();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest1400
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_1400
     * @tc.desc   register_printf_modifier-第1个修饰符返回1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_1400();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest1500
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_1500
     * @tc.desc   register_printf_modifier-第16个修饰符返回0x8000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_1500();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest1600
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_1600
     * @tc.desc   register_printf_modifier-第17个返回ENOSPC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_1600();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest1700
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_1700
     * @tc.desc   register_printf_modifier-上限后继续调用稳定ENOSPC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegModifierTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_1700();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest1800
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_1800
     * @tc.desc   register_printf_modifier-同字符串重复注册产生不同bit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegModifierTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_1800();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest1900
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_1900
     * @tc.desc   register_printf_modifier-同首字符多修饰符共存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_1900();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest2000
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_2000
     * @tc.desc   register_printf_modifier-最长匹配I32优先于I
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPrintfRegModifierTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_2000();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest2100
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_2100
     * @tc.desc   register_printf_modifier-短匹配回退到I
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_2100();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest2200
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_2200
     * @tc.desc   register_printf_modifier-三修饰符前缀最长匹配
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegModifierTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_2200();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest2300
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_2300
     * @tc.desc   register_printf_modifier-无匹配回退内置修饰符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_2300();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest2400
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_2400
     * @tc.desc   register_printf_modifier-无注册修饰符时零开销
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegModifierTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_2400();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest2500
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_2500
     * @tc.desc   register_printf_modifier-修饰符不影响内置修饰符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegModifierTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_2500();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest2600
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_2600
     * @tc.desc   register_printf_modifier-多线程并发注册bit无重复
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_2600();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest2700
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_2700
     * @tc.desc   register_printf_modifier-多线程同时首次注册竞态
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_2700();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest2800
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_2800
     * @tc.desc   register_printf_modifier-多线程接近上限无超限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegModifierTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_2800();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest2900
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_REGMODIFIER_2900
     * @tc.desc   register_printf_modifier-循环注册使用无泄漏
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegModifierTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfModifier_2900();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest3000
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_COMBINED_3000
     * @tc.desc   组合-specifier+type+modifier联合使用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslPrintfRegModifierTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfCombined_3000();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest3100
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_COMBINED_3100
     * @tc.desc   组合-多个specifier同格式串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfCombined_3100();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest3200
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_COMBINED_3200
     * @tc.desc   组合-specifier与内置混排
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfCombined_3200();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest3300
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_COMBINED_3300
     * @tc.desc   组合-modifier与内置混排
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfCombined_3300();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest3400
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_COMBINED_3400
     * @tc.desc   组合-type与内置混排
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfCombined_3400();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest3500
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_COMBINED_3500
     * @tc.desc   组合-星号宽度+注册字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfCombined_3500();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest3600
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_COMBINED_3600
     * @tc.desc   组合-星号精度+注册字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfCombined_3600();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest3700
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_COMBINED_3700
     * @tc.desc   组合-星号宽高+注册字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfCombined_3700();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest3800
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_COMBINED_3800
     * @tc.desc   组合-修饰符+星号+注册字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegModifierTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfCombined_3800();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest3900
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_COMBINED_3900
     * @tc.desc   组合-多参数字符arginfo返回3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegModifierTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfCombined_3900();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest4000
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_COMBINED_4000
     * @tc.desc   组合-多参数字符+后续参数不错位
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegModifierTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfCombined_4000();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest4100
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_COMBINED_4100
     * @tc.desc   交替-三接口交叉注册
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfCombined_4100();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest4200
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_COMBINED_4200
     * @tc.desc   交替-三接口资源独立
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfCombined_4200();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest4300
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_COMBINED_4300
     * @tc.desc   交替-注册-使用-覆盖-再使用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfCombined_4300();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest4400
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_COMBINED_4400
     * @tc.desc   交替-顺序无关性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegModifierTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfCombined_4400();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest4500
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_COMBINED_4500
     * @tc.desc   交替-修饰符影响两个specifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegModifierTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfCombined_4500();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest4600
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_COMBINED_4600
     * @tc.desc   组合-注册后fork子进程继承
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegModifierTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfCombined_4600();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest4700
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_COMBINED_4700
     * @tc.desc   组合-注册与输出并发
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfCombined_4700();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest4800
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_COMBINED_4800
     * @tc.desc   组合-三接口混合并发
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslPrintfRegModifierTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfCombined_4800();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest4900
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_COMBINED_4900
     * @tc.desc   组合-多线程errno隔离
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegModifierTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfCombined_4900();
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testMuslPrintfRegModifierTest5000
     * @tc.number SUB_THIRDPARTY_MUSL_PRINTF_COMBINED_5000
     * @tc.desc   组合-长时间并发压力无泄漏
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslPrintfRegModifierTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data: number = registerprintfmodifier.RegPrintfCombined_5000();
      expect(data).assertEqual(0);
      done();
    });
  })
}
