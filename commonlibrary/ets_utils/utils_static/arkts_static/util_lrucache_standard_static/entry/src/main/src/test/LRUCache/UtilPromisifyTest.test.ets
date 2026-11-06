'use static'

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

import util from "@ohos.util";

import { AnyType } from "../../../../hypium/module/types/common";

function cbFn0(callback: (err: Error | null, value: string) => void): void {
  callback(null, "no-arg-resolve");
}

function cbFn0Sync(callback: (err: Error | null, value: int) => void): void {
  let local: int = 6 * 7;
  callback(null, local);
}

function cbFn1Str(arg: string, callback: (err: Error | null, value: string) => void): void {
  callback(null, arg);
}

function cbFn1Int(arg: int, callback: (err: Error | null, value: int) => void): void {
  callback(null, arg);
}

function cbFn2First(a: string, b: string, callback: (err: Error | null, value: string) => void): void {
  callback(null, a);
}

function cbFn2Last(a: string, b: string, callback: (err: Error | null, value: string) => void): void {
  callback(null, b);
}

function cbFn2Join(a: string, b: string, callback: (err: Error | null, value: string) => void): void {
  callback(null, a + b);
}

function cbFn3Mid(a: string, b: string, c: string, callback: (err: Error | null, value: string) => void): void {
  callback(null, b);
}

function cbFn3Last(a: string, b: string, c: int, callback: (err: Error | null, value: int) => void): void {
  callback(null, c);
}

function cbFn3Join(a: string, b: string, c: string, callback: (err: Error | null, value: string) => void): void {
  callback(null, a + b + c);
}

function cbFnMissing2(a: string, b: string, callback: (err: Error | null, value: string) => void): void {
  callback(null, a + '|' + String(b));
}

function cbFnMissing3(a: string, b: string, c: string, callback: (err: Error | null, value: string) => void): void {
  callback(null, a + '|' + c);
}

function cbFnExtra3(a: string, callback: (err: Error | null, value: string) => void): void {
  callback(null, a);
}

function cbFnExtra4(a: string, b: string, callback: (err: Error | null, value: string) => void): void {
  callback(null, a + b);
}

function cbFn3All(a: string, b: string, c: string, callback: (err: Error | null, value: string) => void): void {
  callback(null, b + c + a);
}

function cbFn2Mix(a: string, b: int, callback: (err: Error | null, value: int) => void): void {
  callback(null, b);
}

function cbFn3Mix(a: string, b: int, c: double, callback: (err: Error | null, value: double) => void): void {
  callback(null, c);
}

function cbNeg1(arg: int, callback: (err: Error | null, value: int) => void): void {
  callback(null, arg);
}

function cbZero(arg: int, callback: (err: Error | null, value: int) => void): void {
  callback(null, arg);
}

function cbOne(arg: int, callback: (err: Error | null, value: int) => void): void {
  callback(null, arg);
}

function cbMaxInt(arg: int, callback: (err: Error | null, value: int) => void): void {
  callback(null, arg);
}

function cbMinInt(arg: int, callback: (err: Error | null, value: int) => void): void {
  callback(null, arg);
}

function cbBigDouble(arg: double, callback: (err: Error | null, value: double) => void): void {
  callback(null, arg);
}

function cbNegDouble(arg: double, callback: (err: Error | null, value: double) => void): void {
  callback(null, arg);
}

function cbSciDouble(arg: double, callback: (err: Error | null, value: double) => void): void {
  callback(null, arg);
}

function cbMaxFloat(arg: float, callback: (err: Error | null, value: float) => void): void {
  callback(null, arg);
}

function cbNaN(arg: double, callback: (err: Error | null, value: double) => void): void {
  callback(null, arg);
}

function cbNegInf(arg: double, callback: (err: Error | null, value: double) => void): void {
  callback(null, arg);
}

function cbEmptyStr(arg: string, callback: (err: Error | null, value: string) => void): void {
  callback(null, arg);
}

function cbLongStr(arg: string, callback: (err: Error | null, value: string) => void): void {
  callback(null, arg);
}

function cbNulStr(arg: string, callback: (err: Error | null, value: string) => void): void {
  callback(null, arg);
}

function cbCjkStr(arg: string, callback: (err: Error | null, value: string) => void): void {
  callback(null, arg);
}

function cbEmojiStr(arg: string, callback: (err: Error | null, value: string) => void): void {
  callback(null, arg);
}

function cbBoolTrue(arg: boolean, callback: (err: Error | null, value: boolean) => void): void {
  callback(null, arg);
}

function cbBoolFalse(arg: boolean, callback: (err: Error | null, value: boolean) => void): void {
  callback(null, arg);
}

function cbNullArg(arg: string | null, callback: (err: Error | null, value: string | null) => void): void {
  callback(null, arg);
}

function cbUndefArg(arg: string | undefined, callback: (err: Error | null, value: string | undefined) => void): void {
  callback(null, arg);
}

function cbBigIntArg(arg: bigint, callback: (err: Error | null, value: bigint) => void): void {
  callback(null, arg);
}

function cbLongArg(arg: long, callback: (err: Error | null, value: long) => void): void {
  callback(null, arg);
}

function cbDateArg(arg: Date, callback: (err: Error | null, value: number) => void): void {
  callback(null, arg.getTime());
}

function cbRegExpArg(arg: RegExp, callback: (err: Error | null, value: string) => void): void {
  callback(null, arg.source);
}

function cbArrayArg(arg: string[], callback: (err: Error | null, value: int) => void): void {
  callback(null, arg.length);
}

function cbUnionArg(arg: Array<string | number>, callback: (err: Error | null, value: string) => void): void {
  callback(null, String(arg[0]));
}

function cbMapArg(arg: Map<string, int>, callback: (err: Error | null, value: int) => void): void {
  callback(null, arg.get('k')!);
}

function cbSetArg(arg: Set<string>, callback: (err: Error | null, value: int) => void): void {
  callback(null, arg.size);
}

function cbUint8Arg(arg: Uint8Array, callback: (err: Error | null, value: int) => void): void {
  let v: int = arg.$_get(0).toInt();
  callback(null, v);
}

function cbRecordArg(arg: Record<string, int>, callback: (err: Error | null, value: int) => void): void {
  let raw: int | undefined = arg['n'];
  if (raw !== undefined) {
    callback(null, raw);
  }
}

class Pager {
  page: int = 0;
}

function cbObjArg(arg: Pager, callback: (err: Error | null, value: int) => void): void {
  callback(null, arg.page);
}

function cbCharArg(arg: char, callback: (err: Error | null, value: char) => void): void {
  callback(null, arg);
}

function cbShortArg(arg: short, callback: (err: Error | null, value: short) => void): void {
  callback(null, arg);
}

function cbByteArg(arg: byte, callback: (err: Error | null, value: byte) => void): void {
  callback(null, arg);
}

function cbMaxValueArg(arg: double, callback: (err: Error | null, value: double) => void): void {
  callback(null, arg);
}

function cbNegZero(arg: double, callback: (err: Error | null, value: double) => void): void {
  callback(null, 1 / arg);
}

function cbTwoStrB(a: string, b: string, callback: (err: Error | null, value: string) => void): void {
  callback(null, b);
}

function cbMixNum(a: int, b: double, callback: (err: Error | null, value: double) => void): void {
  callback(null, a + b);
}

function cbMixBranch(a: string, b: boolean, callback: (err: Error | null, value: string) => void): void {
  if (b) {
    callback(null, a + "-on");
  } else {
    callback(null, a + "-off");
  }
}

function cbMixNull(a: string, b: string | null, callback: (err: Error | null, value: string) => void): void {
  if (b === null) {
    callback(null, "is-null");
  } else {
    callback(null, a);
  }
}

function cbThreeLast(a: string, b: string, c: string, callback: (err: Error | null, value: string) => void): void {
  callback(null, c + a);
}

function cbThreeSum(a: int, b: int, c: int, callback: (err: Error | null, value: int) => void): void {
  callback(null, a + b + c);
}

function cbTwoFlag(a: string, b: int, callback: (err: Error | null, value: string) => void): void {
  if (a === "hex") {
    callback(null, "0x" + b.toString(16));
  } else {
    callback(null, String(b));
  }
}

function cbMixDate(a: string, b: Date, callback: (err: Error | null, value: string) => void): void {
  if (b.getTime() === 0) {
    callback(null, a + "-epoch");
  } else {
    callback(null, a + "-post");
  }
}

function cbMixReg(a: string, b: RegExp, callback: (err: Error | null, value: string) => void): void {
  if (b.test(a)) {
    callback(null, "matched");
  } else {
    callback(null, "missed");
  }
}

function cbTwoExtreme(a: int, b: int, callback: (err: Error | null, value: int) => void): void {
  callback(null, a - b);
}

function cbMixArr(a: string, b: string[], callback: (err: Error | null, value: string) => void): void {
  callback(null, a + ':' + b.length);
}

function cbMixContainers(m: Map<string, int>, s: Set<string>, callback: (err: Error | null, value: int) => void): void {
  callback(null, m.get('k')! + s.size);
}

function cbMixFloat(a: double, b: float, callback: (err: Error | null, value: double) => void): void {
  callback(null, a * b);
}

function cbMixBoolIdx(flag: boolean, idx: int, callback: (err: Error | null, value: int) => void): void {
  let arr: number[] = [10, 20];
  if (flag) {
    let v: int = arr[idx].toInt();
    callback(null, v);
  } else {
    callback(null, 0);
  }
}

function cbThreeJoinNum(a: string, b: string, c: string, callback: (err: Error | null, value: string) => void): void {
  callback(null, a + b + c);
}

function cbThreeTypes(a: Date, b: RegExp, c: string, callback: (err: Error | null, value: string) => void): void {
  if (b.test(c)) {
    callback(null, String(a.getTime()));
  } else {
    callback(null, "no-match");
  }
}

class Point {
  x: number = 1;
  y: number = 2;
}

interface Holder {
  v: number;
}

class BoomError {
  message: string = '';
  constructor(m: string = '') {
    this.message = m;
  }
}

class Counter {
  n: number = 0;
}

function promisifyTopNamed(v: int, callback: (err: Error | null, value: int) => void): void {
  callback(null, v * 2);
}

function promisifyReusable(v: int, callback: (err: Error | null, value: int) => void): void {
  callback(null, v + 100);
}

let promisifyCounter: number = 0;

function promisifyCountFn(v: int, callback: (err: Error | null, value: int) => void): void {
  promisifyCounter++;
  callback(null, v);
}

function promisifyNestInner(v: int, callback: (err: Error | null, value: int) => void): void {
  callback(null, v + 1);
}

class PromisifyBox {
  data: string = '';
  num: int = 0;
  constructor(d: string, n: int) {
    this.data = d;
    this.num = n;
  }
}

class PromisifyCustomError {
  message: string = '';
  code: int = 0;
  constructor(message: string, c: int) {
    this.message = message;
    this.code = c;
  }
}

function promisifyNeg(v: int, callback: (err: Error | null, value: int) => void): void {
  if (v < 0) {
    callback(new Error("negative-input"), 0);
  } else {
    callback(null, v);
  }
}

function promisifyZero(v: int, callback: (err: Error | null, value: int) => void): void {
  if (v === 0) {
    callback(new Error("zero-input"), 0);
  } else {
    callback(null, v);
  }
}

function promisifyRange(v: int, callback: (err: Error | null, value: int) => void): void {
  if (v > 10) {
    callback(new Error("out-of-range"), 0);
  } else {
    callback(null, v);
  }
}

function promisifyNaN(v: number, callback: (err: Error | null, value: number) => void): void {
  if (isNaN(v)) {
    callback(new Error("nan-input"), 0.0);
  } else {
    callback(null, v);
  }
}

function promisifyUndef(v: string | undefined, callback: (err: Error | null, value: string) => void): void {
  if (v === undefined) {
    callback(new Error("undefined-input"), '');
  } else {
    callback(null, v!);
  }
}

function promisifyNull(v: string | null, callback: (err: Error | null, value: string) => void): void {
  if (v === null) {
    callback(new Error("null-input"), '');
  } else {
    callback(null, v!);
  }
}

function promisifyHuge(v: number, callback: (err: Error | null, value: number) => void): void {
  if (v > 1e20) {
    callback(new Error("huge-input"), 0.0);
  } else {
    callback(null, v);
  }
}

function promisifyOverInt(v: number, callback: (err: Error | null, value: number) => void): void {
  if (v > 2147483647) {
    callback(new Error("over-int-max"), 0.0);
  } else {
    callback(null, v);
  }
}

function promisifyUnderInt(v: number, callback: (err: Error | null, value: number) => void): void {
  if (v < -2147483648) {
    callback(new Error("under-int-min"), 0.0);
  } else {
    callback(null, v);
  }
}

function promisifyLen0(v: int, callback: (err: Error | null, value: int) => void): void {
  if (v <= 0) {
    callback(new Error("len-zero"), 0);
  } else {
    callback(null, v);
  }
}

function promisifyLenNeg(v: int, callback: (err: Error | null, value: int) => void): void {
  if (v < 0) {
    callback(new Error("len-negative"), 0);
  } else {
    callback(null, v);
  }
}

function promisifyLenOver(v: int, callback: (err: Error | null, value: int) => void): void {
  if (v > 100) {
    callback(new Error("len-over"), 0);
  } else {
    callback(null, v);
  }
}

function promisifyEmptyArr(v: Array<int>, callback: (err: Error | null, value: string) => void): void {
  if (v.length === 0) {
    callback(new Error("empty-array"), '');
  } else {
    callback(null, "has-item");
  }
}

function promisifySingleArr(v: Array<int>, callback: (err: Error | null, value: string) => void): void {
  if (v.length === 1) {
    callback(new Error("single-array"), '');
  } else {
    callback(null, "multi-item");
  }
}

function promisifySameArr(v: Array<int>, callback: (err: Error | null, value: string) => void): void {
  if (v[0] === v[1] && v[0] === v[2]) {
    callback(new Error("all-same"), '');
  } else {
    callback(null, "mixed");
  }
}

function promisifyNever(v: int, callback: (err: Error | null, value: int) => void): void {
  if (v === undefined) {
    callback(null, 0);
  }
}

function promisifyNoop(callback: (err: Error | null, value: int) => void): void {
  return;
}

function promisifyVarargs(v: Array<int>, callback: (err: Error | null, value: int) => void): void {
  if (v.length === 0) {
    callback(new Error("varargs-empty"), 0);
  } else {
    let sum: int = 0;
    for (let i: int = 0; i < v.length; i++) {
      sum += v[i];
    }
    callback(null, sum);
  }
}

export default function UtilPromisifyTest(): void {
  describe('UtilPromisifyTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PROMISIFY_0100
     * @tc.name testPromisifyThrows001
     * @tc.desc Verify util.promisify throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPromisifyThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          let prom0 = util.promisify(cbFn0);
          let ret0: string = (await prom0()) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let prom0Sync = util.promisify(cbFn0Sync);
          let ret0Sync: number = (await prom0Sync()) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let prom1Str = util.promisify(cbFn1Str);
          let ret1Str: string = (await prom1Str("forward-one")) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let prom1Int = util.promisify(cbFn1Int);
          let ret1Int: number = (await prom1Int(17)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let prom2First = util.promisify(cbFn2First);
          let ret2First: string = (await prom2First("left", "right")) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let prom2Last = util.promisify(cbFn2Last);
          let ret2Last: string = (await prom2Last("first-pos", "second-pos")) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let prom2Join = util.promisify(cbFn2Join);
          let ret2Join: string = (await prom2Join("ab", "cd")) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let prom3Mid = util.promisify(cbFn3Mid);
          let ret3Mid: string = (await prom3Mid("p1", "p2", "p3")) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let promMissing2 = util.promisify(cbFnMissing2);
        try {
          let retMissing2: string = (await promMissing2("only")) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ArgumentsUnderapplicationError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let promMissing3 = util.promisify(cbFnMissing3);
        try {
          let retMissing3: string = (await promMissing3("m1", "m2")) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ArgumentsUnderapplicationError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PROMISIFY_0200
     * @tc.name testPromisifyThrows002
     * @tc.desc Verify util.promisify throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPromisifyThrows002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          let promExtra3 = util.promisify(cbFnExtra3);
          let retExtra3: string = (await promExtra3("keep", "drop1", "drop2")) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let prom3All = util.promisify(cbFn3All);
          let ret3All: string = (await prom3All('A', 'B', 'C')) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let prom2Mix = util.promisify(cbFn2Mix);
          let ret2Mix: number = (await prom2Mix("txt", 6)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promNeg1 = util.promisify(cbNeg1);
          let retNeg1: number = (await promNeg1(-1)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promZero = util.promisify(cbZero);
          let retZero: number = (await promZero(0)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promOne = util.promisify(cbOne);
          let retOne: number = (await promOne(1)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promMaxInt = util.promisify(cbMaxInt);
          let retMaxInt: number = (await promMaxInt(2147483647)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promMinInt = util.promisify(cbMinInt);
          let retMinInt: number = (await promMinInt(-2147483648)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promBigDouble = util.promisify(cbBigDouble);
          let retBigDouble: number = (await promBigDouble(1e15)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promNegDouble = util.promisify(cbNegDouble);
          let retNegDouble: number = (await promNegDouble(-0.25)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PROMISIFY_0300
     * @tc.name testPromisifyThrows003
     * @tc.desc Verify util.promisify throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPromisifyThrows003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          let promSciDouble = util.promisify(cbSciDouble);
          let retSciDouble: number = (await promSciDouble(1.5e-3)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promMaxFloat = util.promisify(cbMaxFloat);
          let retMaxFloat: number = (await promMaxFloat(3.4028235e38)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promNaN = util.promisify(cbNaN);
          let retNaN: number = (await promNaN(Number.NaN)) as number;
          let actual1: boolean = isNaN(retNaN);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promNegInf = util.promisify(cbNegInf);
          let retNegInf: number = (await promNegInf(Number.NEGATIVE_INFINITY)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promEmptyStr = util.promisify(cbEmptyStr);
          let retEmptyStr: string = (await promEmptyStr('')) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promLongStr = util.promisify(cbLongStr);
          let longArg: string = 'y'.repeat(2048);
          let retLongStr: string = (await promLongStr(longArg)) as string;
          let actual1: int = retLongStr.length;
          let expected1: int = 2048;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promNulStr = util.promisify(cbNulStr);
          let nulArg: string = 'a' + '\0' + 'b';
          let retNulStr: string = (await promNulStr(nulArg)) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promCjkStr = util.promisify(cbCjkStr);
          let retCjkStr: string = (await promCjkStr("你好世界")) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promEmojiStr = util.promisify(cbEmojiStr);
          let emojiArg: string = "\u{1F600}";
          let retEmojiStr: string = (await promEmojiStr(emojiArg)) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promBoolTrue = util.promisify(cbBoolTrue);
          let retBoolTrue: boolean = (await promBoolTrue(true)) as boolean;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PROMISIFY_0400
     * @tc.name testPromisifyThrows004
     * @tc.desc Verify util.promisify throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPromisifyThrows004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          let promBoolFalse = util.promisify(cbBoolFalse);
          let retBoolFalse: boolean = (await promBoolFalse(false)) as boolean;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promNullArg = util.promisify(cbNullArg);
          let nil: string | null = null;
          let retNullArg: string | null = (await promNullArg(nil)) as string | null;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promUndefArg = util.promisify(cbUndefArg);
          let und: string | undefined = undefined;
          let retUndefArg: string | undefined = (await promUndefArg(und)) as string | undefined;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promBigIntArg = util.promisify(cbBigIntArg);
          let bigNum: bigint = BigInt("9223372036854775807");
          let retBigIntArg: bigint = (await promBigIntArg(bigNum)) as bigint;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promLongArg = util.promisify(cbLongArg);
          let retLongArg: number = (await promLongArg(2147483648)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promDateArg = util.promisify(cbDateArg);
          let dIn: Date = new Date(0);
          let retDateArg: number = (await promDateArg(dIn)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promRegExpArg = util.promisify(cbRegExpArg);
          let rIn: RegExp = new RegExp("ab+c", 'g');
          let retRegExpArg: string = (await promRegExpArg(rIn)) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promArrayArg = util.promisify(cbArrayArg);
          let names: string[] = ['a', 'b', 'c'];
          let retArrayArg: number = (await promArrayArg(names)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promUnionArg = util.promisify(cbUnionArg);
          let packed: Array<string | number> = ["hello world", 8];
          let retUnionArg: string = (await promUnionArg(packed)) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promMapArg = util.promisify(cbMapArg);
          let mIn: Map<string, int> = new Map<string, int>();
          mIn.set('k', 5);
          let retMapArg: number = (await promMapArg(mIn)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PROMISIFY_0500
     * @tc.name testPromisifyThrows005
     * @tc.desc Verify util.promisify throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPromisifyThrows005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          let promSetArg = util.promisify(cbSetArg);
          let sIn: Set<string> = new Set<string>();
          sIn.add('x');
          sIn.add('y');
          let retSetArg: number = (await promSetArg(sIn)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promUint8Arg = util.promisify(cbUint8Arg);
          let bytesIn: Uint8Array = new Uint8Array(2);
          bytesIn.$_set(0, 77);
          let retUint8Arg: number = (await promUint8Arg(bytesIn)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promRecordArg = util.promisify(cbRecordArg);
          let recIn: Record<string, int> = { 'n': 6 };
          let retRecordArg: number = (await promRecordArg(recIn)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promObjArg = util.promisify(cbObjArg);
          let pg: Pager = new Pager();
          pg.page = 9;
          let retObjArg: number = (await promObjArg(pg)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promCharArg = util.promisify(cbCharArg);
          let retCharArg: string = (await promCharArg(c'A')) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promShortArg = util.promisify(cbShortArg);
          let retShortArg: number = (await promShortArg(32767)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promByteArg = util.promisify(cbByteArg);
          let retByteArg: number = (await promByteArg(255)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promMaxValueArg = util.promisify(cbMaxValueArg);
          let retMaxValueArg: number = (await promMaxValueArg(Number.MAX_VALUE)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promNegZero = util.promisify(cbNegZero);
          let retNegZero: number = (await promNegZero(-0)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promTwoStrB = util.promisify(cbTwoStrB);
          let retTwoStrB: string = (await promTwoStrB("alpha", "beta")) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PROMISIFY_0600
     * @tc.name testPromisifyThrows006
     * @tc.desc Verify util.promisify throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPromisifyThrows006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          let promMixNum = util.promisify(cbMixNum);
          let retMixNum: number = (await promMixNum(3, 0.5)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promMixBranch = util.promisify(cbMixBranch);
          let retMixBranch: string = (await promMixBranch("switch", false)) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promMixNull = util.promisify(cbMixNull);
          let nilB: string | null = null;
          let retMixNull: string = (await promMixNull("key", nilB)) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promThreeLast = util.promisify(cbThreeLast);
          let retThreeLast: string = (await promThreeLast("one", "two", "three")) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promThreeSum = util.promisify(cbThreeSum);
          let retThreeSum: number = (await promThreeSum(-5, 0, 9)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promTwoFlag = util.promisify(cbTwoFlag);
          let retTwoFlag: string = (await promTwoFlag("hex", 255)) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promMixDate = util.promisify(cbMixDate);
          let epoch: Date = new Date(0);
          let retMixDate: string = (await promMixDate('t', epoch)) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promMixReg = util.promisify(cbMixReg);
          let reIn: RegExp = new RegExp("^ab");
          let retMixReg: string = (await promMixReg("abc", reIn)) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promTwoExtreme = util.promisify(cbTwoExtreme);
          let retTwoExtreme: number = (await promTwoExtreme(2147483647, -2147483648)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promMixArr = util.promisify(cbMixArr);
          let list: string[] = ['p', 'q'];
          let retMixArr: string = (await promMixArr("tag", list)) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PROMISIFY_0700
     * @tc.name testPromisifyThrows007
     * @tc.desc Verify util.promisify throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPromisifyThrows007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          let promMixContainers = util.promisify(cbMixContainers);
          let mIn2: Map<string, int> = new Map<string, int>();
          mIn2.set('k', 10);
          let sIn2: Set<string> = new Set<string>();
          sIn2.add('a');
          sIn2.add('b');
          let retMixContainers: number = (await promMixContainers(mIn2, sIn2)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promMixFloat = util.promisify(cbMixFloat);
          let retMixFloat: number = (await promMixFloat(2.5, 4)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promMixBoolIdx = util.promisify(cbMixBoolIdx);
          let retMixBoolIdx: number = (await promMixBoolIdx(true, 1)) as number;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promThreeJoinNum = util.promisify(cbThreeJoinNum);
          let retThreeJoinNum: string = (await promThreeJoinNum('v', "2026", "-1")) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promThreeTypes = util.promisify(cbThreeTypes);
          let dNow: Date = new Date(1000);
          let reNow: RegExp = new RegExp('o');
          let retThreeTypes: string = (await promThreeTypes(dNow, reNow, "open")) as string;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          await wrapped(7);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          await wrapped(1.5);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          await wrapped("tag");
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped(42)) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped(9007199254740991)) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PROMISIFY_0800
     * @tc.name testPromisifyThrows008
     * @tc.desc Verify util.promisify throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPromisifyThrows008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped(-5)) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped(3.14)) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped(1e21)) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped("hello world")) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped("你好世界")) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped('😀')) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped(true)) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped(false)) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, null);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, undefined);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PROMISIFY_0900
     * @tc.name testPromisifyThrows009
     * @tc.desc Verify util.promisify throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPromisifyThrows009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, -0);
          };
          const wrapped = util.promisify(original);
          let res: number = (await wrapped()) as number;
          let actual1: number = 1 / res.toDouble();
          let expected1: number = -Number.POSITIVE_INFINITY;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, Number.NaN);
          };
          const wrapped = util.promisify(original);
          let res: number = (await wrapped()) as number;
          let actual1: boolean = isNaN(res.toDouble());
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, Number.POSITIVE_INFINITY);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, -Number.POSITIVE_INFINITY);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, 9223372036854775807n);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped(-2147483648)) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped(255)) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let shared: Point = new Point();
          const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, shared);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let arr: number[] = [1, 2, 3];
          const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, arr);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let m: Map<string, number> = new Map<string, number>();
          m.set('a', 1);
          const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, m);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PROMISIFY_1000
     * @tc.name testPromisifyThrows010
     * @tc.desc Verify util.promisify throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPromisifyThrows010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          let d: Date = new Date(1700000000000);
          const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, d);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped()) as AnyType;
          let actual1: number = (res as Date).getTime();
          let expected1: number = 1700000000000;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let pojo: Holder = { v: 7 };
          const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, pojo);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
          cb(new Error("boom"), null);
        };
        const wrapped = util.promisify(original);
        try {
          await wrapped();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
          cb(new Error(''), null);
        };
        const wrapped = util.promisify(original);
        try {
          await wrapped();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let boom: BoomError = new BoomError("custom");
        const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
          cb(boom as Error, null);
        };
        const wrapped = util.promisify(original);
        try {
          await wrapped();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let errObj: Error = new Error("same-ref");
        const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
          cb(errObj, null);
        };
        const wrapped = util.promisify(original);
        try {
          await wrapped();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
          cb(new Error("priority"), val);
        };
        const wrapped = util.promisify(original);
        try {
          await wrapped(99);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped("hello")) as AnyType;
          let actual1: int = (res as string).length;
          let expected1: int = 5;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped('')) as AnyType;
          let actual1: int = (res as string).length;
          let expected1: int = 0;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped("你好")) as AnyType;
          let actual1: int = (res as string).length;
          let expected1: int = 2;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PROMISIFY_1100
     * @tc.name testPromisifyThrows011
     * @tc.desc Verify util.promisify throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPromisifyThrows011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let src: number[] = [1, 2, 3];
          let res: AnyType = (await wrapped(src)) as AnyType;
          let actual1: int = (res as Array<number>).length;
          let expected1: int = 3;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let empty: number[] = [];
          let res: AnyType = (await wrapped(empty)) as AnyType;
          let actual1: int = (res as Array<number>).length;
          let expected1: int = 0;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let buf: Uint8Array = new Uint8Array([1, 2, 3, 4]);
          let res: AnyType = (await wrapped(buf)) as AnyType;
          let actual1: int = (res as Uint8Array).byteLength;
          let expected1: int = 4;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let emptyBuf: Uint8Array = new Uint8Array(0);
          let res: AnyType = (await wrapped(emptyBuf)) as AnyType;
          let actual1: int = (res as Uint8Array).byteLength;
          let expected1: int = 0;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let m: Map<string, number> = new Map<string, number>();
          m.set('a', 1);
          m.set('b', 2);
          let res: AnyType = (await wrapped(m)) as AnyType;
          let actual1: number = (res as Map<string, number>).size;
          let expected1: int = 2;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let longStr: string = 'x'.repeat(10000);
          let res: AnyType = (await wrapped(longStr)) as AnyType;
          let actual1: int = (res as string).length;
          let expected1: int = 10000;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, "first");
            cb(null, "second");
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, 1);
            cb(new Error("late"), null);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let errObj: Error = new Error("stable-msg");
        const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
          cb(errObj, null);
        };
        const wrapped = util.promisify(original);
        try {
          await wrapped();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }
        let actual1: string = errObj.message;
        let expected1: string = "stable-msg";
        expect(actual1).assertEqual(expected1);

      }
      {
        try {
          let total: number = 0;
          const original: Function = async (val: number, cb: (err: Error | null, value: AnyType) => void) => {
            total += val.toDouble();
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          await wrapped(10);
          original(5, (err: Error | null, value: AnyType) => {
            if (err !== null) {
              expect().assertFail();
              return;
            }
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PROMISIFY_1200
     * @tc.name testPromisifyThrows012
     * @tc.desc Verify util.promisify throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPromisifyThrows012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let out: number = ((await wrapped(1)) as number) * 2;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let raw: Promise<AnyType> = wrapped(3) as Promise<AnyType>;
          let out: number = (await raw) as number;

          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let a: number = (await wrapped(2)) as number;
          let b: AnyType = (await wrapped(a.toDouble() + 1)) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          await wrapped(1);
          let res: AnyType = (await wrapped(1000)) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (a: number, b: number, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, a.toDouble() * b.toDouble());
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped(5, 6)) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          const original: Function = async (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, val);
          };
          const wrapped = util.promisify(original);
          let ra: Array<AnyType> = (await Promise.all([wrapped(10), wrapped(20)])) as Array<AnyType>;
          let actual1: number = ra[0] as number;
          let expected1: int = 10;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let buf: Uint8Array = new Uint8Array([1, 2, 3]);
          const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, buf);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped()) as AnyType;
          (res as Uint8Array).$_set(0, 99);
          let actual1: number = Number(buf.$_get(0));
          let expected1: int = 99;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let c: Counter = new Counter();
          const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, c);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped()) as AnyType;
          (res as Counter).n = 88;
          let actual1: number = c.n;
          let expected1: int = 88;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let ab: ArrayBuffer = new ArrayBuffer(16);
          const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, ab);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let m: Map<string, number> = new Map<string, number>();
          m.set('a', 1);
          const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, m);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped()) as AnyType;
          (res as Map<string, number>).set('z', 9);
          let actual1: number | undefined = m.get('z');
          let expected1: int = 9;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PROMISIFY_1300
     * @tc.name testPromisifyThrows013
     * @tc.desc Verify util.promisify throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPromisifyThrows013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          let nested: Array<Array<number>> = [[1, 2], [3]];
          const original: Function = async (cb: (err: Error | null, value: AnyType) => void) => {
            cb(null, nested);
          };
          const wrapped = util.promisify(original);
          let res: AnyType = (await wrapped()) as AnyType;
          let actual1: number = (res as Array<Array<number>>)[1][0];
          let expected1: int = 3;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (val: string, callback: (err: Error | null, value: string) => void) => {
            callback(null, val);
          };
          let val = util.promisify(func);
          let res: Object = (await val("hello promisify")) as Object;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let func: Function = async (val: int, callback: (err: Error | null, value: int) => void) => {
          callback(null, val * 2);
        };
        let val = util.promisify(func);
        try {
          let p: Promise<AnyType> = val() as Promise<AnyType>;
          let v = await p;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ArgumentsUnderapplicationError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (a: int, b: int, callback: (err: Error | null, value: int) => void) => {
            callback(null, a + b);
          };
          let val = util.promisify(func);
          let res: Object = (await val.unsafeCall(3, 4)) as Object;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (a: int, b: int, c: int, callback: (err: Error | null, value: int) => void) => {
            callback(null, a + b + c);
          };
          let val = util.promisify(func);
          let res: Object = (await val(1, 2, 3)) as Object;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let val = util.promisify(promisifyTopNamed);
          let res: Object = (await val(21)) as Object;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (val: int, callback: (err: Error | null, value: int) => void) => {
            callback(null, val * 3);
          };
          let val = util.promisify(func);
          let res: Object = (await val(5)) as Object;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let base: int = 10;
          let func: Function = async (val: int, callback: (err: Error | null, value: int) => void) => {
            callback(null, base + val);
          };
          let val = util.promisify(func);
          let res: Object = (await val(5)) as Object;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let val = util.promisify(promisifyReusable);
          let p: Promise<AnyType> = val(1) as Promise<AnyType>;
          let a = await p;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          promisifyCounter = 0;
          let val = util.promisify(promisifyCountFn);
          await val(1);
          await val(2);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PROMISIFY_1400
     * @tc.name testPromisifyThrows014
     * @tc.desc Verify util.promisify throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPromisifyThrows014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          let func: Function = async (val: int, callback: (err: Error | null, value: int) => void) => {
            callback(null, val);
          };
          let val = util.promisify(func);
          let p1: Promise<AnyType> = val(5) as Promise<AnyType>;
          let p2: Promise<AnyType> = val(5) as Promise<AnyType>;
          let r1 = await p1;
          let r2 = await p2;
          expect(r1).assertEqual(5);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (val: int, callback: (err: Error | null, value: int) => void) => {
            let inner = util.promisify(promisifyNestInner);
            let r: number = (await inner(val)) as number;
            callback(null, r.toInt());
          };
          let val = util.promisify(func);
          let res: AnyType = (await val(9)) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (callback: (err: Error | null, value: string) => void) => {
            callback(null, "util-string");
          };
          let val = util.promisify(func);
          let res: AnyType = (await val()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (callback: (err: Error | null, value: int) => void) => {
            callback(null, -7);
          };
          let val = util.promisify(func);
          let res: AnyType = (await val()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (callback: (err: Error | null, value: number) => void) => {
            callback(null, 3.5);
          };
          let val = util.promisify(func);
          let res: AnyType = (await val()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (callback: (err: Error | null, value: boolean) => void) => {
            callback(null, false);
          };
          let val = util.promisify(func);
          let res: AnyType = (await val()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (callback: (err: Error | null, value: Object | null) => void) => {
            callback(null, null);
          };
          let val = util.promisify(func);
          let res: AnyType = (await val()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (callback: (err: Error | null, value: PromisifyBox) => void) => {
            callback(null, new PromisifyBox("box", 9));
          };
          let val = util.promisify(func);
          let res: PromisifyBox = (await val()) as PromisifyBox;
          let actual1: string = res.data;
          let expected1: string = "box";
          expect(actual1).assertEqual(expected1);
          let actual2: number = res.num;
          let expected2: int = 9;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (callback: (err: Error | null, value: Array<int>) => void) => {
            callback(null, [11, 22, 33]);
          };
          let val = util.promisify(func);
          await val();
          let actual1: number = ((await val()) as Array<int>)[2];
          let expected1: int = 33;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (callback: (err: Error | null, value: Map<string, int>) => void) => {
            let m: Map<string, int> = new Map<string, int>();
            m.set('k', 5);
            callback(null, m);
          };
          let val = util.promisify(func);
          let res: Map<string, int> = (await val()) as Map<string, int>;
          let actual1: int | undefined = res.get('k');
          let expected1: int = 5;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PROMISIFY_1500
     * @tc.name testPromisifyThrows015
     * @tc.desc Verify util.promisify throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPromisifyThrows015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          let func: Function = async (callback: (err: Error | null, value: Date) => void) => {
            callback(null, new Date(1000));
          };
          let val = util.promisify(func);
          let res: Date = (await val()) as Date;
          let actual1: number = res.getTime();
          let expected1: int = 1000;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (callback: (err: Error | null, value: bigint) => void) => {
            callback(null, 9007199254740993n);
          };
          let val = util.promisify(func);
          let res: AnyType = (await val()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = (callback: (err: Error | null, value: Array<Promise<int>>) => void) => {
            let pa: Array<Promise<int>> = [
              Promise.resolve(1),
            ];
            callback(null, pa);
          };
          let val = util.promisify(func);
          await val();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let func: Function = async (callback: (err: Error | null, value?: AnyType) => void) => {
          callback(new Error("only-err"), 0);
        };
        let val = util.promisify(func);
        try {
          await val();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let func: Function = async (callback: (err: Error | null, value: int) => void) => {
          callback(new Error("err-with-value"), 42);
        };
        let val = util.promisify(func);
        try {
          await val();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let func: Function = async (callback: (err: Error | null, value?: AnyType) => void) => {
          let e: Error = new Error("custom-message-abc");
          callback(e);
        };
        let val = util.promisify(func);
        try {
          await val();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let func: Function = async (callback: (err: Error | null, value?: AnyType) => void) => {
          callback(new PromisifyCustomError("subclass-err", 10200002) as Object as Error);
        };
        let val = util.promisify(func);
        try {
          await val();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let func: Function = async (callback: (err: Error | null, value?: AnyType) => void) => {
          callback(new Error("reject-then"), 0);
        };
        let val = util.promisify(func);
        let flag: boolean = false;
        try {
          let p: Promise<AnyType> = val() as Promise<AnyType>;
          await p;
          flag = true;
          await p;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }
        expect(flag).assertFalse();

      }
      {
        let origin: Error = new Error("identity-check");
        let func: Function = async (callback: (err: Error | null, value?: AnyType) => void) => {
          callback(origin);
        };
        let val = util.promisify(func);
        try {
          await val();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let val = util.promisify(promisifyNeg);
        try {
          await val(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PROMISIFY_1600
     * @tc.name testPromisifyThrows016
     * @tc.desc Verify util.promisify throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPromisifyThrows016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let val = util.promisify(promisifyZero);
        try {
          await val(0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let val = util.promisify(promisifyRange);
        try {
          await val(11);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let val = util.promisify(promisifyNaN);
        try {
          await val(Number.NaN);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let val = util.promisify(promisifyUndef);
        try {
          await val(undefined);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let val = util.promisify(promisifyNull);
        try {
          await val(null);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let val = util.promisify(promisifyHuge);
        try {
          await val(1e21);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let val = util.promisify(promisifyOverInt);
        try {
          await val(2147483648);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let val = util.promisify(promisifyUnderInt);
        try {
          await val(-2147483649);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let val = util.promisify(promisifyLenNeg);
        try {
          await val(-5);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let val = util.promisify(promisifyLenOver);
        try {
          await val(101);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PROMISIFY_1700
     * @tc.name testPromisifyThrows017
     * @tc.desc Verify util.promisify throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPromisifyThrows017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          let func: Function = async (v: int, callback: (err: Error | null, value: int) => void) => {
            callback(null, v);
          };
          let val = util.promisify(func);
          let res: AnyType = (await val(1)) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let val = util.promisify(promisifyEmptyArr);
        try {
          await val(new Array<int>());
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let val = util.promisify(promisifySingleArr);
        try {
          await val([1]);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let val = util.promisify(promisifySameArr);
        try {
          await val([7, 7, 7]);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (v: Array<int>, callback: (err: Error | null, value: int) => void) => {
            callback(null, v.length);
          };
          let val = util.promisify(func);
          let res: AnyType = (await val([1, 2, 3, 4])) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let func: Function = async (callback: (err: Error | null, value: int) => void) => {
          let a: Array<int> = [1, 2];
          let x: int = a[5];
          callback(null, x);
        };
        let val = util.promisify(func);
        try {
          await val();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let func: Function = async (callback: (err: Error | null, value: string) => void) => {
          let obj: Object = new Object();
          let x: string = (obj as Record<string, string>)["notExist"] as string;
          callback(null, x);
        };
        let val = util.promisify(func);
        try {
          await val();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let flag: boolean = false;
        try {
          let val = util.promisify(promisifyNever);
          let p: Promise<AnyType> = val(3) as Promise<AnyType>;
          await p;
          flag = true;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }
        expect(flag).assertFalse();

      }
      {
        let flag: boolean = false;
        try {
          let val = util.promisify(promisifyNoop);
          let p: Promise<AnyType> = val() as Promise<AnyType>;
          await p;
          flag = true;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }
        expect(flag).assertFalse();

      }
      {
        try {
          let count: number = 0;
          let func: Function = async (callback: (err: Error | null, value: int) => void) => {
            count++;
            callback(null, count.toInt());
            callback(null, (count + 1).toInt());
          };
          let val = util.promisify(func);
          let res: AnyType = (await val()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PROMISIFY_1800
     * @tc.name testPromisifyThrows018
     * @tc.desc Verify util.promisify throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPromisifyThrows018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          let func: Function = (callback: (err: Error | null, value: int) => void) => {
            callback(null, 88);
          };
          let val = util.promisify(func);
          let res: AnyType = (await val()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (callback: (err: Error | null, value: int, extra: int) => void) => {
            callback(null, 6, 99);
          };
          let val = util.promisify(func);
          let res: AnyType = (await val()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let func: Function = async (callback: (err: Error | null, value: int) => void) => {
          let first: int = 1;
          let second: Error = new Error("order-wrong");
          callback(second, first);
        };
        let val = util.promisify(func);
        try {
          await val();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promisifyOuterState: number = 0;
          let func: Function = async (callback: (err: Error | null, value: int) => void) => {
            promisifyOuterState = promisifyOuterState + 5;
            callback(null, promisifyOuterState.toInt());
          };
          let val = util.promisify(func);
          let res: AnyType = (await val()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let base: int = 30;
          let func: Function = async (callback: (err: Error | null, value: int) => void) => {
            callback(null, base);
          };
          let val = util.promisify(func);
          let res: AnyType = (await val()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (a: int, b: int, callback: (err: Error | null, value: int) => void) => {
            callback(null, a + b);
          };
          let val = util.promisify(func);
          let res: AnyType = (await val(-10, -5)) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (a: int, b: int, callback: (err: Error | null, value: int) => void) => {
            callback(null, a + b);
          };
          let val = util.promisify(func);
          let res: AnyType = (await val(100, 200)) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (a: int, b: int, callback: (err: Error | null, value: int) => void) => {
            callback(null, a + b);
          };
          let val = util.promisify(func);
          let res: AnyType = (await val(0, 1)) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let val = util.promisify(promisifyVarargs);
          let res: AnyType = (await val([1, 2, 3, 4])) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let func: Function = async (callback: (err: Error | null, value: string) => void) => {
          throw new Error("inside-throw");
        };
        let val = util.promisify(func);
        try {
          await val();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PROMISIFY_1900
     * @tc.name testPromisifyThrows019
     * @tc.desc Verify util.promisify throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPromisifyThrows019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          let func: Function = async (callback: (err: Error | null, value: string) => void) => {
            callback(null, "resolved-value");
          };
          let val = util.promisify(func);
          let res: AnyType = (await val()) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (val: string, callback: (err: Error | null, value: string) => void) => {
            callback(null, val);
          };
          let val = util.promisify(func);
          let res: AnyType = (await val("callback-value")) as AnyType;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let longStr: string = '';
          for (let i: int = 0; i < 1000; i++) {
            longStr += 'x';
          }
          let func: Function = async (callback: (err: Error | null, value: string) => void) => {
            callback(null, longStr);
          };
          let val = util.promisify(func);
          let res: string = (await val()) as string;
          let actual1: int = res.length;
          let expected1: int = 1000;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PROMISIFY_2000
     * @tc.name testPromisifyResolve001
     * @tc.desc Verify util.promisify resolving callback behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPromisifyResolve001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        const original: Function = async (val: AnyType, cb: (err: Error | null, ...values: AnyType[]) => void) => {
          cb(null, val, "extra");
        };
        const wrapped = util.promisify(original);
        let res: AnyType = (await wrapped("first")) as AnyType;
        expect(String(res)).assertEqual("first,extra");

      }
      {
        const original: Function = async (val: AnyType, cb: (err: Error | null, ...values: AnyType[]) => void) => {
          cb(null, val, 2, 3);
        };
        const wrapped = util.promisify(original);
        let res: AnyType = (await wrapped(1)) as AnyType;
        expect(String(res)).assertEqual("1,2,3");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_PROMISIFY_2100
     * @tc.name testPromisifyBasic001
     * @tc.desc Verify util.promisify with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPromisifyBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        const original: Function = (val: AnyType, cb: (err: Error | null, value: AnyType) => void) => {
          cb(null, val);
        };
        const wrapped = util.promisify(original);
        let isSameFn: boolean = wrapped === original;
        expect(isSameFn).assertFalse();

      }
      {
        let func: Function = async (val: int, callback: (err: Error | null, value: int) => void) => {
          callback(null, val * 2);
        };
        let inner = util.promisify(func);
        let outer: Function = util.promisify(inner);
        let timeoutFn: () => Promise<AnyType> = async (): Promise<AnyType> => {
          await Utils.msSleep(1000);
          return "timeout";
        };
        let res: AnyType = await Promise.race<AnyType>([outer(4), timeoutFn()]);
        expect(res).assertEqual("timeout");

      }
    });

  });
}
