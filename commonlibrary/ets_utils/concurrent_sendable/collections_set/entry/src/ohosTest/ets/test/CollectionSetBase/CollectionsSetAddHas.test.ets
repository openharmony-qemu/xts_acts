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
import  * as Utils from '../utils/TestUtils';
import { SendableClassBasic, SendableClassComplex, SendableClassExtended, SendableEnum, SPECIAL_STR_WITH_NUL } from './CollectionsSetTypes';

export default function collectionsSetAddHasTest() {
  describe('collectionsSetAddHasTest', (): void => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    // ========================================================================
    // 修改+查询方法组
    // ========================================================================

    // Add
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_0100
     * @tc.name   testSetAdd0001
     * @tc.desc   Verify add returns this for chain call on number element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetAdd0001';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      let result = set.add(100);
      expect(result === set).assertTrue();
      expect(set.size).assertEqual(1);
      expect(set.has(100)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_0200
     * @tc.name   testSetAdd0002
     * @tc.desc   Verify chain add multiple elements
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetAdd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetAdd0002';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      let result = set.add(1).add(2).add(3);
      expect(result === set).assertTrue();
      expect(set.size).assertEqual(3);
      expect(set.has(2)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_0300
     * @tc.name   testSetAdd0003
     * @tc.desc   Verify duplicate add does not increase size
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetAdd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetAdd0003';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([100]);
      set.add(100);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_0400
     * @tc.name   testSetAdd0004
     * @tc.desc   Verify add string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetAdd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetAdd0004';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(["test测试123"]);
      expect(set.has("test测试123")).assertTrue();
      set.add("test测试123");
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_0500
     * @tc.name   testSetAdd0005
     * @tc.desc   Verify add special character string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetAdd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetAdd0005';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>();
      set.add(SPECIAL_STR_WITH_NUL);
      expect(set.has(SPECIAL_STR_WITH_NUL)).assertTrue();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_0600
     * @tc.name   testSetAdd0006
     * @tc.desc   Verify add emoji string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetAdd0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetAdd0006';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>();
      set.add("测试😀🎉🔥");
      expect(set.has("测试😀🎉🔥")).assertTrue();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_0700
     * @tc.name   testSetAdd0007
     * @tc.desc   Verify add empty string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetAdd0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetAdd0007';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>();
      set.add("");
      expect(set.has("")).assertTrue();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_0800
     * @tc.name   testSetAdd0008
     * @tc.desc   Verify add boolean true element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetAdd0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetAdd0008';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>();
      set.add(true);
      expect(set.has(true)).assertTrue();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_0900
     * @tc.name   testSetAdd0009
     * @tc.desc   Verify add boolean false element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetAdd0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetAdd0009';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>();
      set.add(false);
      expect(set.has(false)).assertTrue();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_1000
     * @tc.name   testSetAdd0010
     * @tc.desc   Verify add undefined element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetAdd0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetAdd0010';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<undefined>();
      set.add(undefined);
      expect(set.has(undefined)).assertTrue();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_1100
     * @tc.name   testSetAdd0011
     * @tc.desc   Verify add null element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetAdd0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetAdd0011';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<null>();
      set.add(null);
      expect(set.has(null)).assertTrue();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_1200
     * @tc.name   testSetAdd0012
     * @tc.desc   Verify add NaN element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetAdd0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetAdd0012';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      set.add(NaN);
      expect(set.has(NaN)).assertTrue();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_1300
     * @tc.name   testSetAdd0013
     * @tc.desc   Verify add MAX_SAFE_INTEGER boundary value
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetAdd0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetAdd0013';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      set.add(Number.MAX_SAFE_INTEGER);
      expect(set.has(Number.MAX_SAFE_INTEGER)).assertTrue();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_1400
     * @tc.name   testSetAdd0014
     * @tc.desc   Verify add scientific notation float value
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetAdd0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetAdd0014';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      set.add(1.5e-10);
      expect(set.has(1.5e-10)).assertTrue();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_1500
     * @tc.name   testSetAdd0015
     * @tc.desc   Verify add nested collections.Set instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetAdd0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetAdd0015';
      console.info(`[${caseName}] start`);
      let nested = new collections.Set<number>([1, 2]);
      let set = new collections.Set<collections.Set<number>>();
      set.add(nested);
      expect(set.has(nested)).assertTrue();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_1600
     * @tc.name   testSetAdd0016
     * @tc.desc   Verify add nested collections.Map instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetAdd0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetAdd0016';
      console.info(`[${caseName}] start`);
      let nested = new collections.Map<number, string>();
      nested.set(1, "one");
      let set = new collections.Set<collections.Map<number, string>>();
      set.add(nested);
      expect(set.has(nested)).assertTrue();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_1700
     * @tc.name   testSetAdd0017
     * @tc.desc   Verify add nested collections.Array instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetAdd0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetAdd0017';
      console.info(`[${caseName}] start`);
      let nested = new collections.Array<number>(1, 2, 3);
      let set = new collections.Set<collections.Array<number>>();
      set.add(nested);
      expect(set.has(nested)).assertTrue();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_1800
     * @tc.name   testSetAdd0018
     * @tc.desc   Verify add SendableClassBasic instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetAdd0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetAdd0018';
      console.info(`[${caseName}] start`);
      let val = new SendableClassBasic(1, "basic");
      let set = new collections.Set<SendableClassBasic>();
      set.add(val);
      expect(set.has(val)).assertTrue();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_1900
     * @tc.name   testSetAdd0019
     * @tc.desc   Verify add SendableClassComplex instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetAdd0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetAdd0019';
      console.info(`[${caseName}] start`);
      let val = new SendableClassComplex();
      let set = new collections.Set<SendableClassComplex>();
      set.add(val);
      expect(set.has(val)).assertTrue();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_2000
     * @tc.name   testSetAdd0020
     * @tc.desc   Verify add SendableClassExtended instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetAdd0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetAdd0020';
      console.info(`[${caseName}] start`);
      let val = new SendableClassExtended();
      val.name = 'extended_test';
      let set = new collections.Set<SendableClassExtended>();
      set.add(val);
      expect(set.has(val)).assertTrue();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_2100
     * @tc.name   testSetAdd0021
     * @tc.desc   Verify add SendableEnum value
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetAdd0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetAdd0021';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableEnum>();
      set.add(SendableEnum.Success);
      expect(set.has(SendableEnum.Success)).assertTrue();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_2200
     * @tc.name   testSetAdd0022
     * @tc.desc   Verify add AsyncLock instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetAdd0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetAdd0022';
      console.info(`[${caseName}] start`);
      let lock = ArkTSUtils.locks.AsyncLock.request("add_lock");
      let set = new collections.Set<ArkTSUtils.locks.AsyncLock>();
      set.add(lock);
      expect(set.has(lock)).assertTrue();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_2300
     * @tc.name   testSetAdd0023
     * @tc.desc   Verify add ConditionVariable instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetAdd0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetAdd0023';
      console.info(`[${caseName}] start`);
      let cv = ArkTSUtils.locks.ConditionVariable.request("add_cv");
      let set = new collections.Set<ArkTSUtils.locks.ConditionVariable>();
      set.add(cv);
      expect(set.has(cv)).assertTrue();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_2400
     * @tc.name   testSetAdd0024
     * @tc.desc   Verify add SendableLruCache instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetAdd0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetAdd0024';
      console.info(`[${caseName}] start`);
      let cache = new ArkTSUtils.SendableLruCache<number, string>(10);
      cache.put(1, "one");
      let set = new collections.Set<ArkTSUtils.SendableLruCache<number, string>>();
      set.add(cache);
      expect(set.has(cache)).assertTrue();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_ADD_2500
     * @tc.name   testSetAdd0025
     * @tc.desc   Verify add treats +0 and -0 as equal per SameValueZero semantics
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetAdd0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetAdd0025';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      set.add(0);
      set.add(-0);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

    // Has
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_0100
     * @tc.name   testSetHas0001
     * @tc.desc   Verify has returns true for existing number element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetHas0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetHas0001';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([100]);
      expect(set.has(100)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_0200
     * @tc.name   testSetHas0002
     * @tc.desc   Verify has returns false for non-existent element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetHas0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetHas0002';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([100]);
      expect(set.has(200)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_0300
     * @tc.name   testSetHas0003
     * @tc.desc   Verify has returns true for string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetHas0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetHas0003';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(["test测试123"]);
      expect(set.has("test测试123")).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_0400
     * @tc.name   testSetHas0004
     * @tc.desc   Verify has returns true for special character string
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetHas0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetHas0004';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>([SPECIAL_STR_WITH_NUL]);
      expect(set.has(SPECIAL_STR_WITH_NUL)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_0500
     * @tc.name   testSetHas0005
     * @tc.desc   Verify has returns true for emoji string
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetHas0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetHas0005';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(["测试😀🎉🔥"]);
      expect(set.has("测试😀🎉🔥")).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_0600
     * @tc.name   testSetHas0006
     * @tc.desc   Verify has returns true for empty string
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetHas0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetHas0006';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>([""]);
      expect(set.has("")).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_0700
     * @tc.name   testSetHas0007
     * @tc.desc   Verify has returns true for boolean true element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetHas0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetHas0007';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>([true]);
      expect(set.has(true)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_0800
     * @tc.name   testSetHas0008
     * @tc.desc   Verify has returns true for boolean false element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetHas0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetHas0008';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>([false]);
      expect(set.has(false)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_0900
     * @tc.name   testSetHas0009
     * @tc.desc   Verify has returns false for boolean not added
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetHas0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetHas0009';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>([true]);
      expect(set.has(false)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_1000
     * @tc.name   testSetHas0010
     * @tc.desc   Verify has returns true for undefined element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetHas0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetHas0010';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<undefined>([undefined]);
      expect(set.has(undefined)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_1100
     * @tc.name   testSetHas0011
     * @tc.desc   Verify has returns true for null element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetHas0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetHas0011';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<null>([null]);
      expect(set.has(null)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_1200
     * @tc.name   testSetHas0012
     * @tc.desc   Verify has returns true for NaN element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetHas0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetHas0012';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([NaN]);
      expect(set.has(NaN)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_1300
     * @tc.name   testSetHas0013
     * @tc.desc   Verify has returns true for MAX_SAFE_INTEGER boundary value
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetHas0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetHas0013';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([Number.MAX_SAFE_INTEGER]);
      expect(set.has(Number.MAX_SAFE_INTEGER)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_1400
     * @tc.name   testSetHas0014
     * @tc.desc   Verify has returns true for scientific notation float
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetHas0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetHas0014';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1.5e-10]);
      expect(set.has(1.5e-10)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_1500
     * @tc.name   testSetHas0015
     * @tc.desc   Verify has returns true for nested Set and false for different instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetHas0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetHas0015';
      console.info(`[${caseName}] start`);
      let nested = new collections.Set<number>([1, 2]);
      let set = new collections.Set<collections.Set<number>>([nested]);
      expect(set.has(nested)).assertTrue();
      expect(set.has(new collections.Set<number>([1, 2]))).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_1600
     * @tc.name   testSetHas0016
     * @tc.desc   Verify has returns true for SendableClassBasic
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetHas0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetHas0016';
      console.info(`[${caseName}] start`);
      let val = new SendableClassBasic(1, "basic");
      let set = new collections.Set<SendableClassBasic>([val]);
      expect(set.has(val)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_1700
     * @tc.name   testSetHas0017
     * @tc.desc   Verify has returns true for SendableClassExtended
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetHas0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetHas0017';
      console.info(`[${caseName}] start`);
      let val = new SendableClassExtended();
      val.name = 'extended_test';
      let set = new collections.Set<SendableClassExtended>([val]);
      expect(set.has(val)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_1800
     * @tc.name   testSetHas0018
     * @tc.desc   Verify has returns true for SendableClassComplex
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetHas0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetHas0018';
      console.info(`[${caseName}] start`);
      let val = new SendableClassComplex();
      let set = new collections.Set<SendableClassComplex>([val]);
      expect(set.has(val)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_1900
     * @tc.name   testSetHas0019
     * @tc.desc   Verify has returns true for SendableEnum and false for non-added
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetHas0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetHas0019';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableEnum>([SendableEnum.Success, SendableEnum.Failed]);
      expect(set.has(SendableEnum.Success)).assertTrue();
      expect(set.has(SendableEnum.Pending)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_2000
     * @tc.name   testSetHas0020
     * @tc.desc   Verify has returns true for AsyncLock
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetHas0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetHas0020';
      console.info(`[${caseName}] start`);
      let lock = ArkTSUtils.locks.AsyncLock.request("has_lock");
      let set = new collections.Set<ArkTSUtils.locks.AsyncLock>([lock]);
      expect(set.has(lock)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_2100
     * @tc.name   testSetHas0021
     * @tc.desc   Verify has returns true for ConditionVariable
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetHas0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetHas0021';
      console.info(`[${caseName}] start`);
      let cv = ArkTSUtils.locks.ConditionVariable.request("has_cv");
      let set = new collections.Set<ArkTSUtils.locks.ConditionVariable>([cv]);
      expect(set.has(cv)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_2200
     * @tc.name   testSetHas0022
     * @tc.desc   Verify has returns true for SendableLruCache
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetHas0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetHas0022';
      console.info(`[${caseName}] start`);
      let cache = new ArkTSUtils.SendableLruCache<number, string>(10);
      cache.put(1, "one");
      let set = new collections.Set<ArkTSUtils.SendableLruCache<number, string>>([cache]);
      expect(set.has(cache)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_2300
     * @tc.name   testSetHas0023
     * @tc.desc   Verify has returns false on empty Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetHas0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetHas0023';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      expect(set.has(1)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_HAS_2400
     * @tc.name   testSetHas0024
     * @tc.desc   Verify has returns false after clear
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetHas0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetHas0024';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1]);
      set.clear();
      expect(set.has(1)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });

  });
}