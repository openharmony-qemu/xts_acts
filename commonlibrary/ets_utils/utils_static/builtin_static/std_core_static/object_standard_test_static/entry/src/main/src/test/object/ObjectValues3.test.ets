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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from "../../../../hypium/index";
import Utils from "../Util.test";


class Box003 {
  value: int = 7;
}

class VInner {
  x: number = 1;
}
class V3A {
  a: number = 1;
}
class V3B extends V3A {
  b: number = 2;
}
class V3C extends V3B {
  c: number = 3;
}
class VStaticMethod {
  static s: number = 9;
  inst: number = 1;
  m(): void {}
}
class VBase {
  base: number = 1;
}
class VDerived extends VBase {
  d: number = 2;
}

export default function ObjectValues3Test(): void {
  describe("ObjectValues3Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_0100
     * @tc.name objectValuesPart03Case001
     * @tc.desc Verify Object.values of a Record keyed 02 and 01 returns second then first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "02": "second", "01": "first" };
      const vals: Any[] = Object.values(record);
      let rResult1: Any = vals[0];
      let eExpected1: string = "second";
      expect(rResult1 as string).assertEqual(eExpected1);
      let rResult2: Any = vals[1];
      let eExpected2: string = "first";
      expect(rResult2 as string).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_0200
     * @tc.name objectValuesPart03Case002
     * @tc.desc Verify a Record of string int boolean and null yields those four values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 's': "str", 'i': 5, 'b': true, 'n': null };
      const vals: Any[] = Object.values(record);
      let rResult1: Any = vals[0];
      let eExpected1: string = "str";
      expect(rResult1 as string).assertEqual(eExpected1);
      let rResult2: Any = vals[1];
      let eExpected2: int = 5;
      expect(rResult2 as int).assertEqual(eExpected2);
      let rResult3: boolean = vals[2] as boolean;
      expect(rResult3).assertTrue();
      let actualValue1: Any = vals[3];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_0300
     * @tc.name objectValuesPart03Case003
     * @tc.desc Verify a Record holding one null value keeps null at index 0 and a stable hash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': null };
      const obj: Object = record;
      const hash: int = obj.$_hashCode();
      const vals: Any[] = Object.values(record);
      let actualValue1: Any = vals[0];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
      const hashRepeat: int = obj.$_hashCode();
      expect(hash).assertEqual(hashRepeat);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_0400
     * @tc.name objectValuesPart03Case004
     * @tc.desc Verify a Record with a CJK key and an emoji key returns c then e in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "中文": 'c', '😀': 'e' };
      const obj: Object = record;
      const hash: int = obj.$_hashCode();
      const vals: Any[] = Object.values(record);
      let rResult1: Any = vals[0];
      let eExpected1: string = 'c';
      expect(rResult1 as string).assertEqual(eExpected1);
      let rResult2: Any = vals[1];
      let eExpected2: string = 'e';
      expect(rResult2 as string).assertEqual(eExpected2);
      const hashRepeat: int = obj.$_hashCode();
      expect(hash).assertEqual(hashRepeat);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_0500
     * @tc.name objectValuesPart03Case005
     * @tc.desc Verify Object.values of an empty Record is empty and its hash stays stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const obj: Object = record;
      const hash: int = obj.$_hashCode();
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      const hashRepeat: int = obj.$_hashCode();
      expect(hash).assertEqual(hashRepeat);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_0600
     * @tc.name objectValuesPart03Case006
     * @tc.desc Verify Object.values of a new Object is empty and its hash is stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const hash: int = obj.$_hashCode();
      const vals: Any[] = Object.values(obj);
      let rResult1: int = vals.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      const hashRepeat: int = obj.$_hashCode();
      expect(hash).assertEqual(hashRepeat);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_0700
     * @tc.name objectValuesPart03Case007
     * @tc.desc Verify the values array of a two-key Record has length 2 and a stable hash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const vals: Any[] = Object.values(record);
      const hash: int = vals.$_hashCode();
      const hashRepeat: int = vals.$_hashCode();
      expect(hash).assertEqual(hashRepeat);
      let rResult2: int = vals.length;
      let eExpected2: int = 2;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_0800
     * @tc.name objectValuesPart03Case008
     * @tc.desc Verify Object.values of a Box003 instance gives one value 7 and a stable hash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: Box003 = new Box003();
      const hash: int = b.$_hashCode();
      const vals: Any[] = Object.values(b);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      let eExpected2: int = 7;
      expect(rResult2 as int).assertEqual(eExpected2);
      const hashRepeat: int = b.$_hashCode();
      expect(hash).assertEqual(hashRepeat);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_0900
     * @tc.name objectValuesPart03Case009
     * @tc.desc Verify a Record value holding a script tag string is returned unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'p': "<script>alert(1)</script>" };
      const obj: Object = record;
      const hash: int = obj.$_hashCode();
      const vals: Any[] = Object.values(record);
      let rResult1: Any = vals[0];
      let eExpected1: string = "<script>alert(1)</script>";
      expect(rResult1 as string).assertEqual(eExpected1);
      const hashRepeat: int = obj.$_hashCode();
      expect(hash).assertEqual(hashRepeat);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_1000
     * @tc.name objectValuesPart03Case010
     * @tc.desc Verify two calls on a Record with leading null both keep null at index 0 and 2 at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': null, 'b': 2 };
      const valsA: Any[] = Object.values(record);
      const valsB: Any[] = Object.values(record);
      let actualValue1: Any = valsA[0];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
      let actualValue2: Any = valsB[0];
      let actualValue2IsNull: boolean = actualValue2 === null;
      expect(actualValue2IsNull).assertTrue();
      let rResult1: Any = valsA[1];
      let eExpected1: int = 2;
      expect(rResult1 as int).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_1100
     * @tc.name objectValuesPart03Case011
     * @tc.desc Verify summing values 10 20 30 of a three-key Record by for-of gives 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 10, 'b': 20, 'c': 30 };
      const vals: Any[] = Object.values(record);
      let sum: int = 0;
      for (const v of vals) {
        sum += v as int;
      }
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_1200
     * @tc.name objectValuesPart03Case012
     * @tc.desc Verify Object.values reflects updated values after push and pop on array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      arr.push(30);
      const vals1: Any[] = Object.values(arr);
      expect(vals1.length).assertEqual(3);
      expect(vals1[2] as int).assertEqual(30);
      arr.pop();
      const vals2: Any[] = Object.values(arr);
      expect(vals2.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_1300
     * @tc.name objectValuesPart03Case013
     * @tc.desc Verify Object.values on empty object literal returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vals: Any[] = Object.values({});
      expect(vals.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_1400
     * @tc.name objectValuesPart03Case014
     * @tc.desc Verify Object.values on array with undefined element returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | undefined> = [1, undefined, 3];
      const vals: Any[] = Object.values(arr);
      expect(vals.length).assertEqual(3);
      let isUndef: boolean = (vals[1] as number | undefined) === undefined;
      expect(isUndef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_1500
     * @tc.name objectValuesPart03Case015
     * @tc.desc Verify Object.values returns NaN property value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "nan": Number.NaN, 'b': 1 };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: number = vals[0] as number;
      let isNanResult: boolean = isNaN(rResult2);
      expect(isNanResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_1600
     * @tc.name objectValuesPart03Case016
     * @tc.desc Verify Object.values returns Infinity property value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "inf": Number.POSITIVE_INFINITY, 'b': 1 };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: number = vals[0] as number;
      let eExpected2: number = Number.POSITIVE_INFINITY;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_1700
     * @tc.name objectValuesPart03Case017
     * @tc.desc Verify Object.values returns negative Infinity property value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "ninf": -Number.POSITIVE_INFINITY, 'b': 1 };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: number = vals[0] as number;
      let eExpected2: number = -Number.POSITIVE_INFINITY;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_1800
     * @tc.name objectValuesPart03Case018
     * @tc.desc Verify Object.values returns Map property value and preserves data access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('k', 1);
      const record: Record<string, Any> = { "map": m };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      const got: Map<string, int> = vals[0] as Map<string, int>;
      expect(got).assertEqual(m);
      let rResult2: int = got.get('k')!;
      let eExpected2: int = 1;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_1900
     * @tc.name objectValuesPart03Case019
     * @tc.desc Verify Object.values returns Set property value and preserves data access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: Set<number> = new Set<number>([1, 2, 3, 2, 1]);
      const record: Record<string, Any> = { "set": s };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      const got: Set<number> = vals[0] as Set<number>;
      expect(got).assertEqual(s);
      let rResult2: int = got.size;
      let eExpected2: int = 3;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: boolean = got.has(2);
      expect(rResult3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_2000
     * @tc.name objectValuesPart03Case020
     * @tc.desc Verify Object.values returns Promise property value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const p: Promise<int> = new Promise<int>((resolve, reject) => {
        resolve(1);
      });
      const record: Record<string, Any> = { "promise": p };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      const got: Promise<int> = vals[0] as Promise<int>;
      expect(got).assertEqual(p);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_2100
     * @tc.name objectValuesPart03Case021
     * @tc.desc Verify Object.values returns RegExp property value and preserves test behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const re: RegExp = new RegExp("abc", 'g');
      const record: Record<string, Any> = { "regex": re };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      const got: RegExp = vals[0] as RegExp;
      expect(got).assertEqual(re);
      let rResult2: boolean = got.test("abc");
      expect(rResult2).assertTrue();
      let rResult3: boolean = got.test("xyz");
      expect(rResult3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_2200
     * @tc.name objectValuesPart03Case022
     * @tc.desc Verify Object.values returns Uint8Array property value and preserves element access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ta: Uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      const record: Record<string, Any> = { "bytes": ta };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      const got: Uint8Array = vals[0] as Uint8Array;
      expect(got).assertEqual(ta);
      let rResult2: int = got.length;
      let eExpected2: int = 5;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: number = got[0];
      let eExpected3: int = 72;
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_2300
     * @tc.name objectValuesPart03Case023
     * @tc.desc Verify Object.values returns ArrayBuffer property value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new Uint8Array([72, 101]).buffer;
      const record: Record<string, Any> = { "buffer": buf };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      const got: ArrayBuffer = vals[0] as ArrayBuffer;
      expect(got).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_2400
     * @tc.name objectValuesPart03Case024
     * @tc.desc Verify Object.values returns DataView property value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const view: DataView = new DataView(new Uint8Array([72, 101, 108]).buffer);
      const record: Record<string, Any> = { "view": view };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      const got: DataView = vals[0] as DataView;
      expect(got).assertEqual(view);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_2500
     * @tc.name objectValuesPart03Case025
     * @tc.desc Verify Object.values returns mixed container and primitive values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('k', 1);
      const s: Set<number> = new Set<number>([1, 2]);
      const record: Record<string, Any> = { "map": m, "set": s, "num": 7 };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      expect(vals[0] as Object).assertEqual(m as Object);
      expect(vals[1] as Object).assertEqual(s as Object);
      let rResult2: int = vals[2] as int;
      let eExpected2: int = 7;
      expect(rResult2).assertEqual(eExpected2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_2600
     * @tc.name objectValuesPart03Case026
     * @tc.desc Verify a 5-level nested Record value is returned as one entry by identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const level4: Record<string, int> = { 'e': 1 };
      const level3: Record<string, Any> = { 'd': level4 };
      const level2: Record<string, Any> = { 'c': level3 };
      const level1: Record<string, Any> = { 'b': level2 };
      const deep: Record<string, Any> = { 'a': level1 };
      const vals: Any[] = Object.values(deep);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      expect(rResult2 as Object).assertEqual(level1 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_2700
     * @tc.name objectValuesPart03Case027
     * @tc.desc Verify a Record with one emoji key returns its value 1 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '😀': 1 };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      let eExpected2: Any = 1;
      expect(rResult2 as Object).assertEqual(eExpected2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_2800
     * @tc.name objectValuesPart03Case028
     * @tc.desc Verify a Record keyed by e plus a combining accent returns the value 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: string = 'e' + String.fromCharCode(0x301);
      const record: Record<string, Any> = {};
      record[key] = 7;
      const vals: Any[] = Object.values(record);
      let rResult1: Any = vals[0];
      let eExpected1: Any = 7;
      expect(rResult1 as Object).assertEqual(eExpected1 as Object);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_2900
     * @tc.name objectValuesPart03Case029
     * @tc.desc Verify values preserves insertion order for non-integer keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const vals: Any[] = Object.values(record);
      let rResult1: Any = vals[0];
      let eExpected1: Any = 1;
      expect(rResult1 as Object).assertEqual(eExpected1 as Object);
      let rResult2: Any = vals[2];
      let eExpected2: Any = 3;
      expect(rResult2 as Object).assertEqual(eExpected2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_3000
     * @tc.name objectValuesPart03Case030
     * @tc.desc Verify values preserves insertion order for integer-like keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '3': 30, '1': 10, '2': 20 };
      const vals: Any[] = Object.values(record);
      let rResult1: Any = vals[0];
      let eExpected1: Any = 30;
      expect(rResult1 as Object).assertEqual(eExpected1 as Object);
      let rResult2: Any = vals[2];
      let eExpected2: Any = 20;
      expect(rResult2 as Object).assertEqual(eExpected2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_3100
     * @tc.name objectValuesPart03Case031
     * @tc.desc Verify values with duplicate key overwrite returns last value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record['k'] = 1;
      record['k'] = 2;
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      let eExpected2: Any = 2;
      expect(rResult2 as Object).assertEqual(eExpected2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_3200
     * @tc.name objectValuesPart03Case032
     * @tc.desc Verify values includes own key value shadowing toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record["toString"] = "own";
      record['x'] = 1;
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      let eExpected2: Any = "own";
      expect(rResult2 as Object).assertEqual(eExpected2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_3300
     * @tc.name objectValuesPart03Case033
     * @tc.desc Verify values returns undefined value element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': undefined };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      let rResult2IsUndefined: boolean = rResult2 === undefined;
      expect(rResult2IsUndefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_3400
     * @tc.name objectValuesPart03Case034
     * @tc.desc Verify values returns null value element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': null };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      let rResult2IsNull: boolean = rResult2 === null;
      expect(rResult2IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_3500
     * @tc.name objectValuesPart03Case035
     * @tc.desc Verify values with NaN value preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': Number.NaN };
      const vals: Any[] = Object.values(record);
      let rResult1: boolean = isNaN(vals[0] as number);
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_3600
     * @tc.name objectValuesPart03Case036
     * @tc.desc Verify values with positive Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': Number.POSITIVE_INFINITY };
      const vals: Any[] = Object.values(record);
      let rResult1: number = vals[0] as number;
      expect(rResult1).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_3700
     * @tc.name objectValuesPart03Case037
     * @tc.desc Verify Object.values of a Record holding a negative zero literal returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': -0 };
      const vals: Any[] = Object.values(record);
      let rResult1: Any = vals[0];
      let eExpected1: Any = 0;
      expect(rResult1 as Object).assertEqual(eExpected1 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_3800
     * @tc.name objectValuesPart03Case038
     * @tc.desc Verify a Record value of Number.MAX_VALUE is returned unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': Number.MAX_VALUE };
      const vals: Any[] = Object.values(record);
      let rResult1: Any = vals[0];
      let eExpected1: Any = Number.MAX_VALUE;
      expect(rResult1 as Object).assertEqual(eExpected1 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_3900
     * @tc.name objectValuesPart03Case039
     * @tc.desc Verify values with Date value preserved by reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date();
      const record: Record<string, Any> = { 'a': d };
      const vals: Any[] = Object.values(record);
      expect(vals[0] as Object).assertEqual(d as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_4000
     * @tc.name objectValuesPart03Case040
     * @tc.desc Verify a Record value holding a RegExp is returned as the same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const re: RegExp = new RegExp('a');
      const record: Record<string, Any> = { 'a': re };
      const vals: Any[] = Object.values(record);
      expect(vals[0] as Object).assertEqual(re as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_4100
     * @tc.name objectValuesPart03Case041
     * @tc.desc Verify values with nested array value does not flatten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "arr": [1, 2, 3] };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_4200
     * @tc.name objectValuesPart03Case042
     * @tc.desc Verify values with class instance value returns instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inst: VInner = new VInner();
      const record: Record<string, Any> = { "obj": inst };
      const vals: Any[] = Object.values(record);
      expect(vals[0] as Object).assertEqual(inst as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_4300
     * @tc.name objectValuesPart03Case043
     * @tc.desc Verify values returns fresh array each call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const firstValues: Any[] = Object.values(record);
      const secondValues: Any[] = Object.values(record);
      expect(firstValues).not().assertEqual(secondValues);
      let rResult1: int = firstValues.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_4400
     * @tc.name objectValuesPart03Case044
     * @tc.desc Verify mutating returned values array does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const vals: Any[] = Object.values(record);
      vals[0] = 99;
      const again: Any[] = Object.values(record);
      let rResult1: Any = again[0];
      let eExpected1: Any = 1;
      expect(rResult1 as Object).assertEqual(eExpected1 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_4500
     * @tc.name objectValuesPart03Case045
     * @tc.desc Verify mutating source after values does not change earlier result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const vals: Any[] = Object.values(record);
      record['b'] = 2;
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_4600
     * @tc.name objectValuesPart03Case046
     * @tc.desc Verify the values of a three-key Record line up with its key order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals[0] as int;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = vals[1] as int;
      let eExpected2: int = 2;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: int = vals[2] as int;
      let eExpected3: int = 3;
      expect(rResult3).assertEqual(eExpected3);
      const keys: string[] = Object.keys(record);
      let rResult4: string = keys[2];
      let eExpected4: string = 'c';
      expect(rResult4).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_4700
     * @tc.name objectValuesPart03Case047
     * @tc.desc Verify values includes instance fields from 3-level inheritance chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: V3C = new V3C();
      const vals: Any[] = Object.values(obj);
      let rResult1: int = vals.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      let eExpected2: Any = 1;
      expect(rResult2 as Object).assertEqual(eExpected2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_4800
     * @tc.name objectValuesPart03Case048
     * @tc.desc Verify values excludes static and method members of class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: VStaticMethod = new VStaticMethod();
      const vals: Any[] = Object.values(obj);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      let eExpected2: Any = 1;
      expect(rResult2 as Object).assertEqual(eExpected2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_4900
     * @tc.name objectValuesPart03Case049
     * @tc.desc Verify a Record value of a 100-character string is returned unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = '';
      for (let i: int = 0; i < 100; i++) {
        longStr = longStr + 'x';
      }
      const record: Record<string, Any> = { 'a': longStr };
      const vals: Any[] = Object.values(record);
      let rResult1: Any = vals[0];
      let eExpected1: Any = longStr;
      expect(rResult1 as Object).assertEqual(eExpected1 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_5000
     * @tc.name objectValuesPart03Case050
     * @tc.desc Verify a Record value of the empty string is returned unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': '' };
      const vals: Any[] = Object.values(record);
      let rResult1: Any = vals[0];
      let eExpected1: Any = '';
      expect(rResult1 as Object).assertEqual(eExpected1 as Object);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_5100
     * @tc.name objectValuesPart03Case051
     * @tc.desc Verify a Record of true then false yields true at index 0 and false at 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 't': true, 'f': false };
      const vals: Any[] = Object.values(record);
      let rResult1: boolean = vals[0] as boolean;
      expect(rResult1).assertTrue();
      let rResult2: boolean = vals[1] as boolean;
      expect(rResult2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_5200
     * @tc.name objectValuesPart03Case052
     * @tc.desc Verify a three-entry Record keeps null in the middle and has length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': null, 'c': 3 };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[1];
      let rResult2IsNull: boolean = rResult2 === null;
      expect(rResult2IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_5300
     * @tc.name objectValuesPart03Case053
     * @tc.desc Verify values of 10-level nested object value length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const level9: Record<string, int> = { 'j': 1 };
      const level8: Record<string, Any> = { 'i': level9 };
      const level7: Record<string, Any> = { 'h': level8 };
      const level6: Record<string, Any> = { 'g': level7 };
      const level5: Record<string, Any> = { 'f': level6 };
      const level4: Record<string, Any> = { 'e': level5 };
      const level3: Record<string, Any> = { 'd': level4 };
      const level2: Record<string, Any> = { 'c': level3 };
      const level1: Record<string, Any> = { 'b': level2 };
      const deep: Record<string, Any> = { 'a': level1 };
      const vals: Any[] = Object.values(deep);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_5400
     * @tc.name objectValuesPart03Case054
     * @tc.desc Verify values with 26 letter keys returns 26 values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      for (let i: int = 0; i < 26; i++) {
        record[String.fromCharCode(97 + i)] = i;
      }
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 26;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[25];
      let eExpected2: Any = 25;
      expect(rResult2 as Object).assertEqual(eExpected2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_5500
     * @tc.name objectValuesPart03Case055
     * @tc.desc Verify values preserves insertion order for mixed numeric and alpha keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'z': 1, '1': 2, 'a': 3, '2': 4 };
      const vals: Any[] = Object.values(record);
      let rResult1: Any = vals[0];
      let eExpected1: Any = 1;
      expect(rResult1 as Object).assertEqual(eExpected1 as Object);
      let rResult2: Any = vals[3];
      let eExpected2: Any = 4;
      expect(rResult2 as Object).assertEqual(eExpected2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_5600
     * @tc.name objectValuesPart03Case056
     * @tc.desc Verify values elements are not null for populated record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 'x' };
      const vals: Any[] = Object.values(record);
      let rResult1: Any = vals[0];
      let b1: boolean = rResult1 === null;
      expect(b1).assertFalse();
      let rResult2: Any = vals[1];
      let b2: boolean = rResult2 === null;
      expect(b2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_5700
     * @tc.name objectValuesPart03Case057
     * @tc.desc Verify values with value referencing another object preserved by identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Record<string, Any> = { 'x': 1 };
      const record: Record<string, Any> = { 'a': inner };
      const vals: Any[] = Object.values(record);
      expect(vals[0] as Object).assertEqual(inner as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_5800
     * @tc.name objectValuesPart03Case058
     * @tc.desc Verify values with derived class field order base first then derived
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: VDerived = new VDerived();
      const vals: Any[] = Object.values(obj);
      let rResult1: Any = vals[0];
      let eExpected1: Any = 1;
      expect(rResult1 as Object).assertEqual(eExpected1 as Object);
      let rResult2: Any = vals[1];
      let eExpected2: Any = 2;
      expect(rResult2 as Object).assertEqual(eExpected2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_5900
     * @tc.name objectValuesPart03Case059
     * @tc.desc Verify a Record holding newline and tab strings keeps both values intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': "line1\nline2", 'b': "c\td" };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = vals[0] as string;
      let eExpected2: string = "line1\nline2";
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = vals[1] as string;
      let eExpected3: string = "c\td";
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_6000
     * @tc.name objectValuesPart03Case060
     * @tc.desc Verify values keeps leading-zero numeric keys in insertion order among string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "02": 20, "01": 10, "10": 100, '1': 1 };
      const vals: Any[] = Object.values(record);
      let rResult1: Any = vals[0];
      let eExpected1: Any = 20;
      expect(rResult1 as Object).assertEqual(eExpected1 as Object);
      let rResult2: Any = vals[1];
      let eExpected2: Any = 10;
      expect(rResult2 as Object).assertEqual(eExpected2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_6100
     * @tc.name objectValuesPart03Case061
     * @tc.desc Verify values keeps negative numeric key in insertion order ahead of integer-like keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "-1": 10, '0': 0, '1': 1 };
      const vals: Any[] = Object.values(record);
      let rResult1: Any = vals[0];
      let eExpected1: Any = 10;
      expect(rResult1 as Object).assertEqual(eExpected1 as Object);
      let rResult2: Any = vals[2];
      let eExpected2: Any = 1;
      expect(rResult2 as Object).assertEqual(eExpected2 as Object);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_6200
     * @tc.name objectValuesPart03Case062
     * @tc.desc Verify a Record with keys 300 100 200 keeps 300 first and 200 last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "300": 300, "100": 100, "200": 200 };
      const vals: Any[] = Object.values(record);
      let rResult1: Any = vals[0];
      let eExpected1: Any = 300;
      expect(rResult1 as Object).assertEqual(eExpected1 as Object);
      let rResult2: Any = vals[2];
      let eExpected2: Any = 200;
      expect(rResult2 as Object).assertEqual(eExpected2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_6300
     * @tc.name objectValuesPart03Case063
     * @tc.desc Verify values order stable across repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 1, 'y': 2, 'z': 3 };
      const firstValues: Any[] = Object.values(record);
      const secondValues: Any[] = Object.values(record);
      expect(firstValues).assertDeepEquals(secondValues);
      let rResult2: int = firstValues.length;
      let eExpected2: int = 3;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_6400
     * @tc.name objectValuesPart03Case064
     * @tc.desc Verify values with nested Record value preserved by reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Record<string, Any> = { 'x': 1, 'y': 2 };
      const record: Record<string, Any> = { 'a': inner };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      expect(vals[0] as Object).assertEqual(inner as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_6500
     * @tc.name objectValuesPart03Case065
     * @tc.desc Verify a Record mixing string and integer keys returns all five values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'b': 2, '0': 0, 'a': 1, '1': 1, 'c': 3 };
      const vals: Any[] = Object.values(record);
      let rResult1: Any = vals[0];
      let eExpected1: Any = 2;
      expect(rResult1 as Object).assertEqual(eExpected1 as Object);
      let rResult2: Any = vals[1];
      let eExpected2: Any = 0;
      expect(rResult2 as Object).assertEqual(eExpected2 as Object);
      let rResult3: Any = vals[2];
      let eExpected3: Any = 1;
      expect(rResult3 as Object).assertEqual(eExpected3 as Object);
      let rResult4: Any = vals[3];
      let eExpected4: Any = 1;
      expect(rResult4 as Object).assertEqual(eExpected4 as Object);
      let rResult5: Any = vals[4];
      let eExpected5: Any = 3;
      expect(rResult5 as Object).assertEqual(eExpected5 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part03_6600
     * @tc.name objectValuesPart03Case066
     * @tc.desc Verify values with value being empty Record object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart03Case066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Record<string, Any> = {};
      const record: Record<string, Any> = { "empty": inner };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      let eExpected2: Any = inner;
      expect(rResult2 as Object).assertEqual(eExpected2 as Object);
    });
  });
}
