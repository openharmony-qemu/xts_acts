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
import { NullableInt029, NullableString030, IntOrString031, MultiUnion032,
  BoxIntArray034, StringBoxIntMap035, BoxStringSet036, BoxIntArray037,
  NestedBox038, MarkerInterface039, Person002 }
  from '../Util.test';

class MarkerImpl039 implements MarkerInterface039 {}

export default function BoxGenericGetSetTest3(): void {
  describe('BoxGenericGetSetTest3', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_0100
     * @tc.name testBoxGenericGetSetC001
     * @tc.desc Verify Box<NullableInt029> set/get: init null, set 42, get 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableInt029> = new Box<NullableInt029>(null);
      let v1: NullableInt029 = box.get();
      expect(v1).assertEqual(null);
      box.set(42);
      let v2: NullableInt029 = box.get();
      expect(v2).assertEqual(42);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_0200
     * @tc.name testBoxGenericGetSetC002
     * @tc.desc Verify Box<NullableString030> set/get: init null, set "hello", get "hello"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableString030> = new Box<NullableString030>(null);
      let v1: NullableString030 = box.get();
      expect(v1).assertEqual(null);
      box.set("hello");
      let v2: NullableString030 = box.get();
      expect(v2).assertEqual("hello");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_0300
     * @tc.name testBoxGenericGetSetC003
     * @tc.desc Verify Box<IntOrString031> set/get across union members: int 100, set string "world"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntOrString031> = new Box<IntOrString031>(100);
      let v1: IntOrString031 = box.get();
      expect(v1).assertEqual(100);
      box.set("world");
      let v2: IntOrString031 = box.get();
      expect(v2).assertEqual("world");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_0400
     * @tc.name testBoxGenericGetSetC004
     * @tc.desc Verify Box<MultiUnion032> set/get across all three union members: boolean -> int -> string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<MultiUnion032> = new Box<MultiUnion032>(true);
      let v1: MultiUnion032 = box.get();
      expect(v1).assertEqual(true);
      box.set(42);
      let v2: MultiUnion032 = box.get();
      expect(v2).assertEqual(42);
      box.set("str");
      let v3: MultiUnion032 = box.get();
      expect(v3).assertEqual("str");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_0500
     * @tc.name testBoxGenericGetSetC005
     * @tc.desc Verify Box<Promise<void>> set/get retains Promise reference identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Promise<void> = Promise.resolve();
      let box: Box<Promise<void>> = new Box<Promise<void>>(p);
      let v1: Promise<void> = box.get();
      expect(v1).assertEqual(p);
      let p2: Promise<void> = Promise.resolve();
      box.set(p2);
      let v2: Promise<void> = box.get();
      expect(v2).assertEqual(p2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_0600
     * @tc.name testBoxGenericGetSetC006
     * @tc.desc Verify Box<Box<int>[]> set/get stores array of Box<int> and replaces correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: BoxIntArray034 = [new Box<int>(1), new Box<int>(2)];
      let box: Box<BoxIntArray034> = new Box<BoxIntArray034>(arr);
      let v1: BoxIntArray034 = box.get();
      expect(v1.length).assertEqual(2);
      expect(v1[0].get()).assertEqual(1);
      let newArr: BoxIntArray034 = [new Box<int>(3)];
      box.set(newArr);
      let v2: BoxIntArray034 = box.get();
      expect(v2.length).assertEqual(1);
      expect(v2[0].get()).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_0700
     * @tc.name testBoxGenericGetSetC007
     * @tc.desc Verify Box<Map<string, Box<int>>> set/get stores and replaces map correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: StringBoxIntMap035 = new Map<string, Box<int>>();
      map.set("a", new Box<int>(1));
      let box: Box<StringBoxIntMap035> = new Box<StringBoxIntMap035>(map);
      let v1: StringBoxIntMap035 = box.get();
      expect(v1.has("a")).assertEqual(true);
      let newMap: StringBoxIntMap035 = new Map<string, Box<int>>();
      box.set(newMap);
      let v2: StringBoxIntMap035 = box.get();
      expect(v2.has("a")).assertEqual(false);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_0800
     * @tc.name testBoxGenericGetSetC008
     * @tc.desc Verify Box<Set<Box<string>>> set/get stores and replaces set correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set: BoxStringSet036 = new Set<Box<string>>();
      let sb: Box<string> = new Box<string>("x");
      set.add(sb);
      let box: Box<BoxStringSet036> = new Box<BoxStringSet036>(set);
      let v1: BoxStringSet036 = box.get();
      expect(v1.has(sb)).assertEqual(true);
      let newSet: BoxStringSet036 = new Set<Box<string>>();
      box.set(newSet);
      let v2: BoxStringSet036 = box.get();
      expect(v2.has(sb)).assertEqual(false);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_0900
     * @tc.name testBoxGenericGetSetC009
     * @tc.desc Verify Box<Array<Box<int>>> set/get stores and replaces Array<Box<int>> correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: BoxIntArray037 = new Array<Box<int>>();
      arr.push(new Box<int>(10));
      let box: Box<BoxIntArray037> = new Box<BoxIntArray037>(arr);
      let v1: BoxIntArray037 = box.get();
      expect(v1.length).assertEqual(1);
      expect(v1[0].get()).assertEqual(10);
      let newArr: BoxIntArray037 = new Array<Box<int>>();
      newArr.push(new Box<int>(20));
      newArr.push(new Box<int>(30));
      box.set(newArr);
      let v2: BoxIntArray037 = box.get();
      expect(v2.length).assertEqual(2);
      expect(v2[1].get()).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_1000
     * @tc.name testBoxGenericGetSetC010
     * @tc.desc Verify Box<Box<Box<int>>> set/get preserves nested Box<int> value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Box<int> = new Box<int>(5);
      let box: Box<NestedBox038> = new Box<NestedBox038>(new Box<Box<int>>(inner));
      let result: NestedBox038 = box.get();
      expect(result.get().get()).assertEqual(5);
      box.set(new Box<Box<int>>(new Box<int>(99)));
      expect(box.get().get().get()).assertEqual(99);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_1100
     * @tc.name testBoxGenericGetSetC011
     * @tc.desc Verify Box<MarkerInterface039> set/get with local MarkerImpl039
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let impl: MarkerImpl039 = new MarkerImpl039();
      let box: Box<MarkerInterface039> = new Box<MarkerInterface039>(impl);
      let v1: MarkerInterface039 = box.get();
      expect(v1).assertEqual(impl);
      let impl2: MarkerImpl039 = new MarkerImpl039();
      box.set(impl2);
      let v2: MarkerInterface039 = box.get();
      expect(v2).assertEqual(impl2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_1200
     * @tc.name testBoxGenericGetSetC012
     * @tc.desc Verify Box<NullableInt029> set new value 100 and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableInt029> = new Box<NullableInt029>(null);
      box.set(100);
      expect(box.get()).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_1300
     * @tc.name testBoxGenericGetSetC013
     * @tc.desc Verify Box<NullableInt029> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<NullableInt029> = new Box<NullableInt029>(null);
      let boxB: Box<NullableInt029> = new Box<NullableInt029>(null);
      boxA.set(200);
      boxB.set(300);
      expect(boxA.get()).assertEqual(200);
      expect(boxB.get()).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_1400
     * @tc.name testBoxGenericGetSetC014
     * @tc.desc Verify Box<NullableInt029> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableInt029> = new Box<NullableInt029>(null);
      let ret: NullableInt029 = box.set(777);
      expect(ret).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_1500
     * @tc.name testBoxGenericGetSetC015
     * @tc.desc Verify Box<NullableInt029> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableInt029> = new Box<NullableInt029>(null);
      box.set(1);
      box.set(2);
      box.set(3);
      expect(box.get()).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_1600
     * @tc.name testBoxGenericGetSetC016
     * @tc.desc Verify Box<NullableString030> set new value and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableString030> = new Box<NullableString030>(null);
      box.set("world");
      expect(box.get()).assertEqual("world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_1700
     * @tc.name testBoxGenericGetSetC017
     * @tc.desc Verify Box<NullableString030> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<NullableString030> = new Box<NullableString030>(null);
      let boxB: Box<NullableString030> = new Box<NullableString030>(null);
      boxA.set("foo");
      boxB.set("bar");
      expect(boxA.get()).assertEqual("foo");
      expect(boxB.get()).assertEqual("bar");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_1800
     * @tc.name testBoxGenericGetSetC018
     * @tc.desc Verify Box<NullableString030> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableString030> = new Box<NullableString030>(null);
      let ret: NullableString030 = box.set("returnVal");
      expect(ret).assertEqual("returnVal");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_1900
     * @tc.name testBoxGenericGetSetC019
     * @tc.desc Verify Box<NullableString030> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableString030> = new Box<NullableString030>(null);
      box.set("a");
      box.set("b");
      box.set("c");
      expect(box.get()).assertEqual("c");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_2000
     * @tc.name testBoxGenericGetSetC020
     * @tc.desc Verify Box<IntOrString031> set new union value and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntOrString031> = new Box<IntOrString031>(0);
      box.set("newValue");
      expect(box.get()).assertEqual("newValue");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_2100
     * @tc.name testBoxGenericGetSetC021
     * @tc.desc Verify Box<IntOrString031> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<IntOrString031> = new Box<IntOrString031>(0);
      let boxB: Box<IntOrString031> = new Box<IntOrString031>(0);
      boxA.set(500);
      boxB.set("str");
      expect(boxA.get()).assertEqual(500);
      expect(boxB.get()).assertEqual("str");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_2200
     * @tc.name testBoxGenericGetSetC022
     * @tc.desc Verify Box<IntOrString031> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntOrString031> = new Box<IntOrString031>(0);
      let ret: IntOrString031 = box.set(42);
      expect(ret).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_2300
     * @tc.name testBoxGenericGetSetC023
     * @tc.desc Verify Box<IntOrString031> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntOrString031> = new Box<IntOrString031>(0);
      box.set(10);
      box.set(20);
      box.set(30);
      expect(box.get()).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_2400
     * @tc.name testBoxGenericGetSetC024
     * @tc.desc Verify Box<MultiUnion032> set new union value and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<MultiUnion032> = new Box<MultiUnion032>(false);
      box.set(999);
      expect(box.get()).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_2500
     * @tc.name testBoxGenericGetSetC025
     * @tc.desc Verify Box<MultiUnion032> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<MultiUnion032> = new Box<MultiUnion032>(0);
      let boxB: Box<MultiUnion032> = new Box<MultiUnion032>(false);
      boxA.set("hello");
      boxB.set(true);
      expect(boxA.get()).assertEqual("hello");
      expect(boxB.get()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_2600
     * @tc.name testBoxGenericGetSetC026
     * @tc.desc Verify Box<MultiUnion032> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<MultiUnion032> = new Box<MultiUnion032>(0);
      let ret: MultiUnion032 = box.set("return");
      expect(ret).assertEqual("return");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_2700
     * @tc.name testBoxGenericGetSetC027
     * @tc.desc Verify Box<MultiUnion032> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<MultiUnion032> = new Box<MultiUnion032>(0);
      box.set("first");
      box.set(false);
      box.set(77);
      expect(box.get()).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_2800
     * @tc.name testBoxGenericGetSetC028
     * @tc.desc Verify Box<Promise<void>> set new promise and verify identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Promise<void>> = new Box<Promise<void>>(Promise.resolve());
      let p: Promise<void> = Promise.resolve();
      box.set(p);
      expect(box.get() === p).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_2900
     * @tc.name testBoxGenericGetSetC029
     * @tc.desc Verify Box<Promise<void>> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<Promise<void>> = new Box<Promise<void>>(Promise.resolve());
      let boxB: Box<Promise<void>> = new Box<Promise<void>>(Promise.resolve());
      let pA: Promise<void> = Promise.resolve();
      let pB: Promise<void> = Promise.resolve();
      boxA.set(pA);
      boxB.set(pB);
      expect(boxA.get() === pA).assertTrue();
      expect(boxB.get() === pB).assertTrue();
      expect(boxA.get() !== boxB.get()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_3000
     * @tc.name testBoxGenericGetSetC030
     * @tc.desc Verify Box<Promise<void>> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Promise<void>> = new Box<Promise<void>>(Promise.resolve());
      let p: Promise<void> = Promise.resolve();
      let ret: Promise<void> = box.set(p);
      expect(ret === p).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_3100
     * @tc.name testBoxGenericGetSetC031
     * @tc.desc Verify Box<Promise<void>> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Promise<void>> = new Box<Promise<void>>(Promise.resolve());
      let pA: Promise<void> = Promise.resolve();
      let pB: Promise<void> = Promise.resolve();
      let pC: Promise<void> = Promise.resolve();
      box.set(pA);
      box.set(pB);
      box.set(pC);
      expect(box.get() === pC).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_3200
     * @tc.name testBoxGenericGetSetC032
     * @tc.desc Verify Box<Box<int>[]> set new array and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<BoxIntArray034> = new Box<BoxIntArray034>([new Box<int>(0)]);
      box.set([new Box<int>(50), new Box<int>(60)]);
      expect(box.get().length).assertEqual(2);
      expect(box.get()[1].get()).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_3300
     * @tc.name testBoxGenericGetSetC033
     * @tc.desc Verify Box<Box<int>[]> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<BoxIntArray034> = new Box<BoxIntArray034>([new Box<int>(0)]);
      let boxB: Box<BoxIntArray034> = new Box<BoxIntArray034>([new Box<int>(0)]);
      boxA.set([new Box<int>(100)]);
      boxB.set([new Box<int>(200)]);
      expect(boxA.get()[0].get()).assertEqual(100);
      expect(boxB.get()[0].get()).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_3400
     * @tc.name testBoxGenericGetSetC034
     * @tc.desc Verify Box<Box<int>[]> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<BoxIntArray034> = new Box<BoxIntArray034>([new Box<int>(0)]);
      let arr: BoxIntArray034 = [new Box<int>(1), new Box<int>(2)];
      let ret: BoxIntArray034 = box.set(arr);
      expect(ret === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_3500
     * @tc.name testBoxGenericGetSetC035
     * @tc.desc Verify Box<Box<int>[]> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<BoxIntArray034> = new Box<BoxIntArray034>([new Box<int>(0)]);
      box.set([new Box<int>(1)]);
      box.set([new Box<int>(2)]);
      box.set([new Box<int>(3)]);
      expect(box.get()[0].get()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_3600
     * @tc.name testBoxGenericGetSetC036
     * @tc.desc Verify Box<Map<string,Box<int>>> set new map and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<StringBoxIntMap035> = new Box<StringBoxIntMap035>(new Map<string, Box<int>>());
      let m: StringBoxIntMap035 = new Map<string, Box<int>>();
      m.set("k", new Box<int>(55));
      box.set(m);
      expect(box.get().has("k")).assertTrue();
      let v: Box<int> | undefined = box.get().get("k");
      expect(v !== undefined).assertTrue();
      if (v !== undefined) {
        expect(v.get()).assertEqual(55);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_3700
     * @tc.name testBoxGenericGetSetC037
     * @tc.desc Verify Box<Map<string,Box<int>>> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<StringBoxIntMap035> = new Box<StringBoxIntMap035>(new Map<string, Box<int>>());
      let boxB: Box<StringBoxIntMap035> = new Box<StringBoxIntMap035>(new Map<string, Box<int>>());
      let mA: StringBoxIntMap035 = new Map<string, Box<int>>();
      mA.set("A", new Box<int>(1));
      let mB: StringBoxIntMap035 = new Map<string, Box<int>>();
      mB.set("B", new Box<int>(2));
      boxA.set(mA);
      boxB.set(mB);
      expect(boxA.get().has("A")).assertTrue();
      let _gbx1: Box<int> | undefined = boxA.get().get("A");
      expect(_gbx1 !== undefined).assertTrue();
      if (_gbx1 !== undefined) {
        expect(_gbx1.get()).assertEqual(1);
      }
      expect(boxB.get().has("B")).assertTrue();
      let _gbx2: Box<int> | undefined = boxB.get().get("B");
      expect(_gbx2 !== undefined).assertTrue();
      if (_gbx2 !== undefined) {
        expect(_gbx2.get()).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_3800
     * @tc.name testBoxGenericGetSetC038
     * @tc.desc Verify Box<Map<string,Box<int>>> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<StringBoxIntMap035> = new Box<StringBoxIntMap035>(new Map<string, Box<int>>());
      let m: StringBoxIntMap035 = new Map<string, Box<int>>();
      let ret: StringBoxIntMap035 = box.set(m);
      expect(ret === m).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_3900
     * @tc.name testBoxGenericGetSetC039
     * @tc.desc Verify Box<Map<string,Box<int>>> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<StringBoxIntMap035> = new Box<StringBoxIntMap035>(new Map<string, Box<int>>());
      let mA: StringBoxIntMap035 = new Map<string, Box<int>>();
      mA.set("x", new Box<int>(1));
      let mB: StringBoxIntMap035 = new Map<string, Box<int>>();
      mB.set("x", new Box<int>(2));
      let mC: StringBoxIntMap035 = new Map<string, Box<int>>();
      mC.set("x", new Box<int>(3));
      box.set(mA);
      box.set(mB);
      box.set(mC);
      expect(box.get().has("x")).assertTrue();
      let _gbx3: Box<int> | undefined = box.get().get("x");
      expect(_gbx3 !== undefined).assertTrue();
      if (_gbx3 !== undefined) {
        expect(_gbx3.get()).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_4000
     * @tc.name testBoxGenericGetSetC040
     * @tc.desc Verify Box<Set<Box<string>>> set new set and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<BoxStringSet036> = new Box<BoxStringSet036>(new Set<Box<string>>());
      let s: BoxStringSet036 = new Set<Box<string>>();
      let b: Box<string> = new Box<string>("val");
      s.add(b);
      box.set(s);
      expect(box.get().has(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_4100
     * @tc.name testBoxGenericGetSetC041
     * @tc.desc Verify Box<Set<Box<string>>> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<BoxStringSet036> = new Box<BoxStringSet036>(new Set<Box<string>>());
      let boxB: Box<BoxStringSet036> = new Box<BoxStringSet036>(new Set<Box<string>>());
      let sA: BoxStringSet036 = new Set<Box<string>>();
      let bA: Box<string> = new Box<string>("a");
      sA.add(bA);
      let sB: BoxStringSet036 = new Set<Box<string>>();
      let bB: Box<string> = new Box<string>("b");
      sB.add(bB);
      boxA.set(sA);
      boxB.set(sB);
      expect(boxA.get().has(bA)).assertTrue();
      expect(boxB.get().has(bB)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_4200
     * @tc.name testBoxGenericGetSetC042
     * @tc.desc Verify Box<Set<Box<string>>> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<BoxStringSet036> = new Box<BoxStringSet036>(new Set<Box<string>>());
      let s: BoxStringSet036 = new Set<Box<string>>();
      let ret: BoxStringSet036 = box.set(s);
      expect(ret === s).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_4300
     * @tc.name testBoxGenericGetSetC043
     * @tc.desc Verify Box<Set<Box<string>>> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<BoxStringSet036> = new Box<BoxStringSet036>(new Set<Box<string>>());
      let s: BoxStringSet036 = new Set<Box<string>>();
      s.add(new Box<string>("a"));
      s.add(new Box<string>("b"));
      let cBox: Box<string> = new Box<string>("c");
      s.add(cBox);
      box.set(s);
      expect(box.get().has(cBox)).assertTrue();
      expect(box.get().size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_4400
     * @tc.name testBoxGenericGetSetC044
     * @tc.desc Verify Box<Array<Box<int>>> set new array and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<BoxIntArray037> = new Box<BoxIntArray037>([]);
      let arr: BoxIntArray037 = [new Box<int>(11), new Box<int>(22)];
      box.set(arr);
      expect(box.get().length).assertEqual(2);
      expect(box.get()[0].get()).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_4500
     * @tc.name testBoxGenericGetSetC045
     * @tc.desc Verify Box<Array<Box<int>>> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<BoxIntArray037> = new Box<BoxIntArray037>([]);
      let boxB: Box<BoxIntArray037> = new Box<BoxIntArray037>([]);
      boxA.set([new Box<int>(100)]);
      boxB.set([new Box<int>(200)]);
      expect(boxA.get()[0].get()).assertEqual(100);
      expect(boxB.get()[0].get()).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_4600
     * @tc.name testBoxGenericGetSetC046
     * @tc.desc Verify Box<Array<Box<int>>> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<BoxIntArray037> = new Box<BoxIntArray037>([]);
      let arr: BoxIntArray037 = [new Box<int>(5)];
      let ret: BoxIntArray037 = box.set(arr);
      expect(ret === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_4700
     * @tc.name testBoxGenericGetSetC047
     * @tc.desc Verify Box<Array<Box<int>>> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<BoxIntArray037> = new Box<BoxIntArray037>([]);
      box.set([new Box<int>(1)]);
      box.set([new Box<int>(2)]);
      box.set([new Box<int>(3)]);
      expect(box.get()[0].get()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_4800
     * @tc.name testBoxGenericGetSetC048
     * @tc.desc Verify Box<NestedBox038> set new nested value and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NestedBox038> = new Box<NestedBox038>(new Box<Box<int>>(new Box<int>(0)));
      box.set(new Box<Box<int>>(new Box<int>(123)));
      expect(box.get().get().get()).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_4900
     * @tc.name testBoxGenericGetSetC049
     * @tc.desc Verify Box<NestedBox038> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<NestedBox038> = new Box<NestedBox038>(new Box<Box<int>>(new Box<int>(0)));
      let boxB: Box<NestedBox038> = new Box<NestedBox038>(new Box<Box<int>>(new Box<int>(0)));
      boxA.set(new Box<Box<int>>(new Box<int>(10)));
      boxB.set(new Box<Box<int>>(new Box<int>(20)));
      expect(boxA.get().get().get()).assertEqual(10);
      expect(boxB.get().get().get()).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_5000
     * @tc.name testBoxGenericGetSetC050
     * @tc.desc Verify Box<NestedBox038> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NestedBox038> = new Box<NestedBox038>(new Box<Box<int>>(new Box<int>(0)));
      let n: NestedBox038 = new Box<Box<int>>(new Box<int>(77));
      let ret: NestedBox038 = box.set(n);
      expect(ret === n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_5100
     * @tc.name testBoxGenericGetSetC051
     * @tc.desc Verify Box<NestedBox038> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NestedBox038> = new Box<NestedBox038>(new Box<Box<int>>(new Box<int>(0)));
      box.set(new Box<Box<int>>(new Box<int>(1)));
      box.set(new Box<Box<int>>(new Box<int>(2)));
      box.set(new Box<Box<int>>(new Box<int>(3)));
      expect(box.get().get().get()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_5200
     * @tc.name testBoxGenericGetSetC052
     * @tc.desc Verify Box<MarkerInterface039> set new impl and verify identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<MarkerInterface039> = new Box<MarkerInterface039>(new MarkerImpl039());
      let impl: MarkerImpl039 = new MarkerImpl039();
      box.set(impl);
      expect(box.get() === impl).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_5300
     * @tc.name testBoxGenericGetSetC053
     * @tc.desc Verify Box<MarkerInterface039> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<MarkerInterface039> = new Box<MarkerInterface039>(new MarkerImpl039());
      let boxB: Box<MarkerInterface039> = new Box<MarkerInterface039>(new MarkerImpl039());
      let iA: MarkerImpl039 = new MarkerImpl039();
      let iB: MarkerImpl039 = new MarkerImpl039();
      boxA.set(iA);
      boxB.set(iB);
      expect(boxA.get() === iA).assertTrue();
      expect(boxB.get() === iB).assertTrue();
      expect(boxA.get() !== boxB.get()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_5400
     * @tc.name testBoxGenericGetSetC054
     * @tc.desc Verify Box<MarkerInterface039> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<MarkerInterface039> = new Box<MarkerInterface039>(new MarkerImpl039());
      let impl: MarkerImpl039 = new MarkerImpl039();
      let ret: MarkerInterface039 = box.set(impl);
      expect(ret === impl).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_5500
     * @tc.name testBoxGenericGetSetC055
     * @tc.desc Verify Box<MarkerInterface039> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<MarkerInterface039> = new Box<MarkerInterface039>(new MarkerImpl039());
      let a: MarkerImpl039 = new MarkerImpl039();
      let b: MarkerImpl039 = new MarkerImpl039();
      let c: MarkerImpl039 = new MarkerImpl039();
      box.set(a);
      box.set(b);
      box.set(c);
      expect(box.get() === c).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_5600
     * @tc.name testBoxGenericGetSetC056
     * @tc.desc Verify Box<NullableInt029> set with large value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableInt029> = new Box<NullableInt029>(null);
      box.set(5000);
      expect(box.get()).assertEqual(5000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_5700
     * @tc.name testBoxGenericGetSetC057
     * @tc.desc Verify Box<NullableString030> set with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableString030> = new Box<NullableString030>("prev");
      box.set("");
      expect(box.get()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_5800
     * @tc.name testBoxGenericGetSetC058
     * @tc.desc Verify Box<IntOrString031> set with zero int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntOrString031> = new Box<IntOrString031>("text");
      box.set(0);
      expect(box.get()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_5900
     * @tc.name testBoxGenericGetSetC059
     * @tc.desc Verify Box<MultiUnion032> set with false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<MultiUnion032> = new Box<MultiUnion032>(42);
      box.set(false);
      expect(box.get()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_6000
     * @tc.name testBoxGenericGetSetC060
     * @tc.desc Verify Box<Box<int>[]> set with single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<BoxIntArray034> = new Box<BoxIntArray034>([new Box<int>(0)]);
      box.set([new Box<int>(77)]);
      expect(box.get().length).assertEqual(1);
      expect(box.get()[0].get()).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_6100
     * @tc.name testBoxGenericGetSetC061
     * @tc.desc Verify Box<Map<string,Box<int>>> set with empty map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<StringBoxIntMap035> = new Box<StringBoxIntMap035>(new Map<string, Box<int>>());
      let m: StringBoxIntMap035 = new Map<string, Box<int>>();
      m.set("only", new Box<int>(42));
      box.set(m);
      expect(box.get().size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_6200
     * @tc.name testBoxGenericGetSetC062
     * @tc.desc Verify Box<Set<Box<string>>> set with multiple values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<BoxStringSet036> = new Box<BoxStringSet036>(new Set<Box<string>>());
      let s: BoxStringSet036 = new Set<Box<string>>();
      let b1: Box<string> = new Box<string>("x");
      let b2: Box<string> = new Box<string>("y");
      s.add(b1);
      s.add(b2);
      box.set(s);
      expect(box.get().size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_6300
     * @tc.name testBoxGenericGetSetC063
     * @tc.desc Verify Box<NestedBox038> set with large nested value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NestedBox038> = new Box<NestedBox038>(new Box<Box<int>>(new Box<int>(0)));
      box.set(new Box<Box<int>>(new Box<int>(9999)));
      expect(box.get().get().get()).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_6400
     * @tc.name testBoxGenericGetSetC064
     * @tc.desc Verify Box<MarkerInterface039> set with null edge case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<MarkerInterface039> = new Box<MarkerInterface039>(new MarkerImpl039());
      let i1: MarkerImpl039 = new MarkerImpl039();
      let i2: MarkerImpl039 = new MarkerImpl039();
      box.set(i1);
      expect(box.get() === i1).assertTrue();
      box.set(i2);
      expect(box.get() === i2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_6500
     * @tc.name testBoxGenericGetSetC065
     * @tc.desc Verify Box<NullableInt029> cycle int -> null -> int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableInt029> = new Box<NullableInt029>(null);
      box.set(42);
      expect(box.get()).assertEqual(42);
      box.set(null);
      expect(box.get()).assertEqual(null);
      box.set(-1);
      expect(box.get()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_6900
     * @tc.name testBoxGenericGetSetC066
     * @tc.desc Verify Box<NullableInt029> init value, set null, set different value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableInt029> = new Box<NullableInt029>(7);
      expect(box.get()).assertEqual(7);
      box.set(null);
      expect(box.get()).assertEqual(null);
      box.set(14);
      expect(box.get()).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_7000
     * @tc.name testBoxGenericGetSetC067
     * @tc.desc Verify Box<NullableInt029> multiple int transitions -1, 0, 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableInt029> = new Box<NullableInt029>(null);
      box.set(-1);
      expect(box.get()).assertEqual(-1);
      box.set(0);
      expect(box.get()).assertEqual(0);
      box.set(1);
      expect(box.get()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_7100
     * @tc.name testBoxGenericGetSetC068
     * @tc.desc Verify Box<NullableString030> init null, set string, set null, set different string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableString030> = new Box<NullableString030>(null);
      box.set("hello");
      expect(box.get()).assertEqual("hello");
      box.set(null);
      expect(box.get()).assertEqual(null);
      box.set("world");
      expect(box.get()).assertEqual("world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_7200
     * @tc.name testBoxGenericGetSetC069
     * @tc.desc Verify Box<NullableString030> set multiple strings in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableString030> = new Box<NullableString030>("first");
      expect(box.get()).assertEqual("first");
      box.set("second");
      expect(box.get()).assertEqual("second");
      box.set("third");
      expect(box.get()).assertEqual("third");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_7300
     * @tc.name testBoxGenericGetSetC070
     * @tc.desc Verify Box<NullableString030> empty string, non-empty string, null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableString030> = new Box<NullableString030>("x");
      box.set("");
      expect(box.get()).assertEqual("");
      box.set("y");
      expect(box.get()).assertEqual("y");
      box.set(null);
      expect(box.get()).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_7400
     * @tc.name testBoxGenericGetSetC071
     * @tc.desc Verify Box<IntOrString031> transition int -> string -> int -> string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntOrString031> = new Box<IntOrString031>(10);
      box.set("a");
      expect(box.get()).assertEqual("a");
      box.set(20);
      expect(box.get()).assertEqual(20);
      box.set("b");
      expect(box.get()).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_7500
     * @tc.name testBoxGenericGetSetC072
     * @tc.desc Verify Box<IntOrString031> set zero int then empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntOrString031> = new Box<IntOrString031>(1);
      box.set(0);
      expect(box.get()).assertEqual(0);
      box.set("");
      expect(box.get()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_7600
     * @tc.name testBoxGenericGetSetC073
     * @tc.desc Verify Box<IntOrString031> set large int then long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntOrString031> = new Box<IntOrString031>(0);
      box.set(1000000);
      expect(box.get()).assertEqual(1000000);
      box.set("long string value");
      expect(box.get()).assertEqual("long string value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_7700
     * @tc.name testBoxGenericGetSetC074
     * @tc.desc Verify Box<MultiUnion032> cycle boolean -> int -> string -> boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<MultiUnion032> = new Box<MultiUnion032>(true);
      expect(box.get()).assertEqual(true);
      box.set(1);
      expect(box.get()).assertEqual(1);
      box.set("s");
      expect(box.get()).assertEqual("s");
      box.set(false);
      expect(box.get()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_7800
     * @tc.name testBoxGenericGetSetC075
     * @tc.desc Verify Box<MultiUnion032> boolean false -> true -> false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<MultiUnion032> = new Box<MultiUnion032>(false);
      expect(box.get()).assertEqual(false);
      box.set(true);
      expect(box.get()).assertEqual(true);
      box.set(false);
      expect(box.get()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_7900
     * @tc.name testBoxGenericGetSetC076
     * @tc.desc Verify Box<MultiUnion032> int values 0, -1, 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<MultiUnion032> = new Box<MultiUnion032>(0);
      expect(box.get()).assertEqual(0);
      box.set(-1);
      expect(box.get()).assertEqual(-1);
      box.set(999);
      expect(box.get()).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_8000
     * @tc.name testBoxGenericGetSetC077
     * @tc.desc Verify Box<MultiUnion032> string member transitions with boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<MultiUnion032> = new Box<MultiUnion032>("first");
      expect(box.get()).assertEqual("first");
      box.set(true);
      expect(box.get()).assertEqual(true);
      box.set("last");
      expect(box.get()).assertEqual("last");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_8100
     * @tc.name testBoxGenericGetSetC078
     * @tc.desc Verify Box<NullableInt029> set null then non-null multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableInt029> = new Box<NullableInt029>(0);
      box.set(null);
      expect(box.get()).assertEqual(null);
      box.set(10);
      expect(box.get()).assertEqual(10);
      box.set(null);
      expect(box.get()).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_8200
     * @tc.name testBoxGenericGetSetC079
     * @tc.desc Verify Box<NullableString030> string transitions between different values with null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableString030> = new Box<NullableString030>(null);
      box.set("A");
      expect(box.get()).assertEqual("A");
      box.set("B");
      expect(box.get()).assertEqual("B");
      box.set(null);
      expect(box.get()).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_6600
     * @tc.name testBoxGenericGetSetC080
     * @tc.desc Verify Box<NullableInt029> init with int, set null, verify get returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableInt029> = new Box<NullableInt029>(42);
      expect(box.get()).assertEqual(42);
      box.set(null);
      let v: NullableInt029 = box.get();
      expect(v).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_8300
     * @tc.name testBoxGenericGetSetC081
     * @tc.desc Verify Box<NullableString030> init with string, set null, verify get returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableString030> = new Box<NullableString030>("hello");
      expect(box.get()).assertEqual("hello");
      box.set(null);
      let v: NullableString030 = box.get();
      expect(v).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_8400
     * @tc.name testBoxGenericGetSetC082
     * @tc.desc Verify Box<NullableInt029> init null, set int, set null, verify each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableInt029> = new Box<NullableInt029>(null);
      expect(box.get()).assertEqual(null);
      box.set(100);
      expect(box.get()).assertEqual(100);
      box.set(null);
      expect(box.get()).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_8500
     * @tc.name testBoxGenericGetSetC083
     * @tc.desc Verify Box<NullableString030> init null, set string, set null, verify each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableString030> = new Box<NullableString030>(null);
      expect(box.get()).assertEqual(null);
      box.set("text");
      expect(box.get()).assertEqual("text");
      box.set(null);
      expect(box.get()).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_8600
     * @tc.name testBoxGenericGetSetC084
     * @tc.desc Verify Box<NullableInt029> multiple null reassignments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableInt029> = new Box<NullableInt029>(null);
      box.set(null);
      expect(box.get()).assertEqual(null);
      box.set(1);
      expect(box.get()).assertEqual(1);
      box.set(null);
      expect(box.get()).assertEqual(null);
      box.set(2);
      expect(box.get()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_6700
     * @tc.name testBoxGenericGetSetC085
     * @tc.desc Verify Box<NestedBox038> construct deep nesting and verify chain access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Box<int> = new Box<int>(7);
      let mid: Box<Box<int>> = new Box<Box<int>>(inner);
      let box: Box<NestedBox038> = new Box<NestedBox038>(mid);
      let result: NestedBox038 = box.get();
      expect(result.get().get()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_8700
     * @tc.name testBoxGenericGetSetC086
     * @tc.desc Verify Box<NestedBox038> modify inner value through chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NestedBox038> = new Box<NestedBox038>(new Box<Box<int>>(new Box<int>(5)));
      box.get().get().set(15);
      expect(box.get().get().get()).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_8800
     * @tc.name testBoxGenericGetSetC087
     * @tc.desc Verify Box<NestedBox038> replace outer Box with entirely new nested structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NestedBox038> = new Box<NestedBox038>(new Box<Box<int>>(new Box<int>(0)));
      box.set(new Box<Box<int>>(new Box<int>(99)));
      expect(box.get().get().get()).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_8900
     * @tc.name testBoxGenericGetSetC088
     * @tc.desc Verify Box<NestedBox038> retrieve inner, modify, set back, verify reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NestedBox038> = new Box<NestedBox038>(new Box<Box<int>>(new Box<int>(10)));
      let outer: NestedBox038 = box.get();
      outer.set(new Box<int>(20));
      expect(box.get().get().get()).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_9000
     * @tc.name testBoxGenericGetSetC089
     * @tc.desc Verify Box<BoxIntArray037> replace array elements and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<BoxIntArray037> = new Box<BoxIntArray037>(new Array<Box<int>>());
      box.set([new Box<int>(1), new Box<int>(2)]);
      expect(box.get().length).assertEqual(2);
      expect(box.get()[0].get()).assertEqual(1);
      expect(box.get()[1].get()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_9100
     * @tc.name testBoxGenericGetSetC090
     * @tc.desc Verify Box<StringBoxIntMap035> modify map entries after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: StringBoxIntMap035 = new Map<string, Box<int>>();
      map.set("k1", new Box<int>(5));
      let box: Box<StringBoxIntMap035> = new Box<StringBoxIntMap035>(map);
      let retrieved: StringBoxIntMap035 = box.get();
      retrieved.set("k2", new Box<int>(10));
      expect(box.get().has("k1")).assertTrue();
      expect(box.get().has("k2")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_9200
     * @tc.name testBoxGenericGetSetC091
     * @tc.desc Verify Box<BoxStringSet036> modify set after set and verify membership
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sb: Box<string> = new Box<string>("a");
      let set: BoxStringSet036 = new Set<Box<string>>();
      set.add(sb);
      let box: Box<BoxStringSet036> = new Box<BoxStringSet036>(set);
      let retrieved: BoxStringSet036 = box.get();
      let sb2: Box<string> = new Box<string>("b");
      retrieved.add(sb2);
      expect(box.get().has(sb)).assertTrue();
      expect(box.get().has(sb2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_9300
     * @tc.name testBoxGenericGetSetC092
     * @tc.desc Verify Box<BoxIntArray034> modify array elements and verify reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: BoxIntArray034 = [new Box<int>(1), new Box<int>(2)];
      let box: Box<BoxIntArray034> = new Box<BoxIntArray034>(arr);
      let retrieved: BoxIntArray034 = box.get();
      retrieved[0].set(100);
      expect(box.get()[0].get()).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_6800
     * @tc.name testBoxGenericGetSetC093
     * @tc.desc Verify Box<NullableInt029> get() with nullish coalescing ?? operator returns fallback when value is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableInt029> = new Box<NullableInt029>(null);
      let result: int = box.get() ?? -1;
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_9400
     * @tc.name testBoxGenericGetSetC094
     * @tc.desc Verify Box<NullableInt029> get() with ?? operator returns actual value when not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableInt029> = new Box<NullableInt029>(42);
      let result: int = box.get() ?? -1;
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_9500
     * @tc.name testBoxGenericGetSetC095
     * @tc.desc Verify Box<NullableString030> get() with ?? operator returns expected string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableString030> = new Box<NullableString030>("hello");
      let result: string = box.get() ?? "fallback";
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_9600
     * @tc.name testBoxGenericGetSetC096
     * @tc.desc Verify Box<NullableString030> get() with ?? operator returns fallback when null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableString030> = new Box<NullableString030>(null);
      let result: string = box.get() ?? "default";
      expect(result).assertEqual("default");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_9700
     * @tc.name testBoxGenericGetSetC097
     * @tc.desc Verify Box<Person002> get() with optional chaining ?. operator accesses property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let person: Person002 = { name: "Alice", age: 30 };
      let box: Box<Person002> = new Box<Person002>(person);
      let nameLen: int | undefined = box.get()?.name.length;
      expect(nameLen !== undefined).assertTrue();
      expect(nameLen!).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_3_9800
     * @tc.name testBoxGenericGetSetC098
     * @tc.desc Verify Box<NullableInt029> set with ?? fallback: get null, fallback to 0, increment, set back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericGetSetC098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<NullableInt029> = new Box<NullableInt029>(null);
      let current: int = box.get() ?? 0;
      box.set(current + 1);
      expect(box.get()).assertEqual(1);
    });
  });
}
