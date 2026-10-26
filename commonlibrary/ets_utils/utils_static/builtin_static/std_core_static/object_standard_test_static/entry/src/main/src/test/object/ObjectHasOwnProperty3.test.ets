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


class H3A {
  a: number = 1;
  m(): void {}
}
class H3B extends H3A {
  b: number = 2;
}
class H3C extends H3B {
  c: number = 3;
}
class HStatic {
  static s: number = 9;
  inst: number = 1;
}
class HBaseF {
  base: number = 1;
}
class HDerivedF extends HBaseF {
  d: number = 2;
}
class HInh {
  m(): void {}
}
class HGP {
  gp: number = 1;
}
class HPar extends HGP {
  p: number = 2;
}
class HCh extends HPar {
  c: number = 3;
}
class HEmpty {}
class HFunc {
  f: () => void = (): void => {};
}

export default function ObjectHasOwnProperty3Test(): void {
  describe("ObjectHasOwnProperty3Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_0100
     * @tc.name objectHasOwnPropertyPart03Case001
     * @tc.desc Verify hasOwnProperty returns false for missing key and true for remaining keys after rebuild without target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const beforeRecord: Record<string, number> = { "target": 1, "other": 2 } as Record<string, number>;
      const before: boolean = beforeRecord.hasOwnProperty("target");
      expect(before).assertTrue();
      const afterRecord: Record<string, number> = { "other": 2 } as Record<string, number>;
      const after: boolean = afterRecord.hasOwnProperty("target");
      expect(after).assertFalse();
      const otherStill: boolean = afterRecord.hasOwnProperty("other");
      expect(otherStill).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_0200
     * @tc.name objectHasOwnPropertyPart03Case002
     * @tc.desc Verify hasOwnProperty returns false for Number.MAX_VALUE as array index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20, 30];
      const r: boolean = arr.hasOwnProperty(Number.MAX_VALUE);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_0300
     * @tc.name objectHasOwnPropertyPart03Case003
     * @tc.desc Verify hasOwnProperty returns false for negative Infinity as array index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20, 30];
      const r: boolean = arr.hasOwnProperty(Number.NEGATIVE_INFINITY);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_0400
     * @tc.name objectHasOwnPropertyPart03Case004
     * @tc.desc Verify hasOwnProperty MAX_SAFE_INTEGER index returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      let rResult1: boolean = arr.hasOwnProperty(9007199254740991);
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_0500
     * @tc.name objectHasOwnPropertyPart03Case005
     * @tc.desc Verify hasOwnProperty Infinity index returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      let rResult1: boolean = arr.hasOwnProperty(Number.POSITIVE_INFINITY);
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_0600
     * @tc.name objectHasOwnPropertyPart03Case006
     * @tc.desc Verify hasOwnProperty on string primitive reports string index keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "abc";
      let rResult1: boolean = str.hasOwnProperty('0');
      expect(rResult1).assertTrue();
      let rResult2: boolean = str.hasOwnProperty('2');
      expect(rResult2).assertTrue();
      let rResult3: boolean = str.hasOwnProperty('3');
      expect(rResult3).assertFalse();
      let rResult4: boolean = str.hasOwnProperty("length");
      expect(rResult4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_0700
     * @tc.name objectHasOwnPropertyPart03Case007
     * @tc.desc Verify hasOwnProperty reports keys with NaN property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "nan": Number.NaN, 'b': 1 };
      let rResult1: boolean = record.hasOwnProperty("nan");
      expect(rResult1).assertTrue();
      let rResult2: boolean = record.hasOwnProperty('b');
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_0800
     * @tc.name objectHasOwnPropertyPart03Case008
     * @tc.desc Verify hasOwnProperty reports keys with Infinity property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "inf": Number.POSITIVE_INFINITY };
      let rResult1: boolean = record.hasOwnProperty("inf");
      expect(rResult1).assertTrue();
      let rResult2: boolean = record.hasOwnProperty("missing");
      expect(rResult2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_0900
     * @tc.name objectHasOwnPropertyPart03Case009
     * @tc.desc Verify hasOwnProperty reports keys holding container object values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const m: Map<string, int> = new Map<string, int>();
      m.set('k', 1);
      const s: Set<number> = new Set<number>([1, 2]);
      const re: RegExp = new RegExp("abc", 'g');
      const ta: Uint8Array = new Uint8Array([72, 101]);
      const record: Record<string, Any> = { "map": m, "set": s, "regex": re, "bytes": ta };
      let rResult1: boolean = record.hasOwnProperty("map");
      expect(rResult1).assertTrue();
      let rResult2: boolean = record.hasOwnProperty("set");
      expect(rResult2).assertTrue();
      let rResult3: boolean = record.hasOwnProperty("regex");
      expect(rResult3).assertTrue();
      let rResult4: boolean = record.hasOwnProperty("bytes");
      expect(rResult4).assertTrue();
      let rResult5: boolean = record.hasOwnProperty("promise");
      expect(rResult5).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_1000
     * @tc.name objectHasOwnPropertyPart03Case010
     * @tc.desc Verify a 10000-key Record owns k0 and k9999 but not k10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big: Record<string, int> = {};
      for (let i: int = 0; i < 10000; i++) {
        big['k' + i] = i;
      }
      let rResult1: boolean = big.hasOwnProperty("k0");
      expect(rResult1).assertTrue();
      let rResult2: boolean = big.hasOwnProperty("k9999");
      expect(rResult2).assertTrue();
      let rResult3: boolean = big.hasOwnProperty("k10000");
      expect(rResult3).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_1100
     * @tc.name objectHasOwnPropertyPart03Case011
     * @tc.desc Verify hasOwnProperty own emoji key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record['😀'] = 1;
      let rResult1: boolean = record.hasOwnProperty('😀');
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_1200
     * @tc.name objectHasOwnPropertyPart03Case012
     * @tc.desc Verify hasOwnProperty own combining-character key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const key: string = 'e' + String.fromCharCode(0x301);
      const record: Record<string, Any> = {};
      record[key] = 1;
      let rResult1: boolean = record.hasOwnProperty(key);
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_1300
     * @tc.name objectHasOwnPropertyPart03Case013
     * @tc.desc Verify hasOwnProperty own 1000-char key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = '';
      for (let i: int = 0; i < 1000; i++) {
        longStr = longStr + 'a';
      }
      const record: Record<string, Any> = {};
      record[longStr] = 1;
      let rResult1: boolean = record.hasOwnProperty(longStr);
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_1400
     * @tc.name objectHasOwnPropertyPart03Case014
     * @tc.desc Verify hasOwnProperty own key with undefined value true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record['a'] = undefined;
      let rResult1: boolean = record.hasOwnProperty('a');
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_1500
     * @tc.name objectHasOwnPropertyPart03Case015
     * @tc.desc Verify hasOwnProperty own key with null value true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record['a'] = null;
      let rResult1: boolean = record.hasOwnProperty('a');
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_1600
     * @tc.name objectHasOwnPropertyPart03Case016
     * @tc.desc Verify hasOwnProperty own numeric-string key 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': 10 };
      let rResult1: boolean = record.hasOwnProperty('0');
      expect(rResult1).assertTrue();
      let rResult2: boolean = Object.hasOwn(record, '0');
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_1700
     * @tc.name objectHasOwnPropertyPart03Case017
     * @tc.desc Verify hasOwnProperty own key named length on plain object true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record["length"] = 42;
      let rResult1: boolean = record.hasOwnProperty("length");
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_1800
     * @tc.name objectHasOwnPropertyPart03Case018
     * @tc.desc Verify hasOwnProperty own key named toString shadowing true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record["toString"] = "own";
      let rResult1: boolean = record.hasOwnProperty("toString");
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_1900
     * @tc.name objectHasOwnPropertyPart03Case019
     * @tc.desc Verify hasOwnProperty inherited method across 3-level chain false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: H3C = new H3C();
      let rResult1: boolean = obj.hasOwnProperty('m');
      expect(rResult1).assertFalse();
      let rResult2: boolean = obj.hasOwnProperty('a');
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_2000
     * @tc.name objectHasOwnPropertyPart03Case020
     * @tc.desc Verify hasOwnProperty static member false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: HStatic = new HStatic();
      let rResult1: boolean = obj.hasOwnProperty('s');
      expect(rResult1).assertFalse();
      let rResult2: boolean = obj.hasOwnProperty("inst");
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_2100
     * @tc.name objectHasOwnPropertyPart03Case021
     * @tc.desc Verify hasOwnProperty inherited base field on derived instance true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: HDerivedF = new HDerivedF();
      let rResult1: boolean = obj.hasOwnProperty("base");
      expect(rResult1).assertTrue();
      let rResult2: boolean = obj.hasOwnProperty('d');
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_2200
     * @tc.name objectHasOwnPropertyPart03Case022
     * @tc.desc Verify hasOwnProperty first key in 1000-key object true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      for (let i: int = 0; i < 1000; i++) {
        record['k' + i] = i;
      }
      let rResult1: boolean = record.hasOwnProperty("k0");
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_2300
     * @tc.name objectHasOwnPropertyPart03Case023
     * @tc.desc Verify hasOwnProperty true for every key from Object.keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const keys: string[] = Object.keys(record);
      let all: boolean = true;
      for (let i: int = 0; i < keys.length; i++) {
        if (!record.hasOwnProperty(keys[i])) {
          all = false;
        }
      }
      expect(all).assertTrue();
      let rResultAll: boolean = record.hasOwnProperty("zzz");
      expect(rResultAll).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_2400
     * @tc.name objectHasOwnPropertyPart03Case024
     * @tc.desc Verify hasOwnProperty primitive number receiver reports false for probed keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num: number = 42;
      let rResult1: boolean = num.hasOwnProperty('0');
      expect(rResult1).assertFalse();
      let rResult2: boolean = num.hasOwnProperty("length");
      expect(rResult2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_2500
     * @tc.name objectHasOwnPropertyPart03Case025
     * @tc.desc Verify hasOwnProperty primitive boolean receiver reports false for probed keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: boolean = true;
      let rResult1: boolean = b.hasOwnProperty('0');
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_2600
     * @tc.name objectHasOwnPropertyPart03Case026
     * @tc.desc Verify hasOwnProperty out-of-range index on dense array returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1];
      let rResult1: boolean = arr.hasOwnProperty(1);
      expect(rResult1).assertFalse();
      let rResult2: boolean = arr.hasOwnProperty(0);
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_2700
     * @tc.name objectHasOwnPropertyPart03Case027
     * @tc.desc Verify hasOwnProperty scientific-notation key false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': 1 };
      let rResult1: boolean = record.hasOwnProperty("1e3");
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_2800
     * @tc.name objectHasOwnPropertyPart03Case028
     * @tc.desc Verify hasOwnProperty own key added inside loop true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      for (let i: int = 0; i < 10; i++) {
        record["idx" + i] = i;
      }
      let rResult1: boolean = record.hasOwnProperty("idx7");
      expect(rResult1).assertTrue();
      let rResult2: boolean = record.hasOwnProperty("idx10");
      expect(rResult2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_2900
     * @tc.name objectHasOwnPropertyPart03Case029
     * @tc.desc Verify hasOwnProperty own key with object value true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Record<string, Any> = { 'x': 1 };
      const record: Record<string, Any> = { 'a': inner };
      let rResult1: boolean = record.hasOwnProperty('a');
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_3000
     * @tc.name objectHasOwnPropertyPart03Case030
     * @tc.desc Verify Object.hasOwn own emoji key true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record['😀'] = 1;
      let rResult1: boolean = Object.hasOwn(record, '😀');
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_3100
     * @tc.name objectHasOwnPropertyPart03Case031
     * @tc.desc Verify Object.hasOwn inherited method false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: HInh = new HInh();
      let rResult1: boolean = Object.hasOwn(obj, 'm');
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_3200
     * @tc.name objectHasOwnPropertyPart03Case032
     * @tc.desc Verify hasOwnProperty is true for key arr holding a two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Record<string, Any> = { "arr": [1, 2] };
      let rResult1: boolean = obj.hasOwnProperty("arr");
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_3300
     * @tc.name objectHasOwnPropertyPart03Case033
     * @tc.desc Verify hasOwnProperty grandparent inherited field true on deep chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: HCh = new HCh();
      let rResult1: boolean = obj.hasOwnProperty("gp");
      expect(rResult1).assertTrue();
      let rResult2: boolean = obj.hasOwnProperty('c');
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_3400
     * @tc.name objectHasOwnPropertyPart03Case034
     * @tc.desc Verify hasOwnProperty key built by concatenation true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record["con" + "cat"] = 1;
      let rResult1: boolean = record.hasOwnProperty("concat");
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_3500
     * @tc.name objectHasOwnPropertyPart03Case035
     * @tc.desc Verify hasOwnProperty on empty class false for any key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: HEmpty = new HEmpty();
      let rResult1: boolean = obj.hasOwnProperty('a');
      expect(rResult1).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_3600
     * @tc.name objectHasOwnPropertyPart03Case036
     * @tc.desc Verify hasOwnProperty true for own key holding a Date value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: Date = new Date();
      const record: Record<string, Any> = { 'd': d };
      let rResult1: boolean = record.hasOwnProperty('d');
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_3700
     * @tc.name objectHasOwnPropertyPart03Case037
     * @tc.desc Verify hasOwnProperty missing key on large object false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      for (let i: int = 0; i < 1000; i++) {
        record['k' + i] = i;
      }
      let rResult1: boolean = record.hasOwnProperty("missing");
      expect(rResult1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_3800
     * @tc.name objectHasOwnPropertyPart03Case038
     * @tc.desc Verify hasOwnProperty class with function field own true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: HFunc = new HFunc();
      let rResult1: boolean = obj.hasOwnProperty('f');
      expect(rResult1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_3900
     * @tc.name objectHasOwnPropertyPart03Case039
     * @tc.desc Verify hasOwnProperty false for key in nested record not on outer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Record<string, int> = { 'x': 1 };
      const outer: Record<string, Object> = { "inner": inner };
      let rResult1: boolean = outer.hasOwnProperty('x');
      expect(rResult1).assertFalse();
      let rResult2: boolean = outer.hasOwnProperty("inner");
      expect(rResult2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTHASOWNPROPERTY_Part03_4000
     * @tc.name objectHasOwnPropertyPart03Case040
     * @tc.desc Verify hasOwnProperty own multiple keys all true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectHasOwnPropertyPart03Case040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      record['a'] = 1;
      record['b'] = 2;
      let rResult1: boolean = record.hasOwnProperty('a');
      expect(rResult1).assertTrue();
      let rResult2: boolean = record.hasOwnProperty('b');
      expect(rResult2).assertTrue();
      let rResult3: boolean = record.hasOwnProperty('c');
      expect(rResult3).assertFalse();
      let rResult4: boolean = Object.hasOwn(record, 'a');
      expect(rResult4).assertTrue();
      let rResult5: boolean = Object.hasOwn(record, 'c');
      expect(rResult5).assertFalse();
    });
  });
}
