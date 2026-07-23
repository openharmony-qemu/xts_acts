'use static'
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
import Utils from '../../../Util.test'

enum Enum26: float {
  first = 1.1f,
  second = 1.2f,
  third = 1.3f
}

enum Enum27: float {
  first = 10e1f,
  second = 1.2f,
  third = 1.1f
}

enum Enum28: float {
  first = 3.4018235e+38f,
  second = 3.4028235e+38f
}
// 说明:当前编译器支持 float enum，但只支持字面量初始化，不支持常量引用/表达式初始化。
/*const floatConstA0: float = 1.23f;
const floatConstB0: float = 1.234f;
enum Enum29: float {
  first = floatConstA0,
  second = floatConstB0,
  third = floatConstB0 - 1.1f
}*/
enum Enum29: float {
  first = 1.23f,
  second = 1.234f,
  third = 0.134f
}
enum Enum30: float {
  first = -1.1f,
  second = -1.2f,
  third = -42.43f
}
enum ColorsInt: int {
  Red = 1,
  Green,
  Blue = 4
}

enum ConstColorsInt: int {
  Red = 1,
  Green,
  Blue = 4
}

enum ColorsLong: long {
  Red = 0x7FFF_FFFF_1,
  Green,
  Blue = 0x7FFF_FFFF_4
}

enum ConstColorsLong: long {
  Red = 0x7FFF_FFFF_1,
  Green,
  Blue = 0x7FFF_FFFF_4
}

enum ColorsStr: string {
  Red = "One",
  Green = "Two",
  Blue = "Three"
}

enum ConstColorsStr: string {
  Red = "One",
  Green = "Two",
  Blue = "Three"
}

enum ColorsByte: byte {
  Red = 1,
  Green,
  Blue = 4
}

enum ConstColorsByte: byte {
  Red = 1,
  Green,
  Blue = 4
}

enum ColorsShort: short {
  Red = 1,
  Green,
  Blue = 4
}

enum ConstColorsShort: short {
  Red = 1,
  Green,
  Blue = 4
}

enum ColorsFloat: float {
  Red = -1.5f,
  Green = -6.8f,
  Blue = 42.43f
}

enum ConstColorsFloat: float {
  Red = -1.5f,
  Green = -6.8f,
  Blue = 42.43f
}

enum ColorsDouble: double {
  Red = -1.5,
  Green = -6.8,
  Blue = 42.43
}

enum ConstColorsDouble: double {
  Red = -1.5,
  Green = -6.8,
  Blue = 42.43
}

export default function EnumerationWithExplicitTypeTest05(): void {
  describe('EnumerationWithExplicitTypeTest05', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
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
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FIVE_TEST_0100
     * @tc.name      testEnumerationWithExplicitType0085
     * @tc.desc      If enumeration type is exported, then all enumeration constants are exported along with the mandatory qualification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ColorsInt = ColorsInt.Red;
      let g: ColorsInt = ColorsInt.Green;
      let b: ColorsInt = ColorsInt.Blue;
      let r2 = ColorsInt.Red;
      let g2 = ColorsInt.Green;
      let b2 = ColorsInt.Blue;
      expect(r instanceof ColorsInt).assertEqual(true);
      expect(g instanceof ColorsInt).assertEqual(true);
      expect(b instanceof ColorsInt).assertEqual(true);
      expect(r).assertEqual(1);
      expect(g).assertEqual(2);
      expect(b).assertEqual(4);
      expect(r2 instanceof ColorsInt).assertEqual(true);
      expect(g2 instanceof ColorsInt).assertEqual(true);
      expect(b2 instanceof ColorsInt).assertEqual(true);
      expect(r2).assertEqual(1);
      expect(g2).assertEqual(2);
      expect(b2).assertEqual(4);
      expect(ColorsInt.Red instanceof ColorsInt).assertEqual(true);
      expect(ColorsInt.Green instanceof ColorsInt).assertEqual(true);
      expect(ColorsInt.Blue instanceof ColorsInt).assertEqual(true);
      expect(ColorsInt.Red.valueOf() instanceof int).assertEqual(true);
      expect(ColorsInt.Green.valueOf() instanceof int).assertEqual(true);
      expect(ColorsInt.Blue.valueOf() instanceof int).assertEqual(true);
      expect(ColorsInt.Red).assertEqual(1);
      expect(ColorsInt.Green).assertEqual(2);
      expect(ColorsInt.Blue).assertEqual(4);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FIVE_TEST_0200
     * @tc.name      testEnumerationWithExplicitType0086
     * @tc.desc      If enumeration type is exported, then all enumeration constants are exported along with the mandatory qualification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ConstColorsInt = ConstColorsInt.Red;
      let g: ConstColorsInt = ConstColorsInt.Green;
      let b: ConstColorsInt = ConstColorsInt.Blue;
      let r2 = ConstColorsInt.Red;
      let g2 = ConstColorsInt.Green;
      let b2 = ConstColorsInt.Blue;
      expect(r instanceof ConstColorsInt).assertEqual(true);
      expect(g instanceof ConstColorsInt).assertEqual(true);
      expect(b instanceof ConstColorsInt).assertEqual(true);
      expect(r).assertEqual(1);
      expect(g).assertEqual(2);
      expect(b).assertEqual(4);
      expect(r2 instanceof ConstColorsInt).assertEqual(true);
      expect(g2 instanceof ConstColorsInt).assertEqual(true);
      expect(b2 instanceof ConstColorsInt).assertEqual(true);
      expect(r2).assertEqual(1);
      expect(g2).assertEqual(2);
      expect(b2).assertEqual(4);
      expect(ConstColorsInt.Red instanceof ConstColorsInt).assertEqual(true);
      expect(ConstColorsInt.Green instanceof ConstColorsInt).assertEqual(true);
      expect(ConstColorsInt.Blue instanceof ConstColorsInt).assertEqual(true);
      expect(ConstColorsInt.Red.valueOf() instanceof int).assertEqual(true);
      expect(ConstColorsInt.Green.valueOf() instanceof int).assertEqual(true);
      expect(ConstColorsInt.Blue.valueOf() instanceof int).assertEqual(true);
      expect(ConstColorsInt.Red).assertEqual(1);
      expect(ConstColorsInt.Green).assertEqual(2);
      expect(ConstColorsInt.Blue).assertEqual(4);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FIVE_TEST_0300
     * @tc.name      testEnumerationWithExplicitType0087
     * @tc.desc      If enumeration type is exported, then all enumeration constants are exported along with the mandatory qualification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ColorsLong = ColorsLong.Red;
      let g: ColorsLong = ColorsLong.Green;
      let b: ColorsLong = ColorsLong.Blue;
      let r2 = ColorsLong.Red;
      let g2 = ColorsLong.Green;
      let b2 = ColorsLong.Blue;
      expect(r instanceof ColorsLong).assertEqual(true);
      expect(g instanceof ColorsLong).assertEqual(true);
      expect(b instanceof ColorsLong).assertEqual(true);
      expect(r).assertEqual(0x7FFF_FFFF_1);
      expect(g).assertEqual(0x7FFF_FFFF_2);
      expect(b).assertEqual(0x7FFF_FFFF_4);
      expect(r2 instanceof ColorsLong).assertEqual(true);
      expect(g2 instanceof ColorsLong).assertEqual(true);
      expect(b2 instanceof ColorsLong).assertEqual(true);
      expect(r2).assertEqual(0x7FFF_FFFF_1);
      expect(g2).assertEqual(0x7FFF_FFFF_2);
      expect(b2).assertEqual(0x7FFF_FFFF_4);
      expect(ColorsLong.Red instanceof ColorsLong).assertEqual(true);
      expect(ColorsLong.Green instanceof ColorsLong).assertEqual(true);
      expect(ColorsLong.Blue instanceof ColorsLong).assertEqual(true);
      expect(ColorsLong.Red.valueOf() instanceof long).assertEqual(true);
      expect(ColorsLong.Green.valueOf() instanceof long).assertEqual(true);
      expect(ColorsLong.Blue.valueOf() instanceof long).assertEqual(true);
      expect(ColorsLong.Red).assertEqual(0x7FFF_FFFF_1);
      expect(ColorsLong.Green).assertEqual(0x7FFF_FFFF_2);
      expect(ColorsLong.Blue).assertEqual(0x7FFF_FFFF_4);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FIVE_TEST_0400
     * @tc.name      testEnumerationWithExplicitType0088
     * @tc.desc      If enumeration type is exported, then all enumeration constants are exported along with the mandatory qualification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ConstColorsLong = ConstColorsLong.Red;
      let g: ConstColorsLong = ConstColorsLong.Green;
      let b: ConstColorsLong = ConstColorsLong.Blue;
      let r2 = ConstColorsLong.Red;
      let g2 = ConstColorsLong.Green;
      let b2 = ConstColorsLong.Blue;
      expect(r instanceof ConstColorsLong).assertEqual(true);
      expect(g instanceof ConstColorsLong).assertEqual(true);
      expect(b instanceof ConstColorsLong).assertEqual(true);
      expect(r).assertEqual(0x7FFF_FFFF_1);
      expect(g).assertEqual(0x7FFF_FFFF_2);
      expect(b).assertEqual(0x7FFF_FFFF_4);
      expect(r2 instanceof ConstColorsLong).assertEqual(true);
      expect(g2 instanceof ConstColorsLong).assertEqual(true);
      expect(b2 instanceof ConstColorsLong).assertEqual(true);
      expect(r2).assertEqual(0x7FFF_FFFF_1);
      expect(g2).assertEqual(0x7FFF_FFFF_2);
      expect(b2).assertEqual(0x7FFF_FFFF_4);
      expect(ConstColorsLong.Red instanceof ConstColorsLong).assertEqual(true);
      expect(ConstColorsLong.Green instanceof ConstColorsLong).assertEqual(true);
      expect(ConstColorsLong.Blue instanceof ConstColorsLong).assertEqual(true);
      expect(ConstColorsLong.Red.valueOf() instanceof long).assertEqual(true);
      expect(ConstColorsLong.Green.valueOf() instanceof long).assertEqual(true);
      expect(ConstColorsLong.Blue.valueOf() instanceof long).assertEqual(true);
      expect(ConstColorsLong.Red).assertEqual(0x7FFF_FFFF_1);
      expect(ConstColorsLong.Green).assertEqual(0x7FFF_FFFF_2);
      expect(ConstColorsLong.Blue).assertEqual(0x7FFF_FFFF_4);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FIVE_TEST_0500
     * @tc.name      testEnumerationWithExplicitType0089
     * @tc.desc      If enumeration type is exported, then all enumeration constants are exported along with the mandatory qualification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ColorsStr = ColorsStr.Red;
      let g: ColorsStr = ColorsStr.Green;
      let b: ColorsStr = ColorsStr.Blue;
      let r2 = ColorsStr.Red;
      let g2 = ColorsStr.Green;
      let b2 = ColorsStr.Blue;
      expect(r instanceof ColorsStr).assertEqual(true);
      expect(g instanceof ColorsStr).assertEqual(true);
      expect(b instanceof ColorsStr).assertEqual(true);
      expect(r).assertEqual("One");
      expect(g).assertEqual("Two");
      expect(b).assertEqual("Three");
      expect(r2 instanceof ColorsStr).assertEqual(true);
      expect(g2 instanceof ColorsStr).assertEqual(true);
      expect(b2 instanceof ColorsStr).assertEqual(true);
      expect(r2).assertEqual("One");
      expect(g2).assertEqual("Two");
      expect(b2).assertEqual("Three");
      expect(ColorsStr.Red instanceof ColorsStr).assertEqual(true);
      expect(ColorsStr.Green instanceof ColorsStr).assertEqual(true);
      expect(ColorsStr.Blue instanceof ColorsStr).assertEqual(true);
      expect(ColorsStr.Red.valueOf() instanceof string).assertEqual(true);
      expect(ColorsStr.Green.valueOf() instanceof string).assertEqual(true);
      expect(ColorsStr.Blue.valueOf() instanceof string).assertEqual(true);
      expect(ColorsStr.Red).assertEqual("One");
      expect(ColorsStr.Green).assertEqual("Two");
      expect(ColorsStr.Blue).assertEqual("Three");
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FIVE_TEST_0600
     * @tc.name      testEnumerationWithExplicitType0090
     * @tc.desc      If enumeration type is exported, then all enumeration constants are exported along with the mandatory qualification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ConstColorsStr = ConstColorsStr.Red;
      let g: ConstColorsStr = ConstColorsStr.Green;
      let b: ConstColorsStr = ConstColorsStr.Blue;
      let r2 = ConstColorsStr.Red;
      let g2 = ConstColorsStr.Green;
      let b2 = ConstColorsStr.Blue;
      expect(r instanceof ConstColorsStr).assertEqual(true);
      expect(g instanceof ConstColorsStr).assertEqual(true);
      expect(b instanceof ConstColorsStr).assertEqual(true);
      expect(r).assertEqual("One");
      expect(g).assertEqual("Two");
      expect(b).assertEqual("Three");
      expect(r2 instanceof ConstColorsStr).assertEqual(true);
      expect(g2 instanceof ConstColorsStr).assertEqual(true);
      expect(b2 instanceof ConstColorsStr).assertEqual(true);
      expect(r2).assertEqual("One");
      expect(g2).assertEqual("Two");
      expect(b2).assertEqual("Three");
      expect(ConstColorsStr.Red instanceof ConstColorsStr).assertEqual(true);
      expect(ConstColorsStr.Green instanceof ConstColorsStr).assertEqual(true);
      expect(ConstColorsStr.Blue instanceof ConstColorsStr).assertEqual(true);
      expect(ConstColorsStr.Red.valueOf() instanceof string).assertEqual(true);
      expect(ConstColorsStr.Green.valueOf() instanceof string).assertEqual(true);
      expect(ConstColorsStr.Blue.valueOf() instanceof string).assertEqual(true);
      expect(ConstColorsStr.Red).assertEqual("One");
      expect(ConstColorsStr.Green).assertEqual("Two");
      expect(ConstColorsStr.Blue).assertEqual("Three");
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FIVE_TEST_0700
     * @tc.name      testEnumerationWithExplicitType0091
     * @tc.desc      If enumeration type is exported, then all enumeration constants are exported along with the mandatory qualification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ColorsByte = ColorsByte.Red;
      let g: ColorsByte = ColorsByte.Green;
      let b: ColorsByte = ColorsByte.Blue;
      let r2 = ColorsByte.Red;
      let g2 = ColorsByte.Green;
      let b2 = ColorsByte.Blue;
      expect(r instanceof ColorsByte).assertEqual(true);
      expect(g instanceof ColorsByte).assertEqual(true);
      expect(b instanceof ColorsByte).assertEqual(true);
      expect(r).assertEqual(1);
      expect(g).assertEqual(2);
      expect(b).assertEqual(4);
      expect(r2 instanceof ColorsByte).assertEqual(true);
      expect(g2 instanceof ColorsByte).assertEqual(true);
      expect(b2 instanceof ColorsByte).assertEqual(true);
      expect(r2).assertEqual(1);
      expect(g2).assertEqual(2);
      expect(b2).assertEqual(4);
      expect(ColorsByte.Red instanceof ColorsByte).assertEqual(true);
      expect(ColorsByte.Green instanceof ColorsByte).assertEqual(true);
      expect(ColorsByte.Blue instanceof ColorsByte).assertEqual(true);
      expect(ColorsByte.Red.valueOf() instanceof byte).assertEqual(true);
      expect(ColorsByte.Green.valueOf() instanceof byte).assertEqual(true);
      expect(ColorsByte.Blue.valueOf() instanceof byte).assertEqual(true);
      expect(ColorsByte.Red).assertEqual(1);
      expect(ColorsByte.Green).assertEqual(2);
      expect(ColorsByte.Blue).assertEqual(4);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FIVE_TEST_0800
     * @tc.name      testEnumerationWithExplicitType0092
     * @tc.desc      If enumeration type is exported, then all enumeration constants are exported along with the mandatory qualification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ConstColorsByte = ConstColorsByte.Red;
      let g: ConstColorsByte = ConstColorsByte.Green;
      let b: ConstColorsByte = ConstColorsByte.Blue;
      let r2 = ConstColorsByte.Red;
      let g2 = ConstColorsByte.Green;
      let b2 = ConstColorsByte.Blue;
      expect(r instanceof ConstColorsByte).assertEqual(true);
      expect(g instanceof ConstColorsByte).assertEqual(true);
      expect(b instanceof ConstColorsByte).assertEqual(true);
      expect(r).assertEqual(1);
      expect(g).assertEqual(2);
      expect(b).assertEqual(4);
      expect(r2 instanceof ConstColorsByte).assertEqual(true);
      expect(g2 instanceof ConstColorsByte).assertEqual(true);
      expect(b2 instanceof ConstColorsByte).assertEqual(true);
      expect(r2).assertEqual(1);
      expect(g2).assertEqual(2);
      expect(b2).assertEqual(4);
      expect(ConstColorsByte.Red instanceof ConstColorsByte).assertEqual(true);
      expect(ConstColorsByte.Green instanceof ConstColorsByte).assertEqual(true);
      expect(ConstColorsByte.Blue instanceof ConstColorsByte).assertEqual(true);
      expect(ConstColorsByte.Red.valueOf() instanceof byte).assertEqual(true);
      expect(ConstColorsByte.Green.valueOf() instanceof byte).assertEqual(true);
      expect(ConstColorsByte.Blue.valueOf() instanceof byte).assertEqual(true);
      expect(ConstColorsByte.Red).assertEqual(1);
      expect(ConstColorsByte.Green).assertEqual(2);
      expect(ConstColorsByte.Blue).assertEqual(4);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FIVE_TEST_0900
     * @tc.name      testEnumerationWithExplicitType0093
     * @tc.desc      If enumeration type is exported, then all enumeration constants are exported along with the mandatory qualification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ColorsShort = ColorsShort.Red;
      let g: ColorsShort = ColorsShort.Green;
      let b: ColorsShort = ColorsShort.Blue;
      let r2 = ColorsShort.Red;
      let g2 = ColorsShort.Green;
      let b2 = ColorsShort.Blue;
      expect(r instanceof ColorsShort).assertEqual(true);
      expect(g instanceof ColorsShort).assertEqual(true);
      expect(b instanceof ColorsShort).assertEqual(true);
      expect(r).assertEqual(1);
      expect(g).assertEqual(2);
      expect(b).assertEqual(4);
      expect(r2 instanceof ColorsShort).assertEqual(true);
      expect(g2 instanceof ColorsShort).assertEqual(true);
      expect(b2 instanceof ColorsShort).assertEqual(true);
      expect(r2).assertEqual(1);
      expect(g2).assertEqual(2);
      expect(b2).assertEqual(4);
      expect(ColorsShort.Red instanceof ColorsShort).assertEqual(true);
      expect(ColorsShort.Green instanceof ColorsShort).assertEqual(true);
      expect(ColorsShort.Blue instanceof ColorsShort).assertEqual(true);
      expect(ColorsShort.Red.valueOf() instanceof short).assertEqual(true);
      expect(ColorsShort.Green.valueOf() instanceof short).assertEqual(true);
      expect(ColorsShort.Blue.valueOf() instanceof short).assertEqual(true);
      expect(ColorsShort.Red).assertEqual(1);
      expect(ColorsShort.Green).assertEqual(2);
      expect(ColorsShort.Blue).assertEqual(4);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FIVE_TEST_1000
     * @tc.name      testEnumerationWithExplicitType0094
     * @tc.desc      If enumeration type is exported, then all enumeration constants are exported along with the mandatory qualification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ConstColorsShort = ConstColorsShort.Red;
      let g: ConstColorsShort = ConstColorsShort.Green;
      let b: ConstColorsShort = ConstColorsShort.Blue;
      let r2 = ConstColorsShort.Red;
      let g2 = ConstColorsShort.Green;
      let b2 = ConstColorsShort.Blue;
      expect(r instanceof ConstColorsShort).assertEqual(true);
      expect(g instanceof ConstColorsShort).assertEqual(true);
      expect(b instanceof ConstColorsShort).assertEqual(true);
      expect(r).assertEqual(1);
      expect(g).assertEqual(2);
      expect(b).assertEqual(4);
      expect(r2 instanceof ConstColorsShort).assertEqual(true);
      expect(g2 instanceof ConstColorsShort).assertEqual(true);
      expect(b2 instanceof ConstColorsShort).assertEqual(true);
      expect(r2).assertEqual(1);
      expect(g2).assertEqual(2);
      expect(b2).assertEqual(4);
      expect(ConstColorsShort.Red instanceof ConstColorsShort).assertEqual(true);
      expect(ConstColorsShort.Green instanceof ConstColorsShort).assertEqual(true);
      expect(ConstColorsShort.Blue instanceof ConstColorsShort).assertEqual(true);
      expect(ConstColorsShort.Red.valueOf() instanceof short).assertEqual(true);
      expect(ConstColorsShort.Green.valueOf() instanceof short).assertEqual(true);
      expect(ConstColorsShort.Blue.valueOf() instanceof short).assertEqual(true);
      expect(ConstColorsShort.Red).assertEqual(1);
      expect(ConstColorsShort.Green).assertEqual(2);
      expect(ConstColorsShort.Blue).assertEqual(4);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FIVE_TEST_1100
     * @tc.name      testEnumerationWithExplicitType0095
     * @tc.desc      If enumeration type is exported, then all enumeration constants are exported along with the mandatory qualification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ColorsFloat = ColorsFloat.Red;
      let g: ColorsFloat = ColorsFloat.Green;
      let b: ColorsFloat = ColorsFloat.Blue;
      let r2 = ColorsFloat.Red;
      let g2 = ColorsFloat.Green;
      let b2 = ColorsFloat.Blue;
      expect(r instanceof ColorsFloat).assertEqual(true);
      expect(g instanceof ColorsFloat).assertEqual(true);
      expect(b instanceof ColorsFloat).assertEqual(true);
      expect(r).assertEqual(-1.5f);
      expect(g).assertEqual(-6.8f);
      expect(b).assertEqual(42.43f);
      expect(r2 instanceof ColorsFloat).assertEqual(true);
      expect(g2 instanceof ColorsFloat).assertEqual(true);
      expect(b2 instanceof ColorsFloat).assertEqual(true);
      expect(r2).assertEqual(-1.5f);
      expect(g2).assertEqual(-6.8f);
      expect(b2).assertEqual(42.43f);
      expect(ColorsFloat.Red instanceof ColorsFloat).assertEqual(true);
      expect(ColorsFloat.Green instanceof ColorsFloat).assertEqual(true);
      expect(ColorsFloat.Blue instanceof ColorsFloat).assertEqual(true);
      expect(ColorsFloat.Red.valueOf() instanceof float).assertEqual(true);
      expect(ColorsFloat.Green.valueOf() instanceof float).assertEqual(true);
      expect(ColorsFloat.Blue.valueOf() instanceof float).assertEqual(true);
      expect(ColorsFloat.Red).assertEqual(-1.5f);
      expect(ColorsFloat.Green).assertEqual(-6.8f);
      expect(ColorsFloat.Blue).assertEqual(42.43f);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FIVE_TEST_1200
     * @tc.name      testEnumerationWithExplicitType0096
     * @tc.desc      If enumeration type is exported, then all enumeration constants are exported along with the mandatory qualification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ConstColorsFloat = ConstColorsFloat.Red;
      let g: ConstColorsFloat = ConstColorsFloat.Green;
      let b: ConstColorsFloat = ConstColorsFloat.Blue;
      let r2 = ConstColorsFloat.Red;
      let g2 = ConstColorsFloat.Green;
      let b2 = ConstColorsFloat.Blue;
      expect(r instanceof ConstColorsFloat).assertEqual(true);
      expect(g instanceof ConstColorsFloat).assertEqual(true);
      expect(b instanceof ConstColorsFloat).assertEqual(true);
      expect(r).assertEqual(-1.5f);
      expect(g).assertEqual(-6.8f);
      expect(b).assertEqual(42.43f);
      expect(r2 instanceof ConstColorsFloat).assertEqual(true);
      expect(g2 instanceof ConstColorsFloat).assertEqual(true);
      expect(b2 instanceof ConstColorsFloat).assertEqual(true);
      expect(r2).assertEqual(-1.5f);
      expect(g2).assertEqual(-6.8f);
      expect(b2).assertEqual(42.43f);
      expect(ConstColorsFloat.Red instanceof ConstColorsFloat).assertEqual(true);
      expect(ConstColorsFloat.Green instanceof ConstColorsFloat).assertEqual(true);
      expect(ConstColorsFloat.Blue instanceof ConstColorsFloat).assertEqual(true);
      expect(ConstColorsFloat.Red.valueOf() instanceof float).assertEqual(true);
      expect(ConstColorsFloat.Green.valueOf() instanceof float).assertEqual(true);
      expect(ConstColorsFloat.Blue.valueOf() instanceof float).assertEqual(true);
      expect(ConstColorsFloat.Red).assertEqual(-1.5f);
      expect(ConstColorsFloat.Green).assertEqual(-6.8f);
      expect(ConstColorsFloat.Blue).assertEqual(42.43f);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FIVE_TEST_1300
     * @tc.name      testEnumerationWithExplicitType0097
     * @tc.desc      If enumeration type is exported, then all enumeration constants are exported along with the mandatory qualification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ColorsDouble = ColorsDouble.Red;
      let g: ColorsDouble = ColorsDouble.Green;
      let b: ColorsDouble = ColorsDouble.Blue;
      let r2 = ColorsDouble.Red;
      let g2 = ColorsDouble.Green;
      let b2 = ColorsDouble.Blue;
      expect(r instanceof ColorsDouble).assertEqual(true);
      expect(g instanceof ColorsDouble).assertEqual(true);
      expect(b instanceof ColorsDouble).assertEqual(true);
      expect(r).assertEqual(-1.5);
      expect(g).assertEqual(-6.8);
      expect(b).assertEqual(42.43);
      expect(r2 instanceof ColorsDouble).assertEqual(true);
      expect(g2 instanceof ColorsDouble).assertEqual(true);
      expect(b2 instanceof ColorsDouble).assertEqual(true);
      expect(r2).assertEqual(-1.5);
      expect(g2).assertEqual(-6.8);
      expect(b2).assertEqual(42.43);
      expect(ColorsDouble.Red instanceof ColorsDouble).assertEqual(true);
      expect(ColorsDouble.Green instanceof ColorsDouble).assertEqual(true);
      expect(ColorsDouble.Blue instanceof ColorsDouble).assertEqual(true);
      expect(ColorsDouble.Red.valueOf() instanceof double).assertEqual(true);
      expect(ColorsDouble.Green.valueOf() instanceof double).assertEqual(true);
      expect(ColorsDouble.Blue.valueOf() instanceof double).assertEqual(true);
      expect(ColorsDouble.Red).assertEqual(-1.5);
      expect(ColorsDouble.Green).assertEqual(-6.8);
      expect(ColorsDouble.Blue).assertEqual(42.43);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FIVE_TEST_1400
     * @tc.name      testEnumerationWithExplicitType0098
     * @tc.desc      If enumeration type is exported, then all enumeration constants are exported along with the mandatory qualification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: ConstColorsDouble = ConstColorsDouble.Red;
      let g: ConstColorsDouble = ConstColorsDouble.Green;
      let b: ConstColorsDouble = ConstColorsDouble.Blue;
      let r2 = ConstColorsDouble.Red;
      let g2 = ConstColorsDouble.Green;
      let b2 = ConstColorsDouble.Blue;
      expect(r instanceof ConstColorsDouble).assertEqual(true);
      expect(g instanceof ConstColorsDouble).assertEqual(true);
      expect(b instanceof ConstColorsDouble).assertEqual(true);
      expect(r).assertEqual(-1.5);
      expect(g).assertEqual(-6.8);
      expect(b).assertEqual(42.43);
      expect(r2 instanceof ConstColorsDouble).assertEqual(true);
      expect(g2 instanceof ConstColorsDouble).assertEqual(true);
      expect(b2 instanceof ConstColorsDouble).assertEqual(true);
      expect(r2).assertEqual(-1.5);
      expect(g2).assertEqual(-6.8);
      expect(b2).assertEqual(42.43);
      expect(ConstColorsDouble.Red instanceof ConstColorsDouble).assertEqual(true);
      expect(ConstColorsDouble.Green instanceof ConstColorsDouble).assertEqual(true);
      expect(ConstColorsDouble.Blue instanceof ConstColorsDouble).assertEqual(true);
      expect(ConstColorsDouble.Red.valueOf() instanceof double).assertEqual(true);
      expect(ConstColorsDouble.Green.valueOf() instanceof double).assertEqual(true);
      expect(ConstColorsDouble.Blue.valueOf() instanceof double).assertEqual(true);
      expect(ConstColorsDouble.Red).assertEqual(-1.5);
      expect(ConstColorsDouble.Green).assertEqual(-6.8);
      expect(ConstColorsDouble.Blue).assertEqual(42.43);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FIVE_TEST_1500
     * @tc.name      testEnumerationWithExplicitType0099
     * @tc.desc      A float value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum26.first instanceof Enum26).assertEqual(true);
      expect(Enum26.second instanceof Enum26).assertEqual(true);
      expect(Enum26.third instanceof Enum26).assertEqual(true);
      expect(Enum26.first.valueOf() instanceof float).assertEqual(true);
      expect(Enum26.second.valueOf() instanceof float).assertEqual(true);
      expect(Enum26.third.valueOf() instanceof float).assertEqual(true);
      expect(Enum26.first.valueOf()).assertEqual(1.1f);
      expect(Enum26.second.valueOf()).assertEqual(1.2f);
      expect(Enum26.third.valueOf()).assertEqual(1.3f);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FIVE_TEST_1700
     * @tc.name      testEnumerationWithExplicitType0101
     * @tc.desc      A float value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum27.first instanceof Enum27).assertEqual(true);
      expect(Enum27.second instanceof Enum27).assertEqual(true);
      expect(Enum27.third instanceof Enum27).assertEqual(true);
      expect(Enum27.first.valueOf() instanceof float).assertEqual(true);
      expect(Enum27.second.valueOf() instanceof float).assertEqual(true);
      expect(Enum27.third.valueOf() instanceof float).assertEqual(true);
      expect(Enum27.first.valueOf()).assertEqual(100f);
      expect(Enum27.second.valueOf()).assertEqual(1.2f);
      expect(Enum27.third.valueOf()).assertEqual(1.1f);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FIVE_TEST_1900
     * @tc.name      testEnumerationWithExplicitType0103
     * @tc.desc      A float value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum28.first instanceof Enum28).assertEqual(true);
      expect(Enum28.second instanceof Enum28).assertEqual(true);
      expect(Enum28.first.valueOf() instanceof float).assertEqual(true);
      expect(Enum28.second.valueOf() instanceof float).assertEqual(true);
      expect(Enum28.first.valueOf()).assertEqual(3.4018235e+38f);
      expect(Enum28.second.valueOf()).assertEqual(3.4028235e+38f);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FIVE_TEST_2100
     * @tc.name      testEnumerationWithExplicitType0105
     * @tc.desc      A float value for enumeration constants must be set explicitly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum29.first instanceof Enum29).assertEqual(true);
      expect(Enum29.second instanceof Enum29).assertEqual(true);
      expect(Enum29.third instanceof Enum29).assertEqual(true);
      expect(Enum29.first.valueOf() instanceof float).assertEqual(true);
      expect(Enum29.second.valueOf() instanceof float).assertEqual(true);
      expect(Enum29.third.valueOf() instanceof float).assertEqual(true);
      expect(Enum29.first.valueOf()).assertEqual(1.23f);
      expect(Enum29.second.valueOf()).assertEqual(1.234f);
      expect(Enum29.third.valueOf()).assertEqual(0.134f);
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FIVE_TEST_2300
     * @tc.name      testEnumerationWithExplicitType0107
     * @tc.desc      Using in string operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum30.first instanceof Enum30).assertEqual(true);
      expect(Enum30.second instanceof Enum30).assertEqual(true);
      expect(Enum30.third instanceof Enum30).assertEqual(true);
      expect(Enum30.first.valueOf() instanceof float).assertEqual(true);
      expect(Enum30.second.valueOf() instanceof float).assertEqual(true);
      expect(Enum30.third.valueOf() instanceof float).assertEqual(true);
      expect("_" + Enum30.first).assertEqual("_-1.1");
      expect("_" + Enum30.second).assertEqual("_-1.2");
      expect("_" + Enum30.third).assertEqual("_-42.43");
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FIVE_TEST_2400
     * @tc.name      testEnumerationWithExplicitType0108
     * @tc.desc      Using in string operator contexts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum30.first instanceof Enum30).assertEqual(true);
      expect(Enum30.second instanceof Enum30).assertEqual(true);
      expect(Enum30.third instanceof Enum30).assertEqual(true);
      expect(Enum30.first.valueOf() instanceof float).assertEqual(true);
      expect(Enum30.second.valueOf() instanceof float).assertEqual(true);
      expect(Enum30.third.valueOf() instanceof float).assertEqual(true);
      expect(Enum30.first + "_").assertEqual("-1.1_");
      expect(Enum30.second + "_").assertEqual("-1.2_");
      expect(Enum30.third + "_").assertEqual("-42.43_");
    });

    /**
     * @tc.number    SUB_ENUMERATION_WITH_EXPLICIT_TYPE_FIVE_TEST_2700
     * @tc.name      testEnumerationWithExplicitType0111
     * @tc.desc      A value of enumeration type with an explicitly declared type of constants is converted to the declared type. This conversion never causes a runtime error.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testEnumerationWithExplicitType0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: float = Enum30.first;
      let v2: float = Enum30.second;
      let v3: float = Enum30.third;
      expect(Enum30.first instanceof Enum30).assertEqual(true);
      expect(Enum30.second instanceof Enum30).assertEqual(true);
      expect(Enum30.third instanceof Enum30).assertEqual(true);
      expect(Enum30.first.valueOf() instanceof float).assertEqual(true);
      expect(Enum30.second.valueOf() instanceof float).assertEqual(true);
      expect(Enum30.third.valueOf() instanceof float).assertEqual(true);
      expect(Enum30.first.valueOf()).assertEqual(-1.1f);
      expect(Enum30.second.valueOf()).assertEqual(-1.2f);
      expect(Enum30.third.valueOf()).assertEqual(-42.43f);
      expect(v1).assertEqual(-1.1f);
      expect(v2).assertEqual(-1.2f);
      expect(v3).assertEqual(-42.43f);
    });
  })
}
