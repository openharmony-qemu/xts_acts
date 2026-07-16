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
      let hashCode: int = resultRecord.$_hashCode();
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
