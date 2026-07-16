'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
} from '../../../../hypium/index';
import Utils from './../Util.test';

class Item039 {
  id: int = 0;

  constructor(id: int) {
    this.id = id;
  }
}

class CustomError034 extends Error {
  errorCode: int = 0;

  constructor(message: string, errorCode: int) {
    super(message);
    this.name = "CustomError";
    this.errorCode = errorCode;
  }
}

export default function SetForEachTest(): void {
  describe('SetForEachTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.name testSetForEach001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_0100
     * @tc.desc Verify forEach with normal callback traverses all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>([1, 2, 3]);
      let result: long[] = [];
      set.forEach((k: long, v: long, s: Set<long>): void => {
        result.push(k);
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name testSetForEach002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_0200
     * @tc.desc Verify forEach without callbackfn parameter throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2]);
      try {
        let fn = (set as Record<string, Object>)["forEach"];
        (fn as Object as () => void)();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetForEach003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_0300
     * @tc.desc Verify forEach with null as callbackfn throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2]);
      try {
        let fn = (set as Record<string, Object>)["forEach"];
        (fn as Object as (cb: Object | null) => void)(null);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetForEach004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_0400
     * @tc.desc Verify forEach with undefined as callbackfn throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2]);
      try {
        let fn = (set as Record<string, Object>)["forEach"];
        (fn as Object as (cb: Object | undefined) => void)(undefined);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetForEach005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_0500
     * @tc.desc Verify forEach traverses all elements with count validation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>([1, 2]);
      let count = 0;
      set.forEach((k: long, v: long, s: Set<long>): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testSetForEach006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_0600
     * @tc.desc Verify arrow function as callbackfn traverses correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<float>([10.0, 20.0, 30.0]);
      let sum = 0.0;
      set.forEach((k: float, v: float, s: Set<float>): void => {
        sum += k;
      });
      expect(sum).assertEqual(60.0);
    });

    /**
     * @tc.name testSetForEach007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_0700
     * @tc.desc Verify arrow function using only first parameter traverses normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a", "b"]);
      let result: string[] = [];
      set.forEach((k: string): void => {
        result.push(k);
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
    });

    /**
     * @tc.name testSetForEach008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_0800
     * @tc.desc Verify arrow function omitting callback parameters still traverses normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<short>([1, 2, 3]);
      let count = 0;
      set.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testSetForEach009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_0900
     * @tc.desc Verify function declaration as callbackfn traverses correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([5, 10, 15]);
      let result: int[] = [];
      set.forEach((k: int, v: int, s: Set<int>): void => {
        result.push(k * 2);
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.name testSetForEach010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_1000
     * @tc.desc Verify function expression as callbackfn traverses correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["x", "y"]);
      let result: string[] = [];
      set.forEach((k: string, v: string, s: Set<string>): void => {
        result.push(k.toUpperCase());
      });
      expect(result[0]).assertEqual("X");
      expect(result[1]).assertEqual("Y");
    });

    /**
     * @tc.name testSetForEach011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_1100
     * @tc.desc Verify forEach callback parameters k and v are equal in Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([100, 200]);
      set.forEach((k: int, v: int, s: Set<int>): void => {
        expect(k).assertEqual(v);
      });
    });

    /**
     * @tc.name testSetForEach012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_1200
     * @tc.desc Verify third callback parameter equals the Set instance calling forEach
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<float>([1.0, 2.0, 3.0]);
      set.forEach((k: float, v: float, s: Set<float>): void => {
        expect(s === set).assertTrue();
      });
    });

    /**
     * @tc.name testSetForEach013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_1300
     * @tc.desc Verify third parameter can access Set methods and properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([10, 20]);
      set.forEach((k: int, v: int, s: Set<int>): void => {
        expect(s.has(k)).assertTrue();
        expect(s.size).assertEqual(2);
      });
    });

    /**
     * @tc.name testSetForEach014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_1400
     * @tc.desc Verify forEach with string type as callbackfn throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2]);
      try {
        let fn = (set as Record<string, Object>)["forEach"];
        (fn as Object as (cb: string) => void)("not a function");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetForEach015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_1500
     * @tc.desc Verify forEach with number type as callbackfn throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2]);
      try {
        let fn = (set as Record<string, Object>)["forEach"];
        (fn as Object as (cb: number) => void)(12345);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetForEach016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_1600
     * @tc.desc Verify forEach with plain object as callbackfn throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2]);
      try {
        let fn = (set as Record<string, Object>)["forEach"];
        (fn as Object as (cb: Object) => void)(new Object());
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetForEach017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_1700
     * @tc.desc Verify forEach with empty string as callbackfn throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2]);
      try {
        let fn = (set as Record<string, Object>)["forEach"];
        (fn as Object as (cb: string) => void)("");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetForEach018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_1800
     * @tc.desc Verify forEach with 0 as callbackfn throws exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2]);
      try {
        let fn = (set as Record<string, Object>)["forEach"];
        (fn as Object as (cb: int) => void)(0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetForEach019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_1900
     * @tc.desc Verify forEach traverses all elements in Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>([1, 2, 3, 4, 5]);
      let result: long[] = [];
      set.forEach((k: long, v: long, s: Set<long>): void => {
        result.push(k);
      });
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name testSetForEach020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_2000
     * @tc.desc Verify forEach does not modify Set content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["a", "b", "c"]);
      set.forEach((k: string, v: string, s: Set<string>): void => {
      });
      expect(set.size).assertEqual(3);
      expect(set.has("a")).assertTrue();
      expect(set.has("b")).assertTrue();
      expect(set.has("c")).assertTrue();
    });

    /**
     * @tc.name testSetForEach021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_2100
     * @tc.desc Verify forEach return value is undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2]);
      let result = set.forEach((k: int, v: int, s: Set<int>): void => {
      });
      expect(result).assertUndefined();
    });

    /**
     * @tc.name testSetForEach022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_2200
     * @tc.desc Verify empty Set forEach does not trigger callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      let called = false;
      set.forEach((k: int, v: int, s: Set<int>): void => {
        called = true;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.name testSetForEach023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_2300
     * @tc.desc Verify single-element Set forEach triggers callback once
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<double>([42.0]);
      let count = 0;
      let receivedK: double = 0.0;
      set.forEach((k: double, v: double, s: Set<double>): void => {
        count++;
        receivedK = k;
      });
      expect(count).assertEqual(1);
      expect(receivedK).assertEqual(42.0);
    });

    /**
     * @tc.name testSetForEach024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_2400
     * @tc.desc Verify Set containing null elements forEach traverses normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Object | null>([null, "a"]);
      let hasNull = false;
      let hasA = false;
      set.forEach((k: Object | null, v: Object | null, s: Set<Object | null>): void => {
        if (k === null) {
          hasNull = true;
        }
        if (k === "a") {
          hasA = true;
        }
      });
      expect(hasNull).assertTrue();
      expect(hasA).assertTrue();
    });

    /**
     * @tc.name testSetForEach025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_2500
     * @tc.desc Verify Set containing undefined elements forEach traverses normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string | undefined>([undefined, "b"]);
      let hasUndefined = false;
      let hasB = false;
      set.forEach((k: string | undefined, v: string | undefined, s: Set<string | undefined>): void => {
        if (k === undefined) {
          hasUndefined = true;
        }
        if (k === "b") {
          hasB = true;
        }
      });
      expect(hasUndefined).assertTrue();
      expect(hasB).assertTrue();
    });

    /**
     * @tc.name testSetForEach026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_2600
     * @tc.desc Verify Set containing empty string forEach traverses normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["", "hello"]);
      let result: string[] = [];
      set.forEach((k: string, v: string, s: Set<string>): void => {
        result.push(k);
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("");
      expect(result[1]).assertEqual("hello");
    });

    /**
     * @tc.name testSetForEach027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_2700
     * @tc.desc Verify Set containing 0 value forEach traverses normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>([0, 1, -1]);
      let result: long[] = [];
      set.forEach((k: long, v: long, s: Set<long>): void => {
        result.push(k);
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(-1);
    });

    /**
     * @tc.name testSetForEach028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_2800
     * @tc.desc Verify forEach traverses in element insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>();
      set.add(3);
      set.add(1);
      set.add(2);
      let result: int[] = [];
      set.forEach((k: int, v: int, s: Set<int>): void => {
        result.push(k);
      });
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
    });

    /**
     * @tc.name testSetForEach029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_2900
     * @tc.desc Verify later added elements appear later in forEach traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["first"]);
      set.add("second");
      set.add("third");
      let order: string[] = [];
      set.forEach((k: string, v: string, s: Set<string>): void => {
        order.push(k);
      });
      expect(order[0]).assertEqual("first");
      expect(order[1]).assertEqual("second");
      expect(order[2]).assertEqual("third");
    });

    /**
     * @tc.name testSetForEach030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_3000
     * @tc.desc Verify duplicate add does not change traversal order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([10, 20, 30]);
      set.add(10);
      let order: int[] = [];
      set.forEach((k: int, v: int, s: Set<int>): void => {
        order.push(k);
      });
      expect(order[0]).assertEqual(10);
      expect(order[1]).assertEqual(20);
      expect(order[2]).assertEqual(30);
    });

    /**
     * @tc.name testSetForEach031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_3100
     * @tc.desc Verify delete then add moves element to end in traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      set.delete(2);
      set.add(2);
      let order: int[] = [];
      set.forEach((k: int, v: int, s: Set<int>): void => {
        order.push(k);
      });
      expect(order[0]).assertEqual(1);
      expect(order[1]).assertEqual(3);
      expect(order[2]).assertEqual(2);
    });

    /**
     * @tc.name testSetForEach032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_3200
     * @tc.desc Verify Set<int> forEach traverses int elements normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>([100, 200, 300]);
      let sum: long = 0;
      set.forEach((k: long, v: long, s: Set<long>): void => {
        sum += k;
      });
      expect(sum).assertEqual(600);
    });

    /**
     * @tc.name testSetForEach033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_3300
     * @tc.desc Verify Set<string> forEach traverses string elements normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<string>(["apple", "banana", "cherry"]);
      let result: string = "";
      set.forEach((k: string, v: string, s: Set<string>): void => {
        result += k;
      });
      expect(result).assertEqual("applebananacherry");
    });

    /**
     * @tc.name testSetForEach034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_3400
     * @tc.desc Verify Set<boolean> forEach traverses boolean elements normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<boolean>([true, false]);
      let count = 0;
      set.forEach((k: boolean, v: boolean, s: Set<boolean>): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testSetForEach035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_3500
     * @tc.desc Verify Set<number> forEach traverses decimal and NaN values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number>();
      set.add(3.14);
      set.add(Number.NaN);
      set.add(Number.MAX_VALUE);
      let count = 0;
      set.forEach((k: number, v: number, s: Set<number>): void => {
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testSetForEach036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_3600
     * @tc.desc Verify Set<Object> forEach traverses object references
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new Item039(1);
      let obj2 = new Item039(2);
      let set = new Set<Object>([obj1, obj2]);
      let result: int[] = [];
      set.forEach((k: Object, v: Object, s: Set<Object>): void => {
        result.push((k as Item039).id);
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.name testSetForEach037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_3700
     * @tc.desc Verify union type Set forEach handles different element types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<number | string>();
      set.add(1);
      set.add("two");
      set.add(3);
      let numCount = 0;
      let strCount = 0;
      set.forEach((k: number | string, v: number | string, s: Set<number | string>): void => {
        let t: string = typeof k;
        if (t === "number") {
          numCount++;
        }
        if (t === "string") {
          strCount++;
        }
      });
      expect(numCount).assertEqual(2);
      expect(strCount).assertEqual(1);
    });

    /**
     * @tc.name testSetForEach038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_3800
     * @tc.desc Verify remaining elements not triggered after Error is thrown in callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<long>([1, 2, 3, 4]);
      let visited: long[] = [];
      try {
        set.forEach((k: long, v: long, s: Set<long>): void => {
          visited.push(k);
          if (k === 2) {
            throw new Error("break");
          }
        });
      } catch (error) {
        expect(error.message).assertEqual("break");
      }
      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
    });

    /**
     * @tc.name testSetForEach039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_3900
     * @tc.desc Verify callback throws custom Error subclass instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([10, 20]);
      try {
        set.forEach((k: int, v: int, s: Set<int>): void => {
          throw new CustomError034("custom error", 500);
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("CustomError");
        expect(error.message).assertEqual("custom error");
      }
    });

    /**
     * @tc.name testSetForEach040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_4000
     * @tc.desc Verify forEach with string callbackfn throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1]);
      try {
        let fn = (set as Record<string, Object>)["forEach"];
        (fn as Object as (cb: string) => void)("invalid");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetForEach041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_4100
     * @tc.desc Verify forEach with number callbackfn throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1]);
      try {
        let fn = (set as Record<string, Object>)["forEach"];
        (fn as Object as (cb: number) => void)(999);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetForEach042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_4200
     * @tc.desc Verify forEach with boolean callbackfn throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1]);
      try {
        let fn = (set as Record<string, Object>)["forEach"];
        (fn as Object as (cb: boolean) => void)(true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetForEach043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_4300
     * @tc.desc Verify forEach with array callbackfn throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 改用new Array()替代
      let set = new Set<int>([1]);
      try {
        let fn = (set as Record<string, Object>)["forEach"];
        (fn as Object as (cb: int[]) => void)([1, 2, 3]);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetForEach044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_4400
     * @tc.desc Verify normal forEach invocation does not throw exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      let count = 0;
      set.forEach((k: int, v: int, s: Set<int>): void => {
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testSetForEach045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_4500
     * @tc.desc Verify try-catch wraps forEach catches callback exception
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      let visited: int[] = [];
      try {
        set.forEach((k: int, v: int, s: Set<int>): void => {
          visited.push(k);
          throw new Error("callback error");
        });
        expect().assertFail();
      } catch (error) {
        expect(error.message).assertEqual("callback error");
      }
      expect(visited.length).assertEqual(1);
    });

    /**
     * @tc.name testSetForEach046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_4600
     * @tc.desc Verify caught error object is Error type
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1]);
      try {
        let fn = (set as Record<string, Object>)["forEach"];
        (fn as Object as (cb: Object | null) => void)(null);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testSetForEach047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_4700
     * @tc.desc Verify inner try-catch in callback does not affect outer traversal
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      let visited: int[] = [];
      set.forEach((k: int, v: int, s: Set<int>): void => {
        try {
          if (k === 2) {
            throw new Error("inner error");
          }
        } catch (innerError) {
          expect(innerError.message).assertEqual("inner error");
        }
        visited.push(k);
      });
      expect(visited.length).assertEqual(3);
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
      expect(visited[2]).assertEqual(3);
    });

    /**
     * @tc.name testSetForEach048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_4800
     * @tc.desc Verify forEach callback adds element to Set during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      let result: int[] = [];
      set.forEach((k: int, v: int, s: Set<int>): void => {
        result.push(k);
        if (k === 2) {
          s.add(4);
        }
      });
      expect(set.size).assertEqual(4);
      expect(set.has(4)).assertTrue();
    });

    /**
     * @tc.name testSetForEach049
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_4900
     * @tc.desc Verify forEach callback deletes element from Set during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      set.forEach((k: int, v: int, s: Set<int>): void => {
        if (k === 1) {
          s.delete(2);
        }
      });
      expect(set.size).assertEqual(2);
      expect(set.has(2)).assertFalse();
      expect(set.has(1)).assertTrue();
      expect(set.has(3)).assertTrue();
    });

    /**
     * @tc.name testSetForEach050
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_5000
     * @tc.desc Verify forEach callback clears Set during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([1, 2, 3]);
      set.forEach((k: int, v: int, s: Set<int>): void => {
        if (k === 1) {
          s.clear();
        }
      });
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name testSetForEach051
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_5100
     * @tc.desc Verify two consecutive forEach traversals produce identical order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<int>([5, 3, 1, 4, 2]);
      let result1: int[] = [];
      let result2: int[] = [];
      set.forEach((v: int): void => {
        result1.push(v);
      });
      set.forEach((v: int): void => {
        result2.push(v);
      });
      for (let i = 0; i < result1.length; i++) {
        expect(result1[i]).assertEqual(result2[i]);
      }
    });

    /**
     * @tc.name testSetForEach052
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_5200
     * @tc.desc Verify forEach callback parameter type is Item039 on Set of Item039 without downcast
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new Item039(1);
      let obj2 = new Item039(2);
      let set = new Set<Item039>([obj1, obj2]);
      let result: int[] = [];
      set.forEach((k: Item039, v: Item039, s: Set<Item039>): void => {
        result.push(k.id);
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.name testSetForEach053
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_5300
     * @tc.desc Verify forEach callback k equals v for Set of Item039 custom class
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Item039>([new Item039(10), new Item039(20)]);
      set.forEach((k: Item039, v: Item039, s: Set<Item039>): void => {
        expect(k).assertEqual(v);
      });
    });

    /**
     * @tc.name testSetForEach054
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_5400
     * @tc.desc Verify third forEach parameter equals the Set instance for Set of Item039
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Item039>([new Item039(1), new Item039(2)]);
      set.forEach((k: Item039, v: Item039, s: Set<Item039>): void => {
        expect(s === set).assertTrue();
      });
    });

    /**
     * @tc.name testSetForEach055
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_FOR_EACH_5500
     * @tc.desc Verify forEach traverses all Item039 elements in insertion order on Set of Item039
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSetForEach055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set = new Set<Item039>();
      let a = new Item039(3);
      let b = new Item039(1);
      let c = new Item039(2);
      set.add(a);
      set.add(b);
      set.add(c);
      let order: int[] = [];
      set.forEach((k: Item039, v: Item039): void => {
        order.push(k.id);
      });
      expect(order[0]).assertEqual(3);
      expect(order[1]).assertEqual(1);
      expect(order[2]).assertEqual(2);
    });
  });
}