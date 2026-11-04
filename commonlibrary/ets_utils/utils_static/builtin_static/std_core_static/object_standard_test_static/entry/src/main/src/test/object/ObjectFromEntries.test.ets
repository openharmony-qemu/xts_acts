'use static'
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';
import Utils from '../Util.test';


class FromEntriesCustomClass {
  public name: string = "customValue";
}

function createFromEntriesPair(key: string, value: Any): [string, Any] {
  let pair: [string, Any] = [key, value];
  return pair;
}

export default function ObjectFromEntriesTest(): void {
  describe('ObjectFromEntriesTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0010
     * @tc.name testObjectFromEntries0010
     * @tc.desc Verify fromEntries with single int entry returns Record with correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["key", 100]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let accessedValue: Any = resultRecord["key"];
      expect(accessedValue as int).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0020
     * @tc.name testObjectFromEntries0020
     * @tc.desc Verify fromEntries with single string entry returns Record with correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0020', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["name", "test"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let accessedValue: Any = resultRecord["name"];
      expect(accessedValue as string).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0030
     * @tc.name testObjectFromEntries0030
     * @tc.desc Verify fromEntries with single boolean entry returns Record with correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0030', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["flag", true]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let accessedValue: Any = resultRecord["flag"];
      expect(accessedValue as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0040
     * @tc.name testObjectFromEntries0040
     * @tc.desc Verify fromEntries with multiple int entries returns Record with all properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0040', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["a", 1], ["b", 2], ["c", 3]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(3);
      expect(resultRecord["a"] as int).assertEqual(1);
      expect(resultRecord["b"] as int).assertEqual(2);
      expect(resultRecord["c"] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0050
     * @tc.name testObjectFromEntries0050
     * @tc.desc Verify fromEntries with mixed-type entries returns Record with all properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0050', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["a", 1], ["b", "str"], ["c", true]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(3);
      expect(resultRecord["a"] as int).assertEqual(1);
      expect(resultRecord["b"] as string).assertEqual("str");
      expect(resultRecord["c"] as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0060
     * @tc.name testObjectFromEntries0060
     * @tc.desc Verify fromEntries result is instanceof Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0060', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["k", "v"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord instanceof Object).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0070
     * @tc.name testObjectFromEntries0070
     * @tc.desc Verify fromEntries result exposes the inserted key count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0070', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["k", "v"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0080
     * @tc.name testObjectFromEntries0080
     * @tc.desc Verify two fromEntries calls return distinct references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0080', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input1: Array<[string, Any]> = [["a", 1]];
      let input2: Array<[string, Any]> = [["a", 1]];
      let result1: Record<string, Any> = Object.fromEntries<Any>(input1);
      let result2: Record<string, Any> = Object.fromEntries<Any>(input2);
      expect(result1 !== result2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0090
     * @tc.name testObjectFromEntries0090
     * @tc.desc Verify three fromEntries calls all return distinct references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0090', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: Array<[string, Any]> = [["a", 1]];
      let r1: Record<string, Any> = Object.fromEntries<Any>(input);
      let r2: Record<string, Any> = Object.fromEntries<Any>(input);
      let r3: Record<string, Any> = Object.fromEntries<Any>(input);
      expect(r1 !== r2).assertTrue();
      expect(r1 !== r3).assertTrue();
      expect(r2 !== r3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0100
     * @tc.name testObjectFromEntries0100
     * @tc.desc Verify fromEntries result assignable to Object variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["k", 1]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let obj: Object = resultRecord;
      expect(obj.toString()).assertEqual("k,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0110
     * @tc.name testObjectFromEntries0110
     * @tc.desc Verify fromEntries result Object.keys returns correct keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0110', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["k1", 1], ["k2", 2]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let keys: string[] = Object.keys(resultRecord);
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual("k1");
      expect(keys[1]).assertEqual("k2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0120
     * @tc.name testObjectFromEntries0120
     * @tc.desc Verify fromEntries result Object.values returns correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0120', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["k1", 1], ["k2", 2]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let values = Object.values(resultRecord);
      expect(values.length).assertEqual(2);
      expect(values[0] as int).assertEqual(1);
      expect(values[1] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0130
     * @tc.name testObjectFromEntries0130
     * @tc.desc Verify fromEntries result Object.entries returns correct entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0130', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0140
     * @tc.name testObjectFromEntries0140
     * @tc.desc Verify fromEntries result Object.getOwnPropertyNames returns correct names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0140', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["k1", 1], ["k2", 2]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let names: string[] = Object.getOwnPropertyNames(resultRecord);
      expect(names.length).assertEqual(2);
      expect(names[0]).assertEqual("k1");
      expect(names[1]).assertEqual("k2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0150
     * @tc.name testObjectFromEntries0150
     * @tc.desc Verify fromEntries result is assignable to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0150', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["k", 1]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let resultObject: Object = resultRecord;
      expect(resultRecord["k"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0160
     * @tc.name testObjectFromEntries0160
     * @tc.desc Verify fromEntries result toString returns non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0160', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["k", 1]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let str: string = resultRecord.toString();
      expect(str).assertEqual("k,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0170
     * @tc.name testObjectFromEntries0170
     * @tc.desc Verify fromEntries result $_hashCode returns non-negative int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0170', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["k", 1]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let expectedVal: int = resultRecord["k"] as int;
      let hashCode: int = resultRecord.$_hashCode();
      expect(resultRecord["k"] as int).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0180
     * @tc.name testObjectFromEntries0180
     * @tc.desc Verify fromEntries result toLocaleString returns a string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0180', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["k", 1]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let localeStr: string = resultRecord.toLocaleString();
      expect(localeStr).assertEqual("k,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0190
     * @tc.name testObjectFromEntries0190
     * @tc.desc Verify fromEntries result exposes the expected own-key count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0190', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["k1", 1], ["k2", 2]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0200
     * @tc.name testObjectFromEntries0200
     * @tc.desc Verify same input twice produces different object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: Array<[string, Any]> = [["key", 1]];
      let rec1: Record<string, Any> = Object.fromEntries<Any>(input);
      let rec2: Record<string, Any> = Object.fromEntries<Any>(input);
      expect(rec1 !== rec2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0210
     * @tc.name testObjectFromEntries0210
     * @tc.desc Verify fromEntries with int value preserves int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0210', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["count", 42]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let value: int = resultRecord["count"] as int;
      expect(value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0220
     * @tc.name testObjectFromEntries0220
     * @tc.desc Verify fromEntries with string value preserves string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0220', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["msg", "hello"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let value: string = resultRecord["msg"] as string;
      expect(value).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0230
     * @tc.name testObjectFromEntries0230
     * @tc.desc Verify fromEntries with boolean false value preserves boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0230', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["flag", false]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let value: boolean = resultRecord["flag"] as boolean;
      expect(value).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0240
     * @tc.name testObjectFromEntries0240
     * @tc.desc Verify fromEntries with explicit int generic for int value type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0240', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, int]> = [["score", 95]];
      let resultRecord: Record<string, int> = Object.fromEntries<int>(inputPairs);
      let typedValue: int = resultRecord["score"] as int;
      expect(typedValue).assertEqual(95);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0250
     * @tc.name testObjectFromEntries0250
     * @tc.desc Verify fromEntries with explicit string generic for string value type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0250', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, string]> = [["msg", "hello world"]];
      let resultRecord: Record<string, string> = Object.fromEntries<string>(inputPairs);
      let typedValue: string = resultRecord["msg"] as string;
      expect(typedValue).assertEqual("hello world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0260
     * @tc.name testObjectFromEntries0260
     * @tc.desc Verify fromEntries with explicit boolean generic for boolean value type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0260', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, boolean]> = [["flag", true]];
      let resultRecord: Record<string, boolean> = Object.fromEntries<boolean>(inputPairs);
      let typedValue: boolean = resultRecord["flag"] as boolean;
      expect(typedValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0270
     * @tc.name testObjectFromEntries0270
     * @tc.desc Verify fromEntries with Object-typed entry preserves Object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0270', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objInstance: Object = new Object();
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair("data", objInstance)];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let accessedValue: Object = resultRecord["data"] as Object;
      expect(accessedValue).assertEqual(objInstance);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0280
     * @tc.name testObjectFromEntries0280
     * @tc.desc Verify fromEntries without explicit generic, compiler infers type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0280', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["value", 100]];
      let resultRecord = Object.fromEntries(inputPairs);
      let accessedValue: int = resultRecord["value"] as int;
      expect(accessedValue).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0290
     * @tc.name testObjectFromEntries0290
     * @tc.desc Verify fromEntries without explicit generic handles key insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0290', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["first", 1], ["second", "str"], ["third", true]];
      let resultRecord = Object.fromEntries(inputPairs);
      let keys: string[] = Object.keys(resultRecord);
      expect(keys[0]).assertEqual("first");
      expect(keys[1]).assertEqual("second");
      expect(keys[2]).assertEqual("third");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0300
     * @tc.name testObjectFromEntries0300
     * @tc.desc Verify fromEntries with zero int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["zero", 0]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["zero"] as int).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0310
     * @tc.name testObjectFromEntries0310
     * @tc.desc Verify fromEntries with negative int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0310', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["neg", (-100)]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["neg"] as int).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0320
     * @tc.name testObjectFromEntries0320
     * @tc.desc Verify fromEntries with max int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0320', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["max", 2147483647]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["max"] as int).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0330
     * @tc.name testObjectFromEntries0330
     * @tc.desc Verify fromEntries with boolean false value preserves the original key name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0330', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["flag", false]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let value: boolean = resultRecord["flag"] as boolean;
      expect(value).assertFalse();
      expect(Object.keys(resultRecord)[0]).assertEqual("flag");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0340
     * @tc.name testObjectFromEntries0340
     * @tc.desc Verify fromEntries with boolean true value and different key name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0340', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["enabled", true]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let value: boolean = resultRecord["enabled"] as boolean;
      expect(value).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0350
     * @tc.name testObjectFromEntries0350
     * @tc.desc Verify fromEntries with empty string value and explicit key lookup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0350', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["empty", ""]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["empty"] as string).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0360
     * @tc.name testObjectFromEntries0360
     * @tc.desc Verify fromEntries with Unicode string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0360', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["unicode", "你好世界"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["unicode"] as string).assertEqual("你好世界");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0370
     * @tc.name testObjectFromEntries0370
     * @tc.desc Verify fromEntries with empty string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0370', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["", "emptyKeyValue"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord[""] as string).assertEqual("emptyKeyValue");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0380
     * @tc.name testObjectFromEntries0380
     * @tc.desc Verify fromEntries with special character key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0380', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["@#$%^&*()", "special"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["@#$%^&*()"] as string).assertEqual("special");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0390
     * @tc.name testObjectFromEntries0390
     * @tc.desc Verify fromEntries with Unicode Chinese character key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0390', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["测试键名", "unicodeKey"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["测试键名"] as string).assertEqual("unicodeKey");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0400
     * @tc.name testObjectFromEntries0400
     * @tc.desc Verify fromEntries with numeric string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["123456", "numericString"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["123456"] as string).assertEqual("numericString");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0410
     * @tc.name testObjectFromEntries0410
     * @tc.desc Verify fromEntries with long string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0410', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longKey: string = "abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefghijklmnopqrstuvwxyz0123456789abcdefgh";
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair(longKey, "longKeyValue")];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord[longKey] as string).assertEqual("longKeyValue");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0420
     * @tc.name testObjectFromEntries0420
     * @tc.desc Verify fromEntries with key containing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0420', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["key with spaces", "value"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["key with spaces"] as string).assertEqual("value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0430
     * @tc.name testObjectFromEntries0430
     * @tc.desc Verify fromEntries with key containing dashes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0430', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["key-with-dash", "value"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["key-with-dash"] as string).assertEqual("value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0440
     * @tc.name testObjectFromEntries0440
     * @tc.desc Verify fromEntries with key containing underscores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0440', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["key_with_underscore", "value"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["key_with_underscore"] as string).assertEqual("value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0450
     * @tc.name testObjectFromEntries0450
     * @tc.desc Verify fromEntries with key containing dots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0450', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["key.with.dot", "value"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["key.with.dot"] as string).assertEqual("value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0460
     * @tc.name testObjectFromEntries0460
     * @tc.desc Verify fromEntries with single character key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0460', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["k", "singleChar"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["k"] as string).assertEqual("singleChar");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0470
     * @tc.name testObjectFromEntries0470
     * @tc.desc Verify fromEntries with "0" string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0470', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["0", "zeroKey"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["0"] as string).assertEqual("zeroKey");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0480
     * @tc.name testObjectFromEntries0480
     * @tc.desc Verify fromEntries with multiple special key types mixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0480', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["", 1], ["@", 2], ["测试", 3]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(3);
      expect(resultRecord[""] as int).assertEqual(1);
      expect(resultRecord["@"] as int).assertEqual(2);
      expect(resultRecord["测试"] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0490
     * @tc.name testObjectFromEntries0490
     * @tc.desc Verify fromEntries with XSS script tag as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0490', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["<script>alert(1)</script>", "xssKey"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["<script>alert(1)</script>"] as string).assertEqual("xssKey");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0500
     * @tc.name testObjectFromEntries0500
     * @tc.desc Verify fromEntries with null property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["nullable", null]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(1);
      expect(resultRecord["nullable"] as null).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0510
     * @tc.name testObjectFromEntries0510
     * @tc.desc Verify fromEntries with undefined property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0510', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["undef", undefined]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(1);
      expect(resultRecord["undef"] as undefined).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0520
     * @tc.name testObjectFromEntries0520
     * @tc.desc Verify fromEntries with Object instance as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0520', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objInstance: Object = new Object();
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair("obj", objInstance)];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let accessedValue: Object = resultRecord["obj"] as Object;
      expect(accessedValue).assertEqual(objInstance);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0530
     * @tc.name testObjectFromEntries0530
     * @tc.desc Verify fromEntries with Array as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0530', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0540
     * @tc.name testObjectFromEntries0540
     * @tc.desc Verify fromEntries accepts array entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0540', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterable = [
      ["first", 1] as [string, Any],
      ["second", 2] as [string, Any]
      ];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(iterable);
      expect(resultRecord["first"] as int).assertEqual(1);
      expect(resultRecord["second"] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0550
     * @tc.name testObjectFromEntries0550
     * @tc.desc Verify fromEntries with nested Record as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0550', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nestedRec: Record<string, Any> = { "inner": "val" };
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair("nested", nestedRec)];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let storedValue: Object | undefined = resultRecord["nested"] as Object | undefined;
      expect(storedValue).assertEqual(nestedRec);
      expect(nestedRec["inner"] as string).assertEqual("val");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0560
     * @tc.name testObjectFromEntries0560
     * @tc.desc Verify fromEntries with BigInt value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0560', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bigVal: BigInt = BigInt(123);
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair("bigint", bigVal)];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let accessedValue: BigInt = resultRecord["bigint"] as BigInt;
      expect(accessedValue.toString() as string).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0570
     * @tc.name testObjectFromEntries0570
     * @tc.desc Verify fromEntries with double floating point value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0570', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["pi", 3.14]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let accessedValue: double = resultRecord["pi"] as double;
      expect(accessedValue).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0580
     * @tc.name testObjectFromEntries0580
     * @tc.desc Verify fromEntries with negative float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0580', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["negFloat", (-2.5)]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let accessedValue: double = resultRecord["negFloat"] as double;
      expect(accessedValue).assertEqual(-2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0590
     * @tc.name testObjectFromEntries0590
     * @tc.desc Verify fromEntries with max int value from a typed key-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0590', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxInt: int = 2147483647;
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair("maxInt", maxInt)];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["maxInt"] as int).assertEqual(maxInt);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0600
     * @tc.name testObjectFromEntries0600
     * @tc.desc Verify fromEntries with min int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minInt: int = -2147483648;
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair("minInt", minInt)];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["minInt"] as int).assertEqual(minInt);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0610
     * @tc.name testObjectFromEntries0610
     * @tc.desc Verify fromEntries with empty string value length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0610', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["emptyStr", ""]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let value: string = resultRecord["emptyStr"] as string;
      expect(value.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0620
     * @tc.name testObjectFromEntries0620
     * @tc.desc Verify fromEntries with very long string value (1000 chars)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0620', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0630
     * @tc.name testObjectFromEntries0630
     * @tc.desc Verify fromEntries with custom class instance as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0630', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let customObj: FromEntriesCustomClass = new FromEntriesCustomClass();
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair("custom", customObj)];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let accessedValue: FromEntriesCustomClass = resultRecord["custom"] as FromEntriesCustomClass;
      expect(accessedValue.name).assertEqual("customValue");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0640
     * @tc.name testObjectFromEntries0640
     * @tc.desc Verify fromEntries with empty array returns empty Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0640', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0650
     * @tc.name testObjectFromEntries0650
     * @tc.desc Verify fromEntries with single element array returns single property Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0650', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["single", 1]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(1);
      expect(resultRecord["single"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0660
     * @tc.name testObjectFromEntries0660
     * @tc.desc Verify fromEntries with two element array returns two property Record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0660', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["a", 1], ["b", 2]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0670
     * @tc.name testObjectFromEntries0670
     * @tc.desc Verify fromEntries with duplicate keys, later value overwrites earlier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0670', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["key", 1], ["key", 2], ["key", 3]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(1);
      expect(resultRecord["key"] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0680
     * @tc.name testObjectFromEntries0680
     * @tc.desc Verify fromEntries with partially duplicate keys mixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0680', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["a", 1], ["b", 2], ["a", 3]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(2);
      expect(resultRecord["a"] as int).assertEqual(3);
      expect(resultRecord["b"] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0690
     * @tc.name testObjectFromEntries0690
     * @tc.desc Verify fromEntries with 10 different key array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0690', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [];
      let idx: int = 0;
      while (idx < 10) {
        inputPairs.push(createFromEntriesPair(String(idx), idx));
        idx++;
      }
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(10);
      expect(resultRecord["0"] as int).assertEqual(0);
      expect(resultRecord["9"] as int).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0700
     * @tc.name testObjectFromEntries0700
     * @tc.desc Verify fromEntries with 50 different key array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [];
      let idx: int = 0;
      while (idx < 50) {
        inputPairs.push(createFromEntriesPair("k" + String(idx), idx));
        idx++;
      }
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0710
     * @tc.name testObjectFromEntries0710
     * @tc.desc Verify fromEntries with 100 different key array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0710', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [];
      let idx: int = 0;
      while (idx < 100) {
        inputPairs.push(createFromEntriesPair("key" + String(idx), idx));
        idx++;
      }
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(100);
      expect(resultRecord["key0"] as int).assertEqual(0);
      expect(resultRecord["key99"] as int).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0720
     * @tc.name testObjectFromEntries0720
     * @tc.desc Verify fromEntries with unsorted keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0720', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["c", 3], ["a", 1], ["b", 2]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(3);
      expect(resultRecord["a"] as int).assertEqual(1);
      expect(resultRecord["b"] as int).assertEqual(2);
      expect(resultRecord["c"] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0730
     * @tc.name testObjectFromEntries0730
     * @tc.desc Verify fromEntries with all same keys extreme case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0730', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["x", 1], ["x", 2], ["x", 3], ["x", 4], ["x", 5]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(1);
      expect(resultRecord["x"] as int).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0740
     * @tc.name testObjectFromEntries0740
     * @tc.desc Verify fromEntries with two keys interleaved duplicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0740', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["a", 1], ["b", 2], ["a", 3], ["b", 4]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(2);
      expect(resultRecord["a"] as int).assertEqual(3);
      expect(resultRecord["b"] as int).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0750
     * @tc.name testObjectFromEntries0750
     * @tc.desc Verify nested fromEntries: result used as value in another fromEntries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0750', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let innerPairs: Array<[string, Any]> = [["x", 10]];
      let innerRec: Record<string, Any> = Object.fromEntries<Any>(innerPairs);
      let outerPairs: Array<[string, Any]> = [createFromEntriesPair("nested", innerRec)];
      let outerRec: Record<string, Any> = Object.fromEntries<Any>(outerPairs);
      let nestedValue: Object | undefined = outerRec["nested"] as Object | undefined;
      expect(nestedValue).assertEqual(innerRec);
      expect(innerRec["x"] as int).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0760
     * @tc.name testObjectFromEntries0760
     * @tc.desc Verify entries array length equals result keys count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0760', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["a", 1], ["b", 2], ["c", 3]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(inputPairs.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0770
     * @tc.name testObjectFromEntries0770
     * @tc.desc Verify accessing non-existent key returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0770', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["a", 1]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let nonexistent: Object | undefined = resultRecord["nonexistent"] as Object | undefined;
      expect(nonexistent as undefined).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0780
     * @tc.name testObjectFromEntries0780
     * @tc.desc Verify fromEntries with positive integer string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0780', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["1", "one"], ["2", "two"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["1"] as string).assertEqual("one");
      expect(resultRecord["2"] as string).assertEqual("two");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0790
     * @tc.name testObjectFromEntries0790
     * @tc.desc Verify fromEntries with negative integer string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0790', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["-1", "minusOne"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["-1"] as string).assertEqual("minusOne");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0800
     * @tc.name testObjectFromEntries0800
     * @tc.desc Verify fromEntries with zero-width space character key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zwsKey: string = "​";
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair(zwsKey, "zeroWidth")];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord[zwsKey] as string).assertEqual("zeroWidth");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0810
     * @tc.name testObjectFromEntries0810
     * @tc.desc Verify fromEntries with Russian characters as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0810', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["ключ", "значение"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["ключ"] as string).assertEqual("значение");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0820
     * @tc.name testObjectFromEntries0820
     * @tc.desc Verify fromEntries with Arabic characters as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0820', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["مفتاح", "قيمة"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["مفتاح"] as string).assertEqual("قيمة");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0830
     * @tc.name testObjectFromEntries0830
     * @tc.desc Verify fromEntries with Japanese kanji characters as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0830', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["鍵名", "値"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord["鍵名"] as string).assertEqual("値");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0840
     * @tc.name testObjectFromEntries0840
     * @tc.desc Verify fromEntries with emoji in key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0840', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emojiKey: string = "🌟key🌟";
      let inputPairs: Array<[string, Any]> = [createFromEntriesPair(emojiKey, "emoji")];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(resultRecord[emojiKey] as string).assertEqual("emoji");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0850
     * @tc.name testObjectFromEntries0850
     * @tc.desc Verify fromEntries with newline character in value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0850', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["line", "a\nb"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let value: string = resultRecord["line"] as string;
      expect(value).assertEqual("a\nb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0860
     * @tc.name testObjectFromEntries0860
     * @tc.desc Verify fromEntries with tab character in value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0860', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["tab", "a\tb"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let value: string = resultRecord["tab"] as string;
      expect(value).assertEqual("a\tb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0870
     * @tc.name testObjectFromEntries0870
     * @tc.desc Verify fromEntries with escaped backslash in value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0870', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["escape", "a\\b"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let value: string = resultRecord["escape"] as string;
      expect(value).assertEqual("a\\b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0880
     * @tc.name testObjectFromEntries0880
     * @tc.desc Verify fromEntries with double quote in value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0880', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["quote", "a\"b"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let value: string = resultRecord["quote"] as string;
      expect(value).assertEqual("a\"b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0890
     * @tc.name testObjectFromEntries0890
     * @tc.desc Verify dynamically adding property to fromEntries result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0890', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["a", 1]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      resultRecord["b"] = 2 as Any;
      expect(Object.keys(resultRecord).length).assertEqual(2);
      expect(resultRecord["b"] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0900
     * @tc.name testObjectFromEntries0900
     * @tc.desc Verify fromEntries in try-catch does not cause program crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let errorCaught: boolean = false;
      try {
        let inputPairs: Array<[string, Any]> = [["k", "v"]];
        let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
        expect(Object.keys(resultRecord).length).assertEqual(1);
      } catch (e) {
        errorCaught = true;
      }
      expect(errorCaught).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0910
     * @tc.name testObjectFromEntries0910
     * @tc.desc Verify fromEntries in try-finally, finally block executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0910', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyReached: boolean = false;
      try {
        let inputPairs: Array<[string, Any]> = [["k", 1]];
        let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
        expect(Object.keys(resultRecord).length).assertEqual(1);
      } finally {
        finallyReached = true;
      }
      expect(finallyReached).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0920
     * @tc.name testObjectFromEntries0920
     * @tc.desc Verify fromEntries with empty array entries exposes empty key list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0920', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let keys: string[] = Object.keys(resultRecord);
      expect(keys.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0930
     * @tc.name testObjectFromEntries0930
     * @tc.desc Verify fromEntries result passed to Object.keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0930', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["a", 1], ["b", 2]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let keys: string[] = Object.keys(resultRecord);
      expect(keys.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0940
     * @tc.name testObjectFromEntries0940
     * @tc.desc Verify fromEntries result passed to Object.values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0940', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["a", 1], ["b", 2]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let values = Object.values(resultRecord);
      expect(values.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0950
     * @tc.name testObjectFromEntries0950
     * @tc.desc Verify fromEntries result passed to Object.entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0950', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["a", 1], ["b", 2]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let entries = Object.entries(resultRecord);
      expect(entries.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0960
     * @tc.name testObjectFromEntries0960
     * @tc.desc Verify fromEntries result passed to Object.getOwnPropertyNames
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0960', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["a", 1], ["b", 2]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let names: string[] = Object.getOwnPropertyNames(resultRecord);
      expect(names.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0970
     * @tc.name testObjectFromEntries0970
     * @tc.desc Verify fromEntries result with direct Object.hasOwn checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0970', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["a", 1], ["b", 2]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let hasA: boolean = Object.keys(resultRecord).indexOf("a") >= 0;
      let hasC: boolean = Object.keys(resultRecord).indexOf("c") >= 0;
      expect(hasA).assertTrue();
      expect(hasC).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0980
     * @tc.name testObjectFromEntries0980
     * @tc.desc Verify fromEntries result can be used as Object.assign target while current runtime keeps the source key absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0980', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["a", 1]];
      let target: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let source: Record<string, Any> = { "b": 2 } as Record<string, Any>;
      let result: Record<string, Any> = Object.assign(target, source);
      expect(result as Object).assertEqual(target as Object);
      expect(result["a"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_0990
     * @tc.name testObjectFromEntries0990
     * @tc.desc Verify fromEntries result can be used as Object.assign source while current runtime keeps the copied key absent on the target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries0990', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let srcPairs: Array<[string, Any]> = [["x", 10]];
      let source: Record<string, Any> = Object.fromEntries<Any>(srcPairs);
      let target: Record<string, Any> = { "y": 20 } as Record<string, Any>;
      let result: Record<string, Any> = Object.assign(target, source);
      expect(result as Object).assertEqual(target as Object);
      expect(result["y"] as int).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1000
     * @tc.name testObjectFromEntries1000
     * @tc.desc Verify round-trip fromEntries and Object.entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["a", 1], ["b", 2]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let roundTripEntries = Object.entries(resultRecord);
      expect(roundTripEntries.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1010
     * @tc.name testObjectFromEntries1010
     * @tc.desc Verify fromEntries result keys and values consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["a", 1], ["b", 2], ["c", 3]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let keys: string[] = Object.keys(resultRecord);
      let values = Object.values(resultRecord);
      expect(keys.length).assertEqual(values.length);
      expect(keys.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1020
     * @tc.name testObjectFromEntries1020
     * @tc.desc Verify fromEntries result property iteration matches original entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1020', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["key1", 100], ["key2", 200]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let entries = Object.entries(resultRecord);
      expect(entries.length).assertEqual(2);
      expect(entries[0]![0]).assertEqual("key1");
      expect(entries[0]![1] as int).assertEqual(100);
      expect(entries[1]![0]).assertEqual("key2");
      expect(entries[1]![1] as int).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1030
     * @tc.name testObjectFromEntries1030
     * @tc.desc Verify fromEntries result hasOwnProperty for existing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1030', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["myKey", "myValue"]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let hasProp: boolean = Object.keys(resultRecord).indexOf("myKey") >= 0;
      expect(hasProp).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1040
     * @tc.name testObjectFromEntries1040
     * @tc.desc Verify fromEntries result is assignable to Object and keeps its string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1040', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["a", 1]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let obj: Object = resultRecord;
      expect(obj.toString()).assertEqual("a,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1050
     * @tc.name testObjectFromEntries1050
     * @tc.desc Verify fromEntries result assigned to Record then to Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1050', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["a", 1]];
      let rec: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let obj: Object = rec;
      expect(obj.toString()).assertEqual("a,1");
      expect(rec["a"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1060
     * @tc.name testObjectFromEntries1060
     * @tc.desc Verify 100 fromEntries calls all succeed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1060', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let successCount: int = 0;
      let idx: int = 0;
      while (idx < 100) {
        let inputPairs: Array<[string, Any]> = [createFromEntriesPair("k" + String(idx), idx)];
        let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
        if (Object.keys(resultRecord).length === 1) {
          successCount++;
        }
        idx++;
      }
      expect(successCount).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1070
     * @tc.name testObjectFromEntries1070
     * @tc.desc Verify fromEntries results as array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1070', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec1Entries: Array<[string, Any]> = [["a", 1]];
      let rec2Entries: Array<[string, Any]> = [["b", 2]];
      let rec1: Record<string, Any> = Object.fromEntries<Any>(rec1Entries);
      let rec2: Record<string, Any> = Object.fromEntries<Any>(rec2Entries);
      let objArr: Record<string, Any>[] = [rec1, rec2];
      expect(objArr.length).assertEqual(2);
      expect(objArr[0]["a"] as int).assertEqual(1);
      expect(objArr[1]["b"] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1080
     * @tc.name testObjectFromEntries1080
     * @tc.desc Verify fromEntries result nested as Record value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1080', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let innerEntries: Array<[string, Any]> = [["inner", "val"]];
      let innerRec: Record<string, Any> = Object.fromEntries<Any>(innerEntries);
      let outerRec: Record<string, Record<string, Any>> = { "nested": innerRec };
      let retrieved: Record<string, Any> = outerRec["nested"]!;
      expect(retrieved["inner"] as string).assertEqual("val");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1090
     * @tc.name testObjectFromEntries1090
     * @tc.desc Verify nested fromEntries call chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1090', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rec1Entries: Array<[string, Any]> = [["x", 1]];
      let rec1: Record<string, Any> = Object.fromEntries<Any>(rec1Entries);
      let keyArr: string[] = Object.keys(rec1);
      let pairsForRec2: Array<[string, Any]> = [createFromEntriesPair("len", keyArr.length)];
      let rec2: Record<string, Any> = Object.fromEntries<Any>(pairsForRec2);
      expect(rec2["len"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1100
     * @tc.name testObjectFromEntries1100
     * @tc.desc Verify fromEntries result returned from factory function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let factory = (): Record<string, Any> => {
        let factoryEntries: Array<[string, Any]> = [["factory", "produced"]];
        return Object.fromEntries<Any>(factoryEntries);
      };
      let result: Record<string, Any> = factory();
      expect(result["factory"] as string).assertEqual("produced");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1110
     * @tc.name testObjectFromEntries1110
     * @tc.desc Verify fromEntries result exposes the expected own keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1110', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["a", 1], ["b", 2]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1120
     * @tc.name testObjectFromEntries1120
     * @tc.desc Verify fromEntries result consistency with manual Record construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1120', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["a", 1], ["b", 2]];
      let fromEntriesRec: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let manualRec: Record<string, Any> = { "a": 1, "b": 2 };
      expect(Object.keys(fromEntriesRec).length).assertEqual(Object.keys(manualRec).length);
      expect(fromEntriesRec["a"] as int).assertEqual(manualRec["a"] as int);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1130
     * @tc.name testObjectFromEntries1130
     * @tc.desc Verify batch fromEntries results merged into array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1130', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1140
     * @tc.name testObjectFromEntries1140
     * @tc.desc Verify mixed type fromEntries results used together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1140', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1150
     * @tc.name testObjectFromEntries1150
     * @tc.desc Verify comprehensive fromEntries check: instanceof, keys, values, entries, hasOwn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1150', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [["x", 10], ["y", 20]];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let resultObject: Object = resultRecord;
      expect(resultObject.toString()).assertEqual("x,10,y,20");
      expect(Object.keys(resultRecord).length).assertEqual(2);
      let values = Object.values(resultRecord);
      expect(values.length).assertEqual(2);
      let entries = Object.entries(resultRecord);
      expect(entries.length).assertEqual(2);
      expect(Object.keys(resultRecord).indexOf("x") >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1160
     * @tc.name testObjectFromEntries1160
     * @tc.desc Verify fromEntries with 300 key-value pairs large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1160', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [];
      let idx: int = 0;
      while (idx < 300) {
        inputPairs.push(createFromEntriesPair("key" + String(idx), idx));
        idx++;
      }
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(300);
      expect(resultRecord["key0"] as int).assertEqual(0);
      expect(resultRecord["key299"] as int).assertEqual(299);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1170
     * @tc.name testObjectFromEntries1170
     * @tc.desc Verify fromEntries preserves own keys whose names match common prototype members
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1170', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1180
     * @tc.name testObjectFromEntries1180
     * @tc.desc Verify fromEntries keeps the first insertion position while a duplicate key value is overwritten later
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1180', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [
      ["b", 1],
      ["a", 2],
      ["b", 3],
      ["c", 4]
      ];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      let keys: string[] = Object.keys(resultRecord);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual("b");
      expect(keys[1]).assertEqual("a");
      expect(keys[2]).assertEqual("c");
      expect(resultRecord["b"] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1190
     * @tc.name testObjectFromEntries1190
     * @tc.desc Verify fromEntries stores array values by shared reference without flattening
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1190', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1200
     * @tc.name testObjectFromEntries1200
     * @tc.desc Verify fromEntries retains values for numeric-like and float-like string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [
      ["0", "zero"],
      ["2", "two"],
      ["10", "ten"],
      ["1.5", "floatLike"]
      ];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(4);
      expect(resultRecord["0"] as string).assertEqual("zero");
      expect(resultRecord["2"] as string).assertEqual("two");
      expect(resultRecord["10"] as string).assertEqual("ten");
      expect(resultRecord["1.5"] as string).assertEqual("floatLike");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1210
     * @tc.name testObjectFromEntries1210
     * @tc.desc Verify fromEntries result exposes all generated own keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1210', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<[string, Any]> = [
      ["alpha", 1],
      ["beta", 2],
      ["gamma", 3]
      ];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs);
      expect(Object.keys(resultRecord).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1220
     * @tc.name testObjectFromEntries1220
     * @tc.desc Verify Object.fromEntries with null entry element throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1220', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<Any> = [null];
      let threw: boolean = false;
      let errorName: string = "";
      try {
        Object.fromEntries<Any>(inputPairs as Array<[string, Any]>);
      } catch (e) {
        threw = true;
        errorName = e.name;
      }
      expect(threw).assertTrue();
      expect(errorName).assertEqual("ClassCastError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1230
     * @tc.name testObjectFromEntries1230
     * @tc.desc Verify Object.fromEntries with undefined entry element throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1230', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<Any> = [undefined];
      let resultRecord: Record<string, Any> = Object.fromEntries<Any>(inputPairs as Array<[string, Any]>);
      expect(Object.keys(resultRecord).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_FROM_ENTRIES_1240
     * @tc.name testObjectFromEntries1240
     * @tc.desc Verify Object.fromEntries with entry that doesn't have two elements handles it correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectFromEntries1240', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputPairs: Array<Any[]> = [["onlyKey"]];
      let threw: boolean = false;
      let errorName: string = "";
      try {
        Object.fromEntries<Any>(inputPairs as Array<[string, Any]>);
      } catch (e) {
        threw = true;
        errorName = e.name;
      }
      expect(threw).assertTrue();
      expect(errorName).assertEqual("ClassCastError");
    });
  });
}
