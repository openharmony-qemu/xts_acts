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


class Item001 {
  name: string = "box";
}
class Item002 {
  private id: number = 1;
}
class Ls2Empty002 {}
class Ls2Point002 {
  private x: number;
  private y: number;
  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}
class Holder001 {
  private data: number = 7;
}
class Node002 {
  next: Node002 | null = null;
}
class Ls2Point003 {
  x: number = 3;
  y: number = 4;
}

export default function ObjectToLocaleString2Test(): void {
  describe("ObjectToLocaleString2Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_0100
     * @tc.name objectToLocaleStringPart02Case001
     * @tc.desc Verify toLocaleString with an empty string locale returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const result: String = obj.toLocaleString('');
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_0200
     * @tc.name objectToLocaleStringPart02Case002
     * @tc.desc Verify locale en and the no-arg call both return [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const en: String = obj.toLocaleString("en");
      const noArg: String = obj.toLocaleString();
      expect(en).assertEqual(noArg);
      expect(noArg).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_0300
     * @tc.name objectToLocaleStringPart02Case003
     * @tc.desc Verify toLocaleString with locales zh-CN and en both return [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const zh: String = obj.toLocaleString("zh-CN");
      const en: String = obj.toLocaleString("en");
      expect(zh).assertEqual(en);
      expect(zh).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_0400
     * @tc.name objectToLocaleStringPart02Case004
     * @tc.desc Verify toLocaleString with locales zh-CN and zh-cn both return [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const standard: String = obj.toLocaleString("zh-CN");
      const lower: String = obj.toLocaleString("zh-cn");
      expect(standard).assertEqual(lower);
      expect(standard).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_0500
     * @tc.name objectToLocaleStringPart02Case005
     * @tc.desc Verify toLocaleString with locale zh-Hant-TW returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const result: String = obj.toLocaleString("zh-Hant-TW");
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_0600
     * @tc.name objectToLocaleStringPart02Case006
     * @tc.desc Verify toLocaleString with locale pt-BR returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const result: String = obj.toLocaleString("pt-BR");
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_0700
     * @tc.name objectToLocaleStringPart02Case007
     * @tc.desc Verify locale en with omitted and undefined options both give [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const omitted: String = obj.toLocaleString("en");
      const withUndefined: String = obj.toLocaleString("en", undefined);
      expect(omitted).assertEqual(withUndefined);
      expect(omitted).assertEqual("[object Object]");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_0800
     * @tc.name objectToLocaleStringPart02Case008
     * @tc.desc Verify toLocaleString with undefined locales and options gives [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const result: String = obj.toLocaleString(undefined, undefined);
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_0900
     * @tc.name objectToLocaleStringPart02Case009
     * @tc.desc Verify locale zh-Hans-CN with undefined options returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const result: String = obj.toLocaleString("zh-Hans-CN", undefined);
      expect(result).assertEqual("[object Object]");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_1000
     * @tc.name objectToLocaleStringPart02Case010
     * @tc.desc Verify locale en with an empty options Object returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const options: Object = new Object();
      const result: String = obj.toLocaleString("en", options);
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_1100
     * @tc.name objectToLocaleStringPart02Case011
     * @tc.desc Verify locales en and zh-CN with an empty options Object agree on [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const options: Object = new Object();
      const rResult1: String = obj.toLocaleString("en", options);
      const rResult2: String = obj.toLocaleString("zh-CN", options);
      expect(rResult1).assertEqual("[object Object]");
      expect(rResult2).assertEqual("[object Object]");
      expect(rResult1).assertEqual(rResult2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_1200
     * @tc.name objectToLocaleStringPart02Case012
     * @tc.desc Verify locale en with a 24-field options Record returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const options: Record<string, Any> = {
        "localeMatcher": "lookup",
        "style": "currency",
        "currency": "USD",
        "currencyDisplay": "code",
        "currencySign": "accounting",
        "useGrouping": true,
        "minimumIntegerDigits": 2,
        "minimumFractionDigits": 2,
        "maximumFractionDigits": 3,
        "minimumSignificantDigits": 1,
        "maximumSignificantDigits": 21,
        "notation": "engineering",
        "compactDisplay": "long",
        "numberingSystem": "latn",
        "dateStyle": "full",
        "timeStyle": "medium",
        "weekday": "long",
        "year": "numeric",
        "month": "2-digit",
        "day": "2-digit",
        "hour12": false,
        "hourCycle": "h23",
        "timeZone": "UTC",
        "timeZoneName": "short",
      };
      const result: String = obj.toLocaleString("en", options);
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_1300
     * @tc.name objectToLocaleStringPart02Case013
     * @tc.desc Verify locale en with USD and CNY style options both return [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const o1: Record<string, Any> = { "style": "currency", "currency": "USD" };
      const o2: Record<string, Any> = { "style": "percent", "currency": "CNY" };
      const rResult1: String = obj.toLocaleString("en", o1);
      const rResult2: String = obj.toLocaleString("en", o2);
      expect(rResult1).assertEqual("[object Object]");
      expect(rResult2).assertEqual("[object Object]");
      expect(rResult1).assertEqual(rResult2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_1400
     * @tc.name objectToLocaleStringPart02Case014
     * @tc.desc Verify locale zh-CN with compact notation options matches the no-options call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const options: Record<string, Any> = { "notation": "compact", "timeZone": "UTC" };
      const rResult1: String = obj.toLocaleString("zh-CN", options);
      const rResult2: String = obj.toLocaleString("zh-CN");
      expect(rResult1).assertEqual("[object Object]");
      expect(rResult2).assertEqual("[object Object]");
      expect(rResult1).assertEqual(rResult2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_1500
     * @tc.name objectToLocaleStringPart02Case015
     * @tc.desc Verify locale en with decimal style options returns [object Object] three times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const options: Record<string, Any> = { "style": "decimal", "useGrouping": true };
      const rResult1: String = obj.toLocaleString("en", options);
      const rResult2: String = obj.toLocaleString("en", options);
      const rResult3: String = obj.toLocaleString("en", options);
      expect(rResult1).assertEqual("[object Object]");
      expect(rResult2).assertEqual("[object Object]");
      expect(rResult3).assertEqual("[object Object]");
      expect(rResult1).assertEqual(rResult2);
      expect(rResult2).assertEqual(rResult3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_1600
     * @tc.name objectToLocaleStringPart02Case016
     * @tc.desc Verify zh-CN with empty and 4-field options Objects both return [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const empty: Object = new Object();
      const full: Record<string, Any> = {
        "localeMatcher": "best fit",
        "style": "unit",
        "numberingSystem": "arab",
        "timeZoneName": "long",
      };
      const rResult1: String = obj.toLocaleString("zh-CN", empty);
      const rResult2: String = obj.toLocaleString("zh-CN", full);
      expect(rResult1).assertEqual("[object Object]");
      expect(rResult2).assertEqual("[object Object]");
      expect(rResult1).assertEqual(rResult2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_1700
     * @tc.name objectToLocaleStringPart02Case017
     * @tc.desc Verify toLocaleString of new Object uppercased equals [OBJECT OBJECT]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const result: String = obj.toLocaleString();
      let rResult1: string = result.toUpperCase();
      let eExpected1: string = "[OBJECT OBJECT]";
      expect(rResult1).assertEqual(eExpected1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_1800
     * @tc.name objectToLocaleStringPart02Case018
     * @tc.desc Verify an inline new Object toLocaleString call returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: String = new Object().toLocaleString();
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_1900
     * @tc.name objectToLocaleStringPart02Case019
     * @tc.desc Verify toLocaleString of Record returns "count,3"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, number> = { "count": 3 };
      const obj: Object = rec as Object;
      const result: String = obj.toLocaleString();
      expect(result).assertEqual("count,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_2000
     * @tc.name objectToLocaleStringPart02Case020
     * @tc.desc Verify toLocaleString of nested Record returns "node,x,1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Record<string, number> = { 'x': 1 };
      const outer: Record<string, Object> = { "node": inner as Object };
      const obj: Object = outer as Object;
      const result: String = obj.toLocaleString();
      expect(result).assertEqual("node,x,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_2100
     * @tc.name objectToLocaleStringPart02Case021
     * @tc.desc Verify toLocaleString of Record with locales returns "a,1,b,2"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, number> = { 'a': 1, 'b': 2 };
      const obj: Object = rec as Object;
      const result: String = obj.toLocaleString("zh-CN");
      expect(result).assertEqual("a,1,b,2");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_2200
     * @tc.name objectToLocaleStringPart02Case022
     * @tc.desc Verify an Item001 with zh-CN and minimumIntegerDigits 2 gives [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item: Item001 = new Item001();
      const opts: Record<string, number> = { "minimumIntegerDigits": 2 };
      const result: String = item.toLocaleString("zh-CN", opts);
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_2300
     * @tc.name objectToLocaleStringPart02Case023
     * @tc.desc Verify toLocaleString of an empty number array returns an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      const result: String = arr.toLocaleString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_2400
     * @tc.name objectToLocaleStringPart02Case024
     * @tc.desc Verify locale en with an inline new Object options arg returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const result: String = obj.toLocaleString("en", new Object());
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_2500
     * @tc.name objectToLocaleStringPart02Case025
     * @tc.desc Verify locale en with an options Record holding a Date returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const opts: Record<string, Object> = { "when": new Date() as Object };
      const result: String = obj.toLocaleString("en", opts);
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_2600
     * @tc.name objectToLocaleStringPart02Case026
     * @tc.desc Verify toLocaleString with the locale array en returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const result: String = obj.toLocaleString(["en"]);
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_2700
     * @tc.name objectToLocaleStringPart02Case027
     * @tc.desc Verify locale array en zh-CN with minimumIntegerDigits 2 returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const opts: Record<string, number> = { "minimumIntegerDigits": 2 };
      const result: String = obj.toLocaleString(["en", "zh-CN"], opts);
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_2800
     * @tc.name objectToLocaleStringPart02Case028
     * @tc.desc Verify locale arrays EN ZH-CN and en zh-CN both return [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const upper: String = obj.toLocaleString(["EN", "ZH-CN"]);
      const lower: String = obj.toLocaleString(["en", "zh-CN"]);
      expect(upper).assertEqual(lower);
      expect(upper).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_2900
     * @tc.name objectToLocaleStringPart02Case029
     * @tc.desc Verify locale array en zh-CN with an Object options matches the no-arg call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const full: String = obj.toLocaleString(["en", "zh-CN"], new Object());
      const none: String = obj.toLocaleString();
      expect(full).assertEqual(none);
      expect(none).assertEqual("[object Object]");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_3000
     * @tc.name objectToLocaleStringPart02Case030
     * @tc.desc Verify toLocaleString locales ["en", "zh-CN"] length 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const opts: Record<string, number> = { "maximumFractionDigits": 3 };
      const result: String = obj.toLocaleString(["en", "zh-CN"], opts);
      let rResult1: int = result.length;
      let eExpected1: int = 15;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_3100
     * @tc.name objectToLocaleStringPart02Case031
     * @tc.desc Verify toLocaleString of a new Object equals its toString result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const result: String = obj.toLocaleString();
      const strResult: String = obj.toString();
      expect(result).assertEqual(strResult);
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_3200
     * @tc.name objectToLocaleStringPart02Case032
     * @tc.desc Verify toLocaleString of Record equals toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, Object> = {};
      rec["item"] = new Item002() as Object;
      const obj: Object = rec as Object;
      const result: String = obj.toLocaleString();
      expect(result).assertEqual(obj.toString());
      expect(result).assertEqual("item,[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_3300
     * @tc.name objectToLocaleStringPart02Case033
     * @tc.desc Verify toLocaleString of Array returns "1,2,3"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3];
      const obj: Object = arr as Object;
      const result: String = obj.toLocaleString();
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_3400
     * @tc.name objectToLocaleStringPart02Case034
     * @tc.desc Verify toLocaleString on array viewed as Object joins elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b', 'c'];
      const obj: Object = arr as Object;
      const result: String = obj.toLocaleString();
      expect(result).assertEqual("a,b,c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_3500
     * @tc.name objectToLocaleStringPart02Case035
     * @tc.desc Verify toLocaleString of Array with Record element returns "[object Object],k,1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<Object> = new Array<Object>();
      arr.push(new Object());
      const recObj: Record<string, Any> = { 'k': 1 };
      arr.push(recObj);
      const obj: Object = arr as Object;
      const result: String = obj.toLocaleString();
      expect(result).assertEqual("[object Object],k,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_3600
     * @tc.name objectToLocaleStringPart02Case036
     * @tc.desc Verify toLocaleString on class instance returns object tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ins: Object = new Ls2Empty002() as Object;
      const result: String = ins.toLocaleString();
      expect(result).assertEqual("[object Object]");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_3700
     * @tc.name objectToLocaleStringPart02Case037
     * @tc.desc Verify toLocaleString of a class with private x 3 y 4 returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ins: Object = new Ls2Point002(3, 4) as Object;
      const result: String = ins.toLocaleString();
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_3800
     * @tc.name objectToLocaleStringPart02Case038
     * @tc.desc Verify toLocaleString of a single-key Record viewed as Object returns a,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const recA: Record<string, number> = { 'a': 1 };
      const objA: Object = recA as Object;
      let rResult1: string = objA.toLocaleString();
      let eExpected1: string = "a,1";
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_3900
     * @tc.name objectToLocaleStringPart02Case039
     * @tc.desc Verify toLocaleString of a Holder001 with the zh-CN array returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ins: Object = new Holder001() as Object;
      const result: String = ins.toLocaleString(["zh-CN"]);
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_4000
     * @tc.name objectToLocaleStringPart02Case040
     * @tc.desc Verify toLocaleString with the locale array en-US has length 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const result: String = obj.toLocaleString(["en-US"]);
      let rResult1: int = result.length;
      let eExpected1: int = 15;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_4100
     * @tc.name objectToLocaleStringPart02Case041
     * @tc.desc Verify toLocaleString on nested Record equals toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const l3: Record<string, number> = { 'x': 1 };
      const l2: Record<string, Object> = { "child": l3 as Object };
      const l1: Record<string, Object> = { "child": l2 as Object };
      const obj: Object = l1 as Object;
      const result: String = obj.toLocaleString();
      expect(result).assertEqual(obj.toString());
      expect(result).assertEqual("child,child,x,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_4200
     * @tc.name objectToLocaleStringPart02Case042
     * @tc.desc Verify toLocaleString with zh-CN locale of a three-level nested Record returns child,child,x,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const l3: Record<string, number> = { 'x': 1 };
      const l2: Record<string, Object> = { "child": l3 as Object };
      const l1: Record<string, Object> = { "child": l2 as Object };
      const obj: Object = l1 as Object;
      const result: String = obj.toLocaleString(["zh-CN"]);
      expect(result).assertEqual("child,child,x,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_4300
     * @tc.name objectToLocaleStringPart02Case043
     * @tc.desc Verify toLocaleString of a self-referencing Node002 returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const node: Node002 = new Node002();
      node.next = node;
      const obj: Object = node as Object;
      const result: String = obj.toLocaleString();
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_4400
     * @tc.name objectToLocaleStringPart02Case044
     * @tc.desc Verify toLocaleString of nested Record returns "first,a,1,second,b,2"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const deep1: Record<string, number> = { 'a': 1 };
      const deep2: Record<string, number> = { 'b': 2 };
      const top: Record<string, Object> = { "first": deep1 as Object, "second": deep2 as Object };
      const obj: Object = top as Object;
      const result: String = obj.toLocaleString();
      expect(result).assertEqual("first,a,1,second,b,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_4500
     * @tc.name objectToLocaleStringPart02Case045
     * @tc.desc Verify toLocaleString of a new Object returns the tag with a stable hash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const before: number = obj.$_hashCode();
      const result: String = obj.toLocaleString();
      const after: number = obj.$_hashCode();
      expect(result).assertEqual("[object Object]");
      expect(before).assertEqual(after);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_4600
     * @tc.name objectToLocaleStringPart02Case046
     * @tc.desc Verify $_hashCode is non-negative and toLocaleString matches toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const hash: number = obj.$_hashCode();
      const result: String = obj.toLocaleString();
      expect(hash).assertLargerOrEqual(0);
      expect(result).assertEqual(obj.toString());
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_4700
     * @tc.name objectToLocaleStringPart02Case047
     * @tc.desc Verify toLocaleString of a new Object gives the tag and Object.keys is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const result: String = obj.toLocaleString();
      const keys: string[] = Object.keys(obj);
      expect(result).assertEqual("[object Object]");
      let rResult1: int = keys.length;
      let eExpected1: int = 0;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_4800
     * @tc.name objectToLocaleStringPart02Case048
     * @tc.desc Verify a two-key Record has 2 keys and toLocaleString returns a,1,b,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, Any> = { 'a': 1, 'b': 2 };
      const keys: string[] = Object.keys(rec);
      const obj: Object = rec as Object;
      const result: String = obj.toLocaleString();
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      expect(result).assertEqual("a,1,b,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_4900
     * @tc.name objectToLocaleStringPart02Case049
     * @tc.desc Verify Ls2Point003 has 2 keys while toLocaleString returns [object Object]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ins: Object = new Ls2Point003() as Object;
      const keys: string[] = Object.keys(ins);
      const result: String = ins.toLocaleString();
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      expect(result).assertEqual("[object Object]");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_5000
     * @tc.name objectToLocaleStringPart02Case050
     * @tc.desc Verify $_hashCode and toLocaleString of an Object stay the same across two calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const h1: number = obj.$_hashCode();
      const rResult1: String = obj.toLocaleString();
      const h2: number = obj.$_hashCode();
      const rResult2: String = obj.toLocaleString();
      expect(h1).assertEqual(h2);
      expect(rResult1).assertEqual(rResult2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_5100
     * @tc.name objectToLocaleStringPart02Case051
     * @tc.desc Verify a string array a b has 2 keys and toLocaleString returns a,b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b'];
      const keys: string[] = Object.keys(arr);
      const obj: Object = arr as Object;
      const result: String = obj.toLocaleString();
      let rResult1: int = keys.length;
      let eExpected1: int = 2;
      expect(rResult1).assertEqual(eExpected1);
      expect(result).assertEqual("a,b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_5200
     * @tc.name objectToLocaleStringPart02Case052
     * @tc.desc Verify a nested Record keeps a stable $_hashCode and yields child,x,1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Record<string, number> = { 'x': 1 };
      const outer: Record<string, Object> = { "child": inner as Object };
      const obj: Object = outer as Object;
      const hash: number = obj.$_hashCode();
      const result: String = obj.toLocaleString();
      expect(hash).assertEqual(obj.$_hashCode());
      expect(result).assertEqual("child,x,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_5300
     * @tc.name objectToLocaleStringPart02Case053
     * @tc.desc Verify a single-key Record has 1 key and stable toLocaleString calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rec: Record<string, Any> = { 'a': 1 };
      const obj: Object = rec as Object;
      const r1: String = obj.toLocaleString();
      const keys: string[] = Object.keys(rec);
      const r2: String = obj.toLocaleString();
      expect(r1).assertEqual(r2);
      let rResult1: int = keys.length;
      let eExpected1: int = 1;
      expect(rResult1).assertEqual(eExpected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_5400
     * @tc.name objectToLocaleStringPart02Case054
     * @tc.desc Verify toLocaleString of Record forwards to toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = { "name": "ArkTS" };
      const result: String = record.toLocaleString();
      const strResult: String = record.toString();
      expect(result).assertEqual(strResult);
      expect(result).assertEqual("name,ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_5500
     * @tc.name objectToLocaleStringPart02Case055
     * @tc.desc Verify toLocaleString of array forwards to toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      const result: String = arr.toLocaleString();
      const strResult: String = arr.toString();
      expect(result).assertEqual(strResult);
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_5600
     * @tc.name objectToLocaleStringPart02Case056
     * @tc.desc Verify toLocaleString of number 42 matches its toString result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num: number = 42;
      const result: String = num.toLocaleString();
      const strResult: String = num.toString();
      expect(result).assertEqual(strResult);
      expect(result).assertEqual("42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_5700
     * @tc.name objectToLocaleStringPart02Case057
     * @tc.desc Verify toLocaleString of boolean matches its toString result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: boolean = true;
      const result: String = b.toLocaleString();
      const strResult: String = b.toString();
      expect(result).assertEqual(strResult);
      expect(result).assertEqual("true");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_5800
     * @tc.name objectToLocaleStringPart02Case058
     * @tc.desc Verify toLocaleString of string matches its toString result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = "hello";
      const result: String = s.toLocaleString();
      const strResult: String = s.toString();
      expect(result).assertEqual(strResult);
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_5900
     * @tc.name objectToLocaleStringPart02Case059
     * @tc.desc Verify toLocaleString of new Object has length 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const result: String = obj.toLocaleString();
      expect(result.length).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_6000
     * @tc.name objectToLocaleStringPart02Case060
     * @tc.desc Verify toLocaleString stable across repeated calls with locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Object = new Object();
      const rResult1: String = obj.toLocaleString("en");
      const rResult2: String = obj.toLocaleString("en");
      expect(rResult1).assertEqual(rResult2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_6100
     * @tc.name objectToLocaleStringPart02Case061
     * @tc.desc Verify toLocaleString of nested array forwards to toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<Array<number>> = [
        [1, 2],
        [3, 4],
      ];
      const result: String = arr.toLocaleString();
      const strResult: String = arr.toString();
      expect(result).assertEqual(strResult);
      expect(result).assertEqual("1,2,3,4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_6200
     * @tc.name objectToLocaleStringPart02Case062
     * @tc.desc Verify toLocaleString of Record with added field returns "k,1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Record<string, Any> = {};
      obj['k'] = 1;
      const result: String = obj.toLocaleString();
      expect(result).assertEqual("k,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_6300
     * @tc.name objectToLocaleStringPart02Case063
     * @tc.desc Verify toLocaleString of array with null element forwards to toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | null> = [1, null, 3];
      const result: String = arr.toLocaleString();
      const strResult: String = arr.toString();
      expect(result).assertEqual(strResult);
      expect(result).assertEqual("1,,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_6400
     * @tc.name objectToLocaleStringPart02Case064
     * @tc.desc Verify toLocaleString of boolean false forwards to toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: boolean = false;
      const result: String = b.toLocaleString();
      const strResult: String = b.toString();
      expect(result).assertEqual(strResult);
      expect(result).assertEqual("false");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_6500
     * @tc.name objectToLocaleStringPart02Case065
     * @tc.desc Verify toLocaleString of 100-key Record stable forwards to toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const record: Record<string, Any> = {};
      for (let i: int = 0; i < 100; i++) {
        record['k' + i] = i;
      }
      const result: String = record.toLocaleString();
      const strResult: String = record.toString();
      expect(result).assertEqual(strResult);
      expect(result.toString().length).assertEqual(679);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_6600
     * @tc.name objectToLocaleStringPart02Case066
     * @tc.desc Verify toLocaleString of array with object elements forwards to toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: Record<string, Any> = { 'x': 1 };
      const arr: Array<Record<string, Any>> = [inner];
      const result: String = arr.toLocaleString();
      const strResult: String = arr.toString();
      expect(result).assertEqual(strResult);
      expect(result).assertEqual("x,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_6700
     * @tc.name objectToLocaleStringPart02Case067
     * @tc.desc Verify toLocaleString of negative number forwards to toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num: number = -7;
      const result: String = num.toLocaleString();
      const strResult: String = num.toString();
      expect(result).assertEqual(strResult);
      expect(result).assertEqual("-7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECTTOLOCALESTRING_Part02_6800
     * @tc.name objectToLocaleStringPart02Case068
     * @tc.desc Verify toLocaleString of array with mixed element types forwards to toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("objectToLocaleStringPart02Case068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | string> = [1, 'a', 2];
      const result: String = arr.toLocaleString();
      const strResult: String = arr.toString();
      expect(result).assertEqual(strResult);
      expect(result).assertEqual("1,a,2");
    });
  });
}
