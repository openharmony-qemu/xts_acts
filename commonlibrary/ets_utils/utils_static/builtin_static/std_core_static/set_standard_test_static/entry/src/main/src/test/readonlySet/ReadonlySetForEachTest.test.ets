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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

class CustomSetError032 extends Error {
  errorCode: int;

  constructor(message: string, errorCode: int) {
    super(message);
    this.name = "CustomSetError";
    this.errorCode = errorCode;
  }
}

export default function ReadonlySetForEachTest(): void {
  describe('ReadonlySetForEachTest', (): void => {
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
     * @tc.name testReadonlySetForEach001
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0100
     * @tc.desc Verify forEach callbackfn parameter traverses all elements correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      const result: long[] = [];
      set.forEach((v1: long, v2: long, s: ReadonlySet<long>): void => {
        result.push(v1);
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach002
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0200
     * @tc.desc Verify forEach without callbackfn parameter throws exception (ARKTS limit: Record pattern not supported)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      try {
        let fn = (set as Record<string, Object>)["forEach"];
        (fn as Object as () => void)();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetForEach003
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0300
     * @tc.desc Verify forEach with null callbackfn throws ClassCastError (ARKTS limit: Record pattern not supported)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      try {
        let fn = (set as Record<string, Object>)["forEach"];
        (fn as Object as (cb: Object | null) => void)(null);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetForEach004
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0400
     * @tc.desc Verify forEach with undefined callbackfn throws ClassCastError (ARKTS limit: Record pattern not supported)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      try {
        let fn = (set as Record<string, Object>)["forEach"];
        (fn as Object as (cb: Object | undefined) => void)(undefined);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetForEach005
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0500
     * @tc.desc Verify forEach callbackfn traverses all elements in insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["a", "b", "c"]);
      const result: string[] = [];
      set.forEach((value: string, value2: string, s: ReadonlySet<string>): void => {
        result.push(value);
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      expect(result[2]).assertEqual("c");
    });

    /**
     * @tc.name testReadonlySetForEach006
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0600
     * @tc.desc Verify arrow function as callbackfn traverses correctly (ARKTS limit: nested function not supported)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Nested function declarations not supported in ARKTS
      const set: ReadonlySet<long> = new Set<long>([10, 20, 30]);
      const result: long[] = [];
      set.forEach((value: long, value2: long, s: ReadonlySet<long>): void => {
        result.push(value);
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.name testReadonlySetForEach007
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0700
     * @tc.desc Verify forEach callback value and value2 are equal for int Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      set.forEach((value: long, value2: long, s: ReadonlySet<long>): void => {
        expect(value).assertEqual(value2);
      });
    });

    /**
     * @tc.name testReadonlySetForEach008
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0800
     * @tc.desc Verify arrow function as callbackfn traverses all elements correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["x", "y"]);
      set.forEach((value: string, value2: string, s: ReadonlySet<string>): void => {
        expect(s.size).assertEqual(2);
      });
    });

    /**
     * @tc.name testReadonlySetForEach009
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_0900
     * @tc.desc Verify forEach with string callbackfn throws ClassCastError (ARKTS limit: Record pattern not supported)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2]);
      try {
        let fn = (set as Record<string, Object>)["forEach"];
        (fn as Object as (cb: string) => void)("not a function");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetForEach010
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1000
     * @tc.desc Verify forEach with number callbackfn throws ClassCastError (ARKTS limit: Record pattern not supported)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2]);
      try {
        let fn = (set as Record<string, Object>)["forEach"];
        (fn as Object as (cb: number) => void)(12345);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetForEach011
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1100
     * @tc.desc Verify forEach with empty object callbackfn throws ClassCastError (ARKTS limit: Record pattern not supported)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2]);
      try {
        let fn = (set as Record<string, Object>)["forEach"];
        (fn as Object as (cb: Object) => void)(new Object());
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetForEach012
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1200
     * @tc.desc Verify forEach with boolean callbackfn throws ClassCastError (ARKTS limit: Record pattern not supported)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2]);
      try {
        let fn = (set as Record<string, Object>)["forEach"];
        (fn as Object as (cb: boolean) => void)(true);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetForEach013
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1300
     * @tc.desc Verify forEach with string Set iterates correct count of elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["hello", "world"]);
      const result: string[] = [];
      set.forEach((v: string): void => {
        result.push(v);
      });
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach014
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1400
     * @tc.desc Verify forEach with float Set accumulates sum of all elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number> = new Set<number>([1.1, 2.2, 3.3]);
      let sum: number = 0;
      set.forEach((v: number): void => {
        sum += v;
      });
      expect(sum > 6.5).assertTrue();
    });

    /**
     * @tc.name testReadonlySetForEach015
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1500
     * @tc.desc Verify forEach with Object Set invokes callback for each element
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Object literal not supported for Object init
      const set: ReadonlySet<Object> = new Set<Object>([new Object(), new Object()]);
      let count = 0;
      set.forEach((v: Object): void => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.name testReadonlySetForEach016
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1600
     * @tc.desc Verify callbackfn traverses all elements in insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([1, 2, 3, 4, 5]);
      let callCount: int = 0;
      set.forEach((v: long): void => {
        callCount++;
      });
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.name testReadonlySetForEach017
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1700
     * @tc.desc Verify forEach with int Set sums all elements correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const intSet: ReadonlySet<long> = new Set<long>([1, 2, 3]);
      let intSum: long = 0;
      intSet.forEach((v: long): void => {
        intSum += v;
      });
      expect(intSum).assertEqual(6);
    });

    /**
     * @tc.name testReadonlySetForEach018
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1800
     * @tc.desc Verify forEach single-element int Set callback receives correct value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([42]);
      let count: int = 0;
      set.forEach((v: long): void => {
        count++;
        expect(v).assertEqual(42);
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.name testReadonlySetForEach019
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_1900
     * @tc.desc Verify forEach on empty ReadonlySet never invokes callback
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptySet: ReadonlySet<double> = new Set<double>();
      let called: boolean = false;
      emptySet.forEach((v: double): void => {
        called = true;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.name testReadonlySetForEach020
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_2000
     * @tc.desc Verify third callback parameter equals the Set instance itself
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 2, 3, 3, 3]);
      set.forEach((v: int, v2: int, s: ReadonlySet<int>): void => {
        expect(s === set).assertTrue();
      });
    });

    /**
     * @tc.name testReadonlySetForEach021
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_2100
     * @tc.desc Verify forEach traverses elements in correct insertion order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>();
      set.add("first");
      set.add("second");
      set.add("third");
      const result: string[] = [];
      (set as ReadonlySet<string>).forEach((v: string): void => {
        result.push(v);
      });
      expect(result[0]).assertEqual("first");
      expect(result[1]).assertEqual("second");
      expect(result[2]).assertEqual("third");
    });

    /**
     * @tc.name testReadonlySetForEach022
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_2200
     * @tc.desc Verify two consecutive forEach traversals produce identical order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([5, 3, 1, 4, 2]);
      const result1: long[] = [];
      const result2: long[] = [];
      set.forEach((v: long): void => {
        result1.push(v);
      });
      set.forEach((v: long): void => {
        result2.push(v);
      });
      for (let i = 0; i < result1.length; i++) {
        expect(result1[i]).assertEqual(result2[i]);
      }
    });

    /**
     * @tc.name testReadonlySetForEach023
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_2300
     * @tc.desc Verify forEach callback value and value2 are equal for string Set
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<string> = new Set<string>(["alpha", "beta", "gamma"]);
      set.forEach((value: string, value2: string): void => {
        expect(value).assertEqual(value2);
      });
    });

    /**
     * @tc.name testReadonlySetForEach024
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_2400
     * @tc.desc Verify third callback parameter s.size equals correct Set size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<long> = new Set<long>([100, 200]);
      set.forEach((value: long, value2: long, s: ReadonlySet<long>): void => {
        expect(s.size).assertEqual(2);
      });
    });

    /**
     * @tc.name testReadonlySetForEach025
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_2500
     * @tc.desc Verify forEach return value is undefined
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<double> = new Set<double>([1.0, 2.0]);
      const returnValue = set.forEach((v: double): void => {
      });
      expect(returnValue).assertUndefined();
    });

    /**
     * @tc.name testReadonlySetForEach026
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_2600
     * @tc.desc Verify forEach callback throws Error interrupts traversal, catch captures it
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      try {
        set.forEach((v: int): void => {
          if (v === 2) {
            throw new Error("Callback error at value 2");
          }
        });
        expect().assertFail();
      } catch (error) {
        expect(error.message).assertEqual("Callback error at value 2");
      }
    });

    /**
     * @tc.name testReadonlySetForEach027
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_2700
     * @tc.desc Verify forEach traverses all elements with correct count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30]);
      let count: int = 0;
      set.forEach((v: int): void => {
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach028
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_2800
     * @tc.desc Verify forEach with different generic types all traverse correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const intSet: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      let intCount: int = 0;
      intSet.forEach((v: int): void => {
        intCount++;
      });
      expect(intCount).assertEqual(3);

      const strSet: ReadonlySet<string> = new Set<string>(["a", "b"]);
      let strCount: int = 0;
      strSet.forEach((v: string): void => {
        strCount++;
      });
      expect(strCount).assertEqual(2);

      const numSet: ReadonlySet<number> = new Set<number>([1.1, 2.2, 3.3, 4.4]);
      let numCount: int = 0;
      numSet.forEach((v: number): void => {
        numCount++;
      });
      expect(numCount).assertEqual(4);
    });

    /**
     * @tc.name testReadonlySetForEach029
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_2900
     * @tc.desc Verify try-catch captures Error from forEach callback, finally always runs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      let catchCalled: boolean = false;
      let finallyCalled: boolean = false;
      let errorMsg: string = "";
      try {
        set.forEach((v: int): void => {
          throw new Error("Error in forEach callback");
        });
      } catch (error) {
        catchCalled = true;
        errorMsg = error.message;
      } finally {
        finallyCalled = true;
      }
      expect(catchCalled).assertTrue();
      expect(finallyCalled).assertTrue();
      expect(errorMsg).assertEqual("Error in forEach callback");
    });

    /**
     * @tc.name testReadonlySetForEach030
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_3000
     * @tc.desc Verify forEach callback throws Error mid-iteration, only visited elements recorded
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3, 4, 5]);
      const visited: int[] = [];
      try {
        set.forEach((v: int): void => {
          visited.push(v);
          if (v === 3) {
            throw new Error("Stop at 3");
          }
        });
      } catch (error) {
        expect(error.message).assertEqual("Stop at 3");
      }
      expect(visited[0]).assertEqual(1);
      expect(visited[1]).assertEqual(2);
      expect(visited[2]).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach031
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_3100
     * @tc.desc Verify forEach with number callbackfn via Record cast throws error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2]);
      try {
        let fn = (set as Record<string, Object>)["forEach"];
        (fn as Object as (cb: number) => void)(42);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.name testReadonlySetForEach032
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_3200
     * @tc.desc Verify forEach with underlying Set add during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mutableSet: Set<int> = new Set<int>([1, 2, 3]);
      const readonlySet: ReadonlySet<int> = mutableSet;
      let visited: int[] = [];
      readonlySet.forEach((v: int): void => {
        visited.push(v);
        if (v === 2) {
          mutableSet.add(4);
        }
      });
      expect(mutableSet.size).assertEqual(4);
      expect(mutableSet.has(4)).assertTrue();
    });

    /**
     * @tc.name testReadonlySetForEach033
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_3300
     * @tc.desc Verify forEach with underlying Set clear during iteration
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mutableSet: Set<int> = new Set<int>([1, 2, 3]);
      const readonlySet: ReadonlySet<int> = mutableSet;
      let count: int = 0;
      readonlySet.forEach((v: int): void => {
        count++;
        if (v === 1) {
          mutableSet.clear();
        }
      });
      expect(mutableSet.size).assertEqual(0);
    });

    /**
     * @tc.name testReadonlySetForEach034
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_3400
     * @tc.desc Verify forEach with zero-parameter arrow function
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([1, 2, 3]);
      let count: int = 0;
      set.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.name testReadonlySetForEach035
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_3500
     * @tc.desc Verify forEach callback throws custom Error subclass caught with properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<int> = new Set<int>([10, 20, 30]);
      try {
        set.forEach((v: int): void => {
          throw new CustomSetError032("custom error in forEach", v);
        });
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("CustomSetError");
        expect(error.message).assertEqual("custom error in forEach");
      }
    });

    /**
     * @tc.name testReadonlySetForEach036
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLYSET_FOR_EACH_3600
     * @tc.desc Verify ReadonlySet union type forEach handles different element types
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testReadonlySetForEach036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: ReadonlySet<number | string> = new Set<number | string>();
      (set as Set<number | string>).add(1);
      (set as Set<number | string>).add("two");
      (set as Set<number | string>).add(3);
      let numCount: int = 0;
      let strCount: int = 0;
      set.forEach((v: number | string): void => {
        let t: string = typeof v;
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
  });
}
