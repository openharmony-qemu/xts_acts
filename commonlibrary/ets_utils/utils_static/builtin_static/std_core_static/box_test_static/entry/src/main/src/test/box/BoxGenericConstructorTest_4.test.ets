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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';
import { ReadonlyIntArray040, IntStringTuple041, Person042 }
  from '../Util.test';

export default function BoxGenericConstructorTest4(): void {
  describe('BoxGenericConstructorTest4', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_0100
     * @tc.name testBoxGenericConstructorD001
     * @tc.desc Verify Box<readonly int[]> constructor stores and retrieves readonly int array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ReadonlyIntArray040 = [1, 2, 3];
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>(arr);
      let result: ReadonlyIntArray040 = box.get();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_0200
     * @tc.name testBoxGenericConstructorD002
     * @tc.desc Verify Box<[int, string]> constructor stores and retrieves tuple
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tuple: IntStringTuple041 = [42, "hello"];
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>(tuple);
      let result: IntStringTuple041 = box.get();
      expect(result[0]).assertEqual(42);
      expect(result[1]).assertEqual("hello");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_0300
     * @tc.name testBoxGenericConstructorD003
     * @tc.desc Verify Box<Partial<Person042>> constructor stores and retrieves Partial Person
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let partial: Partial<Person042> = { name: "Alice" };
      let box: Box<Partial<Person042>> = new Box<Partial<Person042>>(partial);
      let result: Partial<Person042> = box.get();
      expect(result.name).assertEqual("Alice");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_0400
     * @tc.name testBoxGenericConstructorD004
     * @tc.desc Verify Box<Required<Person042>> constructor stores and retrieves Required Person
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let required: Required<Person042> = { name: "Bob", age: 25 };
      let box: Box<Required<Person042>> = new Box<Required<Person042>>(required);
      let result: Required<Person042> = box.get();
      expect(result.age).assertEqual(25);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_0500
     * @tc.name testBoxGenericConstructorD005
     * @tc.desc Verify Box<NonNullable<string | null>> constructor stores and retrieves NonNullable value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nonNull: NonNullable<string | null> = "text";
      let box: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>(nonNull);
      let result: NonNullable<string | null> = box.get();
      expect(result).assertEqual("text");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_0600
     * @tc.name testBoxGenericConstructorD006
     * @tc.desc Verify Box<keyof Person042> constructor stores and retrieves keyof Person
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: keyof Person042 = "name";
      let box: Box<keyof Person042> = new Box<keyof Person042>(key);
      let result: keyof Person042 = box.get();
      expect(result).assertEqual("name");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_0700
     * @tc.name testBoxGenericConstructorD007
     * @tc.desc Verify Box<FixedArray<int>> constructor stores and retrieves FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fixed: FixedArray<int> = new FixedArray<int>(3);
      fixed[0] = 10;
      fixed[1] = 20;
      fixed[2] = 30;
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(fixed);
      let result: FixedArray<int> = box.get();
      expect(result[1]).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_0800
     * @tc.name testBoxGenericConstructorD008
     * @tc.desc Verify Box<readonly int[]> constructor with different array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ReadonlyIntArray040 = [10, 20, 30, 40];
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>(arr);
      expect(box.get().length).assertEqual(4);
      expect(box.get()[0]).assertEqual(10);
      expect(box.get()[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_0900
     * @tc.name testBoxGenericConstructorD009
     * @tc.desc Verify Box<readonly int[]> constructor with single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ReadonlyIntArray040 = [100];
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>(arr);
      expect(box.get().length).assertEqual(1);
      expect(box.get()[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_1000
     * @tc.name testBoxGenericConstructorD010
     * @tc.desc Verify Box<readonly int[]> constructor with large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ReadonlyIntArray040 = [1000, 2000, 3000];
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>(arr);
      expect(box.get()[1]).assertEqual(2000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_1100
     * @tc.name testBoxGenericConstructorD011
     * @tc.desc Verify Box<[int, string]> constructor with different tuple values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tuple: IntStringTuple041 = [99, "world"];
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>(tuple);
      expect(box.get()[0]).assertEqual(99);
      expect(box.get()[1]).assertEqual("world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_1200
     * @tc.name testBoxGenericConstructorD012
     * @tc.desc Verify Box<[int, string]> constructor with zero int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tuple: IntStringTuple041 = [0, "zero"];
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>(tuple);
      expect(box.get()[0]).assertEqual(0);
      expect(box.get()[1]).assertEqual("zero");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_1300
     * @tc.name testBoxGenericConstructorD013
     * @tc.desc Verify Box<[int, string]> constructor with negative int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tuple: IntStringTuple041 = [-5, "negative"];
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>(tuple);
      expect(box.get()[0]).assertEqual(-5);
      expect(box.get()[1]).assertEqual("negative");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_1400
     * @tc.name testBoxGenericConstructorD014
     * @tc.desc Verify Box<Partial<Person042>> constructor with age-only partial
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let partial: Partial<Person042> = { age: 30 };
      let box: Box<Partial<Person042>> = new Box<Partial<Person042>>(partial);
      expect(box.get().age).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_1500
     * @tc.name testBoxGenericConstructorD015
     * @tc.desc Verify Box<Partial<Person042>> constructor with both fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let partial: Partial<Person042> = { name: "Charlie", age: 35 };
      let box: Box<Partial<Person042>> = new Box<Partial<Person042>>(partial);
      expect(box.get().name).assertEqual("Charlie");
      expect(box.get().age).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_1600
     * @tc.name testBoxGenericConstructorD016
     * @tc.desc Verify Box<Required<Person042>> constructor with different values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let required: Required<Person042> = { name: "Diana", age: 28 };
      let box: Box<Required<Person042>> = new Box<Required<Person042>>(required);
      expect(box.get().name).assertEqual("Diana");
      expect(box.get().age).assertEqual(28);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_1700
     * @tc.name testBoxGenericConstructorD017
     * @tc.desc Verify Box<Required<Person042>> constructor with zero age edge case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let required: Required<Person042> = { name: "Eve", age: 0 };
      let box: Box<Required<Person042>> = new Box<Required<Person042>>(required);
      expect(box.get().age).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_1800
     * @tc.name testBoxGenericConstructorD018
     * @tc.desc Verify Box<Required<Person042>> constructor with empty name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let required: Required<Person042> = { name: "", age: 1 };
      let box: Box<Required<Person042>> = new Box<Required<Person042>>(required);
      expect(box.get().name).assertEqual("");
      expect(box.get().age).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_1900
     * @tc.name testBoxGenericConstructorD019
     * @tc.desc Verify Box<NonNullable<string | null>> constructor with different string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nonNull: NonNullable<string | null> = "updated";
      let box: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>(nonNull);
      expect(box.get()).assertEqual("updated");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_2000
     * @tc.name testBoxGenericConstructorD020
     * @tc.desc Verify Box<NonNullable<string | null>> constructor with empty string edge case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nonNull: NonNullable<string | null> = "";
      let box: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>(nonNull);
      expect(box.get()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_2100
     * @tc.name testBoxGenericConstructorD021
     * @tc.desc Verify Box<NonNullable<string | null>> constructor with long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nonNull: NonNullable<string | null> = "abc".repeat(10);
      let box: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>(nonNull);
      expect(box.get()).assertEqual("abc".repeat(10));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_2200
     * @tc.name testBoxGenericConstructorD022
     * @tc.desc Verify Box<keyof Person042> constructor with "age" key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: keyof Person042 = "age";
      let box: Box<keyof Person042> = new Box<keyof Person042>(key);
      expect(box.get()).assertEqual("age");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_2300
     * @tc.name testBoxGenericConstructorD023
     * @tc.desc Verify Box<keyof Person042> constructor case sensitivity check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: keyof Person042 = "name";
      let box: Box<keyof Person042> = new Box<keyof Person042>(key);
      expect(box.get() === "name").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_2400
     * @tc.name testBoxGenericConstructorD024
     * @tc.desc Verify Box<FixedArray<int>> constructor with different values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fixed: FixedArray<int> = new FixedArray<int>(3);
      fixed[0] = 100;
      fixed[1] = 200;
      fixed[2] = 300;
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(fixed);
      expect(box.get()[0]).assertEqual(100);
      expect(box.get()[2]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_2500
     * @tc.name testBoxGenericConstructorD025
     * @tc.desc Verify Box<FixedArray<int>> constructor with single element used
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fixed: FixedArray<int> = new FixedArray<int>(5);
      fixed[0] = 42;
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(fixed);
      expect(box.get()[0]).assertEqual(42);
      expect(box.get()[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_2600
     * @tc.name testBoxGenericConstructorD026
     * @tc.desc Verify Box<FixedArray<int>> constructor with negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fixed: FixedArray<int> = new FixedArray<int>(2);
      fixed[0] = -10;
      fixed[1] = -20;
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(fixed);
      expect(box.get()[1]).assertEqual(-20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_2700
     * @tc.name testBoxGenericConstructorD027
     * @tc.desc Verify Box<readonly int[]> constructor with empty array edge case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ReadonlyIntArray040 = [];
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>(arr);
      expect(box.get().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_2800
     * @tc.name testBoxGenericConstructorD028
     * @tc.desc Verify Box<readonly int[]> constructor with zero values edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ReadonlyIntArray040 = [0, 0, 0];
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>(arr);
      expect(box.get().length).assertEqual(3);
      expect(box.get()[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_2900
     * @tc.name testBoxGenericConstructorD029
     * @tc.desc Verify Box<[int, string]> constructor with zero and empty tuple
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tuple: IntStringTuple041 = [0, ""];
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>(tuple);
      expect(box.get()[0]).assertEqual(0);
      expect(box.get()[1]).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_3000
     * @tc.name testBoxGenericConstructorD030
     * @tc.desc Verify Box<[int, string]> constructor with large int and long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tuple: IntStringTuple041 = [999999, "long.string.value"];
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>(tuple);
      expect(box.get()[0]).assertEqual(999999);
      expect(box.get()[1]).assertEqual("long.string.value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_3100
     * @tc.name testBoxGenericConstructorD031
     * @tc.desc Verify Box<Partial<Person042>> with empty object edge case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let partial: Partial<Person042> = {};
      let box: Box<Partial<Person042>> = new Box<Partial<Person042>>(partial);
      expect(box.get().name === undefined).assertTrue();
      expect(box.get().age === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_3200
     * @tc.name testBoxGenericConstructorD032
     * @tc.desc Verify Box<FixedArray<int>> with default constructor values edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fixed: FixedArray<int> = new FixedArray<int>(3);
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(fixed);
      expect(box.get()[0]).assertEqual(0);
      expect(box.get()[1]).assertEqual(0);
      expect(box.get()[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_3300
     * @tc.name testBoxGenericConstructorD033
     * @tc.desc Verify Box<keyof Person042> constructor with value reassignment check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: keyof Person042 = "name";
      let box: Box<keyof Person042> = new Box<keyof Person042>(key);
      expect(box.get()).assertEqual("name");
      let key2: keyof Person042 = "age";
      let box2: Box<keyof Person042> = new Box<keyof Person042>(key2);
      expect(box2.get()).assertEqual("age");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_3400
     * @tc.name testBoxGenericConstructorD034
     * @tc.desc Verify Box<readonly int[]> constructor with descending values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ReadonlyIntArray040 = [9, 8, 7, 6, 5];
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>(arr);
      expect(box.get().length).assertEqual(5);
      expect(box.get()[0]).assertEqual(9);
      expect(box.get()[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_3500
     * @tc.name testBoxGenericConstructorD035
     * @tc.desc Verify Box<readonly int[]> constructor with repeated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ReadonlyIntArray040 = [1, 1, 1];
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>(arr);
      expect(box.get()[0]).assertEqual(1);
      expect(box.get()[1]).assertEqual(1);
      expect(box.get()[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_3600
     * @tc.name testBoxGenericConstructorD036
     * @tc.desc Verify Box<readonly int[]> constructor with alternating values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ReadonlyIntArray040 = [2, 4, 6, 8];
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>(arr);
      expect(box.get()[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_3700
     * @tc.name testBoxGenericConstructorD037
     * @tc.desc Verify Box<readonly int[]> constructor with negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ReadonlyIntArray040 = [-10, -20, -30];
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>(arr);
      expect(box.get()[0]).assertEqual(-10);
      expect(box.get()[2]).assertEqual(-30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_3800
     * @tc.name testBoxGenericConstructorD038
     * @tc.desc Verify Box<readonly int[]> constructor with max and min ints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ReadonlyIntArray040 = [2147483647, -2147483648];
      let box: Box<ReadonlyIntArray040> = new Box<ReadonlyIntArray040>(arr);
      expect(box.get()[0]).assertEqual(2147483647);
      expect(box.get()[1]).assertEqual(-2147483648);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_3900
     * @tc.name testBoxGenericConstructorD039
     * @tc.desc Verify Box<[int, string]> constructor with large int and special chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tuple: IntStringTuple041 = [65535, "special!@#"];
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>(tuple);
      expect(box.get()[0]).assertEqual(65535);
      expect(box.get()[1]).assertEqual("special!@#");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_4000
     * @tc.name testBoxGenericConstructorD040
     * @tc.desc Verify Box<[int, string]> constructor with max boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tuple: IntStringTuple041 = [1, "a"];
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>(tuple);
      expect(box.get()[0] + box.get()[1].length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_4100
     * @tc.name testBoxGenericConstructorD041
     * @tc.desc Verify Box<[int, string]> constructor with zero and very long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tuple: IntStringTuple041 = [0, "a".repeat(20)];
      let box: Box<IntStringTuple041> = new Box<IntStringTuple041>(tuple);
      expect(box.get()[0]).assertEqual(0);
      expect(box.get()[1].length).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_4200
     * @tc.name testBoxGenericConstructorD042
     * @tc.desc Verify Box<Partial<Person042>> constructor with only name set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let partial: Partial<Person042> = { name: "Dave" };
      let box: Box<Partial<Person042>> = new Box<Partial<Person042>>(partial);
      expect(box.get().name).assertEqual("Dave");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_4300
     * @tc.name testBoxGenericConstructorD043
     * @tc.desc Verify Box<Partial<Person042>> constructor with only age set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let partial: Partial<Person042> = { age: 22 };
      let box: Box<Partial<Person042>> = new Box<Partial<Person042>>(partial);
      expect(box.get().age).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_4400
     * @tc.name testBoxGenericConstructorD044
     * @tc.desc Verify Box<Partial<Person042>> constructor with name and age both set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let partial: Partial<Person042> = { name: "Eve", age: 33 };
      let box: Box<Partial<Person042>> = new Box<Partial<Person042>>(partial);
      expect(box.get().name).assertEqual("Eve");
      expect(box.get().age).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_4500
     * @tc.name testBoxGenericConstructorD045
     * @tc.desc Verify Box<Required<Person042>> constructor with senior citizen values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let required: Required<Person042> = { name: "Frank", age: 65 };
      let box: Box<Required<Person042>> = new Box<Required<Person042>>(required);
      expect(box.get().name).assertEqual("Frank");
      expect(box.get().age).assertEqual(65);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_4600
     * @tc.name testBoxGenericConstructorD046
     * @tc.desc Verify Box<Required<Person042>> constructor with max age value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let required: Required<Person042> = { name: "Grace", age: 120 };
      let box: Box<Required<Person042>> = new Box<Required<Person042>>(required);
      expect(box.get().age).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_4700
     * @tc.name testBoxGenericConstructorD047
     * @tc.desc Verify Box<Required<Person042>> constructor with minimal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let required: Required<Person042> = { name: "Hank", age: 1 };
      let box: Box<Required<Person042>> = new Box<Required<Person042>>(required);
      expect(box.get().name).assertEqual("Hank");
      expect(box.get().age).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_4800
     * @tc.name testBoxGenericConstructorD048
     * @tc.desc Verify Box<NonNullable<string | null>> constructor with multi-word string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nonNull: NonNullable<string | null> = "hello world";
      let box: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>(nonNull);
      expect(box.get()).assertEqual("hello world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_4900
     * @tc.name testBoxGenericConstructorD049
     * @tc.desc Verify Box<NonNullable<string | null>> constructor with special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nonNull: NonNullable<string | null> = "line1\nline2";
      let box: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>(nonNull);
      expect(box.get()).assertEqual("line1\nline2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_5000
     * @tc.name testBoxGenericConstructorD050
     * @tc.desc Verify Box<NonNullable<string | null>> constructor with number string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nonNull: NonNullable<string | null> = "42";
      let box: Box<NonNullable<string | null>> = new Box<NonNullable<string | null>>(nonNull);
      expect(box.get()).assertEqual("42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_5100
     * @tc.name testBoxGenericConstructorD051
     * @tc.desc Verify Box<keyof Person042> constructor with identity check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let key: keyof Person042 = "age";
      let box: Box<keyof Person042> = new Box<keyof Person042>(key);
      expect(box.get() === "age").assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_5200
     * @tc.name testBoxGenericConstructorD052
     * @tc.desc Verify Box<FixedArray<int>> constructor with ascending values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fixed: FixedArray<int> = new FixedArray<int>(4);
      fixed[0] = 1;
      fixed[1] = 2;
      fixed[2] = 3;
      fixed[3] = 4;
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(fixed);
      expect(box.get()[0]).assertEqual(1);
      expect(box.get()[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_5300
     * @tc.name testBoxGenericConstructorD053
     * @tc.desc Verify Box<FixedArray<int>> constructor with same values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fixed: FixedArray<int> = new FixedArray<int>(3);
      fixed[0] = 7;
      fixed[1] = 7;
      fixed[2] = 7;
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(fixed);
      expect(box.get()[0]).assertEqual(7);
      expect(box.get()[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_5400
     * @tc.name testBoxGenericConstructorD054
     * @tc.desc Verify Box<FixedArray<int>> constructor with alternating values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fixed: FixedArray<int> = new FixedArray<int>(4);
      fixed[0] = 10;
      fixed[1] = 20;
      fixed[2] = 10;
      fixed[3] = 20;
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(fixed);
      expect(box.get()[1]).assertEqual(20);
      expect(box.get()[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_CONSTRUCTOR_4_5500
     * @tc.name testBoxGenericConstructorD055
     * @tc.desc Verify Box<FixedArray<int>> constructor with large positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericConstructorD055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fixed: FixedArray<int> = new FixedArray<int>(2);
      fixed[0] = 10000;
      fixed[1] = 20000;
      let box: Box<FixedArray<int>> = new Box<FixedArray<int>>(fixed);
      expect(box.get()[1]).assertEqual(20000);
    });

  });
}
