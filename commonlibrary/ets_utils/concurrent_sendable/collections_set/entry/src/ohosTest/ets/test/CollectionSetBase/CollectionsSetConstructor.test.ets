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

export default function collectionsSetConstructorTest() {
  describe('collectionsSetConstructorTest', (): void => {

    beforeEach(async () => {
      await Utils.sleep(50);
    });

    // ========================================================================
    // 构造方法组
    // ========================================================================


    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_0100
     * @tc.name   testSetConstructor0001
     * @tc.desc   Verify constructor creates an empty Set without arguments
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetConstructor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConstructor0001';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_0200
     * @tc.name   testSetConstructor0002
     * @tc.desc   Verify constructor creates Set from array with single number element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetConstructor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConstructor0002';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([100]);
      expect(set.size).assertEqual(1);
      expect(set.has(100)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_0300
     * @tc.name   testSetConstructor0003
     * @tc.desc   Verify constructor creates Set from array with three elements — size and element existence
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetConstructor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConstructor0003';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2, 3]);
      expect(set.size).assertEqual(3);
      expect(set.has(1)).assertTrue();
      expect(set.has(2)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_0400
     * @tc.name   testSetConstructor0004
     * @tc.desc   Verify constructor creates Set from array with three elements — remaining element existence
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetConstructor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConstructor0004';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 2, 3]);
      expect(set.has(3)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_0500
     * @tc.name   testSetConstructor0005
     * @tc.desc   Verify constructor deduplicates repeated elements
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetConstructor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConstructor0005';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1, 1, 2, 2, 3]);
      expect(set.size).assertEqual(3);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_0600
     * @tc.name   testSetConstructor0006
     * @tc.desc   Verify constructor creates empty Set from empty array
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetConstructor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConstructor0006';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([]);
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_0700
     * @tc.name   testSetConstructor0007
     * @tc.desc   Verify constructor creates empty Set from null argument
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetConstructor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConstructor0007';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>(null);
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_0800
     * @tc.name   testSetConstructor0008
     * @tc.desc   Verify constructor creates Set with string element
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetConstructor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConstructor0008';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(["test测试123"]);
      expect(set.size).assertEqual(1);
      expect(set.has("test测试123")).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_0900
     * @tc.name   testSetConstructor0009
     * @tc.desc   Verify constructor creates Set with special character string
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetConstructor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConstructor0009';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>([SPECIAL_STR_WITH_NUL]);
      expect(set.size).assertEqual(1);
      expect(set.has(SPECIAL_STR_WITH_NUL)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_1000
     * @tc.name   testSetConstructor0010
     * @tc.desc   Verify constructor creates Set with emoji string
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetConstructor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConstructor0010';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>(["测试😀🎉🔥"]);
      expect(set.size).assertEqual(1);
      expect(set.has("测试😀🎉🔥")).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_1100
     * @tc.name   testSetConstructor0011
     * @tc.desc   Verify constructor creates Set with empty string
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetConstructor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConstructor0011';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<string>([""]);
      expect(set.size).assertEqual(1);
      expect(set.has("")).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_1200
     * @tc.name   testSetConstructor0012
     * @tc.desc   Verify constructor creates Set with boolean true
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetConstructor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConstructor0012';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>([true]);
      expect(set.size).assertEqual(1);
      expect(set.has(true)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_1300
     * @tc.name   testSetConstructor0013
     * @tc.desc   Verify constructor creates Set with boolean false
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetConstructor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConstructor0013';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<boolean>([false]);
      expect(set.size).assertEqual(1);
      expect(set.has(false)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_1400
     * @tc.name   testSetConstructor0014
     * @tc.desc   Verify constructor creates Set with NaN value
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetConstructor0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConstructor0014';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([NaN]);
      expect(set.size).assertEqual(1);
      expect(set.has(NaN)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_1500
     * @tc.name   testSetConstructor0015
     * @tc.desc   Verify constructor creates Set with undefined value
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetConstructor0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConstructor0015';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<undefined>([undefined]);
      expect(set.size).assertEqual(1);
      expect(set.has(undefined)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_1600
     * @tc.name   testSetConstructor0016
     * @tc.desc   Verify constructor creates Set with null value
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetConstructor0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConstructor0016';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<null>([null]);
      expect(set.size).assertEqual(1);
      expect(set.has(null)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_1700
     * @tc.name   testSetConstructor0017
     * @tc.desc   Verify constructor creates Set with MAX_SAFE_INTEGER boundary value
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetConstructor0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConstructor0017';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([Number.MAX_SAFE_INTEGER]);
      expect(set.size).assertEqual(1);
      expect(set.has(Number.MAX_SAFE_INTEGER)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_1800
     * @tc.name   testSetConstructor0018
     * @tc.desc   Verify constructor creates Set with scientific notation float
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetConstructor0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConstructor0018';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<number>([1.5e-10]);
      expect(set.size).assertEqual(1);
      expect(set.has(1.5e-10)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_1900
     * @tc.name   testSetConstructor0019
     * @tc.desc   Verify constructor creates Set with nested collections.Set instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetConstructor0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetConstructor0019';
      console.info(`[${caseName}] start`);
      let nested = new collections.Set<number>([1, 2, 3]);
      let set = new collections.Set<collections.Set<number>>([nested]);
      expect(set.size).assertEqual(1);
      expect(set.has(nested)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_2000
     * @tc.name   testSetConstructor0020
     * @tc.desc   Verify constructor creates Set with nested collections.Map instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetConstructor0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetConstructor0020';
      console.info(`[${caseName}] start`);
      let nested = new collections.Map<number, string>();
      nested.set(1, "one");
      let set = new collections.Set<collections.Map<number, string>>([nested]);
      expect(set.size).assertEqual(1);
      expect(set.has(nested)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_2100
     * @tc.name   testSetConstructor0021
     * @tc.desc   Verify constructor creates Set with nested collections.Array instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetConstructor0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetConstructor0021';
      console.info(`[${caseName}] start`);
      let nested = new collections.Array<number>(1, 2, 3);
      let set = new collections.Set<collections.Array<number>>([nested]);
      expect(set.size).assertEqual(1);
      expect(set.has(nested)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_2200
     * @tc.name   testSetConstructor0022
     * @tc.desc   Verify constructor creates Set from iterator — size and element existence
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetConstructor0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetConstructor0022';
      console.info(`[${caseName}] start`);
      let source = new collections.Set<number>([1, 2, 3]);
      let target = new collections.Set<number>(source.values());
      expect(target.size).assertEqual(3);
      expect(target.has(1)).assertTrue();
      expect(target.has(2)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_2300
     * @tc.name   testSetConstructor0023
     * @tc.desc   Verify constructor creates Set from iterator — remaining element existence
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetConstructor0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetConstructor0023';
      console.info(`[${caseName}] start`);
      let source = new collections.Set<number>([1, 2, 3]);
      let target = new collections.Set<number>(source.values());
      expect(target.has(3)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_2400
     * @tc.name   testSetConstructor0024
     * @tc.desc   Verify constructor creates empty Set from empty iterator
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetConstructor0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetConstructor0024';
      console.info(`[${caseName}] start`);
      let emptySource = new collections.Set<number>();
      let target = new collections.Set<number>(emptySource.values());
      expect(target.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_2500
     * @tc.name   testSetConstructor0025
     * @tc.desc   Verify constructor creates Set from another Set keys iterator
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetConstructor0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetConstructor0025';
      console.info(`[${caseName}] start`);
      let src = new collections.Set<number>();
      src.add(1);
      src.add(2);
      src.add(3);
      let set = new collections.Set<number>(src);
      expect(set.size).assertEqual(3);
      console.info(`[${caseName}] end`);
      done();
    });
    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_2600
     * @tc.name   testSetConstructor0026
     * @tc.desc   Verify constructor creates Set with SendableClassBasic instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetConstructor0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetConstructor0026';
      console.info(`[${caseName}] start`);
      let val = new SendableClassBasic(1, "basic");
      let set = new collections.Set<SendableClassBasic>([val]);
      expect(set.size).assertEqual(1);
      expect(set.has(val)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_2700
     * @tc.name   testSetConstructor0027
     * @tc.desc   Verify constructor creates Set with SendableClassExtended instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetConstructor0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetConstructor0027';
      console.info(`[${caseName}] start`);
      let val = new SendableClassExtended();
      val.name = 'extended_test';
      let set = new collections.Set<SendableClassExtended>([val]);
      expect(set.size).assertEqual(1);
      expect(set.has(val)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_2800
     * @tc.name   testSetConstructor0028
     * @tc.desc   Verify constructor creates Set with SendableClassComplex instance — size and has
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetConstructor0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetConstructor0028';
      console.info(`[${caseName}] start`);
      let val = new SendableClassComplex();
      let set = new collections.Set<SendableClassComplex>([val]);
      expect(set.size).assertEqual(1);
      expect(set.has(val)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_2900
     * @tc.name   testSetConstructor0029
     * @tc.desc   Verify constructor creates Set with SendableClassComplex instance — field values
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetConstructor0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetConstructor0029';
      console.info(`[${caseName}] start`);
      let val = new SendableClassComplex();
      expect(val.basic.id).assertEqual(1);
      expect(val.nestedId).assertEqual(42);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_3000
     * @tc.name   testSetConstructor0030
     * @tc.desc   Verify constructor creates Set with SendableEnum values — positive verification
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetConstructor0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetConstructor0030';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableEnum>([SendableEnum.Success, SendableEnum.Failed]);
      expect(set.size).assertEqual(2);
      expect(set.has(SendableEnum.Success)).assertTrue();
      expect(set.has(SendableEnum.Failed)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_3100
     * @tc.name   testSetConstructor0031
     * @tc.desc   Verify constructor creates Set with SendableEnum values — negative verification
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetConstructor0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetConstructor0031';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableEnum>([SendableEnum.Success, SendableEnum.Failed]);
      expect(set.has(SendableEnum.Pending)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_3200
     * @tc.name   testSetConstructor0032
     * @tc.desc   Verify constructor creates Set with AsyncLock instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetConstructor0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetConstructor0032';
      console.info(`[${caseName}] start`);
      let lock = ArkTSUtils.locks.AsyncLock.request("set_test_lock");
      let set = new collections.Set<ArkTSUtils.locks.AsyncLock>([lock]);
      expect(set.size).assertEqual(1);
      expect(set.has(lock)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_3300
     * @tc.name   testSetConstructor0033
     * @tc.desc   Verify constructor creates Set with ConditionVariable instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetConstructor0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetConstructor0033';
      console.info(`[${caseName}] start`);
      let cv = ArkTSUtils.locks.ConditionVariable.request("set_test_cv");
      let set = new collections.Set<ArkTSUtils.locks.ConditionVariable>([cv]);
      expect(set.size).assertEqual(1);
      expect(set.has(cv)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_CONSTRUCTOR_3400
     * @tc.name   testSetConstructor0034
     * @tc.desc   Verify constructor creates Set with SendableLruCache instance
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level1
     */
    it('testSetConstructor0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testSetConstructor0034';
      console.info(`[${caseName}] start`);
      let cache = new ArkTSUtils.SendableLruCache<number, string>(10);
      cache.put(1, "one");
      let set = new collections.Set<ArkTSUtils.SendableLruCache<number, string>>([cache]);
      expect(set.size).assertEqual(1);
      expect(set.has(cache)).assertTrue();
      expect(cache.get(1)).assertEqual("one");
      console.info(`[${caseName}] end`);
      done();
    });

  });
}