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
import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from "../../../../../../hypium/index";

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

// File-level enum declarations for tests
enum Color { Red, Green, Blue }
enum TestSize { S, M, L }
enum Status { None, Active, Inactive }
enum Priority { Low = 0, Medium = 1, High = 2 }

export default function ExtendedConditionalExpressionsTest08():void {
  describe('ExtendedConditionalExpressionsTest08', () => {
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
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHT_EXPRESSIONS_0100
     * @tc.name    testConditionalExpression0291
     * @tc.desc      For loop type 2 falsy with null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object|null = null
      let retcode: number = 0

      for (let i: number = 0; v; i++) {  // falsy
        if (i == 0) {
          retcode = 1
          break
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHT_EXPRESSIONS_0200
     * @tc.name    testConditionalExpression0292
     * @tc.desc      For loop type 2 falsy with undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object|undefined = undefined
      let retcode: number = 0

      for (let i: number = 0; v; i++) {  // falsy
        if (i == 0) {
          retcode = 1
          break
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHT_EXPRESSIONS_0300
     * @tc.name    testConditionalExpression0293
     * @tc.desc      For loop type 2 falsy with 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 0
      let retcode: number = 0

      for (let i: number = 0; v; i++) {  // falsy
        if (i == 0) {
          retcode = 1
          break
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHT_EXPRESSIONS_0400
     * @tc.name    testConditionalExpression0294
     * @tc.desc      For loop type 2 falsy with empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = ''
      let retcode: number = 0

      for (let i: number = 0; v; i++) {  // falsy
        if (i == 0) {
          retcode = 1
          break
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHT_EXPRESSIONS_0500
     * @tc.name    testConditionalExpression0295
     * @tc.desc      For loop type 2 falsy with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = Number.NaN
      let retcode: number = 0

      for (let i: number = 0; v; i++) {  // falsy
        if (i == 0) {
          retcode = 1
          break
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHT_EXPRESSIONS_0600
     * @tc.name    testConditionalExpression0296
     * @tc.desc      For loop type 2 falsy with false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: boolean = false
      let retcode: number = 0

      for (let i: number = 0; v; i++) {  // falsy
        if (i == 0) {
          retcode = 1
          break
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHT_EXPRESSIONS_0700
     * @tc.name    testConditionalExpression0297
     * @tc.desc      For loop type 2 truthy with 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 1
      let loopCount: number = 0

      for (let i: number = 0; v; i++) {
        loopCount++
        if (loopCount >= 2) {
          break
        }
      }
      expect(loopCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHT_EXPRESSIONS_0800
     * @tc.name    testConditionalExpression0298
     * @tc.desc      For loop type 2 truthy with 'hello'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = 'hello'
      let loopCount: number = 0

      for (let i: number = 0; v; i++) {
        loopCount++
        if (loopCount >= 2) {
          break
        }
      }
      expect(loopCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHT_EXPRESSIONS_0900
     * @tc.name    testConditionalExpression0299
     * @tc.desc      For loop type 2 truthy with new Object()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object = new Object()
      let loopCount: number = 0

      for (let i: number = 0; v; i++) {
        loopCount++
        if (loopCount >= 2) {
          break
        }
      }
      expect(loopCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHT_EXPRESSIONS_1000
     * @tc.name    testConditionalExpression0300
     * @tc.desc      For loop type 2 truthy with -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = -1
      let loopCount: number = 0

      for (let i: number = 0; v; i++) {
        loopCount++
        if (loopCount >= 2) {
          break
        }
      }
      expect(loopCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHT_EXPRESSIONS_1100
     * @tc.name    testConditionalExpression0301
     * @tc.desc      While loop type 2 falsy with 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 0
      let retcode: number = 0

      while (v) {  // falsy
        if (retcode == 0) {
          retcode = 1
          break
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHT_EXPRESSIONS_1200
     * @tc.name    testConditionalExpression0302
     * @tc.desc      While loop type 2 falsy with empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = ''
      let retcode: number = 0

      while (v) {  // falsy
        if (retcode == 0) {
          retcode = 1
          break
        }
      }
      expect(retcode).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHT_EXPRESSIONS_1300
     * @tc.name    testConditionalExpression0303
     * @tc.desc      While loop type 2 truthy with 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 1
      let loopCount: number = 0

      while (v) {
        loopCount++
        if (loopCount >= 2) {
          break
        }
      }
      expect(loopCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHT_EXPRESSIONS_1400
     * @tc.name    testConditionalExpression0304
     * @tc.desc      While loop type 2 truthy with true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: boolean = true
      let loopCount: number = 0

      while (v) {
        loopCount++
        if (loopCount >= 2) {
          break
        }
      }
      expect(loopCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHT_EXPRESSIONS_1500
     * @tc.name    testConditionalExpression0305
     * @tc.desc      While loop type 2 truthy with -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = -1
      let loopCount: number = 0

      while (v) {
        loopCount++
        if (loopCount >= 2) {
          break
        }
      }
      expect(loopCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHT_EXPRESSIONS_1600
     * @tc.name    testConditionalExpression0306
     * @tc.desc      While loop type 2 truthy with 'hello'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = 'hello'
      let loopCount: number = 0

      while (v) {
        loopCount++
        if (loopCount >= 2) {
          break
        }
      }
      expect(loopCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHT_EXPRESSIONS_1700
     * @tc.name    testConditionalExpression0307
     * @tc.desc      Do-while loop type 2 falsy with 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 0
      let res: number = 0

      do {
        if (++res > 1) {
          break
        }
      } while (v)

      expect(res).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHT_EXPRESSIONS_1800
     * @tc.name    testConditionalExpression0308
     * @tc.desc      Do-while loop type 2 truthy with 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 1
      let res: number = 0

      do {
        if (++res > 1) {
          break
        }
      } while (v)

      expect(res).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHT_EXPRESSIONS_1900
     * @tc.name    testConditionalExpression0309
     * @tc.desc      Do-while loop type 2 truthy with true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: boolean = true
      let res: number = 0

      do {
        if (++res > 1) {
          break
        }
      } while (v)

      expect(res).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHT_EXPRESSIONS_2000
     * @tc.name    testConditionalExpression0310
     * @tc.desc      Do-while loop type 2 truthy with -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = -1
      let res: number = 0

      do {
        if (++res > 1) {
          break
        }
      } while (v)

      expect(res).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXTENDED_CONDITIONAL_EIGHT_EXPRESSIONS_2100
     * @tc.name    testConditionalExpression0311
     * @tc.desc      Do-while loop type 2 truthy with 'hello'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConditionalExpression0311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: string = 'hello'
      let res: number = 0

      do {
        if (++res > 1) {
          break
        }
      } while (v)

      expect(res).assertEqual(2);
    });

  })
}
