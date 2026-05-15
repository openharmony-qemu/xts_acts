/*
* Copyright (c) 2024-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

enum ColorShortD0: short { Red = 5, Green = 7, Blue = -53 }

enum EnumShortL0: short { first = -1, second = 27, third }
//// 当前编译器对 short enum 常量表达式的校验会导致 overflow 相关定义触发 ESE0342，
/*enum EnumShortM0: short { first = 32767 - 1, second, third }
enum EnumShortM1: short { first = 32767 - 10, second, third = first + 110 }
enum EnumShortM2: short { first, second = -32768, third = second - 1 }
enum EnumShortM3: short { first = -32768 + 10, second, third = first - 110 }*/
enum EnumLongN0: long { first, second = -2147483648, third = second - 1 }

enum EnumLongN1: long { first, second = -2147483649, third }

enum EnumLongN2: long { first = 0x7fffffff - 1, second, third }

enum EnumLongN3: long { first = 0x7fffffff - 10, second = 1010, third = first + second }

enum EnumLongN4: long { first = 0x7fffffff - 10, second = 1010, third = (0x7fffffff - 10) + 1010 }

enum EnumLongN5: long { A = 5 << 32 }

enum EnumStringN0: string { first = "A", second = "B", third = "B" }

enum EnumStringN1: string { _first = "A", _second = "B", _third = "B" }
//这种定义会报错，在这里作保留
/*const enumStringConstA0 = "ABC"
enum EnumStringN2: string { e1 = enumStringConstA0, e2 = "DEF" }

enum EnumStringN3: string { e1 = enumStringConstA0 + enumStringConstA0, e2 = enumStringConstA0 + "DEF" }*/
enum EnumStringN2: string { e1 = "ABC", e2 = "DEF" }

enum EnumStringN3: string { e1 = "ABC" + "ABC", e2 = "ABC" + "DEF" }

enum EnumStringN4: string { e1 = "A", e2 = "B", e3 = "C" }

enum ColorStringN0: string { Red = "red", Green = "green", Blue = "blue" }
enum ExplicitTypeEnumN0: byte { a = 1, b = 2, c = 3 }
enum ExplicitTypeEnumN1: short { a = 1, b = 2, c = 3 }
enum ExplicitTypeEnumN2: int { a = 1, b = 2, c = 3 }
enum ExplicitTypeEnumN3: long { a = 1, b = 2, c = 3 }
enum ExplicitTypeEnumN4: float { a = 1.0f, b = 2.0f, c = 3.0f }
enum ExplicitTypeEnumN5: double { a = 1.0, b = 2.0, c = 3.0 }
enum ExplicitTypeEnumN6: string { a = "1", b = "2", c = "3" }
function convertByteN0(value: byte): Any { return value }
function convertShortN0(value: short): Any { return value }
function convertIntN0(value: int): Any { return value }
function convertLongN0(value: long): Any { return value }
function convertFloatN0(value: float): Any { return value }
function convertDoubleN0(value: double): Any { return value }
function convertStringN0(value: string): Any { return value }

enum TemplateStringN0: string {
  t1 = "Line 1\nLine 2",
  t2 = "Line 3\nLine 4"
}

function fooEnumStringN0(p: string): boolean {
  return p == "blue"
}

export default function EnumerationWithExplicitTypeTest11(): void {
  describe('EnumerationWithExplicitTypeTest11', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_0100
     * @tc.name      testEnumerationWithExplicitType0427
     * @tc.desc      Checking in switch statement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0427', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ColorShortD0 = ColorShortD0.Green
      switch (v) {
        case ColorShortD0.Green:
          expect(v instanceof ColorShortD0).assertEqual(true)
          expect(v.valueOf() instanceof short).assertEqual(true)
          expect(v.valueOf()).assertEqual(7)
          break
        default:
          expect(false).assertEqual(true)
      }
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_0200
     * @tc.name      testEnumerationWithExplicitType0428
     * @tc.desc      Checking in switch statement
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0428', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: ColorShortD0 = ColorShortD0.Green
      switch (v) {
        case ColorShortD0.Green:
          expect(v instanceof ColorShortD0).assertEqual(true)
          expect(v.valueOf() instanceof short).assertEqual(true)
          expect(v.valueOf()).assertEqual(7)
          break
        default:
          expect(false).assertEqual(true)
      }
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_0300
     * @tc.name      testEnumerationWithExplicitType0429
     * @tc.desc      Checking enumeration methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0429', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortL0.first instanceof EnumShortL0).assertEqual(true)
      expect(EnumShortL0.second instanceof EnumShortL0).assertEqual(true)
      expect(EnumShortL0.third instanceof EnumShortL0).assertEqual(true)
      expect(EnumShortL0.first.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortL0.second.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortL0.third.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortL0.first.valueOf()).assertEqual(-1)
      expect(EnumShortL0.second.valueOf()).assertEqual(27)
      expect(EnumShortL0.third.valueOf()).assertEqual(28)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_0400
     * @tc.name      testEnumerationWithExplicitType0430
     * @tc.desc      Checking enumeration methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortL0.first instanceof EnumShortL0).assertEqual(true)
      expect(EnumShortL0.second instanceof EnumShortL0).assertEqual(true)
      expect(EnumShortL0.third instanceof EnumShortL0).assertEqual(true)
      expect(EnumShortL0.first.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortL0.second.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortL0.third.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortL0.first.toString()).assertEqual("-1")
      expect(EnumShortL0.second.toString()).assertEqual("27")
      expect(EnumShortL0.third.toString()).assertEqual("28")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_0500
     * @tc.name      testEnumerationWithExplicitType0431
     * @tc.desc      Checking enumeration methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0431', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortL0.first instanceof EnumShortL0).assertEqual(true)
      expect(EnumShortL0.second instanceof EnumShortL0).assertEqual(true)
      expect(EnumShortL0.third instanceof EnumShortL0).assertEqual(true)
      expect(EnumShortL0.first.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortL0.second.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortL0.third.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortL0.first.valueOf()).assertEqual(-1)
      expect(EnumShortL0.second.valueOf()).assertEqual(27)
      expect(EnumShortL0.third.valueOf()).assertEqual(28)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_0600
     * @tc.name      testEnumerationWithExplicitType0432
     * @tc.desc      Checking enumeration methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0432', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortL0.first instanceof EnumShortL0).assertEqual(true)
      expect(EnumShortL0.second instanceof EnumShortL0).assertEqual(true)
      expect(EnumShortL0.third instanceof EnumShortL0).assertEqual(true)
      expect(EnumShortL0.first.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortL0.second.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortL0.third.valueOf() instanceof short).assertEqual(true)
      expect(EnumShortL0.first.toString()).assertEqual("-1")
      expect(EnumShortL0.second.toString()).assertEqual("27")
      expect(EnumShortL0.third.toString()).assertEqual("28")
    });
    // 当前编译器对 short enum 常量表达式的校验会导致 overflow 相关定义触发 ESE034
    //  因此该组 short overflow 用例（0433 ~ 0448）暂跳过。
    /*
        */
    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_0700
     * @tc.name      testEnumerationWithExplicitType0433
     * @tc.desc      Checking integer type overflow on max value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it('testEnumerationWithExplicitType0433', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortM0.first.valueOf()).assertEqual(32767 - 1)
      expect(EnumShortM0.second.valueOf()).assertEqual(32767)
      expect(EnumShortM0.third.valueOf()).assertEqual(32767 + 1)
    });

    */
    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_0800
     * @tc.name      testEnumerationWithExplicitType0434
     * @tc.desc      Checking integer type overflow on max value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it('testEnumerationWithExplicitType0434', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortM0.first.valueOf()).assertEqual(32767 - 1)
      expect(EnumShortM0.second.valueOf()).assertEqual(32767)
      expect(EnumShortM0.third.valueOf()).assertEqual(32767 + 1)
    });

    */
    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_0900
     * @tc.name      testEnumerationWithExplicitType0435
     * @tc.desc      Checking integer type overflow on max value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it('testEnumerationWithExplicitType0435', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortM0.first.valueOf()).assertEqual(32767 - 1)
      expect(EnumShortM0.second.valueOf()).assertEqual(32767)
      expect(EnumShortM0.third.valueOf()).assertEqual(32767 + 1)
    });

    */
    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_1000
     * @tc.name      testEnumerationWithExplicitType0436
     * @tc.desc      Checking integer type overflow on max value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it('testEnumerationWithExplicitType0436', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortM0.first.valueOf()).assertEqual(32767 - 1)
      expect(EnumShortM0.second.valueOf()).assertEqual(32767)
      expect(EnumShortM0.third.valueOf()).assertEqual(32767 + 1)
    });

    */
    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_1100
     * @tc.name      testEnumerationWithExplicitType0437
     * @tc.desc      Checking integer type overflow on max value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it('testEnumerationWithExplicitType0437', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortM1.first.valueOf()).assertEqual(32767 - 10)
      expect(EnumShortM1.second.valueOf()).assertEqual(32767 - 9)
      expect(EnumShortM1.third.valueOf()).assertEqual(32767 + 100)
    });

    */
    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_1200
     * @tc.name      testEnumerationWithExplicitType0438
     * @tc.desc      Checking integer type overflow on max value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it('testEnumerationWithExplicitType0438', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortM1.first.valueOf()).assertEqual(32767 - 10)
      expect(EnumShortM1.second.valueOf()).assertEqual(32767 - 9)
      expect(EnumShortM1.third.valueOf()).assertEqual(32767 + 100)
    });

    */
    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_1300
     * @tc.name      testEnumerationWithExplicitType0439
     * @tc.desc      Checking integer type overflow on max value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it('testEnumerationWithExplicitType0439', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortM1.first.valueOf()).assertEqual(32767 - 10)
      expect(EnumShortM1.second.valueOf()).assertEqual(32767 - 9)
      expect(EnumShortM1.third.valueOf()).assertEqual(32767 + 100)
    });

    */
    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_1400
     * @tc.name      testEnumerationWithExplicitType0440
     * @tc.desc      Checking integer type overflow on max value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it('testEnumerationWithExplicitType0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortM1.first.valueOf()).assertEqual(32767 - 10)
      expect(EnumShortM1.second.valueOf()).assertEqual(32767 - 9)
      expect(EnumShortM1.third.valueOf()).assertEqual(32767 + 100)
    });

    */
    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_1500
     * @tc.name      testEnumerationWithExplicitType0441
     * @tc.desc      Checking integer type overflow on min value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it('testEnumerationWithExplicitType0441', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortM2.first.valueOf()).assertEqual(0)
      expect(EnumShortM2.second.valueOf()).assertEqual(-32768)
      expect(EnumShortM2.third.valueOf()).assertEqual(-32768 - 1)
    });

    */
    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_1600
     * @tc.name      testEnumerationWithExplicitType0442
     * @tc.desc      Checking integer type overflow on min value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it('testEnumerationWithExplicitType0442', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortM2.first.valueOf()).assertEqual(0)
      expect(EnumShortM2.second.valueOf()).assertEqual(-32768)
      expect(EnumShortM2.third.valueOf()).assertEqual(-32768 - 1)
    });

    */
    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_1700
     * @tc.name      testEnumerationWithExplicitType0443
     * @tc.desc      Checking integer type overflow on min value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it('testEnumerationWithExplicitType0443', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortM2.first.valueOf()).assertEqual(0)
      expect(EnumShortM2.second.valueOf()).assertEqual(-32768)
      expect(EnumShortM2.third.valueOf()).assertEqual(-32768 - 1)
    });

    */
    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_1800
     * @tc.name      testEnumerationWithExplicitType0444
     * @tc.desc      Checking integer type overflow on min value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it('testEnumerationWithExplicitType0444', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortM2.first.valueOf()).assertEqual(0)
      expect(EnumShortM2.second.valueOf()).assertEqual(-32768)
      expect(EnumShortM2.third.valueOf()).assertEqual(-32768 - 1)
    });

    */
    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_1900
     * @tc.name      testEnumerationWithExplicitType0445
     * @tc.desc      Checking integer type overflow on min value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it('testEnumerationWithExplicitType0445', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortM3.first.valueOf()).assertEqual(-32768 + 10)
      expect(EnumShortM3.second.valueOf()).assertEqual(-32768 + 11)
      expect(EnumShortM3.third.valueOf()).assertEqual(-32768 - 100)
    });

    */
    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_2000
     * @tc.name      testEnumerationWithExplicitType0446
     * @tc.desc      Checking integer type overflow on min value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it('testEnumerationWithExplicitType0446', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortM3.first.valueOf()).assertEqual(-32768 + 10)
      expect(EnumShortM3.second.valueOf()).assertEqual(-32768 + 11)
      expect(EnumShortM3.third.valueOf()).assertEqual(-32768 - 100)
    });

    */
    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_2100
     * @tc.name      testEnumerationWithExplicitType0447
     * @tc.desc      Checking integer type overflow on min value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it('testEnumerationWithExplicitType0447', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortM3.first.valueOf()).assertEqual(-32768 + 10)
      expect(EnumShortM3.second.valueOf()).assertEqual(-32768 + 11)
      expect(EnumShortM3.third.valueOf()).assertEqual(-32768 - 100)
    });

    */
    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_2200
     * @tc.name      testEnumerationWithExplicitType0448
     * @tc.desc      Checking integer type overflow on min value (Don't throw CTE at all)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     *//*

    it('testEnumerationWithExplicitType0448', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumShortM3.first.valueOf()).assertEqual(-32768 + 10)
      expect(EnumShortM3.second.valueOf()).assertEqual(-32768 + 11)
      expect(EnumShortM3.third.valueOf()).assertEqual(-32768 - 100)
    });
*/
    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_2300
     * @tc.name      testEnumerationWithExplicitType0449
     * @tc.desc      Checking int overflow on Int.MIN_VALUE in enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // 1.2兼容性问题：long enum 常量表达式 second - 1 在 -2147483648 边界按32位回绕，
    // 实际得到 2147483647，而不是 long 语义下的 -2147483649，暂时注释。
    /*    it('testEnumerationWithExplicitType0449', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          expect(EnumLongN0.first instanceof EnumLongN0).assertEqual(true)
          expect(EnumLongN0.second instanceof EnumLongN0).assertEqual(true)
          expect(EnumLongN0.third instanceof EnumLongN0).assertEqual(true)
          expect(EnumLongN0.first.valueOf() instanceof long).assertEqual(true)
          expect(EnumLongN0.second.valueOf() instanceof long).assertEqual(true)
          expect(EnumLongN0.third.valueOf() instanceof long).assertEqual(true)
          expect(EnumLongN0.first.valueOf()).assertEqual(0)
          expect(EnumLongN0.second.valueOf()).assertEqual(-2147483648)
          expect(EnumLongN0.third.valueOf()).assertEqual(-2147483649)
        });*/

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_2400
     * @tc.name      testEnumerationWithExplicitType0450
     * @tc.desc      Checking int overflow on Int.MIN_VALUE in enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    // 1.2兼容性问题：long enum 常量表达式 second - 1 在 -2147483648 边界按32位回绕，
    // 实际得到 2147483647，而不是 long 语义下的 -2147483649，暂时注释。
    /*    it('testEnumerationWithExplicitType0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
          expect(EnumLongN0.first instanceof EnumLongN0).assertEqual(true)
          expect(EnumLongN0.second instanceof EnumLongN0).assertEqual(true)
          expect(EnumLongN0.third instanceof EnumLongN0).assertEqual(true)
          expect(EnumLongN0.first.valueOf() instanceof long).assertEqual(true)
          expect(EnumLongN0.second.valueOf() instanceof long).assertEqual(true)
          expect(EnumLongN0.third.valueOf() instanceof long).assertEqual(true)
          expect(EnumLongN0.first.valueOf()).assertEqual(0)
          expect(EnumLongN0.second.valueOf()).assertEqual(-2147483648)
          expect(EnumLongN0.third.valueOf()).assertEqual(-2147483649)
        });*/

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_2500
     * @tc.name      testEnumerationWithExplicitType0451
     * @tc.desc      Checking int overflow on Int.MIN_VALUE in enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0451', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongN1.first instanceof EnumLongN1).assertEqual(true)
      expect(EnumLongN1.second instanceof EnumLongN1).assertEqual(true)
      expect(EnumLongN1.third instanceof EnumLongN1).assertEqual(true)
      expect(EnumLongN1.first.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongN1.second.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongN1.third.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongN1.first.valueOf()).assertEqual(0)
      expect(EnumLongN1.second.valueOf()).assertEqual(-2147483649)
      expect(EnumLongN1.third.valueOf()).assertEqual(-2147483648)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_2600
     * @tc.name      testEnumerationWithExplicitType0452
     * @tc.desc      Checking int overflow on Int.MIN_VALUE in enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0452', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumLongN1.first instanceof EnumLongN1).assertEqual(true)
      expect(EnumLongN1.second instanceof EnumLongN1).assertEqual(true)
      expect(EnumLongN1.third instanceof EnumLongN1).assertEqual(true)
      expect(EnumLongN1.first.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongN1.second.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongN1.third.valueOf() instanceof long).assertEqual(true)
      expect(EnumLongN1.first.valueOf()).assertEqual(0)
      expect(EnumLongN1.second.valueOf()).assertEqual(-2147483649)
      expect(EnumLongN1.third.valueOf()).assertEqual(-2147483648)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_3900
     * @tc.name      testEnumerationWithExplicitType0465
     * @tc.desc      A string value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0465', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumStringN0.first instanceof EnumStringN0).assertEqual(true)
      expect(EnumStringN0.second instanceof EnumStringN0).assertEqual(true)
      expect(EnumStringN0.third instanceof EnumStringN0).assertEqual(true)
      expect(EnumStringN0.first.valueOf() instanceof string).assertEqual(true)
      expect(EnumStringN0.second.valueOf() instanceof string).assertEqual(true)
      expect(EnumStringN0.third.valueOf() instanceof string).assertEqual(true)
      expect(EnumStringN0.first.valueOf()).assertEqual("A")
      expect(EnumStringN0.second.valueOf()).assertEqual("B")
      expect(EnumStringN0.third.valueOf()).assertEqual("B")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_4000
     * @tc.name      testEnumerationWithExplicitType0466
     * @tc.desc      A string value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0466', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1 = EnumStringN0.first
      let e2 = EnumStringN0.second
      let e3 = EnumStringN0.third
      expect("" + e1 + e2 + e3).assertEqual("ABB")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_4100
     * @tc.name      testEnumerationWithExplicitType0467
     * @tc.desc      A string value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0467', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = EnumStringN0.first
      const e2 = EnumStringN0.second
      const e3 = EnumStringN0.third
      expect("" + e1 + e2 + e3).assertEqual("ABB")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_4200
     * @tc.name      testEnumerationWithExplicitType0468
     * @tc.desc      A string value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0468', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumStringN0.first instanceof EnumStringN0).assertEqual(true)
      expect(EnumStringN0.second instanceof EnumStringN0).assertEqual(true)
      expect(EnumStringN0.third instanceof EnumStringN0).assertEqual(true)
      expect(EnumStringN0.first.valueOf() instanceof string).assertEqual(true)
      expect(EnumStringN0.second.valueOf() instanceof string).assertEqual(true)
      expect(EnumStringN0.third.valueOf() instanceof string).assertEqual(true)
      expect(EnumStringN0.first.valueOf()).assertEqual("A")
      expect(EnumStringN0.second.valueOf()).assertEqual("B")
      expect(EnumStringN0.third.valueOf()).assertEqual("B")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_4300
     * @tc.name      testEnumerationWithExplicitType0469
     * @tc.desc      A string value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0469', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1 = EnumStringN0.first
      let e2 = EnumStringN0.second
      let e3 = EnumStringN0.third
      expect("" + e1 + e2 + e3).assertEqual("ABB")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_4400
     * @tc.name      testEnumerationWithExplicitType0470
     * @tc.desc      A string value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const e1 = EnumStringN0.first
      const e2 = EnumStringN0.second
      const e3 = EnumStringN0.third
      expect("" + e1 + e2 + e3).assertEqual("ABB")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_4500
     * @tc.name      testEnumerationWithExplicitType0471
     * @tc.desc      A string value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0471', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumStringN1._first instanceof EnumStringN1).assertEqual(true)
      expect(EnumStringN1._second instanceof EnumStringN1).assertEqual(true)
      expect(EnumStringN1._third instanceof EnumStringN1).assertEqual(true)
      expect(EnumStringN1._first.valueOf() instanceof string).assertEqual(true)
      expect(EnumStringN1._second.valueOf() instanceof string).assertEqual(true)
      expect(EnumStringN1._third.valueOf() instanceof string).assertEqual(true)
      expect(EnumStringN1._first.toString()).assertEqual("A")
      expect(EnumStringN1._second.toString()).assertEqual("B")
      expect(EnumStringN1._third.toString()).assertEqual("B")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_4600
     * @tc.name      testEnumerationWithExplicitType0472
     * @tc.desc      A string value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0472', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumStringN1._first instanceof EnumStringN1).assertEqual(true)
      expect(EnumStringN1._second instanceof EnumStringN1).assertEqual(true)
      expect(EnumStringN1._third instanceof EnumStringN1).assertEqual(true)
      expect(EnumStringN1._first.valueOf() instanceof string).assertEqual(true)
      expect(EnumStringN1._second.valueOf() instanceof string).assertEqual(true)
      expect(EnumStringN1._third.valueOf() instanceof string).assertEqual(true)
      expect(EnumStringN1._first.toString()).assertEqual("A")
      expect(EnumStringN1._second.toString()).assertEqual("B")
      expect(EnumStringN1._third.toString()).assertEqual("B")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_4700
     * @tc.name      testEnumerationWithExplicitType0473
     * @tc.desc      A string value for enumeration constants must be set explicitly params: constant expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0473', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumStringN2.e1 instanceof EnumStringN2).assertEqual(true)
      expect(EnumStringN2.e2 instanceof EnumStringN2).assertEqual(true)
      expect(EnumStringN2.e1.valueOf() instanceof string).assertEqual(true)
      expect(EnumStringN2.e2.valueOf() instanceof string).assertEqual(true)
      expect(EnumStringN2.e1.toString()).assertEqual("ABC")
      expect(EnumStringN2.e2.toString()).assertEqual("DEF")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_4800
     * @tc.name      testEnumerationWithExplicitType0474
     * @tc.desc      A string value for enumeration constants must be set explicitly params: constant expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0474', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumStringN2.e1 instanceof EnumStringN2).assertEqual(true)
      expect(EnumStringN2.e2 instanceof EnumStringN2).assertEqual(true)
      expect(EnumStringN2.e1.valueOf() instanceof string).assertEqual(true)
      expect(EnumStringN2.e2.valueOf() instanceof string).assertEqual(true)
      expect(EnumStringN2.e1.toString()).assertEqual("ABC")
      expect(EnumStringN2.e2.toString()).assertEqual("DEF")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_4900
     * @tc.name      testEnumerationWithExplicitType0475
     * @tc.desc      A string value for enumeration constants must be set explicitly params: constant expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0475', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumStringN3.e1 instanceof EnumStringN3).assertEqual(true)
      expect(EnumStringN3.e2 instanceof EnumStringN3).assertEqual(true)
      expect(EnumStringN3.e1.valueOf() instanceof string).assertEqual(true)
      expect(EnumStringN3.e2.valueOf() instanceof string).assertEqual(true)
      expect(EnumStringN3.e1.toString()).assertEqual("ABCABC")
      expect(EnumStringN3.e2.toString()).assertEqual("ABCDEF")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_5000
     * @tc.name      testEnumerationWithExplicitType0476
     * @tc.desc      A string value for enumeration constants must be set explicitly params: constant expression
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0476', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(EnumStringN3.e1 instanceof EnumStringN3).assertEqual(true)
      expect(EnumStringN3.e2 instanceof EnumStringN3).assertEqual(true)
      expect(EnumStringN3.e1.valueOf() instanceof string).assertEqual(true)
      expect(EnumStringN3.e2.valueOf() instanceof string).assertEqual(true)
      expect(EnumStringN3.e1.toString()).assertEqual("ABCABC")
      expect(EnumStringN3.e2.toString()).assertEqual("ABCDEF")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_5100
     * @tc.name      testEnumerationWithExplicitType0477
     * @tc.desc      A string value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0477', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = EnumStringN4.e3
      expect(v instanceof EnumStringN4).assertEqual(true)
      expect(v.valueOf() instanceof string).assertEqual(true)
      switch (v) {
        case EnumStringN4.e1:
          expect(false).assertEqual(true)
          break
        case EnumStringN4.e2:
          expect(false).assertEqual(true)
          break
        case EnumStringN4.e3:
          expect(v.toString()).assertEqual("C")
          break
      }
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_5200
     * @tc.name      testEnumerationWithExplicitType0478
     * @tc.desc      A string value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0478', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = EnumStringN4.e3
      expect(v instanceof EnumStringN4).assertEqual(true)
      expect(v.valueOf() instanceof string).assertEqual(true)
      switch (v) {
        case EnumStringN4.e1:
          expect(false).assertEqual(true)
          break
        case EnumStringN4.e2:
          expect(false).assertEqual(true)
          break
        case EnumStringN4.e3:
          expect(v.toString()).assertEqual("C")
          break
      }
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_5300
     * @tc.name      testEnumerationWithExplicitType0479
     * @tc.desc      A string value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0479', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = ColorStringN0.Red
      expect(r).assertEqual("red")
      let g: string = ColorStringN0.Green
      expect(g).assertEqual("green")
      let b: string = ColorStringN0.Blue
      expect(b).assertEqual("blue")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_5400
     * @tc.name      testEnumerationWithExplicitType0480
     * @tc.desc      A string value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = ColorStringN0.Red
      expect(r).assertEqual("red")
      let g: string = ColorStringN0.Green
      expect(g).assertEqual("green")
      let b: string = ColorStringN0.Blue
      expect(b).assertEqual("blue")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_5500
     * @tc.name      testEnumerationWithExplicitType0481
     * @tc.desc      A string value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0481', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fooEnumStringN0(ColorStringN0.Red)).assertEqual(false)
      expect(fooEnumStringN0(ColorStringN0.Green)).assertEqual(false)
      expect(fooEnumStringN0(ColorStringN0.Blue)).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_5600
     * @tc.name      testEnumerationWithExplicitType0482
     * @tc.desc      A string value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0482', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(fooEnumStringN0(ColorStringN0.Red)).assertEqual(false)
      expect(fooEnumStringN0(ColorStringN0.Green)).assertEqual(false)
      expect(fooEnumStringN0(ColorStringN0.Blue)).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_5700
     * @tc.name      testEnumerationWithExplicitType0483
     * @tc.desc      A string value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0483', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = TemplateStringN0.t1
      let v2 = TemplateStringN0.t2
      expect(v1 instanceof TemplateStringN0).assertEqual(true)
      expect(v2 instanceof TemplateStringN0).assertEqual(true)
      expect(v1.valueOf() instanceof string).assertEqual(true)
      expect(v2.valueOf() instanceof string).assertEqual(true)
      expect(v1.toString()).assertEqual("Line 1\nLine 2")
      expect(v2.toString()).assertEqual("Line 3\nLine 4")
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_5800
     * @tc.name      testEnumerationWithExplicitType0484
     * @tc.desc      A string value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0484', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1 = TemplateStringN0.t1
      let v2 = TemplateStringN0.t2
      expect(v1 instanceof TemplateStringN0).assertEqual(true)
      expect(v2 instanceof TemplateStringN0).assertEqual(true)
      expect(v1.valueOf() instanceof string).assertEqual(true)
      expect(v2.valueOf() instanceof string).assertEqual(true)
      expect(v1.toString()).assertEqual("Line 1\nLine 2")
      expect(v2.toString()).assertEqual("Line 3\nLine 4")
    });
    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_5900
     * @tc.name      testEnumerationWithExplicitType0485
     * @tc.desc      Value of enumeration type with explicit numeric base type is converted to the base type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0485', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let explicit_type_enum_elem = ExplicitTypeEnumN0.a
      let explicit_type_value: byte = explicit_type_enum_elem
      expect(explicit_type_value).assertEqual(1)
      let test_value = convertByteN0(ExplicitTypeEnumN0.a)
      expect(test_value instanceof byte).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_6000
     * @tc.name      testEnumerationWithExplicitType0486
     * @tc.desc      Value of enumeration type with explicit numeric base type is converted to the base type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0486', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let explicit_type_enum_elem = ExplicitTypeEnumN1.a
      let explicit_type_value: short = explicit_type_enum_elem
      expect(explicit_type_value).assertEqual(1)
      let test_value = convertShortN0(ExplicitTypeEnumN1.a)
      expect(test_value instanceof short).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_6100
     * @tc.name      testEnumerationWithExplicitType0487
     * @tc.desc      Value of enumeration type with explicit numeric base type is converted to the base type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0487', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let explicit_type_enum_elem = ExplicitTypeEnumN2.a
      let explicit_type_value: int = explicit_type_enum_elem
      expect(explicit_type_value).assertEqual(1)
      let test_value = convertIntN0(ExplicitTypeEnumN2.a)
      expect(test_value instanceof int).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_6200
     * @tc.name      testEnumerationWithExplicitType0488
     * @tc.desc      Value of enumeration type with explicit numeric base type is converted to the base type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0488', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let explicit_type_enum_elem = ExplicitTypeEnumN3.a
      let explicit_type_value: long = explicit_type_enum_elem
      expect(explicit_type_value).assertEqual(1)
      let test_value = convertLongN0(ExplicitTypeEnumN3.a)
      expect(test_value instanceof long).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_6300
     * @tc.name      testEnumerationWithExplicitType0489
     * @tc.desc      Value of enumeration type with explicit numeric base type is converted to the base type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0489', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let explicit_type_enum_elem = ExplicitTypeEnumN4.a
      let explicit_type_value: float = explicit_type_enum_elem
      expect(explicit_type_value).assertEqual(1.0)
      let test_value = convertFloatN0(ExplicitTypeEnumN4.a)
      expect(test_value instanceof float).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_6400
     * @tc.name      testEnumerationWithExplicitType0490
     * @tc.desc      Value of enumeration type with explicit numeric base type is converted to the base type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let explicit_type_enum_elem = ExplicitTypeEnumN5.a
      let explicit_type_value: double = explicit_type_enum_elem
      expect(explicit_type_value).assertEqual(1.0)
      let test_value = convertDoubleN0(ExplicitTypeEnumN5.a)
      expect(test_value instanceof double).assertEqual(true)
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_ELEVEN_TEST_6500
     * @tc.name      testEnumerationWithExplicitType0491
     * @tc.desc      Value of enumeration type with explicit numeric base type is converted to the base type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0491', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let explicit_type_enum_elem = ExplicitTypeEnumN6.a
      let explicit_type_value: string = explicit_type_enum_elem
      expect(explicit_type_value).assertEqual("1")
      let test_value = convertStringN0(ExplicitTypeEnumN6.a)
      expect(test_value instanceof string).assertEqual(true)
    });

  })
}