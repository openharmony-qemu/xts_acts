'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';

export default function SubtypingAmongPrimitiveTypestTest():void {
  describe('SubtypingAmongPrimitiveTypestTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets an action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_SUBTYPING_AMONG_PRIMITIVE_TYPESTEST_0100
     * @tc.name      testStaticAndInstanceFields0001
     * @tc.desc      Subtyping relation among the primitive types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticAndInstanceFields0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: number = 5;

      let intValue: number = 5;
      let floatValue: number = intValue;

      let num: number = 5;
      let result: number = parseFloat(num.toString());

      expect(result).assertEqual(5);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number    SUB_SUBTYPING_AMONG_PRIMITIVE_TYPESTEST_0200
     * @tc.name      testPrimitiveStaticFields0002
     * @tc.desc      Subtyping relation among the primitive types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrimitiveStaticFields0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strNumber: string = "5";
      let convertedNumber: number = Number(strNumber);
      expect(convertedNumber).assertEqual(5);

      let floatValue: number = 5.7;
      let intValue: number = Math.floor(floatValue);
      expect(intValue).assertEqual(5);
     });

    /**
     * @tc.number    SUB_SUBTYPING_AMONG_PRIMITIVE_TYPESTEST_0300
     * @tc.name      testPrimitiveStaticFields0003
     * @tc.desc      Subtyping relation among the primitive types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrimitiveStaticFields0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let instance: long = 5 as int;
      expect(instance).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SUBTYPING_AMONG_PRIMITIVE_TYPESTEST_0400
     * @tc.name      testPrimitiveStaticFields0004
     * @tc.desc      Subtyping relation among the primitive types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrimitiveStaticFields0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let instance: int = 5 as short;
      expect(instance).assertEqual(5);
    });

    /**
     * @tc.number    SUB_SUBTYPING_AMONG_PRIMITIVE_TYPESTEST_0500
     * @tc.name      testPrimitiveStaticFields0005
     * @tc.desc      Subtyping relation among the primitive types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPrimitiveStaticFields0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let instance: short = 5 as byte;
      expect(instance).assertEqual(5 as number);
    });
  })
}
