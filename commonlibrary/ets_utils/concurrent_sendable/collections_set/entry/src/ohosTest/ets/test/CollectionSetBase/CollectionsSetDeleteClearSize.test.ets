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

export default function collectionsSetDeleteClearSizeTest() {
  describe('collectionsSetDeleteClearSizeTest', (): void => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    // ========================================================================
    // 修改+查询方法组
    // ========================================================================

    // Delete
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_0100
     * @tc.name   testSetDelete0001
     * @tc.desc   Verify delete removes number element and returns true
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetDelete0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetDelete0001';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([100]);
      let result = set.delete(100);
      expect(result).assertTrue();
      expect(set.size).assertEqual(0);
      expect(set.has(100)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_0200
     * @tc.name   testSetDelete0002
     * @tc.desc   Verify delete on non-existent element returns false
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetDelete0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetDelete0002';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([100]);
      let result = set.delete(200);
      expect(result).assertFalse();
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_0300
     * @tc.name   testSetDelete0003
     * @tc.desc   Verify delete removes string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetDelete0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetDelete0003';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(["test测试123"]);
      let result = set.delete("test测试123");
      expect(result).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_0400
     * @tc.name   testSetDelete0004
     * @tc.desc   Verify delete removes special character string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetDelete0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetDelete0004';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>([SPECIAL_STR_WITH_NUL]);
      let result = set.delete(SPECIAL_STR_WITH_NUL);
      expect(result).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_0500
     * @tc.name   testSetDelete0005
     * @tc.desc   Verify delete removes emoji string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetDelete0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetDelete0005';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(["测试😀🎉🔥"]);
      let result = set.delete("测试😀🎉🔥");
      expect(result).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_0600
     * @tc.name   testSetDelete0006
     * @tc.desc   Verify delete removes empty string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetDelete0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetDelete0006';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>([""]);
      let result = set.delete("");
      expect(result).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_0700
     * @tc.name   testSetDelete0007
     * @tc.desc   Verify delete removes boolean true element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetDelete0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetDelete0007';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>([true]);
      let result = set.delete(true);
      expect(result).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_0800
     * @tc.name   testSetDelete0008
     * @tc.desc   Verify delete removes boolean false element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetDelete0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetDelete0008';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>([false]);
      let result = set.delete(false);
      expect(result).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_0900
     * @tc.name   testSetDelete0009
     * @tc.desc   Verify delete removes undefined element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetDelete0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetDelete0009';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<undefined>([undefined]);
      let result = set.delete(undefined);
      expect(result).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_1000
     * @tc.name   testSetDelete0010
     * @tc.desc   Verify delete removes null element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetDelete0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetDelete0010';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<null>([null]);
      let result = set.delete(null);
      expect(result).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_1100
     * @tc.name   testSetDelete0011
     * @tc.desc   Verify delete removes NaN element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetDelete0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetDelete0011';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([NaN]);
      let result = set.delete(NaN);
      expect(result).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_1200
     * @tc.name   testSetDelete0012
     * @tc.desc   Verify delete removes MAX_SAFE_INTEGER boundary value
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetDelete0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetDelete0012';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([Number.MAX_SAFE_INTEGER]);
      let result = set.delete(Number.MAX_SAFE_INTEGER);
      expect(result).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_1300
     * @tc.name   testSetDelete0013
     * @tc.desc   Verify delete removes scientific notation float value
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetDelete0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetDelete0013';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1.5e-10]);
      let result = set.delete(1.5e-10);
      expect(result).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_1400
     * @tc.name   testSetDelete0014
     * @tc.desc   Verify delete removes nested collections.Set instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetDelete0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetDelete0014';
      console.info(`[${caseName}] start`);
      let nested = new collections.Set<number>([1, 2]);
      let set = new collections.Set<collections.Set<number>>([nested]);
      let result = set.delete(nested);
      expect(result).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_1500
     * @tc.name   testSetDelete0015
     * @tc.desc   Verify delete removes SendableClassBasic instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetDelete0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetDelete0015';
      console.info(`[${caseName}] start`);
      let val = new SendableClassBasic(1, "basic");
      let set = new collections.Set<SendableClassBasic>([val]);
      let result = set.delete(val);
      expect(result).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_1600
     * @tc.name   testSetDelete0016
     * @tc.desc   Verify delete removes SendableClassExtended instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetDelete0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetDelete0016';
      console.info(`[${caseName}] start`);
      let val = new SendableClassExtended();
      val.name = 'extended_test';
      let set = new collections.Set<SendableClassExtended>([val]);
      let result = set.delete(val);
      expect(result).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_1700
     * @tc.name   testSetDelete0017
     * @tc.desc   Verify delete removes SendableEnum value
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetDelete0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetDelete0017';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableEnum>([SendableEnum.Success]);
      let result = set.delete(SendableEnum.Success);
      expect(result).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_1800
     * @tc.name   testSetDelete0018
     * @tc.desc   Verify delete removes AsyncLock instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetDelete0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetDelete0018';
      console.info(`[${caseName}] start`);
      let lock = ArkTSUtils.locks.AsyncLock.request("del_lock");
      let set = new collections.Set<ArkTSUtils.locks.AsyncLock>([lock]);
      let result = set.delete(lock);
      expect(result).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_1900
     * @tc.name   testSetDelete0019
     * @tc.desc   Verify delete removes ConditionVariable instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetDelete0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetDelete0019';
      console.info(`[${caseName}] start`);
      let cv = ArkTSUtils.locks.ConditionVariable.request("del_cv");
      let set = new collections.Set<ArkTSUtils.locks.ConditionVariable>([cv]);
      let result = set.delete(cv);
      expect(result).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_2000
     * @tc.name   testSetDelete0020
     * @tc.desc   Verify delete removes SendableLruCache instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetDelete0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetDelete0020';
      console.info(`[${caseName}] start`);
      let cache = new ArkTSUtils.SendableLruCache<number, string>(10);
      cache.put(1, "one");
      let set = new collections.Set<ArkTSUtils.SendableLruCache<number, string>>([cache]);
      let result = set.delete(cache);
      expect(result).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_2100
     * @tc.name   testSetDelete0021
     * @tc.desc   Verify delete returns false for already-deleted element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetDelete0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetDelete0021';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([100]);
      set.delete(100);
      let result = set.delete(100);
      expect(result).assertFalse();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_2200
     * @tc.name   testSetDelete0022
     * @tc.desc   Verify interleaved add and delete operations maintain correct state
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetDelete0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetDelete0022';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      set.add(1);
      set.add(2);
      set.add(3);
      set.delete(2);
      expect(set.has(1)).assertTrue();
      expect(set.has(2)).assertFalse();
      expect(set.has(3)).assertTrue();
      expect(set.size).assertEqual(2);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_DELETE_2300
     * @tc.name   testSetDelete0023
     * @tc.desc   Verify delete returns false on empty Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetDelete0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetDelete0023';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      let result = set.delete(1);
      expect(result).assertFalse();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });

    // Clear
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_0100
     * @tc.name   testSetClear0001
     * @tc.desc   Verify clear empties Set with number element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetClear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetClear0001';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([100]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_0200
     * @tc.name   testSetClear0002
     * @tc.desc   Verify clear empties Set with multiple number elements
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetClear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetClear0002';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2, 3]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_0300
     * @tc.name   testSetClear0003
     * @tc.desc   Verify clear on empty Set does not throw
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetClear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetClear0003';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_0400
     * @tc.name   testSetClear0004
     * @tc.desc   Verify clear empties Set with string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetClear0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetClear0004';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(["test测试123"]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_0500
     * @tc.name   testSetClear0005
     * @tc.desc   Verify clear empties Set with special character string
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetClear0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetClear0005';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>([SPECIAL_STR_WITH_NUL]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_0600
     * @tc.name   testSetClear0006
     * @tc.desc   Verify clear empties Set with emoji string
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetClear0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetClear0006';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(["测试😀🎉🔥"]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_0700
     * @tc.name   testSetClear0007
     * @tc.desc   Verify clear empties Set with empty string
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetClear0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetClear0007';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>([""]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_0800
     * @tc.name   testSetClear0008
     * @tc.desc   Verify clear empties Set with boolean true
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetClear0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetClear0008';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>([true]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_0900
     * @tc.name   testSetClear0009
     * @tc.desc   Verify clear empties Set with boolean false
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetClear0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetClear0009';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>([false]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_1000
     * @tc.name   testSetClear0010
     * @tc.desc   Verify clear empties Set with undefined
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetClear0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetClear0010';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<undefined>([undefined]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_1100
     * @tc.name   testSetClear0011
     * @tc.desc   Verify clear empties Set with null
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetClear0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetClear0011';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<null>([null]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_1200
     * @tc.name   testSetClear0012
     * @tc.desc   Verify clear empties Set with NaN
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetClear0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetClear0012';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([NaN]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_1300
     * @tc.name   testSetClear0013
     * @tc.desc   Verify clear empties Set with MAX_SAFE_INTEGER
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetClear0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetClear0013';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([Number.MAX_SAFE_INTEGER]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_1400
     * @tc.name   testSetClear0014
     * @tc.desc   Verify clear empties Set with scientific notation float
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetClear0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetClear0014';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1.5e-10]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_1500
     * @tc.name   testSetClear0015
     * @tc.desc   Verify clear empties Set with nested collections.Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetClear0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetClear0015';
      console.info(`[${caseName}] start`);
      let nested = new collections.Set<number>([1, 2]);
      let set = new collections.Set<collections.Set<number>>([nested]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_1600
     * @tc.name   testSetClear0016
     * @tc.desc   Verify clear empties Set with SendableClassBasic
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetClear0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetClear0016';
      console.info(`[${caseName}] start`);
      let val = new SendableClassBasic(1, "basic");
      let set = new collections.Set<SendableClassBasic>([val]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_1700
     * @tc.name   testSetClear0017
     * @tc.desc   Verify clear empties Set with SendableClassExtended
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetClear0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetClear0017';
      console.info(`[${caseName}] start`);
      let val = new SendableClassExtended();
      val.name = 'extended_test';
      let set = new collections.Set<SendableClassExtended>([val]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_1800
     * @tc.name   testSetClear0018
     * @tc.desc   Verify clear empties Set with SendableClassComplex
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetClear0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetClear0018';
      console.info(`[${caseName}] start`);
      let val = new SendableClassComplex();
      let set = new collections.Set<SendableClassComplex>([val]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_1900
     * @tc.name   testSetClear0019
     * @tc.desc   Verify clear empties Set with SendableEnum
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetClear0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetClear0019';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableEnum>([SendableEnum.Success, SendableEnum.Failed]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_2000
     * @tc.name   testSetClear0020
     * @tc.desc   Verify clear empties Set with AsyncLock
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetClear0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetClear0020';
      console.info(`[${caseName}] start`);
      let lock = ArkTSUtils.locks.AsyncLock.request("clr_lock");
      let set = new collections.Set<ArkTSUtils.locks.AsyncLock>([lock]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_2100
     * @tc.name   testSetClear0021
     * @tc.desc   Verify clear empties Set with ConditionVariable
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetClear0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetClear0021';
      console.info(`[${caseName}] start`);
      let cv = ArkTSUtils.locks.ConditionVariable.request("clr_cv");
      let set = new collections.Set<ArkTSUtils.locks.ConditionVariable>([cv]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_2200
     * @tc.name   testSetClear0022
     * @tc.desc   Verify clear empties Set with SendableLruCache
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetClear0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetClear0022';
      console.info(`[${caseName}] start`);
      let cache = new ArkTSUtils.SendableLruCache<number, string>(10);
      cache.put(1, "one");
      let set = new collections.Set<ArkTSUtils.SendableLruCache<number, string>>([cache]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_2300
     * @tc.name   testSetClear0023
     * @tc.desc   Verify Set is reusable after clear with add and has
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetClear0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetClear0023';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2]);
      set.clear();
      set.add(3);
      set.add(4);
      expect(set.size).assertEqual(2);
      expect(set.has(3)).assertTrue();
      expect(set.has(1)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CLEAR_2400
     * @tc.name   testSetClear0024
     * @tc.desc   Verify clear empties Set correctly
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetClear0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetClear0024';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });

    // Size
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_0100
     * @tc.name   testSetSize0001
     * @tc.desc   Verify size is 0 for new empty Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSize0001';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_0200
     * @tc.name   testSetSize0002
     * @tc.desc   Verify size increases after add
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSize0002';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      set.add(100);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_0300
     * @tc.name   testSetSize0003
     * @tc.desc   Verify size decreases after delete
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSize0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSize0003';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2, 3]);
      set.delete(2);
      expect(set.size).assertEqual(2);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_0400
     * @tc.name   testSetSize0004
     * @tc.desc   Verify size is 0 after clear
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSize0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSize0004';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2, 3]);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_0500
     * @tc.name   testSetSize0005
     * @tc.desc   Verify size does not change on duplicate add
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSize0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSize0005';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([100]);
      set.add(100);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_0600
     * @tc.name   testSetSize0006
     * @tc.desc   Verify size tracks string elements
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSize0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSize0006';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(["test测试123"]);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_0700
     * @tc.name   testSetSize0007
     * @tc.desc   Verify size tracks special character string
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSize0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSize0007';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>([SPECIAL_STR_WITH_NUL]);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_0800
     * @tc.name   testSetSize0008
     * @tc.desc   Verify size tracks emoji string
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSize0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSize0008';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(["测试😀🎉🔥"]);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_0900
     * @tc.name   testSetSize0009
     * @tc.desc   Verify size tracks empty string
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSize0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSize0009';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>([""]);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_1000
     * @tc.name   testSetSize0010
     * @tc.desc   Verify size tracks boolean true
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSize0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSize0010';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>([true]);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_1100
     * @tc.name   testSetSize0011
     * @tc.desc   Verify size tracks boolean false
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSize0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSize0011';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>([false]);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_1200
     * @tc.name   testSetSize0012
     * @tc.desc   Verify size tracks undefined
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSize0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSize0012';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<undefined>([undefined]);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_1300
     * @tc.name   testSetSize0013
     * @tc.desc   Verify size tracks null
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSize0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSize0013';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<null>([null]);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_1400
     * @tc.name   testSetSize0014
     * @tc.desc   Verify size tracks NaN
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSize0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSize0014';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([NaN]);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_1500
     * @tc.name   testSetSize0015
     * @tc.desc   Verify size tracks MAX_SAFE_INTEGER
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSize0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSize0015';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([Number.MAX_SAFE_INTEGER]);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_1600
     * @tc.name   testSetSize0016
     * @tc.desc   Verify size tracks scientific notation float
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSize0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSize0016';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1.5e-10]);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_1700
     * @tc.name   testSetSize0017
     * @tc.desc   Verify size tracks nested Set through add and delete
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetSize0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetSize0017';
      console.info(`[${caseName}] start`);
      let nested = new collections.Set<number>([1, 2]);
      let set = new collections.Set<collections.Set<number>>([nested]);
      expect(set.size).assertEqual(1);
      set.delete(nested);
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_1800
     * @tc.name   testSetSize0018
     * @tc.desc   Verify size tracks nested Map
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetSize0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetSize0018';
      console.info(`[${caseName}] start`);
      let nested = new collections.Map<number, string>();
      nested.set(1, "one");
      let set = new collections.Set<collections.Map<number, string>>([nested]);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_1900
     * @tc.name   testSetSize0019
     * @tc.desc   Verify size tracks nested Array
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetSize0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetSize0019';
      console.info(`[${caseName}] start`);
      let nested = new collections.Array<number>(1, 2, 3);
      let set = new collections.Set<collections.Array<number>>([nested]);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_2000
     * @tc.name   testSetSize0020
     * @tc.desc   Verify size tracks SendableClassBasic
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetSize0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetSize0020';
      console.info(`[${caseName}] start`);
      let val = new SendableClassBasic(1, "basic");
      let set = new collections.Set<SendableClassBasic>([val]);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_2100
     * @tc.name   testSetSize0021
     * @tc.desc   Verify size tracks SendableClassExtended
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetSize0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetSize0021';
      console.info(`[${caseName}] start`);
      let val = new SendableClassExtended();
      val.name = 'extended_test';
      let set = new collections.Set<SendableClassExtended>([val]);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_2200
     * @tc.name   testSetSize0022
     * @tc.desc   Verify size tracks SendableClassComplex
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetSize0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetSize0022';
      console.info(`[${caseName}] start`);
      let val = new SendableClassComplex();
      let set = new collections.Set<SendableClassComplex>([val]);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_2300
     * @tc.name   testSetSize0023
     * @tc.desc   Verify size tracks SendableEnum
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetSize0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetSize0023';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableEnum>([SendableEnum.Success, SendableEnum.Failed]);
      expect(set.size).assertEqual(2);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_2400
     * @tc.name   testSetSize0024
     * @tc.desc   Verify size tracks AsyncLock
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetSize0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetSize0024';
      console.info(`[${caseName}] start`);
      let lock = ArkTSUtils.locks.AsyncLock.request("size_lock");
      let set = new collections.Set<ArkTSUtils.locks.AsyncLock>([lock]);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_2500
     * @tc.name   testSetSize0025
     * @tc.desc   Verify size tracks ConditionVariable
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetSize0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetSize0025';
      console.info(`[${caseName}] start`);
      let cv = ArkTSUtils.locks.ConditionVariable.request("size_cv");
      let set = new collections.Set<ArkTSUtils.locks.ConditionVariable>([cv]);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_2600
     * @tc.name   testSetSize0026
     * @tc.desc   Verify size tracks SendableLruCache
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetSize0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetSize0026';
      console.info(`[${caseName}] start`);
      let cache = new ArkTSUtils.SendableLruCache<number, string>(10);
      cache.put(1, "one");
      let set = new collections.Set<ArkTSUtils.SendableLruCache<number, string>>([cache]);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_SIZE_2700
     * @tc.name   testSetSize0027
     * @tc.desc   Verify size tracks large number of elements correctly
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetSize0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetSize0027';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      for (let i = 0; i < 1000; i++) { set.add(i); }
      expect(set.size).assertEqual(1000);
      console.info(`[${caseName}] end`);
      done();
    });

  });
}