/*
 * Copyright (c) 2024-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

// it_0: Symbol.iterator
//只读问题
// class C {
//   data: string[] = ['a', 'b', 'c'];
//   [Symbol.iterator]() {
//     return new CIterator(this)
//   }
// }
// class CIterator implements Iterator<string> {
//   index: number = 0
//   base: C
//   constructor(base: C) {
//     this.base = base
//   }
//
//   next(): IteratorResult<string> {
//     return {
//       done: this.index >= this.base.data.length,
//       value: this.index >= this.base.data.length ? undefined : this.base.data[this.index++]
//     }
//   }
// }

// it_1: $_iterator() with inferred return type
//只读问题
// class C1 {
//   data: string[] = ['a', 'b', 'c']
//   $_iterator() {
//     return new CIterator1(this)
//   }
// }
// class CIterator1 implements Iterator<string> {
//   index: number = 0
//   base: C1
//   constructor(base: C1) {
//     this.base = base
//   }
//   next(): IteratorResult<string> {
//     return {
//       done: this.index >= this.base.data.length,
//       value: this.index >= this.base.data.length ? undefined : this.base.data[this.index++]
//     }
//   }
// }

// it_2: abstract class with $_iterator() and override
//只读问题
// abstract class RoArray<T> {
//   abstract val(i: number): T
//   abstract len(): number
//   abstract $_iterator(): XIterator_3<T>
// }
//
// class XIterator_3<T> implements Iterator<T> {
//   index: number = 0
//   data: RoArray<T>
//   constructor(p: RoArray<T>) {
//     this.data = p
//   }
//   override next(): IteratorResult<T> {
//     return {
//       done: this.index >= this.data.len(),
//       value: this.index >= this.data.len() ? undefined : this.data.val(this.index++)
//     }
//   }
// }
//
// class C2 extends RoArray<string> {
//   arr: string[] = ['a', 'b', 'c']
//   override val(i: number): string {
//     return this.arr[i]
//   }
//   override len(): number {
//     return this.arr.length
//   }
//   $_iterator() {
//     return new XIterator_3<string>(this)
//   }
// }
//
// class D_3 extends RoArray<string> {
//   arr: string[] = ['d', 'e', 'f']
//   override val(i: number): string {
//     return this.arr[i]
//   }
//   override len(): number {
//     return this.arr.length
//   }
//   $_iterator() {
//     return new XIterator_3<string>(this)
//   }
// }

// it_3: interface with $_iterator() implementation
//只读问题
// interface RoArray_I<T> {
//   val(i: number): T
//   len(): number
// }
//
// class XIterator_4<T> implements Iterator<T> {
//   index: number = 0
//   data: RoArray_I<T>
//   constructor(p: RoArray_I<T>) {
//     this.data = p
//   }
//   override next(): IteratorResult<T> {
//     return {
//       done: this.index >= this.data.len(),
//       value: this.index >= this.data.len() ? undefined : this.data.val(this.index++)
//     }
//   }
// }
//
// class D_4 {
//   data: RoArray_I<string>
//   constructor(p: RoArray_I<string>) {
//     this.data = p
//   }
//   $_iterator() {
//     return new XIterator_4<string>(this.data)
//   }
// }
//
// class C3 extends D_4 implements RoArray_I<string> {
//   arr: string[] = ['a', 'b', 'c']
//   constructor() {
//     super(this)
//   }
//   override val(i: number): string {
//     return this.arr[i]
//   }
//   override len(): number {
//     return this.arr.length
//   }
// }

// it_4: abstract class implements Iterator
//只读问题
// abstract class C4 implements Iterator<string> {
//   protected $_iterator() {
//     return this
//   }
//   abstract next(): IteratorResult<string>
// }
//
// class D_5 extends C4 {
//   index: number = 0
//   data: string[] = ['a', 'b', 'c']
//   next(): IteratorResult<string> {
//     return {
//       done: this.index >= this.data.length,
//       value: this.index >= this.data.length ? undefined : this.data[this.index++]
//     }
//   }
//   iterate(): string {
//     let res = ''
//     for (let x of this) {
//       res += x
//     }
//     return res
//   }
// }

// it_5: private $_iterator()
//只读问题
// class C5 implements Iterator<string> {
//   index: number = 0
//   data: string[] = ['a', 'b', 'c']
//
//   private $_iterator() {
//     return this
//   }
//   next(): IteratorResult<string> {
//     return {
//       done: this.index >= this.data.length,
//       value: this.index >= this.data.length ? undefined : this.data[this.index++]
//     }
//   }
//   iterate(): string {
//     let res = ''
//     for (let x of this) {
//       res += x
//     }
//     return res
//   }
// }

// it_6: simple iterator implementation
//只读问题
// class C6 implements Iterator<string> {
//   index: number = 0
//   data: string[] = ['a', 'b', 'c']
//   $_iterator() {
//     return this
//   }
//   next(): IteratorResult<string> {
//     return {
//       done: this.index >= this.data.length,
//       value: this.index >= this.data.length ? undefined : this.data[this.index++]
//     }
//   }
// }

// it_7: Indexable with try-catch in next()
//只读问题
// interface Indexable<T> {
//   $_get(i: number): T
// }
// class CArray<T> implements Indexable<T> {
//   arr: T[]
//   constructor(p: T[]) {
//     this.arr = p
//   }
//   $_get(i: number): T {
//     return this.arr[i]
//   }
// }
// class C_7<T> implements Iterator<T> {
//   index: number = 0
//   data: Indexable<T>
//   constructor(data: Indexable<T>) {
//     this.data = data
//   }
//   $_iterator() {
//     return this
//   }
//   next(): IteratorResult<T> {
//     try {
//       let v: T = this.data[this.index++]
//       return { done: false, value: v }
//     } catch (e) {
//       return { done: true, value: undefined }
//     }
//   }
// }

// it_8: nested iteration with Indexable
//只读问题
// class C8 implements Indexable<string> {
//   data: string[] = ['a', 'b', 'c']
//   $_iterator() {
//     return new XIterator_9<string>(this)
//   }
//   $_get(i: number): string {
//     return this.data[i]
//   }
// }
// class D_9 implements Indexable<C8> {
//   data: C8[] = [new C8(), new C8(), new C8()]
//   $_iterator() {
//     return new XIterator_9<C8>(this)
//   }
//   $_get(i: number): C8 {
//     return this.data[i]
//   }
// }
// class XIterator_9<T> implements Iterator<T> {
//   index: number = 0
//   data: Indexable<T>
//   constructor(data: Indexable<T>) {
//     this.data = data
//   }
//   next(): IteratorResult<T> {
//     try {
//       let v: T = this.data[this.index++]
//       return { done: false, value: v }
//     } catch (e) {
//       return { done: true, value: undefined }
//     }
//   }
// }

// it_9: union type iteration
//只读问题
// type UT = C9 | D_10
//
// class C9 implements Iterator<string> {
//   data: string[] = ['a', 'b', 'c']
//   index: number = 0
//   $_iterator() {
//     return this
//   }
//   next(): IteratorResult<string> {
//     return {
//       done: this.index >= this.data.length,
//       value: this.index >= this.data.length ? undefined : this.data[this.index++]
//     }
//   }
// }
//
// class D_10 implements Iterator<string> {
//   data: string[] = ['d', 'e', 'f']
//   index: number = 0
//   $_iterator() {
//     return this
//   }
//   next(): IteratorResult<string> {
//     return {
//       done: this.index >= this.data.length,
//       value: this.index >= this.data.length ? undefined : this.data[this.index++]
//     }
//   }
// }

// it_10: union type with string
//只读问题
// type UT1 = C10 | string
//
// class C10 implements Iterator<string> {
//   data: string[] = ['a', 'b', 'c']
//   index: number = 0
//   $_iterator() {
//     return this
//   }
//   next(): IteratorResult<string> {
//     return {
//       done: this.index >= this.data.length,
//       value: this.index >= this.data.length ? undefined : this.data[this.index++]
//     }
//   }
// }

// it_11: interface with $_iterator() using external data
//只读问题
// let data11: string[] = ['a', 'b', 'c']
// class XIterator_11 implements Iterator<string> {
//   index: number = 0
//   override next(): IteratorResult<string> {
//     return {
//       done: this.index >= data11.length,
//       value: this.index >= data11.length ? undefined : data11[this.index++]
//     }
//   }
// }
// interface I {
//   $_iterator() {
//   return new XIterator_11()
//   }
// }
// class C_11 implements I {}

// it_12: abstract class with $_iterator() using external data
//只读问题
// let data12: string[] = ['a', 'b', 'c']
// class XIterator_12 implements Iterator<string> {
//   index: number = 0
//   override next(): IteratorResult<string> {
//     return {
//       done: this.index >= data12.length,
//       value: this.index >= data12.length ? undefined : data12[this.index++]
//     }
//   }
// }
// abstract class D_12 {
//   $_iterator() {
//     return new XIterator_12()
//   }
// }
// class C_12 extends D_12 {}

// it_13: empty iterator
//只读问题
// class C13 implements Iterator<Object> {
//   $_iterator() {
//     return this
//   }
//   next(): IteratorResult<Object> {
//     return { done: true, value: undefined }
//   }
// }

// it_14: numeric nested iteration (D<T> is generic iterator)
//只读问题
// class D<T> implements Iterator<T> {
//   index: number = 0
//   data: T[]
//   constructor(p: T[]) {
//     this.data = p
//   }
//   $_iterator() {
//     return this
//   }
//   next(): IteratorResult<T> {
//     return {
//       done: this.index >= this.data.length,
//       value: this.index >= this.data.length ? undefined : this.data[this.index++]
//     }
//   }
// }

// it_15: Iterable<string> with CIterator_15
//只读问题
// class C_15 implements Iterable<string> {
//   data: string[] = ['a', 'b', 'c']
//   $_iterator() {
//     return new CIterator_15(this)
//   }
// }
// class CIterator_15 implements Iterator<string> {
//   index: number = 0
//   base: C_15
//   constructor(base: C_15) {
//     this.base = base
//   }
//   next(): IteratorResult<string> {
//     return {
//       done: this.index >= this.base.data.length,
//       value: this.index >= this.base.data.length ? undefined : this.base.data[this.index++]
//     }
//   }
// }

// it_16: Iterable<string> with CIterator_16
//只读问题
// class C_16 implements Iterable<string> {
//   data: string[] = ['a', 'b', 'c']
//   $_iterator() {
//     return new CIterator_16(this)
//   }
// }
// class CIterator_16 implements Iterator<string> {
//   index: number = 0
//   base: C_16
//   constructor(base: C_16) {
//     this.base = base
//   }
//   next(): IteratorResult<string> {
//     return {
//       done: this.index >= this.base.data.length,
//       value: this.index >= this.base.data.length ? undefined : this.base.data[this.index++]
//     }
//   }
// }

// it_17: Iterable with $_get indexer
//只读问题
// class C_17 implements Iterable<string> {
//   data: string[] = ['a', 'b', 'c']
//   $_iterator() {
//     return new CIterator_17(this)
//   }
//   $_get(index: number): string {
//     return this.data[index]
//   }
// }
// class CIterator_17 implements Iterator<string> {
//   index: number = 0
//   base: C_17
//   constructor(base: C_17) {
//     this.base = base
//   }
//   next(): IteratorResult<string> {
//     return {
//       done: this.index >= this.base.data.length,
//       value: this.index >= this.base.data.length ? undefined : this.base[this.index++]
//     }
//   }
// }

// it_18: Iterable with interface literal implementation
//只读问题
// class C18 implements Iterable<string> {
//   data: string[] = ['a', 'b', 'c']
//   index: number = 0;
//
//   next(): IteratorResult<string> {
//     return {
//       done: this.index >= this.data.length,
//       value: this.index >= this.data.length ? undefined : this.data[this.index++]
//     }
//   }
//
//   $_iterator(): Iterator<string> {
//     this.index = 0;
//     let t: Iterator<string> = { next(): IteratorResult<string> { return this.next() } }
//     return t;
//   }
// }

export default function IterableTypesTest(): void {
  describe('IterableTypesTest', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    // /**
    //  * @tc.number    SUB_ITERABLE_TYPES_XTS_TEST_0100
    //  * @tc.name      testIterableTypes0001
    //  * @tc.desc      A class or an interface can be made iterable, meaning that their
    //  *               instances can be used in for-of statements
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     Level 2
    //  */
    // it("testIterableTypes0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let c = new C()
    //   let res = ''
    //   for (let x of c) {
    //     res += x
    //   }
    //   expect(res).assertEqual('abc')
    // });

    // /**
    //  * @tc.number    SUB_ITERABLE_TYPES_XTS_TEST_0200
    //  * @tc.name      testIterableTypes0002
    //  * @tc.desc      A class or an interface can be made iterable, meaning that their
    //  *               instances can be used in for-of statements
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     Level 2
    //  */
    // it("testIterableTypes0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let c = new C1()
    //   let res = ''
    //   for (let x of c) {
    //     res += x
    //   }
    //   expect(res).assertEqual('abc')
    // });

    // /**
    //  * @tc.number    SUB_ITERABLE_TYPES_XTS_TEST_0300
    //  * @tc.name      testIterableTypes0003
    //  * @tc.desc      A class or an interface can be made iterable, meaning that their
    //  *               instances can be used in for-of statements
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     Level 2
    //  */
    // it("testIterableTypes0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let arr: RoArray<string>[] = [new C2(), new D_3()]
    //   let res = ''
    //   for (let x of arr) {
    //     for (let y of x) {
    //       res += y
    //     }
    //   }
    //   expect(res).assertEqual('abcdef')
    // });

    // /**
    //  * @tc.number    SUB_ITERABLE_TYPES_XTS_TEST_0400
    //  * @tc.name      testIterableTypes0004
    //  * @tc.desc      A class or an interface can be made iterable, meaning that their
    //  *               instances can be used in for-of statements
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     Level 2
    //  */
    // it("testIterableTypes0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let c = new C3()
    //   let res = ''
    //   for (let x of c) {
    //     res += x
    //   }
    //   expect(res).assertEqual('abc')
    // });

    // /**
    //  * @tc.number    SUB_ITERABLE_TYPES_XTS_TEST_0500
    //  * @tc.name      testIterableTypes0005
    //  * @tc.desc      A class or an interface can be made iterable, meaning that their
    //  *               instances can be used in for-of statements
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     Level 2
    //  */
    // it("testIterableTypes0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let d = new D_5()
    //   let res = d.iterate()
    //   expect(res).assertEqual('abc')
    // });

    // /**
    //  * @tc.number    SUB_ITERABLE_TYPES_XTS_TEST_0600
    //  * @tc.name      testIterableTypes0006
    //  * @tc.desc      A class or an interface can be made iterable, meaning that their
    //  *               instances can be used in for-of statements
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     Level 2
    //  */
    // it("testIterableTypes0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let c = new C5()
    //   let res = c.iterate()
    //   expect(res).assertEqual('abc')
    // });

    // /**
    //  * @tc.number    SUB_ITERABLE_TYPES_XTS_TEST_0700
    //  * @tc.name      testIterableTypes0007
    //  * @tc.desc      A class or an interface can be made iterable, meaning that their
    //  *               instances can be used in for-of statements
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     Level 2
    //  */
    // it("testIterableTypes0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let c = new C6()
    //   let res = ''
    //   for (let x of c) {
    //     res += x
    //   }
    //   expect(res).assertEqual('abc')
    // });

    // /**
    //  * @tc.number    SUB_ITERABLE_TYPES_XTS_TEST_0800
    //  * @tc.name      testIterableTypes0008
    //  * @tc.desc      A class or an interface can be made iterable, meaning that their
    //  *               instances can be used in for-of statements
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     Level 2
    //  */
    // it("testIterableTypes0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let c = new C_7<string>(new CArray<string>(['a', 'b', 'c']))
    //   let res = ''
    //   for (let x of c) {
    //     res += x
    //   }
    //   expect(res).assertEqual('abc')
    // });

    // /**
    //  * @tc.number    SUB_ITERABLE_TYPES_XTS_TEST_0900
    //  * @tc.name      testIterableTypes0009
    //  * @tc.desc      A class or an interface can be made iterable, meaning that their
    //  *               instances can be used in for-of statements
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     Level 2
    //  */
    // it("testIterableTypes0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let d = new D_9()
    //   let res = ''
    //   for (let x of d) {
    //     for (let y of x) {
    //       res += y
    //     }
    //   }
    //   expect(res).assertEqual('abcabcabc')
    // });

    // /**
    //  * @tc.number    SUB_ITERABLE_TYPES_XTS_TEST_1000
    //  * @tc.name      testIterableTypes0010
    //  * @tc.desc      A class or an interface can be made iterable, meaning that their
    //  *               instances can be used in for-of statements
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     Level 2
    //  */
    // it("testIterableTypes0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let arr: UT[] = [new C9(), new D_10()]
    //   let res = ''
    //   for (let y of arr) {
    //     for (let x of y) {
    //       res += x
    //     }
    //   }
    //   expect(res).assertEqual('abcdef')
    // });

    // /**
    //  * @tc.number    SUB_ITERABLE_TYPES_XTS_TEST_1100
    //  * @tc.name      testIterableTypes0011
    //  * @tc.desc      A class or an interface can be made iterable, meaning that their
    //  *               instances can be used in for-of statements
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     Level 2
    //  */
    // it("testIterableTypes0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let arr: UT1[] = [new C10(), 'def']
    //   let res = ''
    //   for (let y of arr) {
    //     for (let x of y) {
    //       res += x
    //     }
    //   }
    //   expect(res).assertEqual('abcdef')
    // });

    // /**
    //  * @tc.number    SUB_ITERABLE_TYPES_XTS_TEST_1200
    //  * @tc.name      testIterableTypes0012
    //  * @tc.desc      A class or an interface can be made iterable, meaning that their
    //  *               instances can be used in for-of statements
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     Level 2
    //  */
    // it("testIterableTypes0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let c = new C_11()
    //   let res = ''
    //   for (let x of c) {
    //     res += x
    //   }
    //   expect(res).assertEqual('abc')
    // });

    // /**
    //  * @tc.number    SUB_ITERABLE_TYPES_XTS_TEST_1300
    //  * @tc.name      testIterableTypes0013
    //  * @tc.desc      A class or an interface can be made iterable, meaning that their
    //  *               instances can be used in for-of statements
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     Level 2
    //  */
    // it("testIterableTypes0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let c = new C_12()
    //   let res = ''
    //   for (let x of c) {
    //     res += x
    //   }
    //   expect(res).assertEqual('abc')
    // });

    // /**
    //  * @tc.number    SUB_ITERABLE_TYPES_XTS_TEST_1400
    //  * @tc.name      testIterableTypes0014
    //  * @tc.desc      A class or an interface can be made iterable, meaning that their
    //  *               instances can be used in for-of statements
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     Level 2
    //  */
    // it("testIterableTypes0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let c = new C13()
    //   let res = ''
    //   for (let x of c) {
    //     res += '.'
    //   }
    //   expect(res).assertEqual('')
    // });

    // /**
    //  * @tc.number    SUB_ITERABLE_TYPES_XTS_TEST_1500
    //  * @tc.name      testIterableTypes0015
    //  * @tc.desc      A class or an interface can be made iterable, meaning that their
    //  *               instances can be used in for-of statements
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     Level 2
    //  */
    // it("testIterableTypes0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let nums: Number[] = [1, 2, 3]
    //   let arr: D<Number>[] = [new D<Number>(nums), new D<Number>(nums), new D<Number>(nums)]
    //   let top = new D<D<Number>>(arr)
    //   let res = 0
    //   for (let x of top) {
    //     for (let y of x) {
    //       res += y
    //     }
    //   }
    //   expect(res).assertEqual(18)
    // });

    // /**
    //  * @tc.number    SUB_ITERABLE_TYPES_XTS_TEST_1600
    //  * @tc.name      testIterableTypes0016
    //  * @tc.desc      A class or an interface can be made iterable, meaning that their
    //  *               instances can be used in for-of statements
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     Level 2
    //  */
    // it("testIterableTypes0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let c = new C_15()
    //   let res = ''
    //   for (let x of c) {
    //     res += x
    //   }
    //   expect(res).assertEqual('abc')
    // });

    // /**
    //  * @tc.number    SUB_ITERABLE_TYPES_XTS_TEST_1700
    //  * @tc.name      testIterableTypes0017
    //  * @tc.desc      A class or an interface can be made iterable, meaning that their
    //  *               instances can be used in for-of statements
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     Level 2
    //  */
    // it("testIterableTypes0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let c = new C_16()
    //   let iref = c.$_iterator();
    //
    //   let next = iref.next();
    //   let result = ''
    //   while (!next.done) {
    //     result += next.value
    //     next = iref.next()
    //   }
    //   expect(result).assertEqual('abc')
    // });

    // /**
    //  * @tc.number    SUB_ITERABLE_TYPES_XTS_TEST_1800
    //  * @tc.name      testIterableTypes0018
    //  * @tc.desc      A class or an interface can be made iterable, meaning that their
    //  *               instances can be used in for-of statements
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     Level 2
    //  */
    // it("testIterableTypes0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let c = new C_17()
    //   let res = ''
    //   for (let x of c) {
    //     res += x
    //   }
    //   expect(res).assertEqual('abc')
    // });

    // /**
    //  * @tc.number    SUB_ITERABLE_TYPES_XTS_TEST_1900
    //  * @tc.name      testIterableTypes0019
    //  * @tc.desc      A class or an interface can be made iterable, meaning that their
    //  *               instances can be used in for-of statements
    //  * @tc.size      MediumTest
    //  * @tc.type      Function
    //  * @tc.level     Level 2
    //  */
    // it("testIterableTypes0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    //   let c = new C18()
    //   let res = ''
    //   for (let x of c) {
    //     res += x
    //   }
    //   expect(res).assertEqual('abc')
    // });

  });
}