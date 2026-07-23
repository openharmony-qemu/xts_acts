'use static'
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
import { Neg, Pos } from '../types.test'
import Utils from '../../Util.test'

class A1 {
  field1: [number, number, number];
  constructor(...a1: [number, number, number]) {
    this.field1 = a1;
  }

  bar1(...callee1: [number, number, number]): [number, number, number] {
    return callee1;
  }
}

function foo1(...callee1: [number, number, number]): [number, number, number] {
  return callee1;
}

class A2 {
  field2: [number, number, number];
  constructor(...a2: [number, number, number]) {
    this.field2 = a2;
  }

  bar2(...callee2: [number, number, number]): [number, number, number] {
    return callee2;
  }
}

function foo2(...callee2: [number, number, number]): [number, number, number] {
  return callee2;
}

export default function TupleRestParamsTest(): void {
  describe('TupleRestParamsTest', () => {
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
     * @tc.number    SUB_TUPLE_REST_PARAMS_0100
     * @tc.name      testTupleRestParams0001
     * @tc.desc      If a single argument corresponding to the rest parameter has the spread operator,
     *               then the expression that follows the operator must refer to a tuple of types compatible
     *               with the proper types of the tuple rest parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTupleRestParams0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tuple: [number, number, number] = [0, 0, 0.0];
      let a1: A1 = new A1(...tuple);
      let method_result = a1.bar1(...tuple);
      let func_result = foo1(...tuple);

      expect(method_result[0]).assertEqual(0);
      expect(func_result[0]).assertEqual(0);
      expect(a1.field1[0]).assertEqual(0);

      expect(method_result[1]).assertEqual(0);
      expect(func_result[1]).assertEqual(0);
      expect(a1.field1[1]).assertEqual(0);

      expect(method_result[2]).assertEqual(0.0);
      expect(func_result[2]).assertEqual(0.0);
      expect(a1.field1[2]).assertEqual(0.0);
    });

    /**
     * @tc.number    SUB_TUPLE_REST_PARAMS_0200
     * @tc.name      testTupleRestParams0002
     * @tc.desc      If a single argument corresponding to the rest parameter has the spread operator,
     *               then the expression that follows the operator must refer to a tuple of types compatible
     *               with the proper types of the tuple rest parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTupleRestParams0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tuple: [number, number, number] = [0, -128, 3.4028234663852886e38];
      let a2: A2 = new A2(...tuple);
      let method_result = a2.bar2(...tuple);
      let func_result = foo2(...tuple);

      expect(method_result[0]).assertEqual(0);
      expect(func_result[0]).assertEqual(0);
      expect(a2.field2[0]).assertEqual(0);

      expect(method_result[1]).assertEqual(-128);
      expect(func_result[1]).assertEqual(-128);
      expect(a2.field2[1]).assertEqual(-128);

      expect(method_result[2]).assertEqual(3.4028234663852886e38);
      expect(func_result[2]).assertEqual(3.4028234663852886e38);
      expect(a2.field2[2]).assertEqual(3.4028234663852886e38);
    });
  })
}
