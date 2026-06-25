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

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

// ============================================================================
// Data Setup for single_class_over_generic_1
// ============================================================================
namespace single_class_over_generic_1 {
  export let res: number = 0;

  export class Base<T> {
    // Overload 1: Generic type T
    constructor(i: T) {
      res = 1;
    }

    // Overload 2: Specific primitive/wrapper type (mapped to number for ArkTS)
    constructor(i: number) {
      res = 2;
    }
  }

  export function main(): void {
    // Test 1: Passing a string matches the generic type T (when instantiated with string)
    res = 0;
    new Base<string>("hello");
    expect(res).assertEqual(1);

    // Test 2: Passing a number directly matches the specific number overload
    res = 0;
    new Base<string>(42);
    expect(res).assertEqual(2);
  }
}

export default function OverloadEquivalentSignaturesTest():void {
  describe('OverloadEquivalentSignaturesTest', () => {
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
     * @tc.number    SUB_OVERLOAD_EQUIVALENT_SIGNATURES_0100
     * @tc.name      testSingleClassOverGeneric0001
     * @tc.desc      Two constructors are defined in the same class member (one generic T, one specific Number). 
     *               Because their signatures are NOT overload-equivalent, overloading is used successfully.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testSingleClassOverGeneric0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      single_class_over_generic_1.main();
    });

  })
}