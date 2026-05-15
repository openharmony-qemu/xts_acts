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


enum SomeEnum {a, b, c}

enum SomeEnum1: int {a = 0, b = 1, c = 2}

enum SomeEnum2: long {a = 0, b = 1, c = 2}

enum SomeEnum3: double {a = 0.0, b = 1.0, c = 2.0}


function foo(i: int) {
  return 1;
}
function bar(i: int, j?: string) {
  return 2;
}

function bar1(i?: int, j?: string) {
  return 2;
}

function foo(i: int, j: string) {
  return 1;
}
function bar2(i: int, j?: string) {
  return 2;
}

function bar3(i?: int, j?: string) {
  return 2;
}

class C {
  name: string = ''
  constructor() {}
  constructor(name: string) {
    this.name = name
  }
}

class A {
  name: string = ''
  constructor() {}
  constructor(name: string) {
    this.name = name
  }
}
class B extends A {
  constructor() { super() }
  constructor(name: string) {
    super(name)
  }
}

class E<in T> {}

class E1<out T> {}

export default function AssignabilityTest(): void {
  describe('AssignabilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
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
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })


    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_0100
     * @tc.name      testConversionsAssignability0001
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0001';

      let t1: byte = 0
      let t2: short = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_0200
     * @tc.name      testConversionsAssignability0002
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0002';

      let t1: byte = 0
      let t2: Int = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_0300
     * @tc.name      testConversionsAssignability0003
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0003';

      let t1: byte = 0
      let t2: long = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_0400
     * @tc.name      testConversionsAssignability0004
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0004';

      let t1: byte = 0
      let t2: float = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_0500
     * @tc.name      testConversionsAssignability0005
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0005';

      let t1: byte = 0
      let t2: double = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_0600
     * @tc.name      testConversionsAssignability0006
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0006';

      let t1: short = 0
      let t2: int = t1


    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_0700
     * @tc.name      testConversionsAssignability0007
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0007';

      let t1: short = 0
      let t2: long = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_0800
     * @tc.name      testConversionsAssignability0008
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0008';

      let t1: short = 0
      let t2: float = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_0900
     * @tc.name      testConversionsAssignability0009
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0009';

      let t1: short = 0
      let t2: double = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_1000
     * @tc.name      testConversionsAssignability0010
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0010';

      let t1: int = 0
      let t2: long = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_1100
     * @tc.name      testConversionsAssignability0011
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0011';

      let t1: int = 0
      let t2: float = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_1200
     * @tc.name      testConversionsAssignability0012
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0012';

      let t1: int = 0
      let t2: double = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_1300
     * @tc.name      testConversionsAssignability0013
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0013';

      let t1: long = 0
      let t2: float = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_1400
     * @tc.name      testConversionsAssignability0014
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0014';

      let t1: long = 0
      let t2: double = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_1500
     * @tc.name      testConversionsAssignability0015
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0015';

      let t1: float = 0.0f
      let t2: double = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_1600
     * @tc.name      testConversionsAssignability0016
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0016';

      let t1: SomeEnum = SomeEnum.a
      let t2: int = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_1700
     * @tc.name      testConversionsAssignability0017
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0017';

      let t1: SomeEnum = SomeEnum.a
      let t2: long = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_1800
     * @tc.name      testConversionsAssignability0018
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0018';

      let t1: SomeEnum = SomeEnum.a
      let t2: float = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_1900
     * @tc.name      testConversionsAssignability0019
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0019';

      let t1: SomeEnum = SomeEnum.a
      let t2: double = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_2000
     * @tc.name      testConversionsAssignability0020
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0020';

      let t1: SomeEnum = SomeEnum.a
      let t2: long = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_2100
     * @tc.name      testConversionsAssignability0021
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0021';

      let t1: SomeEnum = SomeEnum.a
      let t2: float = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_2200
     * @tc.name      testConversionsAssignability0022
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0022';

      let t1: SomeEnum = SomeEnum.a
      let t2: double = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_2300
     * @tc.name      testConversionsAssignability0023
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0023';

      let t1: SomeEnum = SomeEnum.a
      let t2: double = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_2400
     * @tc.name      testConversionsAssignability0024
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0024';

      let t1: SomeEnum = SomeEnum.a
      let t2: double = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_CONVERSIONS_ASSIGNABILITY_2500
     * @tc.name      testConversionsAssignability0025
     * @tc.desc      Type T1 is assignable to type T2 if implicit conversion is present
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testConversionsAssignability0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testConversionsAssignability0025';

      let t1: SomeEnum = SomeEnum.a
      let t2: double = t1

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_FUNCTIONS_COMPATIBILITY_OPT_0300
     * @tc.name      testFunctionsCompatibilityOpt0003
     * @tc.desc      Mixing function overload and signature overload will result in CTE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionsCompatibilityOpt0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testFunctionsCompatibilityOpt0003';

      let x2: (i2: int, j2: string) => int = bar2;
      expect(x2(1, "knock-knock")).assertEqual(2);

    });

    /**
     * @tc.number    SUB_ASSIGNABILITY_FUNCTIONS_COMPATIBILITY_OPT_0400
     * @tc.name      testFunctionsCompatibilityOpt0004
     * @tc.desc      Mixing function overload and signature overload will result in CTE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFunctionsCompatibilityOpt0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testFunctionsCompatibilityOpt0004';

      let x3: (i: int, j: string) => int = bar3;
      expect(x3(1, "who`s there")).assertEqual(2);
    });
  })
}
