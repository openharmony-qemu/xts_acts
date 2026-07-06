'use static'
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

function processType_0<T>(input: T): T {
  if (typeof input === "string") {
    return (input as string).toUpperCase() as T;
  }
    return input;
}
function processType_1<T>(input: T): T {
  if (typeof input === "string") {
    return (input + "1") as T;
  }
    return input;
}
function processType_2<T>(input: T): T {
  return input as T;
}
function processType_3<T>(input: T): T {
  return input as T;
}
function processType_4<T>(input: T): T {
  return input as T;
}
function processType_5<T>(input: T): T {
  let output: T = input;
  return output as T;
}
function processType_6<T>(input: T): T {
  let output: T = input;
  return output as T;
}
function processType_7<T>(input: T): T {
  return input as T;
}

export default function GenericDeclarationsFunctionTest(): void {
  describe("GenericDeclarationsFunctionTest", () => {
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
     * @tc.number    SUB_GENERIC_DECLARATIONS_FUNCTIONS_0100
     * @tc.name      testGenericDeclarationsFunction0001
     * @tc.desc      Generic function with string → uppercase
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsFunction0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = processType_0<string>("hello");
      expect(result).assertEqual("HELLO");
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_FUNCTIONS_0200
     * @tc.name      testGenericDeclarationsFunction0002
     * @tc.desc      Generic function with string concatenation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsFunction0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = processType_1<string>("hello");
      expect(result).assertEqual("hello1");
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_FUNCTIONS_0300
     * @tc.name      testGenericDeclarationsFunction0003
     * @tc.desc      Generic identity functions with various numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsFunction0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(processType_2<number>(2)).assertEqual(2);
      expect(processType_3<number>(2.1f)).assertEqual(2.1f);
      expect(processType_4<number>(2.0001)).assertEqual(2.0001);
      expect(processType_5<float>(2.1f)).assertEqual(2.1f);
      expect(processType_6<double>(2.0001)).assertEqual(2.0001);
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_FUNCTIONS_0800
     * @tc.name      testGenericDeclarationsFunction0008
     * @tc.desc      Generic identity function with Date
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsFunction0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date('2023-01-01');
      let result = processType_7<Date>(date1);
      expect(result.getTime()).assertEqual(date1.getTime());
    })
  });
}
