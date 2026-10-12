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

export default function collectionsSetForEachEntriesTest() {
  describe('collectionsSetForEachEntriesTest', (): void => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    // ========================================================================
    // 遍历方法组
    // ========================================================================

    // ForEach
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_0100
     * @tc.name   testSetForEach0001
     * @tc.desc   Verify forEach iterates single number element with key===value semantics
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForEach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForEach0001';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([100]);
      let count = 0;
      set.forEach((value: number, value2: number, s: collections.Set<number>) => { count++;
        expect(value).assertEqual(100); expect(value2).assertEqual(100); });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_0200
     * @tc.name   testSetForEach0002
     * @tc.desc   Verify forEach iterates all elements in insertion order
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForEach0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForEach0002';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2, 3, 4, 5]);
      let values: number[] = [];
      set.forEach((value: number) => { values.push(value); });
      expect(values.join(',')).assertEqual('1,2,3,4,5');
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_0300
     * @tc.name   testSetForEach0003
     * @tc.desc   Verify forEach iterates string element with key===value semantics
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForEach0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForEach0003';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(["test测试123"]);
      let count = 0;
      set.forEach((value: string, value2: string) => { count++; expect(value).assertEqual("test测试123");
        expect(value2).assertEqual("test测试123"); });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_0400
     * @tc.name   testSetForEach0004
     * @tc.desc   Verify forEach iterates special character string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForEach0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForEach0004';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>([SPECIAL_STR_WITH_NUL]);
      let count = 0;
      set.forEach((value: string) => { count++; expect(value).assertEqual(SPECIAL_STR_WITH_NUL); });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_0500
     * @tc.name   testSetForEach0005
     * @tc.desc   Verify forEach iterates emoji string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForEach0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForEach0005';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(["测试😀🎉🔥"]);
      let count = 0;
      set.forEach((value: string) => { count++; expect(value).assertEqual("测试😀🎉🔥"); });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_0600
     * @tc.name   testSetForEach0006
     * @tc.desc   Verify forEach does not execute callback on empty Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForEach0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForEach0006';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      let count = 0;
      set.forEach(() => { count++; });
      expect(count).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_0700
     * @tc.name   testSetForEach0007
     * @tc.desc   Verify forEach iterates boolean true element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForEach0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForEach0007';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>([true]);
      let results: boolean[] = [];
      set.forEach((value: boolean) => { results.push(value); });
      expect(results.length).assertEqual(1);
      expect(results[0]).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_0800
     * @tc.name   testSetForEach0008
     * @tc.desc   Verify forEach iterates boolean false element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForEach0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForEach0008';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>([false]);
      let results: boolean[] = [];
      set.forEach((value: boolean) => { results.push(value); });
      expect(results.length).assertEqual(1);
      expect(results[0]).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_0900
     * @tc.name   testSetForEach0009
     * @tc.desc   Verify forEach iterates undefined element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForEach0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForEach0009';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<undefined>([undefined]);
      let results: undefined[] = [];
      set.forEach((value: undefined) => { results.push(value); });
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual(undefined);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_1000
     * @tc.name   testSetForEach0010
     * @tc.desc   Verify forEach iterates null element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForEach0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForEach0010';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<null>([null]);
      let results: null[] = [];
      set.forEach((value: null) => { results.push(value); });
      expect(results.length).assertEqual(1);
      expect(results[0]).assertEqual(null);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_1100
     * @tc.name   testSetForEach0011
     * @tc.desc   Verify forEach iterates NaN element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForEach0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForEach0011';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([NaN]);
      let count = 0;
      set.forEach((value: number) => { count++; expect(Number.isNaN(value)).assertTrue(); });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_1200
     * @tc.name   testSetForEach0012
     * @tc.desc   Verify forEach iterates nested collections.Set instance by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetForEach0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetForEach0012';
      console.info(`[${caseName}] start`);
      let nested = new collections.Set<number>([1, 2]);
      let set = new collections.Set<collections.Set<number>>([nested]);
      let count = 0;
      set.forEach((value: collections.Set<number>) => { count++; expect(value === nested).assertTrue();
        expect(value.size).assertEqual(2); });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_1300
     * @tc.name   testSetForEach0013
     * @tc.desc   Verify forEach iterates SendableClassBasic instances
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetForEach0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetForEach0013';
      console.info(`[${caseName}] start`);
      let val1 = new SendableClassBasic(1, "a");
      let val2 = new SendableClassBasic(2, "b");
      let set = new collections.Set<SendableClassBasic>([val1, val2]);
      let ids: number[] = [];
      set.forEach((value: SendableClassBasic, value2: SendableClassBasic) => { ids.push(value.id);
        expect(value === value2).assertTrue(); });
      expect(ids.length).assertEqual(2);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_1400
     * @tc.name   testSetForEach0014
     * @tc.desc   Verify forEach iterates SendableClassComplex instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetForEach0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetForEach0014';
      console.info(`[${caseName}] start`);
      let val = new SendableClassComplex();
      let set = new collections.Set<SendableClassComplex>([val]);
      let count = 0;
      set.forEach((value: SendableClassComplex) => { count++; expect(value.basic.id).assertEqual(1);
        expect(value.nestedId).assertEqual(42); });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_1500
     * @tc.name   testSetForEach0015
     * @tc.desc   Verify forEach iterates SendableClassExtended instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetForEach0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetForEach0015';
      console.info(`[${caseName}] start`);
      let val = new SendableClassExtended();
      val.name = 'extended_test';
      let set = new collections.Set<SendableClassExtended>([val]);
      let count = 0;
      set.forEach((value: SendableClassExtended) => { count++; });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_1600
     * @tc.name   testSetForEach0016
     * @tc.desc   Verify forEach iterates SendableEnum values in insertion order
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetForEach0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetForEach0016';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableEnum>([SendableEnum.Success, SendableEnum.Failed, SendableEnum.Pending]);
      let results: SendableEnum[] = [];
      set.forEach((value: SendableEnum) => { results.push(value); });
      expect(results.length).assertEqual(3);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_1700
     * @tc.name   testSetForEach0017
     * @tc.desc   Verify forEach iterates AsyncLock instance by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetForEach0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetForEach0017';
      console.info(`[${caseName}] start`);
      let lock = ArkTSUtils.locks.AsyncLock.request("fe_lock");
      let set = new collections.Set<ArkTSUtils.locks.AsyncLock>([lock]);
      let count = 0;
      set.forEach((value: ArkTSUtils.locks.AsyncLock) => { count++; expect(value === lock).assertTrue(); });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_1800
     * @tc.name   testSetForEach0018
     * @tc.desc   Verify forEach iterates ConditionVariable instance by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetForEach0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetForEach0018';
      console.info(`[${caseName}] start`);
      let cv = ArkTSUtils.locks.ConditionVariable.request("fe_cv");
      let set = new collections.Set<ArkTSUtils.locks.ConditionVariable>([cv]);
      let count = 0;
      set.forEach((value: ArkTSUtils.locks.ConditionVariable) => { count++; expect(value === cv).assertTrue(); });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_1900
     * @tc.name   testSetForEach0019
     * @tc.desc   Verify forEach iterates SendableLruCache instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetForEach0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetForEach0019';
      console.info(`[${caseName}] start`);
      let cache = new ArkTSUtils.SendableLruCache<number, string>(10);
      cache.put(1, "x");
      let set = new collections.Set<ArkTSUtils.SendableLruCache<number, string>>([cache]);
      let count = 0;
      set.forEach((value: ArkTSUtils.SendableLruCache<number, string>) => { count++;
        expect(value.get(1)).assertEqual("x"); });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_2000
     * @tc.name   testSetForEach0020
     * @tc.desc   Verify forEach iterates MAX_SAFE_INTEGER boundary value
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForEach0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForEach0020';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([Number.MAX_SAFE_INTEGER]);
      let count = 0;
      set.forEach((value: number) => { count++; expect(value).assertEqual(Number.MAX_SAFE_INTEGER); });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_2100
     * @tc.name   testSetForEach0021
     * @tc.desc   Verify forEach iterates scientific notation float value
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForEach0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForEach0021';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1.5e-10]);
      let count = 0;
      set.forEach((value: number) => { count++; expect(value).assertEqual(1.5e-10); });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_FOREACH_2200
     * @tc.name   testSetForEach0022
     * @tc.desc   Verify forEach iterates empty string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetForEach0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetForEach0022';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>([""]);
      let count = 0;
      set.forEach((value: string) => { count++; expect(value).assertEqual(""); });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

    // Entries
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_0100
     * @tc.name   testSetEntries0001
     * @tc.desc   Verify entries returns iterator — existence and exhaustion
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetEntries0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetEntries0001';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([100]);
      let iter = set.entries();
      let entry = iter.next();
      expect(entry.done).assertFalse();
      expect(entry.value[0]).assertEqual(100);
      expect(entry.value[1]).assertEqual(100);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_0200
     * @tc.name   testSetEntries0002
     * @tc.desc   Verify entries returns [T,T] key-value pair for number element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetEntries0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetEntries0002';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([100]);
      let iter = set.entries();
      let entry = iter.next();
      expect(entry.done).assertFalse();
      expect(entry.value[0]).assertEqual(100);
      expect(entry.value[1]).assertEqual(100);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_0300
     * @tc.name   testSetEntries0003
     * @tc.desc   Verify entries iterates in insertion order — count and first two entries
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetEntries0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetEntries0003';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2, 3]);
      let results: number[] = [];
      for (let entry of set.entries()) { results.push(entry[0]); }
      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual(1);
      expect(results[1]).assertEqual(2);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_0400
     * @tc.name   testSetEntries0004
     * @tc.desc   Verify entries iterates in insertion order — remaining entry with key===value
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetEntries0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetEntries0004';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2, 3]);
      let results: number[] = [];
      for (let entry of set.entries()) { results.push(entry[0]); expect(entry[0]).assertEqual(entry[1]); }
      expect(results[2]).assertEqual(3);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_0500
     * @tc.name   testSetEntries0005
     * @tc.desc   Verify entries returns new iterator on each call
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetEntries0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetEntries0005';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2]);
      let iter1 = set.entries();
      let iter2 = set.entries();
      let results1: number[][] = [];
      let results2: number[][] = [];
      for (let entry of iter1) { results1.push(entry); }
      for (let entry of iter2) { results2.push(entry); }
      expect(results1.join(',')).assertEqual(results2.join(','));
      expect(results1.join(',')).assertEqual('1,1,2,2');
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_0600
     * @tc.name   testSetEntries0006
     * @tc.desc   Verify entries returns empty iterator for empty Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetEntries0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetEntries0006';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      let iter = set.entries();
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_0700
     * @tc.name   testSetEntries0007
     * @tc.desc   Verify entries returns [T,T] key-value pair for string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetEntries0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetEntries0007';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(["test测试123"]);
      let iter = set.entries();
      let entry = iter.next();
      if (entry.value) {
        expect(entry.value[0]).assertEqual("test测试123");
        expect(entry.value[1]).assertEqual("test测试123");
      }
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_0800
     * @tc.name   testSetEntries0008
     * @tc.desc   Verify entries returns nested collections.Set by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetEntries0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetEntries0008';
      console.info(`[${caseName}] start`);
      let nested = new collections.Set<number>([1, 2]);
      let set = new collections.Set<collections.Set<number>>([nested]);
      let count = 0;
      for (let entry of set.entries()) { count++; expect(entry[0] === nested).assertTrue();
        expect(entry[1] === nested).assertTrue(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_0900
     * @tc.name   testSetEntries0009
     * @tc.desc   Verify entries returns SendableClassBasic by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetEntries0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetEntries0009';
      console.info(`[${caseName}] start`);
      let val = new SendableClassBasic(1, "entries_test");
      let set = new collections.Set<SendableClassBasic>([val]);
      let count = 0;
      for (let entry of set.entries()) { count++; expect(entry[0] === val).assertTrue();
        expect(entry[1] === val).assertTrue(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_1000
     * @tc.name   testSetEntries0010
     * @tc.desc   Verify entries returns SendableClassExtended by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetEntries0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetEntries0010';
      console.info(`[${caseName}] start`);
      let val = new SendableClassExtended();
      val.name = 'extended_test';
      let set = new collections.Set<SendableClassExtended>([val]);
      let count = 0;
      for (let entry of set.entries()) { count++; expect(entry[0] === val).assertTrue();
        expect(entry[1] === val).assertTrue(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_1100
     * @tc.name   testSetEntries0011
     * @tc.desc   Verify entries returns SendableEnum with key===value invariant
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetEntries0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetEntries0011';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableEnum>([SendableEnum.Success, SendableEnum.Pending]);
      let count = 0;
      for (let entry of set.entries()) { expect(entry[0]).assertEqual(entry[1]); count++; }
      expect(count).assertEqual(2);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_1200
     * @tc.name   testSetEntries0012
     * @tc.desc   Verify entries returns nested SendableLruCache by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetEntries0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetEntries0012';
      console.info(`[${caseName}] start`);
      let cache = new ArkTSUtils.SendableLruCache<number, string>(5);
      cache.put(1, "a");
      let set = new collections.Set<ArkTSUtils.SendableLruCache<number, string>>([cache]);
      let count = 0;
      for (let entry of set.entries()) { count++; expect(entry[0] === cache).assertTrue();
        expect(entry[1] === cache).assertTrue(); expect(entry[0].get(1)).assertEqual("a"); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_1300
     * @tc.name   testSetEntries0013
     * @tc.desc   Verify entries returns AsyncLock by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetEntries0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetEntries0013';
      console.info(`[${caseName}] start`);
      let lock = ArkTSUtils.locks.AsyncLock.request("ent_lock");
      let set = new collections.Set<ArkTSUtils.locks.AsyncLock>([lock]);
      let count = 0;
      for (let entry of set.entries()) { count++; expect(entry[0] === lock).assertTrue();
        expect(entry[1] === lock).assertTrue(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_1400
     * @tc.name   testSetEntries0014
     * @tc.desc   Verify entries returns boolean true with key===value invariant
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetEntries0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetEntries0014';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>([true]);
      let count = 0;
      for (let entry of set.entries()) { count++; expect(entry[0]).assertEqual(entry[1]);
        expect(entry[0]).assertTrue(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_1500
     * @tc.name   testSetEntries0015
     * @tc.desc   Verify entries returns boolean false with key===value invariant
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetEntries0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetEntries0015';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>([false]);
      let count = 0;
      for (let entry of set.entries()) { count++; expect(entry[0]).assertEqual(entry[1]);
        expect(entry[0]).assertFalse(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_1600
     * @tc.name   testSetEntries0016
     * @tc.desc   Verify entries returns undefined with key===value invariant
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetEntries0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetEntries0016';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<undefined>([undefined]);
      let count = 0;
      for (let entry of set.entries()) { expect(entry[0]).assertEqual(undefined);
        expect(entry[1]).assertEqual(undefined); expect(entry[0]).assertEqual(entry[1]); count++; }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_1700
     * @tc.name   testSetEntries0017
     * @tc.desc   Verify entries returns null with key===value invariant
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetEntries0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetEntries0017';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<null>([null]);
      let count = 0;
      for (let entry of set.entries()) { expect(entry[0]).assertEqual(entry[1]); count++; }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_1800
     * @tc.name   testSetEntries0018
     * @tc.desc   Verify entries returns scientific notation float
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetEntries0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetEntries0018';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1.5e-10]);
      let count = 0;
      for (let entry of set.entries()) { count++; expect(entry[0]).assertEqual(1.5e-10);
        expect(entry[1]).assertEqual(1.5e-10); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_1900
     * @tc.name   testSetEntries0019
     * @tc.desc   Verify entries returns MAX_SAFE_INTEGER boundary value
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetEntries0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetEntries0019';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([Number.MAX_SAFE_INTEGER]);
      let count = 0;
      for (let entry of set.entries()) { count++; expect(entry[0]).assertEqual(Number.MAX_SAFE_INTEGER);
        expect(entry[1]).assertEqual(Number.MAX_SAFE_INTEGER); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_2000
     * @tc.name   testSetEntries0020
     * @tc.desc   Verify entries returns NaN with key===value invariant
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetEntries0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetEntries0020';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([NaN]);
      let count = 0;
      for (let entry of set.entries()) { count++; expect(Number.isNaN(entry[0])).assertTrue();
        expect(Number.isNaN(entry[1])).assertTrue(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_2100
     * @tc.name   testSetEntries0021
     * @tc.desc   Verify entries returns special character string
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetEntries0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetEntries0021';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>([SPECIAL_STR_WITH_NUL]);
      let count = 0;
      for (let entry of set.entries()) { count++; expect(entry[0]).assertEqual(SPECIAL_STR_WITH_NUL);
        expect(entry[1]).assertEqual(SPECIAL_STR_WITH_NUL); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_2200
     * @tc.name   testSetEntries0022
     * @tc.desc   Verify entries returns emoji string
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetEntries0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetEntries0022';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(["测试😀🎉🔥"]);
      let count = 0;
      for (let entry of set.entries()) { count++; expect(entry[0]).assertEqual("测试😀🎉🔥");
        expect(entry[1]).assertEqual("测试😀🎉🔥"); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_2300
     * @tc.name   testSetEntries0023
     * @tc.desc   Verify entries returns empty string
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetEntries0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetEntries0023';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>([""]);
      let count = 0;
      for (let entry of set.entries()) { count++; expect(entry[0]).assertEqual(""); expect(entry[1]).assertEqual(""); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_2400
     * @tc.name   testSetEntries0024
     * @tc.desc   Verify entries returns SendableClassComplex by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetEntries0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetEntries0024';
      console.info(`[${caseName}] start`);
      let val = new SendableClassComplex();
      let set = new collections.Set<SendableClassComplex>([val]);
      let count = 0;
      for (let entry of set.entries()) { count++; expect(entry[0] === val).assertTrue();
        expect(entry[1] === val).assertTrue(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ENTRIES_2500
     * @tc.name   testSetEntries0025
     * @tc.desc   Verify entries returns ConditionVariable by reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetEntries0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetEntries0025';
      console.info(`[${caseName}] start`);
      let cv = ArkTSUtils.locks.ConditionVariable.request("ent_cv2");
      let set = new collections.Set<ArkTSUtils.locks.ConditionVariable>([cv]);
      let count = 0;
      for (let entry of set.entries()) { count++; expect(entry[0] === cv).assertTrue();
        expect(entry[1] === cv).assertTrue(); }
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

  });
}