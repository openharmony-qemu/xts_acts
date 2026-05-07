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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../../hypium';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function NumericRelationalTest(): void {
  describe("NumericRelationalTest", () => {
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
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_10000
    * @tc.name      testNumericRelationalOperators0100
    * @tc.desc      Integer comparison 0 > -1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: byte = 0;
      let bx: Byte = new Byte(0);
      let y: byte = -1;
      let by: Byte = new Byte(-1);
      expect((x > y)).assertTrue()
      expect((bx > by)).assertTrue()
      expect((x > by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_10100
    * @tc.name      testNumericRelationalOperators0101
    * @tc.desc      Integer comparison 0 < 1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: int = 1;
      let by: Int = new Int(1);
      expect((x < y)).assertTrue()
      expect((bx < by)).assertTrue()
      expect((x < by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_10200
    * @tc.name      testNumericRelationalOperators0102
    * @tc.desc      Integer comparison 1 < 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = 1;
      let bx: Int = new Int(1);
      let y: int = 0;
      let by: Int = new Int(0);
      expect((x < y)).assertFalse()
      expect((bx < by)).assertFalse()
      expect((x < by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_10300
    * @tc.name      testNumericRelationalOperators0103
    * @tc.desc      Integer comparison -1 < 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = -1;
      let bx: Int = new Int(-1);
      let y: int = 0;
      let by: Int = new Int(0);
      expect((x < y)).assertTrue()
      expect((bx < by)).assertTrue()
      expect((x < by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_10400
    * @tc.name      testNumericRelationalOperators0104
    * @tc.desc      Integer comparison 0 < -1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: int = -1;
      let by: Int = new Int(-1);
      expect((x < y)).assertFalse()
      expect((bx < by)).assertFalse()
      expect((x < by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_10500
    * @tc.name      testNumericRelationalOperators0105
    * @tc.desc      Integer comparison 0 < 1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: byte = 0;
      let bx: Byte = new Byte(0);
      let y: byte = 1;
      let by: Byte = new Byte(1);
      expect((x < y)).assertTrue()
      expect((bx < by)).assertTrue()
      expect((x < by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_10600
    * @tc.name      testNumericRelationalOperators0106
    * @tc.desc      Integer comparison 1 < 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: byte = 1;
      let bx: Byte = new Byte(1);
      let y: byte = 0;
      let by: Byte = new Byte(0);
      expect((x < y)).assertFalse()
      expect((bx < by)).assertFalse()
      expect((x < by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_10700
    * @tc.name      testNumericRelationalOperators0107
    * @tc.desc      Integer comparison -1 < 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: byte = -1;
      let bx: Byte = new Byte(-1);
      let y: byte = 0;
      let by: Byte = new Byte(0);
      expect((x < y)).assertTrue()
      expect((bx < by)).assertTrue()
      expect((x < by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_10800
    * @tc.name      testNumericRelationalOperators0108
    * @tc.desc      Integer comparison 0 < -1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: byte = 0;
      let bx: Byte = new Byte(0);
      let y: byte = -1;
      let by: Byte = new Byte(-1);
      expect((x < y)).assertFalse()
      expect((bx < by)).assertFalse()
      expect((x < by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_10900
    * @tc.name      testNumericRelationalOperators0109
    * @tc.desc      Integer comparison 0 >= 1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: int = 1;
      let by: Int = new Int(1);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_11000
    * @tc.name      testNumericRelationalOperators0110
    * @tc.desc      Integer comparison 1 >= 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = 1;
      let bx: Int = new Int(1);
      let y: int = 0;
      let by: Int = new Int(0);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_11100
    * @tc.name      testNumericRelationalOperators0111
    * @tc.desc      Integer comparison -1 >= 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = -1;
      let bx: Int = new Int(-1);
      let y: int = 0;
      let by: Int = new Int(0);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_11200
    * @tc.name      testNumericRelationalOperators0112
    * @tc.desc      Integer comparison 0 >= -1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: int = -1;
      let by: Int = new Int(-1);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_11300
    * @tc.name      testNumericRelationalOperators0113
    * @tc.desc      Integer comparison 0 >= 1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: byte = 1;
      let by: Byte = new Byte(1);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_11400
    * @tc.name      testNumericRelationalOperators0114
    * @tc.desc      Integer comparison 1 >= 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = 1;
      let bx: Int = new Int(1);
      let y: byte = 0;
      let by: Byte = new Byte(0);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_11500
    * @tc.name      testNumericRelationalOperators0115
    * @tc.desc      Integer comparison -1 >= 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = -1;
      let bx: Int = new Int(-1);
      let y: byte = 0;
      let by: Byte = new Byte(0);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_11600
    * @tc.name      testNumericRelationalOperators0116
    * @tc.desc      Integer comparison 0 >= -1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: byte = -1;
      let by: Byte = new Byte(-1);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_11700
    * @tc.name      testNumericRelationalOperators0117
    * @tc.desc      Integer comparison 0 <= 1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: int = 1;
      let by: Int = new Int(1);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_11800
    * @tc.name      testNumericRelationalOperators0118
    * @tc.desc      Integer comparison 1 <= 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = 1;
      let bx: Int = new Int(1);
      let y: int = 0;
      let by: Int = new Int(0);
      expect((x <= y)).assertFalse()
      expect((bx <= by)).assertFalse()
      expect((x <= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_11900
    * @tc.name      testNumericRelationalOperators0119
    * @tc.desc      Integer comparison -1 <= 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = -1;
      let bx: Int = new Int(-1);
      let y: int = 0;
      let by: Int = new Int(0);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_12000
    * @tc.name      testNumericRelationalOperators0120
    * @tc.desc      Integer comparison 0 <= -1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: int = -1;
      let by: Int = new Int(-1);
      expect((x <= y)).assertFalse()
      expect((bx <= by)).assertFalse()
      expect((x <= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_12100
    * @tc.name      testNumericRelationalOperators0121
    * @tc.desc      Integer comparison 0 <= 1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: byte = 0;
      let bx: Byte = new Byte(0);
      let y: byte = 1;
      let by: Byte = new Byte(1);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_12200
    * @tc.name      testNumericRelationalOperators0122
    * @tc.desc      Integer comparison 1 <= 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: byte = 1;
      let bx: Byte = new Byte(1);
      let y: byte = 0;
      let by: Byte = new Byte(0);
      expect((x <= y)).assertFalse()
      expect((bx <= by)).assertFalse()
      expect((x <= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_12300
    * @tc.name      testNumericRelationalOperators0123
    * @tc.desc      Integer comparison -1 <= 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: byte = -1;
      let bx: Byte = new Byte(-1);
      let y: byte = 0;
      let by: Byte = new Byte(0);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_12400
    * @tc.name      testNumericRelationalOperators0124
    * @tc.desc      Integer comparison 0 <= -1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: byte = 0;
      let bx: Byte = new Byte(0);
      let y: byte = -1;
      let by: Byte = new Byte(-1);
      expect((x <= y)).assertFalse()
      expect((bx <= by)).assertFalse()
      expect((x <= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_12500
    * @tc.name      testNumericRelationalOperators0125
    * @tc.desc      Integer comparison 0 >= 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: int = 0;
      let by: Int = new Int(0);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_12600
    * @tc.name      testNumericRelationalOperators0126
    * @tc.desc      Integer comparison 0 <= 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: int = 0;
      let by: Int = new Int(0);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_12700
    * @tc.name      testNumericRelationalOperators0127
    * @tc.desc      Integer comparison 1 >= 1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = 1;
      let bx: Int = new Int(1);
      let y: int = 1;
      let by: Int = new Int(1);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_12800
    * @tc.name      testNumericRelationalOperators0128
    * @tc.desc      Integer comparison 1 <= 1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = 1;
      let bx: Int = new Int(1);
      let y: int = 1;
      let by: Int = new Int(1);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_12900
    * @tc.name      testNumericRelationalOperators0129
    * @tc.desc      Integer comparison -1 >= -1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = -1;
      let bx: Int = new Int(-1);
      let y: int = -1;
      let by: Int = new Int(-1);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_13000
    * @tc.name      testNumericRelationalOperators0130
    * @tc.desc      Integer comparison -1 <= -1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x: int = -1;
      let bx: Int = new Int(-1);
      let y: int = -1;
      let by: Int = new Int(-1);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })

  })
}

