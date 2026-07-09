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
import Utils from '../Util.test';

export default function ErrorCollectionTest(): void {
  describe('ErrorCollectionTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0010
     * @tc.name testErrorCollection001
     * @tc.desc Verify Error array literal with three elements has correct length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1: Error = new Error("e1");
      let err2: Error = new Error("e2");
      let err3: Error = new Error("e3");
      let arr: Error[] = [err1, err2, err3];
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0020
     * @tc.name testErrorCollection002
     * @tc.desc Verify push/pop on Error array adds/removes elements correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("test");
      let arr: Error[] = [];
      arr.push(err);
      expect(arr.length).assertEqual(1);
      let popped: Error = arr.pop() as Error;
      expect(popped).assertEqual(err);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0030
     * @tc.name testErrorCollection003
     * @tc.desc Verify forEach iterates over all Error elements in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1: Error = new Error("a");
      let err2: Error = new Error("b");
      let err3: Error = new Error("c");
      let arr: Error[] = [err1, err2, err3];
      let count: number = 0;
      arr.forEach((e: Error): void => {
        count = count + 1;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0040
     * @tc.name testErrorCollection004
     * @tc.desc Verify filtering Error array with instanceof check works
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1: Error = new Error("generic");
      let err2: TypeError = new TypeError("type");
      let err3: RangeError = new RangeError("range");
      let arr: Error[] = [err1, err2, err3];
      let filtered: Error[] = arr.filter((e: Error): boolean => {
        return e instanceof TypeError;
      });
      expect(filtered.length).assertEqual(1);
      expect(filtered[0] as Error).assertEqual(err2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0050
     * @tc.name testErrorCollection005
     * @tc.desc Verify indexOf finds Error by reference in array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1: Error = new Error("first");
      let err2: Error = new Error("second");
      let err3: Error = new Error("third");
      let arr: Error[] = [err1, err2, err3];
      expect(arr.indexOf(err2)).assertEqual(1);
      expect(arr.indexOf(err1)).assertEqual(0);
      expect(arr.indexOf(err3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0060
     * @tc.name testErrorCollection006
     * @tc.desc Verify map extracts code property from Error array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1: Error = new Error(100, "err100");
      let err2: Error = new Error(200, "err200");
      let arr: Error[] = [err1, err2];
      let codes: number[] = arr.map((e: Error): number => {
        return e.code;
      });
      expect(codes.length).assertEqual(2);
      expect(codes[0]).assertEqual(100);
      expect(codes[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0070
     * @tc.name testErrorCollection007
     * @tc.desc Verify Set.add and Set.has work with Error instances
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("set test");
      let s: Set<Error> = new Set<Error>();
      s.add(err);
      expect(s.has(err)).assertEqual(true);
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0080
     * @tc.name testErrorCollection008
     * @tc.desc Verify adding same Error instance twice keeps size as 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("duplicate");
      let s: Set<Error> = new Set<Error>();
      s.add(err);
      s.add(err);
      expect(s.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0090
     * @tc.name testErrorCollection009
     * @tc.desc Verify forEach iterates over all Error elements in Set
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1: Error = new Error("x");
      let err2: Error = new Error("y");
      let s: Set<Error> = new Set<Error>();
      s.add(err1);
      s.add(err2);
      let count: number = 0;
      s.forEach((e: Error): void => {
        count = count + 1;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0100
     * @tc.name testErrorCollection010
     * @tc.desc Verify Error instance can be used as Map key for get/set
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: Error = new Error("map key");
      let m: Map<Error, string> = new Map<Error, string>();
      m.set(key, "value1");
      expect(m.get(key)).assertEqual("value1");
      expect(m.has(key)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0110
     * @tc.name testErrorCollection011
     * @tc.desc Verify Map.size reflects number of Error key entries
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let k1: Error = new Error("k1");
      let k2: Error = new Error("k2");
      let m: Map<Error, string> = new Map<Error, string>();
      m.set(k1, "v1");
      m.set(k2, "v2");
      expect(m.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0120
     * @tc.name testErrorCollection012
     * @tc.desc Verify setting multiple values with same Error key overwrites
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: Error = new Error("same key");
      let m: Map<Error, string> = new Map<Error, string>();
      m.set(key, "first");
      m.set(key, "second");
      expect(m.size).assertEqual(1);
      expect(m.get(key)).assertEqual("second");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0130
     * @tc.name testErrorCollection013
     * @tc.desc Verify Array.shift removes first Error element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Error = new Error("first");
      let e2: Error = new Error("second");
      let arr: Error[] = [e1, e2];
      let shifted: Error = arr.shift() as Error;
      expect(shifted).assertEqual(e1);
      expect(arr.length).assertEqual(1);
      expect(arr[0] as Error).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0140
     * @tc.name testErrorCollection014
     * @tc.desc Verify Array.unshift adds Error element at beginning
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Error = new Error("orig");
      let e2: Error = new Error("new");
      let arr: Error[] = [e1];
      arr.unshift(e2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]! as Error).assertEqual(e2);
      expect(arr[1]! as Error).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0150
     * @tc.name testErrorCollection015
     * @tc.desc Verify Array.concat merges two Error arrays
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Error = new Error("a");
      let e2: Error = new Error("b");
      let arr1: Error[] = [e1];
      let arr2: Error[] = [e2];
      let merged: Error[] = arr1.concat(arr2);
      expect(merged.length).assertEqual(2);
      expect(merged[0] as Error).assertEqual(e1);
      expect(merged[1] as Error).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0160
     * @tc.name testErrorCollection016
     * @tc.desc Verify Array.slice extracts a portion of Error array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Error = new Error("a");
      let e2: Error = new Error("b");
      let e3: Error = new Error("c");
      let arr: Error[] = [e1, e2, e3];
      let sliced: Error[] = arr.slice(1, 3);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0] as Error).assertEqual(e2);
      expect(sliced[1] as Error).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0170
     * @tc.name testErrorCollection017
     * @tc.desc Verify Array.lastIndexOf finds last occurrence of Error reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Error = new Error("dup");
      let e2: Error = new Error("other");
      let arr: Error[] = [e1, e2, e1];
      expect(arr.lastIndexOf(e1)).assertEqual(2);
      expect(arr.lastIndexOf(e2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0180
     * @tc.name testErrorCollection018
     * @tc.desc Verify Array.includes finds Error by reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Error = new Error("in");
      let e2: Error = new Error("not in");
      let arr: Error[] = [e1];
      expect(arr.includes(e1)).assertEqual(true);
      expect(arr.includes(e2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0190
     * @tc.name testErrorCollection019
     * @tc.desc Verify Array.find returns first Error matching condition
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Error = new Error(100, "low");
      let e2: Error = new Error(500, "high");
      let arr: Error[] = [e1, e2];
      let found: Error | undefined = arr.find((e: Error): boolean => {
        return e.code > 200;
      });
      expect(found).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0200
     * @tc.name testErrorCollection020
     * @tc.desc Verify Array.findIndex returns index of first matching Error
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Error = new Error("a");
      let e2: Error = new Error("target");
      let e3: Error = new Error("c");
      let arr: Error[] = [e1, e2, e3];
      let idx: number = arr.findIndex((e: Error): boolean => {
        return e.message === "target";
      });
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0210
     * @tc.name testErrorCollection021
     * @tc.desc Verify Array.reduce aggregates Error code values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Error = new Error(10, "a");
      let e2: Error = new Error(20, "b");
      let e3: Error = new Error(30, "c");
      let arr: Error[] = [e1, e2, e3];
      let sum: number = arr.reduce((acc: number, e: Error): number => {
        return acc + e.code;
      }, 0);
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0220
     * @tc.name testErrorCollection022
     * @tc.desc Verify Array.some returns true if any Error matches condition
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Error = new Error(1, "low");
      let e2: Error = new Error(999, "high");
      let arr: Error[] = [e1, e2];
      let hasHigh: boolean = arr.some((e: Error): boolean => {
        return e.code > 500;
      });
      expect(hasHigh).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0230
     * @tc.name testErrorCollection023
     * @tc.desc Verify Array.every checks all Errors satisfy condition
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Error = new Error(1, "a");
      let e2: Error = new Error(2, "b");
      let arr: Error[] = [e1, e2];
      let allPositive: boolean = arr.every((e: Error): boolean => {
        return e.code >= 0;
      });
      expect(allPositive).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0240
     * @tc.name testErrorCollection024
     * @tc.desc Verify Array.push adds multiple Errors and length updates
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [];
      arr.push(new Error("a"));
      arr.push(new Error("b"));
      arr.push(new Error("c"));
      expect(arr.length).assertEqual(3);
      const a1 = arr![0] as Error;
      const a2 = arr![1] as Error;
      const a3 = arr![2] as Error;
      expect(a1.name).assertEqual('Error');
      expect(a2.name).assertEqual('Error');
      expect(a3.name).assertEqual('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0250
     * @tc.name testErrorCollection025
     * @tc.desc Verify Array.filter extracts Errors by code range
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Error = new Error(1, "a");
      let e2: Error = new Error(50, "b");
      let e3: Error = new Error(100, "c");
      let arr: Error[] = [e1, e2, e3];
      let filtered: Error[] = arr.filter((e: Error): boolean => {
        return e.code > 10;
      });
      expect(filtered.length).assertEqual(2);
      expect((filtered[0]! as Error).code).assertEqual(50);
      expect((filtered[1]! as Error).code).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0260
     * @tc.name testErrorCollection026
     * @tc.desc Verify Array.find returns undefined when no Error matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Error[] = [new Error("a"), new Error("b")];
      let found: Error | undefined = arr.find((e: Error): boolean => {
        return e.message === "not present";
      });
      expect(found).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0270
     * @tc.name testErrorCollection027
     * @tc.desc Verify Array.reverse reverses Error array order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Error = new Error("a");
      let e2: Error = new Error("b");
      let e3: Error = new Error("c");
      let arr: Error[] = [e1, e2, e3];
      arr.reverse();
      expect(arr[0] as Error).assertEqual(e3);
      expect(arr[1] as Error).assertEqual(e2);
      expect(arr[2] as Error).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0280
     * @tc.name testErrorCollection028
     * @tc.desc Verify Array.some returns false when no Error matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Error = new Error(1, "a");
      let e2: Error = new Error(2, "b");
      let arr: Error[] = [e1, e2];
      let result: boolean = arr.some((e: Error): boolean => {
        return e.code > 100;
      });
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0290
     * @tc.name testErrorCollection029
     * @tc.desc Verify Array.every returns false when one Error fails condition
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Error = new Error(-1, "neg");
      let e2: Error = new Error(5, "pos");
      let arr: Error[] = [e1, e2];
      let result: boolean = arr.every((e: Error): boolean => {
        return e.code > 0;
      });
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0300
     * @tc.name testErrorCollection030
     * @tc.desc Verify Set<Error> initial size is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<Error> = new Set<Error>();
      expect(s.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0310
     * @tc.name testErrorCollection031
     * @tc.desc Verify Set.delete removes Error instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("to delete");
      let s: Set<Error> = new Set<Error>();
      s.add(e);
      expect(s.has(e)).assertEqual(true);
      let deleted: boolean = s.delete(e);
      expect(deleted).assertEqual(true);
      expect(s.has(e)).assertEqual(false);
      expect(s.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0320
     * @tc.name testErrorCollection032
     * @tc.desc Verify Set.delete returns false for non-existent Error
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("not in set");
      let s: Set<Error> = new Set<Error>();
      let deleted: boolean = s.delete(e);
      expect(deleted).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0330
     * @tc.name testErrorCollection033
     * @tc.desc Verify Set.delete removes element from middle, others remain
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Error = new Error("a");
      let e2: Error = new Error("b");
      let e3: Error = new Error("c");
      let s: Set<Error> = new Set<Error>();
      s.add(e1);
      s.add(e2);
      s.add(e3);
      s.delete(e2);
      expect(s.has(e1)).assertEqual(true);
      expect(s.has(e2)).assertEqual(false);
      expect(s.has(e3)).assertEqual(true);
      expect(s.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0340
     * @tc.name testErrorCollection034
     * @tc.desc Verify Set.clear removes all Error elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Error = new Error("a");
      let e2: Error = new Error("b");
      let s: Set<Error> = new Set<Error>();
      s.add(e1);
      s.add(e2);
      expect(s.size).assertEqual(2);
      s.clear();
      expect(s.size).assertEqual(0);
      expect(s.has(e1)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0350
     * @tc.name testErrorCollection035
     * @tc.desc Verify Set.forEach visits all Error elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Error = new Error("x");
      let e2: Error = new Error("y");
      let collected: Error[] = [];
      let s: Set<Error> = new Set<Error>();
      s.add(e1);
      s.add(e2);
      s.forEach((e: Error): void => {
        collected.push(e);
      });
      expect(collected.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0360
     * @tc.name testErrorCollection036
     * @tc.desc Verify Set.add of multiple different Error instances
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<Error> = new Set<Error>();
      s.add(new Error("a"));
      s.add(new Error("b"));
      s.add(new Error("c"));
      expect(s.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0370
     * @tc.name testErrorCollection037
     * @tc.desc Verify Map.has checks for Error key existence
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: Error = new Error("exists");
      let other: Error = new Error("missing");
      let m: Map<Error, string> = new Map<Error, string>();
      m.set(key, "value");
      expect(m.has(key)).assertEqual(true);
      expect(m.has(other)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0380
     * @tc.name testErrorCollection038
     * @tc.desc Verify Map.delete removes Error key entry
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: Error = new Error("to remove");
      let m: Map<Error, string> = new Map<Error, string>();
      m.set(key, "val");
      expect(m.has(key)).assertEqual(true);
      let deleted: boolean = m.delete(key);
      expect(deleted).assertEqual(true);
      expect(m.has(key)).assertEqual(false);
      expect(m.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0390
     * @tc.name testErrorCollection039
     * @tc.desc Verify Map.forEach iterates over all Error key entries
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let k1: Error = new Error("key1");
      let k2: Error = new Error("key2");
      let keys: Error[] = [];
      let vals: string[] = [];
      let m: Map<Error, string> = new Map<Error, string>();
      m.set(k1, "v1");
      m.set(k2, "v2");
      m.forEach((v: string, k: Error): void => {
        keys.push(k);
        vals.push(v);
      });
      expect(keys.length).assertEqual(2);
      expect(vals.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0400
     * @tc.name testErrorCollection040
     * @tc.desc Verify Map.clear removes all Error key entries
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let k1: Error = new Error("a");
      let k2: Error = new Error("b");
      let m: Map<Error, string> = new Map<Error, string>();
      m.set(k1, "v1");
      m.set(k2, "v2");
      expect(m.size).assertEqual(2);
      m.clear();
      expect(m.size).assertEqual(0);
      expect(m.has(k1)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0410
     * @tc.name testErrorCollection041
     * @tc.desc Verify Map.get returns undefined for missing Error key
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let missing: Error = new Error("not inserted");
      let m: Map<Error, string> = new Map<Error, string>();
      let val: string | undefined = m.get(missing);
      expect(val).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0420
     * @tc.name testErrorCollection042
     * @tc.desc Verify Map distinguishes Error keys by reference not value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<Error, string> = new Map<Error, string>();
      let e1: Error = new Error("same msg");
      let e2: Error = new Error("same msg");
      m.set(e1, "first");
      m.set(e2, "second");
      expect(m.size).assertEqual(2);
      expect(m.get(e1)).assertEqual("first");
      expect(m.get(e2)).assertEqual("second");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0430
     * @tc.name testErrorCollection043
     * @tc.desc Verify Error array push and indexOf work by reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1: Error = new Error("e1");
      let err2: Error = new Error("e2");
      let arr: Error[] = [];
      arr.push(err1);
      arr.push(err2);
      expect(arr.length).assertEqual(2);
      expect(arr.indexOf(err1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0440
     * @tc.name testErrorCollection044
     * @tc.desc Verify Error array pop returns last element and shrinks
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1: Error = new Error("first");
      let err2: Error = new Error("second");
      let arr: Error[] = [err1, err2];
      let popped: Error = arr.pop() as Error;
      expect(popped).assertEqual(err2);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0450
     * @tc.name testErrorCollection045
     * @tc.desc Verify iterating Error array with forEach accesses all elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1: Error = new Error("a");
      let err2: Error = new Error("b");
      let arr: Error[] = [err1, err2];
      let count: number = 0;
      arr.forEach((e: Error): void => {
        count = count + 1;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0460
     * @tc.name testErrorCollection046
     * @tc.desc Verify Error array map creates new array with transformed values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("test");
      let arr: Error[] = [err];
      let codes: number[] = arr.map((e: Error): number => {
        return e.code;
      });
      expect(codes.length).assertEqual(1);
      expect(codes[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0470
     * @tc.name testErrorCollection047
     * @tc.desc Verify Error array shift removes first element correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1: Error = new Error("shift1");
      let err2: Error = new Error("shift2");
      let arr: Error[] = [err1, err2];
      let shifted: Error = arr.shift() as Error;
      expect(shifted).assertEqual(err1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0480
     * @tc.name testErrorCollection048
     * @tc.desc Verify filtering Error array by condition works correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err1: Error = new Error(100, "high");
      let err2: Error = new Error(0, "low");
      let arr: Error[] = [err1, err2];
      let filtered: Error[] = arr.filter((e: Error): boolean => {
        return e.code > 0;
      });
      expect(filtered.length).assertEqual(1);
      expect(filtered[0] as Error).assertEqual(err1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0490
     * @tc.name testErrorCollection049
     * @tc.desc Verify for-of iteration over Error array preserves message order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("first"), new Error("second")];
      let joined: string = "";
      for (let err of errors) {
        joined += err.message;
      }
      expect(joined).assertEqual("firstsecond");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0500
     * @tc.name testErrorCollection050
     * @tc.desc Verify Error array destructuring preserves element order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("left"), new Error("right")];
      let [first, second]: Error[] = errors;
      expect(first.message).assertEqual("left");
      expect(second.message).assertEqual("right");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0510
     * @tc.name testErrorCollection051
     * @tc.desc Verify Map string key can store and retrieve Error value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, Error> = new Map<string, Error>();
      map.set("err", new Error("map value"));
      expect(map.get("err")?.message).assertEqual("map value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0520
     * @tc.name testErrorCollection052
     * @tc.desc Verify optional chaining with Map get handles found and missing Error values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, Error> = new Map<string, Error>();
      map.set("found", new Error("found value"));
      expect(map.get("found")?.message).assertEqual("found value");
      expect(map.get("missing")?.message).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0530
     * @tc.name testErrorCollection053
     * @tc.desc Verify Error array forEach visits messages in order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("a"), new Error("b"), new Error("c")];
      let joined: string = "";
      errors.forEach((err: Error): void => {
        joined += err.message;
      });
      expect(joined).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0540
     * @tc.name testErrorCollection054
     * @tc.desc Verify Error array map extracts element names
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("e"), new RangeError("r")];
      let names: string[] = errors.map((err: Error): string => {
        return err.name;
      });
      expect(names[0]).assertEqual("Error");
      expect(names[1]).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0550
     * @tc.name testErrorCollection055
     * @tc.desc Verify Error array filter keeps RangeError elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let range: RangeError = new RangeError("range");
      let errors: Error[] = [new Error("e"), range, new TypeError("t")];
      let filtered: Error[] = errors.filter((err: Error): boolean => {
        return err.name === "RangeError";
      });
      expect(filtered.length).assertEqual(1);
      expect(filtered[0]).assertEqual(range);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0560
     * @tc.name testErrorCollection056
     * @tc.desc Verify Error array filter returns empty array when no element matches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("e"), new TypeError("t")];
      let filtered: Error[] = errors.filter((err: Error): boolean => {
        return err.name === "URIError";
      });
      expect(filtered.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0570
     * @tc.name testErrorCollection057
     * @tc.desc Verify Error array find returns matching TypeError element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: TypeError = new TypeError("target");
      let errors: Error[] = [new Error("e"), target];
      let found: Error | undefined = errors.find((err: Error): boolean => {
        return err.name === "TypeError";
      });
      expect(found).assertEqual(target);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0580
     * @tc.name testErrorCollection058
     * @tc.desc Verify Error array find returns undefined when absent
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("e")];
      let found: Error | undefined = errors.find((err: Error): boolean => {
        return err.name === "SyntaxError";
      });
      expect(found).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0590
     * @tc.name testErrorCollection059
     * @tc.desc Verify Error array findIndex returns SyntaxError position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("e"), new RangeError("r"), new SyntaxError("s")];
      let index: number = errors.findIndex((err: Error): boolean => {
        return err.name === "SyntaxError";
      });
      expect(index).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0600
     * @tc.name testErrorCollection060
     * @tc.desc Verify Error array findIndex returns -1 when absent
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("e")];
      let index: number = errors.findIndex((err: Error): boolean => {
        return err.name === "EvalError";
      });
      expect(index).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0610
     * @tc.name testErrorCollection061
     * @tc.desc Verify Error array some detects RangeError element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("e"), new RangeError("r")];
      let hasRange: boolean = errors.some((err: Error): boolean => {
        return err.name === "RangeError";
      });
      expect(hasRange).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0620
     * @tc.name testErrorCollection062
     * @tc.desc Verify Error array some returns false for missing EvalError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("e"), new TypeError("t")];
      let hasEval: boolean = errors.some((err: Error): boolean => {
        return err.name === "EvalError";
      });
      expect(hasEval).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0630
     * @tc.name testErrorCollection063
     * @tc.desc Verify Error array every confirms all messages are non-empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("a"), new RangeError("b")];
      let allNonEmpty: boolean = errors.every((err: Error): boolean => {
        return err.message.length > 0;
      });
      expect(allNonEmpty).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0640
     * @tc.name testErrorCollection064
     * @tc.desc Verify Error array every returns false when one message is empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("a"), new Error("")];
      let allNonEmpty: boolean = errors.every((err: Error): boolean => {
        return err.message.length > 0;
      });
      expect(allNonEmpty).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0650
     * @tc.name testErrorCollection065
     * @tc.desc Verify Error array reduce sums element codes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error(10, "a"), new Error(20, "b")];
      let sum: number = errors.reduce((acc: number, err: Error): number => {
        return acc + err.code;
      }, 0);
      expect(sum).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0660
     * @tc.name testErrorCollection066
     * @tc.desc Verify Error array reduce concatenates messages
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("left"), new Error("right")];
      let joined: string = errors.reduce((acc: string, err: Error): string => {
        return acc + err.message;
      }, "");
      expect(joined).assertEqual("leftright");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0670
     * @tc.name testErrorCollection067
     * @tc.desc Verify Error array includes finds same reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Error = new Error("target");
      let errors: Error[] = [new Error("a"), target];
      expect(errors.includes(target)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0680
     * @tc.name testErrorCollection068
     * @tc.desc Verify Error array includes rejects different reference with same message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("same")];
      expect(errors.includes(new Error("same"))).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0690
     * @tc.name testErrorCollection069
     * @tc.desc Verify Error array indexOf returns first duplicate reference position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shared: Error = new Error("shared");
      let errors: Error[] = [shared, new Error("middle"), shared];
      expect(errors.indexOf(shared)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0700
     * @tc.name testErrorCollection070
     * @tc.desc Verify Error array lastIndexOf returns last duplicate reference position
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shared: Error = new Error("shared");
      let errors: Error[] = [shared, new Error("middle"), shared];
      expect(errors.lastIndexOf(shared)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0710
     * @tc.name testErrorCollection071
     * @tc.desc Verify Error array slice preserves subset references
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = new Error("first");
      let second: Error = new Error("second");
      let third: Error = new Error("third");
      let errors: Error[] = [first, second, third];
      let sliced: Error[] = errors.slice(1, 3);
      expect(sliced.length).assertEqual(2);
      expect(sliced[0]).assertEqual(second);
      expect(sliced[1]).assertEqual(third);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0720
     * @tc.name testErrorCollection072
     * @tc.desc Verify Error array slice beyond length returns empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("only")];
      let sliced: Error[] = errors.slice(5, 6);
      expect(sliced.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0730
     * @tc.name testErrorCollection073
     * @tc.desc Verify Error array concat appends new Error element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let extra: Error = new Error("extra");
      let errors: Error[] = [new Error("base")];
      let combined: Error[] = errors.concat([extra]);
      expect(combined.length).assertEqual(2);
      expect(combined[1]).assertEqual(extra);
      expect(errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0740
     * @tc.name testErrorCollection074
     * @tc.desc Verify Error array reverse updates order in place
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("first"), new Error("second")];
      let reversed: Error[] = errors.reverse();
      expect(reversed[0].message).assertEqual("second");
      expect(errors[0].message).assertEqual("second");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0750
     * @tc.name testErrorCollection075
     * @tc.desc Verify Error array push appends element and updates length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("base")];
      let pushed: Error = new Error("pushed");
      let length: number = errors.push(pushed);
      expect(length).assertEqual(2);
      expect(errors[1]).assertEqual(pushed);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0760
     * @tc.name testErrorCollection076
     * @tc.desc Verify Error array pop returns last element and shrinks array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let last: Error = new Error("last");
      let errors: Error[] = [new Error("first"), last];
      let popped: Error | undefined = errors.pop();
      expect(popped).assertEqual(last);
      expect(errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0770
     * @tc.name testErrorCollection077
     * @tc.desc Verify Error array shift returns first element and shifts array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = new Error("first");
      let errors: Error[] = [first, new Error("second")];
      let shifted: Error | undefined = errors.shift();
      expect(shifted).assertEqual(first);
      expect(errors[0].message).assertEqual("second");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0780
     * @tc.name testErrorCollection078
     * @tc.desc Verify Error array unshift inserts element at beginning
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = new Error("first");
      let errors: Error[] = [new Error("second")];
      let length: number = errors.unshift(first);
      expect(length).assertEqual(2);
      expect(errors[0]).assertEqual(first);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0790
     * @tc.name testErrorCollection079
     * @tc.desc Verify Error array splice removes middle element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let middle: Error = new Error("middle");
      let errors: Error[] = [new Error("first"), middle, new Error("last")];
      let removed: Error[] = errors.splice(1, 1);
      expect(removed.length).assertEqual(1);
      expect(removed[0]).assertEqual(middle);
      expect(errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0800
     * @tc.name testErrorCollection080
     * @tc.desc Verify Error array splice inserts element in middle
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inserted: Error = new Error("inserted");
      let errors: Error[] = [new Error("first"), new Error("last")];
      let removed: Error[] = errors.splice(1, 0, inserted);
      expect(removed.length).assertEqual(0);
      expect(errors[1]).assertEqual(inserted);
      expect(errors.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0810
     * @tc.name testErrorCollection081
     * @tc.desc Verify Error array length assignment truncates array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("a"), new Error("b"), new Error("c")];
      errors.length = 1;
      expect(errors.length).assertEqual(1);
      expect(errors[0].message).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0820
     * @tc.name testErrorCollection082
     * @tc.desc Verify Error array length assignment clears array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("a"), new Error("b")];
      errors.length = 0;
      expect(errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0830
     * @tc.name testErrorCollection083
     * @tc.desc Verify Error array index assignment replaces element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let replacement: TypeError = new TypeError("replacement");
      let errors: Error[] = [new Error("a"), new Error("b")];
      errors[0] = replacement;
      expect(errors[0]).assertEqual(replacement);
      expect(errors[0].name).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0840
     * @tc.name testErrorCollection084
     * @tc.desc Verify Error array can contain repeated same reference after push
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shared: Error = new Error("shared");
      let errors: Error[] = [shared];
      errors.push(shared);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual(errors[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0850
     * @tc.name testErrorCollection085
     * @tc.desc Verify for-of iteration over Error array counts all elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("a"), new Error("b"), new Error("c")];
      let count: number = 0;
      for (let err of errors) {
        count += err.message.length;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0860
     * @tc.name testErrorCollection086
     * @tc.desc Verify index loop over Error array reaches first and last messages
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("first"), new Error("middle"), new Error("last")];
      let first: string = "";
      let last: string = "";
      for (let i: int = 0; i < errors.length; i++) {
        if (i === 0) {
          first = errors[i].message;
        }
        if (i === errors.length - 1) {
          last = errors[i].message;
        }
      }
      expect(first).assertEqual("first");
      expect(last).assertEqual("last");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0870
     * @tc.name testErrorCollection087
     * @tc.desc Verify Set built from Error array keeps unique references
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = new Error("first");
      let second: Error = new Error("second");
      let errors: Error[] = [first, second];
      let set: Set<Error> = new Set<Error>();
      errors.forEach((err: Error): void => {
        set.add(err);
      });
      expect(set.size).assertEqual(2);
      expect(set.has(first)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0880
     * @tc.name testErrorCollection088
     * @tc.desc Verify Set built from repeated Error array collapses duplicate reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shared: Error = new Error("shared");
      let errors: Error[] = [shared, shared];
      let set: Set<Error> = new Set<Error>();
      errors.forEach((err: Error): void => {
        set.add(err);
      });
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0890
     * @tc.name testErrorCollection089
     * @tc.desc Verify Map built from Error array stores index to message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("zero"), new Error("one")];
      let map: Map<number, string> = new Map<number, string>();
      errors.forEach((err: Error, index: int): void => {
        map.set(index, err.message);
      });
      expect(map.get(0)).assertEqual("zero");
      expect(map.get(1)).assertEqual("one");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0900
     * @tc.name testErrorCollection090
     * @tc.desc Verify Map built from Error array stores Error reference as key
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = new Error("first");
      let second: Error = new Error("second");
      let errors: Error[] = [first, second];
      let map: Map<Error, number> = new Map<Error, number>();
      errors.forEach((err: Error, index: int): void => {
        map.set(err, index);
      });
      expect(map.get(first)).assertEqual(0);
      expect(map.get(second)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0910
     * @tc.name testErrorCollection091
     * @tc.desc Verify nested Error arrays preserve inner Error reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leaf: Error = new Error("leaf");
      let inner: Error[] = [leaf];
      let groups: Error[][] = [inner, [new Error("plain")]];
      expect(groups[0][0]).assertEqual(leaf);
      expect(groups[1][0].message).assertEqual("plain");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0920
     * @tc.name testErrorCollection092
     * @tc.desc Verify source array push after Error array copy does not change copied length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Error[] = [new Error("first")];
      let errors: Error[] = source.slice(0);
      source.push(new Error("second"));
      expect(source.length).assertEqual(2);
      expect(errors.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0930
     * @tc.name testErrorCollection093
     * @tc.desc Verify source element mutation is visible through Error array reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let element: Error = new Error("before");
      let errors: Error[] = [element];
      element.message = "after";
      expect(errors[0]).assertEqual(element);
      expect(errors[0].message).assertEqual("after");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0940
     * @tc.name testErrorCollection094
     * @tc.desc Verify pushing into Error array does not change original source array length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Error[] = [new Error("source")];
      let errors: Error[] = source.slice(0);
      errors.push(new Error("new"));
      expect(source.length).assertEqual(1);
      expect(errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0950
     * @tc.name testErrorCollection095
     * @tc.desc Verify replacing Error array element does not replace source element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Error[] = [new Error("source")];
      let errors: Error[] = source.slice(0);
      errors[0] = new TypeError("replacement");
      expect(source[0].name).assertEqual("Error");
      expect(errors[0].name).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0960
     * @tc.name testErrorCollection096
     * @tc.desc Verify collecting Map Error values preserves value order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: Error = new Error("first");
      let second: Error = new Error("second");
      let map: Map<string, Error> = new Map<string, Error>();
      map.set("a", first);
      map.set("b", second);
      let errors: Error[] = [];
      map.forEach((value: Error): void => {
        errors.push(value);
      });
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual(first);
      expect(errors[1]).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0970
     * @tc.name testErrorCollection097
     * @tc.desc Verify collecting Set Error values preserves insertion order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set: Set<Error> = new Set<Error>();
      set.add(new TypeError("type"));
      set.add(new RangeError("range"));
      let errors: Error[] = [];
      set.forEach((value: Error): void => {
        errors.push(value);
      });
      expect(errors.length).assertEqual(2);
      expect(errors[0].name).assertEqual("TypeError");
      expect(errors[1].name).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0980
     * @tc.name testErrorCollection098
     * @tc.desc Verify collecting empty Map Error values returns empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, Error> = new Map<string, Error>();
      let errors: Error[] = [];
      map.forEach((value: Error): void => {
        errors.push(value);
      });
      expect(errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_0990
     * @tc.name testErrorCollection099
     * @tc.desc Verify Error array preserves large 50 element batch order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Error[] = [];
      for (let i: int = 0; i < 50; i++) {
        source.push(new Error("item" + i));
      }
      let errors: Error[] = source.slice(0);
      expect(errors.length).assertEqual(50);
      expect(errors[0].message).assertEqual("item0");
      expect(errors[49].message).assertEqual("item49");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_1000
     * @tc.name testErrorCollection100
     * @tc.desc Verify Error array preserves mixed subclass element names
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [
        new Error("base"),
        new RangeError("range"),
        new TypeError("type"),
        new SyntaxError("syntax")
      ];
      expect(errors.length).assertEqual(4);
      expect(errors[1].name).assertEqual("RangeError");
      expect(errors[3].name).assertEqual("SyntaxError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_1010
     * @tc.name testErrorCollection101
     * @tc.desc Verify clearing source array after Error array copy does not clear copy
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Error[] = [new Error("first"), new Error("second")];
      let errors: Error[] = source.slice(0);
      source.length = 0;
      expect(source.length).assertEqual(0);
      expect(errors.length).assertEqual(2);
      expect(errors[1].message).assertEqual("second");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_1020
     * @tc.name testErrorCollection102
     * @tc.desc Verify mutating Error array slice copy does not change original length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("a"), new Error("b")];
      let copied: Error[] = errors.slice(0);
      copied.push(new Error("c"));
      expect(copied.length).assertEqual(3);
      expect(errors.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_1030
     * @tc.name testErrorCollection103
     * @tc.desc Verify concat of two Error arrays preserves references
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Error = new Error("left");
      let right: Error = new Error("right");
      let leftErrors: Error[] = [left];
      let rightErrors: Error[] = [right];
      let combined: Error[] = leftErrors.concat(rightErrors);
      expect(combined.length).assertEqual(2);
      expect(combined[0]).assertEqual(left);
      expect(combined[1]).assertEqual(right);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_1040
     * @tc.name testErrorCollection104
     * @tc.desc Verify sequential pushes into Error array preserve append order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [];
      errors.push(new Error("first"));
      errors.push(new Error("second"));
      expect(errors.length).assertEqual(2);
      expect(errors[0].message).assertEqual("first");
      expect(errors[1].message).assertEqual("second");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_1050
     * @tc.name testErrorCollection105
     * @tc.desc Verify sequential unshifts into Error array preserve front order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("tail")];
      errors.unshift(new Error("middle"));
      errors.unshift(new Error("head"));
      expect(errors.length).assertEqual(3);
      expect(errors[0].message).assertEqual("head");
      expect(errors[2].message).assertEqual("tail");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_1060
     * @tc.name testErrorCollection106
     * @tc.desc Verify Error array splice replaces middle element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let replacement: Error = new Error("replacement");
      let errors: Error[] = [new Error("first"), new Error("old"), new Error("last")];
      let removed: Error[] = errors.splice(1, 1, replacement);
      expect(removed[0].message).assertEqual("old");
      expect(errors[1]).assertEqual(replacement);
      expect(errors.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_1070
     * @tc.name testErrorCollection107
     * @tc.desc Verify Error array pop returns undefined after array is empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("only")];
      errors.pop();
      let popped: Error | undefined = errors.pop();
      expect(popped).assertUndefined();
      expect(errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_1080
     * @tc.name testErrorCollection108
     * @tc.desc Verify Error array shift returns undefined after array is empty
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("only")];
      errors.shift();
      let shifted: Error | undefined = errors.shift();
      expect(shifted).assertUndefined();
      expect(errors.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_1090
     * @tc.name testErrorCollection109
     * @tc.desc Verify Error array filter by code threshold
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let high: Error = new Error(200, "high");
      let errors: Error[] = [new Error(10, "low"), high];
      let filtered: Error[] = errors.filter((err: Error): boolean => {
        return err.code >= 100;
      });
      expect(filtered.length).assertEqual(1);
      expect(filtered[0]).assertEqual(high);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_1100
     * @tc.name testErrorCollection110
     * @tc.desc Verify Error array map extracts numeric codes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error(1, "one"), new Error(2, "two")];
      let codes: number[] = errors.map((err: Error): number => {
        return err.code;
      });
      expect(codes[0]).assertEqual(1);
      expect(codes[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_1110
     * @tc.name testErrorCollection111
     * @tc.desc Verify Error array forEach index argument follows element order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("zero"), new Error("one")];
      let joined: string = "";
      errors.forEach((err: Error, index: int): void => {
        joined += index + ":" + err.message + ";";
      });
      expect(joined).assertEqual("0:zero;1:one;");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_1120
     * @tc.name testErrorCollection112
     * @tc.desc Verify Error array last index boundary reads final element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [new Error("first"), new Error("last")];
      let lastIndex: int = errors.length - 1;
      expect(lastIndex).assertEqual(1);
      expect(errors[lastIndex].message).assertEqual("last");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_COLLECTION_1130
     * @tc.name testErrorCollection113
     * @tc.desc Verify empty Error array every returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorCollection113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errors: Error[] = [];
      let result: boolean = errors.every((err: Error): boolean => {
        return err.message.length > 0;
      });
      expect(result).assertEqual(true);
      expect(errors.length).assertEqual(0);
    });
  });
}
