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

import { beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import { collections, ArkTSUtils } from '@kit.ArkTS';
import * as Utils from '../utils/TestUtils';
import { SendableClassBasic, SendableClassComplex, SendableClassExtended, SendableEnum, SPECIAL_STR_WITH_NUL } from './CollectionsSetTypes';

export default function collectionsSetKeysValuesForOfTest() {
  describe('collectionsSetKeysValuesForOfTest', (): void => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    // ========================================================================
    // 遍历方法组
    // ========================================================================

    // Keys
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_0100
     * @tc.name   testSetKeys0001
     * @tc.desc   Verify keys returns iterator for number element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetKeys0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetKeys0001';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([100]);
      let iter = set.keys();
      let result = iter.next();
      expect(result.value).assertEqual(100);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_0200
     * @tc.name   testSetKeys0002
     * @tc.desc   Verify keys iterates in insertion order
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetKeys0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetKeys0002';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([3, 1, 2]);
      let results: number[] = [];
      for (let k of set.keys()) { results.push(k); }
      expect(results[0]).assertEqual(3);
      expect(results[1]).assertEqual(1);
      expect(results[2]).assertEqual(2);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_0300
     * @tc.name   testSetKeys0003
     * @tc.desc   Verify keys returns empty iterator
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetKeys0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetKeys0003';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      let iter = set.keys();
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_0400
     * @tc.name   testSetKeys0004
     * @tc.desc   Verify keys returns string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetKeys0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetKeys0004';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(["test测试123"]);
      let count = 0;
      for (let k of set.keys()) { count++; expect(k).assertEqual("test测试123"); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_0500
     * @tc.name   testSetKeys0005
     * @tc.desc   Verify keys returns boolean true element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetKeys0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetKeys0005';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>([true]);
      let count = 0;
      for (let k of set.keys()) { count++; expect(k).assertTrue(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_0600
     * @tc.name   testSetKeys0006
     * @tc.desc   Verify keys returns boolean false element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetKeys0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetKeys0006';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>([false]);
      let count = 0;
      for (let k of set.keys()) { count++; expect(k).assertFalse(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_0700
     * @tc.name   testSetKeys0007
     * @tc.desc   Verify keys returns SendableClassBasic instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetKeys0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetKeys0007';
      console.info(`[${caseName}] start`);
      let val1 = new SendableClassBasic(1, "k1");
      let val2 = new SendableClassBasic(2, "k2");
      let set = new collections.Set<SendableClassBasic>([val1, val2]);
      let ids: number[] = [];
      for (let k of set.keys()) { ids.push(k.id); }
      expect(ids.join(',')).assertEqual('1,2');
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_0800
     * @tc.name   testSetKeys0008
     * @tc.desc   Verify keys returns SendableClassExtended by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetKeys0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetKeys0008';
      console.info(`[${caseName}] start`);
      let val = new SendableClassExtended();
      val.name = 'extended_test';
      let set = new collections.Set<SendableClassExtended>([val]);
      let count = 0;
      for (let k of set.keys()) { count++; expect(k === val).assertTrue(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_0900
     * @tc.name   testSetKeys0009
     * @tc.desc   Verify keys returns SendableEnum values in insertion order
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetKeys0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetKeys0009';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableEnum>([SendableEnum.Success, SendableEnum.Failed]);
      let results: SendableEnum[] = [];
      for (let k of set.keys()) { results.push(k); }
      expect(results[0]).assertEqual(SendableEnum.Success);
      expect(results[1]).assertEqual(SendableEnum.Failed);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_1000
     * @tc.name   testSetKeys0010
     * @tc.desc   Verify keys returns ConditionVariable by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetKeys0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetKeys0010';
      console.info(`[${caseName}] start`);
      let cv = ArkTSUtils.locks.ConditionVariable.request("keys_cv");
      let set = new collections.Set<ArkTSUtils.locks.ConditionVariable>([cv]);
      let count = 0;
      for (let k of set.keys()) { count++; expect(k === cv).assertTrue(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_1100
     * @tc.name   testSetKeys0011
     * @tc.desc   Verify keys returns undefined element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetKeys0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetKeys0011';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<undefined>([undefined]);
      let results: undefined[] = [];
      for (let k of set.keys()) { results.push(k); }
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual(undefined);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_1200
     * @tc.name   testSetKeys0012
     * @tc.desc   Verify keys returns null element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetKeys0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetKeys0012';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<null>([null]);
      let results: null[] = [];
      for (let k of set.keys()) { results.push(k); }
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual(null);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_1300
     * @tc.name   testSetKeys0013
     * @tc.desc   Verify keys returns special character string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetKeys0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetKeys0013';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>([SPECIAL_STR_WITH_NUL]);
      let count = 0;
      for (let k of set.keys()) { count++; expect(k).assertEqual(SPECIAL_STR_WITH_NUL); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_1400
     * @tc.name   testSetKeys0014
     * @tc.desc   Verify keys returns scientific notation float
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetKeys0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetKeys0014';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1.5e-10]);
      let count = 0;
      for (let k of set.keys()) { count++; expect(k).assertEqual(1.5e-10); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_1500
     * @tc.name   testSetKeys0015
     * @tc.desc   Verify keys returns MAX_SAFE_INTEGER boundary value
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetKeys0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetKeys0015';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([Number.MAX_SAFE_INTEGER]);
      let count = 0;
      for (let k of set.keys()) { count++; expect(k).assertEqual(Number.MAX_SAFE_INTEGER); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_1600
     * @tc.name   testSetKeys0016
     * @tc.desc   Verify keys returns NaN element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetKeys0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetKeys0016';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([NaN]);
      let count = 0;
      for (let k of set.keys()) { count++; expect(Number.isNaN(k)).assertTrue(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_1700
     * @tc.name   testSetKeys0017
     * @tc.desc   Verify keys returns emoji string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetKeys0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetKeys0017';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(["测试😀🎉🔥"]);
      let count = 0;
      for (let k of set.keys()) { count++; expect(k).assertEqual("测试😀🎉🔥"); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_1800
     * @tc.name   testSetKeys0018
     * @tc.desc   Verify keys returns empty string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetKeys0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetKeys0018';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>([""]);
      let count = 0;
      for (let k of set.keys()) { count++; expect(k).assertEqual(""); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_1900
     * @tc.name   testSetKeys0019
     * @tc.desc   Verify keys returns SendableClassComplex with field access
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetKeys0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetKeys0019';
      console.info(`[${caseName}] start`);
      let val = new SendableClassComplex();
      let set = new collections.Set<SendableClassComplex>([val]);
      let count = 0;
      for (let k of set.keys()) { count++; expect(k.basic.id).assertEqual(1); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_2000
     * @tc.name   testSetKeys0020
     * @tc.desc   Verify keys returns AsyncLock by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetKeys0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetKeys0020';
      console.info(`[${caseName}] start`);
      let lock = ArkTSUtils.locks.AsyncLock.request("keys_lock2");
      let set = new collections.Set<ArkTSUtils.locks.AsyncLock>([lock]);
      let count = 0;
      for (let k of set.keys()) { count++; expect(k === lock).assertTrue(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_2100
     * @tc.name   testSetKeys0021
     * @tc.desc   Verify keys returns nested SendableLruCache by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetKeys0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetKeys0021';
      console.info(`[${caseName}] start`);
      let cache = new ArkTSUtils.SendableLruCache<number, string>(5);
      cache.put(1, "a");
      let set = new collections.Set<ArkTSUtils.SendableLruCache<number, string>>([cache]);
      let count = 0;
      for (let k of set.keys()) { count++; expect(k === cache).assertTrue(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_2200
     * @tc.name   testSetKeys0022
     * @tc.desc   Verify keys returns nested collections.Set by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetKeys0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetKeys0022';
      console.info(`[${caseName}] start`);
      let nested = new collections.Set<number>([1, 2]);
      let set = new collections.Set<collections.Set<number>>([nested]);
      let count = 0;
      for (let k of set.keys()) { count++; expect(k === nested).assertTrue(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_KEYS_2300
     * @tc.name   testSetKeys0023
     * @tc.desc   Verify keys and values return consistent element sequences
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetKeys0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetKeys0023';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([3, 1, 4,  5]);
      let keysArr: number[] = [];
      let valsArr: number[] = [];
      for (let k of set.keys()) { keysArr.push(k); }
      for (let v of set.values()) { valsArr.push(v); }
      expect(keysArr.join(',')).assertEqual(valsArr.join(','));
      console.info(`[${caseName}] end`);
      done();
    });

    // Values
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_0100
     * @tc.name   testSetValues0001
     * @tc.desc   Verify values returns iterator for number element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetValues0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetValues0001';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([100]);
      let iter = set.values();
      let result = iter.next();
      expect(result.value).assertEqual(100);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_0200
     * @tc.name   testSetValues0002
     * @tc.desc   Verify values iterates in insertion order
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetValues0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetValues0002';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([3, 1, 2]);
      let results: number[] = [];
      for (let v of set.values()) { results.push(v); }
      expect(results[0]).assertEqual(3);
      expect(results[1]).assertEqual(1);
      expect(results[2]).assertEqual(2);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_0300
     * @tc.name   testSetValues0003
     * @tc.desc   Verify values returns empty iterator
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetValues0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetValues0003';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      let iter = set.values();
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_0400
     * @tc.name   testSetValues0004
     * @tc.desc   Verify values returns nested collections.Set by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetValues0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetValues0004';
      console.info(`[${caseName}] start`);
      let nested = new collections.Set<number>([1, 2]);
      let set = new collections.Set<collections.Set<number>>([nested]);
      let count = 0;
      for (let v of set.values()) { count++; expect(v === nested).assertTrue(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_0500
     * @tc.name   testSetValues0005
     * @tc.desc   Verify values returns SendableClassComplex with nested field access
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetValues0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetValues0005';
      console.info(`[${caseName}] start`);
      let val = new SendableClassComplex();
      let set = new collections.Set<SendableClassComplex>([val]);
      let count = 0;
      for (let v of set.values()) { count++;
        expect(v === val).assertTrue(); expect(v.basic.name).assertEqual("complex_inner");
        expect(v.tags).assertEqual("tag_a,tag_b,tag_c"); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_0600
     * @tc.name   testSetValues0006
     * @tc.desc   Verify values returns SendableClassExtended by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetValues0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetValues0006';
      console.info(`[${caseName}] start`);
      let val = new SendableClassExtended();
      val.name = 'extended_test';
      let set = new collections.Set<SendableClassExtended>([val]);
      let count = 0;
      for (let v of set.values()) { count++; expect(v === val).assertTrue(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /*
     */
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_0700
     * @tc.name   testSetValues0007
     * @tc.desc   Verify values returns AsyncLock by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetValues0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetValues0007';
      console.info(`[${caseName}] start`);
      let lock = ArkTSUtils.locks.AsyncLock.request("val_lock");
      let set = new collections.Set<ArkTSUtils.locks.AsyncLock>([lock]);
      let count = 0;
      for (let v of set.values()) { count++; expect(v === lock).assertTrue(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_0800
     * @tc.name   testSetValues0008
     * @tc.desc   Verify values returns nested SendableLruCache with data access
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetValues0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetValues0008';
      console.info(`[${caseName}] start`);
      let cache = new ArkTSUtils.SendableLruCache<number, string>(10);
      cache.put(100, "hundred");
      let set = new collections.Set<ArkTSUtils.SendableLruCache<number, string>>([cache]);
      let count = 0;
      for (let v of set.values()) { count++; expect(v === cache).assertTrue(); expect(v.get(100)).assertEqual("hundred"); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_0900
     * @tc.name   testSetValues0009
     * @tc.desc   Verify values returns special character string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetValues0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetValues0009';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>([SPECIAL_STR_WITH_NUL]);
      let count = 0;
      for (let v of set.values()) { count++; expect(v).assertEqual(SPECIAL_STR_WITH_NUL); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_1000
     * @tc.name   testSetValues0010
     * @tc.desc   Verify values returns boolean true element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetValues0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetValues0010';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>([true]);
      let results: boolean[] = [];
      for (let v of set.values()) { results.push(v); }
      expect(results.length).assertEqual(1);
      expect(results[0]).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_1100
     * @tc.name   testSetValues0011
     * @tc.desc   Verify values returns boolean false element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetValues0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetValues0011';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>([false]);
      let results: boolean[] = [];
      for (let v of set.values()) { results.push(v); }
      expect(results.length).assertEqual(1);
      expect(results[0]).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_1200
     * @tc.name   testSetValues0012
     * @tc.desc   Verify values returns scientific notation float
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetValues0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetValues0012';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1.5e-10]);
      let count = 0;
      for (let v of set.values()) { count++; expect(v).assertEqual(1.5e-10); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_1300
     * @tc.name   testSetValues0013
     * @tc.desc   Verify values returns MAX_SAFE_INTEGER boundary value
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetValues0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetValues0013';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([Number.MAX_SAFE_INTEGER]);
      let count = 0;
      for (let v of set.values()) { count++; expect(v).assertEqual(Number.MAX_SAFE_INTEGER); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_1400
     * @tc.name   testSetValues0014
     * @tc.desc   Verify values returns NaN element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetValues0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetValues0014';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([NaN]);
      let count = 0;
      for (let v of set.values()) { count++; expect(Number.isNaN(v)).assertTrue(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_1500
     * @tc.name   testSetValues0015
     * @tc.desc   Verify values returns normal string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetValues0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetValues0015';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(["test测试123"]);
      let count = 0;
      for (let v of set.values()) { count++; expect(v).assertEqual("test测试123"); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_1600
     * @tc.name   testSetValues0016
     * @tc.desc   Verify values returns emoji string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetValues0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetValues0016';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(["测试😀🎉🔥"]);
      let count = 0;
      for (let v of set.values()) { count++; expect(v).assertEqual("测试😀🎉🔥"); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_1700
     * @tc.name   testSetValues0017
     * @tc.desc   Verify values returns empty string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetValues0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetValues0017';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>([""]);
      let count = 0;
      for (let v of set.values()) { count++; expect(v).assertEqual(""); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_1800
     * @tc.name   testSetValues0018
     * @tc.desc   Verify values returns undefined element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetValues0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetValues0018';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<undefined>([undefined]);
      let results: undefined[] = [];
      for (let v of set.values()) { results.push(v); }
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual(undefined);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_1900
     * @tc.name   testSetValues0019
     * @tc.desc   Verify values returns null element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetValues0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetValues0019';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<null>([null]);
      let results: null[] = [];
      for (let v of set.values()) { results.push(v); }
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual(null);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_2000
     * @tc.name   testSetValues0020
     * @tc.desc   Verify values returns SendableClassBasic with field verification
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetValues0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetValues0020';
      console.info(`[${caseName}] start`);
      let val = new SendableClassBasic(99, "v_test");
      let set = new collections.Set<SendableClassBasic>([val]);
      let count = 0;
      for (let v of set.values()) { count++; expect(v.id).assertEqual(99); expect(v.name).assertEqual("v_test"); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_2100
     * @tc.name   testSetValues0021
     * @tc.desc   Verify values returns SendableEnum values in insertion order
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetValues0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetValues0021';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableEnum>([SendableEnum.Success, SendableEnum.Failed]);
      let results: SendableEnum[] = [];
      for (let v of set.values()) { results.push(v); }
      expect(results[0]).assertEqual(SendableEnum.Success);
      expect(results[1]).assertEqual(SendableEnum.Failed);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_2200
     * @tc.name   testSetValues0022
     * @tc.desc   Verify values returns AsyncLock by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetValues0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetValues0022';
      console.info(`[${caseName}] start`);
      let lock = ArkTSUtils.locks.AsyncLock.request("val_lock2");
      let set = new collections.Set<ArkTSUtils.locks.AsyncLock>([lock]);
      let count = 0;
      for (let v of set.values()) { count++; expect(v === lock).assertTrue(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_VALUES_2300
     * @tc.name   testSetValues0023
     * @tc.desc   Verify values returns ConditionVariable by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetValues0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetValues0023';
      console.info(`[${caseName}] start`);
      let cv = ArkTSUtils.locks.ConditionVariable.request("val_cv2");
      let set = new collections.Set<ArkTSUtils.locks.ConditionVariable>([cv]);
      let count = 0;
      for (let v of set.values()) { count++; expect(v === cv).assertTrue(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

    // ForOf
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOROF_0100
     * @tc.name   testSetForOf0001
     * @tc.desc   Verify for...of iterates number element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForOf0001';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([100]);
      let results: number[] = [];
      for (let item of set) { results.push(item); }
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual(100);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOROF_0200
     * @tc.name   testSetForOf0002
     * @tc.desc   Verify for...of iterates scientific notation float
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForOf0002';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1.5e-10]);
      let results: number[] = [];
      for (let item of set) { results.push(item); }
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual(1.5e-10);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOROF_0300
     * @tc.name   testSetForOf0003
     * @tc.desc   Verify for...of iterates MAX_SAFE_INTEGER
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForOf0003';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([Number.MAX_SAFE_INTEGER]);
      let results: number[] = [];
      for (let item of set) { results.push(item); }
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual(Number.MAX_SAFE_INTEGER);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOROF_0400
     * @tc.name   testSetForOf0004
     * @tc.desc   Verify for...of iterates NaN
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForOf0004';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([NaN]);
      let results: number[] = [];
      for (let item of set) { results.push(item); }
      expect(results.length).assertEqual(1);
      expect(Number.isNaN(results[0])).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOROF_0500
     * @tc.name   testSetForOf0005
     * @tc.desc   Verify for...of iterates string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForOf0005';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(["test测试123"]);
      let results: string[] = [];
      for (let item of set) { results.push(item); }
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual("test测试123");
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOROF_0600
     * @tc.name   testSetForOf0006
     * @tc.desc   Verify for...of iterates special character string
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForOf0006';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>([SPECIAL_STR_WITH_NUL]);
      let results: string[] = [];
      for (let item of set) { results.push(item); }
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual(SPECIAL_STR_WITH_NUL);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOROF_0700
     * @tc.name   testSetForOf0007
     * @tc.desc   Verify for...of iterates emoji string
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForOf0007';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(["测试😀🎉🔥"]);
      let results: string[] = [];
      for (let item of set) { results.push(item); }
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual("测试😀🎉🔥");
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOROF_0800
     * @tc.name   testSetForOf0008
     * @tc.desc   Verify for...of iterates empty string
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForOf0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForOf0008';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>([""]);
      let results: string[] = [];
      for (let item of set) { results.push(item); }
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual("");
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOROF_0900
     * @tc.name   testSetForOf0009
     * @tc.desc   Verify for...of iterates boolean true
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForOf0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForOf0009';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>([true]);
      let results: boolean[] = [];
      for (let item of set) { results.push(item); }
      expect(results.length).assertEqual(1);
      expect(results[0]).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOROF_1000
     * @tc.name   testSetForOf0010
     * @tc.desc   Verify for...of iterates boolean false
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForOf0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForOf0010';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>([false]);
      let results: boolean[] = [];
      for (let item of set) { results.push(item); }
      expect(results.length).assertEqual(1);
      expect(results[0]).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOROF_1100
     * @tc.name   testSetForOf0011
     * @tc.desc   Verify for...of iterates undefined
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForOf0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForOf0011';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<undefined>([undefined]);
      let results: undefined[] = [];
      for (let item of set) { results.push(item); }
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual(undefined);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOROF_1200
     * @tc.name   testSetForOf0012
     * @tc.desc   Verify for...of iterates null
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForOf0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForOf0012';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<null>([null]);
      let results: null[] = [];
      for (let item of set) { results.push(item); }
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual(null);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOROF_1300
     * @tc.name   testSetForOf0013
     * @tc.desc   Verify for...of iterates SendableClassBasic instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetForOf0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetForOf0013';
      console.info(`[${caseName}] start`);
      let val1 = new SendableClassBasic(1, "a");
      let val2 = new SendableClassBasic(2, "b");
      let set = new collections.Set<SendableClassBasic>([val1, val2]);
      let results: SendableClassBasic[] = [];
      for (let item of set) { results.push(item); }
      expect(results.length).assertEqual(2);
      expect(results[0].id).assertEqual(1);
      expect(results[1].id).assertEqual(2);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOROF_1400
     * @tc.name   testSetForOf0014
     * @tc.desc   Verify for...of and values return equivalent iteration results
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetForOf0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetForOf0014';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2, 3, 4, 5]);
      let forOfResults: number[] = [];
      let valuesResults: number[] = [];
      for (let item of set) { forOfResults.push(item); }
      for (let v of set.values()) { valuesResults.push(v); }
      expect(forOfResults.join(',')).assertEqual(valuesResults.join(','));
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOROF_1500
     * @tc.name   testSetForOf0015
     * @tc.desc   Verify for...of on empty Set returns done immediately
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForOf0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForOf0015';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      let count = 0;
      for (let item of set) { count++; }
      expect(count).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });

  });
}