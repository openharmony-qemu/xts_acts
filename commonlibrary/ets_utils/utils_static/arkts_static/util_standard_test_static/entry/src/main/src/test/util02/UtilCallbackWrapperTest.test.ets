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
  TestType
} from "@ohos/hypium-static/src/main/indexStatic";
import util from "@ohos.util";
import Utils from "../Util.test";

class Point { x: int = 0; y: int = 0; }

class HBox { tag: string = "hb"; }

class RefErr extends Error {}

export default function utilCallbackWrapperTest(): void {
  describe("UtilCallbackWrapperTest", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_CALLBACK_WRAPPER_0100
     * @tc.name testUtilCallbackWrapperTest001
     * @tc.desc Verify callbackWrapper returns a function for async and non-async inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilCallbackWrapperTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fnAsync = async (): Promise<string> => {
        return "x";
      };
      let cbAsync: Function = util.callbackWrapper(fnAsync);
      let actualAsync: boolean = typeof cbAsync === "function";
      expect(actualAsync).assertTrue();

      const plainType = (x: int): int => {
        return x;
      };
      let cbPlain: Function = util.callbackWrapper(plainType);
      let actualPlain: string = typeof cbPlain;
      let expectedPlain: string = "function";
      expect(actualPlain).assertEqual(expectedPlain);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_CALLBACK_WRAPPER_0200
     * @tc.name testUtilCallbackWrapperTest002
     * @tc.desc Verify callbackWrapper resolves arity-0 async functions returning string values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilCallbackWrapperTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cases: string[] = [
        "no-arg",
        "outer-const",
        "alpha",
        "hello world",
        "line1\nline2\t",
        "abcd"
      ];
      const factories: (() => Promise<string>)[] = [
        async (): Promise<string> => { return "no-arg"; },
        async (): Promise<string> => { return "outer-const"; },
        async (): Promise<string> => { return "alpha"; },
        async (): Promise<string> => { return "hello world"; },
        async (): Promise<string> => { return "line1\nline2\t"; },
        async (): Promise<string> => { return "abcd"; }
      ];
      for (let i = 0; i < factories.length; i++) {
        let cb: Function = util.callbackWrapper(factories[i]);
        let expected: string = cases[i];
        cb.unsafeCall((err: Error | null, ret: string) => {
          expect(err).assertNull();
          expect(ret).assertEqual(expected);
        });
      }

      const fnLong = async (): Promise<string> => {
        return "a".repeat(1000);
      };
      let cbLong: Function = util.callbackWrapper(fnLong);
      cbLong.unsafeCall((err: Error | null, ret: string) => {
        expect(err).assertNull();
        expect(ret.length).assertEqual(1000);
      });

      const fnLate = async (): Promise<string> => {
        await Utils.msSleep(10);
        return "late-ok";
      };
      let cbLate: Function = util.callbackWrapper(fnLate);
      cbLate.unsafeCall((err: Error | null, ret: string) => {
        expect(err).assertNull();
        expect(ret).assertEqual("late-ok");
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_CALLBACK_WRAPPER_0300
     * @tc.name testUtilCallbackWrapperTest003
     * @tc.desc Verify callbackWrapper forwards arity-1 arguments including special chars, unicode, long strings and multi-call
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilCallbackWrapperTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fnEcho = async (a: string): Promise<string> => {
        return a;
      };
      let cb: Function = util.callbackWrapper(fnEcho);
      let args: string[] = [
        "forward-one",
        "solo",
        "first",
        "second",
        "a".repeat(10000),
        "你好世界",
        "a b"
      ];
      for (let i = 0; i < args.length; i++) {
        let expected: string = args[i];
        cb.unsafeCall(args[i], (err: Error | null, ret: string) => {
          expect(err).assertNull();
          expect(ret).assertEqual(expected);
        });
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_CALLBACK_WRAPPER_0400
     * @tc.name testUtilCallbackWrapperTest004
     * @tc.desc Verify callbackWrapper resolves boolean/null/bigint/undefined values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilCallbackWrapperTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fnTrue = async (): Promise<boolean> => {
        return true;
      };
      let cbTrue: Function = util.callbackWrapper(fnTrue);
      cbTrue.unsafeCall((err: Error | null, ret: boolean) => {
        expect(err).assertNull();
        expect(ret).assertTrue();
      });

      const fnFalse = async (): Promise<boolean> => {
        return false;
      };
      let cbFalse: Function = util.callbackWrapper(fnFalse);
      cbFalse.unsafeCall((err: Error | null, ret: boolean) => {
        expect(err).assertNull();
        expect(ret).assertFalse();
      });

      const fnNull = async (): Promise<null> => {
        return null;
      };
      let cbNull: Function = util.callbackWrapper(fnNull);
      cbNull.unsafeCall((err: Error | null, ret: null) => {
        expect(err).assertNull();
        expect(ret).assertNull();
      });

      const fnBig = async (): Promise<bigint> => {
        return BigInt("9007199254740993");
      };
      let cbBig: Function = util.callbackWrapper(fnBig);
      cbBig.unsafeCall((err: Error | null, ret: bigint) => {
        expect(err).assertNull();
        expect(ret).assertEqual(BigInt("9007199254740993"));
      });

      const fnUndef = async (): Promise<string | undefined> => {
        return undefined;
      };
      let cbUndef: Function = util.callbackWrapper(fnUndef);
      cbUndef.unsafeCall((err: Error | null, ret: string | undefined) => {
        expect(err).assertNull();
        expect(ret).assertUndefined();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_CALLBACK_WRAPPER_0500
     * @tc.name testUtilCallbackWrapperTest005
     * @tc.desc Verify callbackWrapper resolves arrays with expected length and first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilCallbackWrapperTest005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fnThree = async (): Promise<number[]> => {
        return [3, 1, 2];
      };
      let cbThree: Function = util.callbackWrapper(fnThree);
      cbThree.unsafeCall((err: Error | null, ret: number[]) => {
        expect(err).assertNull();
        expect(ret[0]).assertEqual(3);
      });

      const fnEmpty = async (): Promise<number[]> => {
        let e: number[] = [];
        return e;
      };
      let cbEmpty: Function = util.callbackWrapper(fnEmpty);
      cbEmpty.unsafeCall((err: Error | null, ret: number[]) => {
        expect(err).assertNull();
        expect(ret.length).assertEqual(0);
      });

      const fnFive = async (): Promise<number[]> => {
        return [1, 2, 3, 4, 5];
      };
      let cbFive: Function = util.callbackWrapper(fnFive);
      cbFive.unsafeCall((err: Error | null, ret: number[]) => {
        expect(err).assertNull();
        expect(ret.length).assertEqual(5);
      });

      const fnTwo = async (): Promise<number[]> => {
        return [1, 2];
      };
      let cbTwo: Function = util.callbackWrapper(fnTwo);
      cbTwo.unsafeCall((err: Error | null, ret: number[]) => {
        expect(err).assertNull();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_CALLBACK_WRAPPER_0600
     * @tc.name testUtilCallbackWrapperTest006
     * @tc.desc Verify callbackWrapper resolves Maps with expected size and entries
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilCallbackWrapperTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fnKv = async (): Promise<Map<string, string>> => {
        let m: Map<string, string> = new Map<string, string>();
        m.set("k", "v");
        return m;
      };
      let cbKv: Function = util.callbackWrapper(fnKv);
      cbKv.unsafeCall((err: Error | null, ret: Map<string, string>) => {
        expect(err).assertNull();
        expect(ret.get("k") as string).assertEqual("v");
      });

      const fnEmptyM = async (): Promise<Map<string, int>> => {
        return new Map<string, int>();
      };
      let cbEmptyM: Function = util.callbackWrapper(fnEmptyM);
      cbEmptyM.unsafeCall((err: Error | null, ret: Map<string, int>) => {
        expect(err).assertNull();
        expect(ret.size).assertEqual(0);
      });

      const fnTwoM = async (): Promise<Map<string, int>> => {
        let m: Map<string, int> = new Map<string, int>();
        m.set("a", 1);
        m.set("b", 2);
        return m;
      };
      let cbTwoM: Function = util.callbackWrapper(fnTwoM);
      cbTwoM.unsafeCall((err: Error | null, ret: Map<string, int>) => {
        expect(err).assertNull();
        expect(ret.size).assertEqual(2);
      });

      const fnH4 = async (): Promise<Map<string, int>> => {
        let m: Map<string, int> = new Map<string, int>();
        m.set("k", 1);
        return m;
      };
      let cbH4: Function = util.callbackWrapper(fnH4);
      cbH4.unsafeCall((err: Error | null, ret: Map<string, int>) => {
        expect(err).assertNull();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_CALLBACK_WRAPPER_0700
     * @tc.name testUtilCallbackWrapperTest007
     * @tc.desc Verify callbackWrapper resolves TypedArray/DataView/Set with expected byteLength/byteOffset/isView/size
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilCallbackWrapperTest007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fnU8 = async (): Promise<Uint8Array> => {
        return new Uint8Array(8);
      };
      let cbU8: Function = util.callbackWrapper(fnU8);
      cbU8.unsafeCall((err: Error | null, ret: Uint8Array) => {
        expect(err).assertNull();
        expect(ret.byteLength).assertEqual(8);
        expect(ArrayBuffer.isView(ret)).assertTrue();
      });

      const fnU8b = async (): Promise<Uint8Array> => {
        return new Uint8Array(16);
      };
      let cbU8b: Function = util.callbackWrapper(fnU8b);
      cbU8b.unsafeCall((err: Error | null, ret: Uint8Array) => {
        expect(err).assertNull();
        expect(ret.buffer.byteLength).assertEqual(16);
      });

      const fnDv = async (): Promise<DataView> => {
        return new DataView(new ArrayBuffer(4));
      };
      let cbDv: Function = util.callbackWrapper(fnDv);
      cbDv.unsafeCall((err: Error | null, ret: DataView) => {
        expect(err).assertNull();
        expect(ArrayBuffer.isView(ret)).assertTrue();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_CALLBACK_WRAPPER_0800
     * @tc.name testUtilCallbackWrapperTest008
     * @tc.desc Verify callbackWrapper resolves Uint16Array/Float64Array/Set with expected byteOffset/byteLength/size
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilCallbackWrapperTest008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fnU16 = async (): Promise<Uint16Array> => {
        return new Uint16Array(new ArrayBuffer(8), 2, 3);
      };
      let cbU16: Function = util.callbackWrapper(fnU16);
      cbU16.unsafeCall((err: Error | null, ret: Uint16Array) => {
        expect(err).assertNull();
        expect(ret.byteOffset).assertEqual(2);
      });

      const fnF64 = async (): Promise<Float64Array> => {
        return new Float64Array(2);
      };
      let cbF64: Function = util.callbackWrapper(fnF64);
      cbF64.unsafeCall((err: Error | null, ret: Float64Array) => {
        expect(err).assertNull();
        expect(ret.byteLength).assertEqual(16);
      });

      const fnSet = async (): Promise<Set<string>> => {
        let s: Set<string> = new Set<string>();
        s.add("x");
        s.add("y");
        s.add("z");
        return s;
      };
      let cbSet: Function = util.callbackWrapper(fnSet);
      cbSet.unsafeCall((err: Error | null, ret: Set<string>) => {
        expect(err).assertNull();
        expect(ret.size).assertEqual(3);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_CALLBACK_WRAPPER_0900
     * @tc.name testUtilCallbackWrapperTest009
     * @tc.desc Verify callbackWrapper resolves Point/HBox/Date/int values with err null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilCallbackWrapperTest009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fnPoint = async (): Promise<Point> => {
        let p = new Point();
        p.x = 3;
        p.y = 4;
        return p;
      };
      let cbPoint: Function = util.callbackWrapper(fnPoint);
      cbPoint.unsafeCall((err: Error | null, ret: Point) => {
        expect(err).assertNull();
        expect(ret.x).assertEqual(3);
      });

      const fnInt = async (): Promise<int> => {
        return 7;
      };
      let cbInt: Function = util.callbackWrapper(fnInt);
      cbInt.unsafeCall((err: Error | null, ret: number) => {
        expect(err).assertNull();
      });

      const fnHBox = async (): Promise<HBox> => {
        return new HBox();
      };
      let cbHBox: Function = util.callbackWrapper(fnHBox);
      cbHBox.unsafeCall((err: Error | null, ret: HBox) => {
        expect(err).assertNull();
      });

      const fnDate = async (): Promise<Date> => {
        return new Date(0);
      };
      let cbDate: Function = util.callbackWrapper(fnDate);
      cbDate.unsafeCall((err: Error | null, ret: Date) => {
        expect(err).assertNull();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_CALLBACK_WRAPPER_1000
     * @tc.name testUtilCallbackWrapperTest010
     * @tc.desc Verify callbackWrapper resolves control-flow scenarios (await chain, multi-await, try-catch, setTimeout, cross-await, Promise.resolve)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilCallbackWrapperTest010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const innerAsync = async (): Promise<string> => {
        return "inner";
      };
      const fnAwaitChain = async (): Promise<string> => {
        let v: string = await innerAsync();
        return "wrapped-" + v;
      };
      let cbAwaitChain: Function = util.callbackWrapper(fnAwaitChain);
      cbAwaitChain.unsafeCall((err: Error | null, ret: string) => {
        expect(err).assertNull();
        expect(ret).assertEqual("wrapped-inner");
      });

      const stepOne = async (): Promise<int> => { return 1; };
      const stepTwo = async (): Promise<int> => { return 2; };
      const fnMultiAwait = async (): Promise<string> => {
        let a: number = await stepOne();
        let b: number = await stepTwo();
        return String(a + b);
      };
      let cbMultiAwait: Function = util.callbackWrapper(fnMultiAwait);
      cbMultiAwait.unsafeCall((err: Error | null, ret: string) => {
        expect(err).assertNull();
        expect(ret).assertEqual("3");
      });

      const fnSwallow = async (): Promise<string> => {
        try {
          throw new Error("boom-internal");
        } catch (e) {
          return "recovered";
        }
      };
      let cbSwallow: Function = util.callbackWrapper(fnSwallow);
      cbSwallow.unsafeCall((err: Error | null, ret: string) => {
        expect(err).assertNull();
        expect(ret).assertEqual("recovered");
      });

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_CALLBACK_WRAPPER_1100
     * @tc.name testUtilCallbackWrapperTest011
     * @tc.desc Verify callbackWrapper resolves control-flow scenarios part 2 (setTimeout, cross-await, Promise.resolve)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilCallbackWrapperTest011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const delayResolve = async (ms: int): Promise<string> => {
        await Utils.msSleep(ms);
        return "delayed";
      };
      const fnTimer = async (): Promise<string> => {
        return await delayResolve(10);
      };
      let cbTimer: Function = util.callbackWrapper(fnTimer);
      cbTimer.unsafeCall((err: Error | null, ret: string) => {
        expect(err).assertNull();
        expect(ret).assertEqual("delayed");
      });

      const awaitPause = async (): Promise<string> => { return "paused"; };
      const fnCrossAwait = async (a: string): Promise<string> => {
        let p: string = await awaitPause();
        return a + "-" + p;
      };
      let cbCrossAwait: Function = util.callbackWrapper(fnCrossAwait);
      cbCrossAwait.unsafeCall("val", (err: Error | null, ret: string) => {
        expect(err).assertNull();
        expect(ret).assertEqual("val-paused");
      });

      const fnDbl = (): Promise<int> => {
        return Promise.resolve(1);
      };
      let cbDbl: Function = util.callbackWrapper(fnDbl);
      cbDbl.unsafeCall((err: Error | null, ret: number) => {
        expect(err).assertNull();
        expect(ret).assertEqual(1);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_CALLBACK_WRAPPER_1200
     * @tc.name testUtilCallbackWrapperTest012
     * @tc.desc Verify callbackWrapper delivers thrown/rejected errors (message, exact identity, TypeError/RangeError instanceof, ret null)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilCallbackWrapperTest012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fnMsg = async (): Promise<string> => {
        throw new Error("fail-msg");
      };
      let cbMsg: Function = util.callbackWrapper(fnMsg);
      cbMsg.unsafeCall((err: Error, ret: string | null) => {
        expect(err.message).assertEqual("fail-msg");
      });

      let captured: Error = new RefErr();
      const fnCaptured = async (): Promise<string> => {
        throw captured;
      };
      let cbCaptured: Function = util.callbackWrapper(fnCaptured);
      cbCaptured.unsafeCall((err: Error, ret: string | null) => {
        expect(err).assertEqual(captured);
      });

      const fnTe = async (): Promise<int> => {
        throw new TypeError("type");
      };
      let cbTe: Function = util.callbackWrapper(fnTe);
      cbTe.unsafeCall((err: Error, ret: number | null) => {
        expect(err instanceof TypeError).assertTrue();
      });

      const fnRe = async (): Promise<string> => {
        throw new RangeError("r");
      };
      let cbRe: Function = util.callbackWrapper(fnRe);
      cbRe.unsafeCall((err: Error, ret: string | null) => {
        expect(err instanceof RangeError).assertTrue();
        expect(ret).assertNull();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_CALLBACK_WRAPPER_1300
     * @tc.name testUtilCallbackWrapperTest013
     * @tc.desc Verify callbackWrapper delivers rejections raised after await / direct Promise.reject / late / inner-await
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilCallbackWrapperTest013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fnE3Ok = async (): Promise<string> => { return "ok"; };
      const fnAfterAwait = async (): Promise<string> => {
        await fnE3Ok();
        throw new Error("after-await");
      };
      let cbAfterAwait: Function = util.callbackWrapper(fnAfterAwait);
      cbAfterAwait.unsafeCall((err: Error, ret: string | null) => {
        expect(err.message).assertEqual("after-await");
      });

      const fnDirect = (): Promise<string> => {
        return Promise.reject(new Error("direct"));
      };
      let cbDirect: Function = util.callbackWrapper(fnDirect);
      cbDirect.unsafeCall((err: Error, ret: string | null) => {
        expect(err.message).assertEqual("direct");
      });

      const fnLate = async (): Promise<string> => {
        await Utils.msSleep(10);
        throw new Error("late-rej");
      };
      let cbLate: Function = util.callbackWrapper(fnLate);
      cbLate.unsafeCall((err: Error, ret: string | null) => {
        expect(err.message).assertEqual("late-rej");
      });

      const fnInner = async (): Promise<string> => {
        throw new Error("inner");
      };
      const fnOuter = async (): Promise<string> => {
        return await fnInner();
      };
      let cbOuter: Function = util.callbackWrapper(fnOuter);
      cbOuter.unsafeCall((err: Error, ret: string | null) => {
        expect(err.message).assertEqual("inner");
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_CALLBACK_WRAPPER_1400
     * @tc.name testUtilCallbackWrapperTest014
     * @tc.desc Verify a non-async function that throws propagates synchronously from unsafeCall
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilCallbackWrapperTest014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const plainThrow = (): string => {
        throw new Error("plain-throw");
      };
      let cbPlainThrow: Function = util.callbackWrapper(plainThrow);
      try {
        cbPlainThrow.unsafeCall(() => { });
        expect().assertFail();
      } catch (e) {
        let actualValue: string = e.message;
        let expectedValue: string = "plain-throw";
        expect(actualValue).assertEqual(expectedValue);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_CALLBACK_WRAPPER_1500
     * @tc.name testUtilCallbackWrapperTest015
     * @tc.desc Verify a throw inside the callback is not propagated synchronously and the async flag is set after the tick
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("testUtilCallbackWrapperTest015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
      const fnOk = async (): Promise<string> => { return "ok"; };
      let syncResolve: boolean = false;
      let cbOk: Function = util.callbackWrapper(fnOk);
      try {
        cbOk.unsafeCall((err: Error | null, ret: string) => {
          expect(err).assertNull();
          throw new Error("cb-throw");
        });
      } catch (e) {
        syncResolve = true;
      }

      const fnRej = async (): Promise<string> => { throw new Error("rej"); };
      let syncReject: boolean = false;
      let cbRej: Function = util.callbackWrapper(fnRej);
      try {
        cbRej.unsafeCall((err: Error, ret: string | null) => {
          expect(err.message).assertEqual("rej");
          throw new Error("cb-rej-throw");
        });
      } catch (e) {
        syncReject = true;
      }

      let syncFlag: boolean = false;
      let cbFlag: Function = util.callbackWrapper(fnOk);
      cbFlag.unsafeCall((err: Error | null, ret: string) => {
        expect(err).assertNull();
        syncFlag = true;
      });
      expect(syncFlag).assertFalse();

      setTimeout(() => {
        expect(syncResolve).assertFalse();
        expect(syncReject).assertFalse();
        expect(syncFlag).assertTrue();
        done();
      }, 0);
    });

  });
}
