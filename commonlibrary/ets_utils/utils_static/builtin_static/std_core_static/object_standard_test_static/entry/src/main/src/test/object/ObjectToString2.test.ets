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


class Counter001 {
  count: number = 0;
  inc(): number {
    this.count = this.count + 1;
    return this.count;
  }
}
class OverCls001 {
  toString(): String {
    return "over";
  }
}
class EmptyCls001 {}
class MarkCls001 {
  tag: string = "tag";
}
class CustomCls001 {
  toString(): String {
    return "custom";
  }
}
class SiblingACls001 {
  toString(): String {
    return "aa";
  }
}
class SiblingBCls001 {
  toString(): String {
    return "bb";
  }
}
class ThrowRetCls001 {
  toString(): String {
    throw new Error("boom");
  }
}
class BatchCls001 {
  toString(): String {
    return "batch";
  }
}
class Ts2Point001 {
  x: number;
  y: number;
  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}
class Ts2Config001 {
  readonly version: string = "1.0";
}
class HashInst001 {
  v: number = 1;
}
class HashOverride001 {
  toString(): String {
    return "hs";
  }
}
interface Leaf001 {
  v: number;
}
interface Ts2Node001 {
  leaf: Leaf001;
}

class StrCustom173 {
  toString(): String {
    return "custom-173";
  }
}
class StrUni195 {
  toString(): String {
    return "\u4E2D\u6587";
  }
}
class StrMl196 {
  toString(): String {
    return "line1\nline2";
  }
}
class StrEmpty197 {
  toString(): String {
    return '';
  }
}
class StrLong198 {
  toString(): String {
    return 'x'.repeat(1000);
  }
}
class StrNum199 {
  toString(): String {
    return "3.14";
  }
}
class StrFj212 {
  a: string = 'x';
  b: string = 'y';
  toString(): String {
    return this.a + '-' + this.b;
  }
}

export default function ObjectToString2Test(): void {
  describe("ObjectToString2Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_0100
     * @tc.name objectToStringPart02Case001
     * @tc.desc Verify toString of a new Object passed through an identity function returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const echo: (s: string) => string = (s: string): string => {
        return s;
      };
      const obj: Object = new Object();
      let rResult1: string = echo(obj.toString());
      let eExpected1: string = "[object Object]";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_0200
     * @tc.name objectToStringPart02Case002
     * @tc.desc Verify toString of a new Object uppercased equals [OBJECT OBJECT]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const str: string = obj.toString();
      let rResult1: string = str.toUpperCase();
      let eExpected1: string = "[OBJECT OBJECT]";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_0300
     * @tc.name objectToStringPart02Case003
     * @tc.desc Verify an empty Record prints [object Map] and new Object prints [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Record<string, Any> = {};
      const b: Object = new Object();
      let rResult1: string = a.toString();
      let eExpected1: string = "[object Map]";
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = b.toString();
      let eExpected2: string = "[object Object]";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_0400
     * @tc.name objectToStringPart02Case004
     * @tc.desc Verify Record toString returns "name,ArkTS,version,1.2"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS", "version": "1.2" };
      const str: string = record.toString();
      expect(str).assertEqual("name,ArkTS,version,1.2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_0500
     * @tc.name objectToStringPart02Case005
     * @tc.desc Verify toString of a Record with key count and numeric value 42 returns count,42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "count": 42 };
      const str: string = record.toString();
      expect(str).assertEqual("count,42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_0600
     * @tc.name objectToStringPart02Case006
     * @tc.desc Verify Record<number, string> toString returns "1,one,2,two"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numObj: Record<number, string> = { 1: "one", 2: "two" };
      const str: string = numObj.toString();
      expect(str).assertEqual("1,one,2,two");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_0700
     * @tc.name objectToStringPart02Case007
     * @tc.desc Verify toString of a three-element string array returns a,b,c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b', 'c'];
      const str: string = arr.toString();
      expect(str).assertEqual("a,b,c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_0800
     * @tc.name objectToStringPart02Case008
     * @tc.desc Verify toString of a two-element boolean array returns true,false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<boolean> = [true, false];
      const str: string = arr.toString();
      expect(str).assertEqual("true,false");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_0900
     * @tc.name objectToStringPart02Case009
     * @tc.desc Verify toString of the int array 1 2 3 matches join with a comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const str: string = arr.toString();
      expect(str).assertEqual(arr.join(','));
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_1000
     * @tc.name objectToStringPart02Case010
     * @tc.desc Verify toString of a class instance whose counter is incremented returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: Counter001 = new Counter001();
      c.inc();
      const str: string = c.toString();
      expect(str).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_1100
     * @tc.name objectToStringPart02Case011
     * @tc.desc Verify toString of a new Object ends with Object] and equals [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const str: string = obj.toString();
      let rResult1: boolean = str.endsWith("Object]");
      expect(rResult1).assertTrue();
      let rResult2: string = str;
      let eExpected2: string = "[object Object]";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_1200
     * @tc.name objectToStringPart02Case012
     * @tc.desc Verify toString of a class whose override returns over yields over
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref: Object = new OverCls001();
      const result: String = ref.toString();
      expect(result).assertEqual("over");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_1300
     * @tc.name objectToStringPart02Case013
     * @tc.desc Verify toString of an instance of an empty class returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rResult1: string = new EmptyCls001().toString();
      let eExpected1: string = "[object Object]";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_1400
     * @tc.name objectToStringPart02Case014
     * @tc.desc Verify toString of a class with a tag field returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref: Object = new MarkCls001();
      let rResult1: string = ref.toString();
      let eExpected1: string = "[object Object]";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_1500
     * @tc.name objectToStringPart02Case015
     * @tc.desc Verify toString returns aa for SiblingA and bb for SiblingB overrides
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const aStr: String = new SiblingACls001().toString();
      const bStr: String = new SiblingBCls001().toString();
      expect(aStr).assertEqual("aa");
      expect(bStr).assertEqual("bb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_1600
     * @tc.name objectToStringPart02Case016
     * @tc.desc Verify toString of a class whose override throws Error boom propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new ThrowRetCls001().toString();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_1700
     * @tc.name objectToStringPart02Case017
     * @tc.desc Verify toString of BatchCls001 returns batch on each of 100 calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 0;
      while (i < 100) {
        const result: String = new BatchCls001().toString();
        expect(result).assertEqual("batch");
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_1800
     * @tc.name objectToStringPart02Case018
     * @tc.desc Verify toString of a Point instance holding coordinates 1 and 2 returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Ts2Point001 = new Ts2Point001(1, 2);
      let rResult1: string = p.toString();
      let eExpected1: string = "[object Object]";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_1900
     * @tc.name objectToStringPart02Case019
     * @tc.desc Verify toString of a class with a readonly version field is [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cfg: Ts2Config001 = new Ts2Config001();
      let rResult1: string = cfg.toString();
      let eExpected1: string = "[object Object]";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_2000
     * @tc.name objectToStringPart02Case020
     * @tc.desc Verify toString of a two-element string array with null returns a,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<string | null> = ['a', null];
      let rResult1: string = arr.toString();
      let eExpected1: string = "a,";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_2100
     * @tc.name objectToStringPart02Case021
     * @tc.desc Verify a Record key name value a hashes stably and prints name,a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, string> = { "name": 'a' };
      const hc1: int = obj.$_hashCode();
      const hc2: int = obj.$_hashCode();
      expect(hc1).assertEqual(hc2);
      let rResult1: string = obj.toString();
      let eExpected1: string = "name,a";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_2200
     * @tc.name objectToStringPart02Case022
     * @tc.desc Verify toString of Record with numeric value 1 returns k,1 and $_hashCode is stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, number> = { 'k': 1 };
      let s: String = obj.toString();
      let hc: number = obj.$_hashCode();
      let rResult1: number = obj.$_hashCode();
      let eExpected1: number = hc;
      expect(rResult1).assertEqual(eExpected1);
      expect(s).assertEqual("k,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_2300
     * @tc.name objectToStringPart02Case023
     * @tc.desc Verify a HashInst001 instance hashes stably and prints [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hi: HashInst001 = new HashInst001();
      const hc1: int = hi.$_hashCode();
      const hc2: int = hi.$_hashCode();
      expect(hc1).assertEqual(hc2);
      let rResult1: string = hi.toString();
      let eExpected1: string = "[object Object]";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_2400
     * @tc.name objectToStringPart02Case024
     * @tc.desc Verify a class overriding toString returns hs and its $_hashCode stays stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ho: HashOverride001 = new HashOverride001();
      let hc: number = ho.$_hashCode();
      let rResult1: number = ho.$_hashCode();
      let eExpected1: number = hc;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = ho.toString();
      let eExpected2: string = "hs";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_2500
     * @tc.name objectToStringPart02Case025
     * @tc.desc Verify int array toString returns 1,2,3 and its $_hashCode is stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3];
      let s: String = arr.toString();
      let hc: number = arr.$_hashCode();
      expect(s).assertEqual("1,2,3");
      let rResult1: number = arr.$_hashCode();
      let eExpected1: number = hc;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_2600
     * @tc.name objectToStringPart02Case026
     * @tc.desc Verify Object.keys returns ['a', 'b']
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Any> = { 'a': 1, 'b': 2 };
      let rResult1: string[] = Object.keys(obj);
      let eExpected1: string[] = ['a', 'b'];
      expect(rResult1).assertDeepEquals(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_2700
     * @tc.name objectToStringPart02Case027
     * @tc.desc Verify Record toString returns "a,1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, number> = { 'a': 1 };
      let rResult1: string = obj.toString();
      let eExpected1: string = "a,1";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_2800
     * @tc.name objectToStringPart02Case028
     * @tc.desc Verify Object.values returns [1, 2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Any> = { 'a': 1, 'b': 2 };
      let rResult1: Any[] = Object.values(obj);
      let eExpected1: Any[] = [1, 2];
      expect(rResult1).assertDeepEquals(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_2900
     * @tc.name objectToStringPart02Case029
     * @tc.desc Verify Record toString returns "k,v"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, string> = { 'k': 'v' };
      let rResult1: string = obj.toString();
      let eExpected1: string = "k,v";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_3000
     * @tc.name objectToStringPart02Case030
     * @tc.desc Verify Object.entries returns one entry with key 'a'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Any> = { 'a': 1 };
      let rResult1: Array<[string, Any] | null | undefined> = Object.entries(obj);
      let rResult2: int = rResult1.length;
      let eExpected2: int = 1;
      expect(rResult2).assertEqual(eExpected2);
      let rResult3: string = rResult1[0]![0];
      let eExpected3: string = 'a';
      expect(rResult3).assertEqual(eExpected3);
      let rResult4: int = rResult1[0]![1] as int;
      let eExpected4: int = 1;
      expect(rResult4).assertEqual(eExpected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_3100
     * @tc.name objectToStringPart02Case031
     * @tc.desc Verify a two-key Record gives 2 entries and toString a,1,b,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, Any> = { 'a': 1, 'b': 2 };
      let keys = Object.keys(obj);
      let vals = Object.values(obj);
      let entries = Object.entries(obj);
      let s: String = obj.toString();
      expect(keys).assertDeepEquals(['a', 'b']);
      expect(vals).assertDeepEquals([1, 2]);
      let rResult1: int = entries.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      expect(s).assertEqual("a,1,b,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_3200
     * @tc.name objectToStringPart02Case032
     * @tc.desc Verify an interface object with one leaf entry gives [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Ts2Node001 = { leaf: { v: 1 } };
      let rResult1: int = Object.entries(obj).length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
      let rResult2: string = obj.toString();
      let eExpected2: string = "[object Object]";
      expect(rResult2).assertEqual(eExpected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_3300
     * @tc.name objectToStringPart02Case033
     * @tc.desc Verify toString of empty Record returns "[object Map]"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, number> = {};
      let rResult1: string = obj.toString();
      let eExpected1: string = "[object Map]";
      expect(rResult1).assertEqual(eExpected1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_3400
     * @tc.name objectToStringPart02Case034
     * @tc.desc Verify Record toString returns "a,1,b,2,c,3"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, number> = { 'a': 1, 'b': 2, 'c': 3 };
      let rResult1: string = obj.toString();
      let eExpected1: string = "a,1,b,2,c,3";
      expect(rResult1).assertEqual(eExpected1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_3500
     * @tc.name objectToStringPart02Case035
     * @tc.desc Verify class overriding toString returns custom string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: CustomCls001 = new CustomCls001();
      const r: string = obj.toString();
      expect(r).assertEqual("custom");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_3600
     * @tc.name objectToStringPart02Case036
     * @tc.desc Verify toString of class with custom override returns custom-173
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: StrCustom173 = new StrCustom173();
      let rResult1: string = obj.toString();
      let eExpected1: string = "custom-173";
      expect(rResult1).assertEqual(eExpected1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_3700
     * @tc.name objectToStringPart02Case037
     * @tc.desc Verify toString of Record serializes nested Record value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Record<string, Any> = { 'x': 1 };
      const record: Record<string, Any> = { 'a': inner };
      let rResult1: string = record.toString();
      expect(rResult1).assertEqual("a,x,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_3800
     * @tc.name objectToStringPart02Case038
     * @tc.desc Verify toString of Record serializes array value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "arr": [1, 2, 3] };
      let rResult1: string = record.toString();
      expect(rResult1).assertEqual("arr,1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_3900
     * @tc.name objectToStringPart02Case039
     * @tc.desc Verify toString of Record serializes null value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': null };
      let rResult1: string = record.toString();
      expect(rResult1).assertEqual("a,null");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_4000
     * @tc.name objectToStringPart02Case040
     * @tc.desc Verify toString of Record serializes boolean value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "flag": true };
      let rResult1: string = record.toString();
      expect(rResult1).assertEqual("flag,true");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_4100
     * @tc.name objectToStringPart02Case041
     * @tc.desc Verify toString of Record serializes unicode value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "\u4E2D\u6587" };
      let rResult1: string = record.toString();
      expect(rResult1).assertEqual("name,\u4E2D\u6587");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_4200
     * @tc.name objectToStringPart02Case042
     * @tc.desc Verify toString of nested array flattens in join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<Array<number>> = [
        [1, 2],
        [3, 4],
      ];
      let rResult1: string = arr.toString();
      let eExpected1: string = "1,2,3,4";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_4300
     * @tc.name objectToStringPart02Case043
     * @tc.desc Verify toString of a string array declared with string[] returns a,b,c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: string[] = ['a', 'b', 'c'];
      let rResult1: string = arr.toString();
      let eExpected1: string = "a,b,c";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_4400
     * @tc.name objectToStringPart02Case044
     * @tc.desc Verify toString of number primitive returns its digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num: number = 42;
      let rResult1: string = num.toString();
      let eExpected1: string = "42";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_4500
     * @tc.name objectToStringPart02Case045
     * @tc.desc Verify toString of boolean primitive returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: boolean = true;
      let rResult1: string = b.toString();
      let eExpected1: string = "true";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_4600
     * @tc.name objectToStringPart02Case046
     * @tc.desc Verify toString of Record with integer-like keys serialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { '0': 'a', '1': 'b' };
      let rResult1: string = record.toString();
      expect(rResult1).assertEqual("0,a,1,b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_4700
     * @tc.name objectToStringPart02Case047
     * @tc.desc Verify toString of Record with mixed value types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'i': 1, 's': 'x', 'b': true };
      let rResult1: string = record.toString();
      expect(rResult1).assertEqual("i,1,s,x,b,true");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_4800
     * @tc.name objectToStringPart02Case048
     * @tc.desc Verify toString of Record with 100 keys is stable across calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      for (let i: int = 0; i < 100; i++) {
        record['k' + i] = i;
      }
      let rResult1: string = record.toString();
      let rResult2: string = record.toString();
      expect(rResult1).assertEqual(rResult2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_4900
     * @tc.name objectToStringPart02Case049
     * @tc.desc Verify toString override returning unicode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: StrUni195 = new StrUni195();
      let rResult1: string = obj.toString();
      let eExpected1: string = "\u4E2D\u6587";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_5000
     * @tc.name objectToStringPart02Case050
     * @tc.desc Verify toString override returning multi-line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: StrMl196 = new StrMl196();
      let rResult1: string = obj.toString();
      let eExpected1: string = "line1\nline2";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_5100
     * @tc.name objectToStringPart02Case051
     * @tc.desc Verify toString override returning empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: StrEmpty197 = new StrEmpty197();
      let rResult1: string = obj.toString();
      let eExpected1: string = '';
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_5200
     * @tc.name objectToStringPart02Case052
     * @tc.desc Verify toString of a class override returning 1000 x characters yields them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = '';
      for (let i: int = 0; i < 1000; i++) {
        longStr = longStr + 'x';
      }
      const obj: StrLong198 = new StrLong198();
      let rResult1: string = obj.toString();
      expect(rResult1).assertEqual(longStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_5300
     * @tc.name objectToStringPart02Case053
     * @tc.desc Verify toString override returning numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: StrNum199 = new StrNum199();
      let rResult1: string = obj.toString();
      let eExpected1: string = "3.14";
      expect(rResult1).assertEqual(eExpected1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_5400
     * @tc.name objectToStringPart02Case054
     * @tc.desc Verify toString of Record reflects value mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'a': 1 };
      let before: string = record.toString();
      expect(before).assertEqual("a,1");
      record['a'] = 2;
      let after: string = record.toString();
      expect(after).assertEqual("a,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_5500
     * @tc.name objectToStringPart02Case055
     * @tc.desc Verify toString of a one-element array holding a Record returns x,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1: Record<string, Any> = { 'x': 1 };
      const arr: Array<Record<string, Any>> = [a1];
      let rResult1: string = arr.toString();
      expect(rResult1).assertEqual("x,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_5600
     * @tc.name objectToStringPart02Case056
     * @tc.desc Verify toString of Record preserves insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { 'z': 1, 'a': 2, 'm': 3 };
      let rResult1: string = record.toString();
      expect(rResult1).assertEqual("z,1,a,2,m,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_5700
     * @tc.name objectToStringPart02Case057
     * @tc.desc Verify toString of Record with NaN and Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "nan": Number.NaN, "inf": Number.POSITIVE_INFINITY };
      let rResult1: string = record.toString();
      const expected: string = "nan,Na" + "N,inf,Inf" + "inity";
      expect(rResult1).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOSTRING_Part02_5800
     * @tc.name objectToStringPart02Case058
     * @tc.desc Verify toString override returns field-joined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToStringPart02Case058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: StrFj212 = new StrFj212();
      let rResult1: string = obj.toString();
      let eExpected1: string = "x-y";
      expect(rResult1).assertEqual(eExpected1);
    });

  });
}
