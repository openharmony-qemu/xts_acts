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

export default function ObjectAssignTest(): void {
  describe('ObjectAssignTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_0100
     * @tc.name testObjectAssign0100
     * @tc.desc Verify Object.assign with no sources returns the target itself (identity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      let result: Record<string, Any> = Object.assign(target);
      expect(target).assertEqual(result);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_0200
     * @tc.name testObjectAssign0200
     * @tc.desc Verify Object.assign with single source copies one property to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      let result: Record<string, Any> = Object.assign(target, source);
      expect(target).assertEqual(result);
      expect(target["a"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_0300
     * @tc.name testObjectAssign0300
     * @tc.desc Verify Object.assign with two sources copies non-overlapping properties from both
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source1: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      let source2: Record<string, Any> = { "b": 2 } as Record<string, Any>;
      Object.assign(target, source1, source2);
      expect(target["a"] as int).assertEqual(1);
      expect(target["b"] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_0400
     * @tc.name testObjectAssign0400
     * @tc.desc Verify Object.assign overwrites existing target property with same-named source property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "a": 1, "b": 2 } as Record<string, Any>;
      let source: Record<string, Any> = { "b": 20, "c": 30 } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["a"] as int).assertEqual(1);
      expect(target["b"] as int).assertEqual(20);
      expect(target["c"] as int).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_0500
     * @tc.name testObjectAssign0500
     * @tc.desc Verify Object.assign with empty source object leaves target unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      let emptySource: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, emptySource);
      expect(target["a"] as int).assertEqual(1);
      expect(Object.keys(target).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_0600
     * @tc.name testObjectAssign0600
     * @tc.desc Verify Object.assign copies string-valued properties correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "name": "ArkTS", "lang": "static" } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["name"] as string).assertEqual("ArkTS");
      expect(target["lang"] as string).assertEqual("static");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_0700
     * @tc.name testObjectAssign0700
     * @tc.desc Verify Object.assign copies boolean-valued properties correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "flag": true, "disabled": false } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["flag"] as boolean).assertTrue();
      expect(target["disabled"] as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_0800
     * @tc.name testObjectAssign0800
     * @tc.desc Verify Object.assign last source wins when multiple sources share same key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let s1: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      let s2: Record<string, Any> = { "a": 2 } as Record<string, Any>;
      let s3: Record<string, Any> = { "a": 3 } as Record<string, Any>;
      Object.assign(target, s1, s2, s3);
      expect(target["a"] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_0900
     * @tc.name testObjectAssign0900
     * @tc.desc Verify Object.assign copies multiple string properties in insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "a": "x", "b": "y", "c": "z" } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["a"] as string).assertEqual("x");
      expect(target["b"] as string).assertEqual("y");
      expect(target["c"] as string).assertEqual("z");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_1000
     * @tc.name testObjectAssign1000
     * @tc.desc Verify Object.assign with array source copies indexed properties as string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let arr: Array<int> = [10, 20, 30];
      Object.assign(target, arr);
      expect(target["0"] as int).assertEqual(10);
      expect(target["1"] as int).assertEqual(20);
      expect(target["2"] as int).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_1100
     * @tc.name testObjectAssign1100
     * @tc.desc Verify Object.assign with empty array source does not add properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      let emptyArr: Array<int> = [];
      Object.assign(target, emptyArr);
      expect(target["a"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_1200
     * @tc.name testObjectAssign1200
     * @tc.desc Verify Object.assign merges sources of mixed value types (string, int, boolean)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testObjectAssign1300
     * @tc.desc Verify Object.assign preserves target properties not present in source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "keep": "val" } as Record<string, Any>;
      let source: Record<string, Any> = { "add": 1 } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["keep"] as string).assertEqual("val");
      expect(target["add"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_1400
     * @tc.name testObjectAssign1400
     * @tc.desc Verify Object.assign retains, overwrites and adds properties in one call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign1400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "keep": 100, "overwrite": 1 } as Record<string, Any>;
      let source: Record<string, Any> = { "overwrite": 999, "add": 200 } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["keep"] as int).assertEqual(100);
      expect(target["overwrite"] as int).assertEqual(999);
      expect(target["add"] as int).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_1500
     * @tc.name testObjectAssign1500
     * @tc.desc Verify Object.assign enumerable result keys match inserted property names via Object.keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "x": 1, "y": 2, "z": 3 } as Record<string, Any>;
      Object.assign(target, source);
      let keys: string[] = Object.keys(target);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual("x");
      expect(keys[1]).assertEqual("y");
      expect(keys[2]).assertEqual("z");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_1600
     * @tc.name testObjectAssign1600
     * @tc.desc Verify Object.assign result key count matches source key count for fresh target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign1600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "key": "value" } as Record<string, Any>;
      let result: Record<string, Any> = Object.assign(target, source);
      expect(target).assertEqual(result);
      expect(target["key"] as string).assertEqual("value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_1700
     * @tc.name testObjectAssign1700
     * @tc.desc Verify Object.assign copies properties with unicode keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign1700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "中文键": "中文值" } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["中文键"] as string).assertEqual("中文值");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_1800
     * @tc.name testObjectAssign1800
     * @tc.desc Verify Object.assign shallow-copies nested object by reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign1800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Record<string, Any> = { "inner": "value" } as Record<string, Any>;
      let source: Record<string, Any> = { "nested": inner } as Record<string, Any>;
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, source);
      let nested: Record<string, Any> = target["nested"] as Record<string, Any>;
      expect(nested["inner"] as string).assertEqual("value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_1900
     * @tc.name testObjectAssign1900
     * @tc.desc Verify Object.assign copies float number values precisely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign1900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "pi": 3.14, "neg": -0.5 } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["pi"] as number).assertEqual(3.14);
      expect(target["neg"] as number).assertEqual(-0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_2000
     * @tc.name testObjectAssign2000
     * @tc.desc Verify Object.assign copies int boundary values (zero, -1, MAX, MIN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign2000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "zero": 0, "neg": -1, "max": 2147483647, "min": -2147483648 } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["zero"] as int).assertEqual(0);
      expect(target["neg"] as int).assertEqual(-1);
      expect(target["max"] as int).assertEqual(2147483647);
      expect(target["min"] as int).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_2100
     * @tc.name testObjectAssign2100
     * @tc.desc Verify Object.assign copies empty string property value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign2100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "empty": "" } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["empty"] as string).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_2200
     * @tc.name testObjectAssign2200
     * @tc.desc Verify Object.assign copies single-element array source with one indexed key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign2200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let arr: Array<string> = ["only"];
      Object.assign(target, arr);
      expect(target["0"] as string).assertEqual("only");
      expect(Object.keys(target).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_2300
     * @tc.name testObjectAssign2300
     * @tc.desc Verify Object.assign assigns properties from source to already-populated target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign2300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "existing": 1 } as Record<string, Any>;
      let source: Record<string, Any> = { "new": 2 } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["existing"] as int).assertEqual(1);
      expect(target["new"] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_2400
     * @tc.name testObjectAssign2400
     * @tc.desc Verify Object.assign single-property override with string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign2400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "a": "old" } as Record<string, Any>;
      let source: Record<string, Any> = { "a": "new" } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["a"] as string).assertEqual("new");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_2500
     * @tc.name testObjectAssign2500
     * @tc.desc Verify Object.assign boolean true overrides boolean false for same key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign2500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "flag": false } as Record<string, Any>;
      let source: Record<string, Any> = { "flag": true } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["flag"] as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_2600
     * @tc.name testObjectAssign2600
     * @tc.desc Verify Object.assign boolean false overrides boolean true for same key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign2600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "flag": true } as Record<string, Any>;
      let source: Record<string, Any> = { "flag": false } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["flag"] as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_2700
     * @tc.name testObjectAssign2700
     * @tc.desc Verify Object.assign copies multi-key source with key count matching Object.keys length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign2700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "a": 1, "b": 2, "c": 3, "d": 4 } as Record<string, Any>;
      Object.assign(target, source);
      expect(Object.keys(target).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_2800
     * @tc.name testObjectAssign2800
     * @tc.desc Verify Object.assign with empty target and single key source yields one key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign2800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "only": 1 } as Record<string, Any>);
      expect(Object.keys(target).length).assertEqual(1);
      expect(target["only"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_2900
     * @tc.name testObjectAssign2900
     * @tc.desc Verify Object.assign chaining returns identical target reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign2900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1: Record<string, Any> = {} as Record<string, Any>;
      let t2: Record<string, Any> = Object.assign(t1, { "a": 1 } as Record<string, Any>);
      let t3: Record<string, Any> = Object.assign(t2, { "b": 2 } as Record<string, Any>);
      expect(t1).assertEqual(t2);
      expect(t2).assertEqual(t3);
      expect(t1["a"] as int).assertEqual(1);
      expect(t1["b"] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_3000
     * @tc.name testObjectAssign3000
     * @tc.desc Verify Object.assign with self as source does not change properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign3000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "a": 1, "b": 2 } as Record<string, Any>;
      Object.assign(target, target);
      expect(target["a"] as int).assertEqual(1);
      expect(target["b"] as int).assertEqual(2);
      expect(Object.keys(target).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_3100
     * @tc.name testObjectAssign3100
     * @tc.desc Verify Object.assign copies zero int value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign3100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "zero": 0 } as Record<string, Any>);
      expect(target["zero"] as int).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_3200
     * @tc.name testObjectAssign3200
     * @tc.desc Verify Object.assign copies negative int value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign3200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "neg": -100 } as Record<string, Any>);
      expect(target["neg"] as int).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_3300
     * @tc.name testObjectAssign3300
     * @tc.desc Verify Object.assign copies zero float value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign3300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "zeroF": 0.0 } as Record<string, Any>);
      expect(target["zeroF"] as number).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_3400
     * @tc.name testObjectAssign3400
     * @tc.desc Verify Object.assign copies space-containing key correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign3400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "my key": "spaced" } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["my key"] as string).assertEqual("spaced");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_3500
     * @tc.name testObjectAssign3500
     * @tc.desc Verify Object.assign copies hyphen-containing key correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign3500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "my-key": "hyphen" } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["my-key"] as string).assertEqual("hyphen");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_3600
     * @tc.name testObjectAssign3600
     * @tc.desc Verify Object.assign copies underscore-containing key correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign3600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let source: Record<string, Any> = { "my_key": "underscore" } as Record<string, Any>;
      Object.assign(target, source);
      expect(target["my_key"] as string).assertEqual("underscore");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_3700
     * @tc.name testObjectAssign3700
     * @tc.desc Verify Object.assign on target with pre-existing props preserves key count after same-key source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign3700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      let source: Record<string, Any> = { "a": 2 } as Record<string, Any>;
      Object.assign(target, source);
      expect(Object.keys(target).length).assertEqual(1);
      expect(target["a"] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_3800
     * @tc.name testObjectAssign3800
     * @tc.desc Verify Object.assign copies long string value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign3800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "";
      for (let i: int = 0; i < 100; i++) {
        longStr += "a";
      }
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "long": longStr } as Record<string, Any>);
      expect(target["long"] as string).assertEqual(longStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_3900
     * @tc.name testObjectAssign3900
     * @tc.desc Verify Object.assign copies multiple numeric keys from int array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign3900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let arr: Array<int> = [100, 200];
      Object.assign(target, arr);
      expect(target["0"] as int).assertEqual(100);
      expect(target["1"] as int).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_4000
     * @tc.name testObjectAssign4000
     * @tc.desc Verify Object.assign copies string array elements by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign4000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let arr: Array<string> = ["hello", "world"];
      Object.assign(target, arr);
      expect(target["0"] as string).assertEqual("hello");
      expect(target["1"] as string).assertEqual("world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_4100
     * @tc.name testObjectAssign4100
     * @tc.desc Verify Object.assign with five sequential sources merges all non-overlapping keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign4100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target,
      { "a": 1 } as Record<string, Any>,
      { "b": 2 } as Record<string, Any>,
      { "c": 3 } as Record<string, Any>,
      { "d": 4 } as Record<string, Any>,
      { "e": 5 } as Record<string, Any>);
      expect(target["a"] as int).assertEqual(1);
      expect(target["b"] as int).assertEqual(2);
      expect(target["c"] as int).assertEqual(3);
      expect(target["d"] as int).assertEqual(4);
      expect(target["e"] as int).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_4200
     * @tc.name testObjectAssign4200
     * @tc.desc Verify Object.assign later source override with type change int to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign4200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "v": 1 } as Record<string, Any>, { "v": "str" } as Record<string, Any>);
      expect(target["v"] as string).assertEqual("str");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_4300
     * @tc.name testObjectAssign4300
     * @tc.desc Verify Object.assign later source override with type change string to boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign4300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "v": "s" } as Record<string, Any>, { "v": true } as Record<string, Any>);
      expect(target["v"] as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_4400
     * @tc.name testObjectAssign4400
     * @tc.desc Verify Object.assign copies numeric string value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign4400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "num": "42" } as Record<string, Any>);
      expect(target["num"] as string).assertEqual("42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_4500
     * @tc.name testObjectAssign4500
     * @tc.desc Verify Object.assign copies Russian cyrillic string value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign4500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "k": "АБВ" } as Record<string, Any>);
      expect(target["k"] as string).assertEqual("АБВ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_4600
     * @tc.name testObjectAssign4600
     * @tc.desc Verify Object.assign copies Japanese string value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign4600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "k": "テスト" } as Record<string, Any>);
      expect(target["k"] as string).assertEqual("テスト");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_4700
     * @tc.name testObjectAssign4700
     * @tc.desc Verify Object.assign copies Arabic string value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign4700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "k": "اختبار" } as Record<string, Any>);
      expect(target["k"] as string).assertEqual("اختبار");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_4800
     * @tc.name testObjectAssign4800
     * @tc.desc Verify Object.assign with array of five ints copies all indexed properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign4800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let arr: Array<int> = [1, 2, 3, 4, 5];
      Object.assign(target, arr);
      expect(target["0"] as int).assertEqual(1);
      expect(target["1"] as int).assertEqual(2);
      expect(target["2"] as int).assertEqual(3);
      expect(target["3"] as int).assertEqual(4);
      expect(target["4"] as int).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_4900
     * @tc.name testObjectAssign4900
     * @tc.desc Verify Object.assign source modification after call does not affect target (primitive values)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign4900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, source);
      source["a"] = 999;
      expect(target["a"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_5000
     * @tc.name testObjectAssign5000
     * @tc.desc Verify Object.assign nested object source modification reflects in target (shallow copy reference sharing)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign5000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Record<string, Any> = { "v": 1 } as Record<string, Any>;
      let source: Record<string, Any> = { "ref": inner } as Record<string, Any>;
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, source);
      inner["v"] = 2;
      let copied: Record<string, Any> = target["ref"] as Record<string, Any>;
      expect(copied["v"] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_5100
     * @tc.name testObjectAssign5100
     * @tc.desc Verify Object.assign copies boolean array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign5100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let arr: Array<boolean> = [true, false];
      Object.assign(target, arr);
      expect(target["0"] as boolean).assertTrue();
      expect(target["1"] as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_5200
     * @tc.name testObjectAssign5200
     * @tc.desc Verify Object.assign result key count is target keys plus new source keys minus overrides
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign5200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "a": 1, "b": 2 } as Record<string, Any>;
      let source: Record<string, Any> = { "b": 22, "c": 33 } as Record<string, Any>;
      Object.assign(target, source);
      expect(Object.keys(target).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_5300
     * @tc.name testObjectAssign5300
     * @tc.desc Verify Object.assign copies mixed primitive value source in correct order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign5300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "i": 1, "s": "s", "b": false } as Record<string, Any>);
      expect(target["i"] as int).assertEqual(1);
      expect(target["s"] as string).assertEqual("s");
      expect(target["b"] as boolean).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_5400
     * @tc.name testObjectAssign5400
     * @tc.desc Verify Object.assign with all-null sources skips all and target remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign5400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      let threw: boolean = false;
      let errorName: string = "";
      try {
        Object.assign(target, null as Object, null as Object);
      } catch (e) {
        threw = true;
        errorName = e.name;
      }
      expect(threw).assertTrue();
      expect(errorName).assertEqual("ClassCastError");
      expect(target["a"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_5500
     * @tc.name testObjectAssign5500
     * @tc.desc Verify Object.assign with all-undefined sources skips all and target remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign5500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      let threw: boolean = false;
      let errorName: string = "";
      try {
        Object.assign(target, undefined as Object, undefined as Object);
      } catch (e) {
        threw = true;
        errorName = e.name;
      }
      expect(threw).assertTrue();
      expect(errorName).assertEqual("ClassCastError");
      expect(target["a"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_5600
     * @tc.name testObjectAssign5600
     * @tc.desc Verify Object.assign source and target remain independently mutable for primitive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign5600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      let source: Record<string, Any> = { "b": 2 } as Record<string, Any>;
      Object.assign(target, source);
      target["b"] = 200;
      expect(source["b"] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_5700
     * @tc.name testObjectAssign5700
     * @tc.desc Verify Object.assign key order matches insertion order for non-numeric string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign5700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "first": 1, "second": 2, "third": 3 } as Record<string, Any>);
      let keys: string[] = Object.keys(target);
      expect(keys[0]).assertEqual("first");
      expect(keys[1]).assertEqual("second");
      expect(keys[2]).assertEqual("third");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_5800
     * @tc.name testObjectAssign5800
     * @tc.desc Verify Object.assign single source with special-character key (at sign)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign5800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "a@b": "at" } as Record<string, Any>);
      expect(target["a@b"] as string).assertEqual("at");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_5900
     * @tc.name testObjectAssign5900
     * @tc.desc Verify Object.assign source with multiple keys of same name overrides to last in source literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign5900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "a": 1 } as Record<string, Any>);
      Object.assign(target, { "a": 2 } as Record<string, Any>);
      expect(target["a"] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_6000
     * @tc.name testObjectAssign6000
     * @tc.desc Verify Object.assign repeated calls accumulate properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign6000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "a": 1 } as Record<string, Any>);
      Object.assign(target, { "b": 2 } as Record<string, Any>);
      Object.assign(target, { "c": 3 } as Record<string, Any>);
      expect(target["a"] as int).assertEqual(1);
      expect(target["b"] as int).assertEqual(2);
      expect(target["c"] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_6100
     * @tc.name testObjectAssign6100
     * @tc.desc Verify Object.assign target receives null value property from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign6100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "n": null as Any } as Record<string, Any>);
      let v: Any = target["n"];
      expect(v as null).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_6200
     * @tc.name testObjectAssign6200
     * @tc.desc Verify Object.assign target receives undefined value property from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign6200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "u": undefined as Any } as Record<string, Any>);
      let keysLen: int = Object.keys(target).length;
      expect(keysLen).assertEqual(1);
      expect(target["u"] as undefined).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_6300
     * @tc.name testObjectAssign6300
     * @tc.desc Verify Object.assign with 10-property source copies all properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign6300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let src: Record<string, Any> = {} as Record<string, Any>;
      for (let i: int = 0; i < 10; i++) {
        let key: string = "k" + String(i);
        src[key] = i;
      }
      Object.assign(target, src);
      expect(Object.keys(target).length).assertEqual(10);
      for (let i: int = 0; i < 10; i++) {
        let key: string = "k" + String(i);
        expect(target[key] as int).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_6400
     * @tc.name testObjectAssign6400
     * @tc.desc Verify Object.assign with 50-property source copies all properties (boundary scale)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign6400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let src: Record<string, Any> = {} as Record<string, Any>;
      for (let i: int = 0; i < 50; i++) {
        let key: string = "p" + String(i);
        src[key] = i;
      }
      Object.assign(target, src);
      expect(Object.keys(target).length).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_6500
     * @tc.name testObjectAssign6500
     * @tc.desc Verify Object.assign override within same source preserves later value with many keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign6500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "shared": 1 } as Record<string, Any>);
      Object.assign(target, { "shared": 2 } as Record<string, Any>);
      Object.assign(target, { "shared": 3 } as Record<string, Any>);
      expect(target["shared"] as int).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_6600
     * @tc.name testObjectAssign6600
     * @tc.desc Verify Object.assign values round-trip via Object.values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign6600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "a": 10, "b": 20 } as Record<string, Any>);
      let values: Array<Any> = Object.values(target);
      expect(values.length).assertEqual(2);
      expect(values[0] as int).assertEqual(10);
      expect(values[1] as int).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_6700
     * @tc.name testObjectAssign6700
     * @tc.desc Verify Object.assign entries round-trip via Object.entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign6700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "k": "v" } as Record<string, Any>);
      let entries = Object.entries(target);
      expect(entries.length).assertEqual(1);
      expect(entries[0]![0]).assertEqual("k");
      expect(entries[0]![1] as string).assertEqual("v");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_6800
     * @tc.name testObjectAssign6800
     * @tc.desc Verify Object.assign key presence after assignment via Object.hasOwn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign6800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "existing": 1 } as Record<string, Any>;
      Object.assign(target, { "added": 2 } as Record<string, Any>);
      expect(target["existing"] as int).assertEqual(1);
      expect(target["added"] as int).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_6900
     * @tc.name testObjectAssign6900
     * @tc.desc Verify Object.assign single-element boolean array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign6900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let arr: Array<boolean> = [true];
      Object.assign(target, arr);
      expect(target["0"] as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_7000
     * @tc.name testObjectAssign7000
     * @tc.desc Verify Object.assign with dot-containing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign7000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "a.b": "dot" } as Record<string, Any>);
      expect(target["a.b"] as string).assertEqual("dot");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_7100
     * @tc.name testObjectAssign7100
     * @tc.desc Verify Object.assign empty-string key is copied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign7100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "": "emptyKey" } as Record<string, Any>);
      expect(target[""] as string).assertEqual("emptyKey");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_7200
     * @tc.name testObjectAssign7200
     * @tc.desc Verify Object.assign copies emoji-keyed property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign7200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, { "emojiKey": "😀" } as Record<string, Any>);
      expect(target["emojiKey"] as string).assertEqual("😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_7300
     * @tc.name testObjectAssign7300
     * @tc.desc Verify Object.assign with zero-arg call returns target unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign7300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let result: Record<string, Any> = Object.assign(target);
      expect(Object.keys(result).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_7400
     * @tc.name testObjectAssign7400
     * @tc.desc Verify Object.assign float array source copies float values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign7400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let arr: Array<number> = [1.5, 2.5];
      Object.assign(target, arr);
      expect(target["0"] as number).assertEqual(1.5);
      expect(target["1"] as number).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_7500
     * @tc.name testObjectAssign7500
     * @tc.desc Verify Object.assign source-to-target key enumeration order is preserved with mixed additions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign7500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "z": 0 } as Record<string, Any>;
      Object.assign(target, { "a": 1, "b": 2 } as Record<string, Any>);
      let keys: string[] = Object.keys(target);
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual("z");
      expect(keys[1]).assertEqual("a");
      expect(keys[2]).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_7600
     * @tc.name testObjectAssign7600
     * @tc.desc Verify Object.assign does not copy nested array reference copies elements by reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign7600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Array<int> = [1, 2];
      let source: Record<string, Any> = { "arr": inner } as Record<string, Any>;
      let target: Record<string, Any> = {} as Record<string, Any>;
      Object.assign(target, source);
      let copied: Array<int> = target["arr"] as Array<int>;
      expect(copied[0]).assertEqual(1);
      expect(copied[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_7700
     * @tc.name testObjectAssign7700
     * @tc.desc Verify Object.assign with mixed Record-array-Record sources merges indexed and named keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign7700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_7800
     * @tc.name testObjectAssign7800
     * @tc.desc Verify Object.assign with null target throws ClassCastError (boundary: null via Any bridge; expected throw)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign7800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      let errorName: string = "";
      try {
        Object.assign(null as Any as Record<string, Any>, { 'a': 1 } as Record<string, Any>);
      } catch (e) {
        threw = true;
        errorName = e.name;
      }
      expect(threw).assertTrue();
      expect(errorName).assertEqual("ClassCastError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_7900
     * @tc.name testObjectAssign7900
     * @tc.desc Verify Object.assign with undefined target throws ClassCastError (boundary: undefined via Any bridge; expected throw)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign7900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      let errorName: string = "";
      try {
        Object.assign(undefined as Any as Record<string, Any>, { 'a': 1 } as Record<string, Any>);
      } catch (e) {
        threw = true;
        errorName = e.name;
      }
      expect(threw).assertTrue();
      expect(errorName).assertEqual("ClassCastError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_8000
     * @tc.name testObjectAssign8000
     * @tc.desc Verify Object.assign with null source throws ClassCastError in the current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign8000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      let threw: boolean = false;
      let errorName: string = "";
      try {
        Object.assign(target, null as Object);
      } catch (e) {
        threw = true;
        errorName = e.name;
      }
      expect(threw).assertTrue();
      expect(errorName).assertEqual("ClassCastError");
      expect(target["a"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_8100
     * @tc.name testObjectAssign8100
     * @tc.desc Verify Object.assign with undefined source throws ClassCastError in the current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign8100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      let threw: boolean = false;
      let errorName: string = "";
      try {
        Object.assign(target, undefined as Object);
      } catch (e) {
        threw = true;
        errorName = e.name;
      }
      expect(threw).assertTrue();
      expect(errorName).assertEqual("ClassCastError");
      expect(target["a"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_8200
     * @tc.name testObjectAssign8200
     * @tc.desc Verify Object.assign throws ClassCastError when interspersed null and undefined sources are present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign8200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = { "a": 1 } as Record<string, Any>;
      let source1: Record<string, Any> = { "b": 2 } as Record<string, Any>;
      let threw: boolean = false;
      let errorName: string = "";
      try {
        Object.assign(target, source1, null as Object, undefined as Object, { "c": 3 } as Record<string, Any>);
      } catch (e) {
        threw = true;
        errorName = e.name;
      }
      expect(threw).assertTrue();
      expect(errorName).assertEqual("ClassCastError");
      expect(target["a"] as int).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_8300
     * @tc.name testObjectAssign8300
     * @tc.desc Verify Object.assign with null target and no sources throws ClassCastError (boundary: null via Any bridge; expected throw)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign8300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      let errorName: string = "";
      try {
        Object.assign(null as Any as Record<string, Any>);
      } catch (e) {
        threw = true;
        errorName = e.name;
      }
      expect(threw).assertTrue();
      expect(errorName).assertEqual("ClassCastError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_8400
     * @tc.name testObjectAssign8400
     * @tc.desc Verify Object.assign with undefined target and no sources throws ClassCastError (boundary: undefined via Any bridge; expected throw)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign8400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      let errorName: string = "";
      try {
        Object.assign(undefined as Any as Record<string, Any>);
      } catch (e) {
        threw = true;
        errorName = e.name;
      }
      expect(threw).assertTrue();
      expect(errorName).assertEqual("ClassCastError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_8500
     * @tc.name testObjectAssign8500
     * @tc.desc Verify Object.assign with leading null source followed by valid source copies from valid source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign8500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let threw: boolean = false;
      let errorName: string = "";
      try {
        Object.assign(target, null as Object, { "a": 1 } as Record<string, Any>);
      } catch (e) {
        threw = true;
        errorName = e.name;
      }
      expect(threw).assertTrue();
      expect(errorName).assertEqual("ClassCastError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_OBJECT_ASSIGN_8600
     * @tc.name testObjectAssign8600
     * @tc.desc Verify Object.assign with leading undefined source followed by valid source copies from valid source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testObjectAssign8600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Record<string, Any> = {} as Record<string, Any>;
      let threw: boolean = false;
      let errorName: string = "";
      try {
        Object.assign(target, undefined as Object, { "a": 1 } as Record<string, Any>);
      } catch (e) {
        threw = true;
        errorName = e.name;
      }
      expect(threw).assertTrue();
      expect(errorName).assertEqual("ClassCastError");
    });
  });
}
