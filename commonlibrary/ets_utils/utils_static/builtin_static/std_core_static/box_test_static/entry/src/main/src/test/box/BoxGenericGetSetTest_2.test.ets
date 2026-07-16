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
import { Holder013, SelfRefNode014, Color015, SignedData016, Success016, Failure016,
  IntSupplier017, BiFunction018, VoidFunction019, IntPredicate020, StringComparator021,
  BoxFactory022, BoxProcessor023, BigData024, Teacher025, Singleton026, Logger027, Config028 }
  from '../Util.test';

export default function BoxGenericGetSetTest2(): void {
  describe('BoxGenericGetSetTest2', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    // Group B: Box<T> set/get Tests for Custom Classes + Function Types

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_0100
     * @tc.name testBoxGenericSetGetB001
     * @tc.desc Verify Box<Holder013<int>> set/get with generic holder class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let initial: Holder013<int> = new Holder013<int>(100);
      let updated: Holder013<int> = new Holder013<int>(200);
      let box: Box<Holder013<int>> = new Box<Holder013<int>>(initial);
      box.set(updated);
      let result: Holder013<int> = box.get();
      expect(result.val).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_0200
     * @tc.name testBoxGenericSetGetB002
     * @tc.desc Verify Box<SelfRefNode014> set/get with self-referencing node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n1: SelfRefNode014 = new SelfRefNode014();
      n1.value = 1;
      let n2: SelfRefNode014 = new SelfRefNode014();
      n2.value = 2;
      let box: Box<SelfRefNode014> = new Box<SelfRefNode014>(n1);
      box.set(n2);
      let result: SelfRefNode014 = box.get();
      expect(result.value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_0300
     * @tc.name testBoxGenericSetGetB003
     * @tc.desc Verify Box<Color015> set/get with enum type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Color015> = new Box<Color015>(Color015.RED);
      box.set(Color015.BLUE);
      let result: Color015 = box.get();
      expect(result).assertEqual(Color015.BLUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_0400
     * @tc.name testBoxGenericSetGetB004
     * @tc.desc Verify Box<SignedData016> set/get with sealed class hierarchy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let initial: SignedData016 = new Success016(42);
      let updated: SignedData016 = new Failure016("error");
      let box: Box<SignedData016> = new Box<SignedData016>(initial);
      box.set(updated);
      let result: SignedData016 = box.get();
      expect(result instanceof Failure016).assertTrue();
      if (result instanceof Failure016) {
        let f: Failure016 = result as Failure016;
        expect(f.message).assertEqual("error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_0500
     * @tc.name testBoxGenericSetGetB005
     * @tc.desc Verify Box<IntSupplier017> set/get with function type returning int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn1: IntSupplier017 = (): int => 10;
      let fn2: IntSupplier017 = (): int => 20;
      let box: Box<IntSupplier017> = new Box<IntSupplier017>(fn1);
      box.set(fn2);
      let result: IntSupplier017 = box.get();
      expect(result()).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_0600
     * @tc.name testBoxGenericSetGetB006
     * @tc.desc Verify Box<BiFunction018> set/get with bi-function type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn1: BiFunction018 = (a: int, b: string): boolean => a > 0;
      let fn2: BiFunction018 = (a: int, b: string): boolean => b.length > 0;
      let box: Box<BiFunction018> = new Box<BiFunction018>(fn1);
      box.set(fn2);
      let result: BiFunction018 = box.get();
      expect(result(0, "test")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_0700
     * @tc.name testBoxGenericSetGetB007
     * @tc.desc Verify Box<VoidFunction019> set/get with void function type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false;
      let fn1: VoidFunction019 = (): void => {};
      let fn2: VoidFunction019 = (): void => {
        called = true;
      };
      let box: Box<VoidFunction019> = new Box<VoidFunction019>(fn1);
      box.set(fn2);
      let result: VoidFunction019 = box.get();
      result();
      expect(called).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_0800
     * @tc.name testBoxGenericSetGetB008
     * @tc.desc Verify Box<IntPredicate020> set/get with int predicate function type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn1: IntPredicate020 = (x: int): boolean => x > 0;
      let fn2: IntPredicate020 = (x: int): boolean => x < 0;
      let box: Box<IntPredicate020> = new Box<IntPredicate020>(fn1);
      box.set(fn2);
      let result: IntPredicate020 = box.get();
      expect(result(-5)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_0900
     * @tc.name testBoxGenericSetGetB009
     * @tc.desc Verify Box<StringComparator021> set/get with string comparator function type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn1: StringComparator021 = (a: string, b: string): int => a.length - b.length;
      let fn2: StringComparator021 = (a: string, b: string): int => a > b ? 1 : (a < b ? -1 : 0);
      let box: Box<StringComparator021> = new Box<StringComparator021>(fn1);
      box.set(fn2);
      let result: StringComparator021 = box.get();
      expect(result("b", "a")).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_1000
     * @tc.name testBoxGenericSetGetB010
     * @tc.desc Verify Box<BoxFactory022> set/get with box factory function type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn1: BoxFactory022 = (): Box<int> => new Box<int>(1);
      let fn2: BoxFactory022 = (): Box<int> => new Box<int>(2);
      let box: Box<BoxFactory022> = new Box<BoxFactory022>(fn1);
      box.set(fn2);
      let factory: BoxFactory022 = box.get();
      let produced: Box<int> = factory();
      expect(produced.get()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_1100
     * @tc.name testBoxGenericSetGetB011
     * @tc.desc Verify Box<BoxProcessor023> set/get with box processor function type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn1: BoxProcessor023 = (b: Box<string>): int => b.get().length;
      let fn2: BoxProcessor023 = (b: Box<string>): int => 0;
      let box: Box<BoxProcessor023> = new Box<BoxProcessor023>(fn1);
      box.set(fn2);
      let processor: BoxProcessor023 = box.get();
      let input: Box<string> = new Box<string>("test");
      expect(processor(input)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_1200
     * @tc.name testBoxGenericSetGetB012
     * @tc.desc Verify Box<BigData024> set/get with class containing five int fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d1: BigData024 = new BigData024();
      d1.f1 = 1;
      d1.f2 = 2;
      d1.f3 = 3;
      d1.f4 = 4;
      d1.f5 = 5;
      let d2: BigData024 = new BigData024();
      d2.f1 = 10;
      d2.f2 = 20;
      d2.f3 = 30;
      d2.f4 = 40;
      d2.f5 = 50;
      let box: Box<BigData024> = new Box<BigData024>(d1);
      box.set(d2);
      let result: BigData024 = box.get();
      expect(result.f1).assertEqual(10);
      expect(result.f5).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_1300
     * @tc.name testBoxGenericSetGetB013
     * @tc.desc Verify Box<Teacher025> set/get with teacher class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t1: Teacher025 = new Teacher025("Alice", 30, "Math");
      let t2: Teacher025 = new Teacher025("Bob", 25, "Science");
      let box: Box<Teacher025> = new Box<Teacher025>(t1);
      box.set(t2);
      let result: Teacher025 = box.get();
      expect(result.name).assertEqual("Bob");
      expect(result.age).assertEqual(25);
      expect(result.subject).assertEqual("Science");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_1400
     * @tc.name testBoxGenericSetGetB014
     * @tc.desc Verify Box<Singleton026> set/get with singleton instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Singleton026 = Singleton026.getInstance();
      let s2: Singleton026 = Singleton026.getInstance();
      let box: Box<Singleton026> = new Box<Singleton026>(s1);
      box.set(s2);
      let result: Singleton026 = box.get();
      expect(result).assertEqual(s2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_1500
     * @tc.name testBoxGenericSetGetB015
     * @tc.desc Verify Box<Logger027> set/get with logger class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let logger1: Logger027 = new Logger027("old");
      let logger2: Logger027 = new Logger027("new");
      let box: Box<Logger027> = new Box<Logger027>(logger1);
      box.set(logger2);
      let result: Logger027 = box.get();
      expect(result.tag).assertEqual("new");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_1600
     * @tc.name testBoxGenericSetGetB016
     * @tc.desc Verify Box<Config028> set/get with config interface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cfg1: Config028 = { host: "localhost", port: 8080 };
      let cfg2: Config028 = { host: "example.com", port: 443 };
      let box: Box<Config028> = new Box<Config028>(cfg1);
      box.set(cfg2);
      let result: Config028 = box.get();
      expect(result.host).assertEqual("example.com");
      expect(result.port).assertEqual(443);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_1700
     * @tc.name testBoxGenericSetGetB017
     * @tc.desc Verify Box<Holder013<int>> set new holder value and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Holder013<int>> = new Box<Holder013<int>>(new Holder013<int>(0));
      box.set(new Holder013<int>(500));
      expect(box.get().val).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_1800
     * @tc.name testBoxGenericSetGetB018
     * @tc.desc Verify Box<Holder013<int>> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<Holder013<int>> = new Box<Holder013<int>>(new Holder013<int>(1));
      let boxB: Box<Holder013<int>> = new Box<Holder013<int>>(new Holder013<int>(2));
      boxA.set(new Holder013<int>(10));
      boxB.set(new Holder013<int>(20));
      expect(boxA.get().val).assertEqual(10);
      expect(boxB.get().val).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_1900
     * @tc.name testBoxGenericSetGetB019
     * @tc.desc Verify Box<Holder013<int>> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Holder013<int>> = new Box<Holder013<int>>(new Holder013<int>(0));
      let h: Holder013<int> = new Holder013<int>(999);
      let ret: Holder013<int> = box.set(h);
      expect(ret.val).assertEqual(999);
      expect(ret === h).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_2000
     * @tc.name testBoxGenericSetGetB020
     * @tc.desc Verify Box<Holder013<int>> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Holder013<int>> = new Box<Holder013<int>>(new Holder013<int>(0));
      box.set(new Holder013<int>(1));
      box.set(new Holder013<int>(2));
      box.set(new Holder013<int>(3));
      expect(box.get().val).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_2100
     * @tc.name testBoxGenericSetGetB021
     * @tc.desc Verify Box<SelfRefNode014> set new node and verify value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<SelfRefNode014> = new Box<SelfRefNode014>(new SelfRefNode014());
      let n: SelfRefNode014 = new SelfRefNode014();
      n.value = 777;
      box.set(n);
      expect(box.get().value).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_2200
     * @tc.name testBoxGenericSetGetB022
     * @tc.desc Verify Box<SelfRefNode014> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<SelfRefNode014> = new Box<SelfRefNode014>(new SelfRefNode014());
      let boxB: Box<SelfRefNode014> = new Box<SelfRefNode014>(new SelfRefNode014());
      let nA: SelfRefNode014 = new SelfRefNode014();
      nA.value = 111;
      let nB: SelfRefNode014 = new SelfRefNode014();
      nB.value = 222;
      boxA.set(nA);
      boxB.set(nB);
      expect(boxA.get().value).assertEqual(111);
      expect(boxB.get().value).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_2300
     * @tc.name testBoxGenericSetGetB023
     * @tc.desc Verify Box<SelfRefNode014> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<SelfRefNode014> = new Box<SelfRefNode014>(new SelfRefNode014());
      let n: SelfRefNode014 = new SelfRefNode014();
      let ret: SelfRefNode014 = box.set(n);
      expect(ret === n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_2400
     * @tc.name testBoxGenericSetGetB024
     * @tc.desc Verify Box<SelfRefNode014> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<SelfRefNode014> = new Box<SelfRefNode014>(new SelfRefNode014());
      let a: SelfRefNode014 = new SelfRefNode014();
      a.value = 10;
      let b: SelfRefNode014 = new SelfRefNode014();
      b.value = 20;
      let c: SelfRefNode014 = new SelfRefNode014();
      c.value = 30;
      box.set(a);
      box.set(b);
      box.set(c);
      expect(box.get().value).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_2500
     * @tc.name testBoxGenericSetGetB025
     * @tc.desc Verify Box<Color015> set new enum value and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Color015> = new Box<Color015>(Color015.RED);
      box.set(Color015.GREEN);
      expect(box.get()).assertEqual(Color015.GREEN);
      expect(box.get()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_2600
     * @tc.name testBoxGenericSetGetB026
     * @tc.desc Verify Box<Color015> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<Color015> = new Box<Color015>(Color015.RED);
      let boxB: Box<Color015> = new Box<Color015>(Color015.RED);
      boxA.set(Color015.GREEN);
      boxB.set(Color015.BLUE);
      expect(boxA.get()).assertEqual(1);
      expect(boxB.get()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_2700
     * @tc.name testBoxGenericSetGetB027
     * @tc.desc Verify Box<Color015> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Color015> = new Box<Color015>(Color015.RED);
      let ret: Color015 = box.set(Color015.BLUE);
      expect(ret).assertEqual(Color015.BLUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_2800
     * @tc.name testBoxGenericSetGetB028
     * @tc.desc Verify Box<Color015> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Color015> = new Box<Color015>(Color015.RED);
      box.set(Color015.RED);
      box.set(Color015.GREEN);
      box.set(Color015.BLUE);
      expect(box.get()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_2900
     * @tc.name testBoxGenericSetGetB029
     * @tc.desc Verify Box<SignedData016> set new sealed subclass and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<SignedData016> = new Box<SignedData016>(new Success016(0));
      box.set(new Success016(77));
      let result: SignedData016 = box.get();
      expect(result instanceof Success016).assertTrue();
      if (result instanceof Success016) {
        let s: Success016 = result as Success016;
        expect(s.value).assertEqual(77);
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_3000
     * @tc.name testBoxGenericSetGetB030
     * @tc.desc Verify Box<SignedData016> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<SignedData016> = new Box<SignedData016>(new Success016(0));
      let boxB: Box<SignedData016> = new Box<SignedData016>(new Failure016(""));
      boxA.set(new Failure016("failA"));
      boxB.set(new Success016(100));
      expect(boxA.get() instanceof Failure016).assertTrue();
      expect(boxB.get() instanceof Success016).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_3100
     * @tc.name testBoxGenericSetGetB031
     * @tc.desc Verify Box<SignedData016> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<SignedData016> = new Box<SignedData016>(new Success016(0));
      let s: SignedData016 = new Failure016("returned");
      let ret: SignedData016 = box.set(s);
      expect(ret === s).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_3200
     * @tc.name testBoxGenericSetGetB032
     * @tc.desc Verify Box<SignedData016> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<SignedData016> = new Box<SignedData016>(new Success016(1));
      box.set(new Success016(2));
      box.set(new Failure016("mid"));
      box.set(new Success016(99));
      let resultVal: SignedData016 = box.get();
      expect(resultVal instanceof Success016).assertTrue();
      if (resultVal instanceof Success016) {
        let sv: Success016 = resultVal as Success016;
        expect(sv.value).assertEqual(99);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_3300
     * @tc.name testBoxGenericSetGetB033
     * @tc.desc Verify Box<IntSupplier017> set new supplier and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntSupplier017> = new Box<IntSupplier017>((): int => 0);
      box.set((): int => 1000);
      expect(box.get()()).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_3400
     * @tc.name testBoxGenericSetGetB034
     * @tc.desc Verify Box<IntSupplier017> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<IntSupplier017> = new Box<IntSupplier017>((): int => -1);
      let boxB: Box<IntSupplier017> = new Box<IntSupplier017>((): int => -2);
      boxA.set((): int => 50);
      boxB.set((): int => 60);
      expect(boxA.get()()).assertEqual(50);
      expect(boxB.get()()).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_3500
     * @tc.name testBoxGenericSetGetB035
     * @tc.desc Verify Box<IntSupplier017> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntSupplier017> = new Box<IntSupplier017>((): int => 0);
      let fn: IntSupplier017 = (): int => 42;
      let ret: IntSupplier017 = box.set(fn);
      expect(ret === fn).assertTrue();
      expect(ret()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_3600
     * @tc.name testBoxGenericSetGetB036
     * @tc.desc Verify Box<IntSupplier017> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntSupplier017> = new Box<IntSupplier017>((): int => 0);
      box.set((): int => 1);
      box.set((): int => 2);
      box.set((): int => 3);
      expect(box.get()()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_3700
     * @tc.name testBoxGenericSetGetB037
     * @tc.desc Verify Box<BiFunction018> set new bifunction and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<BiFunction018> = new Box<BiFunction018>((a: int, b: string): boolean => false);
      box.set((a: int, b: string): boolean => a === 1);
      expect(box.get()(1, "")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_3800
     * @tc.name testBoxGenericSetGetB038
     * @tc.desc Verify Box<BiFunction018> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<BiFunction018> = new Box<BiFunction018>((a: int, b: string): boolean => false);
      let fn: BiFunction018 = (a: int, b: string): boolean => true;
      let ret: BiFunction018 = box.set(fn);
      expect(ret === fn).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_3900
     * @tc.name testBoxGenericSetGetB039
     * @tc.desc Verify Box<VoidFunction019> set new function and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flag: boolean = false;
      let box: Box<VoidFunction019> = new Box<VoidFunction019>((): void => {});
      box.set((): void => { flag = true; });
      box.get()();
      expect(flag).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_4000
     * @tc.name testBoxGenericSetGetB040
     * @tc.desc Verify Box<VoidFunction019> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fA: boolean = false;
      let fB: boolean = false;
      let boxA: Box<VoidFunction019> = new Box<VoidFunction019>((): void => {});
      let boxB: Box<VoidFunction019> = new Box<VoidFunction019>((): void => {});
      boxA.set((): void => { fA = true; });
      boxB.set((): void => { fB = true; });
      boxA.get()();
      expect(fA).assertTrue();
      expect(fB).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_4100
     * @tc.name testBoxGenericSetGetB041
     * @tc.desc Verify Box<IntPredicate020> set new predicate and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntPredicate020> = new Box<IntPredicate020>((x: int): boolean => false);
      box.set((x: int): boolean => x === 10);
      expect(box.get()(10)).assertTrue();
      expect(box.get()(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_4200
     * @tc.name testBoxGenericSetGetB042
     * @tc.desc Verify Box<IntPredicate020> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntPredicate020> = new Box<IntPredicate020>((x: int): boolean => false);
      let fn: IntPredicate020 = (x: int): boolean => x > 0;
      let ret: IntPredicate020 = box.set(fn);
      expect(ret(5)).assertTrue();
      expect(ret === fn).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_4300
     * @tc.name testBoxGenericSetGetB043
     * @tc.desc Verify Box<StringComparator021> set new comparator and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<StringComparator021> = new Box<StringComparator021>((a: string, b: string): int => 0);
      box.set((a: string, b: string): int => a.length - b.length);
      expect(box.get()("long", "short")).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_4400
     * @tc.name testBoxGenericSetGetB044
     * @tc.desc Verify Box<BoxFactory022> set new factory and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<BoxFactory022> = new Box<BoxFactory022>((): Box<int> => new Box<int>(-1));
      box.set((): Box<int> => new Box<int>(55));
      expect(box.get()().get()).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_4500
     * @tc.name testBoxGenericSetGetB045
     * @tc.desc Verify Box<BoxProcessor023> set new processor and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<BoxProcessor023> = new Box<BoxProcessor023>((b: Box<string>): int => -1);
      box.set((b: Box<string>): int => b.get().length);
      let input: Box<string> = new Box<string>("check");
      expect(box.get()(input)).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_4600
     * @tc.name testBoxGenericSetGetB046
     * @tc.desc Verify Box<BigData024> set new values and verify changes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<BigData024> = new Box<BigData024>(new BigData024());
      let d: BigData024 = new BigData024();
      d.f1 = 11;
      d.f2 = 22;
      d.f3 = 33;
      d.f4 = 44;
      d.f5 = 55;
      box.set(d);
      expect(box.get().f1).assertEqual(11);
      expect(box.get().f5).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_4700
     * @tc.name testBoxGenericSetGetB047
     * @tc.desc Verify Box<BigData024> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<BigData024> = new Box<BigData024>(new BigData024());
      let boxB: Box<BigData024> = new Box<BigData024>(new BigData024());
      let dA: BigData024 = new BigData024();
      dA.f1 = 100;
      let dB: BigData024 = new BigData024();
      dB.f1 = 200;
      boxA.set(dA);
      boxB.set(dB);
      expect(boxA.get().f1).assertEqual(100);
      expect(boxB.get().f1).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_4800
     * @tc.name testBoxGenericSetGetB048
     * @tc.desc Verify Box<BigData024> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<BigData024> = new Box<BigData024>(new BigData024());
      let d: BigData024 = new BigData024();
      let ret: BigData024 = box.set(d);
      expect(ret === d).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_4900
     * @tc.name testBoxGenericSetGetB049
     * @tc.desc Verify Box<BigData024> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<BigData024> = new Box<BigData024>(new BigData024());
      let a: BigData024 = new BigData024();
      a.f1 = 1;
      let b: BigData024 = new BigData024();
      b.f1 = 2;
      let c: BigData024 = new BigData024();
      c.f1 = 3;
      box.set(a);
      box.set(b);
      box.set(c);
      expect(box.get().f1).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_5000
     * @tc.name testBoxGenericSetGetB050
     * @tc.desc Verify Box<Teacher025> set new teacher and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Teacher025> = new Box<Teacher025>(new Teacher025("", 0, ""));
      box.set(new Teacher025("Dave", 45, "Physics"));
      expect(box.get().name).assertEqual("Dave");
      expect(box.get().subject).assertEqual("Physics");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_5100
     * @tc.name testBoxGenericSetGetB051
     * @tc.desc Verify Box<Teacher025> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<Teacher025> = new Box<Teacher025>(new Teacher025("", 0, ""));
      let boxB: Box<Teacher025> = new Box<Teacher025>(new Teacher025("", 0, ""));
      boxA.set(new Teacher025("Anna", 28, "Yuwen"));
      boxB.set(new Teacher025("Ben", 33, "Math"));
      expect(boxA.get().name).assertEqual("Anna");
      expect(boxB.get().name).assertEqual("Ben");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_5200
     * @tc.name testBoxGenericSetGetB052
     * @tc.desc Verify Box<Teacher025> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Teacher025> = new Box<Teacher025>(new Teacher025("", 0, ""));
      let t: Teacher025 = new Teacher025("Return", 99, "Test");
      let ret: Teacher025 = box.set(t);
      expect(ret === t).assertTrue();
      expect(ret.name).assertEqual("Return");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_5300
     * @tc.name testBoxGenericSetGetB053
     * @tc.desc Verify Box<Teacher025> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Teacher025> = new Box<Teacher025>(new Teacher025("", 0, ""));
      box.set(new Teacher025("A", 1, "A"));
      box.set(new Teacher025("B", 2, "B"));
      box.set(new Teacher025("C", 3, "C"));
      expect(box.get().name).assertEqual("C");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_5400
     * @tc.name testBoxGenericSetGetB054
     * @tc.desc Verify Box<Logger027> set new logger and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Logger027> = new Box<Logger027>(new Logger027("init"));
      box.set(new Logger027("production"));
      expect(box.get().tag).assertEqual("production");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_5500
     * @tc.name testBoxGenericSetGetB055
     * @tc.desc Verify Box<Logger027> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<Logger027> = new Box<Logger027>(new Logger027("a0"));
      let boxB: Box<Logger027> = new Box<Logger027>(new Logger027("b0"));
      boxA.set(new Logger027("alpha"));
      boxB.set(new Logger027("beta"));
      expect(boxA.get().tag).assertEqual("alpha");
      expect(boxB.get().tag).assertEqual("beta");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_5600
     * @tc.name testBoxGenericSetGetB056
     * @tc.desc Verify Box<Logger027> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Logger027> = new Box<Logger027>(new Logger027("old"));
      let l: Logger027 = new Logger027("returnTag");
      let ret: Logger027 = box.set(l);
      expect(ret.tag).assertEqual("returnTag");
      expect(ret === l).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_5700
     * @tc.name testBoxGenericSetGetB057
     * @tc.desc Verify Box<Logger027> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Logger027> = new Box<Logger027>(new Logger027("start"));
      box.set(new Logger027("first"));
      box.set(new Logger027("second"));
      box.set(new Logger027("third"));
      expect(box.get().tag).assertEqual("third");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_5800
     * @tc.name testBoxGenericSetGetB058
     * @tc.desc Verify Box<Config028> set new config and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Config028> = new Box<Config028>({ host: "a", port: 1 });
      box.set({ host: "server.net", port: 8080 });
      expect(box.get().host).assertEqual("server.net");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_5900
     * @tc.name testBoxGenericSetGetB059
     * @tc.desc Verify Box<Config028> instance isolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxA: Box<Config028> = new Box<Config028>({ host: "a", port: 0 });
      let boxB: Box<Config028> = new Box<Config028>({ host: "b", port: 0 });
      boxA.set({ host: "alpha.net", port: 1111 });
      boxB.set({ host: "beta.net", port: 2222 });
      expect(boxA.get().host).assertEqual("alpha.net");
      expect(boxB.get().host).assertEqual("beta.net");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_6000
     * @tc.name testBoxGenericSetGetB060
     * @tc.desc Verify Box<Config028> set return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Config028> = new Box<Config028>({ host: "x", port: 0 });
      let cfg: Config028 = { host: "ret.com", port: 9999 };
      let ret: Config028 = box.set(cfg);
      expect(ret.host).assertEqual("ret.com");
      expect(ret === cfg).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_6100
     * @tc.name testBoxGenericSetGetB061
     * @tc.desc Verify Box<Config028> set chain: set a, set b, set c, verify c
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Config028> = new Box<Config028>({ host: "init", port: 0 });
      box.set({ host: "a.com", port: 1 });
      box.set({ host: "b.com", port: 2 });
      box.set({ host: "c.com", port: 3 });
      expect(box.get().host).assertEqual("c.com");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_6200
     * @tc.name testBoxGenericSetGetB062
     * @tc.desc Verify Box<Holder013<int>> set with value 999 and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Holder013<int>> = new Box<Holder013<int>>(new Holder013<int>(0));
      box.set(new Holder013<int>(999));
      expect(box.get().val).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_6300
     * @tc.name testBoxGenericSetGetB063
     * @tc.desc Verify Box<SelfRefNode014> set with chain node and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<SelfRefNode014> = new Box<SelfRefNode014>(new SelfRefNode014());
      let node: SelfRefNode014 = new SelfRefNode014();
      let n1: SelfRefNode014 | null = new SelfRefNode014();
      node.next = n1;
      if (n1 !== null) {
        n1.value = 42;
      }
      box.set(node);
      let result: SelfRefNode014 = box.get();
      let nxt: SelfRefNode014 | null = result.next;
      expect(nxt !== null).assertTrue();
      if (nxt !== null) {
        expect(nxt.value).assertEqual(42);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_6400
     * @tc.name testBoxGenericSetGetB064
     * @tc.desc Verify Box<Color015> set with numeric value and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Color015> = new Box<Color015>(Color015.RED);
      let ret: Color015 = box.set(Color015.GREEN);
      expect(ret).assertEqual(1);
      expect(box.get()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_6500
     * @tc.name testBoxGenericSetGetB065
     * @tc.desc Verify Box<SignedData016> set from Success to Failure and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<SignedData016> = new Box<SignedData016>(new Success016(1));
      box.set(new Failure016("fail_msg"));
      let result: SignedData016 = box.get();
      expect(result instanceof Failure016).assertTrue();
      if (result instanceof Failure016) {
        let f: Failure016 = result as Failure016;
        expect(f.message).assertEqual("fail_msg");
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_6600
     * @tc.name testBoxGenericSetGetB066
     * @tc.desc Verify Box<IntSupplier017> set supplier with large return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<IntSupplier017> = new Box<IntSupplier017>((): int => 0);
      box.set((): int => 9999);
      expect(box.get()()).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_6700
     * @tc.name testBoxGenericSetGetB067
     * @tc.desc Verify Box<BiFunction018> set with string equals check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<BiFunction018> = new Box<BiFunction018>((a: int, b: string): boolean => false);
      box.set((a: int, b: string): boolean => b === "yes");
      expect(box.get()(0, "yes")).assertTrue();
      expect(box.get()(0, "no")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_6800
     * @tc.name testBoxGenericSetGetB068
     * @tc.desc Verify Box<BigData024> set with partial fields and verify defaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<BigData024> = new Box<BigData024>(new BigData024());
      let d: BigData024 = new BigData024();
      d.f1 = 5;
      d.f5 = 25;
      box.set(d);
      expect(box.get().f1).assertEqual(5);
      expect(box.get().f2).assertEqual(0);
      expect(box.get().f5).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_6900
     * @tc.name testBoxGenericSetGetB069
     * @tc.desc Verify Box<Teacher025> set with same object and verify identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t: Teacher025 = new Teacher025("Target", 50, "PE");
      let box: Box<Teacher025> = new Box<Teacher025>(new Teacher025("", 0, ""));
      box.set(t);
      expect(box.get() === t).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GENERIC_GETSET_2_7000
     * @tc.name testBoxGenericSetGetB070
     * @tc.desc Verify Box<Config028> set with alternate config and verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBoxGenericSetGetB070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: Box<Config028> = new Box<Config028>({ host: "old", port: 0 });
      box.set({ host: "new.host", port: 1234 });
      expect(box.get().host).assertEqual("new.host");
      expect(box.get().port).assertEqual(1234);
    });

  });
}
