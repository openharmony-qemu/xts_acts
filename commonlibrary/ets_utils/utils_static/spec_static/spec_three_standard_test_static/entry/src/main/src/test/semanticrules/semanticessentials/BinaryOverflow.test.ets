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

import { afterAll, afterEach, beforeAll, beforeEach, describe,expect,it,Level, Size, TestType }
  from '../../../../../hypium/index'

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function BinaryOverflow(): void{
  describe('BinaryOverflow', () => {
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
     * @tc.number    SUB_BASEDATE_BINARY_OVERFLOW_0100
     * @tc.name      testBinaryOverflow0001
     * @tc.desc      Testing overflow for binary operator '+' with byte and byte. On overflow, the type must be converted to int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBinaryOverflow0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 127;
      let b: number = 1;
      let result = a + b;

      expect(result).assertEqual(128);
      expect(typeof result).assertEqual('number');

    });

    /**
     * @tc.number    SUB_BASEDATE_BINARY_OVERFLOW_0200
     * @tc.name      testBinaryOverflow0002
     * @tc.desc      Testing overflow for binary operator '-' with byte and byte. On overflow, the type must be converted to int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBinaryOverflow0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = -128;
      let b: number = 1;
      let result = a - b;

      expect(result).assertEqual(-129);
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.number    SUB_BASEDATE_BINARY_OVERFLOW_0300
     * @tc.name      testBinaryOverflow0003
     * @tc.desc      Testing overflow for binary operator '*' with byte and byte. On overflow, the type must be converted to int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBinaryOverflow0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a: number = 100;
      let b: number = 100;
      let result = a * b;

      expect(result).assertEqual(10000);
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.number    SUB_BASEDATE_BINARY_OVERFLOW_0400
     * @tc.name      testBinaryOverflow0004
     * @tc.desc      Testing overflow for binary operator '+' with short and short. On overflow, the type must be converted to int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBinaryOverflow0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 32767;
      let b: number = 1;
      let result = a + b;

      expect(result).assertEqual(32768);
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.number    SUB_BASEDATE_BINARY_OVERFLOW_0500
     * @tc.name      testBinaryOverflow0005
     * @tc.desc      Testing overflow for binary operator '+' with short and short. On overflow, the type must be converted to int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBinaryOverflow0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let a: number  = 2147483647;
      let b: number = 1;
      let result = a + b;

      expect(result).assertEqual(2147483648);
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.number    SUB_BASEDATE_BINARY_OVERFLOW_0600
     * @tc.name      testBinaryOverflow0006
     * @tc.desc      Testing overflow for binary operator '-' with int and int. On overflow, the type must be converted to int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBinaryOverflow0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = -2147483648;
      let b: number = 1;
      let result = a - b;

      expect(result).assertEqual(-2147483649);
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.number    SUB_BASEDATE_BINARY_OVERFLOW_0700
     * @tc.name      testBinaryOverflow0007
     * @tc.desc      Testing overflow for binary operator '+' with int and int. On overflow, the type must be converted to int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBinaryOverflow0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 127;
      let b: number = 2147483647;
      let result = a + b;

      expect(result).assertEqual(2147483774);
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.number    SUB_BASEDATE_BINARY_OVERFLOW_0800
     * @tc.name      testBinaryOverflow0008
     * @tc.desc      Testing overflow for binary operator '+' with byte and int. On overflow, the type must be converted to int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBinaryOverflow0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 32767;
      let b: number = 2147483647;
      let int32OverflowResult = Math.imul(a, b);

      expect(int32OverflowResult).assertEqual(2147450881)
      expect(typeof int32OverflowResult).assertEqual("number");
    })
  })
}