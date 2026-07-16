'use static';
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';
import { ReadonlyIntArray040, IntStringTuple041, Person042 } from '../Util.test';

export default function BoxGenericGetSetTest4(): void {
  describe('BoxGenericGetSetTest4', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_0100
     * @tc.name testBoxGenericGetSetD001
     * @tc.desc Verify Box<readonly int[]> set/get with different readonly int array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ReadonlyIntArray040 = [1, 2, 3];
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>(arr);
      let newArr: ReadonlyIntArray040 = [4, 5, 6];
      box.set(newArr);
      let result: ReadonlyIntArray040 = box.get();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(5);
      expect(result[2]).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_0200
     * @tc.name testBoxGenericGetSetD002
     * @tc.desc Verify Box<[int, string]> set/get with different tuple value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tuple: IntStringTuple041 = [42, "hello"];
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>(tuple);
      let newTuple: IntStringTuple041 = [99, "world"];
      box.set(newTuple);
      let result: IntStringTuple041 = box.get();
      expect(result[0]).assertEqual(99);
      expect(result[1]).assertEqual("world");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_0300
     * @tc.name testBoxGenericGetSetD003
     * @tc.desc Verify Box<Partial<Person042>> set/get with different partial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let partial: Partial<Person042> = { name: "Alice" };
      let box: Box<Partial<Person042>> = new Box<Partial<Person042>>(partial);
      let newPartial: Partial<Person042> = { age: 30 };
      box.set(newPartial);
      let result: Partial<Person042> = box.get();
      expect(result.age).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_0400
     * @tc.name testBoxGenericGetSetD004
     * @tc.desc Verify Box<Required<Person042>> set/get with different required value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let required: Required<Person042> = { name: "Bob", age: 25 };
      let box: Box<Required<Person042>> = new Box<Required<Person042>>(required);
      let newRequired: Required<Person042> = { name: "Charlie", age: 35 };
      box.set(newRequired);
      let result: Required<Person042> = box.get();
      expect(result.name).assertEqual("Charlie");
      expect(result.age).assertEqual(35);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_0500
     * @tc.name testBoxGenericGetSetD005
     * @tc.desc Verify Box<NonNullable<string | null>> set/get with different non-nullable value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nonNull: NonNullable<string | null> = "text";
      let box: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>(nonNull);
      let newNonNull: NonNullable<string | null> = "updated";
      box.set(newNonNull);
      let result: NonNullable<string | null> = box.get();
      expect(result).assertEqual("updated");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_0600
     * @tc.name testBoxGenericGetSetD006
     * @tc.desc Verify Box<keyof Person042> set/get with different key value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: keyof Person042 = "name";
      let box: Box<keyof Person042> = new Box<keyof Person042>(key);
      let newKey: keyof Person042 = "age";
      box.set(newKey);
      let result: keyof Person042 = box.get();
      expect(result).assertEqual("age");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_0700
     * @tc.name testBoxGenericGetSetD007
     * @tc.desc Verify Box<FixedArray<int>> set/get with different fixed array value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fixed: FixedArray<int> = new FixedArray<int>(3);
      fixed[0] = 10;
      fixed[1] = 20;
      fixed[2] = 30;
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(fixed);
      let newFixed: FixedArray<int> = new FixedArray<int>(3);
      newFixed[0] = 40;
      newFixed[1] = 50;
      newFixed[2] = 60;
      box.set(newFixed);
      let result: FixedArray<int> = box.get();
      expect(result[0]).assertEqual(40);
      expect(result[1]).assertEqual(50);
      expect(result[2]).assertEqual(60);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_0800
     * @tc.name testBoxGenericGetSetD008
     * @tc.desc Verify Box<readonly int[]> set new value and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>([0]);
      box.set([10, 20]);
      expect(box.get().length).assertEqual(2);
      expect(box.get()[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_0900
     * @tc.name testBoxGenericGetSetD009
     * @tc.desc Verify Box<readonly int[]> set different array and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>([1]);
      box.set([100, 200, 300]);
      expect(box.get()[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_1000
     * @tc.name testBoxGenericGetSetD010
     * @tc.desc Verify Box<readonly int[]> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>([0]);
      let boxB: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>([0]);
      boxA.set([5, 6]);
      boxB.set([7, 8]);
      expect(boxA.get()[0]).assertEqual(5);
      expect(boxB.get()[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_1100
     * @tc.name testBoxGenericGetSetD011
     * @tc.desc Verify Box<readonly int[]> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>([0]);
      let arr: ReadonlyIntArray040 = [9, 8, 7];
      let ret: ReadonlyIntArray040 = box.set(arr);
      expect(ret === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_1200
     * @tc.name testBoxGenericGetSetD012
     * @tc.desc Verify Box<readonly int[]> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>([0]);
      box.set([1]);
      box.set([2]);
      box.set([3]);
      expect(box.get()[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_1300
     * @tc.name testBoxGenericGetSetD013
     * @tc.desc Verify Box<readonly int[]> set empty array edge case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>([1, 2]);
      let emptyArr: ReadonlyIntArray040 = [];
      box.set(emptyArr);
      expect(box.get().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_1400
     * @tc.name testBoxGenericGetSetD014
     * @tc.desc Verify Box<readonly int[]> set then get nested index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>([0]);
      box.set([111, 222, 333]);
      let result: ReadonlyIntArray040 = box.get();
      expect(result[1]).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_1500
     * @tc.name testBoxGenericGetSetD015
     * @tc.desc Verify Box<readonly int[]> set larger array and verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>([0]);
      box.set([1, 2, 3, 4, 5]);
      expect(box.get().length).assertEqual(5);
      expect(box.get()[4]).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_1600
     * @tc.name testBoxGenericGetSetD016
     * @tc.desc Verify Box<[int,string]> set new tuple and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>([0, ""]);
      box.set([55, "fiftyfive"]);
      expect(box.get()[0]).assertEqual(55);
      expect(box.get()[1]).assertEqual("fiftyfive");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_1700
     * @tc.name testBoxGenericGetSetD017
     * @tc.desc Verify Box<[int,string]> set different tuple and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>([1, "one"]);
      box.set([2, "two"]);
      expect(box.get()[1]).assertEqual("two");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_1800
     * @tc.name testBoxGenericGetSetD018
     * @tc.desc Verify Box<[int,string]> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<IntStringTuple041> = new Box<IntStringTuple041>([0, "a"]);
      let boxB: Box<IntStringTuple041> = new Box<IntStringTuple041>([0, "b"]);
      boxA.set([10, "ten"]);
      boxB.set([20, "twenty"]);
      expect(boxA.get()[0]).assertEqual(10);
      expect(boxB.get()[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_1900
     * @tc.name testBoxGenericGetSetD019
     * @tc.desc Verify Box<[int,string]> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>([0, ""]);
      let t: IntStringTuple041 = [77, "seven"];
      let ret: IntStringTuple041 = box.set(t);
      expect(ret[0]).assertEqual(77);
      expect(ret[1]).assertEqual("seven");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_2000
     * @tc.name testBoxGenericGetSetD020
     * @tc.desc Verify Box<[int,string]> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>([0, "start"]);
      box.set([1, "a"]);
      box.set([2, "b"]);
      box.set([3, "c"]);
      expect(box.get()[0]).assertEqual(3);
      expect(box.get()[1]).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_2100
     * @tc.name testBoxGenericGetSetD021
     * @tc.desc Verify Box<[int,string]> set negative int and empty string edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>([0, "x"]);
      box.set([-1, ""]);
      expect(box.get()[0]).assertEqual(-1);
      expect(box.get()[1]).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_2200
     * @tc.name testBoxGenericGetSetD022
     * @tc.desc Verify Box<[int,string]> set large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>([0, ""]);
      box.set([999999, "large"]);
      expect(box.get()[0]).assertEqual(999999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_2300
     * @tc.name testBoxGenericGetSetD023
     * @tc.desc Verify Box<[int,string]> set zero edge case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>([100, "hundred"]);
      box.set([0, "zero"]);
      expect(box.get()[0]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_2400
     * @tc.name testBoxGenericGetSetD024
     * @tc.desc Verify Box<Partial<Person042>> set new partial and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Partial<Person042>> = new Box<Partial<Person042>>({});
      box.set({ name: "Dave" });
      expect(box.get().name).assertEqual("Dave");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_2500
     * @tc.name testBoxGenericGetSetD025
     * @tc.desc Verify Box<Partial<Person042>> set different partial and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Partial<Person042>> = new Box<Partial<Person042>>({ name: "old" });
      box.set({ age: 50 });
      expect(box.get().age).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_2600
     * @tc.name testBoxGenericGetSetD026
     * @tc.desc Verify Box<Partial<Person042>> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<Partial<Person042>> = new Box<Partial<Person042>>({});
      let boxB: Box<Partial<Person042>> = new Box<Partial<Person042>>({});
      boxA.set({ name: "Alice" });
      boxB.set({ name: "Bob" });
      expect(boxA.get().name).assertEqual("Alice");
      expect(boxB.get().name).assertEqual("Bob");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_2700
     * @tc.name testBoxGenericGetSetD027
     * @tc.desc Verify Box<Partial<Person042>> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Partial<Person042>> = new Box<Partial<Person042>>({});
      let p: Partial<Person042> = { name: "Return", age: 42 };
      let ret: Partial<Person042> = box.set(p);
      expect(ret.name).assertEqual("Return");
      expect(ret === p).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_2800
     * @tc.name testBoxGenericGetSetD028
     * @tc.desc Verify Box<Partial<Person042>> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Partial<Person042>> = new Box<Partial<Person042>>({});
      box.set({ name: "a" });
      box.set({ name: "b" });
      box.set({ name: "c" });
      expect(box.get().name).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_2900
     * @tc.name testBoxGenericGetSetD029
     * @tc.desc Verify Box<Partial<Person042>> set empty and verify fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Partial<Person042>> = new Box<Partial<Person042>>({ name: "temp" });
      box.set({});
      expect(box.get().name === undefined).assertTrue();
      expect(box.get().age === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_3000
     * @tc.name testBoxGenericGetSetD030
     * @tc.desc Verify Box<Partial<Person042>> set both fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Partial<Person042>> = new Box<Partial<Person042>>({});
      box.set({ name: "Full", age: 99 });
      expect(box.get().name).assertEqual("Full");
      expect(box.get().age).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_3100
     * @tc.name testBoxGenericGetSetD031
     * @tc.desc Verify Box<Required<Person042>> set new required and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Required<Person042>> = new Box<Required<Person042>>({ name: "x", age: 0 });
      box.set({ name: "Diana", age: 40 });
      expect(box.get().name).assertEqual("Diana");
      expect(box.get().age).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_3200
     * @tc.name testBoxGenericGetSetD032
     * @tc.desc Verify Box<Required<Person042>> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<Required<Person042>> = new Box<Required<Person042>>({ name: "a", age: 1 });
      let boxB: Box<Required<Person042>> = new Box<Required<Person042>>({ name: "b", age: 2 });
      boxA.set({ name: "Alice", age: 30 });
      boxB.set({ name: "Bob", age: 25 });
      expect(boxA.get().name).assertEqual("Alice");
      expect(boxB.get().name).assertEqual("Bob");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_3300
     * @tc.name testBoxGenericGetSetD033
     * @tc.desc Verify Box<Required<Person042>> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Required<Person042>> = new Box<Required<Person042>>({ name: "init", age: 0 });
      let r: Required<Person042> = { name: "Eve", age: 28 };
      let ret: Required<Person042> = box.set(r);
      expect(ret.name).assertEqual("Eve");
      expect(ret === r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_3400
     * @tc.name testBoxGenericGetSetD034
     * @tc.desc Verify Box<Required<Person042>> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Required<Person042>> = new Box<Required<Person042>>({ name: "z", age: 0 });
      box.set({ name: "A", age: 1 });
      box.set({ name: "B", age: 2 });
      box.set({ name: "C", age: 3 });
      expect(box.get().name).assertEqual("C");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_3500
     * @tc.name testBoxGenericGetSetD035
     * @tc.desc Verify Box<Required<Person042>> set with zero age edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Required<Person042>> = new Box<Required<Person042>>({ name: "x", age: 99 });
      box.set({ name: "Zero", age: 0 });
      expect(box.get().age).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_3600
     * @tc.name testBoxGenericGetSetD036
     * @tc.desc Verify Box<NonNullable<string|null>> set new value and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>("init");
      box.set("changed");
      expect(box.get()).assertEqual("changed");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_3700
     * @tc.name testBoxGenericGetSetD037
     * @tc.desc Verify Box<NonNullable<string|null>> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>("a");
      let boxB: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>("b");
      boxA.set("alpha");
      boxB.set("beta");
      expect(boxA.get()).assertEqual("alpha");
      expect(boxB.get()).assertEqual("beta");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_3800
     * @tc.name testBoxGenericGetSetD038
     * @tc.desc Verify Box<NonNullable<string|null>> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>("x");
      let ret: NonNullable<string | null> = box.set("returnStr");
      expect(ret).assertEqual("returnStr");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_3900
     * @tc.name testBoxGenericGetSetD039
     * @tc.desc Verify Box<NonNullable<string|null>> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>("");
      box.set("first");
      box.set("second");
      box.set("third");
      expect(box.get()).assertEqual("third");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_4000
     * @tc.name testBoxGenericGetSetD040
     * @tc.desc Verify Box<NonNullable<string|null>> set empty string edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>("nonempty");
      box.set("");
      expect(box.get()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_4100
     * @tc.name testBoxGenericGetSetD041
     * @tc.desc Verify Box<keyof Person042> set new key and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<keyof Person042> = new Box<keyof Person042>("name");
      box.set("age");
      expect(box.get()).assertEqual("age");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_4200
     * @tc.name testBoxGenericGetSetD042
     * @tc.desc Verify Box<keyof Person042> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<keyof Person042> = new Box<keyof Person042>("name");
      let boxB: Box<keyof Person042> = new Box<keyof Person042>("name");
      boxA.set("age");
      boxB.set("name");
      expect(boxA.get()).assertEqual("age");
      expect(boxB.get()).assertEqual("name");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_4300
     * @tc.name testBoxGenericGetSetD043
     * @tc.desc Verify Box<keyof Person042> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<keyof Person042> = new Box<keyof Person042>("name");
      let ret: keyof Person042 = box.set("age");
      expect(ret).assertEqual("age");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_4400
     * @tc.name testBoxGenericGetSetD044
     * @tc.desc Verify Box<keyof Person042> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<keyof Person042> = new Box<keyof Person042>("name");
      box.set("name");
      box.set("age");
      box.set("name");
      expect(box.get()).assertEqual("name");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_4500
     * @tc.name testBoxGenericGetSetD045
     * @tc.desc Verify Box<keyof Person042> set same key repeated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<keyof Person042> = new Box<keyof Person042>("name");
      box.set("age");
      box.set("name");
      box.set("age");
      expect(box.get()).assertEqual("age");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_4600
     * @tc.name testBoxGenericGetSetD046
     * @tc.desc Verify Box<FixedArray<int>> set new FixedArray and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(new FixedArray<int>(3));
      let fa: FixedArray<int> = new FixedArray<int>(3);
      fa[0] = 7;
      fa[1] = 8;
      fa[2] = 9;
      box.set(fa);
      expect(box.get()[0]).assertEqual(7);
      expect(box.get()[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_4700
     * @tc.name testBoxGenericGetSetD047
     * @tc.desc Verify Box<FixedArray<int>> set different values and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(new FixedArray<int>(2));
      let fa: FixedArray<int> = new FixedArray<int>(2);
      fa[0] = 111;
      fa[1] = 222;
      box.set(fa);
      expect(box.get()[1]).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_4800
     * @tc.name testBoxGenericGetSetD048
     * @tc.desc Verify Box<FixedArray<int>> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<FixedArray<int>> = new Box<FixedArray<int>>(new FixedArray<int>(2));
      let boxB: Box<FixedArray<int>> = new Box<FixedArray<int>>(new FixedArray<int>(2));
      let fA: FixedArray<int> = new FixedArray<int>(2);
      fA[0] = 1;
      fA[1] = 2;
      let fB: FixedArray<int> = new FixedArray<int>(2);
      fB[0] = 3;
      fB[1] = 4;
      boxA.set(fA);
      boxB.set(fB);
      expect(boxA.get()[0]).assertEqual(1);
      expect(boxB.get()[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_4900
     * @tc.name testBoxGenericGetSetD049
     * @tc.desc Verify Box<FixedArray<int>> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(new FixedArray<int>(2));
      let fa: FixedArray<int> = new FixedArray<int>(2);
      fa[0] = 99;
      fa[1] = 88;
      let ret: FixedArray<int> = box.set(fa);
      expect(ret[0]).assertEqual(99);
      expect(ret === fa).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_5000
     * @tc.name testBoxGenericGetSetD050
     * @tc.desc Verify Box<FixedArray<int>> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(new FixedArray<int>(2));
      let a: FixedArray<int> = new FixedArray<int>(2);
      a[0] = 1;
      let b: FixedArray<int> = new FixedArray<int>(2);
      b[0] = 2;
      let c: FixedArray<int> = new FixedArray<int>(2);
      c[0] = 3;
      box.set(a);
      box.set(b);
      box.set(c);
      expect(box.get()[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_5100
     * @tc.name testBoxGenericGetSetD051
     * @tc.desc Verify Box<FixedArray<int>> set larger size edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(new FixedArray<int>(2));
      let fa: FixedArray<int> = new FixedArray<int>(5);
      fa[0] = 10;
      fa[1] = 20;
      fa[2] = 30;
      fa[3] = 40;
      fa[4] = 50;
      box.set(fa);
      expect(box.get()[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_5200
     * @tc.name testBoxGenericGetSetD052
     * @tc.desc Verify Box<FixedArray<int>> set negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(new FixedArray<int>(2));
      let fa: FixedArray<int> = new FixedArray<int>(2);
      fa[0] = -100;
      fa[1] = -200;
      box.set(fa);
      expect(box.get()[1]).assertEqual(-200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_5300
     * @tc.name testBoxGenericGetSetD053
     * @tc.desc Verify Box<FixedArray<int>> set zeros and verify defaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(new FixedArray<int>(3));
      let fa: FixedArray<int> = new FixedArray<int>(3);
      box.set(fa);
      expect(box.get()[0]).assertEqual(0);
      expect(box.get()[1]).assertEqual(0);
      expect(box.get()[2]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_5400
     * @tc.name testBoxGenericGetSetD054
     * @tc.desc Verify Box<readonly int[]> set with large array and verify all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>([0]);
      box.set([10, 20, 30, 40, 50]);
      expect(box.get().length).assertEqual(5);
      expect(box.get()[0]).assertEqual(10);
      expect(box.get()[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_5500
     * @tc.name testBoxGenericGetSetD055
     * @tc.desc Verify Box<readonly int[]> set with negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>([0]);
      box.set([-1, -2, -3]);
      expect(box.get()[1]).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_5600
     * @tc.name testBoxGenericGetSetD056
     * @tc.desc Verify Box<readonly int[]> set with same values twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>([0]);
      box.set([1, 2]);
      box.set([1, 2]);
      expect(box.get()[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_5700
     * @tc.name testBoxGenericGetSetD057
     * @tc.desc Verify Box<[int, string]> set with swapped values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>([0, ""]);
      box.set([100, "hundred"]);
      expect(box.get()[0]).assertEqual(100);
      expect(box.get()[1]).assertEqual("hundred");
      box.set([200, "twohundred"]);
      expect(box.get()[0]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_5800
     * @tc.name testBoxGenericGetSetD058
     * @tc.desc Verify Box<[int, string]> set with same value repeated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>([0, "a"]);
      box.set([5, "b"]);
      box.set([5, "b"]);
      expect(box.get()[0]).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_5900
     * @tc.name testBoxGenericGetSetD059
     * @tc.desc Verify Box<Partial<Person042>> set with age field override
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Partial<Person042>> = new Box<Partial<Person042>>({ name: "Init" });
      box.set({ age: 25 });
      expect(box.get().age).assertEqual(25);
      box.set({ name: "Updated" });
      expect(box.get().name).assertEqual("Updated");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_6000
     * @tc.name testBoxGenericGetSetD060
     * @tc.desc Verify Box<Required<Person042>> set with max boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Required<Person042>> = new Box<Required<Person042>>({ name: "x", age: 0 });
      box.set({ name: "Max", age: 200 });
      expect(box.get().age).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_6100
     * @tc.name testBoxGenericGetSetD061
     * @tc.desc Verify Box<NonNullable<string | null>> set with long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>("short");
      box.set("longer string value here");
      expect(box.get()).assertEqual("longer string value here");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_6200
     * @tc.name testBoxGenericGetSetD062
     * @tc.desc Verify Box<keyof Person042> set and verify equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<keyof Person042> = new Box<keyof Person042>("name");
      box.set("age");
      box.set("name");
      expect(box.get()).assertEqual("name");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_6300
     * @tc.name testBoxGenericGetSetD063
     * @tc.desc Verify Box<FixedArray<int>> set with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(new FixedArray<int>(2));
      let fa: FixedArray<int> = new FixedArray<int>(2);
      fa[0] = Int.MAX_VALUE;
      fa[1] = Int.MIN_VALUE;
      box.set(fa);
      expect(box.get()[0]).assertEqual(fa[0]);
      expect(box.get()[1]).assertEqual(fa[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_6400
     * @tc.name testBoxGenericGetSetD064
     * @tc.desc Verify Box<FixedArray<int>> set with same values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(new FixedArray<int>(3));
      let fa: FixedArray<int> = new FixedArray<int>(3);
      fa[0] = 5;
      fa[1] = 5;
      fa[2] = 5;
      box.set(fa);
      expect(box.get()[0]).assertEqual(5);
      expect(box.get()[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_6500
     * @tc.name testBoxGenericGetSetD065
     * @tc.desc Verify Box<NonNullable<string|null>> set return value chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>("init");
      let r1: NonNullable<string | null> = box.set("a");
      let r2: NonNullable<string | null> = box.set("b");
      let r3: NonNullable<string | null> = box.set("c");
      expect(r1).assertEqual("a");
      expect(r2).assertEqual("b");
      expect(r3).assertEqual("c");
      expect(box.get()).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_6600
     * @tc.name testBoxGenericGetSetD066
     * @tc.desc Verify Box<Partial<Person042>> set return value chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Partial<Person042>> = new Box<Partial<Person042>>({});
      let p1: Partial<Person042> = { name: "first" };
      let p2: Partial<Person042> = { age: 20 };
      let p3: Partial<Person042> = { name: "final", age: 99 };
      box.set(p1);
      box.set(p2);
      box.set(p3);
      expect(box.get().name).assertEqual("final");
      expect(box.get().age).assertEqual(99);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_6700
     * @tc.name testBoxGenericGetSetD067
     * @tc.desc Verify Box<ReadonlyIntArray040> set with multiple elements and verify full content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>([1, 2, 3]);
      box.set([10, 20, 30, 40]);
      expect(box.get().length).assertEqual(4);
      expect(box.get()[0]).assertEqual(10);
      expect(box.get()[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_7100
     * @tc.name testBoxGenericGetSetD068
     * @tc.desc Verify Box<ReadonlyIntArray040> set with single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>([0]);
      box.set([99]);
      expect(box.get().length).assertEqual(1);
      expect(box.get()[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_7200
     * @tc.name testBoxGenericGetSetD069
     * @tc.desc Verify Box<IntStringTuple041> set negative int with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>([0, "x"]);
      box.set([-5, ""]);
      expect(box.get()[0]).assertEqual(-5);
      expect(box.get()[1]).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_7300
     * @tc.name testBoxGenericGetSetD070
     * @tc.desc Verify Box<IntStringTuple041> set large int with long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>([0, ""]);
      box.set([999999, "very long string value"]);
      let irs: int = box.get()[0];
      expect(irs).assertEqual(999999);
      let ers: string = box.get()[1];
      expect(ers).assertEqual("very long string value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_7400
     * @tc.name testBoxGenericGetSetD071
     * @tc.desc Verify Box<Partial<Person042>> set with name only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Partial<Person042>> = new Box<Partial<Person042>>({});
      box.set({ name: "Alice" });
      expect(box.get().name).assertEqual("Alice");
      expect(box.get().age === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_7500
     * @tc.name testBoxGenericGetSetD072
     * @tc.desc Verify Box<Partial<Person042>> set with age only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Partial<Person042>> = new Box<Partial<Person042>>({});
      box.set({ age: 25 });
      expect(box.get().age).assertEqual(25);
      expect(box.get().name === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_7600
     * @tc.name testBoxGenericGetSetD073
     * @tc.desc Verify Box<Required<Person042>> set with different values and verify both fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Required<Person042>> = new Box<Required<Person042>>({ name: "x", age: 0 });
      box.set({ name: "David", age: 35 });
      expect(box.get().name).assertEqual("David");
      expect(box.get().age).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_7700
     * @tc.name testBoxGenericGetSetD074
     * @tc.desc Verify Box<Required<Person042>> set with boundary age 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Required<Person042>> = new Box<Required<Person042>>({ name: "x", age: 1 });
      box.set({ name: "Zero", age: 0 });
      expect(box.get().name).assertEqual("Zero");
      expect(box.get().age).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_7800
     * @tc.name testBoxGenericGetSetD075
     * @tc.desc Verify Box<NonNullable<string | null>> set with long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>("short");
      box.set("a much longer string value for testing");
      expect(box.get()).assertEqual("a much longer string value for testing");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_7900
     * @tc.name testBoxGenericGetSetD076
     * @tc.desc Verify Box<NonNullable<string | null>> set with numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>("text");
      box.set("12345");
      expect(box.get()).assertEqual("12345");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_8000
     * @tc.name testBoxGenericGetSetD077
     * @tc.desc Verify Box<keyof Person042> switch between name and age
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<keyof Person042> = new Box<keyof Person042>("name");
      expect(box.get()).assertEqual("name");
      box.set("age");
      expect(box.get()).assertEqual("age");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_8100
     * @tc.name testBoxGenericGetSetD078
     * @tc.desc Verify Box<keyof Person042> set name, then age, then name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<keyof Person042> = new Box<keyof Person042>("name");
      box.set("age");
      expect(box.get()).assertEqual("age");
      box.set("name");
      expect(box.get()).assertEqual("name");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_8200
     * @tc.name testBoxGenericGetSetD079
     * @tc.desc Verify Box<FixedArray<int>> set with all different values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(new FixedArray<int>(3));
      let fa: FixedArray<int> = new FixedArray<int>(3);
      fa[0] = 100;
      fa[1] = 200;
      fa[2] = 300;
      box.set(fa);
      expect(box.get()[0]).assertEqual(100);
      expect(box.get()[1]).assertEqual(200);
      expect(box.get()[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_8300
     * @tc.name testBoxGenericGetSetD080
     * @tc.desc Verify Box<FixedArray<int>> set with zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(new FixedArray<int>(2));
      let fa: FixedArray<int> = new FixedArray<int>(2);
      fa[0] = 0;
      fa[1] = 0;
      box.set(fa);
      expect(box.get()[0]).assertEqual(0);
      expect(box.get()[1]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_6800
     * @tc.name testBoxGenericGetSetD081
     * @tc.desc Verify Box<ReadonlyIntArray040> chain set 3 arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>([0]);
      box.set([1, 1]);
      box.set([2, 2, 2]);
      box.set([3, 3, 3, 3]);
      expect(box.get().length).assertEqual(4);
      expect(box.get()[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_8400
     * @tc.name testBoxGenericGetSetD082
     * @tc.desc Verify Box<IntStringTuple041> chain set 3 tuples
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>([0, "start"]);
      box.set([1, "one"]);
      box.set([2, "two"]);
      box.set([3, "three"]);
      expect(box.get()[0]).assertEqual(3);
      expect(box.get()[1]).assertEqual("three");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_8500
     * @tc.name testBoxGenericGetSetD083
     * @tc.desc Verify Box<Partial<Person042>> chain set 3 partial objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Partial<Person042>> = new Box<Partial<Person042>>({});
      box.set({ name: "first" });
      box.set({ age: 10 });
      box.set({ name: "final", age: 99 });
      expect(box.get().name).assertEqual("final");
      expect(box.get().age).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_8600
     * @tc.name testBoxGenericGetSetD084
     * @tc.desc Verify Box<Required<Person042>> chain set 3 required objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Required<Person042>> = new Box<Required<Person042>>({ name: "x", age: 0 });
      box.set({ name: "A", age: 1 });
      box.set({ name: "B", age: 2 });
      box.set({ name: "C", age: 3 });
      expect(box.get().name).assertEqual("C");
      expect(box.get().age).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_8700
     * @tc.name testBoxGenericGetSetD085
     * @tc.desc Verify Box<NonNullable<string | null>> chain set 3 strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>("init");
      box.set("alpha");
      box.set("beta");
      box.set("gamma");
      expect(box.get()).assertEqual("gamma");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_8800
     * @tc.name testBoxGenericGetSetD086
     * @tc.desc Verify Box<keyof Person042> chain set 3 key values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<keyof Person042> = new Box<keyof Person042>("name");
      box.set("age");
      box.set("name");
      box.set("age");
      expect(box.get()).assertEqual("age");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_8900
     * @tc.name testBoxGenericGetSetD087
     * @tc.desc Verify Box<FixedArray<int>> chain set 3 FixedArrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(new FixedArray<int>(1));
      let a: FixedArray<int> = new FixedArray<int>(1);
      a[0] = 1;
      let b: FixedArray<int> = new FixedArray<int>(1);
      b[0] = 2;
      let c: FixedArray<int> = new FixedArray<int>(1);
      c[0] = 3;
      box.set(a);
      box.set(b);
      box.set(c);
      expect(box.get()[0]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_6900
     * @tc.name testBoxGenericGetSetD088
     * @tc.desc Verify Box<Partial<Person042>> and Box<Required<Person042>> are isolated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pBox: Box<Partial<Person042>> = new Box<Partial<Person042>>({ name: "Partial" });
      let rBox: Box<Required<Person042>> = new Box<Required<Person042>>({ name: "Required", age: 30 });
      expect(pBox.get().name).assertEqual("Partial");
      expect(rBox.get().name).assertEqual("Required");
      expect(rBox.get().age).assertEqual(30);
      pBox.set({ age: 50 });
      rBox.set({ name: "Changed", age: 60 });
      expect(pBox.get().age).assertEqual(50);
      expect(rBox.get().name).assertEqual("Changed");
      expect(rBox.get().age).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_9000
     * @tc.name testBoxGenericGetSetD089
     * @tc.desc Verify Box<NonNullable<string|null>> and Box<keyof Person042> are isolated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nnBox: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>("str");
      let kBox: Box<keyof Person042> = new Box<keyof Person042>("name");
      nnBox.set("updated");
      kBox.set("age");
      expect(nnBox.get()).assertEqual("updated");
      expect(kBox.get()).assertEqual("age");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_9100
     * @tc.name testBoxGenericGetSetD090
     * @tc.desc Verify Box<ReadonlyIntArray040> and Box<FixedArray<int>> are isolated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let roBox: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>([1, 2]);
      let faBox: Box<FixedArray<int>> = new Box<FixedArray<int>>(new FixedArray<int>(2));
      let fa: FixedArray<int> = new FixedArray<int>(2);
      fa[0] = 10;
      fa[1] = 20;
      roBox.set([3, 4, 5]);
      faBox.set(fa);
      expect(roBox.get().length).assertEqual(3);
      expect(roBox.get()[0]).assertEqual(3);
      expect(faBox.get()[0]).assertEqual(10);
      expect(faBox.get()[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_9200
     * @tc.name testBoxGenericGetSetD091
     * @tc.desc Verify Box<IntStringTuple041> and Box<Partial<Person042>> are isolated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tBox: Box<IntStringTuple041> = new Box<IntStringTuple041>([1, "one"]);
      let pBox: Box<Partial<Person042>> = new Box<Partial<Person042>>({ name: "tuple" });
      tBox.set([2, "two"]);
      pBox.set({ age: 40 });
      expect(tBox.get()[0]).assertEqual(2);
      expect(tBox.get()[1]).assertEqual("two");
      expect(pBox.get().age).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_9300
     * @tc.name testBoxGenericGetSetD092
     * @tc.desc Verify Box<Required<Person042>> and Box<NonNullable<string|null>> are isolated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rBox: Box<Required<Person042>> = new Box<Required<Person042>>({ name: "Req", age: 10 });
      let nnBox: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>("text");
      rBox.set({ name: "RequiredOnly", age: 99 });
      nnBox.set("stringVal");
      expect(rBox.get().name).assertEqual("RequiredOnly");
      expect(rBox.get().age).assertEqual(99);
      expect(nnBox.get()).assertEqual("stringVal");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_7000
     * @tc.name testBoxGenericGetSetD093
     * @tc.desc Verify Box<ReadonlyIntArray040> set empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>([1, 2, 3]);
      let emptyArr: ReadonlyIntArray040 = [];
      box.set(emptyArr);
      expect(box.get().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_9400
     * @tc.name testBoxGenericGetSetD094
     * @tc.desc Verify Box<FixedArray<int>> set zero-length array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(new FixedArray<int>(2));
      let empty: FixedArray<int> = new FixedArray<int>(0);
      box.set(empty);
      expect(box.get().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_9500
     * @tc.name testBoxGenericGetSetD095
     * @tc.desc Verify Box<Partial<Person042>> set empty object, verify fields undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Partial<Person042>> = new Box<Partial<Person042>>({ name: "temp", age: 10 });
      box.set({});
      expect(box.get().name === undefined).assertTrue();
      expect(box.get().age === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_9600
     * @tc.name testBoxGenericGetSetD096
     * @tc.desc Verify Box<NonNullable<string | null>> set empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>("nonempty");
      box.set("");
      expect(box.get()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_4_9700
     * @tc.name testBoxGenericGetSetD097
     * @tc.desc Verify Box<keyof Person042> set different key values and verify exact string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetD097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<keyof Person042> = new Box<keyof Person042>("age");
      expect(box.get()).assertEqual("age");
      box.set("name");
      expect(box.get()).assertEqual("name");
      box.set("age");
      expect(box.get()).assertEqual("age");
    });

  });
}
