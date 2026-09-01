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
import { collections } from '@kit.ArkTS';
import * as Utils from '../utils/TestUtils';
// ============================================================================
// Sendable 函数类型定义
// ============================================================================

/** 替代 function_normal: function fn(a,b) { return a + b } */
@Sendable
function sendableAdd(a: number, b: number): number {
  return a + b;
}

@Sendable
function sendableMultiply(a: number, b: number): number {
  return a * b;
}

/** 替代 function_arrow: () => {} — 箭头函数不可 @Sendable，用 @Sendable function 等价替代 */
@Sendable
function sendableArrowSim(a: number, b: number): number {
  return a - b;
}

/** 替代 function_async: async function asyncFn() {} */
@Sendable
async function sendableAsyncFn(): Promise<string> {
  return "async_result";
}

@Sendable
type SendableFuncType = (a: number, b: number) => number;

@Sendable
type SendableAsyncFnType = () => Promise<string>;

// ============================================================================

export default function collectionsSetSendableFunctionTest() {
  describe('collectionsSetSendableFunctionTest', (): void => {

    beforeEach(async () => {
      await Utils.sleep(50);
    });

    // ========================================================================
    // 一、constructor(iterable)
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_0100
     * @tc.name   testSetSendableFunction0001
     * @tc.desc   Verify constructor(iterable) with SendableFuncType — creates Set from array of function references
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0001';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableFuncType>([sendableAdd, sendableMultiply]);
      expect(set.size).assertEqual(2);
      expect(set.has(sendableAdd)).assertTrue();
      expect(set.has(sendableMultiply)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_0200
     * @tc.name   testSetSendableFunction0002
     * @tc.desc   Verify constructor(iterable) with SendableFuncType — arrow function equivalent via @Sendable function
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0002';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableFuncType>([sendableArrowSim]);
      expect(set.size).assertEqual(1);
      expect(set.has(sendableArrowSim)).assertTrue();
      expect(sendableArrowSim(10, 3)).assertEqual(7);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_0300
     * @tc.name   testSetSendableFunction0003
     * @tc.desc   Verify constructor(iterable) with SendableAsyncFnType — creates Set from array of async function references
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0003';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableAsyncFnType>([sendableAsyncFn]);
      expect(set.size).assertEqual(1);
      expect(set.has(sendableAsyncFn)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    // ========================================================================
    // 二、constructor(values)
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_0400
     * @tc.name   testSetSendableFunction0004
     * @tc.desc   Verify constructor(values) with SendableFuncType — creates Set from another Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0004';
      console.info(`[${caseName}] start`);
      let src = new collections.Set<SendableFuncType>();
      src.add(sendableAdd);
      let set = new collections.Set<SendableFuncType>(src);
      expect(set.size).assertEqual(1);
      expect(set.has(sendableAdd)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_0500
     * @tc.name   testSetSendableFunction0005
     * @tc.desc   Verify constructor(values) with SendableFuncType — arrow equivalent, creates Set from another Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0005';
      console.info(`[${caseName}] start`);
      let src = new collections.Set<SendableFuncType>();
      src.add(sendableArrowSim);
      let set = new collections.Set<SendableFuncType>(src);
      expect(set.size).assertEqual(1);
      expect(set.has(sendableArrowSim)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_0600
     * @tc.name   testSetSendableFunction0006
     * @tc.desc   Verify constructor(values) with SendableAsyncFnType — creates Set from another Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0006';
      console.info(`[${caseName}] start`);
      let src = new collections.Set<SendableAsyncFnType>();
      src.add(sendableAsyncFn);
      let set = new collections.Set<SendableAsyncFnType>(src);
      expect(set.size).assertEqual(1);
      expect(set.has(sendableAsyncFn)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    // ========================================================================
    // 三、forEach
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_0700
     * @tc.name   testSetSendableFunction0007
     * @tc.desc   Verify forEach with SendableFuncType — traverses function references, key equals value
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0007';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableFuncType>();
      set.add(sendableAdd);
      let count: number = 0;
      set.forEach((value: SendableFuncType, key: SendableFuncType): void => {
        expect(key).assertEqual(value);
        expect(value(2, 3)).assertEqual(5);
        count++;
      });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_0800
     * @tc.name   testSetSendableFunction0008
     * @tc.desc   Verify forEach with SendableFuncType — arrow equivalent, traverses function references
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0008';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableFuncType>();
      set.add(sendableArrowSim);
      let count: number = 0;
      set.forEach((value: SendableFuncType, key: SendableFuncType): void => {
        expect(key).assertEqual(value);
        expect(value(5, 2)).assertEqual(3);
        count++;
      });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_0900
     * @tc.name   testSetSendableFunction0009
     * @tc.desc   Verify forEach with SendableAsyncFnType — traverses async function references
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0009';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableAsyncFnType>();
      set.add(sendableAsyncFn);
      let count: number = 0;
      set.forEach((value: SendableAsyncFnType, key: SendableAsyncFnType): void => {
        expect(key).assertEqual(value);
        count++;
      });
      expect(count).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

    // ========================================================================
    // 四、entries
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_1000
     * @tc.name   testSetSendableFunction0010
     * @tc.desc   Verify entries with SendableFuncType — returns [value, value] pairs for function references
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0010';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableFuncType>();
      set.add(sendableAdd);
      let iter: IterableIterator<[SendableFuncType, SendableFuncType]> = set.entries();
      let entry: IteratorResult<[SendableFuncType, SendableFuncType]> = iter.next();
      expect(entry.value[0]).assertEqual(sendableAdd);
      expect(entry.value[1]).assertEqual(sendableAdd);
      expect(entry.value[0](2, 3)).assertEqual(5);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_1100
     * @tc.name   testSetSendableFunction0011
     * @tc.desc   Verify entries with SendableFuncType — arrow equivalent, returns [value, value] pairs
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0011';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableFuncType>();
      set.add(sendableArrowSim);
      let iter: IterableIterator<[SendableFuncType, SendableFuncType]> = set.entries();
      let entry: IteratorResult<[SendableFuncType, SendableFuncType]> = iter.next();
      expect(entry.value[0]).assertEqual(sendableArrowSim);
      expect(entry.value[1]).assertEqual(sendableArrowSim);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_1200
     * @tc.name   testSetSendableFunction0012
     * @tc.desc   Verify entries with SendableAsyncFnType — returns [value, value] pairs
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0012';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableAsyncFnType>();
      set.add(sendableAsyncFn);
      let iter: IterableIterator<[SendableAsyncFnType, SendableAsyncFnType]> = set.entries();
      let entry: IteratorResult<[SendableAsyncFnType, SendableAsyncFnType]> = iter.next();
      expect(entry.value[0]).assertEqual(sendableAsyncFn);
      expect(entry.value[1]).assertEqual(sendableAsyncFn);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    // ========================================================================
    // 五、keys
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_1300
     * @tc.name   testSetSendableFunction0013
     * @tc.desc   Verify keys with SendableFuncType — returns function references
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0013';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableFuncType>();
      set.add(sendableMultiply);
      let iter: IterableIterator<SendableFuncType> = set.keys();
      let k: IteratorResult<SendableFuncType> = iter.next();
      expect(k.value).assertEqual(sendableMultiply);
      expect(k.value(3, 3)).assertEqual(9);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_1400
     * @tc.name   testSetSendableFunction0014
     * @tc.desc   Verify keys with SendableFuncType — arrow equivalent
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0014';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableFuncType>();
      set.add(sendableArrowSim);
      let iter: IterableIterator<SendableFuncType> = set.keys();
      let k: IteratorResult<SendableFuncType> = iter.next();
      expect(k.value).assertEqual(sendableArrowSim);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_1500
     * @tc.name   testSetSendableFunction0015
     * @tc.desc   Verify keys with SendableAsyncFnType — returns async function references
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0015';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableAsyncFnType>();
      set.add(sendableAsyncFn);
      let iter: IterableIterator<SendableAsyncFnType> = set.keys();
      let k: IteratorResult<SendableAsyncFnType> = iter.next();
      expect(k.value).assertEqual(sendableAsyncFn);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    // ========================================================================
    // 六、values
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_1600
     * @tc.name   testSetSendableFunction0016
     * @tc.desc   Verify values with SendableFuncType — returns function references
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0016';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableFuncType>();
      set.add(sendableAdd);
      let iter: IterableIterator<SendableFuncType> = set.values();
      let v: IteratorResult<SendableFuncType> = iter.next();
      expect(v.value).assertEqual(sendableAdd);
      expect(v.value(1, 2)).assertEqual(3);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_1700
     * @tc.name   testSetSendableFunction0017
     * @tc.desc   Verify values with SendableFuncType — arrow equivalent
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0017';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableFuncType>();
      set.add(sendableArrowSim);
      let iter: IterableIterator<SendableFuncType> = set.values();
      let v: IteratorResult<SendableFuncType> = iter.next();
      expect(v.value).assertEqual(sendableArrowSim);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_1800
     * @tc.name   testSetSendableFunction0018
     * @tc.desc   Verify values with SendableAsyncFnType — returns async function references
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0018';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableAsyncFnType>();
      set.add(sendableAsyncFn);
      let iter: IterableIterator<SendableAsyncFnType> = set.values();
      let v: IteratorResult<SendableAsyncFnType> = iter.next();
      expect(v.value).assertEqual(sendableAsyncFn);
      expect(iter.next().done).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    // ========================================================================
    // 七、add
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_1900
     * @tc.name   testSetSendableFunction0019
     * @tc.desc   Verify add with SendableFuncType — reference semantics, same function added once
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0019';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableFuncType>();
      set.add(sendableAdd);
      set.add(sendableAdd);
      expect(set.size).assertEqual(1);
      set.add(sendableMultiply);
      expect(set.size).assertEqual(2);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_2000
     * @tc.name   testSetSendableFunction0020
     * @tc.desc   Verify add with SendableFuncType — arrow equivalent, reference semantics
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0020';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableFuncType>();
      set.add(sendableArrowSim);
      set.add(sendableArrowSim);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_2100
     * @tc.name   testSetSendableFunction0021
     * @tc.desc   Verify add with SendableAsyncFnType — reference semantics
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0021';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableAsyncFnType>();
      set.add(sendableAsyncFn);
      set.add(sendableAsyncFn);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

    // ========================================================================
    // 八、has
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_2200
     * @tc.name   testSetSendableFunction0022
     * @tc.desc   Verify has with SendableFuncType — returns true for exact reference, false for absent
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0022';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableFuncType>();
      set.add(sendableAdd);
      expect(set.has(sendableAdd)).assertTrue();
      expect(set.has(sendableMultiply)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_2300
     * @tc.name   testSetSendableFunction0023
     * @tc.desc   Verify has with SendableFuncType — arrow equivalent
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0023';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableFuncType>();
      set.add(sendableArrowSim);
      expect(set.has(sendableArrowSim)).assertTrue();
      expect(set.has(sendableAdd)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_2400
     * @tc.name   testSetSendableFunction0024
     * @tc.desc   Verify has with SendableAsyncFnType — returns true for exact reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0024';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableAsyncFnType>();
      set.add(sendableAsyncFn);
      expect(set.has(sendableAsyncFn)).assertTrue();
      console.info(`[${caseName}] end`);
      done();
    });

    // ========================================================================
    // 九、delete
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_2500
     * @tc.name   testSetSendableFunction0025
     * @tc.desc   Verify delete with SendableFuncType — removes by exact reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0025';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableFuncType>();
      set.add(sendableAdd);
      expect(set.delete(sendableAdd)).assertTrue();
      expect(set.size).assertEqual(0);
      expect(set.delete(sendableAdd)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_2600
     * @tc.name   testSetSendableFunction0026
     * @tc.desc   Verify delete with SendableFuncType — arrow equivalent, removes by exact reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0026';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableFuncType>();
      set.add(sendableArrowSim);
      expect(set.delete(sendableArrowSim)).assertTrue();
      expect(set.has(sendableArrowSim)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_2700
     * @tc.name   testSetSendableFunction0027
     * @tc.desc   Verify delete with SendableAsyncFnType — removes by exact reference
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0027';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableAsyncFnType>();
      set.add(sendableAsyncFn);
      expect(set.delete(sendableAsyncFn)).assertTrue();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });

    // ========================================================================
    // 十、clear
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_2800
     * @tc.name   testSetSendableFunction0028
     * @tc.desc   Verify clear with SendableFuncType — empties Set containing function references
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0028';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableFuncType>();
      set.add(sendableAdd);
      set.add(sendableMultiply);
      set.clear();
      expect(set.size).assertEqual(0);
      expect(set.has(sendableAdd)).assertFalse();
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_2900
     * @tc.name   testSetSendableFunction0029
     * @tc.desc   Verify clear with SendableFuncType — arrow equivalent, empties Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0029';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableFuncType>();
      set.add(sendableArrowSim);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_3000
     * @tc.name   testSetSendableFunction0030
     * @tc.desc   Verify clear with SendableAsyncFnType — empties Set
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0030';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableAsyncFnType>();
      set.add(sendableAsyncFn);
      set.clear();
      expect(set.size).assertEqual(0);
      console.info(`[${caseName}] end`);
      done();
    });

    // ========================================================================
    // 十一、size
    // ========================================================================

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_3100
     * @tc.name   testSetSendableFunction0031
     * @tc.desc   Verify size with SendableFuncType — reflects element count correctly
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0031';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableFuncType>();
      expect(set.size).assertEqual(0);
      set.add(sendableAdd);
      expect(set.size).assertEqual(1);
      set.add(sendableMultiply);
      expect(set.size).assertEqual(2);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_3200
     * @tc.name   testSetSendableFunction0032
     * @tc.desc   Verify size with SendableFuncType — arrow equivalent
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0032';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableFuncType>();
      expect(set.size).assertEqual(0);
      set.add(sendableArrowSim);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

    /**
     * @tc.number SUB_COLLECTIONS_SET_FUNCTION_3300
     * @tc.name   testSetSendableFunction0033
     * @tc.desc   Verify size with SendableAsyncFnType — reflects element count
     * @tc.type   Function
     * @tc.size   MediumTest
     * @tc.level  Level0
     */
    it('testSetSendableFunction0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName = 'testSetSendableFunction0033';
      console.info(`[${caseName}] start`);
      let set = new collections.Set<SendableAsyncFnType>();
      expect(set.size).assertEqual(0);
      set.add(sendableAsyncFn);
      expect(set.size).assertEqual(1);
      console.info(`[${caseName}] end`);
      done();
    });

  });
}
