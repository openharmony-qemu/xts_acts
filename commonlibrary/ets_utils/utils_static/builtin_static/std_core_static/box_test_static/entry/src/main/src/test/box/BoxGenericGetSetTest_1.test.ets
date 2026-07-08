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
import { EmptyClass001, Person002 } from '../Util.test';

export default function BoxGenericGetSetTest1(): void {
  describe('BoxGenericGetSetTest1', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_0100
     * @tc.name testBoxGenericGetSetA001
     * @tc.desc Verify Box<EmptyClass001> set and get with independent instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<EmptyClass001> = new Box<EmptyClass001>(new EmptyClass001());
      let newObj: EmptyClass001 = new EmptyClass001();
      box.set(newObj);
      expect(box.get()).assertEqual(newObj);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_0200
     * @tc.name testBoxGenericGetSetA002
     * @tc.desc Verify Box<Person002> set and get updates name and age fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Person002> = new Box<Person002>({name: "A", age: 1});
      let newPerson: Person002 = {name: "B", age: 2};
      box.set(newPerson);
      let result: Person002 = box.get();
      expect(result.name).assertEqual("B");
      expect(result.age).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_0300
     * @tc.name testBoxGenericGetSetA003
     * @tc.desc Verify Box<Person002> set return value equals the input object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Person002> = new Box<Person002>({name: "X", age: 0});
      let newPerson: Person002 = {name: "C", age: 3};
      let ret: Person002 = box.set(newPerson);
      expect(ret.name).assertEqual("C");
      expect(ret.age).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_0400
     * @tc.name testBoxGenericGetSetA004
     * @tc.desc Verify Box<Date> set and get with different epoch timestamps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Date> = new Box<Date>(new Date(1000000));
      box.set(new Date(2000000));
      expect(box.get().getTime()).assertEqual(2000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_0500
     * @tc.name testBoxGenericGetSetA005
     * @tc.desc Verify Box<RegExp> set and get with different source and flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<RegExp> = new Box<RegExp>(new RegExp("abc", "g"));
      box.set(new RegExp("xyz", "i"));
      expect(box.get().source).assertEqual("xyz");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_0600
     * @tc.name testBoxGenericGetSetA006
     * @tc.desc Verify Box<Map<string,int>> set and get with key-value entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Map<string, int>> = new Box<Map<string, int>>(new Map<string, int>());
      let newMap: Map<string, int> = new Map<string, int>();
      newMap.set("a", 1);
      newMap.set("b", 2);
      box.set(newMap);
      let result: Map<string, int> = box.get();
      expect(result.get("a")).assertEqual(1);
      expect(result.get("b")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_0700
     * @tc.name testBoxGenericGetSetA007
     * @tc.desc Verify Box<Set<int>> set and get with element membership
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Set<int>> = new Box<Set<int>>(new Set<int>());
      let newSet: Set<int> = new Set<int>();
      newSet.add(10);
      newSet.add(20);
      box.set(newSet);
      let result: Set<int> = box.get();
      expect(result.has(10)).assertTrue();
      expect(result.has(20)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_0800
     * @tc.name testBoxGenericGetSetA008
     * @tc.desc Verify Box<int[]> set and get with different array contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<int[]> = new Box<int[]>([1, 2, 3]);
      box.set([4, 5, 6]);
      let result: int[] = box.get();
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(5);
      expect(result[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_0900
     * @tc.name testBoxGenericGetSetA009
     * @tc.desc Verify Box<Promise<int>> set and get with distinct promise references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Promise<int> = new Promise<int>(() => {});
      let p2: Promise<int> = new Promise<int>(() => {});
      let box: Box<Promise<int>> = new Box<Promise<int>>(p1);
      let ret: Promise<int> = box.set(p2);
      expect(box.get()).assertEqual(p2);
      expect(ret).assertEqual(p2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_1000
     * @tc.name testBoxGenericGetSetA010
     * @tc.desc Verify Box<Error> set and get preserves updated error message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Error> = new Box<Error>(new Error("msg1"));
      box.set(new Error("msg2"));
      expect(box.get().message).assertEqual("msg2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_1100
     * @tc.name testBoxGenericGetSetA011
     * @tc.desc Verify Box<TypeError> set and get with different TypeError strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<TypeError> = new Box<TypeError>(new TypeError("invalid"));
      box.set(new TypeError("invalid"));
      expect(box.get().toString()).assertEqual("TypeError: invalid");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_1200
     * @tc.name testBoxGenericGetSetA012
     * @tc.desc Verify Box<RangeError> set and get with different buffer sizes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf1: RangeError = new RangeError("range");
      let buf2: RangeError = new RangeError("range");
      let box: Box<RangeError> = new Box<RangeError>(buf1);
      box.set(buf2);
      expect(box.get().message).assertEqual("range");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_1300
     * @tc.name testBoxGenericGetSetA013
     * @tc.desc Verify Box<bigint> set and get with different bigint values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<bigint> = new Box<bigint>(100n);
      let ret: bigint = box.set(200n);
      expect(ret).assertEqual(200n);
      expect(box.get()).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_1400
     * @tc.name testBoxGenericGetSetA014
     * @tc.desc Verify Box<bigint> set return value equals the input parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<bigint> = new Box<bigint>(0n);
      let ret: bigint = box.set(999n);
      expect(ret).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_1500
     * @tc.name testBoxGenericGetSetA015
     * @tc.desc Verify Box<EmptyClass001> set new value and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<EmptyClass001> = new Box<EmptyClass001>(new EmptyClass001());
      let v1: EmptyClass001 = new EmptyClass001();
      box.set(v1);
      expect(box.get()).assertEqual(v1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_1600
     * @tc.name testBoxGenericGetSetA016
     * @tc.desc Verify Box<EmptyClass001> set different value and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<EmptyClass001> = new Box<EmptyClass001>(new EmptyClass001());
      let v2: EmptyClass001 = new EmptyClass001();
      box.set(v2);
      expect(box.get() === v2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_1700
     * @tc.name testBoxGenericGetSetA017
     * @tc.desc Verify Box<EmptyClass001> instance isolation - two boxes set differently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objA: EmptyClass001 = new EmptyClass001();
      let objB: EmptyClass001 = new EmptyClass001();
      let boxA: Box<EmptyClass001> = new Box<EmptyClass001>(new EmptyClass001());
      let boxB: Box<EmptyClass001> = new Box<EmptyClass001>(new EmptyClass001());
      boxA.set(objA);
      boxB.set(objB);
      expect(boxA.get() === objA).assertTrue();
      expect(boxB.get() === objB).assertTrue();
      expect(boxA.get() !== boxB.get()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_1800
     * @tc.name testBoxGenericGetSetA018
     * @tc.desc Verify Box<EmptyClass001> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<EmptyClass001> = new Box<EmptyClass001>(new EmptyClass001());
      let inp: EmptyClass001 = new EmptyClass001();
      let ret: EmptyClass001 = box.set(inp);
      expect(ret === inp).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_1900
     * @tc.name testBoxGenericGetSetA019
     * @tc.desc Verify Box<EmptyClass001> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<EmptyClass001> = new Box<EmptyClass001>(new EmptyClass001());
      let a: EmptyClass001 = new EmptyClass001();
      let b: EmptyClass001 = new EmptyClass001();
      let c: EmptyClass001 = new EmptyClass001();
      box.set(a);
      box.set(b);
      box.set(c);
      expect(box.get() === c).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_2000
     * @tc.name testBoxGenericGetSetA020
     * @tc.desc Verify Box<Person002> set new value and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Person002> = new Box<Person002>({name: "old", age: 10});
      box.set({name: "new", age: 20});
      expect(box.get().name).assertEqual("new");
      expect(box.get().age).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_2100
     * @tc.name testBoxGenericGetSetA021
     * @tc.desc Verify Box<Person002> set different value and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Person002> = new Box<Person002>({name: "first", age: 5});
      box.set({name: "second", age: 15});
      let r: Person002 = box.get();
      expect(r.name).assertEqual("second");
      expect(r.age).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_2200
     * @tc.name testBoxGenericGetSetA022
     * @tc.desc Verify Box<Person002> instance isolation - two boxes set differently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<Person002> = new Box<Person002>({name: "A0", age: 0});
      let boxB: Box<Person002> = new Box<Person002>({name: "B0", age: 0});
      boxA.set({name: "Alice", age: 25});
      boxB.set({name: "Bob", age: 30});
      expect(boxA.get().name).assertEqual("Alice");
      expect(boxB.get().name).assertEqual("Bob");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_2300
     * @tc.name testBoxGenericGetSetA023
     * @tc.desc Verify Box<Person002> set return value preserves input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Person002> = new Box<Person002>({name: "init", age: 1});
      let input: Person002 = {name: "ret", age: 99};
      let ret: Person002 = box.set(input);
      expect(ret === input).assertTrue();
      expect(ret.name).assertEqual("ret");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_2400
     * @tc.name testBoxGenericGetSetA024
     * @tc.desc Verify Box<Person002> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Person002> = new Box<Person002>({name: "z", age: 0});
      box.set({name: "a", age: 1});
      box.set({name: "b", age: 2});
      box.set({name: "c", age: 3});
      expect(box.get().name).assertEqual("c");
      expect(box.get().age).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_2500
     * @tc.name testBoxGenericGetSetA025
     * @tc.desc Verify Box<Date> set new timestamp and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Date> = new Box<Date>(new Date(0));
      box.set(new Date(3000000));
      expect(box.get().getTime()).assertEqual(3000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_2600
     * @tc.name testBoxGenericGetSetA026
     * @tc.desc Verify Box<Date> set different timestamp and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Date> = new Box<Date>(new Date(1000));
      box.set(new Date(4000000));
      expect(box.get().getTime()).assertEqual(4000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_2700
     * @tc.name testBoxGenericGetSetA027
     * @tc.desc Verify Box<Date> instance isolation - two boxes set differently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<Date> = new Box<Date>(new Date(0));
      let boxB: Box<Date> = new Box<Date>(new Date(0));
      boxA.set(new Date(5000000));
      boxB.set(new Date(6000000));
      expect(boxA.get().getTime()).assertEqual(5000000);
      expect(boxB.get().getTime()).assertEqual(6000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_2800
     * @tc.name testBoxGenericGetSetA028
     * @tc.desc Verify Box<Date> set return value identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Date> = new Box<Date>(new Date(0));
      let d: Date = new Date(7000000);
      let ret: Date = box.set(d);
      expect(ret.getTime()).assertEqual(7000000);
      expect(ret === d).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_2900
     * @tc.name testBoxGenericGetSetA029
     * @tc.desc Verify Box<Date> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Date> = new Box<Date>(new Date(0));
      box.set(new Date(100));
      box.set(new Date(200));
      box.set(new Date(300));
      expect(box.get().getTime()).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_3000
     * @tc.name testBoxGenericGetSetA030
     * @tc.desc Verify Box<RegExp> set new pattern and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<RegExp> = new Box<RegExp>(new RegExp("old", "g"));
      box.set(new RegExp("new", "i"));
      expect(box.get().source).assertEqual("new");
      expect(box.get().flags).assertEqual("i");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_3100
     * @tc.name testBoxGenericGetSetA031
     * @tc.desc Verify Box<RegExp> set different pattern and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<RegExp> = new Box<RegExp>(new RegExp("first", "g"));
      box.set(new RegExp("second", "m"));
      expect(box.get().source).assertEqual("second");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_3200
     * @tc.name testBoxGenericGetSetA032
     * @tc.desc Verify Box<RegExp> instance isolation - two boxes set differently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<RegExp> = new Box<RegExp>(new RegExp("a", "g"));
      let boxB: Box<RegExp> = new Box<RegExp>(new RegExp("b", "g"));
      boxA.set(new RegExp("alpha", "i"));
      boxB.set(new RegExp("beta", "g"));
      expect(boxA.get().source).assertEqual("alpha");
      expect(boxB.get().source).assertEqual("beta");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_3300
     * @tc.name testBoxGenericGetSetA033
     * @tc.desc Verify Box<RegExp> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<RegExp> = new Box<RegExp>(new RegExp("init", "g"));
      let re: RegExp = new RegExp("return", "g");
      let ret: RegExp = box.set(re);
      expect(ret === re).assertTrue();
      expect(ret.source).assertEqual("return");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_3400
     * @tc.name testBoxGenericGetSetA034
     * @tc.desc Verify Box<RegExp> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<RegExp> = new Box<RegExp>(new RegExp("start", "g"));
      box.set(new RegExp("mid", "i"));
      box.set(new RegExp("final", "g"));
      expect(box.get().source).assertEqual("final");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_3500
     * @tc.name testBoxGenericGetSetA035
     * @tc.desc Verify Box<Map<string,int>> set new map and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Map<string, int>> = new Box<Map<string, int>>(new Map<string, int>());
      let m: Map<string, int> = new Map<string, int>();
      m.set("x", 100);
      box.set(m);
      expect(box.get().get("x")).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_3600
     * @tc.name testBoxGenericGetSetA036
     * @tc.desc Verify Box<Map<string,int>> set different map and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Map<string, int>> = new Box<Map<string, int>>(new Map<string, int>());
      let m: Map<string, int> = new Map<string, int>();
      m.set("y", 200);
      m.set("z", 300);
      box.set(m);
      expect(box.get().size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_3700
     * @tc.name testBoxGenericGetSetA037
     * @tc.desc Verify Box<Map<string,int>> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<Map<string, int>> = new Box<Map<string, int>>(new Map<string, int>());
      let boxB: Box<Map<string, int>> = new Box<Map<string, int>>(new Map<string, int>());
      let mA: Map<string, int> = new Map<string, int>();
      mA.set("A", 1);
      let mB: Map<string, int> = new Map<string, int>();
      mB.set("B", 2);
      boxA.set(mA);
      boxB.set(mB);
      expect(boxA.get().get("A")).assertEqual(1);
      expect(boxB.get().get("B")).assertEqual(2);
      expect(boxA.get() !== boxB.get()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_3800
     * @tc.name testBoxGenericGetSetA038
     * @tc.desc Verify Box<Map<string,int>> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Map<string, int>> = new Box<Map<string, int>>(new Map<string, int>());
      let m: Map<string, int> = new Map<string, int>();
      let ret: Map<string, int> = box.set(m);
      expect(ret === m).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_3900
     * @tc.name testBoxGenericGetSetA039
     * @tc.desc Verify Box<Map<string,int>> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Map<string, int>> = new Box<Map<string, int>>(new Map<string, int>());
      let mA: Map<string, int> = new Map<string, int>();
      mA.set("k", 1);
      let mB: Map<string, int> = new Map<string, int>();
      mB.set("k", 2);
      let mC: Map<string, int> = new Map<string, int>();
      mC.set("k", 3);
      box.set(mA);
      box.set(mB);
      box.set(mC);
      expect(box.get().get("k")).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_4000
     * @tc.name testBoxGenericGetSetA040
     * @tc.desc Verify Box<Set<int>> set new set and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Set<int>> = new Box<Set<int>>(new Set<int>());
      let s: Set<int> = new Set<int>();
      s.add(50);
      s.add(60);
      box.set(s);
      expect(box.get().size).assertEqual(2);
      expect(box.get().has(50)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_4100
     * @tc.name testBoxGenericGetSetA041
     * @tc.desc Verify Box<Set<int>> set different set and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Set<int>> = new Box<Set<int>>(new Set<int>());
      let s: Set<int> = new Set<int>();
      s.add(100);
      box.set(s);
      expect(box.get().has(100)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_4200
     * @tc.name testBoxGenericGetSetA042
     * @tc.desc Verify Box<Set<int>> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<Set<int>> = new Box<Set<int>>(new Set<int>());
      let boxB: Box<Set<int>> = new Box<Set<int>>(new Set<int>());
      let sA: Set<int> = new Set<int>();
      sA.add(1);
      let sB: Set<int> = new Set<int>();
      sB.add(2);
      boxA.set(sA);
      boxB.set(sB);
      expect(boxA.get().has(1)).assertTrue();
      expect(boxB.get().has(1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_4300
     * @tc.name testBoxGenericGetSetA043
     * @tc.desc Verify Box<Set<int>> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Set<int>> = new Box<Set<int>>(new Set<int>());
      let s: Set<int> = new Set<int>();
      let ret: Set<int> = box.set(s);
      expect(ret === s).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_4400
     * @tc.name testBoxGenericGetSetA044
     * @tc.desc Verify Box<Set<int>> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Set<int>> = new Box<Set<int>>(new Set<int>());
      let sA: Set<int> = new Set<int>();
      sA.add(1);
      let sB: Set<int> = new Set<int>();
      sB.add(2);
      let sC: Set<int> = new Set<int>();
      sC.add(3);
      box.set(sA);
      box.set(sB);
      box.set(sC);
      expect(box.get().has(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_4500
     * @tc.name testBoxGenericGetSetA045
     * @tc.desc Verify Box<int[]> set new array and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<int[]> = new Box<int[]>([0]);
      box.set([11, 22, 33]);
      expect(box.get().length).assertEqual(3);
      expect(box.get()[1]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_4600
     * @tc.name testBoxGenericGetSetA046
     * @tc.desc Verify Box<int[]> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<int[]> = new Box<int[]>([0]);
      let boxB: Box<int[]> = new Box<int[]>([0]);
      boxA.set([100, 200]);
      boxB.set([300, 400]);
      expect(boxA.get()[0]).assertEqual(100);
      expect(boxB.get()[0]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_4700
     * @tc.name testBoxGenericGetSetA047
     * @tc.desc Verify Box<int[]> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<int[]> = new Box<int[]>([0]);
      let arr: int[] = [5, 6, 7];
      let ret: int[] = box.set(arr);
      expect(ret === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_4800
     * @tc.name testBoxGenericGetSetA048
     * @tc.desc Verify Box<int[]> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<int[]> = new Box<int[]>([-1]);
      box.set([1, 2]);
      box.set([3, 4]);
      box.set([5, 6]);
      expect(box.get()[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_4900
     * @tc.name testBoxGenericGetSetA049
     * @tc.desc Verify Box<Promise<int>> set new promise and verify identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Promise<int>> = new Box<Promise<int>>(Promise.resolve(1));
      let p: Promise<int> = Promise.resolve(2);
      box.set(p);
      expect(box.get() === p).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_5000
     * @tc.name testBoxGenericGetSetA050
     * @tc.desc Verify Box<Promise<int>> set different promise and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Promise<int>> = new Box<Promise<int>>(Promise.resolve(0));
      let p: Promise<int> = Promise.resolve(99);
      box.set(p);
      expect(box.get()).assertEqual(p);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_5100
     * @tc.name testBoxGenericGetSetA051
     * @tc.desc Verify Box<Promise<int>> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<Promise<int>> = new Box<Promise<int>>(Promise.resolve(1));
      let boxB: Box<Promise<int>> = new Box<Promise<int>>(Promise.resolve(2));
      let pA: Promise<int> = Promise.resolve(10);
      let pB: Promise<int> = Promise.resolve(20);
      boxA.set(pA);
      boxB.set(pB);
      expect(boxA.get() === pA).assertTrue();
      expect(boxB.get() === pB).assertTrue();
      expect(boxA.get() !== boxB.get()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_5200
     * @tc.name testBoxGenericGetSetA052
     * @tc.desc Verify Box<Promise<int>> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Promise<int>> = new Box<Promise<int>>(Promise.resolve(0));
      let p: Promise<int> = Promise.resolve(50);
      let ret: Promise<int> = box.set(p);
      expect(ret === p).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_5300
     * @tc.name testBoxGenericGetSetA053
     * @tc.desc Verify Box<Promise<int>> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Promise<int>> = new Box<Promise<int>>(Promise.resolve(0));
      let pA: Promise<int> = Promise.resolve(1);
      let pB: Promise<int> = Promise.resolve(2);
      let pC: Promise<int> = Promise.resolve(3);
      box.set(pA);
      box.set(pB);
      box.set(pC);
      expect(box.get() === pC).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_5400
     * @tc.name testBoxGenericGetSetA054
     * @tc.desc Verify Box<Error> set new error and verify message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Error> = new Box<Error>(new Error("first"));
      box.set(new Error("second"));
      expect(box.get().message).assertEqual("second");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_5500
     * @tc.name testBoxGenericGetSetA055
     * @tc.desc Verify Box<Error> set different error and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Error> = new Box<Error>(new Error("old"));
      box.set(new Error("newer"));
      expect(box.get().message).assertEqual("newer");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_5600
     * @tc.name testBoxGenericGetSetA056
     * @tc.desc Verify Box<Error> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<Error> = new Box<Error>(new Error("a0"));
      let boxB: Box<Error> = new Box<Error>(new Error("b0"));
      boxA.set(new Error("errA"));
      boxB.set(new Error("errB"));
      expect(boxA.get().message).assertEqual("errA");
      expect(boxB.get().message).assertEqual("errB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_5700
     * @tc.name testBoxGenericGetSetA057
     * @tc.desc Verify Box<Error> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Error> = new Box<Error>(new Error("init"));
      let e: Error = new Error("retVal");
      let ret: Error = box.set(e);
      expect(ret.message).assertEqual("retVal");
      expect(ret === e).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_5800
     * @tc.name testBoxGenericGetSetA058
     * @tc.desc Verify Box<Error> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Error> = new Box<Error>(new Error("start"));
      box.set(new Error("a"));
      box.set(new Error("b"));
      box.set(new Error("c"));
      expect(box.get().message).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_5900
     * @tc.name testBoxGenericGetSetA059
     * @tc.desc Verify Box<TypeError> set new TypeError and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<TypeError> = new Box<TypeError>(new TypeError("invalid"));
      box.set(new TypeError("invalid"));
      expect(box.get().message).assertEqual("invalid");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_6000
     * @tc.name testBoxGenericGetSetA060
     * @tc.desc Verify Box<TypeError> set different TypeError and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<TypeError> = new Box<TypeError>(new TypeError("invalid"));
      box.set(new TypeError("invalid"));
      expect(box.get().message).assertEqual("invalid");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_6100
     * @tc.name testBoxGenericGetSetA061
     * @tc.desc Verify Box<TypeError> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<TypeError> = new Box<TypeError>(new TypeError("invalid"));
      let boxB: Box<TypeError> = new Box<TypeError>(new TypeError("invalid"));
      boxA.set(new TypeError("invalid"));
      boxB.set(new TypeError("invalid"));
      expect(boxA.get().message).assertEqual("invalid");
      expect(boxB.get().message).assertEqual("invalid");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_6200
     * @tc.name testBoxGenericGetSetA062
     * @tc.desc Verify Box<TypeError> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<TypeError> = new Box<TypeError>(new TypeError("invalid"));
      let u: TypeError = new TypeError("invalid");
      let ret: TypeError = box.set(u);
      expect(ret.message).assertEqual("invalid");
      expect(ret === u).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_6300
     * @tc.name testBoxGenericGetSetA063
     * @tc.desc Verify Box<TypeError> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<TypeError> = new Box<TypeError>(new TypeError("err_a"));
      box.set(new TypeError("err_b"));
      expect(box.get().message).assertEqual("err_b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_6400
     * @tc.name testBoxGenericGetSetA064
     * @tc.desc Verify Box<RangeError> set new buffer and verify size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<RangeError> = new Box<RangeError>(new RangeError("range"));
      box.set(new RangeError("range"));
      expect(box.get().message).assertEqual("range");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_6500
     * @tc.name testBoxGenericGetSetA065
     * @tc.desc Verify Box<RangeError> set different buffer and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<RangeError> = new Box<RangeError>(new RangeError("range"));
      box.set(new RangeError("range"));
      expect(box.get().message).assertEqual("range");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_6600
     * @tc.name testBoxGenericGetSetA066
     * @tc.desc Verify Box<RangeError> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<RangeError> = new Box<RangeError>(new RangeError("range"));
      let boxB: Box<RangeError> = new Box<RangeError>(new RangeError("range"));
      boxA.set(new RangeError("range"));
      boxB.set(new RangeError("range"));
      expect(boxA.get().message).assertEqual("range");
      expect(boxB.get().message).assertEqual("range");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_6700
     * @tc.name testBoxGenericGetSetA067
     * @tc.desc Verify Box<RangeError> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<RangeError> = new Box<RangeError>(new RangeError("range"));
      let buf: RangeError = new RangeError("range");
      let ret: RangeError = box.set(buf);
      expect(ret.message).assertEqual("range");
      expect(ret === buf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_6800
     * @tc.name testBoxGenericGetSetA068
     * @tc.desc Verify Box<RangeError> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<RangeError> = new Box<RangeError>(new RangeError("range"));
      box.set(new RangeError("range"));
      box.set(new RangeError("range"));
      box.set(new RangeError("range"));
      expect(box.get().message).assertEqual("range");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_6900
     * @tc.name testBoxGenericGetSetA069
     * @tc.desc Verify Box<bigint> set new value and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<bigint> = new Box<bigint>(10n);
      box.set(20n);
      expect(box.get()).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_7000
     * @tc.name testBoxGenericGetSetA070
     * @tc.desc Verify Box<bigint> set different value and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<bigint> = new Box<bigint>(5n);
      box.set(500n);
      expect(box.get()).assertEqual(500n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_7100
     * @tc.name testBoxGenericGetSetA071
     * @tc.desc Verify Box<bigint> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<bigint> = new Box<bigint>(1n);
      let boxB: Box<bigint> = new Box<bigint>(2n);
      boxA.set(100n);
      boxB.set(200n);
      expect(boxA.get()).assertEqual(100n);
      expect(boxB.get()).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_7200
     * @tc.name testBoxGenericGetSetA072
     * @tc.desc Verify Box<bigint> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<bigint> = new Box<bigint>(0n);
      let ret: bigint = box.set(777n);
      expect(ret).assertEqual(777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_7300
     * @tc.name testBoxGenericGetSetA073
     * @tc.desc Verify Box<bigint> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<bigint> = new Box<bigint>(0n);
      box.set(111n);
      box.set(222n);
      box.set(333n);
      expect(box.get()).assertEqual(333n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_7400
     * @tc.name testBoxGenericGetSetA074
     * @tc.desc Verify Box<bigint> set and get with value exceeding Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<bigint> = new Box<bigint>(0n);
      let ret: bigint = box.set(12345678901234567890n);
      expect(ret).assertEqual(12345678901234567890n);
      expect(box.get()).assertEqual(12345678901234567890n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_7500
     * @tc.name testBoxGenericGetSetA075
     * @tc.desc Verify Box<bigint> arithmetic operations through get-set pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<bigint> = new Box<bigint>(10000000000000000000n);
      box.set(box.get() + 1n);
      expect(box.get()).assertEqual(10000000000000000001n);
      box.set(box.get() - 1n);
      expect(box.get()).assertEqual(10000000000000000000n);
      box.set(box.get() * 2n);
      expect(box.get()).assertEqual(20000000000000000000n);
      box.set(box.get() / 2n);
      expect(box.get()).assertEqual(10000000000000000000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_7600
     * @tc.name testBoxGenericGetSetA076
     * @tc.desc Verify Box<bigint> set return value used as input for subsequent set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<bigint> = new Box<bigint>(0n);
      let v: bigint = box.set(7n);
      v = box.set(v + 1n);
      v = box.set(v + 1n);
      expect(box.get()).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_7700
     * @tc.name testBoxGenericGetSetA077
     * @tc.desc Verify Box<bigint> value preserved after try-finally execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<bigint> = new Box<bigint>(0n);
      try {
        box.set(10000000000000000000n);
      } finally {
      }
      expect(box.get()).assertEqual(10000000000000000000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_7800
     * @tc.name testBoxGenericGetSetA078
     * @tc.desc Verify Box<bigint> value set in finally overrides catch block value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<bigint> = new Box<bigint>(100n);
      try {
        let x: int = 0;
        let y: int = 1 / x;
      } catch (e) {
        box.set(200n);
      } finally {
        box.set(300n);
      }
      expect(box.get()).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_7900
     * @tc.name testBoxGenericGetSetA079
     * @tc.desc Verify multiple Box<bigint> instances created via factory method remain independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: Box<bigint> = Box.box<bigint>(10000000000000000000n);
      let box2: Box<bigint> = Box.box<bigint>(20000000000000000000n);
      expect(box1.get()).assertEqual(10000000000000000000n);
      expect(box2.get()).assertEqual(20000000000000000000n);
      box2.set(30000000000000000000n);
      expect(box1.get()).assertEqual(10000000000000000000n);
      expect(box2.get()).assertEqual(30000000000000000000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_1_8000
     * @tc.name testBoxGenericGetSetA080
     * @tc.desc Verify relational comparison between two independent Box<bigint> values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetA080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box1: Box<bigint> = new Box<bigint>(5000000000000000000n);
      let box2: Box<bigint> = new Box<bigint>(3000000000000000000n);
      expect(box1.get() > box2.get()).assertTrue();
      expect(box2.get() < box1.get()).assertTrue();
      box2.set(7000000000000000000n);
      expect(box1.get() < box2.get()).assertTrue();
      expect(box2.get() > box1.get()).assertTrue();
    });

  });
}
