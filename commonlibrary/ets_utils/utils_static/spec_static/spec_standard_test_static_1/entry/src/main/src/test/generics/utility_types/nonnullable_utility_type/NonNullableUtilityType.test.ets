/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import {
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from "../../../../../../hypium"

//  (7)
// 类型定义 (来自 nonnullable_utility_type_*.js)
type NullableString_0 = null | undefined | string
type ClearedString_0 = NonNullable<NullableString_0> // only type string is expected

type NullableString_1 = null | undefined | string
type ClearedString_1 = NonNullable<NullableString_1> // only type string is expected

type NullableString_2 = null | undefined | string
type ClearedString_2 = NonNullable<NullableString_2> // only type string is expected

type NullableString_3 = null | undefined | string
type ClearedString_3 = NonNullable<NullableString_3> // only type string is expected

type NullableString_4 = null | undefined | string
type ClearedString_4 = NonNullable<NullableString_4> // only type string is expected

type NullableString_5 = null | undefined | string
type ClearedString_5 = NonNullable<NullableString_5> // only type string is expected

// 函数定义 (来自 nonnullable_utility_type_*.js)
function foo_0(param: NullableString_0): ClearedString_0 {
    if (param != null) {
        return param
    }
    return ""
}

function foo_1(param: NullableString_1): ClearedString_1 {
    if (param != null) {
        return param
    }
    return ""
}

function foo_2(param: NullableString_2): ClearedString_2 {
    if (param != null) {
        return param
    }
    return ""
}

function foo_3(param: NullableString_3): ClearedString_3 {
    if (param != null) {
        return param
    }
    return ""
}

function foo_4(param: NullableString_4): ClearedString_4 {
    if (param != null) {
        return param
    }
    return ""
}

function foo_5(param: NullableString_5): ClearedString_5 {
    if (param != null) {
        return param
    }
    return ""
}

// 类型和类定义 (来自 spec_sample.js)
type X_6 = Object | null | undefined
type Y_6 = NonNullable<X_6> // That is Object

class A_6<T> {
    field: NonNullable<T> // That non-nullable version of the type parameter
    constructor (field: NonNullable<T>) {
        this.field = field
    }
}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function NonNullableUtilityTypeTest() {
  describe("NonNullableUtilityTypeTest", () => {
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
     * @tc.number    SUB_NON_NULL_ABLE_UTILITY_TYPE_0100
     * @tc.name      testNonNullableUtilityType0001
     * @tc.desc      Type NonNullable<T> constructs a type by excluding null and undefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullableUtilityType0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: NullableString_0 = null
      let a2: NullableString_0 = undefined
      let a3: NullableString_0 = "hello"
      let b: ClearedString_0 = foo_0(null);
      expect(b).assertEqual('')
    })

    /**
     * @tc.number    SUB_NON_NULL_ABLE_UTILITY_TYPE_0200
     * @tc.name      testNonNullableUtilityType0002
     * @tc.desc      Type NonNullable<T> constructs a type by excluding null and undefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullableUtilityType0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: NullableString_1 = null
      let a2: NullableString_1 = undefined
      let a3: NullableString_1 = "hello"
      let b: ClearedString_1 = foo_1(undefined);
      expect(b).assertEqual('')
    })

    /**
     * @tc.number    SUB_NON_NULL_ABLE_UTILITY_TYPE_0300
     * @tc.name      testNonNullableUtilityType0003
     * @tc.desc      Type NonNullable<T> constructs a type by excluding null and undefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullableUtilityType0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: NullableString_2 = null
      let a2: NullableString_2 = undefined
      let a3: NullableString_2 = "hello"
      let b: ClearedString_2 = foo_2('undefined');
      expect(b).assertEqual('undefined')
    })

    /**
     * @tc.number    SUB_NON_NULL_ABLE_UTILITY_TYPE_0400
     * @tc.name      testNonNullableUtilityType0004
     * @tc.desc      Type NonNullable<T> constructs a type by excluding null and undefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullableUtilityType0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: NullableString_3 = null
      let a2: NullableString_3 = undefined
      let a3: NullableString_3 = "hello"
      let b: ClearedString_3 = foo_3(a1);
      expect(b).assertEqual('')
    })

    /**
     * @tc.number    SUB_NON_NULL_ABLE_UTILITY_TYPE_0500
     * @tc.name      testNonNullableUtilityType0005
     * @tc.desc      Type NonNullable<T> constructs a type by excluding null and undefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullableUtilityType0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: NullableString_4 = null
      let a2: NullableString_4 = undefined
      let a3: NullableString_4 = "hello"
      let b: ClearedString_4 = foo_4(a2);
      expect(b).assertEqual('')
    })

    /**
     * @tc.number    SUB_NON_NULL_ABLE_UTILITY_TYPE_0600
     * @tc.name      testNonNullableUtilityType0006
     * @tc.desc      Type NonNullable<T> constructs a type by excluding null and undefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullableUtilityType0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: NullableString_5 = null
      let a2: NullableString_5 = undefined
      let a3: NullableString_5 = "hello"
      let b: ClearedString_5 = foo_5(a3);
      expect(b).assertEqual('hello')
    })

    /**
     * @tc.number    SUB_NON_NULL_ABLE_UTILITY_TYPE_0700
     * @tc.name      testNonNullableUtilityType0007
     * @tc.desc      Type NonNullable<T> constructs a type by excluding null and undefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullableUtilityType0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new A_6<X_6>(new Object)
      expect(a.field instanceof Object).assertTrue() // type of field is Object
    })
  });
}