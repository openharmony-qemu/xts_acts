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

import {
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

class Sample_MM02 {
  add(a: number, b: number): number {
    return a + b;
  }
  toString(): string {
    return 'SampleInstance_42';
  }
  getFlag(): boolean {
    return false;
  }
  empty(): void {}
  multiParams(a: number, b: string, c: boolean): string {
    return c ? b : a.toString();
  }
  isReady(): boolean {
    return false;
  }
  getDefault(): number {
    return 0;
  }
}
function _M(ct: ClassType, name: string): Method | null {
  return ct.getMethodByName(name);
}
class MM4_O3_1_7 {
  add(a: number, b: number): number {
    return a + b;
  }
}
class MM4_O3_1_8 {
  val: number = 0;
  add(v: number): void {
    this.val = this.val + v;
  }
  getVal(): number {
    return this.val;
  }
}
class MM4_O3_2_1 {
  concat(a: string, b: string): string {
    return a + b;
  }
}
class MM4_O3_2_2 {
  concat(a: string, b: string): string {
    return a + b;
  }
}
class MM4_O3_2_5 {
  charAt(s: string, i: number): string {
    if (i >= 0 && i < s.length) {
      let r: string = '';
      r = r + s.charAt(i.toInt());
      return r;
    }
    return '';
  }
}
class MM4_O3_3_1 {
  getLen(arr: number[]): number {
    return arr.length;
  }
}
class MM4_O3_3_2 {
  getElem(arr: number[], i: number): number {
    if (i >= 0 && i < arr.length) {
      return arr[i.toInt()];
    }
    return -1;
  }
}
class MM4_O3_3_4 {
  arr: number[] = [1, 2, 3];
  write(idx: number, v: number): void {
    if (idx >= 0 && idx < this.arr.length) {
      this.arr[idx.toInt()] = v;
    }
  }
  read(idx: number): number {
    if (idx >= 0 && idx < this.arr.length) {
      return this.arr[idx.toInt()];
    }
    return -1;
  }
}
class MM4_O3_3_5 {
  arr: number[] = [];
  setArr(a: number[]): void {
    this.arr = a;
  }
  getLen(): number {
    return this.arr.length;
  }
}
class MM4_B4_1_1 {
  data: number[];
  constructor(d: number[]) {
    this.data = d;
  }
  setFirst(v: number): void {
    this.data[0] = v;
  }
  getFirst(): number {
    return this.data[0];
  }
}
class MM4_Buffer4_1_2 {
  buf: number[] = [0, 0, 0];
  setBuf(i: number, v: number): void {
    this.buf[i.toInt()] = v;
  }
  getBuf(i: number): number {
    return this.buf[i.toInt()];
  }
}
class MM4_View4_1_2 {
  source: MM4_Buffer4_1_2;
  constructor(s: MM4_Buffer4_1_2) {
    this.source = s;
  }
  read(i: number): number {
    return this.source.getBuf(i);
  }
}
class MM4_Buffer4_1_3 {
  data: number = 0;
  setData(v: number): void {
    this.data = v;
  }
  getData(): number {
    return this.data;
  }
}
class MM4_View4_1_3 {
  buf: MM4_Buffer4_1_3;
  constructor(b: MM4_Buffer4_1_3) {
    this.buf = b;
  }
  read(): number {
    return this.buf.getData();
  }
}
class MM4_Parent4_2_1 {
  val: number = 0;
  setVal(v: number): void {
    this.val = v;
  }
}
class MM4_Child4_2_1 extends MM4_Parent4_2_1 {
  getVal(): number {
    return this.val;
  }
}
class MM4_Core4_4_3 {
  count: number = 0;
  inc(): void {
    this.count = this.count + 1;
  }
  getCount(): number {
    return this.count;
  }
}
class MM4_Parent4_3_4 {
  getValue(): string {
    return 'parent';
  }
}
class MM4_Child4_3_4 extends MM4_Parent4_3_4 {
  getValue(): string {
    return 'child';
  }
}
class MethodTestHelper001 {
  arity0(): void {}
  arity1(a: number): void {}
  arity2(a: number, b: number): void {}
  arity3(a: number, b: number, c: number): void {}
  arity4(a: number, b: number, c: number, d: number): void {}
  arity5(a: number, b: number, c: number, d: number, e: number): void {}
  arity6(a: number, b: number, c: number, d: number, e: number, f: number): void {}
  arity7(a: number, b: number, c: number, d: number, e: number, f: number, g: number): void {}
  arity8(a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number): void {}
  arity9(a: number, b: number, c: number, d: number, e: number, f: number, g: number, h: number, i: number): void {}
  arity10(
    a: number,
    b: number,
    c: number,
    d: number,
    e: number,
    f: number,
    g: number,
    h: number,
    i: number,
    j: number,
  ): void {}
  arity11(
    a: number,
    b: number,
    c: number,
    d: number,
    e: number,
    f: number,
    g: number,
    h: number,
    i: number,
    j: number,
    k: number,
  ): void {}
  identity(n: number): number {
    return n;
  }
  isNaNCheck(n: number): boolean {
    return isNaN(n);
  }
  isPositive(n: number): boolean {
    return n > 0;
  }
  isNegative(n: number): boolean {
    return n < 0;
  }
  signCheck(n: number): number {
    return n > 0 ? 1 : n < 0 ? -1 : 1 / n === Double.NEGATIVE_INFINITY ? -0 : 0;
  }
  add(a: number, b: number): number {
    return a + b;
  }
  multiply(a: number, b: number): number {
    return a * b;
  }
  echo(s: string): string {
    return s;
  }
  strLen(s: string): number {
    return s.length;
  }
  concat(a: number, b: string): string {
    return b + a;
  }
  isTrue(b: boolean): boolean {
    return b;
  }
  not(b: boolean): boolean {
    return !b;
  }
  and(a: boolean, b: boolean): boolean {
    return a && b;
  }
  or(a: boolean, b: boolean): boolean {
    return a || b;
  }
  describe(a: number, b: boolean): string {
    return b ? String(a) : '';
  }
  repeatStr(s: string, n: number): string {
    let r: string = '';
    for (let i: number = 0; i < n; i++) {
      r += s;
    }
    return r;
  }

  requiredOnly(a: number): number {
    return a;
  }

  oneOptional(a?: number): number {
    return a ?? -1;
  }

  oneDefault(a: number = 100): number {
    return a;
  }

  mixedParams(a: number, b?: string): string {
    return b ?? String(a);
  }

  publicMethod(): number {
    return 0;
  }

  privateMethod(): number {
    return 1;
  }

  static staticIdentity(n: number): number {
    return n;
  }

  static staticConcat(a: string, b: string): string {
    return a + b;
  }

  retVoid(): void {}

  retNumber(): number {
    return 42;
  }

  retString(): string {
    return 'hello';
  }

  retBoolean(): boolean {
    return true;
  }

  varArgsMethod(args: number[]): number {
    return args.length;
  }
}
const __getMethods = (cls: ClassType): Method[] => {
  let result: Method[] = [];
  let n: number = cls.getMethodsNum();
  for (let i: number = 0; i < n; i++) {
    result.push(cls.getMethod(i.toLong()));
  }
  return result;
};

export default function MethodMethod01Test(): void {
  describe('MethodMethod01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_0100
     * @tc.name testMethodMethodAtOne001
     * @tc.desc Verify getType() returns Type instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Type.from<Sample_MM02>() as ClassType;
      let m = cls.getMethodByName('toString');
      expect(m.getType().getResultType() as Object).assertEqual(Type.from<string>());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_0200
     * @tc.name testMethodMethodAtOne002
     * @tc.desc Verify getOwnerType() returns Type instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Type.from<Sample_MM02>() as ClassType;
      let m = cls.getMethodByName('add');
      expect(m.getOwnerType().toString()).assertEqual(Type.from<Sample_MM02>().toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_0300
     * @tc.name testMethodMethodAtOne003
     * @tc.desc Verify getParameter(i).getType() for each param of multiParams returns number, string, boolean in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Type.from<Sample_MM02>() as ClassType;
      let m = cls.getMethodByName('multiParams');
      let mt = m.getType();
      let cnt = mt.getParametersNum();
      for (let i = 0; i < cnt; i++) {
        let paramType: Object = mt.getParameter(i).getType() as Object;
        if (i === 0) {
          expect(paramType).assertEqual(Type.from<number>());
        } else if (i === 1) {
          expect(paramType).assertEqual(Type.from<string>());
        } else {
          expect(paramType).assertEqual(Type.from<boolean>());
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_0400
     * @tc.name testMethodMethodAtOne004
     * @tc.desc Verify normal range arithmetic does not overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: MM4_O3_1_7 = new MM4_O3_1_7();
      let m = (Type.from<MM4_O3_1_7>() as ClassType).getMethodByName('add');
      let r: number = m.invoke(obj, [1000000, 2000000] as FixedArray<object>) as number;
      expect(r as Object).assertEqual(3000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_0500
     * @tc.name testMethodMethodAtOne005
     * @tc.desc Verify concat empty string does not change content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: MM4_O3_2_1 = new MM4_O3_2_1();
      let m = (Type.from<MM4_O3_2_1>() as ClassType).getMethodByName('concat');
      let r: string = m.invoke(obj, ['hello', ''] as FixedArray<object>) as string;
      expect(r as Object).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_0600
     * @tc.name testMethodMethodAtOne006
     * @tc.desc Verify long string concat is not truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: MM4_O3_2_2 = new MM4_O3_2_2();
      let m = (Type.from<MM4_O3_2_2>() as ClassType).getMethodByName('concat');
      let longStr: string = 'abcdefghijklmnopqrstuvwxyz0123456789';
      let r: string = m.invoke(obj, [longStr, longStr] as FixedArray<object>) as string;
      expect(r.length).assertEqual(72);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_0700
     * @tc.name testMethodMethodAtOne007
     * @tc.desc Verify string index out of bounds returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: MM4_O3_2_5 = new MM4_O3_2_5();
      let m = (Type.from<MM4_O3_2_5>() as ClassType).getMethodByName('charAt');
      let r: string = m.invoke(obj, ['abc', 10] as FixedArray<object>) as string;
      expect(r as Object).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_0800
     * @tc.name testMethodMethodAtOne008
     * @tc.desc Verify empty array length returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: MM4_O3_3_1 = new MM4_O3_3_1();
      let m = (Type.from<MM4_O3_3_1>() as ClassType).getMethodByName('getLen') as Method;
      let arr: number[] = [];
      let r: number = m.invoke(obj, [arr] as FixedArray<object>) as number;
      expect(r as Object).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_0900
     * @tc.name testMethodMethodAtOne009
     * @tc.desc Verify array index out of bounds returns default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: MM4_O3_3_2 = new MM4_O3_3_2();
      let m = (Type.from<MM4_O3_3_2>() as ClassType).getMethodByName('getElem');
      let r: number = m.invoke(obj, [[1, 2, 3], 10] as FixedArray<object>) as number;
      expect(r as Object).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_1000
     * @tc.name testMethodMethodAtOne010
     * @tc.desc Verify array out of bounds write is ignored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: MM4_O3_3_4 = new MM4_O3_3_4();
      let mW = (Type.from<MM4_O3_3_4>() as ClassType).getMethodByName('write');
      let mR = (Type.from<MM4_O3_3_4>() as ClassType).getMethodByName('read');
      mW.invoke(obj, [10, 99] as FixedArray<object>);
      let unchanged: number = mR.invoke(obj, [10] as FixedArray<number>) as number;
      expect(unchanged as Object).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_1100
     * @tc.name testMethodMethodAtOne011
     * @tc.desc Verify large array is not truncated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: MM4_O3_3_5 = new MM4_O3_3_5();
      let mSet = (Type.from<MM4_O3_3_5>() as ClassType).getMethodByName('setArr');
      let mGet = (Type.from<MM4_O3_3_5>() as ClassType).getMethodByName('getLen');
      let big: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
      mSet.invoke(obj, [big] as FixedArray<object>);
      let r: number = mGet.invoke(obj, [] as FixedArray<never>) as number;
      expect(r as Object).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_1200
     * @tc.name testMethodMethodAtOne012
     * @tc.desc Verify shared array between instances reflects writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let shared: number[] = [0, 0, 0];
      let a: MM4_B4_1_1 = new MM4_B4_1_1(shared);
      let b: MM4_B4_1_1 = new MM4_B4_1_1(shared);
      let mSet = (Type.from<MM4_B4_1_1>() as ClassType).getMethodByName('setFirst');
      let mGet = (Type.from<MM4_B4_1_1>() as ClassType).getMethodByName('getFirst');
      mSet.invoke(a, [42] as FixedArray<number>);
      let r: number = mGet.invoke(b, [] as FixedArray<never>) as number;
      expect(r as Object).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_1300
     * @tc.name testMethodMethodAtOne013
     * @tc.desc Verify derived view class shares underlying buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let core: MM4_Buffer4_1_2 = new MM4_Buffer4_1_2();
      let view: MM4_View4_1_2 = new MM4_View4_1_2(core);
      let mSet = (Type.from<MM4_Buffer4_1_2>() as ClassType).getMethodByName('setBuf');
      let mViewRead = (Type.from<MM4_View4_1_2>() as ClassType).getMethodByName('read');
      mSet.invoke(core, [1, 99] as FixedArray<object>);
      let r: number = mViewRead.invoke(view, [1] as FixedArray<number>) as number;
      expect(r as Object).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_1400
     * @tc.name testMethodMethodAtOne014
     * @tc.desc Verify multiple views share same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let core: MM4_Buffer4_1_3 = new MM4_Buffer4_1_3();
      let firstView: MM4_View4_1_3 = new MM4_View4_1_3(core);
      let secondView: MM4_View4_1_3 = new MM4_View4_1_3(core);
      let thirdView: MM4_View4_1_3 = new MM4_View4_1_3(core);
      let mSet = (Type.from<MM4_Buffer4_1_3>() as ClassType).getMethodByName('setData');
      let mRead = (Type.from<MM4_View4_1_3>() as ClassType).getMethodByName('read');
      mSet.invoke(core, [77] as FixedArray<number>);
      expect(mRead.invoke(firstView, [] as FixedArray<never>) as number).assertEqual(77);
      expect(mRead.invoke(secondView, [] as FixedArray<never>) as number).assertEqual(77);
      expect(mRead.invoke(thirdView, [] as FixedArray<never>) as number).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_1500
     * @tc.name testMethodMethodAtOne015
     * @tc.desc Verify parent writes field and child reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child: MM4_Child4_2_1 = new MM4_Child4_2_1();
      let mSet = (Type.from<MM4_Parent4_2_1>() as ClassType).getMethodByName('setVal');
      let mGet = (Type.from<MM4_Child4_2_1>() as ClassType).getMethodByName('getVal');
      mSet.invoke(child, [123] as FixedArray<number>);
      let r: number = mGet.invoke(child, [] as FixedArray<never>) as number;
      expect(r as Object).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_1600
     * @tc.name testMethodMethodAtOne016
     * @tc.desc Verify method behavior for add method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: MM4_O3_1_8 = new MM4_O3_1_8();
      let mAdd = (Type.from<MM4_O3_1_8>() as ClassType).getMethodByName('add');
      let mGet = (Type.from<MM4_O3_1_8>() as ClassType).getMethodByName('getVal');
      mAdd.invoke(obj, [2147483647] as FixedArray<number>);
      mAdd.invoke(obj, [1] as FixedArray<number>);
      let mid: number = mGet.invoke(obj, [] as FixedArray<never>) as number;
      mAdd.invoke(obj, [1] as FixedArray<number>);
      let r: number = mGet.invoke(obj, [] as FixedArray<never>) as number;
      expect(mid).assertEqual(2147483648);
      expect(r).assertEqual(2147483649);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_1700
     * @tc.name testMethodMethodAtOne017
     * @tc.desc Verify getValue returns 'child'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child: MM4_Child4_3_4 = new MM4_Child4_3_4();
      let mChild = (Type.from<MM4_Child4_3_4>() as ClassType).getMethodByName('getValue');
      let rChild: string = mChild.invoke(child, [] as FixedArray<never>) as string;
      expect(rChild as Object).assertEqual('child');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_1800
     * @tc.name testMethodMethodAtOne018
     * @tc.desc Verify inc method works through reflection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: MM4_Core4_4_3 = new MM4_Core4_4_3();
      let mInc = (Type.from<MM4_Core4_4_3>() as ClassType).getMethodByName('inc');
      let mGet = _M(Type.from<MM4_Core4_4_3>() as ClassType, 'getCount');
      if (mGet !== null) {
        mInc.invoke(obj, [] as FixedArray<never>);
        let r: number = mGet.invoke(obj, [] as FixedArray<never>) as number;
        expect(r as Object).assertEqual(1);
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_1900
     * @tc.name testMethodMethodAtOne019
     * @tc.desc Verify write method modifies array element correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: MM4_O3_3_4 = new MM4_O3_3_4();
      let mW = (Type.from<MM4_O3_3_4>() as ClassType).getMethodByName('write');
      let mR = (Type.from<MM4_O3_3_4>() as ClassType).getMethodByName('read');
      mW.invoke(obj, [1, 99] as FixedArray<object>);
      let r: number = mR.invoke(obj, [1] as FixedArray<number>) as number;
      expect(r as Object).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_2000
     * @tc.name testMethodMethodAtOne020
     * @tc.desc Verify arity0 getParametersNum returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let method = cls.getMethodByName('arity0');
      expect(method.getType().getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_2100
     * @tc.name testMethodMethodAtOne021
     * @tc.desc Verify arity2 getParametersNum returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let method = cls.getMethodByName('arity2');
      expect(method.getType().getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_2200
     * @tc.name testMethodMethodAtOne022
     * @tc.desc Verify getParametersNum increases with arity (arity5 > arity0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let m0 = cls.getMethodByName('arity0');
      let m5 = cls.getMethodByName('arity5');
      expect(m0.getType().getParametersNum() < m5.getType().getParametersNum()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_2300
     * @tc.name testMethodMethodAtOne023
     * @tc.desc Verify getOwnerType getName returns same value for both methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let m1 = cls.getMethodByName('retNumber');
      let m2 = cls.getMethodByName('retString');
      expect(m1.getOwnerType().getName()).assertEqual(m2.getOwnerType().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_2400
     * @tc.name testMethodMethodAtOne024
     * @tc.desc Verify varArgsMethod getParametersNum returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let method = cls.getMethodByName('varArgsMethod');
      expect(method.getType().getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_2500
     * @tc.name testMethodMethodAtOne025
     * @tc.desc Verify retNumber getResultType returns number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let method = cls.getMethodByName('retNumber');
      expect(method.getType().getResultType()).assertEqual(Type.from<number>());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_2600
     * @tc.name testMethodMethodAtOne026
     * @tc.desc Verify retString getResultType returns string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let method = cls.getMethodByName('retString');
      expect(method.getType().getResultType()).assertEqual(Type.from<string>());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_2700
     * @tc.name testMethodMethodAtOne027
     * @tc.desc Verify static method is unreachable via getMethodByName and throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      try {
        let method = cls.getMethodByName('staticIdentity');
        method.invoke(obj, [-42]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_2800
     * @tc.name testMethodMethodAtOne028
     * @tc.desc Verify arity11 getParametersNum returns 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let method = cls.getMethodByName('arity11');
      expect(method.getType().getParametersNum()).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_2900
     * @tc.name testMethodMethodAtOne029
     * @tc.desc Verify identity with Double.EPSILON returns EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('identity');
      let result = method.invoke(obj, [Double.EPSILON]);
      expect(result as Object).assertEqual(Double.EPSILON);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_3000
     * @tc.name testMethodMethodAtOne030
     * @tc.desc Verify isNaNCheck with NaN returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('isNaNCheck');
      let result = method.invoke(obj, [Double.NaN]);
      expect(result as Object).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_3100
     * @tc.name testMethodMethodAtOne031
     * @tc.desc Verify isPositive with 5e-324 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('isPositive');
      let result = method.invoke(obj, [5e-324]);
      expect(result as Object).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_3200
     * @tc.name testMethodMethodAtOne032
     * @tc.desc Verify isPositive with -0 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('isPositive');
      let result = method.invoke(obj, [-0]);
      expect(result as Object).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_3300
     * @tc.name testMethodMethodAtOne033
     * @tc.desc Verify isNegative with -1e-100 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('isNegative');
      let result = method.invoke(obj, [-1e-100]);
      expect(result as Object).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_3400
     * @tc.name testMethodMethodAtOne034
     * @tc.desc Verify echo with combined special characters returns same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('echo');
      let input: string = '\t\n\r\0\"';
      let result = method.invoke(obj, [input]);
      expect(result as Object).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_3500
     * @tc.name testMethodMethodAtOne035
     * @tc.desc Verify echo with plain string returns same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('echo');
      let result = method.invoke(obj, ['hello']);
      expect(result as string).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_3600
     * @tc.name testMethodMethodAtOne036
     * @tc.desc Verify isTrue with true returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('isTrue');
      let result = method.invoke(obj, [true]);
      expect(result as Object).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_3700
     * @tc.name testMethodMethodAtOne037
     * @tc.desc Verify isTrue with false returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('isTrue');
      let result = method.invoke(obj, [false]);
      expect(result as Object).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_3800
     * @tc.name testMethodMethodAtOne038
     * @tc.desc Verify not with true returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('not');
      let result = method.invoke(obj, [true]);
      expect(result as Object).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_3900
     * @tc.name testMethodMethodAtOne039
     * @tc.desc Verify not with false returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('not');
      let result = method.invoke(obj, [false]);
      expect(result as Object).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_4000
     * @tc.name testMethodMethodAtOne040
     * @tc.desc Verify and with true,true returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('and');
      let result = method.invoke(obj, [true, true]);
      expect(result as Object).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_4100
     * @tc.name testMethodMethodAtOne041
     * @tc.desc Verify and with true,false returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('and');
      let result = method.invoke(obj, [true, false]);
      expect(result as Object).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_4200
     * @tc.name testMethodMethodAtOne042
     * @tc.desc Verify or with false,false returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('or');
      let result = method.invoke(obj, [false, false]);
      expect(result as Object).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_4300
     * @tc.name testMethodMethodAtOne043
     * @tc.desc Verify or with false,true returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('or');
      let result = method.invoke(obj, [false, true]);
      expect(result as Object).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_4400
     * @tc.name testMethodMethodAtOne044
     * @tc.desc Verify add with 5e-324 and 5e-324 returns 1e-323
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('add');
      let result = method.invoke(obj, [5e-324, 5e-324]);
      expect(result as Object).assertEqual(1e-323);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_4500
     * @tc.name testMethodMethodAtOne045
     * @tc.desc Verify add with MAX_VALUE and 0 returns MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('add');
      let result = method.invoke(obj, [Double.MAX_VALUE, 0]);
      expect(result as Object).assertEqual(Double.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_4600
     * @tc.name testMethodMethodAtOne046
     * @tc.desc Verify add with MIN_SAFE_INTEGER and MAX_SAFE_INTEGER returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('add');
      let result = method.invoke(obj, [Number.MIN_SAFE_INTEGER, Number.MAX_SAFE_INTEGER]);
      expect(result as number).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_4700
     * @tc.name testMethodMethodAtOne047
     * @tc.desc Verify concat with 42 and empty string returns 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('concat');
      let result = method.invoke(obj, [42, ''] as FixedArray<Object>);
      expect(result as string).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_4800
     * @tc.name testMethodMethodAtOne048
     * @tc.desc Verify describe with 100 true returns 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('describe');
      let result = method.invoke(obj, [100, true] as FixedArray<Object>);
      expect(result as string).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_4900
     * @tc.name testMethodMethodAtOne049
     * @tc.desc Verify describe with -1 false returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('describe');
      let result = method.invoke(obj, [-1, false] as FixedArray<Object>);
      expect(result as string).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_5000
     * @tc.name testMethodMethodAtOne050
     * @tc.desc Verify repeatStr with abc and 0 returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('repeatStr');
      let result = method.invoke(obj, ['abc', 0] as FixedArray<Object>);
      expect(result as string).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_5100
     * @tc.name testMethodMethodAtOne051
     * @tc.desc Verify repeatStr with x and 5 returns xxxxx
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('repeatStr');
      let result = method.invoke(obj, ['x', 5] as FixedArray<Object>);
      expect(result as string).assertEqual('xxxxx');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_5200
     * @tc.name testMethodMethodAtOne052
     * @tc.desc Verify getOwnerType returns the declaring class for publicMethod of MethodTestHelper001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let method = cls.getMethodByName('publicMethod');
      let declaringType = method.getOwnerType();
      expect(declaringType.getName()).assertEqual(cls.getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_5300
     * @tc.name testMethodMethodAtOne053
     * @tc.desc Verify publicMethod getAccessModifier is non-negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let method = cls.getMethodByName('publicMethod');
      expect(method.getAccessModifier() >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_5400
     * @tc.name testMethodMethodAtOne054
     * @tc.desc Verify retVoid getResultType is void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let method = cls.getMethodByName('retVoid');
      expect(method.getType().getResultType().toString()).assertEqual('void');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_5500
     * @tc.name testMethodMethodAtOne055
     * @tc.desc Verify retBoolean getResultType returns boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let method = cls.getMethodByName('retBoolean');
      expect(method.getType().getResultType()).assertEqual(Type.from<boolean>());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_5600
     * @tc.name testMethodMethodAtOne056
     * @tc.desc Verify different return types number and string are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let mNum: Method | null = cls.getMethodByName('retNumber');
      let mStr: Method | null = cls.getMethodByName('retString');
      expect(mNum as Object)
        .not()
        .assertEqual(mStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_5700
     * @tc.name testMethodMethodAtOne057
     * @tc.desc Verify __getMethods (getMethodsNum + getMethod) traversal of MethodTestHelper001 returns at least 30 methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let methods: Method[] = __getMethods(cls);
      expect(methods.length >= 30).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_5800
     * @tc.name testMethodMethodAtOne058
     * @tc.desc Verify getName returns retNumber for retNumber method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let method = cls.getMethodByName('retNumber');
      expect(method.getName()).assertEqual('retNumber');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_5900
     * @tc.name testMethodMethodAtOne059
     * @tc.desc Verify invoking retNumber returns 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      let obj: MethodTestHelper001 = new MethodTestHelper001();
      let method = cls.getMethodByName('retNumber');
      let result = method.invoke(obj, []);
      expect(result as number).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_METHOD_ONE_6000
     * @tc.name testMethodMethodAtOne060
     * @tc.desc Verify getMethodByName with non-existent method throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodMethodAtOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: ClassType = Type.from<MethodTestHelper001>() as ClassType;
      try {
        cls.getMethodByName('nonExistentMethod');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });
  });
}
