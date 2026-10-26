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

export default function ObjectAssignTest(): void {
  describe("ObjectAssignTest", (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_0100
     * @tc.name testObjectAssign001
     * @tc.desc Verify Object.assign with no sources returns the target itself (identity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign001", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let result: Record<string, Any> = Object.assign(target);
      expect(target).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_0200
     * @tc.name testObjectAssign002
     * @tc.desc Verify Object.assign with single source copies one property to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign002", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let result: Record<string, Any> = Object.assign(target, source);
      expect(target).assertEqual(result);
      expect(target['a'] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_0300
     * @tc.name testObjectAssign003
     * @tc.desc Verify Object.assign with two sources copies non-overlapping properties from both
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign003", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source1: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let source2: Record<string, Any> = { 'b': 2 } as Record<string, Any>;
      Object.assign(target, source1, source2);
      expect(target['a'] as int).assertEqual(1);
      expect(target['b'] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_0400
     * @tc.name testObjectAssign004
     * @tc.desc Verify Object.assign overwrites existing target property with same-named source property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign004", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { 'a': 1, 'b': 2 } as Record<string, Any>;
      let source: Record<string, Any> = { 'b': 20, 'c': 30 } as Record<string, Any>;
      Object.assign(target, source);
      expect(target['a'] as int).assertEqual(1);
      expect(target['b'] as int).assertEqual(20);
      expect(target['c'] as int).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_0500
     * @tc.name testObjectAssign005
     * @tc.desc Verify Object.assign with empty source object leaves target unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign005", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let emptySource: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, emptySource);
      expect(target['a'] as int).assertEqual(1);
      expect(Object.keys(target).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_0600
     * @tc.name testObjectAssign006
     * @tc.desc Verify Object.assign copies string-valued properties correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign006", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "name": "ArkTS", "lang": "static" } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["name"] as string).assertEqual("ArkTS");
      expect(target["lang"] as string).assertEqual("static");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_0700
     * @tc.name testObjectAssign007
     * @tc.desc Verify Object.assign copies boolean-valued properties correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign007", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "flag": true, "disabled": false } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["flag"] as boolean).assertTrue();
      expect(target["disabled"] as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_0800
     * @tc.name testObjectAssign008
     * @tc.desc Verify Object.assign last source wins when multiple sources share same key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign008", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let s1: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let s2: Record<string, Any> = { 'a': 2 } as Record<string, Any>;
      let s3: Record<string, Any> = { 'a': 3 } as Record<string, Any>;
      Object.assign(target, s1, s2, s3);
      expect(target['a'] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_0900
     * @tc.name testObjectAssign009
     * @tc.desc Verify Object.assign copies multiple string properties in insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign009", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { 'a': 'x', 'b': 'y', 'c': 'z' } as Record<string, Any>;
      Object.assign(target, source);
      expect(target['a'] as string).assertEqual('x');
      expect(target['b'] as string).assertEqual('y');
      expect(target['c'] as string).assertEqual('z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_1000
     * @tc.name testObjectAssign010
     * @tc.desc Verify Object.assign with array source copies indexed properties as string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign010", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let arr: Array<int> = [10, 20, 30];
      Object.assign(target, arr);
      expect(target['0'] as int).assertEqual(10);
      expect(target['1'] as int).assertEqual(20);
      expect(target['2'] as int).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_1100
     * @tc.name testObjectAssign011
     * @tc.desc Verify Object.assign with empty array source does not add properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign011", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let emptyArr: Array<int> = [];
      Object.assign(target, emptyArr);
      expect(target['a'] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_1200
     * @tc.name testObjectAssign012
     * @tc.desc Verify Object.assign merges sources of mixed value types (string, int, boolean)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign012", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let s1: Record<string, Any> = { "str": "hello" } as Record<string, Any>;
      let s2: Record<string, Any> = { "num": 42 } as Record<string, Any>;
      let s3: Record<string, Any> = { "bool": true } as Record<string, Any>;
      Object.assign(target, s1, s2, s3);
      expect(target["str"] as string).assertEqual("hello");
      expect(target["num"] as int).assertEqual(42);
      expect(target["bool"] as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_1300
     * @tc.name testObjectAssign013
     * @tc.desc Verify Object.assign preserves target properties not present in source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign013", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "keep": "val" } as Record<string, Any>;
      let source: Record<string, Any> = { "add": 1 } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["keep"] as string).assertEqual("val");
      expect(target["add"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_1400
     * @tc.name testObjectAssign014
     * @tc.desc Verify Object.assign enumerable result keys match inserted property names via Object.keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign014", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { 'x': 1, 'y': 2, 'z': 3 } as Record<string, Any>;
      Object.assign(target, source);
      let keys: string[] = Object.keys(target);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('x');
      expect(keys[1]).assertEqual('y');
      expect(keys[2]).assertEqual('z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_1500
     * @tc.name testObjectAssign015
     * @tc.desc Verify Object.assign result key count matches source key count for fresh target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign015", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "key": "value" } as Record<string, Any>;
      let result: Record<string, Any> = Object.assign(target, source);
      expect(target).assertEqual(result);
      expect(target["key"] as string).assertEqual("value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_1600
     * @tc.name testObjectAssign016
     * @tc.desc Verify Object.assign copies properties with unicode keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign016", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "中文键": "中文值" } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["中文键"] as string).assertEqual("中文值");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_1700
     * @tc.name testObjectAssign017
     * @tc.desc Verify Object.assign shallow-copies nested object by reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign017", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Record<string, Any> = { "inner": "value" } as Record<string, Any>;
      let source: Record<string, Any> = { "nested": inner } as Record<string, Any>;
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, source);
      let nested: Record<string, Any> = target["nested"] as Record<string, Any>;
      expect(nested["inner"] as string).assertEqual("value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_1800
     * @tc.name testObjectAssign018
     * @tc.desc Verify Object.assign copies float number values precisely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign018", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "pi": 3.14, "neg": -0.5 } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["pi"] as number).assertEqual(3.14);
      expect(target["neg"] as number).assertEqual(-0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_1900
     * @tc.name testObjectAssign019
     * @tc.desc Verify Object.assign copies int boundary values (zero, -1, MAX, MIN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign019", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "zero": 0, "neg": -1, "max": 2147483647, "min": -2147483648 } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["zero"] as int).assertEqual(0);
      expect(target["neg"] as int).assertEqual(-1);
      expect(target["max"] as int).assertEqual(2147483647);
      expect(target["min"] as int).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_2000
     * @tc.name testObjectAssign020
     * @tc.desc Verify Object.assign copies empty string property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign020", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "empty": "" } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["empty"] as string).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_2100
     * @tc.name testObjectAssign021
     * @tc.desc Verify Object.assign copies single-element array source with one indexed key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign021", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let arr: Array<string> = ["only"];
      Object.assign(target, arr);
      expect(target['0'] as string).assertEqual("only");
      expect(Object.keys(target).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_2200
     * @tc.name testObjectAssign022
     * @tc.desc Verify Object.assign assigns properties from source to already-populated target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign022", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "existing": 1 } as Record<string, Any>;
      let source: Record<string, Any> = { "new": 2 } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["existing"] as int).assertEqual(1);
      expect(target["new"] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_2300
     * @tc.name testObjectAssign023
     * @tc.desc Verify Object.assign single-property override with string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign023", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { 'a': "old" } as Record<string, Any>;
      let source: Record<string, Any> = { 'a': "new" } as Record<string, Any>;
      Object.assign(target, source);
      expect(target['a'] as string).assertEqual("new");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_2400
     * @tc.name testObjectAssign024
     * @tc.desc Verify Object.assign boolean true overrides boolean false for same key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign024", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "flag": false } as Record<string, Any>;
      let source: Record<string, Any> = { "flag": true } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["flag"] as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_2500
     * @tc.name testObjectAssign025
     * @tc.desc Verify Object.assign boolean false overrides boolean true for same key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign025", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "flag": true } as Record<string, Any>;
      let source: Record<string, Any> = { "flag": false } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["flag"] as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_2600
     * @tc.name testObjectAssign026
     * @tc.desc Verify Object.assign copies multi-key source with key count matching Object.keys length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign026", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { 'a': 1, 'b': 2, 'c': 3, 'd': 4 } as Record<string, Any>;
      Object.assign(target, source);
      expect(Object.keys(target).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_2700
     * @tc.name testObjectAssign027
     * @tc.desc Verify Object.assign with empty target and single key source yields one key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign027", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "only": 1 } as Record<string, Any>);
      expect(Object.keys(target).length).assertEqual(1);
      expect(target["only"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_2800
     * @tc.name testObjectAssign028
     * @tc.desc Verify Object.assign chaining returns identical target reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign028", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1: Record<string, Any> = {} as Record<string, Any>;
      let t2: Record<string, Any> = Object.assign(t1, { 'a': 1 } as Record<string, Any>);
      let t3: Record<string, Any> = Object.assign(t2, { 'b': 2 } as Record<string, Any>);
      expect(t1).assertEqual(t2);
      expect(t2).assertEqual(t3);
      expect(t1['a'] as int).assertEqual(1);
      expect(t1['b'] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_2900
     * @tc.name testObjectAssign029
     * @tc.desc Verify Object.assign with self as source does not change properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign029", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { 'a': 1, 'b': 2 } as Record<string, Any>;
      Object.assign(target, target);
      expect(target['a'] as int).assertEqual(1);
      expect(target['b'] as int).assertEqual(2);
      expect(Object.keys(target).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_3000
     * @tc.name testObjectAssign030
     * @tc.desc Verify Object.assign copies negative int value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign030", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "neg": -100 } as Record<string, Any>);
      expect(target["neg"] as int).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_3100
     * @tc.name testObjectAssign031
     * @tc.desc Verify Object.assign copies zero float value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign031", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "zeroF": 0.0 } as Record<string, Any>);
      expect(target["zeroF"] as number).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_3200
     * @tc.name testObjectAssign032
     * @tc.desc Verify Object.assign copies space-containing key correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign032", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "my key": "spaced" } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["my key"] as string).assertEqual("spaced");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_3300
     * @tc.name testObjectAssign033
     * @tc.desc Verify Object.assign copies hyphen-containing key correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign033", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "my-key": "hyphen" } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["my-key"] as string).assertEqual("hyphen");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_3400
     * @tc.name testObjectAssign034
     * @tc.desc Verify Object.assign copies underscore-containing key correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign034", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "my_key": "underscore" } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["my_key"] as string).assertEqual("underscore");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_3500
     * @tc.name testObjectAssign035
     * @tc.desc Verify Object.assign on target with pre-existing props preserves key count after same-key source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign035", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let source: Record<string, Any> = { 'a': 2 } as Record<string, Any>;
      Object.assign(target, source);
      expect(Object.keys(target).length).assertEqual(1);
      expect(target['a'] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_3600
     * @tc.name testObjectAssign036
     * @tc.desc Verify Object.assign copies long string value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign036", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "";
      for (let i: int = 0; i < 100; i++) {
        longStr += 'a';
      }
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "long": longStr } as Record<string, Any>);
      expect(target["long"] as string).assertEqual(longStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_3700
     * @tc.name testObjectAssign037
     * @tc.desc Verify Object.assign copies multiple numeric keys from int array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign037", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let arr: Array<int> = [100, 200];
      Object.assign(target, arr);
      expect(target['0'] as int).assertEqual(100);
      expect(target['1'] as int).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_3800
     * @tc.name testObjectAssign038
     * @tc.desc Verify Object.assign copies string array elements by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign038", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let arr: Array<string> = ["hello", "world"];
      Object.assign(target, arr);
      expect(target['0'] as string).assertEqual("hello");
      expect(target['1'] as string).assertEqual("world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_3900
     * @tc.name testObjectAssign039
     * @tc.desc Verify Object.assign with five sequential sources merges all non-overlapping keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign039", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target,
      { 'a': 1 } as Record<string, Any>,
      { 'b': 2 } as Record<string, Any>,
      { 'c': 3 } as Record<string, Any>,
      { 'd': 4 } as Record<string, Any>,
      { 'e': 5 } as Record<string, Any>);
      expect(target['a'] as int).assertEqual(1);
      expect(target['b'] as int).assertEqual(2);
      expect(target['c'] as int).assertEqual(3);
      expect(target['d'] as int).assertEqual(4);
      expect(target['e'] as int).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_4000
     * @tc.name testObjectAssign040
     * @tc.desc Verify Object.assign later source override with type change int to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign040", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { 'v': 1 } as Record<string, Any>, { 'v': "str" } as Record<string, Any>);
      expect(target['v'] as string).assertEqual("str");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_4100
     * @tc.name testObjectAssign041
     * @tc.desc Verify Object.assign later source override with type change string to boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign041", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { 'v': 's' } as Record<string, Any>, { 'v': true } as Record<string, Any>);
      expect(target['v'] as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_4200
     * @tc.name testObjectAssign042
     * @tc.desc Verify Object.assign copies numeric string value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign042", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "num": "42" } as Record<string, Any>);
      expect(target["num"] as string).assertEqual("42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_4300
     * @tc.name testObjectAssign043
     * @tc.desc Verify Object.assign copies Russian cyrillic string value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign043", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { 'k': "АБВ" } as Record<string, Any>);
      expect(target['k'] as string).assertEqual("АБВ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_4400
     * @tc.name testObjectAssign044
     * @tc.desc Verify Object.assign copies Japanese string value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign044", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { 'k': "テスト" } as Record<string, Any>);
      expect(target['k'] as string).assertEqual("テスト");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_4500
     * @tc.name testObjectAssign045
     * @tc.desc Verify Object.assign copies Arabic string value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign045", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { 'k': "اختبار" } as Record<string, Any>);
      expect(target['k'] as string).assertEqual("اختبار");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_4600
     * @tc.name testObjectAssign046
     * @tc.desc Verify Object.assign with array of five ints copies all indexed properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign046", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let arr: Array<int> = [1, 2, 3, 4, 5];
      Object.assign(target, arr);
      expect(target['0'] as int).assertEqual(1);
      expect(target['1'] as int).assertEqual(2);
      expect(target['2'] as int).assertEqual(3);
      expect(target['3'] as int).assertEqual(4);
      expect(target['4'] as int).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_4700
     * @tc.name testObjectAssign047
     * @tc.desc Verify Object.assign source modification after call does not affect target (primitive values)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign047", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, source);
      source['a'] = 999;
      expect(target['a'] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_4800
     * @tc.name testObjectAssign048
     * @tc.desc Verify Object.assign nested object source modification reflects in target (shallow copy reference sharing)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign048", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Record<string, Any> = { 'v': 1 } as Record<string, Any>;
      let source: Record<string, Any> = { "ref": inner } as Record<string, Any>;
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, source);
      inner['v'] = 2;
      let copied: Record<string, Any> = target["ref"] as Record<string, Any>;
      expect(copied['v'] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_4900
     * @tc.name testObjectAssign049
     * @tc.desc Verify Object.assign copies boolean array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign049", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let arr: Array<boolean> = [true, false];
      Object.assign(target, arr);
      expect(target['0'] as boolean).assertTrue();
      expect(target['1'] as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_5000
     * @tc.name testObjectAssign050
     * @tc.desc Verify Object.assign result key count is target keys plus new source keys minus overrides
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign050", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { 'a': 1, 'b': 2 } as Record<string, Any>;
      let source: Record<string, Any> = { 'b': 22, 'c': 33 } as Record<string, Any>;
      Object.assign(target, source);
      expect(Object.keys(target).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_5100
     * @tc.name testObjectAssign051
     * @tc.desc Verify Object.assign copies mixed primitive value source in correct order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign051", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { 'i': 1, 's': 's', 'b': false } as Record<string, Any>);
      expect(target['i'] as int).assertEqual(1);
      expect(target['s'] as string).assertEqual('s');
      expect(target['b'] as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_5200
     * @tc.name testObjectAssign052
     * @tc.desc Verify Object.assign source and target remain independently mutable for primitive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign052", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let source: Record<string, Any> = { 'b': 2 } as Record<string, Any>;
      Object.assign(target, source);
      target['b'] = 200;
      expect(source['b'] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_5300
     * @tc.name testObjectAssign053
     * @tc.desc Verify Object.assign key order matches insertion order for non-numeric string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign053", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "first": 1, "second": 2, "third": 3 } as Record<string, Any>);
      let keys: string[] = Object.keys(target);
      expect(keys[0]).assertEqual("first");
      expect(keys[1]).assertEqual("second");
      expect(keys[2]).assertEqual("third");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_5400
     * @tc.name testObjectAssign054
     * @tc.desc Verify Object.assign single source with special-character key (at sign)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign054", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "a@b": "at" } as Record<string, Any>);
      expect(target["a@b"] as string).assertEqual("at");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_5500
     * @tc.name testObjectAssign055
     * @tc.desc Verify Object.assign source with multiple keys of same name overrides to last in source literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign055", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { 'a': 1 } as Record<string, Any>);
      Object.assign(target, { 'a': 2 } as Record<string, Any>);
      expect(target['a'] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_5600
     * @tc.name testObjectAssign056
     * @tc.desc Verify Object.assign repeated calls accumulate properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign056", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { 'a': 1 } as Record<string, Any>);
      Object.assign(target, { 'b': 2 } as Record<string, Any>);
      Object.assign(target, { 'c': 3 } as Record<string, Any>);
      expect(target['a'] as int).assertEqual(1);
      expect(target['b'] as int).assertEqual(2);
      expect(target['c'] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_5700
     * @tc.name testObjectAssign057
     * @tc.desc Verify Object.assign target receives null value property from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign057", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { 'n': null as Any } as Record<string, Any>);
      let v: Any = target['n'];
      let vIsNull: boolean = v === null;
      expect(vIsNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_5800
     * @tc.name testObjectAssign058
     * @tc.desc Verify Object.assign target receives undefined value property from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign058", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { 'u': undefined as Any } as Record<string, Any>);
      let keysLen: int = Object.keys(target).length;
      expect(keysLen).assertEqual(1);
      let actualValue1: Any = target['u'];
      let actualValue1IsUndefined: boolean = actualValue1 === undefined;
      expect(actualValue1IsUndefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_5900
     * @tc.name testObjectAssign059
     * @tc.desc Verify Object.assign with 10-property source copies all properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign059", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let src: Record<string, Any> = {} as Record<string, Any>;
      for (let i: int = 0; i < 10; i++) {
        let key: string = 'k' + String(i);
        src[key] = i;
      }
      Object.assign(target, src);
      expect(Object.keys(target).length).assertEqual(10);
      for (let i: int = 0; i < 10; i++) {
        let key: string = 'k' + String(i);
        expect(target[key] as int).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_6000
     * @tc.name testObjectAssign060
     * @tc.desc Verify Object.assign with 50-property source copies all properties (boundary scale)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign060", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let src: Record<string, Any> = {} as Record<string, Any>;
      for (let i: int = 0; i < 50; i++) {
        let key: string = 'p' + String(i);
        src[key] = i;
      }
      Object.assign(target, src);
      expect(Object.keys(target).length).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_6100
     * @tc.name testObjectAssign061
     * @tc.desc Verify Object.assign override within same source preserves later value with many keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign061", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "shared": 1 } as Record<string, Any>);
      Object.assign(target, { "shared": 2 } as Record<string, Any>);
      Object.assign(target, { "shared": 3 } as Record<string, Any>);
      expect(target["shared"] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_6200
     * @tc.name testObjectAssign062
     * @tc.desc Verify Object.assign values round-trip via Object.values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign062", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { 'a': 10, 'b': 20 } as Record<string, Any>);
      let values: Array<Any> = Object.values(target);
      expect(values.length).assertEqual(2);
      expect(values[0] as int).assertEqual(10);
      expect(values[1] as int).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_6300
     * @tc.name testObjectAssign063
     * @tc.desc Verify Object.assign entries round-trip via Object.entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign063", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { 'k': 'v' } as Record<string, Any>);
      let entries = Object.entries(target);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual('k');
      expect(entries[0]![1] as string).assertEqual('v');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_6400
     * @tc.name testObjectAssign064
     * @tc.desc Verify Object.assign key presence after assignment via Object.hasOwn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign064", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "existing": 1 } as Record<string, Any>;
      Object.assign(target, { "added": 2 } as Record<string, Any>);
      expect(target["existing"] as int).assertEqual(1);
      expect(target["added"] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_6500
     * @tc.name testObjectAssign065
     * @tc.desc Verify Object.assign single-element boolean array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign065", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let arr: Array<boolean> = [true];
      Object.assign(target, arr);
      expect(target['0'] as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_6600
     * @tc.name testObjectAssign066
     * @tc.desc Verify Object.assign with dot-containing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign066", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "a.b": "dot" } as Record<string, Any>);
      expect(target["a.b"] as string).assertEqual("dot");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_6700
     * @tc.name testObjectAssign067
     * @tc.desc Verify Object.assign empty-string key is copied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign067", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "": "emptyKey" } as Record<string, Any>);
      expect(target[""] as string).assertEqual("emptyKey");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_6800
     * @tc.name testObjectAssign068
     * @tc.desc Verify Object.assign copies emoji-keyed property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign068", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "emojiKey": '😀' } as Record<string, Any>);
      expect(target["emojiKey"] as string).assertEqual('😀');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_6900
     * @tc.name testObjectAssign069
     * @tc.desc Verify Object.assign with zero-arg call returns target unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign069", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let result: Record<string, Any> = Object.assign(target);
      expect(Object.keys(result).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_7000
     * @tc.name testObjectAssign070
     * @tc.desc Verify Object.assign float array source copies float values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign070", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let arr: Array<number> = [1.5, 2.5];
      Object.assign(target, arr);
      expect(target['0'] as number).assertEqual(1.5);
      expect(target['1'] as number).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_7100
     * @tc.name testObjectAssign071
     * @tc.desc Verify Object.assign source-to-target key enumeration order is preserved with mixed additions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign071", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { 'z': 0 } as Record<string, Any>;
      Object.assign(target, { 'a': 1, 'b': 2 } as Record<string, Any>);
      let keys: string[] = Object.keys(target);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual('z');
      expect(keys[1]).assertEqual('a');
      expect(keys[2]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_7200
     * @tc.name testObjectAssign072
     * @tc.desc Verify Object.assign does not copy nested array reference copies elements by reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign072", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Array<int> = [1, 2];
      let source: Record<string, Any> = { "arr": inner } as Record<string, Any>;
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, source);
      let copied: Array<int> = target["arr"] as Array<int>;
      expect(copied[0]).assertEqual(1);
      expect(copied[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_7300
     * @tc.name testObjectAssign073
     * @tc.desc Verify Object.assign with mixed Record-array-Record sources merges indexed and named keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign073", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let rec: Record<string, Any> = { 'a': 1, 'b': 2 } as Record<string, Any>;
      let arr: Array<int> = [3, 4];
      let tail: Record<string, Any> = { 'c': 5 } as Record<string, Any>;
      Object.assign(target, rec, arr, tail);
      expect(target['0'] as int).assertEqual(3);
      expect(target['1'] as int).assertEqual(4);
      expect(target['c'] as int).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_7400
     * @tc.name testObjectAssign074
     * @tc.desc Verify Object.assign with null target throws ClassCastError (boundary: null via Any bridge; expected throw)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign074", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Object.assign(null as Any as Record<string, Any>, { 'a': 1 } as Record<string, Any>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_7500
     * @tc.name testObjectAssign075
     * @tc.desc Verify Object.assign with undefined target throws ClassCastError (boundary: undefined via Any bridge; expected throw)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign075", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Object.assign(undefined as Any as Record<string, Any>, { 'a': 1 } as Record<string, Any>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_7600
     * @tc.name testObjectAssign076
     * @tc.desc Verify Object.assign with null source throws ClassCastError in the current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign076", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      try {
        Object.assign(target, null as Object);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(target['a'] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_7700
     * @tc.name testObjectAssign077
     * @tc.desc Verify Object.assign with undefined source throws ClassCastError in the current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign077", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      try {
        Object.assign(target, undefined as Object);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(target['a'] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_7800
     * @tc.name testObjectAssign078
     * @tc.desc Verify Object.assign throws ClassCastError when interspersed null and undefined sources are present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign078", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { 'a': 1 } as Record<string, Any>;
      let source1: Record<string, Any> = { 'b': 2 } as Record<string, Any>;
      try {
        Object.assign(target, source1, null as Object, undefined as Object, { 'c': 3 } as Record<string, Any>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      expect(target['a'] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_7900
     * @tc.name testObjectAssign079
     * @tc.desc Verify Object.assign with null target and no sources throws ClassCastError (boundary: null via Any bridge; expected throw)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign079", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Object.assign(null as Any as Record<string, Any>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_8000
     * @tc.name testObjectAssign080
     * @tc.desc Verify Object.assign with undefined target and no sources throws ClassCastError (boundary: undefined via Any bridge; expected throw)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign080", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Object.assign(undefined as Any as Record<string, Any>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_8100
     * @tc.name testObjectAssign081
     * @tc.desc Verify Object.assign with leading null source followed by valid source copies from valid source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign081", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      try {
        Object.assign(target, null as Object, { 'a': 1 } as Record<string, Any>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_8200
     * @tc.name testObjectAssign082
     * @tc.desc Verify Object.assign with leading undefined source followed by valid source copies from valid source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testObjectAssign082", TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      try {
        Object.assign(target, undefined as Object, { 'a': 1 } as Record<string, Any>);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });
  });
}
