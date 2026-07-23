'use static';
/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

interface DeepObjD { e: number }
interface DeepObjC { d: DeepObjD }
interface DeepObjB { c: DeepObjC }
interface DeepObjA { b: DeepObjB }
interface DeepObj { a: DeepObjA }

export default function BuiltinsArrayOfExtendedTest(): void {
describe('BuiltinsArrayOfExtendedTest', () => {
  beforeAll(async () => {});
  beforeEach(async () => {});
  afterEach(async () => { await Utils.msSleep(10) });
  afterAll(() => {});

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest0100
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_0100
   * @tc.desc   Verify Array.of() with Date object arguments returns correct array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfExtendedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let date1: Date = new Date();
    let date2: Date = new Date(2020, 0, 1);
    let arr: Date[] = Array.of(date1, date2);
    expect(arr.length).assertEqual(2);
    expect(arr[0] instanceof Date).assertTrue();
    expect(arr[1] instanceof Date).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest0200
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_0200
   * @tc.desc   Verify Array.of() with empty object argument returns array with empty object
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfExtendedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let emptyObj: Record<string, never> = {};
    let arr: Record<string, never>[] = Array.of(emptyObj);
    expect(arr.length).assertEqual(1);
    expect(typeof arr[0]).assertEqual("object");
    expect(arr[0] !== null && arr[0] !== undefined).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest0300
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_0300
   * @tc.desc   Verify Array.of() with empty array argument returns array with empty array element
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfExtendedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[][] = Array.of<number[]>([]);
    expect(arr.length).assertEqual(1);
    expect(Array.isArray(arr[0])).assertTrue();
    expect(arr[0].length).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest0400
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_0400
   * @tc.desc   Verify Array.of() with MAX_SAFE_INTEGER and MIN_SAFE_INTEGER
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let arr: number[] = Array.of(Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER);
    expect(arr.length).assertEqual(2);
    expect(arr[0]).assertEqual(Number.MAX_SAFE_INTEGER);
    expect(arr[1]).assertEqual(Number.MIN_SAFE_INTEGER);
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest0500
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_0500
   * @tc.desc   Verify Array.of() with long string argument preserves string length
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let longStr: string = "a".repeat(10000);
    let arr: string[] = Array.of(longStr);
    expect(arr.length).assertEqual(1);
    expect(arr[0].length).assertEqual(10000);
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest0600
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_0600
   * @tc.desc   Verify Array.of() with deeply nested object arguments
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let deepObj: DeepObj = { a: { b: { c: { d: { e: 1 } } } } };
    let arr: DeepObj[] = Array.of(deepObj);
    expect(arr.length).assertEqual(1);
    expect(arr[0].a.b.c.d.e).assertEqual(1);
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest0700
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_0700
   * @tc.desc   Verify Array.of() with BigInt arguments returns correct array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let arr: bigint[] = Array.of(9007199254740991n, 123n);
    expect(arr.length).assertEqual(2);
    expect(typeof arr[0]).assertEqual("bigint");
    expect(typeof arr[1]).assertEqual("bigint");
    expect(arr[0]).assertEqual(9007199254740991n);
    expect(arr[1]).assertEqual(123n);
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest0800
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_0800
   * @tc.desc   Verify Array.of() with RegExp arguments returns array of regex patterns
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let arr: RegExp[] = Array.of(new RegExp("test"), new RegExp("pattern", "gi"));
    expect(arr.length).assertEqual(2);
    expect(arr[0] instanceof RegExp).assertTrue();
    expect(arr[1] instanceof RegExp).assertTrue();
    expect(arr[0].test("test")).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest0900
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_0900
   * @tc.desc   Verify Array.of() with Error objects returns array of errors
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let err1: Error = new Error("test error");
    let err2: TypeError = new TypeError("type error");
    let arr1: Error[] = Array.of(err1);
    let arr2: TypeError[] = Array.of(err2);
    expect(arr1.length).assertEqual(1);
    expect(arr2.length).assertEqual(1);
    expect(arr1[0] instanceof Error).assertTrue();
    expect(arr2[0] instanceof TypeError).assertTrue();
    expect(arr1[0].message).assertEqual("test error");
    expect(arr2[0].message).assertEqual("type error");
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest1000
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_1000
   * @tc.desc   Verify Array.of() with Map object returns array with Map element
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let map: Map<string, number> = new Map<string, number>([["a", 1], ["b", 2]]);
    let arr: Map<string, number>[] = Array.of(map);
    expect(arr.length).assertEqual(1);
    expect(arr[0] instanceof Map).assertTrue();
    expect(arr[0].get("a")).assertEqual(1);
    expect(arr[0].get("b")).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest1100
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_1100
   * @tc.desc   Verify Array.of() with Set object returns array with Set element
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let set: Set<number> = new Set<number>([1, 2, 3]);
    let arr: Set<number>[] = Array.of(set);
    expect(arr.length).assertEqual(1);
    expect(arr[0] instanceof Set).assertTrue();
    expect(arr[0].has(1)).assertTrue();
    expect(arr[0].has(2)).assertTrue();
    expect(arr[0].has(3)).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest1200
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_1200
   * @tc.desc   Verify Array.of() with Promise object returns array with Promise element
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    let promise: Promise<number> = Promise.resolve<number>(42);
    let arr: Promise<number>[] = Array.of(promise);
    expect(arr.length).assertEqual(1);
    expect(arr[0] instanceof Promise).assertTrue();
    let result: number = await arr[0];
    expect(result).assertEqual(42);
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest1300
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_1300
   * @tc.desc   Verify TypedArray.of() creates typed arrays correctly
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let int8Array: Int8Array = Int8Array.of(1, 2, 3);
    let uint8Array: Uint8Array = Uint8Array.of(10, 20, 30);
    expect(int8Array.length).assertEqual(3);
    expect(int8Array[0]).assertEqual(1);
    expect(int8Array instanceof Int8Array).assertTrue();
    expect(uint8Array.length).assertEqual(3);
    expect(uint8Array[0]).assertEqual(10);
    expect(uint8Array instanceof Uint8Array).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest1400
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_1400
   * @tc.desc   Verify Array.of() result has correct enumerable keys
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfExtendedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
    let arr: number[] = Array.of<number>(1, 2, 3);
    let keys: string[] = Object.keys(arr);
    expect(keys.length).assertEqual(3);
    expect(keys[0]).assertEqual("0");
    expect(keys[1]).assertEqual("1");
    expect(keys[2]).assertEqual("2");
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest1500
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_1500
   * @tc.desc   Verify Array.of() with primitive wrapper objects
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let numObj: Number = new Number(42);
    let strObj: String = new String("test");
    let boolObj: Boolean = new Boolean(true);
    let numArr: Number[] = Array.of(numObj);
    let strArr: String[] = Array.of(strObj);
    let boolArr: Boolean[] = Array.of(boolObj);
    expect(numArr.length).assertEqual(1);
    expect(strArr.length).assertEqual(1);
    expect(boolArr.length).assertEqual(1);
    expect(numArr[0] instanceof Number).assertTrue();
    expect(strArr[0] instanceof String).assertTrue();
    expect(boolArr[0] instanceof Boolean).assertTrue();
    expect(Number(numArr[0])).assertEqual(42);
    expect(String(strArr[0])).assertEqual("test");
    expect(Boolean(boolArr[0])).assertEqual(true);
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest1600
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_1600
   * @tc.desc   Verify Array.of() with async function
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
    let asyncFunc: () => Promise<number> = async () => 42.0;
    let arr: (() => Promise<number>)[] = Array.of(asyncFunc);
    expect(arr.length).assertEqual(1);
    expect(typeof arr[0]).assertEqual("function");
    let result: number = await arr[0]();
    expect(result).assertEqual(42);
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest1700
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_1700
   * @tc.desc   Verify Array.of() with special character strings returns correct array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let arr: string[] = Array.of<string>("\n", "\t", "\\", "\r");
    expect(arr.length).assertEqual(4);
    expect(arr[0]).assertEqual("\n");
    expect(arr[1]).assertEqual("\t");
    expect(arr[2]).assertEqual("\\");
    expect(arr[3]).assertEqual("\r");
    expect(arr[0].length).assertEqual(1);
    expect(arr[1].length).assertEqual(1);
    expect(arr[2].length).assertEqual(1);
    expect(arr[3].length).assertEqual(1);
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest1800
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_1800
   * @tc.desc   Verify Array.of() with Number.MIN_SAFE_INTEGER returns correct array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let arr: number[] = Array.of(Number.MIN_SAFE_INTEGER);
    expect(arr.length).assertEqual(1);
    expect(arr[0]).assertEqual(Number.MIN_SAFE_INTEGER);
    expect(arr[0]).assertEqual(-9007199254740991);
  });

})
}
