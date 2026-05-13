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
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
class Neg<T extends number> {
  constructor (x: T) {}
}

class Pos<T extends number> {
  constructor (x: T) {}
}

namespace testNS1_15 {
  function foo(v: Any): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
  }
  function f1(v: Object | undefined | null): number {
    if (v instanceof Object || v === undefined || v === null) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: Object | undefined | null): number {
    if (v === undefined || v === null) {
      expect(v).assertEqual(null);
      return 1;
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue();
      foo(v);
      expect(v).assertEqual(5n);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(null);
    expect(res).assertEqual(1);
    res = f1(5n);
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_15 {
  function foo(v: Object | undefined | Any): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
  }
  function f1(v: Object | undefined | null): number {
    if (v instanceof Object || v === undefined || v === null) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: Object | undefined | null): number {
    if (v === undefined || v === null) {
      expect(v).assertEqual(undefined);
      return 1;
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue();
      expect(v instanceof Object || v === undefined).assertTrue();
      foo(v);
      expect(v).assertEqual("abc");
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(undefined);
    expect(res).assertEqual(1);
    res = f1("abc");
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_15 {
  function foo(v: Object | null | undefined): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
  }
  function f1(v: Object | undefined | null): number {
    if (v instanceof Object || v === null || v === undefined) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: Object | undefined | null): number {
    if (v === undefined || v === null) {
      expect(v).assertEqual(null);
      return 1;
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue();
      expect(v instanceof Object || v === null || v === undefined).assertTrue();
      foo(v);
      expect(v).assertEqual(10.7);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(null);
    expect(res).assertEqual(1);
    res = f1(10.7);
    expect(res).assertEqual(2);
    return true;
  }
}

function foo_15(v: Any): void {
  expect(v instanceof Object || v === undefined || v === null).assertTrue();
}
function f1_15(v: Object | undefined | null): number {
  if (v instanceof Object || v === undefined || v === null) {
    foo_15(v);
    return f2_15(v);
  }
  else {
    return 0;
  }
}
function f2_15(v: Object | undefined | null): number {
  if (v === undefined || v === null) {
    expect(v).assertEqual(null);
    return 1;
  }
  else {
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
    foo_15(v);
    expect(v).assertEqual(5n);
    return 2;
  }
}

namespace testNS1_16 {
  function foo(v: Any): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
  }
  function f1(v: Object | undefined | null): number {
    if (v instanceof Object || v === undefined || v === null) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: Object | undefined | null): number {
    if (typeof v === 'bigint' || v === undefined || v === null) {
      expect(v).assertEqual(null);
      return 1;
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue();
      foo(v);
      expect(v).assertEqual(5);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(null);
    expect(res).assertEqual(1);
    res = f1(5);
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_16 {
  function foo(v: Object | undefined | Any): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
  }
  function f1(v: Object | undefined | null): number {
    if (v instanceof Object || v === undefined) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: Object | undefined | null): number {
    if (typeof v === 'bigint' || v === undefined || v === null) {
      expect(v).assertEqual(undefined);
      return 1;
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue();
      expect(v instanceof Object || v === undefined).assertTrue();
      foo(v);
      expect(v).assertEqual("abc");
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(undefined);
    expect(res).assertEqual(1);
    res = f1("abc");
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_16 {
  function foo(v: Object | null | undefined): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
  }
  function f1(v: Object | undefined | null): number {
    if (v instanceof Object || v === null || v === undefined) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: Object | undefined | null): number {
    if (typeof v === 'bigint' || v === undefined || v === null) {
      expect(v).assertEqual(5n);
      return 1;
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue();
      expect(v instanceof Object || v === null || v === undefined).assertTrue();
      foo(v);
      expect(v).assertEqual(10.7);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(5n);
    expect(res).assertEqual(1);
    res = f1(10.7);
    expect(res).assertEqual(2);
    return true;
  }
}

function foo_16(v: Any): void {
  expect(v instanceof Object || v === undefined || v === null).assertTrue();
}
function f1_16(v: Object | undefined | null): number {
  if (v instanceof Object || v === undefined || v === null) {
    foo_16(v);
    return f2_16(v);
  }
  else {
    return 0;
  }
}
function f2_16(v: Object | undefined | null): number {
  if (typeof v === 'bigint' || v === undefined || v === null) {
    expect(v).assertEqual(null);
    return 1;
  }
  else {
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
    foo_16(v);
    expect(v).assertEqual(5);
    return 2;
  }
}

namespace testNS1_17 {
  function foo(v: number | boolean): void {
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue();
  }
  function f1(v: number | boolean): number {
    if (typeof v === 'number' || typeof v === 'boolean') {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: number | boolean): number {
    if (typeof v === 'boolean') {
      expect(v).assertEqual(true);
      return 1;
    }
    else {
      expect(typeof v === 'number' || typeof v === 'boolean').assertTrue();
      expect(typeof v === 'number' || typeof v === 'boolean').assertTrue();
      foo(v);
      expect(v).assertEqual(5);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(true);
    expect(res).assertEqual(1);
    res = f1(5);
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_17 {
  function foo(v: number | boolean): void {
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue();
  }
  function f1(v: number | boolean): number {
    if (typeof v === 'number' || typeof v === 'boolean') {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: number | boolean): number {
    if (typeof v === 'boolean') {
      expect(v).assertEqual(true);
      return 1;
    }
    else {
      expect(typeof v === 'number' || typeof v === 'boolean').assertTrue();
      expect(typeof v === 'number' || typeof v === 'boolean').assertTrue();
      foo(v);
      expect(v).assertEqual(-7);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(true);
    expect(res).assertEqual(1);
    res = f1(-7);
    expect(res).assertEqual(2);
    return true;
  }
}

function foo_17(v: number | boolean): void {
  expect(typeof v === 'number' || typeof v === 'boolean').assertTrue();
}
function f1_17(v: number | boolean): number {
  if (typeof v === 'number' || typeof v === 'boolean') {
    foo_17(v);
    return f2_17(v);
  }
  else {
    return 0;
  }
}
function f2_17(v: number | boolean): number {
  if (typeof v === 'boolean') {
    expect(v).assertEqual(true);
    return 1;
  }
  else {
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue();
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue();
    foo_17(v);
    expect(v).assertEqual(5);
    return 2;
  }
}
namespace testNS1_18 {
  function foo(v: number | boolean): void {
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue();
  }
  function f1(v: number | boolean): number {
    if (typeof v === 'number' || typeof v === 'boolean') {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: number | boolean): number {
    if (typeof v === 'number') {
      expect(v).assertEqual(5);
      return 1;
    }
    else {
      expect(typeof v === 'number' || typeof v === 'boolean').assertTrue();
      expect(typeof v === 'number' || typeof v === 'boolean').assertTrue();
      foo(v);
      expect(v).assertEqual(true);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(5);
    expect(res).assertEqual(1);
    res = f1(true);
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_18 {
  function foo(v: number | boolean): void {
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue();
  }
  function f1(v: number | boolean): number {
    if (typeof v === 'number' || typeof v === 'boolean') {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: number | boolean): number {
    if (typeof v === 'number') {
      expect(v).assertEqual(-7);
      return 1;
    }
    else {
      expect(typeof v === 'number' || typeof v === 'boolean').assertTrue();
      expect(typeof v === 'number' || typeof v === 'boolean').assertTrue();
      foo(v);
      expect(v).assertEqual(true);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(-7);
    expect(res).assertEqual(1);
    res = f1(true);
    expect(res).assertEqual(2);
    return true;
  }
}

function foo_18(v: number | boolean): void {
  expect(typeof v === 'number' || typeof v === 'boolean').assertTrue();
}
function f1_18(v: number | boolean): number {
  if (typeof v === 'number' || typeof v === 'boolean') {
    foo_18(v);
    return f2_18(v);
  }
  else {
    return 0;
  }
}
function f2_18(v: number | boolean): number {
  if (typeof v === 'number') {
    expect(v).assertEqual(5);
    return 1;
  }
  else {
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue();
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue();
    foo_18(v);
    expect(v).assertEqual(true);
    return 2;
  }
}

namespace testNS1_19 {
  function foo(v: number | boolean | string | number): void {
    expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue();
  }
  function f1(v: number | string | boolean): number {
    if (typeof v === 'number' || typeof v === 'boolean' || typeof v === 'string') {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: number | string | boolean): number {
    if (typeof v === 'string') {
      expect(v).assertEqual("abc");
      return 1;
    }
    else {
      expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue();
      expect(typeof v === 'number' || typeof v === 'boolean' || typeof v === 'string').assertTrue();
      foo(v);
      expect(v).assertEqual(5);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1("abc");
    expect(res).assertEqual(1);
    res = f1(5);
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_19 {
  function foo(v: Any): void {
    expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue();
  }
  function f1(v: number | string | boolean): number {
    if (typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean') {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: number | string | boolean): number {
    if (typeof v === 'string') {
      expect(v).assertEqual("cab");
      return 1;
    }
    else {
      expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue();
      foo(v);
      expect(v).assertEqual(false);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1("cab");
    expect(res).assertEqual(1);
    res = f1(false);
    expect(res).assertEqual(2);
    return true;
  }
}

function foo_19(v: number | boolean | string | number): void {
  expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue();
}
function f1_19(v: number | string | boolean): number {
  if (typeof v === 'number' || typeof v === 'boolean' || typeof v === 'string') {
    foo_19(v);
    return f2_19(v);
  }
  else {
    return 0;
  }
}
function f2_19(v: number | string | boolean): number {
  if (typeof v === 'string') {
    expect(v).assertEqual("abc");
    return 1;
  }
  else {
    expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue();
    expect(typeof v === 'number' || typeof v === 'boolean' || typeof v === 'string').assertTrue();
    foo_19(v);
    expect(v).assertEqual(5);
    return 2;
  }
}

namespace testNS1_20 {
  function foo(v: number | string | boolean | string): void {
    expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue();
  }
  function f1(v: number | string | boolean): number {
    if (typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean') {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: number | string | boolean): number {
    if (typeof v === 'string' || typeof v === 'boolean') {
      expect(v).assertEqual("abc");
      return 1;
    }
    else {
      expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue();
      expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue();
      foo(v);
      expect(v).assertEqual(5);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1("abc");
    expect(res).assertEqual(1);
    res = f1(5);
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_20 {
  function foo(v: number | boolean | string | number): void {
    expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue();
  }
  function f1(v: number | string | boolean): number {
    if (typeof v === 'number' || typeof v === 'boolean' || typeof v === 'string') {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: number | string | boolean): number {
    if (typeof v === 'string' || typeof v === 'boolean') {
      expect(v).assertEqual(false);
      return 1;
    }
    else {
      expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue();
      expect(typeof v === 'number' || typeof v === 'boolean' || typeof v === 'string').assertTrue();
      foo(v);
      expect(v).assertEqual(7);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(false);
    expect(res).assertEqual(1);
    res = f1(7);
    expect(res).assertEqual(2);
    return true;
  }
}

function foo_20(v: number | string | boolean | string): void {
  expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue();
}
function f1_20(v: number | string | boolean): number {
  if (typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean') {
    foo_20(v);
    return f2_20(v);
  }
  else {
    return 0;
  }
}
function f2_20(v: number | string | boolean): number {
  if (typeof v === 'string' || typeof v === 'boolean') {
    expect(v).assertEqual("abc");
    return 1;
  }
  else {
    expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue();
    expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue();
    foo_20(v);
    expect(v).assertEqual(5);
    return 2;
  }
}


export default function DiffTypeIsSubOfTypeTOnPredefinedTest01(): void {
  describe('DiffTypeIsSubOfTypeTOnPredefinedTest01', () => {
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
 * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_1500
 * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0015
 * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
in case of usage instanceof on predefined types
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it(" testDiffTypeIsSubOfTypeTOnPredefined0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  const TAG = ' testDiffTypeIsSubOfTypeTOnPredefined0015';


  let res: number = f1_15(null);
  expect(res).assertEqual(1);
  res = f1_15(5n);
  expect(res).assertEqual(2);

  expect(testNS1_15.runTest()).assertEqual(true);
  expect(testNS2_15.runTest()).assertEqual(true);
  expect(testNS3_15.runTest()).assertEqual(true);

});

/**
 * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_1600
 * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0016
 * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
in case of usage instanceof on predefined types
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it(" testDiffTypeIsSubOfTypeTOnPredefined0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  const TAG = ' testDiffTypeIsSubOfTypeTOnPredefined0016';


  let res: number = f1_16(null);
  expect(res).assertEqual(1);
  res = f1_16(5);
  expect(res).assertEqual(2);

  expect(testNS1_16.runTest()).assertEqual(true);
  expect(testNS2_16.runTest()).assertEqual(true);
  expect(testNS3_16.runTest()).assertEqual(true);

});

/**
 * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_1700
 * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0017
 * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
in case of usage instanceof on predefined types
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it(" testDiffTypeIsSubOfTypeTOnPredefined0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  const TAG = ' testDiffTypeIsSubOfTypeTOnPredefined0017';


  let res: number = f1_17(true);
  expect(res).assertEqual(1);
  res = f1_17(5);
  expect(res).assertEqual(2);

  expect(testNS1_17.runTest()).assertEqual(true);
  expect(testNS2_17.runTest()).assertEqual(true);

});

/**
 * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_1800
 * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0018
 * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
in case of usage instanceof on predefined types
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it(" testDiffTypeIsSubOfTypeTOnPredefined0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  const TAG = ' testDiffTypeIsSubOfTypeTOnPredefined0018';


  let res: number = f1_18(5);
  expect(res).assertEqual(1);
  res = f1_18(true);
  expect(res).assertEqual(2);

  expect(testNS1_18.runTest()).assertEqual(true);
  expect(testNS2_18.runTest()).assertEqual(true);

});

/**
 * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_1900
 * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0019
 * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
in case of usage instanceof on predefined types
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it(" testDiffTypeIsSubOfTypeTOnPredefined0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  const TAG = ' testDiffTypeIsSubOfTypeTOnPredefined0019';


  let res: number = f1_19("abc");
  expect(res).assertEqual(1);
  res = f1_19(5);
  expect(res).assertEqual(2);

  expect(testNS1_19.runTest()).assertEqual(true);
  expect(testNS2_19.runTest()).assertEqual(true);

});

/**
 * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_2000
 * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0020
 * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
in case of usage instanceof on predefined types
 * @tc.size      MediumTest
 * @tc.type      Function
 * @tc.level     Level 2
 */
it(" testDiffTypeIsSubOfTypeTOnPredefined0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
  const TAG = ' testDiffTypeIsSubOfTypeTOnPredefined0020';


  let res: number = f1_20("abc");
  expect(res).assertEqual(1);
  res = f1_20(5);
  expect(res).assertEqual(2);

  expect(testNS1_20.runTest()).assertEqual(true);
  expect(testNS2_20.runTest()).assertEqual(true);

    });
  })
}