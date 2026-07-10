'use static'
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '@ohos/hypium-binary/src/main/indexStatic';

import Utils from '../../Util.test'
class A {}

class B extends A {}
function assignSameType1(x: number, y: number) {
  x = y
}
function assignIndexed1(x: number[]) {
  x = [1, 2]
}
function assignSameType2(x: number, y: number) {
  x = y
}
function assignOtherType2(x: number, y: number) {
  x = y
}
function assignIndexed2(x: number[]) {
  x = [1, 2]
}
function assignSameType3(x: number, y: number) {
  x = y
}
function assignOtherType3(x: number, y: number) {
  x = y
}
function assignIndexed3(x: number[]) {
  x = [0xff, 13]
}
function assignSameType4(x: number, y: number) {
  x = y
}
function assignOtherType4(x: number, y: number) {
  x = y
}
function assignIndexed4(x: number[]) {
  x = [42.42, 2]
}
function assignSameType5(x: number, y: number) {
  x = y
}
function assignOtherType5(x: number, y: number) {
  x = y
}
function assignIndexed5(x: number[]) {
  x = [13.13, 3.14]
}
function assignSameType6(x: number, y: number) {
  x = y
}
function assignOtherType6(x: number, y: number) {
  x = y
}
function assignIndexed6(x: number[]) {
  x = [1.1, 2.2]
}
function assignSameType7(x: bigint, y: bigint) {
  x = y
}
function assignOtherType7(x: bigint, y: bigint) {
  x = y
}
function assignIndexed7(x: bigint[]) {
  x = [2n, 13n]
}
function assignSameType8(x: Object, y: Object) {
  x = y
}
function assignOtherType8(x: Object, y: bigint) {
  x = y
}
function assignIndexed8(x: Object[]) {
  x = [new Object(), 13n]
}
function assignSameType9(x: Object, y: Object) {
  x = y
}
function assignOtherType9(x: Object, y: number) {
  x = y
}
function assignIndexed9(x: Object[]) {
  x = [1, 2]
}
function assignSameType10(x: string, y: string) {
  x = y
}
function assignOtherType10(x: string, y: string) {
  x = y
}
function assignIndexed10(x: string[]) {
  x = ["a", "b"]
}
function assignSameType11(x: null, y: null) {
  x = y
}
function assignOtherType11(x: null, y: null) {
  x = y
}
function assignIndexed11(x: null[]) {
  x = [null, null]
}
function assignSameType12(x: A, y: A) {
  x = y
}
function assignOtherType12(x: A, y: B) {
  x = y
}
function assignIndexed12(x: A[]) {
  x = [new A(), new B()]
}
function assignSameType13(x: undefined, y: undefined) {
  x = y
}
function assignOtherType13(x: undefined, y: undefined) {
  x = y
}
function assignIndexed13(x: undefined[]) {
  x = [undefined, undefined]
}
function assignSameType14(x: (number | null), y: (number | null)) {
  x = y
}
function assignOtherType14(x: (number | null), y: number) {
  x = y
}
function assignIndexed14(x: (number | null)[]) {
  x = [null, 42]
}
function assignSameType15(x: number, y: number) {
  x = y
}
function assignOtherType15(x: number, y: (number | null)) {
  x = y ?? 1
}
function assignIndexed15(x: number[]) {
  x = [1, 42]
}

export default function SpecificsOfAssignmentLikeContexts(): void{
  describe('SpecificsOfAssignmentLikeContexts', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_BASEDATE_POSITIVE_CASES_0100
     * @tc.name      testPositiveCasesOne0001
     * @tc.desc      Assignment-like context is specific in that the type of a left-hand-side expression is known,
     * but the type of a right-hand-side expression is not necessarily known in the context as follows
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPositiveCasesOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      assignSameType1(1, 1)
      assignOtherType1(1, 2)
      assignIndexed1([])
      assignSameType2(1, 1)
      assignOtherType2(1, 2)
      assignIndexed2([])
      assignSameType3(0xff, 0xff)
      assignOtherType3(0xff, 13)
      assignIndexed3([])
      assignSameType4(42.42, 42.42)
      assignOtherType4(42.42, 2)
      assignIndexed4([])
      assignSameType5(13.13, 13.13)
      assignOtherType5(13.13, 3.14)
      assignIndexed5([])
      assignSameType6(1.1, 1.1)
      assignOtherType6(1.1, 2.2)
      assignIndexed6([])
      assignSameType7(2n, 2n)
      assignOtherType7(2n, 13n)
      assignIndexed7([])
      assignSameType8(new Object(), new Object())
      assignOtherType8(new Object(), 13n)
      assignIndexed8([])
      assignSameType9(new Object(), new Object())
      assignOtherType9(new Object(), 2)
      assignIndexed9([])
      assignSameType10("a", "a")
      assignOtherType10("a", "b")
      assignIndexed10([])
      assignSameType11(null, null)
      assignOtherType11(null, null)
      assignIndexed11([])
      assignSameType12(new A(), new A())
      assignOtherType12(new A(), new B())
      assignIndexed12([])
      assignSameType13(undefined, undefined)
      assignOtherType13(undefined, undefined)
      assignIndexed13([])
      assignSameType14(null, null)
      assignOtherType14(null, 42)
      assignIndexed14([])
      assignSameType15(1, 1)
      assignOtherType15(1, 42)
      assignIndexed15([])
      let obj: A;
      obj = new B();
      expect(obj instanceof A).assertEqual(true);
    });
  });
}
