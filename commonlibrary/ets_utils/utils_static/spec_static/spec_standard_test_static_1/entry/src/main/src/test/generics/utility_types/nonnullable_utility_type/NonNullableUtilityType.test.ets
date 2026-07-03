'use static';
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

import Utils from "../../../Util.test";

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

type NullableString = null | undefined | string
type ClearedString = NonNullable<NullableString>

type NullableNumber = null | undefined | number
type ClearedNumber = NonNullable<NullableNumber>

function toNonNullString(param: NullableString): ClearedString {
  if (param != null) {
    return param
  }
  return ""
}

function toNonNullNumber(param: NullableNumber): ClearedNumber {
  if (param != null) {
    return param
  }
  return 0
}

type X_6 = Object | null | undefined
type Y_6 = NonNullable<X_6>

class A_6<T> {
  field: NonNullable<T>
  constructor (field: NonNullable<T>) {
    this.field = field
  }
}

export default function NonNullableUtilityTypeTest(): void {
  describe("NonNullableUtilityTypeTest", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_NON_NULL_ABLE_UTILITY_TYPE_0100
     * @tc.name      testNonNullableUtilityType0001
     * @tc.desc      NonNullable strips null/undefined — toNonNullString with various inputs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullableUtilityType0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: NullableString = null
      let a2: NullableString = undefined
      let a3: NullableString = "hello"

      expect(toNonNullString(null)).assertEqual('')
      expect(toNonNullString(undefined)).assertEqual('')
      expect(toNonNullString('undefined')).assertEqual('undefined')
      expect(toNonNullString(a1)).assertEqual('')
      expect(toNonNullString(a2)).assertEqual('')
      expect(toNonNullString(a3)).assertEqual('hello')
    })

    /**
     * @tc.number    SUB_NON_NULL_ABLE_UTILITY_TYPE_0200
     * @tc.name      testNonNullableUtilityType0002
     * @tc.desc      NonNullable with number type and generic class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullableUtilityType0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b1: NullableNumber = null
      let b2: NullableNumber = undefined
      let b3: NullableNumber = 42

      expect(toNonNullNumber(null)).assertEqual(0)
      expect(toNonNullNumber(undefined)).assertEqual(0)
      expect(toNonNullNumber(b1)).assertEqual(0)
      expect(toNonNullNumber(b2)).assertEqual(0)
      expect(toNonNullNumber(b3)).assertEqual(42)
    })

    /**
     * @tc.number    SUB_NON_NULL_ABLE_UTILITY_TYPE_0700
     * @tc.name      testNonNullableUtilityType0007
     * @tc.desc      NonNullable with generic class constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullableUtilityType0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new A_6<X_6>(new Object)
      expect(a.field instanceof Object).assertTrue()
    })
  });
}
