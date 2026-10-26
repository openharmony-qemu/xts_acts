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

class Val2Point004 {
  x: int = 1;
}
class Val2Person001 {
  name: string = "Alice";
}
class Val2Config001 {
  retries: int = 3;
  enabled: boolean = true;
}
class Val2Box001 {
  size: int = 1;
}
class Flag001 {
  ok: boolean = true;
}
class Flag002 {
  ok: boolean = false;
}
class Val2Node001 {
  label: string | null = null;
  id: int = 1;
}
class Val2Point006 {
  x: int = 1;
  y: int = 2;
}
class Line001 {
  start: Val2Point006 = new Val2Point006();
  len: int = 3;
}
class Pair002 {
  a: int = 1;
  b: int = 2;
}
class Single001 {
  v: int = 9;
}
class Val2Empty002 {}
class Val2User001 {
  name: string = "ark";
  age: int = 18;
}
class Point012 {
  x: int = 1;
  y: int = 2;
}
class Point013 {
  x: int = 1;
  y: int = 2;
}
class Point014 {
  x: int = 1;
  y: int = 2;
}
class Point015 {
  x: int = 3;
  y: int = 4;
}
class Point016 {
  x: int = 3;
}


export default function ObjectValues2Test(): void {
  describe("ObjectValues2Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_0100
     * @tc.name objectValuesPart02Case001
     * @tc.desc Verify Object.values of an empty Record stays empty on two repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const vals1: Any[] = Object.values(record);
      const vals2: Any[] = Object.values(record);
      let rResult1: int = vals1.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = vals2.length;
      let eExpected2: int = 0;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_0200
     * @tc.name objectValuesPart02Case002
     * @tc.desc Verify Object.values of a Record holding one string value ArkTS returns that value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      let eExpected2: string = "ArkTS";
      expect(rResult2 as string).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_0300
     * @tc.name objectValuesPart02Case003
     * @tc.desc Verify Object.values of a Record whose only value is boolean true returns one true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "flag": true };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0] as boolean;
      expect(rResult2).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_0400
     * @tc.name objectValuesPart02Case004
     * @tc.desc Verify Object.values of a name, year, stable Record returns ArkTS, 2026 and true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS", "year": 2026, "stable": true };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      let eExpected2: string = "ArkTS";
      expect(rResult2 as string).assertEqual(eExpected2);
      let rResult3: Any = vals[1];
      let eExpected3: int = 2026;
      expect(rResult3 as int).assertEqual(eExpected3);
      let rResult4: Any = vals[2] as boolean;
      expect(rResult4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_0500
     * @tc.name objectValuesPart02Case005
     * @tc.desc Verify Object.values of a name, num, pi, ok Record returns O, 7, 3.14 and true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": 'O', "num": 7, "pi": 3.14, "ok": true };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 4;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      let eExpected2: string = 'O';
      expect(rResult2 as string).assertEqual(eExpected2);
      let rResult3: Any = vals[1];
      let eExpected3: int = 7;
      expect(rResult3 as int).assertEqual(eExpected3);
      let rResult4: Any = vals[2];
      let eExpected4: number = 3.14;
      expect(rResult4 as number).assertEqual(eExpected4);
      let rResult5: Any = vals[3] as boolean;
      expect(rResult5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_0600
     * @tc.name objectValuesPart02Case006
     * @tc.desc Verify Object.values of a Record with a null entry keeps 3 values with null in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': null, 'c': "text" };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      let eExpected2: int = 1;
      expect(rResult2 as int).assertEqual(eExpected2);
      let actualValue1: Any = vals[1];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
      let rResult3: Any = vals[2];
      let eExpected3: string = "text";
      expect(rResult3 as string).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_0700
     * @tc.name objectValuesPart02Case007
     * @tc.desc Verify Object.values of a Record with CJK keys returns 1,2,3 in insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '一': 1, '二': 2, '三': 3 };
      const vals: Any[] = Object.values(record);
      let rResult1: Any = vals[0];
      let eExpected1: int = 1;
      expect(rResult1 as int).assertEqual(eExpected1);
      let rResult2: Any = vals[1];
      let eExpected2: int = 2;
      expect(rResult2 as int).assertEqual(eExpected2);
      let rResult3: Any = vals[2];
      let eExpected3: int = 3;
      expect(rResult3 as int).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_0800
     * @tc.name objectValuesPart02Case008
     * @tc.desc Verify Object.keys of a three-key Record is a, b, c and Object.values is 1, 2, 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const vals: Any[] = Object.values(record);
      const keys: string[] = Object.keys(record);
      expect(keys).assertDeepEquals(['a', 'b', 'c']);
      let rResult1: int = vals.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      let eExpected2: int = 1;
      expect(rResult2 as int).assertEqual(eExpected2);
      let rResult3: Any = vals[1];
      let eExpected3: int = 2;
      expect(rResult3 as int).assertEqual(eExpected3);
      let rResult4: Any = vals[2];
      let eExpected4: int = 3;
      expect(rResult4 as int).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_0900
     * @tc.name objectValuesPart02Case009
     * @tc.desc Verify Object.values of a Record keyed 0,1,2 returns zero first and two last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': "zero", '1': "one", '2': "two" };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = vals[0] as string;
      let eExpected2: string = "zero";
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = vals[2] as string;
      let eExpected3: string = "two";
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_1000
     * @tc.name objectValuesPart02Case010
     * @tc.desc Verify Object.values keeps a reference to a nested Record so later mutation is visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Record<string, Any> = { 'k': 1 };
      const record: Record<string, Any> = { "data": inner };
      const vals: Any[] = Object.values(record);
      inner['k'] = 9;
      const got: Record<string, Any> = vals[0] as Record<string, Any>;
      let rResult1: Any = got['k'];
      let eExpected1: int = 9;
      expect(rResult1 as int).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_1100
     * @tc.name objectValuesPart02Case011
     * @tc.desc Verify mutating the array returned by Object.values does not change a later call result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const vals1: Any[] = Object.values(record);
      const vals2: Any[] = Object.values(record);
      vals1[0] = 999;
      let rResult1: Any = vals2[0];
      let eExpected1: int = 1;
      expect(rResult1 as int).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_1200
     * @tc.name objectValuesPart02Case012
     * @tc.desc Verify Object.values of an inline two-key Record returns 1 and 2 in key order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vals: Any[] = Object.values({ 'x': 1, 'y': 2 });
      let rResult1: int = vals.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      let eExpected2: int = 1;
      expect(rResult2 as int).assertEqual(eExpected2);
      let rResult3: Any = vals[1];
      let eExpected3: int = 2;
      expect(rResult3 as int).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_1300
     * @tc.name objectValuesPart02Case013
     * @tc.desc Verify Object.values of an int array returns its elements 10 and 20 in index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const vals: Any[] = Object.values(arr);
      let rResult1: Any = vals[0];
      let eExpected1: int = 10;
      expect(rResult1 as int).assertEqual(eExpected1);
      let rResult2: Any = vals[1];
      let eExpected2: int = 20;
      expect(rResult2 as int).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_1400
     * @tc.name objectValuesPart02Case014
     * @tc.desc Verify Object.values of an int array returns 2147483647 and -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [2147483647, -2147483647];
      const vals: Any[] = Object.values(arr);
      let rResult1: Any = vals[0];
      let eExpected1: int = 2147483647;
      expect(rResult1 as int).assertEqual(eExpected1);
      let rResult2: Any = vals[1];
      let eExpected2: int = -2147483647;
      expect(rResult2 as int).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_1500
     * @tc.name objectValuesPart02Case015
     * @tc.desc Verify Object.values of a boolean array returns true as its first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [true, false];
      const vals: Any[] = Object.values(arr);
      let rResult1: Any = vals[0];
      expect(rResult1 as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_1600
     * @tc.name objectValuesPart02Case016
     * @tc.desc Verify Object.values of a boolean array returns false as its second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: boolean[] = [true, false];
      const vals: Any[] = Object.values(arr);
      let rResult1: Any = vals[1];
      expect(rResult1 as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_1700
     * @tc.name objectValuesPart02Case017
     * @tc.desc Verify Object.values of a mixed Any array returns int, string and boolean elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Any[] = [10, "ok", true];
      const vals: Any[] = Object.values(arr);
      let rResult1: Any = vals[0];
      let eExpected1: int = 10;
      expect(rResult1 as int).assertEqual(eExpected1);
      let rResult2: Any = vals[1];
      let eExpected2: string = "ok";
      expect(rResult2 as string).assertEqual(eExpected2);
      let rResult3: Any = vals[2];
      expect(rResult3 as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_1800
     * @tc.name objectValuesPart02Case018
     * @tc.desc Verify Object.values of an int-or-null array keeps null at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (int | null)[] = [1, null, 3];
      const vals: Any[] = Object.values(arr);
      let actualValue1: Any = vals[1];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_1900
     * @tc.name objectValuesPart02Case019
     * @tc.desc Verify values at non-null indices of array containing a null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: (int | null)[] = [1, null, 3];
      const vals: Any[] = Object.values(arr);
      let rResult1: Any = vals[0];
      let eExpected1: int = 1;
      expect(rResult1 as int).assertEqual(eExpected1);
      let rResult2: Any = vals[2];
      let eExpected2: int = 3;
      expect(rResult2 as int).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_2000
     * @tc.name objectValuesPart02Case020
     * @tc.desc Verify Object.values of a nested int array yields one non-null inner array of length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[][] = [[1, 2]];
      const vals: Any[] = Object.values(arr);
      expect(vals[0] as Object)
        .not()
        .assertNull();
      expect(vals.length).assertEqual(1);
      let inner: int[] = vals[0] as int[];
      expect(inner.length).assertEqual(2);
      expect(inner[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_2100
     * @tc.name objectValuesPart02Case021
     * @tc.desc Verify Object.values of a one-element class array yields a non-null instance with x 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Val2Point004[] = [new Val2Point004()];
      const vals: Any[] = Object.values(arr);
      expect(vals[0] as Object)
        .not()
        .assertNull();
      expect(vals.length).assertEqual(1);
      let px: int = (vals[0] as Val2Point004).x;
      let eExpectedX: int = 1;
      expect(px).assertEqual(eExpectedX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_2200
     * @tc.name objectValuesPart02Case022
     * @tc.desc Verify Object.values of a Person class instance returns its name field value Alice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Val2Person001();
      const vals: Any[] = Object.values(obj);
      let rResult1: Any = vals[0];
      let eExpected1: string = "Alice";
      expect(rResult1 as string).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_2300
     * @tc.name objectValuesPart02Case023
     * @tc.desc Verify Object.values of a class instance returns its int and boolean fields 3 and true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: Val2Config001 = new Val2Config001();
      const vals: Any[] = Object.values(c);
      let rResult1: Any = vals[0];
      let eExpected1: int = 3;
      expect(rResult1 as int).assertEqual(eExpected1);
      let rResult2: Any = vals[1];
      expect(rResult2 as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_2400
     * @tc.name objectValuesPart02Case024
     * @tc.desc Verify Object.values of a box instance whose size field is 5 returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: Val2Box001 = new Val2Box001();
      b.size = 5;
      const vals: Any[] = Object.values(b);
      let rResult1: Any = vals[0];
      let eExpected1: int = 5;
      expect(rResult1 as int).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_2500
     * @tc.name objectValuesPart02Case025
     * @tc.desc Verify Object.values of a class instance whose ok field is true returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Flag001 = new Flag001();
      const vals: Any[] = Object.values(f);
      let rResult1: Any = vals[0];
      expect(rResult1 as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_2600
     * @tc.name objectValuesPart02Case026
     * @tc.desc Verify Object.values of a class instance whose ok field is false returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Flag002 = new Flag002();
      const vals: Any[] = Object.values(f);
      let rResult1: Any = vals[0];
      expect(rResult1 as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_2700
     * @tc.name objectValuesPart02Case027
     * @tc.desc Verify Object.values of a class with a null field keeps null then returns id 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n: Val2Node001 = new Val2Node001();
      const vals: Any[] = Object.values(n);
      let actualValue1: Any = vals[0];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
      let rResult1: Any = vals[1];
      let eExpected1: int = 1;
      expect(rResult1 as int).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_2800
     * @tc.name objectValuesPart02Case028
     * @tc.desc Verify Object.values of a line instance returns 2 values with a non-null start field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const l: Line001 = new Line001();
      const vals: Any[] = Object.values(l);
      let rResult1: int = vals.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      expect(vals[0] as Object)
        .not()
        .assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_2900
     * @tc.name objectValuesPart02Case029
     * @tc.desc Verify Object.values returns two values for an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const vals: Any[] = Object.values(arr);
      let rResult1: int = vals.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_3000
     * @tc.name objectValuesPart02Case030
     * @tc.desc Verify Object.values applied twice to an int array still returns 10 and 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [10, 20];
      const vals: Any[] = Object.values(arr);
      const twice: Any[] = Object.values(vals);
      let rResult1: int = twice.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = twice[0];
      let eExpected2: int = 10;
      expect(rResult2 as int).assertEqual(eExpected2);
      let rResult3: Any = twice[1];
      let eExpected3: int = 20;
      expect(rResult3 as int).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_3100
     * @tc.name objectValuesPart02Case031
     * @tc.desc Verify Object.values of a two-key Record is 2 both via a Record ref and an Object ref
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const vals1: Any[] = Object.values(record);
      const ref: Object = record;
      const vals2: Any[] = Object.values(ref);
      let rResult1: int = vals1.length;
      let eExpected1: number = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = vals2.length;
      let eExpected2: number = 2;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_3200
     * @tc.name objectValuesPart02Case032
     * @tc.desc Verify Object.values via an Object alias of a Record holding only null returns one null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "emptySlot": null };
      const ref: Object = record;
      const vals: Any[] = Object.values(ref);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let actualValue1: Any = vals[0];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_3300
     * @tc.name objectValuesPart02Case033
     * @tc.desc Verify Object.values via an Object alias of a flag and off Record returns true then false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "flag": true, "off": false };
      const ref: Object = record;
      const vals: Any[] = Object.values(ref);
      let rResult1: Any = vals[0] as boolean;
      expect(rResult1).assertTrue();
      let rResult2: Any = vals[1] as boolean;
      expect(rResult2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_3400
     * @tc.name objectValuesPart02Case034
     * @tc.desc Verify Object.values via an Object alias of a one-key ratio Record returns 3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "ratio": 3.14 };
      const ref: Object = record;
      const vals: Any[] = Object.values(ref);
      let rResult1: int = vals.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      let eExpected2: number = 3.14;
      expect(rResult2 as number).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_3500
     * @tc.name objectValuesPart02Case035
     * @tc.desc Verify Object.values returns 2 entries for a two-key Record and a two-field class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const rv: Any[] = Object.values(record);
      const cv: Any[] = Object.values(new Pair002());
      let rResult1: int = rv.length;
      let eExpected1: number = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = cv.length;
      let eExpected2: number = 2;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_3600
     * @tc.name objectValuesPart02Case036
     * @tc.desc Verify a Record keyed v and a class with field v both return one value 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'v': 9 };
      const rv: Any[] = Object.values(record);
      const cv: Any[] = Object.values(new Single001());
      let rResult1: int = rv.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = cv.length;
      let eExpected2: int = 1;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: Any = rv[0];
      let eExpected3: Any = cv[0];
      expect(rResult3 as Object).assertEqual(eExpected3 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_3700
     * @tc.name objectValuesPart02Case037
     * @tc.desc Verify Object.values of an empty Record, empty int array and empty class all return 0 entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyRec: Record<string, Any> = {};
      const emptyArr: int[] = [];
      const valsA: Any[] = Object.values(emptyRec);
      const valsB: Any[] = Object.values(emptyArr);
      const valsC: Any[] = Object.values(new Val2Empty002());
      let rResult1: int = valsA.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = valsB.length;
      let eExpected2: int = 0;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: int = valsC.length;
      let eExpected3: int = 0;
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_3800
     * @tc.name objectValuesPart02Case038
     * @tc.desc Verify Object.keys starts with a and Object.values ends with 3 in a three-key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const keys: string[] = Object.keys(record);
      const vals: Any[] = Object.values(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = keys[0];
      let eExpected2: string = 'a';
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: Any = vals[0];
      let eExpected3: int = 1;
      expect(rResult3 as int).assertEqual(eExpected3);
      let rResult4: Any = vals[2];
      let eExpected4: int = 3;
      expect(rResult4 as int).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_3900
     * @tc.name objectValuesPart02Case039
     * @tc.desc Verify a Record of string int double and false values gives 4 keys and 4 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 's': "str", 'i': 1, 'd': 2.5, 'b': false };
      const keys: string[] = Object.keys(record);
      const vals: Any[] = Object.values(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 4;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = vals.length;
      let eExpected2: int = 4;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: Any = vals[3] as boolean;
      expect(rResult3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_4000
     * @tc.name objectValuesPart02Case040
     * @tc.desc Verify Object.keys and Object.values of an empty Record both return 0 entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const keys: string[] = Object.keys(record);
      const vals: Any[] = Object.values(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = vals.length;
      let eExpected2: int = 0;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_4100
     * @tc.name objectValuesPart02Case041
     * @tc.desc Verify a Record with a CJK key plus constructor and length names yields 3 keys and 3 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "姓名": 1, "constructor": 2, "length": 3 };
      const keys: string[] = Object.keys(record);
      const vals: Any[] = Object.values(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = vals.length;
      let eExpected2: int = 3;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_4200
     * @tc.name objectValuesPart02Case042
     * @tc.desc Verify Object.keys and Object.values both report 2 entries for a User class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u: Val2User001 = new Val2User001();
      const keys: string[] = Object.keys(u);
      const vals: Any[] = Object.values(u);
      let rResult1: int = keys.length;
      let eExpected1: number = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = vals.length;
      let eExpected2: number = 2;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_4300
     * @tc.name objectValuesPart02Case043
     * @tc.desc Verify Object.keys and Object.values both return 3 entries for a string array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      const keys: string[] = Object.keys(arr);
      const vals: Any[] = Object.values(arr);
      let rResult1: int = keys.length;
      let eExpected1: int = 3;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = vals.length;
      let eExpected2: int = 3;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_4400
     * @tc.name objectValuesPart02Case044
     * @tc.desc Verify Object.keys and Object.values of an empty int array both return nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: int[] = [];
      const keys: string[] = Object.keys(arr);
      const vals: Any[] = Object.values(arr);
      let rResult1: int = keys.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = vals.length;
      let eExpected2: int = 0;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_4500
     * @tc.name objectValuesPart02Case045
     * @tc.desc Verify Object.keys and Object.values of a new empty Object both return 0 entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const keys: string[] = Object.keys(obj);
      const vals: Any[] = Object.values(obj);
      let rResult1: int = keys.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = vals.length;
      let eExpected2: int = 0;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_4600
     * @tc.name objectValuesPart02Case046
     * @tc.desc Verify adding an array field to a one-key Record yields 2 keys and 2 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      record["list"] = [1, 2];
      const keys: string[] = Object.keys(record);
      const vals: Any[] = Object.values(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = vals.length;
      let eExpected2: int = 2;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_4700
     * @tc.name objectValuesPart02Case047
     * @tc.desc Verify keys str, num, bool pair with values s, 42 and true in a three-key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "str": 's', "num": 42, "bool": true };
      const keys: string[] = Object.keys(record);
      const vals: Any[] = Object.values(record);
      let rResult1: string = keys[0];
      let eExpected1: string = "str";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      let eExpected2: string = 's';
      expect(rResult2 as string).assertEqual(eExpected2);
      let rResult3: string = keys[1];
      let eExpected3: string = "num";
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: Any = vals[1];
      let eExpected4: int = 42;
      expect(rResult4 as int).assertEqual(eExpected4);
      let rResult5: string = keys[2];
      let eExpected5: string = "bool";
      expect(rResult5).assertEqual(eExpected5);
      let rResult6: Any = vals[2] as boolean;
      expect(rResult6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_4800
     * @tc.name objectValuesPart02Case048
     * @tc.desc Verify a z, a, m Record keeps key order in Object.keys and values 1, 2, 3 in Object.values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'z': 1, 'a': 2, 'm': 3 };
      const keys: string[] = Object.keys(record);
      const vals: Any[] = Object.values(record);
      let rResult1: string = keys[0];
      let eExpected1: string = 'z';
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      let eExpected2: int = 1;
      expect(rResult2 as int).assertEqual(eExpected2);
      let rResult3: string = keys[1];
      let eExpected3: string = 'a';
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: Any = vals[1];
      let eExpected4: int = 2;
      expect(rResult4 as int).assertEqual(eExpected4);
      let rResult5: string = keys[2];
      let eExpected5: string = 'm';
      expect(rResult5).assertEqual(eExpected5);
      let rResult6: Any = vals[2];
      let eExpected6: int = 3;
      expect(rResult6 as int).assertEqual(eExpected6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_4900
     * @tc.name objectValuesPart02Case049
     * @tc.desc Verify Object.values and Object.entries of a two-key Record both return 2 entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const vals: Any[] = Object.values(record);
      const entries = Object.entries(record);
      let rResult1: int = vals.length;
      let eExpected1: number = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = entries.length;
      let eExpected2: number = 2;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_5000
     * @tc.name objectValuesPart02Case050
     * @tc.desc Verify Object.values and Object.entries of a two-field Point instance both return 2 entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Point012 = new Point012();
      const vals: Any[] = Object.values(p);
      const entries = Object.entries(p);
      let rResult1: int = vals.length;
      let eExpected1: number = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = entries.length;
      let eExpected2: number = 2;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_5100
     * @tc.name objectValuesPart02Case051
     * @tc.desc Verify each Object.entries value of a Point instance matches Object.values at the same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Point013 = new Point013();
      const vals: Any[] = Object.values(p);
      const entries = Object.entries(p);
      let rResult1: Any = entries[0]![1];
      let eExpected1: Any = vals[0];
      expect(rResult1 as Object).assertEqual(eExpected1 as Object);
      let rResult2: Any = entries[1]![1];
      let eExpected2: Any = vals[1];
      expect(rResult2 as Object).assertEqual(eExpected2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_5200
     * @tc.name objectValuesPart02Case052
     * @tc.desc Verify Object.entries of a two-element string array has values matching Object.values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b'];
      const vals: Any[] = Object.values(arr);
      const entries = Object.entries(arr);
      let rResult1: Any = entries[0]![1];
      let eExpected1: Any = vals[0];
      expect(rResult1 as Object).assertEqual(eExpected1 as Object);
      let rResult2: Any = entries[1]![1];
      let eExpected2: Any = vals[1];
      expect(rResult2 as Object).assertEqual(eExpected2 as Object);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_5300
     * @tc.name objectValuesPart02Case053
     * @tc.desc Verify Object.values and Object.entries of an empty Record both return 0 entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const vals: Any[] = Object.values(record);
      const entries = Object.entries(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = entries.length;
      let eExpected2: int = 0;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_5400
     * @tc.name objectValuesPart02Case054
     * @tc.desc Verify both Object.entries keys of a two-key Record are owned and it has 2 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const entries = Object.entries(record);
      const vals: Any[] = Object.values(record);
      let rResult1: boolean = record.hasOwnProperty(entries[0]![0]);
      expect(rResult1).assertTrue();
      let rResult2: boolean = record.hasOwnProperty(entries[1]![0]);
      expect(rResult2).assertTrue();
      let rResult3: int = vals.length;
      let eExpected3: int = 2;
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_5500
     * @tc.name objectValuesPart02Case055
     * @tc.desc Verify Object.values and Object.getOwnPropertyNames of a two-field Point instance both return 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Point014 = new Point014();
      const vals: Any[] = Object.values(p);
      const names: string[] = Object.getOwnPropertyNames(p);
      let rResult1: int = vals.length;
      let eExpected1: number = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = names.length;
      let eExpected2: number = 2;
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_5600
     * @tc.name objectValuesPart02Case056
     * @tc.desc Verify values length equals source array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b'];
      const vals: Any[] = Object.values(arr);
      let rResult1: int = vals.length;
      let eExpected1: number = arr.length;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_5700
     * @tc.name objectValuesPart02Case057
     * @tc.desc Verify names x and y line up with values 10 and 20 in a two-key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'x': 10, 'y': 20 };
      const names: string[] = Object.getOwnPropertyNames(record);
      const vals: Any[] = Object.values(record);
      let rResult1: string = names[0];
      let eExpected1: string = 'x';
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = vals[0];
      let eExpected2: int = 10;
      expect(rResult2 as int).assertEqual(eExpected2);
      let rResult3: string = names[1];
      let eExpected3: string = 'y';
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: Any = vals[1];
      let eExpected4: int = 20;
      expect(rResult4 as int).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_5800
     * @tc.name objectValuesPart02Case058
     * @tc.desc Verify a two-key Record has 2 values and 2 own property names with first value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const vals: Any[] = Object.values(record);
      const names: string[] = Object.getOwnPropertyNames(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = names.length;
      let eExpected2: int = 2;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: Any = vals[0];
      let eExpected3: int = 1;
      expect(rResult3 as int).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_5900
     * @tc.name objectValuesPart02Case059
     * @tc.desc Verify a constructor and toString Record yields values ctor and ts and 2 own names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "constructor": "ctor", "toString": "ts" };
      const names: string[] = Object.getOwnPropertyNames(record);
      const vals: Any[] = Object.values(record);
      let rResult1: int = names.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = vals.length;
      let eExpected2: int = 2;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: Any = vals[0];
      let eExpected3: string = "ctor";
      expect(rResult3 as string).assertEqual(eExpected3);
      let rResult4: Any = vals[1];
      let eExpected4: string = "ts";
      expect(rResult4 as string).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_6000
     * @tc.name objectValuesPart02Case060
     * @tc.desc Verify hasOwnProperty is true for own key a and values holds 2 entries starting at 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const vals: Any[] = Object.values(record);
      let rResult1: boolean = record.hasOwnProperty('a');
      expect(rResult1).assertTrue();
      let rResult2: int = vals.length;
      let eExpected2: int = 2;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: Any = vals[0];
      let eExpected3: int = 1;
      expect(rResult3 as int).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_6100
     * @tc.name objectValuesPart02Case061
     * @tc.desc Verify hasOwnProperty is false for absent key z while values still holds 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      const vals: Any[] = Object.values(record);
      let rResult1: boolean = record.hasOwnProperty('z');
      expect(rResult1).assertFalse();
      let rResult2: int = vals.length;
      let eExpected2: int = 1;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: Any = vals[0];
      let eExpected3: int = 1;
      expect(rResult3 as int).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_6200
     * @tc.name objectValuesPart02Case062
     * @tc.desc Verify all 3 keys of a three-key Record are owned and values matches the keys length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3 };
      const keys: string[] = Object.keys(record);
      const vals: Any[] = Object.values(record);
      let matched: int = 0;
      for (let i: int = 0; i < keys.length; i++) {
        if (record.hasOwnProperty(keys[i])) {
          matched++;
        }
      }
      expect(matched).assertEqual(3);
      let rResult1: int = vals.length;
      let eExpected1: number = keys.length;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_6300
     * @tc.name objectValuesPart02Case063
     * @tc.desc Verify a Point instance with x 3 and y 4 owns both keys and returns 3 then 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Point015 = new Point015();
      const vals: Any[] = Object.values(p);
      let rResult1: boolean = p.hasOwnProperty('x');
      expect(rResult1).assertTrue();
      let rResult2: boolean = p.hasOwnProperty('y');
      expect(rResult2).assertTrue();
      let rResult3: Any = vals[0];
      let eExpected3: int = 3;
      expect(rResult3 as int).assertEqual(eExpected3);
      let rResult4: Any = vals[1];
      let eExpected4: int = 4;
      expect(rResult4 as int).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_6400
     * @tc.name objectValuesPart02Case064
     * @tc.desc Verify a one-field Point instance does not own key z and returns 3 as its value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: Point016 = new Point016();
      const vals: Any[] = Object.values(p);
      let rResult1: boolean = p.hasOwnProperty('z');
      expect(rResult1).assertFalse();
      let rResult2: int = vals.length;
      let eExpected2: int = 1;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: Any = vals[0];
      let eExpected3: int = 3;
      expect(rResult3 as int).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_6500
     * @tc.name objectValuesPart02Case065
     * @tc.desc Verify an array reports indices 0 and 1 as owned and values returns a then b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b'];
      const vals: Any[] = Object.values(arr);
      let rResult1: boolean = arr.hasOwnProperty(0);
      expect(rResult1).assertTrue();
      let rResult2: boolean = arr.hasOwnProperty(1);
      expect(rResult2).assertTrue();
      let rResult3: Any = vals[0];
      let eExpected3: string = 'a';
      expect(rResult3 as string).assertEqual(eExpected3);
      let rResult4: Any = vals[1];
      let eExpected4: string = 'b';
      expect(rResult4 as string).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_6600
     * @tc.name objectValuesPart02Case066
     * @tc.desc Verify an unset array index 5 is unowned and values keeps only the element a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a'];
      const vals: Any[] = Object.values(arr);
      let rResult1: boolean = arr.hasOwnProperty(5);
      expect(rResult1).assertFalse();
      let rResult2: int = vals.length;
      let eExpected2: int = 1;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: Any = vals[0];
      let eExpected3: string = 'a';
      expect(rResult3 as string).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_6700
     * @tc.name objectValuesPart02Case067
     * @tc.desc Verify an empty Record reports keys a and b as unowned and yields no values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      const vals: Any[] = Object.values(record);
      let rResult1: boolean = record.hasOwnProperty('a');
      expect(rResult1).assertFalse();
      let rResult2: boolean = record.hasOwnProperty('b');
      expect(rResult2).assertFalse();
      let rResult3: int = vals.length;
      let eExpected3: int = 0;
      expect(rResult3).assertEqual(eExpected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_6800
     * @tc.name objectValuesPart02Case068
     * @tc.desc Verify the array from Object.values of a two-key Record owns indices 0 and 1 but not 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const vals: Any[] = Object.values(record);
      let rResult1: boolean = vals.hasOwnProperty(0);
      expect(rResult1).assertTrue();
      let rResult2: boolean = vals.hasOwnProperty(1);
      expect(rResult2).assertTrue();
      let rResult3: boolean = vals.hasOwnProperty(2);
      expect(rResult3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_6900
     * @tc.name objectValuesPart02Case069
     * @tc.desc Verify both keys of a two-key Record are owned and the second value is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const keys: string[] = Object.keys(record);
      const vals: Any[] = Object.values(record);
      let owned: int = 0;
      for (let i: int = 0; i < keys.length; i++) {
        if (record.hasOwnProperty(keys[i])) {
          owned++;
        }
      }
      expect(owned).assertEqual(2);
      let rResult1: Any = vals[1];
      let eExpected1: int = 2;
      expect(rResult1 as int).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_7000
     * @tc.name objectValuesPart02Case070
     * @tc.desc Verify Object.keys, values, entries and getOwnPropertyNames agree on a two-key Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const k1: string[] = Object.keys(record);
      const valsA: Any[] = Object.values(record);
      const entries1 = Object.entries(record);
      const n1: string[] = Object.getOwnPropertyNames(record);
      let rResult1: int = k1.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: Any = valsA[0];
      let eExpected2: int = 1;
      expect(rResult2 as int).assertEqual(eExpected2);
      let rResult3: int = entries1.length;
      let eExpected3: int = 2;
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: int = n1.length;
      let eExpected4: int = 2;
      expect(rResult4).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_7100
     * @tc.name objectValuesPart02Case071
     * @tc.desc Verify a two-key Record has 2 keys and at least 2 own property names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1, 'b': 2 };
      const keys: string[] = Object.keys(record);
      const names: string[] = Object.getOwnPropertyNames(record);
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: int = names.length;
      expect(rResult2).assertLargerOrEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTVALUES_Part02_7200
     * @tc.name objectValuesPart02Case072
     * @tc.desc Verify Object.values of a Record keyed 0,1 returns null then the number 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectValuesPart02Case072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': null, '1': 1 };
      const vals: Any[] = Object.values(record);
      let rResult1: int = vals.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      let actualValue1: Any = vals[0];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
      let rResult2: Any = vals[1];
      let eExpected2: int = 1;
      expect(rResult2 as int).assertEqual(eExpected2);
    });

  });
}
