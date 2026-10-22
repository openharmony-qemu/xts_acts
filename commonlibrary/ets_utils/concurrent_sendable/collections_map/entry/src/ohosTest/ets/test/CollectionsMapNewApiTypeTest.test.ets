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
// CollectionsMapNewApiTypeTest.test.ets
// Type traversal tests for containsValue, put, putAll(collections.Map), putAll(Map), remove

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { collections, ArkTSUtils } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

@Sendable class SendableClassBasic { value: number = 0; constructor() { this.value = 100; } }
@Sendable class SendableClassComplex { name: string = "complex"; id: number = 1; constructor() { this.name = "complex"; this.id = 1; } }
@Sendable class SendableClassExtended extends SendableClassBasic { extra: string = "extended"; constructor() { super(); this.extra = "extended"; } }
@Sendable class TestPerson { name: string = ""; age: number = 0; constructor(name: string, age: number) { this.name = name; this.age = age; } }
@Sendable class EmptyClass { constructor() {} }
@Sendable class ComplexIndexSignature { a: number = 1; b: number = 2; c: number = 3; constructor() { this.a = 1; this.b = 2; this.c = 3; } }
@Sendable class CircularRef { name: string = ""; ref: CircularRef | null = null; constructor(name: string) { this.name = name; } }
@Sendable class LargeObject { data: string; constructor() { let arr: number[] = []; for (let i: number = 0; i < 1000; i++) arr.push(i); this.data = JSON.stringify(arr); } getValue(index: number): number { let arr: number[] = JSON.parse(this.data); return arr[index]; } }
@Sendable class DeepNestedObject { level: string = ""; next: DeepNestedObject | null = null; constructor(level: string) { this.level = level; } }
@Sendable class SendableNormalFn { execute(): number { return 42; } }
@Sendable class SendableArrowFn { execute(): number { return 100; } }
@Sendable class SendableAsyncFn { async execute(): Promise<number> { return 200; } }
@Sendable class SendableAddFn { execute(x: number): number { return x + 1; } }
const enum SendableEnum { Success = 0, Failure = 1, Pending = 2 }

export default function CollectionsMapNewApiTypeTest() {
  describe('CollectionsMapNewApiTypeTest', () => {
    beforeAll(() => { console.info('[CollectionsMapNewApiTypeTest] beforeAll'); });
    beforeEach(async () => { await sleep(20); });
    afterEach(() => { console.info('[CollectionsMapNewApiTypeTest] afterEach'); });
    afterAll(() => { console.info('[CollectionsMapNewApiTypeTest] afterAll'); });

    // ==================== number 类型 (16个) ====================
    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_0100
     * @tc.name   testNewApiNumber_normal
     * @tc.desc   Verify put/containsValue/putAll/remove with number type normal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiNumber_normal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const num: number = 100;
      const id: string = 'normal';
      const caseName: string = 'testNewApiNumber_' + id;
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      // put new key
      const r1: string | undefined = map.put(num, 'val_' + id);
      expect(r1).assertEqual(undefined);
      expect(map.size).assertEqual(1);
      // put overwrite
      const r2: string | undefined = map.put(num, 'new_' + id);
      expect(r2).assertEqual('val_' + id);
      // containsValue
      expect(map.containsValue('new_' + id)).assertTrue();
      expect(map.containsValue('not_exist')).assertFalse();
      // putAll(collections.Map) - use fixed different key to avoid NaN/Infinity arithmetic issues
      let src: collections.Map<number, string> = new collections.Map<number, string>();
      src.set(99990, 'src_' + id);
      map.putAll(src);
      expect(map.size).assertEqual(2);
      // putAll(Map)
      let bsrc: Map<number, string> = new Map<number, string>();
      bsrc.set(99995, 'bsrc_' + id);
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      // remove
      const r3: string | undefined = map.remove(num);
      expect(r3).assertEqual('new_' + id);
      const r4: string | undefined = map.remove(num);
      expect(r4).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_0200
     * @tc.name   testNewApiNumber_scientific
     * @tc.desc   Verify put/containsValue/putAll/remove with number type scientific notation.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiNumber_scientific', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const num: number = 1.5e-10;
      const id: string = 'scientific';
      const caseName: string = 'testNewApiNumber_' + id;
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      // put new key
      const r1: string | undefined = map.put(num, 'val_' + id);
      expect(r1).assertEqual(undefined);
      expect(map.size).assertEqual(1);
      // put overwrite
      const r2: string | undefined = map.put(num, 'new_' + id);
      expect(r2).assertEqual('val_' + id);
      // containsValue
      expect(map.containsValue('new_' + id)).assertTrue();
      expect(map.containsValue('not_exist')).assertFalse();
      // putAll(collections.Map) - use fixed different key to avoid NaN/Infinity arithmetic issues
      let src: collections.Map<number, string> = new collections.Map<number, string>();
      src.set(99991, 'src_' + id);
      map.putAll(src);
      expect(map.size).assertEqual(2);
      // putAll(Map)
      let bsrc: Map<number, string> = new Map<number, string>();
      bsrc.set(99996, 'bsrc_' + id);
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      // remove
      const r3: string | undefined = map.remove(num);
      expect(r3).assertEqual('new_' + id);
      const r4: string | undefined = map.remove(num);
      expect(r4).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_0300
     * @tc.name   testNewApiNumber_max_safe
     * @tc.desc   Verify put/containsValue/putAll/remove with number type max safe integer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiNumber_max_safe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const num: number = Number.MAX_SAFE_INTEGER;
      const id: string = 'max_safe';
      const caseName: string = 'testNewApiNumber_' + id;
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      // put new key
      const r1: string | undefined = map.put(num, 'val_' + id);
      expect(r1).assertEqual(undefined);
      expect(map.size).assertEqual(1);
      // put overwrite
      const r2: string | undefined = map.put(num, 'new_' + id);
      expect(r2).assertEqual('val_' + id);
      // containsValue
      expect(map.containsValue('new_' + id)).assertTrue();
      expect(map.containsValue('not_exist')).assertFalse();
      // putAll(collections.Map) - use fixed different key to avoid NaN/Infinity arithmetic issues
      let src: collections.Map<number, string> = new collections.Map<number, string>();
      src.set(99992, 'src_' + id);
      map.putAll(src);
      expect(map.size).assertEqual(2);
      // putAll(Map)
      let bsrc: Map<number, string> = new Map<number, string>();
      bsrc.set(99997, 'bsrc_' + id);
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      // remove
      const r3: string | undefined = map.remove(num);
      expect(r3).assertEqual('new_' + id);
      const r4: string | undefined = map.remove(num);
      expect(r4).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_0400
     * @tc.name   testNewApiNumber_nan
     * @tc.desc   Verify put/containsValue/putAll/remove with number type NaN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiNumber_nan', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const num: number = NaN;
      const id: string = 'nan';
      const caseName: string = 'testNewApiNumber_' + id;
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      // put new key
      const r1: string | undefined = map.put(num, 'val_' + id);
      expect(r1).assertEqual(undefined);
      expect(map.size).assertEqual(1);
      // put overwrite
      const r2: string | undefined = map.put(num, 'new_' + id);
      expect(r2).assertEqual('val_' + id);
      // containsValue
      expect(map.containsValue('new_' + id)).assertTrue();
      expect(map.containsValue('not_exist')).assertFalse();
      // putAll(collections.Map) - use fixed different key to avoid NaN/Infinity arithmetic issues
      let src: collections.Map<number, string> = new collections.Map<number, string>();
      src.set(99993, 'src_' + id);
      map.putAll(src);
      expect(map.size).assertEqual(2);
      // putAll(Map)
      let bsrc: Map<number, string> = new Map<number, string>();
      bsrc.set(99998, 'bsrc_' + id);
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      // remove
      const r3: string | undefined = map.remove(num);
      expect(r3).assertEqual('new_' + id);
      const r4: string | undefined = map.remove(num);
      expect(r4).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_0500
     * @tc.name   testNewApiNumber_neg1
     * @tc.desc   Verify put/containsValue/putAll/remove with number type negative one.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiNumber_neg1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const num: number = -1;
      const id: string = 'neg1';
      const caseName: string = 'testNewApiNumber_' + id;
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      // put new key
      const r1: string | undefined = map.put(num, 'val_' + id);
      expect(r1).assertEqual(undefined);
      expect(map.size).assertEqual(1);
      // put overwrite
      const r2: string | undefined = map.put(num, 'new_' + id);
      expect(r2).assertEqual('val_' + id);
      // containsValue
      expect(map.containsValue('new_' + id)).assertTrue();
      expect(map.containsValue('not_exist')).assertFalse();
      // putAll(collections.Map) - use fixed different key to avoid NaN/Infinity arithmetic issues
      let src: collections.Map<number, string> = new collections.Map<number, string>();
      src.set(99994, 'src_' + id);
      map.putAll(src);
      expect(map.size).assertEqual(2);
      // putAll(Map)
      let bsrc: Map<number, string> = new Map<number, string>();
      bsrc.set(99999, 'bsrc_' + id);
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      // remove
      const r3: string | undefined = map.remove(num);
      expect(r3).assertEqual('new_' + id);
      const r4: string | undefined = map.remove(num);
      expect(r4).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_0600
     * @tc.name   testNewApiNumber_min_safe
     * @tc.desc   Verify put/containsValue/putAll/remove with number type min safe integer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiNumber_min_safe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const num: number = Number.MIN_SAFE_INTEGER;
      const id: string = 'min_safe';
      const caseName: string = 'testNewApiNumber_' + id;
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      // put new key
      const r1: string | undefined = map.put(num, 'val_' + id);
      expect(r1).assertEqual(undefined);
      expect(map.size).assertEqual(1);
      // put overwrite
      const r2: string | undefined = map.put(num, 'new_' + id);
      expect(r2).assertEqual('val_' + id);
      // containsValue
      expect(map.containsValue('new_' + id)).assertTrue();
      expect(map.containsValue('not_exist')).assertFalse();
      // putAll(collections.Map) - use fixed different key to avoid NaN/Infinity arithmetic issues
      let src: collections.Map<number, string> = new collections.Map<number, string>();
      src.set(99995, 'src_' + id);
      map.putAll(src);
      expect(map.size).assertEqual(2);
      // putAll(Map)
      let bsrc: Map<number, string> = new Map<number, string>();
      bsrc.set(100000, 'bsrc_' + id);
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      // remove
      const r3: string | undefined = map.remove(num);
      expect(r3).assertEqual('new_' + id);
      const r4: string | undefined = map.remove(num);
      expect(r4).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_0700
     * @tc.name   testNewApiNumber_zero
     * @tc.desc   Verify put/containsValue/putAll/remove with number type zero.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiNumber_zero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const num: number = 0;
      const id: string = 'zero';
      const caseName: string = 'testNewApiNumber_' + id;
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      // put new key
      const r1: string | undefined = map.put(num, 'val_' + id);
      expect(r1).assertEqual(undefined);
      expect(map.size).assertEqual(1);
      // put overwrite
      const r2: string | undefined = map.put(num, 'new_' + id);
      expect(r2).assertEqual('val_' + id);
      // containsValue
      expect(map.containsValue('new_' + id)).assertTrue();
      expect(map.containsValue('not_exist')).assertFalse();
      // putAll(collections.Map) - use fixed different key to avoid NaN/Infinity arithmetic issues
      let src: collections.Map<number, string> = new collections.Map<number, string>();
      src.set(99996, 'src_' + id);
      map.putAll(src);
      expect(map.size).assertEqual(2);
      // putAll(Map)
      let bsrc: Map<number, string> = new Map<number, string>();
      bsrc.set(100001, 'bsrc_' + id);
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      // remove
      const r3: string | undefined = map.remove(num);
      expect(r3).assertEqual('new_' + id);
      const r4: string | undefined = map.remove(num);
      expect(r4).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_0800
     * @tc.name   testNewApiNumber_neg_zero
     * @tc.desc   Verify put/containsValue/putAll/remove with number type negative zero.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiNumber_neg_zero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const num: number = -0;
      const id: string = 'neg_zero';
      const caseName: string = 'testNewApiNumber_' + id;
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      // put new key
      const r1: string | undefined = map.put(num, 'val_' + id);
      expect(r1).assertEqual(undefined);
      expect(map.size).assertEqual(1);
      // put overwrite
      const r2: string | undefined = map.put(num, 'new_' + id);
      expect(r2).assertEqual('val_' + id);
      // containsValue
      expect(map.containsValue('new_' + id)).assertTrue();
      expect(map.containsValue('not_exist')).assertFalse();
      // putAll(collections.Map) - use fixed different key to avoid NaN/Infinity arithmetic issues
      let src: collections.Map<number, string> = new collections.Map<number, string>();
      src.set(99997, 'src_' + id);
      map.putAll(src);
      expect(map.size).assertEqual(2);
      // putAll(Map)
      let bsrc: Map<number, string> = new Map<number, string>();
      bsrc.set(100002, 'bsrc_' + id);
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      // remove
      const r3: string | undefined = map.remove(num);
      expect(r3).assertEqual('new_' + id);
      const r4: string | undefined = map.remove(num);
      expect(r4).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_0900
     * @tc.name   testNewApiNumber_hex
     * @tc.desc   Verify put/containsValue/putAll/remove with number type hex.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiNumber_hex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const num: number = 0x12;
      const id: string = 'hex';
      const caseName: string = 'testNewApiNumber_' + id;
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      // put new key
      const r1: string | undefined = map.put(num, 'val_' + id);
      expect(r1).assertEqual(undefined);
      expect(map.size).assertEqual(1);
      // put overwrite
      const r2: string | undefined = map.put(num, 'new_' + id);
      expect(r2).assertEqual('val_' + id);
      // containsValue
      expect(map.containsValue('new_' + id)).assertTrue();
      expect(map.containsValue('not_exist')).assertFalse();
      // putAll(collections.Map) - use fixed different key to avoid NaN/Infinity arithmetic issues
      let src: collections.Map<number, string> = new collections.Map<number, string>();
      src.set(99998, 'src_' + id);
      map.putAll(src);
      expect(map.size).assertEqual(2);
      // putAll(Map)
      let bsrc: Map<number, string> = new Map<number, string>();
      bsrc.set(100003, 'bsrc_' + id);
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      // remove
      const r3: string | undefined = map.remove(num);
      expect(r3).assertEqual('new_' + id);
      const r4: string | undefined = map.remove(num);
      expect(r4).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_1000
     * @tc.name   testNewApiNumber_octal
     * @tc.desc   Verify put/containsValue/putAll/remove with number type octal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiNumber_octal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const num: number = 0o77;
      const id: string = 'octal';
      const caseName: string = 'testNewApiNumber_' + id;
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      // put new key
      const r1: string | undefined = map.put(num, 'val_' + id);
      expect(r1).assertEqual(undefined);
      expect(map.size).assertEqual(1);
      // put overwrite
      const r2: string | undefined = map.put(num, 'new_' + id);
      expect(r2).assertEqual('val_' + id);
      // containsValue
      expect(map.containsValue('new_' + id)).assertTrue();
      expect(map.containsValue('not_exist')).assertFalse();
      // putAll(collections.Map) - use fixed different key to avoid NaN/Infinity arithmetic issues
      let src: collections.Map<number, string> = new collections.Map<number, string>();
      src.set(99999, 'src_' + id);
      map.putAll(src);
      expect(map.size).assertEqual(2);
      // putAll(Map)
      let bsrc: Map<number, string> = new Map<number, string>();
      bsrc.set(100004, 'bsrc_' + id);
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      // remove
      const r3: string | undefined = map.remove(num);
      expect(r3).assertEqual('new_' + id);
      const r4: string | undefined = map.remove(num);
      expect(r4).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_1100
     * @tc.name   testNewApiNumber_binary
     * @tc.desc   Verify put/containsValue/putAll/remove with number type binary.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiNumber_binary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const num: number = 0b1010;
      const id: string = 'binary';
      const caseName: string = 'testNewApiNumber_' + id;
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      // put new key
      const r1: string | undefined = map.put(num, 'val_' + id);
      expect(r1).assertEqual(undefined);
      expect(map.size).assertEqual(1);
      // put overwrite
      const r2: string | undefined = map.put(num, 'new_' + id);
      expect(r2).assertEqual('val_' + id);
      // containsValue
      expect(map.containsValue('new_' + id)).assertTrue();
      expect(map.containsValue('not_exist')).assertFalse();
      // putAll(collections.Map) - use fixed different key to avoid NaN/Infinity arithmetic issues
      let src: collections.Map<number, string> = new collections.Map<number, string>();
      src.set(100000, 'src_' + id);
      map.putAll(src);
      expect(map.size).assertEqual(2);
      // putAll(Map)
      let bsrc: Map<number, string> = new Map<number, string>();
      bsrc.set(100005, 'bsrc_' + id);
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      // remove
      const r3: string | undefined = map.remove(num);
      expect(r3).assertEqual('new_' + id);
      const r4: string | undefined = map.remove(num);
      expect(r4).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_1200
     * @tc.name   testNewApiNumber_infinity
     * @tc.desc   Verify put/containsValue/putAll/remove with number type infinity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiNumber_infinity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const num: number = Infinity;
      const id: string = 'infinity';
      const caseName: string = 'testNewApiNumber_' + id;
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      // put new key
      const r1: string | undefined = map.put(num, 'val_' + id);
      expect(r1).assertEqual(undefined);
      expect(map.size).assertEqual(1);
      // put overwrite
      const r2: string | undefined = map.put(num, 'new_' + id);
      expect(r2).assertEqual('val_' + id);
      // containsValue
      expect(map.containsValue('new_' + id)).assertTrue();
      expect(map.containsValue('not_exist')).assertFalse();
      // putAll(collections.Map) - use fixed different key to avoid NaN/Infinity arithmetic issues
      let src: collections.Map<number, string> = new collections.Map<number, string>();
      src.set(100001, 'src_' + id);
      map.putAll(src);
      expect(map.size).assertEqual(2);
      // putAll(Map)
      let bsrc: Map<number, string> = new Map<number, string>();
      bsrc.set(100006, 'bsrc_' + id);
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      // remove
      const r3: string | undefined = map.remove(num);
      expect(r3).assertEqual('new_' + id);
      const r4: string | undefined = map.remove(num);
      expect(r4).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_1300
     * @tc.name   testNewApiNumber_neg_infinity
     * @tc.desc   Verify put/containsValue/putAll/remove with number type negative infinity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiNumber_neg_infinity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const num: number = -Infinity;
      const id: string = 'neg_infinity';
      const caseName: string = 'testNewApiNumber_' + id;
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      // put new key
      const r1: string | undefined = map.put(num, 'val_' + id);
      expect(r1).assertEqual(undefined);
      expect(map.size).assertEqual(1);
      // put overwrite
      const r2: string | undefined = map.put(num, 'new_' + id);
      expect(r2).assertEqual('val_' + id);
      // containsValue
      expect(map.containsValue('new_' + id)).assertTrue();
      expect(map.containsValue('not_exist')).assertFalse();
      // putAll(collections.Map) - use fixed different key to avoid NaN/Infinity arithmetic issues
      let src: collections.Map<number, string> = new collections.Map<number, string>();
      src.set(100002, 'src_' + id);
      map.putAll(src);
      expect(map.size).assertEqual(2);
      // putAll(Map)
      let bsrc: Map<number, string> = new Map<number, string>();
      bsrc.set(100007, 'bsrc_' + id);
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      // remove
      const r3: string | undefined = map.remove(num);
      expect(r3).assertEqual('new_' + id);
      const r4: string | undefined = map.remove(num);
      expect(r4).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_1400
     * @tc.name   testNewApiNumber_pi
     * @tc.desc   Verify put/containsValue/putAll/remove with number type pi.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiNumber_pi', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const num: number = 3.141592653589793;
      const id: string = 'pi';
      const caseName: string = 'testNewApiNumber_' + id;
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      // put new key
      const r1: string | undefined = map.put(num, 'val_' + id);
      expect(r1).assertEqual(undefined);
      expect(map.size).assertEqual(1);
      // put overwrite
      const r2: string | undefined = map.put(num, 'new_' + id);
      expect(r2).assertEqual('val_' + id);
      // containsValue
      expect(map.containsValue('new_' + id)).assertTrue();
      expect(map.containsValue('not_exist')).assertFalse();
      // putAll(collections.Map) - use fixed different key to avoid NaN/Infinity arithmetic issues
      let src: collections.Map<number, string> = new collections.Map<number, string>();
      src.set(100003, 'src_' + id);
      map.putAll(src);
      expect(map.size).assertEqual(2);
      // putAll(Map)
      let bsrc: Map<number, string> = new Map<number, string>();
      bsrc.set(100008, 'bsrc_' + id);
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      // remove
      const r3: string | undefined = map.remove(num);
      expect(r3).assertEqual('new_' + id);
      const r4: string | undefined = map.remove(num);
      expect(r4).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_1500
     * @tc.name   testNewApiNumber_neg_float
     * @tc.desc   Verify put/containsValue/putAll/remove with number type negative float.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiNumber_neg_float', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const num: number = -0.001;
      const id: string = 'neg_float';
      const caseName: string = 'testNewApiNumber_' + id;
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      // put new key
      const r1: string | undefined = map.put(num, 'val_' + id);
      expect(r1).assertEqual(undefined);
      expect(map.size).assertEqual(1);
      // put overwrite
      const r2: string | undefined = map.put(num, 'new_' + id);
      expect(r2).assertEqual('val_' + id);
      // containsValue
      expect(map.containsValue('new_' + id)).assertTrue();
      expect(map.containsValue('not_exist')).assertFalse();
      // putAll(collections.Map) - use fixed different key to avoid NaN/Infinity arithmetic issues
      let src: collections.Map<number, string> = new collections.Map<number, string>();
      src.set(100004, 'src_' + id);
      map.putAll(src);
      expect(map.size).assertEqual(2);
      // putAll(Map)
      let bsrc: Map<number, string> = new Map<number, string>();
      bsrc.set(100009, 'bsrc_' + id);
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      // remove
      const r3: string | undefined = map.remove(num);
      expect(r3).assertEqual('new_' + id);
      const r4: string | undefined = map.remove(num);
      expect(r4).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_1600
     * @tc.name   testNewApiNumber_neg_001
     * @tc.desc   Verify put/containsValue/putAll/remove with number type negative 0.01.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiNumber_neg_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const num: number = -0.01;
      const id: string = 'neg_001';
      const caseName: string = 'testNewApiNumber_' + id;
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      // put new key
      const r1: string | undefined = map.put(num, 'val_' + id);
      expect(r1).assertEqual(undefined);
      expect(map.size).assertEqual(1);
      // put overwrite
      const r2: string | undefined = map.put(num, 'new_' + id);
      expect(r2).assertEqual('val_' + id);
      // containsValue
      expect(map.containsValue('new_' + id)).assertTrue();
      expect(map.containsValue('not_exist')).assertFalse();
      // putAll(collections.Map) - use fixed different key to avoid NaN/Infinity arithmetic issues
      let src: collections.Map<number, string> = new collections.Map<number, string>();
      src.set(100005, 'src_' + id);
      map.putAll(src);
      expect(map.size).assertEqual(2);
      // putAll(Map)
      let bsrc: Map<number, string> = new Map<number, string>();
      bsrc.set(100010, 'bsrc_' + id);
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      // remove
      const r3: string | undefined = map.remove(num);
      expect(r3).assertEqual('new_' + id);
      const r4: string | undefined = map.remove(num);
      expect(r4).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    // ==================== string 类型 (4个) ====================
    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_1700
     * @tc.name   testNewApiString_normal
     * @tc.desc   Verify put/containsValue/putAll/remove with string type normal.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiString_normal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str: string = 'key1';
      const id: string = 'normal';
      const caseName: string = 'testNewApiString_' + id;
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      const r1: string | undefined = map.put(str, 'val_' + id);
      expect(r1).assertEqual(undefined);
      const r2: string | undefined = map.put(str, 'new_' + id);
      expect(r2).assertEqual('val_' + id);
      expect(map.containsValue('new_' + id)).assertTrue();
      let src: collections.Map<string, string> = new collections.Map<string, string>();
      src.set(str + '_x', 'src');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, string> = new Map<string, string>();
      bsrc.set(str + '_y', 'bsrc');
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      const r3: string | undefined = map.remove(str);
      expect(r3).assertEqual('new_' + id);
      const r4: string | undefined = map.remove(str);
      expect(r4).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_1800
     * @tc.name   testNewApiString_special
     * @tc.desc   Verify put/containsValue/putAll/remove with string type special characters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiString_special', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str: string = 'key!@#';
      const id: string = 'special';
      const caseName: string = 'testNewApiString_' + id;
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      const r1: string | undefined = map.put(str, 'val_' + id);
      expect(r1).assertEqual(undefined);
      const r2: string | undefined = map.put(str, 'new_' + id);
      expect(r2).assertEqual('val_' + id);
      expect(map.containsValue('new_' + id)).assertTrue();
      let src: collections.Map<string, string> = new collections.Map<string, string>();
      src.set(str + '_x', 'src');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, string> = new Map<string, string>();
      bsrc.set(str + '_y', 'bsrc');
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      const r3: string | undefined = map.remove(str);
      expect(r3).assertEqual('new_' + id);
      const r4: string | undefined = map.remove(str);
      expect(r4).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_1900
     * @tc.name   testNewApiString_emoji
     * @tc.desc   Verify put/containsValue/putAll/remove with string type emoji.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiString_emoji', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str: string = '😀🎉🔥';
      const id: string = 'emoji';
      const caseName: string = 'testNewApiString_' + id;
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      const r1: string | undefined = map.put(str, 'val_' + id);
      expect(r1).assertEqual(undefined);
      const r2: string | undefined = map.put(str, 'new_' + id);
      expect(r2).assertEqual('val_' + id);
      expect(map.containsValue('new_' + id)).assertTrue();
      let src: collections.Map<string, string> = new collections.Map<string, string>();
      src.set(str + '_x', 'src');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, string> = new Map<string, string>();
      bsrc.set(str + '_y', 'bsrc');
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      const r3: string | undefined = map.remove(str);
      expect(r3).assertEqual('new_' + id);
      const r4: string | undefined = map.remove(str);
      expect(r4).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_2000
     * @tc.name   testNewApiString_empty
     * @tc.desc   Verify put/containsValue/putAll/remove with string type empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiString_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str: string = '';
      const id: string = 'empty';
      const caseName: string = 'testNewApiString_' + id;
      console.info(caseName + ', test start');
      let map: collections.Map<string, string> = new collections.Map<string, string>();
      const r1: string | undefined = map.put(str, 'val_' + id);
      expect(r1).assertEqual(undefined);
      const r2: string | undefined = map.put(str, 'new_' + id);
      expect(r2).assertEqual('val_' + id);
      expect(map.containsValue('new_' + id)).assertTrue();
      let src: collections.Map<string, string> = new collections.Map<string, string>();
      src.set(str + '_x', 'src');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, string> = new Map<string, string>();
      bsrc.set(str + '_y', 'bsrc');
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      const r3: string | undefined = map.remove(str);
      expect(r3).assertEqual('new_' + id);
      const r4: string | undefined = map.remove(str);
      expect(r4).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    // ==================== boolean 类型 (2个) ====================
    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_2100
     * @tc.name   testNewApiBoolean_true
     * @tc.desc   Verify put/containsValue/putAll/remove with boolean type true.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiBoolean_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiBoolean_true';
      console.info(caseName + ', test start');
      let map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      expect(map.put(true, 'tval')).assertEqual(undefined);
      expect(map.put(true, 'new_tval')).assertEqual('tval');
      expect(map.containsValue('new_tval')).assertTrue();
      let src: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      src.set(false, 'fval');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<boolean, string> = new Map<boolean, string>();
      bsrc.set(true, 'bsrc_t');
      map.putAll(bsrc);
      expect(map.size).assertEqual(2);
      expect(map.remove(true)).assertEqual('bsrc_t');
      expect(map.remove(true)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_2200
     * @tc.name   testNewApiBoolean_false
     * @tc.desc   Verify put/containsValue/putAll/remove with boolean type false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiBoolean_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiBoolean_false';
      console.info(caseName + ', test start');
      let map: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      expect(map.put(false, 'fval')).assertEqual(undefined);
      expect(map.put(false, 'new_fval')).assertEqual('fval');
      expect(map.containsValue('new_fval')).assertTrue();
      let src: collections.Map<boolean, string> = new collections.Map<boolean, string>();
      src.set(true, 'tval');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<boolean, string> = new Map<boolean, string>();
      bsrc.set(false, 'bsrc_f');
      map.putAll(bsrc);
      expect(map.size).assertEqual(2);
      expect(map.remove(false)).assertEqual('bsrc_f');
      expect(map.remove(false)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    // ==================== undefined / null 类型 ====================
    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_2300
     * @tc.name   testNewApiUndefined
     * @tc.desc   Verify put/containsValue/putAll/remove with undefined type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiUndefined';
      console.info(caseName + ', test start');
      let map: collections.Map<undefined, string> = new collections.Map<undefined, string>();
      expect(map.put(undefined, 'uval')).assertEqual(undefined);
      expect(map.put(undefined, 'new_uval')).assertEqual('uval');
      expect(map.containsValue('new_uval')).assertTrue();
      let src: collections.Map<undefined, string> = new collections.Map<undefined, string>();
      src.set(undefined, 'src_u');
      map.putAll(src);
      expect(map.size).assertEqual(1);
      let bsrc: Map<undefined, string> = new Map<undefined, string>();
      bsrc.set(undefined, 'bsrc_u');
      map.putAll(bsrc);
      expect(map.size).assertEqual(1);
      expect(map.remove(undefined)).assertEqual('bsrc_u');
      expect(map.remove(undefined)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_2400
     * @tc.name   testNewApiNull
     * @tc.desc   Verify put/containsValue/putAll/remove with null type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiNull';
      console.info(caseName + ', test start');
      let map: collections.Map<null, string> = new collections.Map<null, string>();
      expect(map.put(null, 'nval')).assertEqual(undefined);
      expect(map.put(null, 'new_nval')).assertEqual('nval');
      expect(map.containsValue('new_nval')).assertTrue();
      let src: collections.Map<null, string> = new collections.Map<null, string>();
      src.set(null, 'src_n');
      map.putAll(src);
      expect(map.size).assertEqual(1);
      let bsrc: Map<null, string> = new Map<null, string>();
      bsrc.set(null, 'bsrc_n');
      map.putAll(bsrc);
      expect(map.size).assertEqual(1);
      expect(map.remove(null)).assertEqual('bsrc_n');
      expect(map.remove(null)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    // ==================== Sendable 对象类型 ====================
    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_2500
     * @tc.name   testNewApiTestPerson
     * @tc.desc   Verify put/containsValue/putAll/remove with TestPerson type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiTestPerson', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiTestPerson';
      console.info(caseName + ', test start');
      let map: collections.Map<TestPerson, string> = new collections.Map<TestPerson, string>();
      let p: TestPerson = new TestPerson('test', 20);
      expect(map.put(p, 'pval')).assertEqual(undefined);
      expect(map.put(p, 'new_pval')).assertEqual('pval');
      expect(map.containsValue('new_pval')).assertTrue();
      expect(map.containsValue('pval')).assertFalse();
      let src: collections.Map<TestPerson, string> = new collections.Map<TestPerson, string>();
      src.set(new TestPerson('other', 30), 'src_p');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<TestPerson, string> = new Map<TestPerson, string>();
      bsrc.set(new TestPerson('bsrc', 40), 'bsrc_p');
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove(p)).assertEqual('new_pval');
      expect(map.remove(p)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_2600
     * @tc.name   testNewApiEmptyClass
     * @tc.desc   Verify put/containsValue/putAll/remove with EmptyClass type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiEmptyClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiEmptyClass';
      console.info(caseName + ', test start');
      let map: collections.Map<EmptyClass, string> = new collections.Map<EmptyClass, string>();
      let obj: EmptyClass = new EmptyClass();
      expect(map.put(obj, 'eval')).assertEqual(undefined);
      expect(map.put(obj, 'new_eval')).assertEqual('eval');
      expect(map.containsValue('new_eval')).assertTrue();
      let src: collections.Map<EmptyClass, string> = new collections.Map<EmptyClass, string>();
      src.set(new EmptyClass(), 'src_e');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<EmptyClass, string> = new Map<EmptyClass, string>();
      bsrc.set(new EmptyClass(), 'bsrc_e');
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove(obj)).assertEqual('new_eval');
      expect(map.remove(obj)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_2700
     * @tc.name   testNewApiComplexIndexSignature
     * @tc.desc   Verify put/containsValue/putAll/remove with ComplexIndexSignature type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiComplexIndexSignature', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiComplexIndexSignature';
      console.info(caseName + ', test start');
      let map: collections.Map<ComplexIndexSignature, string> = new collections.Map<ComplexIndexSignature, string>();
      let obj: ComplexIndexSignature = new ComplexIndexSignature();
      expect(map.put(obj, 'cval')).assertEqual(undefined);
      expect(map.put(obj, 'new_cval')).assertEqual('cval');
      expect(map.containsValue('new_cval')).assertTrue();
      let src: collections.Map<ComplexIndexSignature, string> = new collections.Map<ComplexIndexSignature, string>();
      src.set(new ComplexIndexSignature(), 'src_c');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<ComplexIndexSignature, string> = new Map<ComplexIndexSignature, string>();
      bsrc.set(new ComplexIndexSignature(), 'bsrc_c');
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove(obj)).assertEqual('new_cval');
      expect(map.remove(obj)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    // ==================== collections.Array 作为 value ====================
    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_2800
     * @tc.name   testNewApiArrayValue
     * @tc.desc   Verify put/containsValue/putAll/remove with collections.Array value type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiArrayValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiArrayValue';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      arr.push(1); arr.push(2); arr.push(3);
      expect(map.put('arrKey', arr)).assertEqual(undefined);
      let arr2: collections.Array<number> = new collections.Array<number>();
      arr2.push(4);
      expect(map.put('arrKey', arr2)).assertEqual(arr);
      expect(map.containsValue(arr2)).assertTrue();
      let src: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      src.set('srcArr', new collections.Array<number>(5));
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, collections.Array<number>> = new Map<string, collections.Array<number>>();
      bsrc.set('bsrcArr', new collections.Array<number>(6));
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('arrKey')).assertEqual(arr2);
      expect(map.remove('arrKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    // ==================== Sendable 函数类型 ====================
    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_2900
     * @tc.name   testNewApiSendableNormalFn
     * @tc.desc   Verify put/containsValue/putAll/remove with SendableNormalFn type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiSendableNormalFn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiSendableNormalFn';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableNormalFn> = new collections.Map<string, SendableNormalFn>();
      let fn: SendableNormalFn = new SendableNormalFn();
      expect(map.put('fnKey', fn)).assertEqual(undefined);
      let fn2: SendableNormalFn = new SendableNormalFn();
      expect(map.put('fnKey', fn2)).assertEqual(fn);
      expect(map.containsValue(fn2)).assertTrue();
      let src: collections.Map<string, SendableNormalFn> = new collections.Map<string, SendableNormalFn>();
      src.set('srcFn', new SendableNormalFn());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, SendableNormalFn> = new Map<string, SendableNormalFn>();
      bsrc.set('bsrcFn', new SendableNormalFn());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('fnKey')).assertEqual(fn2);
      expect(map.remove('fnKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_3000
     * @tc.name   testNewApiSendableArrowFn
     * @tc.desc   Verify put/containsValue/putAll/remove with SendableArrowFn type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiSendableArrowFn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiSendableArrowFn';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableArrowFn> = new collections.Map<string, SendableArrowFn>();
      let fn: SendableArrowFn = new SendableArrowFn();
      expect(map.put('afKey', fn)).assertEqual(undefined);
      let fn2: SendableArrowFn = new SendableArrowFn();
      expect(map.put('afKey', fn2)).assertEqual(fn);
      expect(map.containsValue(fn2)).assertTrue();
      expect(map.containsValue(fn)).assertFalse();
      let src: collections.Map<string, SendableArrowFn> = new collections.Map<string, SendableArrowFn>();
      src.set('srcAf', new SendableArrowFn());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, SendableArrowFn> = new Map<string, SendableArrowFn>();
      bsrc.set('bsrcAf', new SendableArrowFn());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('afKey')).assertEqual(fn2);
      expect(map.remove('afKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_3100
     * @tc.name   testNewApiSendableAsyncFn
     * @tc.desc   Verify put/containsValue/putAll/remove with SendableAsyncFn type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiSendableAsyncFn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiSendableAsyncFn';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAsyncFn> = new collections.Map<string, SendableAsyncFn>();
      let fn: SendableAsyncFn = new SendableAsyncFn();
      expect(map.put('asKey', fn)).assertEqual(undefined);
      let fn2: SendableAsyncFn = new SendableAsyncFn();
      expect(map.put('asKey', fn2)).assertEqual(fn);
      expect(map.containsValue(fn2)).assertTrue();
      expect(map.containsValue(fn)).assertFalse();
      let src: collections.Map<string, SendableAsyncFn> = new collections.Map<string, SendableAsyncFn>();
      src.set('srcAs', new SendableAsyncFn());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, SendableAsyncFn> = new Map<string, SendableAsyncFn>();
      bsrc.set('bsrcAs', new SendableAsyncFn());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('asKey')).assertEqual(fn2);
      expect(map.remove('asKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_3200
     * @tc.name   testNewApiSendableAddFn
     * @tc.desc   Verify put/containsValue/putAll/remove with SendableAddFn type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiSendableAddFn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiSendableAddFn';
      console.info(caseName + ', test start');
      let map: collections.Map<string, SendableAddFn> = new collections.Map<string, SendableAddFn>();
      let fn: SendableAddFn = new SendableAddFn();
      expect(map.put('adKey', fn)).assertEqual(undefined);
      let fn2: SendableAddFn = new SendableAddFn();
      expect(map.put('adKey', fn2)).assertEqual(fn);
      expect(map.containsValue(fn2)).assertTrue();
      expect(map.containsValue(fn)).assertFalse();
      let src: collections.Map<string, SendableAddFn> = new collections.Map<string, SendableAddFn>();
      src.set('srcAd', new SendableAddFn());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, SendableAddFn> = new Map<string, SendableAddFn>();
      bsrc.set('bsrcAd', new SendableAddFn());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('adKey')).assertEqual(fn2);
      expect(map.remove('adKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    // ==================== Sendable 类类型 ====================
    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_3300
     * @tc.name   testNewApiSendableClassBasic
     * @tc.desc   Verify put/containsValue/putAll/remove with SendableClassBasic type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiSendableClassBasic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiSendableClassBasic';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassBasic, string> = new collections.Map<SendableClassBasic, string>();
      let obj: SendableClassBasic = new SendableClassBasic();
      expect(map.put(obj, 'bval')).assertEqual(undefined);
      expect(map.put(obj, 'new_bval')).assertEqual('bval');
      expect(map.containsValue('new_bval')).assertTrue();
      let src: collections.Map<SendableClassBasic, string> = new collections.Map<SendableClassBasic, string>();
      src.set(new SendableClassBasic(), 'src_b');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<SendableClassBasic, string> = new Map<SendableClassBasic, string>();
      bsrc.set(new SendableClassBasic(), 'bsrc_b');
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove(obj)).assertEqual('new_bval');
      expect(map.remove(obj)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_3400
     * @tc.name   testNewApiSendableClassComplex
     * @tc.desc   Verify put/containsValue/putAll/remove with SendableClassComplex type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiSendableClassComplex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiSendableClassComplex';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassComplex, string> = new collections.Map<SendableClassComplex, string>();
      let obj: SendableClassComplex = new SendableClassComplex();
      expect(map.put(obj, 'cxval')).assertEqual(undefined);
      expect(map.put(obj, 'new_cxval')).assertEqual('cxval');
      expect(map.containsValue('new_cxval')).assertTrue();
      let src: collections.Map<SendableClassComplex, string> = new collections.Map<SendableClassComplex, string>();
      src.set(new SendableClassComplex(), 'src_cx');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<SendableClassComplex, string> = new Map<SendableClassComplex, string>();
      bsrc.set(new SendableClassComplex(), 'bsrc_cx');
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove(obj)).assertEqual('new_cxval');
      expect(map.remove(obj)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_3500
     * @tc.name   testNewApiSendableClassExtended
     * @tc.desc   Verify put/containsValue/putAll/remove with SendableClassExtended type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiSendableClassExtended', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiSendableClassExtended';
      console.info(caseName + ', test start');
      let map: collections.Map<SendableClassExtended, string> = new collections.Map<SendableClassExtended, string>();
      let obj: SendableClassExtended = new SendableClassExtended();
      expect(map.put(obj, 'eval')).assertEqual(undefined);
      expect(map.put(obj, 'new_eval')).assertEqual('eval');
      expect(map.containsValue('new_eval')).assertTrue();
      let src: collections.Map<SendableClassExtended, string> = new collections.Map<SendableClassExtended, string>();
      src.set(new SendableClassExtended(), 'src_e');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<SendableClassExtended, string> = new Map<SendableClassExtended, string>();
      bsrc.set(new SendableClassExtended(), 'bsrc_e');
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove(obj)).assertEqual('new_eval');
      expect(map.remove(obj)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    // ==================== const enum 类型 ====================
    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_3600
     * @tc.name   testNewApiSendableEnum
     * @tc.desc   Verify put/containsValue/putAll/remove with SendableEnum type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiSendableEnum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiSendableEnum';
      console.info(caseName + ', test start');
      let map: collections.Map<number, string> = new collections.Map<number, string>();
      expect(map.put(SendableEnum.Success, 'sval')).assertEqual(undefined);
      expect(map.put(SendableEnum.Success, 'new_sval')).assertEqual('sval');
      expect(map.containsValue('new_sval')).assertTrue();
      expect(map.containsValue('sval')).assertFalse();
      let src: collections.Map<number, string> = new collections.Map<number, string>();
      src.set(SendableEnum.Failure, 'src_f');
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<number, string> = new Map<number, string>();
      bsrc.set(SendableEnum.Pending, 'bsrc_p');
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove(SendableEnum.Success)).assertEqual('new_sval');
      expect(map.remove(SendableEnum.Success)).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    // ==================== ArkTSUtils 类型 ====================
    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_3700
     * @tc.name   testNewApiAsyncLock
     * @tc.desc   Verify put/containsValue/putAll/remove with AsyncLock type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiAsyncLock', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiAsyncLock';
      console.info(caseName + ', test start');
      let map: collections.Map<string, ArkTSUtils.locks.AsyncLock> = new collections.Map<string, ArkTSUtils.locks.AsyncLock>();
      let lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      expect(map.put('lockKey', lock)).assertEqual(undefined);
      let lock2: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
      expect(map.put('lockKey', lock2)).assertEqual(lock);
      expect(map.containsValue(lock2)).assertTrue();
      expect(map.containsValue(lock)).assertFalse();
      let src: collections.Map<string, ArkTSUtils.locks.AsyncLock> = new collections.Map<string, ArkTSUtils.locks.AsyncLock>();
      src.set('srcLock', new ArkTSUtils.locks.AsyncLock());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, ArkTSUtils.locks.AsyncLock> = new Map<string, ArkTSUtils.locks.AsyncLock>();
      bsrc.set('bsrcLock', new ArkTSUtils.locks.AsyncLock());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('lockKey')).assertEqual(lock2);
      expect(map.remove('lockKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_3800
     * @tc.name   testNewApiConditionVariable
     * @tc.desc   Verify put/containsValue/putAll/remove with ConditionVariable type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiConditionVariable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiConditionVariable';
      console.info(caseName + ', test start');
      let map: collections.Map<string, ArkTSUtils.locks.ConditionVariable> = new collections.Map<string, ArkTSUtils.locks.ConditionVariable>();
      let cv: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
      expect(map.put('cvKey', cv)).assertEqual(undefined);
      let cv2: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
      expect(map.put('cvKey', cv2)).assertEqual(cv);
      expect(map.containsValue(cv2)).assertTrue();
      expect(map.containsValue(cv)).assertFalse();
      let src: collections.Map<string, ArkTSUtils.locks.ConditionVariable> = new collections.Map<string, ArkTSUtils.locks.ConditionVariable>();
      src.set('srcCv', new ArkTSUtils.locks.ConditionVariable());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, ArkTSUtils.locks.ConditionVariable> = new Map<string, ArkTSUtils.locks.ConditionVariable>();
      bsrc.set('bsrcCv', new ArkTSUtils.locks.ConditionVariable());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('cvKey')).assertEqual(cv2);
      expect(map.remove('cvKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_3900
     * @tc.name   testNewApiSendableLruCache
     * @tc.desc   Verify put/containsValue/putAll/remove with SendableLruCache type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiSendableLruCache', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiSendableLruCache';
      console.info(caseName + ', test start');
      let map: collections.Map<string, ArkTSUtils.SendableLruCache<number, string>> = new collections.Map<string, ArkTSUtils.SendableLruCache<number, string>>();
      let cache: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>();
      cache.put(1, 'v1');
      expect(map.put('cacheKey', cache)).assertEqual(undefined);
      let cache2: ArkTSUtils.SendableLruCache<number, string> = new ArkTSUtils.SendableLruCache<number, string>();
      cache2.put(2, 'v2');
      expect(map.put('cacheKey', cache2)).assertEqual(cache);
      expect(map.containsValue(cache2)).assertTrue();
      expect(map.containsValue(cache)).assertFalse();
      let src: collections.Map<string, ArkTSUtils.SendableLruCache<number, string>> = new collections.Map<string, ArkTSUtils.SendableLruCache<number, string>>();
      src.set('srcCache', new ArkTSUtils.SendableLruCache<number, string>());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, ArkTSUtils.SendableLruCache<number, string>> = new Map<string, ArkTSUtils.SendableLruCache<number, string>>();
      bsrc.set('bsrcCache', new ArkTSUtils.SendableLruCache<number, string>());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('cacheKey')).assertEqual(cache2);
      expect(map.remove('cacheKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    // ==================== 嵌套容器类型 ====================
    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_4000
     * @tc.name   testNewApiNestedMap
     * @tc.desc   Verify put/containsValue/putAll/remove with nested Map type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiNestedMap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiNestedMap';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Map<number, string>> = new collections.Map<string, collections.Map<number, string>>();
      let nested: collections.Map<number, string> = new collections.Map<number, string>();
      nested.set(1, 'one');
      expect(map.put('nestedKey', nested)).assertEqual(undefined);
      let nested2: collections.Map<number, string> = new collections.Map<number, string>();
      nested2.set(2, 'two');
      expect(map.put('nestedKey', nested2)).assertEqual(nested);
      expect(map.containsValue(nested2)).assertTrue();
      expect(map.containsValue(nested)).assertFalse();
      let src: collections.Map<string, collections.Map<number, string>> = new collections.Map<string, collections.Map<number, string>>();
      src.set('srcNested', new collections.Map<number, string>());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, collections.Map<number, string>> = new Map<string, collections.Map<number, string>>();
      bsrc.set('bsrcNested', new collections.Map<number, string>());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('nestedKey')).assertEqual(nested2);
      expect(map.remove('nestedKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_4100
     * @tc.name   testNewApiNestedSet
     * @tc.desc   Verify put/containsValue/putAll/remove with nested Set type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiNestedSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiNestedSet';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Set<number>> = new collections.Map<string, collections.Set<number>>();
      let s: collections.Set<number> = new collections.Set<number>();
      s.add(1).add(2);
      expect(map.put('setKey', s)).assertEqual(undefined);
      let s2: collections.Set<number> = new collections.Set<number>();
      s2.add(3);
      expect(map.put('setKey', s2)).assertEqual(s);
      expect(map.containsValue(s2)).assertTrue();
      expect(map.containsValue(s)).assertFalse();
      let src: collections.Map<string, collections.Set<number>> = new collections.Map<string, collections.Set<number>>();
      src.set('srcSet', new collections.Set<number>());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, collections.Set<number>> = new Map<string, collections.Set<number>>();
      bsrc.set('bsrcSet', new collections.Set<number>());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('setKey')).assertEqual(s2);
      expect(map.remove('setKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_4200
     * @tc.name   testNewApiNestedArray
     * @tc.desc   Verify put/containsValue/putAll/remove with nested Array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiNestedArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiNestedArray';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let a: collections.Array<number> = new collections.Array<number>();
      a.push(1); a.push(2);
      expect(map.put('arrKey', a)).assertEqual(undefined);
      let a2: collections.Array<number> = new collections.Array<number>();
      a2.push(3); a2.push(4);
      expect(map.put('arrKey', a2)).assertEqual(a);
      expect(map.containsValue(a2)).assertTrue();
      expect(map.containsValue(a)).assertFalse();
      let src: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      src.set('srcArr', new collections.Array<number>());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, collections.Array<number>> = new Map<string, collections.Array<number>>();
      bsrc.set('bsrcArr', new collections.Array<number>());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('arrKey')).assertEqual(a2);
      expect(map.remove('arrKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    // ==================== 边界类型 ====================
    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_4300
     * @tc.name   testNewApiLargeObject
     * @tc.desc   Verify put/containsValue/putAll/remove with LargeObject type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiLargeObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiLargeObject';
      console.info(caseName + ', test start');
      let map: collections.Map<string, LargeObject> = new collections.Map<string, LargeObject>();
      let obj: LargeObject = new LargeObject();
      expect(map.put('largeKey', obj)).assertEqual(undefined);
      let obj2: LargeObject = new LargeObject();
      expect(map.put('largeKey', obj2)).assertEqual(obj);
      expect(map.containsValue(obj2)).assertTrue();
      expect(map.containsValue(obj)).assertFalse();
      let src: collections.Map<string, LargeObject> = new collections.Map<string, LargeObject>();
      src.set('srcLarge', new LargeObject());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, LargeObject> = new Map<string, LargeObject>();
      bsrc.set('bsrcLarge', new LargeObject());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('largeKey')).assertEqual(obj2);
      expect(map.remove('largeKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_4400
     * @tc.name   testNewApiLargeArray
     * @tc.desc   Verify put/containsValue/putAll/remove with large Array type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiLargeArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiLargeArray';
      console.info(caseName + ', test start');
      let map: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      let arr: collections.Array<number> = new collections.Array<number>();
      for (let i: number = 0; i < 10000; i++) arr.push(i);
      expect(map.put('largeArrKey', arr)).assertEqual(undefined);
      let arr2: collections.Array<number> = new collections.Array<number>();
      for (let i: number = 0; i < 5000; i++) arr2.push(i);
      expect(map.put('largeArrKey', arr2)).assertEqual(arr);
      expect(map.containsValue(arr2)).assertTrue();
      let src: collections.Map<string, collections.Array<number>> = new collections.Map<string, collections.Array<number>>();
      src.set('srcLargeArr', new collections.Array<number>());
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, collections.Array<number>> = new Map<string, collections.Array<number>>();
      bsrc.set('bsrcLargeArr', new collections.Array<number>());
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('largeArrKey')).assertEqual(arr2);
      expect(map.remove('largeArrKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_4500
     * @tc.name   testNewApiDeepNested
     * @tc.desc   Verify put/containsValue/putAll/remove with deep nested object type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiDeepNested', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiDeepNested';
      console.info(caseName + ', test start');
      let map: collections.Map<string, DeepNestedObject> = new collections.Map<string, DeepNestedObject>();
      let root: DeepNestedObject = new DeepNestedObject('level0');
      let cur: DeepNestedObject = root;
      for (let i: number = 1; i < 10; i++) { let n: DeepNestedObject = new DeepNestedObject('level' + i); cur.next = n; cur = n; }
      expect(map.put('deepKey', root)).assertEqual(undefined);
      let root2: DeepNestedObject = new DeepNestedObject('x');
      expect(map.put('deepKey', root2)).assertEqual(root);
      expect(map.containsValue(root2)).assertTrue();
      expect(map.containsValue(root)).assertFalse();
      let src: collections.Map<string, DeepNestedObject> = new collections.Map<string, DeepNestedObject>();
      src.set('srcDeep', new DeepNestedObject('s'));
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, DeepNestedObject> = new Map<string, DeepNestedObject>();
      bsrc.set('bsrcDeep', new DeepNestedObject('b'));
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('deepKey')).assertEqual(root2);
      expect(map.remove('deepKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number SUB_COLLECTIONS_MAP_NEW_API_TYPE_4600
     * @tc.name   testNewApiCircularRef
     * @tc.desc   Verify put/containsValue/putAll/remove with circular reference type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewApiCircularRef', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewApiCircularRef';
      console.info(caseName + ', test start');
      let map: collections.Map<string, CircularRef> = new collections.Map<string, CircularRef>();
      let obj: CircularRef = new CircularRef('parent');
      obj.ref = new CircularRef('child');
      obj.ref.ref = obj;
      expect(map.put('circularKey', obj)).assertEqual(undefined);
      let obj2: CircularRef = new CircularRef('x');
      expect(map.put('circularKey', obj2)).assertEqual(obj);
      expect(map.containsValue(obj2)).assertTrue();
      expect(map.containsValue(obj)).assertFalse();
      let src: collections.Map<string, CircularRef> = new collections.Map<string, CircularRef>();
      src.set('srcCirc', new CircularRef('s'));
      map.putAll(src);
      expect(map.size).assertEqual(2);
      let bsrc: Map<string, CircularRef> = new Map<string, CircularRef>();
      bsrc.set('bsrcCirc', new CircularRef('b'));
      map.putAll(bsrc);
      expect(map.size).assertEqual(3);
      expect(map.remove('circularKey')).assertEqual(obj2);
      expect(map.remove('circularKey')).assertEqual(undefined);
      console.info(caseName + ', test end');
    });

    /**
     * @tc.number  SUB_MAP_NEWAPI_PUTALL_OVERWRITE_0100
     * @tc.name    testMapNewApiPutAllOverwrite0001
     * @tc.desc    Verify putAll overwrites existing key without size growth
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testMapNewApiPutAllOverwrite0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let map = new collections.Map<number, string>();
      map.put(1, 'v1');
      let src = new collections.Map<number, string>();
      src.put(1, 'v2');
      map.putAll(src);
      expect(map.get(1)).assertEqual('v2');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number  SUB_MAP_NEWAPI_PUTALL_EMPTYSRC_0200
     * @tc.name    testMapNewApiPutAllEmptySrc0002
     * @tc.desc    Verify putAll with empty source is a no-op
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testMapNewApiPutAllEmptySrc0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let map = new collections.Map<number, string>();
      map.put(1, 'v');
      map.putAll(new collections.Map<number, string>());
      expect(map.size).assertEqual(1);
      expect(map.get(1)).assertEqual('v');
    });
  });
}
