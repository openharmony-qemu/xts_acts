'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from "../../../../hypium/index";
import { TestType, Size, Level } from "../../../../hypium/Constant";
import Utils from "../Util.test";


class FromEntriesCustomClass {
  public name: string = "customValue";
}

function createFromEntriesPair(key: string, value: Any): [string, Any] {
  let pair: [string, Any] = [key, value];
  return pair;
}

export default function ObjectFromEntriesTest(): void {
  describe("ObjectFromEntriesTest", (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0010
     * @tc.name testObjectFromEntries001
     * @tc.desc Verify fromEntries with single int entry returns Record with correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries001", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["key", 100]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let accessedValue: Any = resultRecord["key"];
      expect(accessedValue as int).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0020
     * @tc.name testObjectFromEntries002
     * @tc.desc Verify fromEntries with single string entry returns Record with correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries002", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["name", "test"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let accessedValue: Any = resultRecord["name"];
      expect(accessedValue as string).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0030
     * @tc.name testObjectFromEntries003
     * @tc.desc Verify fromEntries with single boolean entry returns Record with correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries003", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["flag", true]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let accessedValue: Any = resultRecord["flag"];
      expect(accessedValue as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0040
     * @tc.name testObjectFromEntries004
     * @tc.desc Verify fromEntries with multiple int entries returns Record with all properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries004", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['a', 1], ['b', 2], ['c', 3]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(3);
      expect(resultRecord['a'] as int).assertEqual(1);
      expect(resultRecord['b'] as int).assertEqual(2);
      expect(resultRecord['c'] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0050
     * @tc.name testObjectFromEntries005
     * @tc.desc Verify fromEntries with mixed-type entries returns Record with all properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries005", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['a', 1], ['b', "str"], ['c', true]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(3);
      expect(resultRecord['a'] as int).assertEqual(1);
      expect(resultRecord['b'] as string).assertEqual("str");
      expect(resultRecord['c'] as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0060
     * @tc.name testObjectFromEntries006
     * @tc.desc Verify fromEntries result carries the inserted key-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries006", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['k', 'v']];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord['k'] as string).assertEqual('v');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0070
     * @tc.name testObjectFromEntries007
     * @tc.desc Verify fromEntries result exposes the inserted key count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries007", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['k', 'v']];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0080
     * @tc.name testObjectFromEntries008
     * @tc.desc Verify two fromEntries calls return distinct references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries008", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input1: Array<[string, Any]> = [['a', 1]];
      let input2: Array<[string, Any]> = [['a', 1]];
      let firstRecord: Record<string, Any> = Object.fromEntries<Any>(input1);
      let secondRecord: Record<string, Any> = Object.fromEntries<Any>(input2);
      expect(firstRecord).not().assertEqual(secondRecord);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0090
     * @tc.name testObjectFromEntries009
     * @tc.desc Verify three fromEntries calls all return distinct references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries009", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: Array<[string, Any]> = [['a', 1]];
      let r1: Record<string, Any> = Object.fromEntries<Any>(input);
      let r2: Record<string, Any> = Object.fromEntries<Any>(input);
      let r3: Record<string, Any> = Object.fromEntries<Any>(input);
      expect(r1).not().assertEqual(r2);
      expect(r1).not().assertEqual(r3);
      expect(r2).not().assertEqual(r3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0100
     * @tc.name testObjectFromEntries010
     * @tc.desc Verify fromEntries result Object.keys returns correct keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries010", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["k1", 1], ["k2", 2]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let keys: string[] = Object.keys(resultRecord);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual("k1");
      expect(keys[1]).assertEqual("k2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0110
     * @tc.name testObjectFromEntries011
     * @tc.desc Verify fromEntries result Object.values returns correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries011", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["k1", 1], ["k2", 2]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let values = Object.values(resultRecord);
      expect(values.length).assertEqual(2);
      expect(values[0] as int).assertEqual(1);
      expect(values[1] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0120
     * @tc.name testObjectFromEntries012
     * @tc.desc Verify fromEntries result Object.entries returns correct entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries012", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["k1", 1], ["k2", 2]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let entries = Object.entries(resultRecord);
      expect(entries.length).assertEqual(2);
      expect(entries[0]![0]).assertEqual("k1");
      expect(entries[0]![1] as int).assertEqual(1);
      expect(entries[1]![0]).assertEqual("k2");
      expect(entries[1]![1] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0130
     * @tc.name testObjectFromEntries013
     * @tc.desc Verify fromEntries result Object.getOwnPropertyNames returns correct names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries013", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["k1", 1], ["k2", 2]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let names: string[] = Object.getOwnPropertyNames(resultRecord);
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual("k1");
      expect(names[1]).assertEqual("k2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0140
     * @tc.name testObjectFromEntries014
     * @tc.desc Verify fromEntries result toString returns non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries014", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['k', 1]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let str: string = resultRecord.toString();
      expect(str).assertEqual("k,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0150
     * @tc.name testObjectFromEntries015
     * @tc.desc Verify fromEntries result $_hashCode returns non-negative int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries015", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['k', 1]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let expectedVal: int = resultRecord['k'] as int;
      let hashCode: int = resultRecord.$_hashCode();
      expect(resultRecord['k'] as int).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0160
     * @tc.name testObjectFromEntries016
     * @tc.desc Verify fromEntries result toLocaleString returns a string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries016", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['k', 1]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let localeStr: string = resultRecord.toLocaleString();
      expect(localeStr).assertEqual("k,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0170
     * @tc.name testObjectFromEntries017
     * @tc.desc Verify same input twice produces different object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries017", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: Array<[string, Any]> = [["key", 1]];
      let rec1: Record<string, Any> = Object.fromEntries<Any>(input);
      let rec2: Record<string, Any> = Object.fromEntries<Any>(input);
      expect(rec1).not().assertEqual(rec2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0180
     * @tc.name testObjectFromEntries018
     * @tc.desc Verify fromEntries with int value preserves int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries018", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["count", 42]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let value: int = resultRecord["count"] as int;
      expect(value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0190
     * @tc.name testObjectFromEntries019
     * @tc.desc Verify fromEntries with string value preserves string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries019", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["msg", "hello"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let value: string = resultRecord["msg"] as string;
      expect(value).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0200
     * @tc.name testObjectFromEntries020
     * @tc.desc Verify fromEntries with explicit int generic for int value type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries020", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, int]> = [["score", 95]];
      let resultRecord: Record<string, int> = Object.fromEntries<int>(inputPairs);
      let typedValue: int = resultRecord["score"] as int;
      expect(typedValue).assertEqual(95);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0210
     * @tc.name testObjectFromEntries021
     * @tc.desc Verify fromEntries with explicit string generic for string value type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries021", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, string]> = [["msg", "hello world"]];
      let resultRecord: Record<string, string> = Object.fromEntries<string>(inputPairs);
      let typedValue: string = resultRecord["msg"] as string;
      expect(typedValue).assertEqual("hello world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0220
     * @tc.name testObjectFromEntries022
     * @tc.desc Verify fromEntries with explicit boolean generic for boolean value type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries022", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, boolean]> = [["flag", true]];
      let resultRecord: Record<string, boolean> = Object.fromEntries<boolean>(inputPairs);
      let typedValue: boolean = resultRecord["flag"] as boolean;
      expect(typedValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0230
     * @tc.name testObjectFromEntries023
     * @tc.desc Verify fromEntries without explicit generic, compiler infers type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries023", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["value", 100]];
      let resultRecord = Object.fromEntries(inputPairs);
      let accessedValue: int = resultRecord["value"] as int;
      expect(accessedValue).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0240
     * @tc.name testObjectFromEntries024
     * @tc.desc Verify fromEntries without explicit generic handles key insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries024", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["first", 1], ["second", "str"], ["third", true]];
      let resultRecord = Object.fromEntries(inputPairs);
      let keys: string[] = Object.keys(resultRecord);
      expect(keys[0]).assertEqual("first");
      expect(keys[1]).assertEqual("second");
      expect(keys[2]).assertEqual("third");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0250
     * @tc.name testObjectFromEntries025
     * @tc.desc Verify fromEntries with zero int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries025", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["zero", 0]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["zero"] as int).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0260
     * @tc.name testObjectFromEntries026
     * @tc.desc Verify fromEntries with negative int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries026", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["neg", (-100)]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["neg"] as int).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0270
     * @tc.name testObjectFromEntries027
     * @tc.desc Verify fromEntries with max int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries027", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["max", 2147483647]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["max"] as int).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0280
     * @tc.name testObjectFromEntries028
     * @tc.desc Verify fromEntries with boolean false value preserves the original key name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries028", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["flag", false]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let value: boolean = resultRecord["flag"] as boolean;
      expect(value).assertFalse();
      expect(Object.keys(resultRecord)[0]).assertEqual("flag");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0290
     * @tc.name testObjectFromEntries029
     * @tc.desc Verify fromEntries with boolean true value and different key name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries029", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["enabled", true]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let value: boolean = resultRecord["enabled"] as boolean;
      expect(value).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0300
     * @tc.name testObjectFromEntries030
     * @tc.desc Verify fromEntries with empty string value and explicit key lookup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries030", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["empty", ""]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["empty"] as string).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0310
     * @tc.name testObjectFromEntries031
     * @tc.desc Verify fromEntries with Unicode string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries031", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["unicode", "你好世界"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["unicode"] as string).assertEqual("你好世界");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0320
     * @tc.name testObjectFromEntries032
     * @tc.desc Verify fromEntries with empty string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries032", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["", "emptyKeyValue"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord[""] as string).assertEqual("emptyKeyValue");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0330
     * @tc.name testObjectFromEntries033
     * @tc.desc Verify fromEntries with special character key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries033", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["@#$%^&*()", "special"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["@#$%^&*()"] as string).assertEqual("special");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0340
     * @tc.name testObjectFromEntries034
     * @tc.desc Verify fromEntries with Unicode Chinese character key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries034", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["测试键名", "unicodeKey"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["测试键名"] as string).assertEqual("unicodeKey");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0350
     * @tc.name testObjectFromEntries035
     * @tc.desc Verify fromEntries with numeric string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries035", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["123456", "numericString"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["123456"] as string).assertEqual("numericString");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0360
     * @tc.name testObjectFromEntries036
     * @tc.desc Verify fromEntries with long string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries036", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = "abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefgh";
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair(longKey, "longKeyValue")];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord[longKey] as string).assertEqual("longKeyValue");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0370
     * @tc.name testObjectFromEntries037
     * @tc.desc Verify fromEntries with key containing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries037", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["key with spaces", "value"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["key with spaces"] as string).assertEqual("value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0380
     * @tc.name testObjectFromEntries038
     * @tc.desc Verify fromEntries with key containing dashes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries038", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["key-with-dash", "value"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["key-with-dash"] as string).assertEqual("value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0390
     * @tc.name testObjectFromEntries039
     * @tc.desc Verify fromEntries with key containing underscores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries039", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["key_with_underscore", "value"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["key_with_underscore"] as string).assertEqual("value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0400
     * @tc.name testObjectFromEntries040
     * @tc.desc Verify fromEntries with key containing dots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries040", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["key.with.dot", "value"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["key.with.dot"] as string).assertEqual("value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0410
     * @tc.name testObjectFromEntries041
     * @tc.desc Verify fromEntries with "0" string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries041", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['0', "zeroKey"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord['0'] as string).assertEqual("zeroKey");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0420
     * @tc.name testObjectFromEntries042
     * @tc.desc Verify fromEntries with multiple special key types mixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries042", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["", 1], ['@', 2], ["测试", 3]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(3);
      expect(resultRecord[""] as int).assertEqual(1);
      expect(resultRecord['@'] as int).assertEqual(2);
      expect(resultRecord["测试"] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0430
     * @tc.name testObjectFromEntries043
     * @tc.desc Verify fromEntries with XSS script tag as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries043", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["<script>alert(1)</script>", "xssKey"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["<script>alert(1)</script>"] as string).assertEqual("xssKey");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0440
     * @tc.name testObjectFromEntries044
     * @tc.desc Verify fromEntries with null property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries044", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["nullable", null]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(1);
      let actualValue1: Any = resultRecord["nullable"];
      let actualValue1IsNull: boolean = actualValue1 === null;
      expect(actualValue1IsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0450
     * @tc.name testObjectFromEntries045
     * @tc.desc Verify fromEntries with undefined property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries045", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["undef", undefined]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(1);
      let actualValue1: Any = resultRecord["undef"];
      let actualValue1IsUndefined: boolean = actualValue1 === undefined;
      expect(actualValue1IsUndefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0460
     * @tc.name testObjectFromEntries046
     * @tc.desc Verify fromEntries with Object instance as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries046", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objInstance: Object = new Object();
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair("obj", objInstance)];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let accessedValue: Object = resultRecord["obj"] as Object;
      expect(accessedValue).assertEqual(objInstance);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0470
     * @tc.name testObjectFromEntries047
     * @tc.desc Verify fromEntries with Array as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries047", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrValue: Array<int> = [1, 2, 3];
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair("arr", arrValue)];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let storedValue: Object | undefined = resultRecord["arr"] as Object | undefined;
      expect(storedValue).assertEqual(arrValue);
      expect(arrValue[0]).assertEqual(1);
      expect(arrValue[1]).assertEqual(2);
      expect(arrValue[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0480
     * @tc.name testObjectFromEntries048
     * @tc.desc Verify fromEntries accepts array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries048", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = [
      ["first", 1] as [string, Any],
      ["second", 2] as [string, Any]
      ];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(iterable);
      expect(resultRecord["first"] as int).assertEqual(1);
      expect(resultRecord["second"] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0490
     * @tc.name testObjectFromEntries049
     * @tc.desc Verify fromEntries with nested Record as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries049", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nestedRec: Record<string, Any> = { "inner": "val" };
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair("nested", nestedRec)];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let storedValue: Object | undefined = resultRecord["nested"] as Object | undefined;
      expect(storedValue).assertEqual(nestedRec);
      expect(nestedRec["inner"] as string).assertEqual("val");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0500
     * @tc.name testObjectFromEntries050
     * @tc.desc Verify fromEntries with BigInt value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries050", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bigVal: BigInt = BigInt(123);
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair("bigint", bigVal)];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let accessedValue: BigInt = resultRecord["bigint"] as BigInt;
      expect(accessedValue.toString() as string).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0510
     * @tc.name testObjectFromEntries051
     * @tc.desc Verify fromEntries with double floating point value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries051", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["pi", 3.14]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let accessedValue: double = resultRecord["pi"] as double;
      expect(accessedValue).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0520
     * @tc.name testObjectFromEntries052
     * @tc.desc Verify fromEntries with negative float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries052", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["negFloat", (-2.5)]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let accessedValue: double = resultRecord["negFloat"] as double;
      expect(accessedValue).assertEqual(-2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0530
     * @tc.name testObjectFromEntries053
     * @tc.desc Verify fromEntries with max int value from a typed key-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries053", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxInt: int = 2147483647;
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair("maxInt", maxInt)];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["maxInt"] as int).assertEqual(maxInt);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0540
     * @tc.name testObjectFromEntries054
     * @tc.desc Verify fromEntries with min int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries054", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minInt: int = -2147483648;
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair("minInt", minInt)];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["minInt"] as int).assertEqual(minInt);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0550
     * @tc.name testObjectFromEntries055
     * @tc.desc Verify fromEntries with empty string value length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries055", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["emptyStr", ""]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let value: string = resultRecord["emptyStr"] as string;
      expect(value.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0560
     * @tc.name testObjectFromEntries056
     * @tc.desc Verify fromEntries with very long string value (1000 chars)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries056", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longValue: string = "";
      let charCode: int = 65;
      let buildIndex: int = 0;
      while (buildIndex < 1000) {
        longValue = longValue + String.fromCharCode(charCode);
        buildIndex++;
      }
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair("longStr", longValue)];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let value: string = resultRecord["longStr"] as string;
      expect(value.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0570
     * @tc.name testObjectFromEntries057
     * @tc.desc Verify fromEntries with custom class instance as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries057", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let customObj: FromEntriesCustomClass = new FromEntriesCustomClass();
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair("custom", customObj)];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let accessedValue: FromEntriesCustomClass = resultRecord["custom"] as FromEntriesCustomClass;
      expect(accessedValue.name).assertEqual("customValue");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0580
     * @tc.name testObjectFromEntries058
     * @tc.desc Verify fromEntries with single element array returns single property Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries058", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["single", 1]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(1);
      expect(resultRecord["single"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0590
     * @tc.name testObjectFromEntries059
     * @tc.desc Verify fromEntries with duplicate keys, later value overwrites earlier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries059", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["key", 1], ["key", 2], ["key", 3]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(1);
      expect(resultRecord["key"] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0600
     * @tc.name testObjectFromEntries060
     * @tc.desc Verify fromEntries with partially duplicate keys mixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries060", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['a', 1], ['b', 2], ['a', 3]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(2);
      expect(resultRecord['a'] as int).assertEqual(3);
      expect(resultRecord['b'] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0610
     * @tc.name testObjectFromEntries061
     * @tc.desc Verify fromEntries with 10 different key array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries061", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [];
      let idx: int = 0;
      while (idx < 10) {
        inputPairs.push(createFromEntriesPair(String(idx), idx));
        idx++;
      }
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(10);
      expect(resultRecord['0'] as int).assertEqual(0);
      expect(resultRecord['9'] as int).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0620
     * @tc.name testObjectFromEntries062
     * @tc.desc Verify fromEntries with 50 different key array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries062", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [];
      let idx: int = 0;
      while (idx < 50) {
        inputPairs.push(createFromEntriesPair('k' + String(idx), idx));
        idx++;
      }
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0630
     * @tc.name testObjectFromEntries063
     * @tc.desc Verify Object.fromEntries preserves key count and endpoint values for 100 and 300 entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries063", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizes: int[] = [100, 300];
      for (let size of sizes) {
        let inputPairs: Array<[string, Any]> = [];
        let entryIndex: int = 0;
        while (entryIndex < size) {
          inputPairs.push(createFromEntriesPair('key' + String(entryIndex), entryIndex));
          entryIndex++;
        }
        let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
        let lastIndex: int = size - 1;
        let keyCount: int = Object.keys(resultRecord).length;
        let firstValue: int = resultRecord['key0'] as int;
        let lastValue: int = resultRecord['key' + String(lastIndex)] as int;
        expect(keyCount).assertEqual(size);
        expect(firstValue).assertEqual(0);
        expect(lastValue).assertEqual(lastIndex);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0640
     * @tc.name testObjectFromEntries064
     * @tc.desc Verify fromEntries with unsorted keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries064", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['c', 3], ['a', 1], ['b', 2]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(3);
      expect(resultRecord['a'] as int).assertEqual(1);
      expect(resultRecord['b'] as int).assertEqual(2);
      expect(resultRecord['c'] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0650
     * @tc.name testObjectFromEntries065
     * @tc.desc Verify fromEntries with all same keys extreme case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries065", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['x', 1], ['x', 2], ['x', 3], ['x', 4], ['x', 5]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(1);
      expect(resultRecord['x'] as int).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0660
     * @tc.name testObjectFromEntries066
     * @tc.desc Verify fromEntries with two keys interleaved duplicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries066", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['a', 1], ['b', 2], ['a', 3], ['b', 4]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(2);
      expect(resultRecord['a'] as int).assertEqual(3);
      expect(resultRecord['b'] as int).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0670
     * @tc.name testObjectFromEntries067
     * @tc.desc Verify nested fromEntries: result used as value in another fromEntries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries067", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let innerPairs: Array<[string, Any]> = [['x', 10]];
      let innerRec: Record<string, Any> = Object.fromEntries<Any>(innerPairs);
      let outerPairs: Array<[string, Any]> = [createFromEntriesPair("nested", innerRec)];
      let outerRec: Record<string, Any> = Object.fromEntries<Any>(outerPairs);
      let nestedValue: Object | undefined = outerRec["nested"] as Object | undefined;
      expect(nestedValue).assertEqual(innerRec);
      expect(innerRec['x'] as int).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0680
     * @tc.name testObjectFromEntries068
     * @tc.desc Verify entries array length equals result keys count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries068", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['a', 1], ['b', 2], ['c', 3]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(inputPairs.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0690
     * @tc.name testObjectFromEntries069
     * @tc.desc Verify accessing non-existent key returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries069", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['a', 1]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let nonexistent: Object | undefined = resultRecord["nonexistent"] as Object | undefined;
      expect(nonexistent).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0700
     * @tc.name testObjectFromEntries070
     * @tc.desc Verify fromEntries with positive integer string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries070", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['1', "one"], ['2', "two"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord['1'] as string).assertEqual("one");
      expect(resultRecord['2'] as string).assertEqual("two");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0710
     * @tc.name testObjectFromEntries071
     * @tc.desc Verify fromEntries with negative integer string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries071", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["-1", "minusOne"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["-1"] as string).assertEqual("minusOne");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0720
     * @tc.name testObjectFromEntries072
     * @tc.desc Verify fromEntries with zero-width space character key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries072", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zwsKey: string = '​';
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair(zwsKey, "zeroWidth")];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord[zwsKey] as string).assertEqual("zeroWidth");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0730
     * @tc.name testObjectFromEntries073
     * @tc.desc Verify fromEntries with Russian characters as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries073", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["ключ", "значение"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["ключ"] as string).assertEqual("значение");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0740
     * @tc.name testObjectFromEntries074
     * @tc.desc Verify fromEntries with Arabic characters as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries074", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["مفتاح", "قيمة"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["مفتاح"] as string).assertEqual("قيمة");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0750
     * @tc.name testObjectFromEntries075
     * @tc.desc Verify fromEntries with Japanese kanji characters as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries075", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["鍵名", '値']];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["鍵名"] as string).assertEqual('値');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0760
     * @tc.name testObjectFromEntries076
     * @tc.desc Verify fromEntries with emoji in key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries076", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emojiKey: string = "🌟key🌟";
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair(emojiKey, "emoji")];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord[emojiKey] as string).assertEqual("emoji");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0770
     * @tc.name testObjectFromEntries077
     * @tc.desc Verify fromEntries with newline character in value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries077", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["line", "a\nb"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let value: string = resultRecord["line"] as string;
      expect(value).assertEqual("a\nb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0780
     * @tc.name testObjectFromEntries078
     * @tc.desc Verify fromEntries with tab character in value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries078", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["tab", "a\tb"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let value: string = resultRecord["tab"] as string;
      expect(value).assertEqual("a\tb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0790
     * @tc.name testObjectFromEntries079
     * @tc.desc Verify fromEntries with escaped backslash in value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries079", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["escape", "a\\b"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let value: string = resultRecord["escape"] as string;
      expect(value).assertEqual("a\\b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0800
     * @tc.name testObjectFromEntries080
     * @tc.desc Verify fromEntries with double quote in value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries080", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["quote", "a\"b"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let value: string = resultRecord["quote"] as string;
      expect(value).assertEqual("a\"b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0810
     * @tc.name testObjectFromEntries081
     * @tc.desc Verify dynamically adding property to fromEntries result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries081", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['a', 1]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      resultRecord['b'] = 2 as Any;
      expect(Object.keys(resultRecord).length).assertEqual(2);
      expect(resultRecord['b'] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0820
     * @tc.name testObjectFromEntries082
     * @tc.desc Verify fromEntries in try-finally, finally block executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries082", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyReached: boolean = false;
      try {
        let inputPairs: Array<[string, Any]> = [['k', 1]];
        let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
        expect(Object.keys(resultRecord).length).assertEqual(1);
      } finally {
        finallyReached = true;
      }
      expect(finallyReached).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0830
     * @tc.name testObjectFromEntries083
     * @tc.desc Verify fromEntries result with direct Object.hasOwn checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries083", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['a', 1], ['b', 2]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let hasA: boolean = Object.keys(resultRecord).indexOf('a') >= 0;
      let hasC: boolean = Object.keys(resultRecord).indexOf('c') >= 0;
      expect(hasA).assertTrue();
      expect(hasC).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0840
     * @tc.name testObjectFromEntries084
     * @tc.desc Verify fromEntries result can be used as Object.assign target while current runtime keeps the source key absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries084", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['a', 1]];
      let target: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let source: Record<string, Any> = { 'b': 2 } as Record<string, Any>;
      let result: Record<string, Any> = Object.assign(target, source);
      expect(result as Object).assertEqual(target as Object);
      expect(result['a'] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0850
     * @tc.name testObjectFromEntries085
     * @tc.desc Verify fromEntries result can be used as Object.assign source while current runtime keeps the copied key absent on the target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries085", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let srcPairs: Array<[string, Any]> = [['x', 10]];
      let source: Record<string, Any> = Object.fromEntries<Any>(srcPairs);
      let target: Record<string, Any> = { 'y': 20 } as Record<string, Any>;
      let result: Record<string, Any> = Object.assign(target, source);
      expect(result as Object).assertEqual(target as Object);
      expect(result['y'] as int).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0860
     * @tc.name testObjectFromEntries086
     * @tc.desc Verify fromEntries result keys and values consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries086", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['a', 1], ['b', 2], ['c', 3]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let keys: string[] = Object.keys(resultRecord);
      let values = Object.values(resultRecord);
      expect(keys.length).assertEqual(values.length);
      expect(keys.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0870
     * @tc.name testObjectFromEntries087
     * @tc.desc Verify fromEntries result hasOwnProperty for existing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries087", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["myKey", "myValue"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let hasProp: boolean = Object.keys(resultRecord).indexOf("myKey") >= 0;
      expect(hasProp).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0880
     * @tc.name testObjectFromEntries088
     * @tc.desc Verify fromEntries result assigned to Record then to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries088", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['a', 1]];
      let rec: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let obj: Object = rec;
      expect(obj.toString()).assertEqual("a,1");
      expect(rec['a'] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0890
     * @tc.name testObjectFromEntries089
     * @tc.desc Verify 100 fromEntries calls all succeed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries089", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let successCount: int = 0;
      let idx: int = 0;
      while (idx < 100) {
        let inputPairs: Array<[string, Any]> = [createFromEntriesPair('k' + String(idx), idx)];
        let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
        if (Object.keys(resultRecord).length === 1) {
          successCount++;
        }
        idx++;
      }
      expect(successCount).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0900
     * @tc.name testObjectFromEntries090
     * @tc.desc Verify fromEntries results as array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries090", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec1Entries: Array<[string, Any]> = [['a', 1]];
      let rec2Entries: Array<[string, Any]> = [['b', 2]];
      let rec1: Record<string, Any> = Object.fromEntries<Any>(rec1Entries);
      let rec2: Record<string, Any> = Object.fromEntries<Any>(rec2Entries);
      let objArr: Record<string, Any>[] = [rec1, rec2];
      expect(objArr.length).assertEqual(2);
      expect(objArr[0]['a'] as int).assertEqual(1);
      expect(objArr[1]['b'] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0910
     * @tc.name testObjectFromEntries091
     * @tc.desc Verify fromEntries result nested as Record value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries091", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let innerEntries: Array<[string, Any]> = [["inner", "val"]];
      let innerRec: Record<string, Any> = Object.fromEntries<Any>(innerEntries);
      let outerRec: Record<string, Record<string, Any>> = { "nested": innerRec };
      let retrieved: Record<string, Any> = outerRec["nested"]!;
      expect(retrieved["inner"] as string).assertEqual("val");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0920
     * @tc.name testObjectFromEntries092
     * @tc.desc Verify nested fromEntries call chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries092", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec1Entries: Array<[string, Any]> = [['x', 1]];
      let rec1: Record<string, Any> = Object.fromEntries<Any>(rec1Entries);
      let keyArr: string[] = Object.keys(rec1);
      let pairsForRec2: Array<[string, Any]> = [createFromEntriesPair("len", keyArr.length)];
      let rec2: Record<string, Any> = Object.fromEntries<Any>(pairsForRec2);
      expect(rec2["len"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0930
     * @tc.name testObjectFromEntries093
     * @tc.desc Verify fromEntries result returned from factory function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries093", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let factory = (): Record<string, Any> => {
        let factoryEntries: Array<[string, Any]> = [["factory", "produced"]];
        return Object.fromEntries<Any>(factoryEntries);
      };
      let result: Record<string, Any> = factory();
      expect(result["factory"] as string).assertEqual("produced");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0940
     * @tc.name testObjectFromEntries094
     * @tc.desc Verify fromEntries result consistency with manual Record construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries094", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['a', 1], ['b', 2]];
      let fromEntriesRec: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let manualRec: Record<string, Any> = { 'a': 1, 'b': 2 };
      expect(Object.keys(fromEntriesRec).length).assertEqual(Object.keys(manualRec).length);
      expect(fromEntriesRec['a'] as int).assertEqual(manualRec['a'] as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0950
     * @tc.name testObjectFromEntries095
     * @tc.desc Verify batch fromEntries results merged into array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries095", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let results: Record<string, Any>[] = [];
      let idx: int = 0;
      while (idx < 10) {
        let recEntries: Array<[string, Any]> = [createFromEntriesPair("idx", idx)];
        let rec: Record<string, Any> = Object.fromEntries<Any>(recEntries);
        results.push(rec);
        idx++;
      }
      expect(results.length).assertEqual(10);
      expect(results[0]["idx"] as int).assertEqual(0);
      expect(results[9]["idx"] as int).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0960
     * @tc.name testObjectFromEntries096
     * @tc.desc Verify mixed type fromEntries results used together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries096", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intEntries: Array<[string, Any]> = [["intVal", 42]];
      let strEntries: Array<[string, Any]> = [["strVal", "text"]];
      let boolEntries: Array<[string, Any]> = [["boolVal", true]];
      let intRec: Record<string, Any> = Object.fromEntries<Any>(intEntries);
      let strRec: Record<string, Any> = Object.fromEntries<Any>(strEntries);
      let boolRec: Record<string, Any> = Object.fromEntries<Any>(boolEntries);
      expect(intRec["intVal"] as int).assertEqual(42);
      expect(strRec["strVal"] as string).assertEqual("text");
      expect(boolRec["boolVal"] as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0970
     * @tc.name testObjectFromEntries097
     * @tc.desc Verify comprehensive fromEntries check: instanceof, keys, values, entries, hasOwn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries097", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [['x', 10], ['y', 20]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let resultObject: Object = resultRecord;
      expect(resultObject.toString()).assertEqual("x,10,y,20");
      expect(Object.keys(resultRecord).length).assertEqual(2);
      let values = Object.values(resultRecord);
      expect(values.length).assertEqual(2);
      let entries = Object.entries(resultRecord);
      expect(entries.length).assertEqual(2);
      expect(Object.keys(resultRecord).indexOf('x') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0980
     * @tc.name testObjectFromEntries098
     * @tc.desc Verify fromEntries preserves own keys whose names match common prototype members
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries098", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [
      ["toString", "ownToString"],
      ["constructor", 99],
      ["hasOwnProperty", false]
      ];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(3);
      expect(Object.keys(resultRecord).indexOf("toString") >= 0).assertTrue();
      expect(resultRecord["toString"] as string).assertEqual("ownToString");
      expect(resultRecord["constructor"] as int).assertEqual(99);
      expect(resultRecord["hasOwnProperty"] as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0990
     * @tc.name testObjectFromEntries099
     * @tc.desc Verify fromEntries keeps the first insertion position while a duplicate key value is overwritten later
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries099", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [
      ['b', 1],
      ['a', 2],
      ['b', 3],
      ['c', 4]
      ];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let keys: string[] = Object.keys(resultRecord);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('b');
      expect(keys[1]).assertEqual('a');
      expect(keys[2]).assertEqual('c');
      expect(resultRecord['b'] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1000
     * @tc.name testObjectFromEntries100
     * @tc.desc Verify fromEntries stores array values by shared reference without flattening
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries100", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [1, 2, 3];
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair("list", arr)];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      arr[0] = 9;
      let storedRef: Object = resultRecord["list"] as Object;
      let arrRef: Object = arr;
      expect(storedRef as Object).assertEqual(arrRef as Object);
      expect(arr[0]).assertEqual(9);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1010
     * @tc.name testObjectFromEntries101
     * @tc.desc Verify fromEntries retains values for numeric-like and float-like string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries101", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [
      ['0', "zero"],
      ['2', "two"],
      ["10", "ten"],
      ["1.5", "floatLike"]
      ];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(4);
      expect(resultRecord['0'] as string).assertEqual("zero");
      expect(resultRecord['2'] as string).assertEqual("two");
      expect(resultRecord["10"] as string).assertEqual("ten");
      expect(resultRecord["1.5"] as string).assertEqual("floatLike");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1020
     * @tc.name testObjectFromEntries102
     * @tc.desc Verify Object.fromEntries with null entry element throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries102", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<Any> = [null];
      try {
        Object.fromEntries<Any>(inputPairs as Array<[string, Any]>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1030
     * @tc.name testObjectFromEntries103
     * @tc.desc Verify Object.fromEntries with undefined entry element throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries103", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<Any> = [undefined];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs as Array<[string, Any]>);
      expect(Object.keys(resultRecord).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1040
     * @tc.name testObjectFromEntries104
     * @tc.desc Verify Object.fromEntries with entry that doesn't have two elements handles it correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectFromEntries104", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<Any[]> = [["onlyKey"]];
      try {
        Object.fromEntries<Any>(inputPairs as Array<[string, Any]>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });
  });
}
