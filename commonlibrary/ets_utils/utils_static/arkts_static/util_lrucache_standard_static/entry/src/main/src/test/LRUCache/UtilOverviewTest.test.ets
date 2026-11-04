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

async function wrapFn(value: string): Promise<string> {
  return value;
}

async function wrapNum(value: int): Promise<int> {
  return value * 2;
}

async function multi(args: Array<string | int>): Promise<string> {
  return args[0] as string;
}

async function wrapReject(): Promise<string> {
  throw new Error('boom');
}

async function undefFn(): Promise<void> {
  return;
}

async function fmtFn(value: string): Promise<string> {
  return util.format('fmt:%s', value);
}

async function addOne(value: int): Promise<int> {
  return value + 1;
}

async function boom(unusedValue: int): Promise<null> {
  return null;
}

async function greet(name: string): Promise<string> {
  return 'hi ' + name;
}

interface Addr {
  city: string;
  country: string;
}

interface P {
  name: string;
  age: int;
  addr: Addr;
}

interface S {
  name: string;
}

interface S2 {
  id: int;
}

function cbStyle(val: int, callback: (err: Error | null, value: int) => void): void {
  callback(null, val);
}

function cbErr(callback: (err: Error | null, value: int) => void): void {
  callback(new Error("custom-fail"), 0);
}

function cbMulti(v: string, n: int, callback: (err: Error | null, value: string) => void): void {
  callback(null, v + n);
}

function cbStr(s: string, callback: (err: Error | null, value: string) => void): void {
  callback(null, s);
}

function cbBool(flag: boolean, callback: (err: Error | null, value: boolean) => void): void {
  callback(null, flag);
}

function cbDouble(d: double, callback: (err: Error | null, value: double) => void): void {
  callback(null, d);
}

function cbNull(callback: (err: Error | null, value: int | null) => void): void {
  callback(null, null);
}

interface P1 {
  name: string;
  age: int;
}

interface Inner {
  v: int;
}

interface Outer {
  o: Inner;
}

interface P4 {
  name: string;
}

interface P5 {
  v: int;
}

function cbFmt(s: string, callback: (err: Error | null, value: string) => void): void {
  callback(null, util.format("fmt:%s", s));
}

function cbP2(callback: (err: Error | null, value: int) => void): void {
  callback(null, 7);
}

interface HashObj {
  name: string;
  age: int;
}

interface Pers {
  name: string;
  age: int;
  address: Addr;
}

const promiseFnStr = async (): Promise<string> => {
  return "value";
};

const promiseFnInt = async (): Promise<int> => {
  return 42;
};

const promiseFnReject = async (): Promise<string> => {
  throw new Error("boom");
};

const promiseFnArr = async (args: Array<string | int>): Promise<string> => {
  return args[0] as string;
};

function errFnStr(val: Any, callback: (err: Error | null, ...value: FixedArray<Any>) => void) {
  callback(null, val);
}

function errFnType(val: Any, callback: (err: Error | null, ...value: FixedArray<Any>) => void) {
  if (typeof val === "int") {
    callback(null, val);
  } else {
    callback(new Error("type err"), 0);
  }
}

function errFnBool(val: Any, callback: (err: Error | null, ...value: FixedArray<Any>) => void) {
  if (typeof val === "boolean") {
    callback(null, val);
  } else {
    callback(new Error("type err"), 0);
  }
}

function errFnNoArg(callback: (err: Error | null, ...value: FixedArray<Any>) => void) {
  callback(null, "noarg");
}

interface Person {
  name: string;
  age: int;
  address: Addr;
}

interface PersonPart03 {
  name: string;
  age: number;
}

export default function UtilOverviewTest(): void {
  describe('UtilOverviewTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_OVERVIEW_0100
     * @tc.name testUtilOvThrows001
     * @tc.desc Verify util module overview APIs throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUtilOvThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          util.format("%s", null as Object);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          util.format("%s", undefined as Object);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let cb = util.callbackWrapper(wrapFn) as (arg0: AnyType, callback: (err: Object | null, ret: AnyType) => void) => void;
          cb("hello", (err: Object | null, ret: AnyType) => {
          if (err !== null) {
            expect().assertFail();
            return;
          }
          expect(ret).assertEqual("hello");
        });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let cb = util.callbackWrapper(wrapNum) as (arg0: AnyType, callback: (err: Object | null, ret: AnyType) => void) => void;
          cb(21, (err: Object | null, ret: AnyType) => {
            if (err !== null) {
              expect().assertFail();
              return;
            }
            expect(ret).assertEqual(42);
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let cb = util.callbackWrapper(multi) as (arg0: AnyType, callback: (err: Object | null, ret: AnyType) => void) => void;
          let args: AnyType = ["hello world", 8];
          cb(args, (err: Object | null, ret: AnyType) => {
            if (err !== null) {
              expect().assertFail();
              return;
            }
            expect(ret).assertEqual("hello world");
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let cb = util.callbackWrapper(wrapReject) as (callback: (err: Object | null, ret: AnyType) => void) => void;
          cb((err: Object | null, ret: AnyType) => {
            if (err === null) {
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
      {
        try {
          let sideEffect = 0;
          const sideFn = async (): Promise<int> => {
            sideEffect = 99;
            return 1;
          };
          let cb = util.callbackWrapper(sideFn) as (callback: (err: Object | null, ret: AnyType) => void) => void;
          cb((err: Object | null, ret: AnyType) => {
            if (err !== null) {
              expect().assertFail();
              return;
            }
            expect(sideEffect).assertEqual(99);
            expect(ret).assertEqual(1);
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let cb = util.callbackWrapper(undefFn) as (callback: (err: Object | null, ret: AnyType) => void) => void;
          cb((err: Object | null, ret: AnyType) => {
            if (err !== null) {
              expect().assertFail();
              return;
            }
            expect(ret).assertUndefined();
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promisified = util.promisify(cbStyle);
          let value: Object = (await promisified(42)) as Object;
          expect(value).assertEqual(42);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let promisified = util.promisify(cbErr);
        try {
          await promisified();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_OVERVIEW_0200
     * @tc.name testUtilOvThrows002
     * @tc.desc Verify util module overview APIs throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUtilOvThrows002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          let promisified = util.promisify(cbMulti);
          let value: Object = (await promisified("n=", 7)) as Object;
          expect(value).assertEqual("n=7");
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promisified = util.promisify(cbStr);
          let value: Object = (await promisified("ok")) as Object;
          expect(value).assertEqual("ok");
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promisified = util.promisify(cbBool);
          let value: Object = (await promisified(true)) as Object;
          expect(value).assertTrue();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promisified = util.promisify(cbDouble);
          let value: Object = (await promisified(3.5)) as Object;
          expect(value).assertEqual(3.5);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promisified = util.promisify(cbNull);
          let value: Object = (await promisified()) as Object;
          expect(value).assertNull();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          util.parseUUID("84bdf796-66cc-4655-9b89--d6218d100f9c");
          expect().assertFail();
        } catch (e) {
          let actual1: number = e.code;
          let expected1: int = 10200002;
          expect(actual1).assertEqual(expected1);
          expect(e.name).assertEqual("BusinessError");
        }

      }
      {
        try {
          util.parseUUID("zzbdf796-66cc-4655-9b89-d6218d100f9c");
          expect().assertFail();
        } catch (e) {
          let actual1: number = e.code;
          let expected1: int = 10200002;
          expect(actual1).assertEqual(expected1);
          expect(e.name).assertEqual("BusinessError");
        }

      }
      {
        try {
          util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f");
          expect().assertFail();
        } catch (e) {
          let actual1: number = e.code;
          let expected1: int = 10200002;
          expect(actual1).assertEqual(expected1);
          expect(e.name).assertEqual("BusinessError");
        }

      }
      {
        try {
          let badArg: Object = 1;
          util.parseUUID(badArg as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let cb = util.callbackWrapper(fmtFn) as (arg0: AnyType, callback: (err: Object | null, ret: AnyType) => void) => void;
          cb("data", (err: Object | null, ret: AnyType) => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_OVERVIEW_0300
     * @tc.name testUtilOvThrows003
     * @tc.desc Verify util module overview APIs throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUtilOvThrows003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          let promisified = util.promisify(cbFmt);
          let value: Object = (await promisified('x')) as Object;
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let promisified = util.promisify(cbP2);
          await promisified();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let cb = util.callbackWrapper(promiseFnInt) as (arg0: AnyType, callback: (err: Object | null, ret: AnyType) => void) => void;
          cb.unsafeCall((err: Error | null, ret: number) => {
            expect(err).assertNull();
            expect(ret).assertEqual(42);
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let cb = util.callbackWrapper(promiseFnReject) as (arg0: AnyType, callback: (err: Object | null, ret: AnyType) => void) => void;
          cb.unsafeCall((err: Error | null, ret: string) => {
            let isNull: boolean = err === null;
            expect(isNull).assertFalse();
            let e: Error = err as Error;
            let actual1: string = e.message;
            let expected1: string = "boom";
            expect(actual1).assertEqual(expected1);
            expect(ret).assertNull();
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let cb = util.callbackWrapper(promiseFnArr) as (arg0: AnyType, callback: (err: Object | null, ret: AnyType) => void) => void;
          let argList: Array<string | int> = ["hello world", 8];
          cb.unsafeCall(argList, (err: Error | null, ret: string) => {
            expect(err).assertNull();
            expect(ret).assertEqual("hello world");
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let u: string | undefined = undefined;
          let result = util.format("%s", u as Object);
          expect(result).assertEqual("undefined");
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let n: string | null = null;
          let result = util.format("%s", n as Object);
          expect(result).assertEqual("null");
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let cb = util.callbackWrapper(addOne) as (arg0: AnyType, callback: (err: Object | null, ret: AnyType) => void) => void;
          cb(1, (err: Object | null, ret: AnyType) => {
            expect(err).assertNull();
            expect(ret).assertEqual(2);
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let cb = util.callbackWrapper(boom) as (arg0: AnyType, callback: (err: Object | null, ret: AnyType) => void) => void;
          cb(1, (err: Object | null, ret: AnyType) => {
            if (err !== null) {
              expect().assertFail();
              return;
            }
            expect(ret).assertNull();
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let cb = util.callbackWrapper(greet) as (arg0: AnyType, callback: (err: Object | null, ret: AnyType) => void) => void;
          cb("tom", (err: Object | null, ret: AnyType) => {
            if (err !== null) {
              expect().assertFail();
              return;
            }
            expect(ret).assertEqual("hi tom");
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_OVERVIEW_0400
     * @tc.name testUtilOvThrows004
     * @tc.desc Verify util module overview APIs throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUtilOvThrows004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        try {
          let func: Function = async (val: number, callback: (err: Error | null, v: number) => void): Promise<void> => {
            callback(null, val);
          };
          let val = util.promisify(func);
          let res: Object = (await val(42)) as Object;
          expect(res).assertEqual(42);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let func: Function = async (val: number, callback: (err: Error | null, v: number) => void): Promise<void> => {
          callback(new Error("rejected"), 0);
        };
        let val = util.promisify(func);
        try {
          await val(1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (val: string, callback: (err: Error | null, v: string) => void): Promise<void> => {
            callback(null, val);
          };
          let val = util.promisify(func);
          let res: Object = (await val("promise")) as Object;
          expect(res).assertEqual("promise");
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          let func: Function = async (callback: (err: Error | null, v: number) => void): Promise<void> => {
            callback(null, 0);
          };
          let val = util.promisify(func);
          let res: Object = (await val()) as Object;
          expect(res).assertEqual(0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        try {
          util.parseUUID('');
          expect().assertFail();
        } catch (e) {
          let actual1: number = e.code;
          let expected1: int = 10200002;
          expect(actual1).assertEqual(expected1);
          expect(e.name).assertEqual("BusinessError");
        }

      }
      {
        try {
          util.parseUUID("84bdf79666cc46559b89d6218d100f9c");
          expect().assertFail();
        } catch (e) {
          let actual1: number = e.code;
          let expected1: int = 10200002;
          expect(actual1).assertEqual(expected1);
          expect(e.name).assertEqual("BusinessError");
        }

      }
      {
        try {
          util.parseUUID("84bdf796-66cc-4655-9b89-g6218d100f9c");
          expect().assertFail();
        } catch (e) {
          let actual1: number = e.code;
          let expected1: int = 10200002;
          expect(actual1).assertEqual(expected1);
          expect(e.name).assertEqual("BusinessError");
        }

      }
      {
        try {
          util.parseUUID("84bdf796-66cc-4655-9b89-d62-18d100f9c");
          expect().assertFail();
        } catch (e) {
          let actual1: number = e.code;
          let expected1: int = 10200002;
          expect(actual1).assertEqual(expected1);
          expect(e.name).assertEqual("BusinessError");
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_OVERVIEW_0500
     * @tc.name testUtilOvFormat001
     * @tc.desc Verify util module overview APIs format conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUtilOvFormat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let r = util.format("plain-text-no-args");
        expect(r).assertEqual("plain-text-no-args");

      }
      {
        let r = util.format("v=%s", 42);
        expect(r).assertEqual("v=42");

      }
      {
        let r = util.format("%s-%s", 'a', 'b');
        expect(r).assertEqual("a-b");

      }
      {
        let r = util.format("%s/%s/%s", 'x', 'y', 'z');
        expect(r).assertEqual("x/y/z");

      }
      {
        let r = util.format("%s|%s", "onlyOne");
        expect(r).assertEqual("onlyOne|%s");

      }
      {
        let r = util.format("%s", "first");
        expect(r).assertEqual("first");

      }
      {
        let r = util.format("n=%s", 1024);
        expect(r).assertEqual("n=1024");

      }
      {
        let r = util.format("d=%s", 3.25);
        expect(r).assertEqual("d=3.25");

      }
      {
        let r = util.format("b=%s", true);
        expect(r).assertEqual("b=true");

      }
      {
        let r = util.format("%d", -7);
        expect(r).assertEqual("-7");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_OVERVIEW_0600
     * @tc.name testUtilOvFormat002
     * @tc.desc Verify util module overview APIs format conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUtilOvFormat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let r = util.format("%i", "42abc");
        expect(r).assertEqual("NaN");

      }
      {
        let r = util.format("%f", 3.141592653);
        expect(r).assertEqual("3.141592653");

      }
      {
        let r = util.format("rate %d%%", 80);
        expect(r).assertEqual("rate 80%%");

      }
      {
        let r = util.format("%s-%d-%i", "str", 1.5, 2.9);
        expect(r).assertEqual("str-1.5-2");

      }
      {
        let r = util.format("[%s]", '');
        expect(r).assertEqual("[]");

      }
      {
        let big: bigint = 123456789012345678901234567890n;
        let r = util.format("%d", big);
        expect(r).assertEqual("123456789012345678901234567890n");

      }
      {
        let p: P = { name: "John", age: 20, addr: { city: "New York", country: "USA" } };
        let r = util.format("%j", p);
        expect(r).assertEqual("{\"name\":\"John\",\"age\":20,\"addr\":{\"city\":\"New York\",\"country\":\"USA\"}}");

      }
      {
        let longStr = '';
        for (let i = 0; i < 10000; i++) {
          longStr += 'x';
        }
        let r = util.format("%s", longStr);
        let actual1: int = r.length;
        let expected1: int = 10000;
        expect(actual1).assertEqual(expected1);

      }
      {
        let s: S = { name: "obj" };
        let r = util.format("%o", s);
        expect(r).assertContain("obj");

      }
      {
        let s2: S2 = { id: 5 };
        let r = util.format("%O", s2);
        expect(r).assertContain('5');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_OVERVIEW_0700
     * @tc.name testUtilOvFormat003
     * @tc.desc Verify util module overview APIs format conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUtilOvFormat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let r = util.format("%s", "你好");
        expect(r).assertEqual("你好");

      }
      {
        let r = util.format("%s", '😀');
        expect(r).assertEqual('😀');

      }
      {
        let r1 = util.format("%s", "one");
        let r2 = util.format("%s", "two");
        expect(r1).assertEqual("one");
        expect(r2).assertEqual("two");

      }
      {
        let actual1: string = util.format("%d", 2147483647);
        let expected1: string = "2147483647";
        expect(actual1).assertEqual(expected1);
        let actual2: string = util.format("%d", -2147483648);
        let expected2: string = "-2147483648";
        expect(actual2).assertEqual(expected2);
        let actual3: string = util.format("%d", 0);
        let expected3: string = '0';
        expect(actual3).assertEqual(expected3);

      }
      {
        let actual1: string = util.format("%d", 9007199254740991);
        let expected1: string = "9007199254740991";
        expect(actual1).assertEqual(expected1);

      }
      {
        let actual1: string = util.format("%d", 1);
        let expected1: string = '1';
        expect(actual1).assertEqual(expected1);
        let actual2: string = util.format("%d", -1);
        let expected2: string = "-1";
        expect(actual2).assertEqual(expected2);

      }
      {
        let desc = util.errnoToString(-1);
        let msg = util.format("errno: %s", desc);
        expect(msg).assertEqual("errno: operation not permitted");

      }
      {
        const r: string = util.format("%s", "hello");
        expect(r).assertEqual("hello");

      }
      {
        const r: string = util.format("The number is %d", 10.5);
        expect(r).assertEqual("The number is 10.5");

      }
      {
        const r: string = util.format("The number is %i", 100.5);
        expect(r).assertEqual("The number is 100");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_OVERVIEW_0800
     * @tc.name testUtilOvFormat004
     * @tc.desc Verify util module overview APIs format conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUtilOvFormat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const r: string = util.format("The value of pi is %f", 3.141592653);
        expect(r).assertEqual("The value of pi is 3.141592653");

      }
      {
        const obj: Record<string, int | string> = { "name": "John", "age": 20 };
        const r: string = util.format("The object is %j", obj);
        expect(r).assertEqual("The object is {\"name\":\"John\",\"age\":20}");

      }
      {
        const r: string = util.format("John finished %d%% of the %s", 80, "homework");
        expect(r).assertEqual("John finished 80% of the homework");

      }
      {
        const fmt: string = "hello world";
        const r: string = util.format(fmt);
        expect(r).assertEqual("hello world");

      }
      {
        const r: string = util.format("My name is %s and I am %s years old", "John", 20);
        expect(r).assertEqual("My name is John and I am 20 years old");

      }
      {
        const person: Pers = { name: "John", age: 20, address: { city: "New York", country: "USA" } };
        const r: string = util.format("Person: %O", person);
        expect(r).assertContain("John");

      }
      {
        const arr: Array<int> = [1, 2, 3];
        const r: string = util.format("arr: %o", arr);
        expect(r).assertContain('1');
        expect(r).assertContain('2');
        expect(r).assertContain('3');

      }
      {
        const r: string = util.format("%c%s", "color:red", "hi");
        expect(r).assertContain("hi");

      }
      {
        const person: Pers = { name: "John", age: 20, address: { city: "NY", country: "US" } };
        const r: string = util.format("Person: %O", person);
        expect(r).assertContain("John");
        let actual1: string = person.name;
        let expected1: string = "John";
        expect(actual1).assertEqual(expected1);
        let actual2: string = person.address.city;
        let expected2: string = "NY";
        expect(actual2).assertEqual(expected2);

      }
      {
        const r: string = util.format("errno[%s]", util.errnoToString(-1));
        expect(r).assertEqual("errno[operation not permitted]");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_OVERVIEW_0900
     * @tc.name testUtilOvFormat005
     * @tc.desc Verify util module overview APIs format conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUtilOvFormat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const o: HashObj = { name: 'x', age: 1 };
        const h: long = util.getHash(o);
        const r: string = util.format("hash=%d", h);
        let actual1: number = r.indexOf("hash=");
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);

      }
      {
        let result = util.format("hello %s");
        expect(result).assertEqual("hello %s");

      }
      {
        let result = util.format("%s-%s-%s", 'a');
        expect(result).assertEqual("a-%s-%s");

      }
      {
        let result = util.format("plain", "extra");
        expect(result).assertEqual("plain extra");

      }
      {
        let result = util.format('', 'a');
        expect(result).assertEqual('a');

      }
      {
        let result = util.format("no placeholder here");
        expect(result).assertEqual("no placeholder here");

      }
      {
        let result = util.format("100%%");
        expect(result).assertEqual("100%");

      }
      {
        let result = util.format("odd %");
        expect(result).assertEqual("odd %");

      }
      {
        let result = util.format("%s%s", 'x', 'y');
        expect(result).assertEqual("xy");

      }
      {
        let result = util.format("name is %s", "John");
        expect(result).assertEqual("name is John");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_OVERVIEW_1000
     * @tc.name testUtilOvFormat006
     * @tc.desc Verify util module overview APIs format conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUtilOvFormat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let result = util.format("age is %s", 20);
        expect(result).assertEqual("age is 20");

      }
      {
        let result = util.format("%i", 100.5);
        expect(result).assertEqual("100");

      }
      {
        let obj: Record<string, int | string> = { "name": "John", "age": 20 };
        let result = util.format("%j", obj);
        expect(result).assertEqual("{\"name\":\"John\",\"age\":20}");

      }
      {
        let result = util.format("%s", "<script>alert(1)</script>");
        expect(result).assertEqual("<script>alert(1)</script>");

      }
      {
        let longStr: string = 'x'.repeat(10000);
        let result = util.format("%s", longStr);
        let actual1: int = result.length;
        let expected1: int = 10000;
        expect(actual1).assertEqual(expected1);

      }
      {
        let person: Person = { name: "John", age: 20, address: { city: "New York", country: "USA" } };
        let result = util.format("%j", person);
        let actual1: string = result;
        let expected1: string = "{\"name\":\"John\",\"age\":20,\"address\":{\"city\":\"New York\",\"country\":\"USA\"}}";
        expect(actual1).assertEqual(expected1);

      }
      {
        let obj: Record<string, int> = { 'a': 1 };
        let result = util.format("%o", obj);
        let actual1: boolean = result.includes('a');
        expect(actual1).assertTrue();

      }
      {
        let obj: Record<string, int> = { 'b': 2 };
        let result = util.format("%O", obj);
        let actual1: boolean = result.includes('b');
        expect(actual1).assertTrue();

      }
      {
        let result = util.format("%s-%s", "ab", "cde");
        let actual1: int = result.length;
        let expected1: int = 6;
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_OVERVIEW_1100
     * @tc.name testUtilOvErrno001
     * @tc.desc Verify util module overview APIs errnoToString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUtilOvErrno001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let r = util.errnoToString(-3);
        expect(r).assertEqual("no such process");

      }
      {
        let r = util.errnoToString(-4);
        expect(r).assertEqual("interrupted system call");

      }
      {
        let r = util.errnoToString(-12);
        expect(r).assertEqual("not enough memory");

      }
      {
        let r = util.errnoToString(-100);
        expect(r).assertEqual("network is down");

      }
      {
        let r = util.errnoToString(-6);
        expect(r).assertEqual("no such device or address");

      }
      {
        let r = util.errnoToString(-100);
        expect(r).assertContain(' ');

      }
      {
        let r = util.errnoToString((-1).toInt());
        expect(r).assertEqual("operation not permitted");

      }
      {
        let r1 = util.errnoToString(-1);
        let r2 = util.errnoToString((-1).toInt());
        expect(r1).assertEqual(r2);

      }
      {
        let r0: string = util.errnoToString(0);
        let r1: string = util.errnoToString(1);
        let actual1: boolean = r0 === r1;
        expect(actual1).assertFalse();
        let actual2: string = r1;
        let expected2: string = "Unknown system error 1";
        expect(actual2).assertEqual(expected2);

      }
      {
        let r: string = util.errnoToString((2147483648).toInt());
        let actual1: string = r;
        let expected1: string = "Unknown system error -214748364";
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_OVERVIEW_1200
     * @tc.name testUtilOvErrno002
     * @tc.desc Verify util module overview APIs errnoToString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUtilOvErrno002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const r: string = util.errnoToString(-2);
        expect(r).assertEqual("no such file or directory");

      }
      {
        const r: string = util.errnoToString(-11);
        expect(r).assertEqual("resource temporarily unavailable");

      }
      {
        const r: string = util.errnoToString(2147483647);
        expect(r).assertEqual("Unknown system error 2147483647");

      }
      {
        const r: string = util.errnoToString(-2147483648);
        expect(r).assertEqual("Unknown system error -214748364");

      }
      {
        let result = util.errnoToString(-5);
        expect(result).assertEqual("i/o error");

      }
      {
        let result = util.errnoToString(-13);
        expect(result).assertEqual("permission denied");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_OVERVIEW_1300
     * @tc.name testUtilOvHash001
     * @tc.desc Verify util module overview APIs getHash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUtilOvHash001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let obj: P1 = { name: "Jack", age: 20 };
        let h = util.getHash(obj);
        let isZero: boolean = h === 0;
        expect(isZero).assertFalse();

      }
      {
        let obj: Record<string, int> = { 'a': 1, 'b': 2 };
        let h = util.getHash(obj);
        let isZero: boolean = h === 0;
        expect(isZero).assertFalse();

      }
      {
        let arr: int[] = [1, 2, 3];
        let h = util.getHash(arr);
        let isZero: boolean = h === 0;
        expect(isZero).assertFalse();

      }
      {
        let m: Map<string, int> = new Map<string, int>();
        m.set('k', 1);
        let h = util.getHash(m);
        let isZero: boolean = h === 0;
        expect(isZero).assertFalse();

      }
      {
        let s: Set<string> = new Set<string>();
        s.add('x');
        let h = util.getHash(s);
        let isZero: boolean = h === 0;
        expect(isZero).assertFalse();

      }
      {
        let obj: Outer = { o: { v: 1 } };
        let h = util.getHash(obj);
        let isZero: boolean = h === 0;
        expect(isZero).assertFalse();

      }
      {
        let a: P4 = { name: "Jack" };
        let b: P4 = { name: "Jack" };
        let ha = util.getHash(a);
        let hb = util.getHash(b);
        let isSameHash: boolean = ha === hb;
        expect(isSameHash).assertFalse();

      }
      {
        let obj: P5 = { v: 7 };
        let h = util.getHash(obj);
        expect(h).assertLarger(0);

      }
      {
        const o: HashObj = { name: "Jack", age: 20 };
        const h: long = util.getHash(o);
        let isZero: boolean = h === 0;
        expect(isZero).assertFalse();

      }
      {
        let o1: PersonPart03 = { name: "Jack", age: 20 };
        let o2: PersonPart03 = { name: "Tom", age: 30 };
        let h1: long = util.getHash(o1);
        let h2: long = util.getHash(o2);
        let isSameHash: boolean = h1 === h2;
        expect(isSameHash).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_OVERVIEW_1400
     * @tc.name testUtilOvStackTrace001
     * @tc.desc Verify util module overview APIs stack trace helpers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUtilOvStackTrace001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let stack = util.getMainThreadStackTrace();
        expect(stack).assertEqual('');

      }
      {
        const s: string = util.getMainThreadStackTrace();
        expect(s).assertEqual('');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_OVERVIEW_1500
     * @tc.name testUtilOvUUID001
     * @tc.desc Verify util module overview APIs UUID generation APIs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUtilOvUUID001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let uuid = util.generateRandomUUID();
        let actual1: int = uuid.length;
        let expected1: int = 36;
        expect(actual1).assertEqual(expected1);

      }
      {
        let uuid = util.generateRandomUUID(false);
        let actual1: string = String(uuid[14]!);
        let expected1: string = '4';
        expect(actual1).assertEqual(expected1);

      }
      {
        let uuid = util.generateRandomUUID();
        let valid = true;
        for (let i = 0; i < uuid.length; i++) {
          let c = String(uuid[i]!);
          if (String(c) !== '-' && !(String(c) >= '0' && String(c) <= '9') && !(String(c) >= 'a' && String(c) <= 'f')) {
            valid = false;
          }
        }
        expect(valid).assertTrue();

      }
      {
        let uuid = util.generateRandomUUID();
        let actual1: string = String(uuid[14]!);
        let expected1: string = '4';
        expect(actual1).assertEqual(expected1);

      }
      {
        let uuid = util.generateRandomUUID();
        let v = String(uuid[19]!);
        let ok = v === '8' || v === '9' || v === 'a' || v === 'b';
        expect(ok).assertTrue();

      }
      {
        let uuid = util.generateRandomBinaryUUID(true);
        let isUndefined: boolean = uuid === undefined;
        expect(isUndefined).assertFalse();
        let u = uuid!;
        let actual1: int = u.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);

      }
      {
        let uuid = util.generateRandomBinaryUUID(false);
        let isUndefined: boolean = uuid === undefined;
        expect(isUndefined).assertFalse();
        let u = uuid!;
        let actual1: int = u.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);

      }
      {
        let u1 = util.generateRandomBinaryUUID(true)!;
        let u2 = util.generateRandomBinaryUUID(true)!;
        let same = true;
        for (let i = 0; i < 16; i++) {
          if (u1.$_get(i) !== u2.$_get(i)) {
            same = false;
          }
        }
        expect(same).assertTrue();

      }
      {
        let u1 = util.generateRandomBinaryUUID(false)!;
        let u2 = util.generateRandomBinaryUUID(false)!;
        let same = true;
        for (let i = 0; i < 16; i++) {
          if (u1.$_get(i) !== u2.$_get(i)) {
            same = false;
          }
        }
        expect(same).assertFalse();

      }
      {
        let uuid = util.generateRandomBinaryUUID(true)!;
        let variant = (Number(uuid.$_get(8)!) >> 6) & 0x03;
        expect(variant).assertEqual(2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_OVERVIEW_1600
     * @tc.name testUtilOvUUID002
     * @tc.desc Verify util module overview APIs UUID generation APIs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUtilOvUUID002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let uuid = util.generateRandomBinaryUUID(true);
        if (uuid === undefined) {
          expect(uuid).assertUndefined();
        } else {
          let actual1: int = uuid.length;
          let expected1: int = 16;
          expect(actual1).assertEqual(expected1);
        }

      }
      {
        let uuid = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");
        let actual1: number = Number(uuid.$_get(0)!);
        let expected1: number = 0x84;
        expect(actual1).assertEqual(expected1);

      }
      {
        let uuid = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");
        let actual1: number = Number(uuid.$_get(1)!);
        let expected1: number = 0xbd;
        expect(actual1).assertEqual(expected1);

      }
      {
        let uuid = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");
        let actual1: number = Number(uuid.$_get(15)!);
        let expected1: number = 0x9c;
        expect(actual1).assertEqual(expected1);

      }
      {
        let lo = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");
        let up = util.parseUUID("84BDF796-66CC-4655-9B89-D6218D100F9C");
        let actual1: number = Number(lo.$_get(0)!);
        let expected1: number = Number(up.$_get(0)!);
        expect(actual1).assertEqual(expected1);
        let actual2: number = Number(lo.$_get(15)!);
        let expected2: number = Number(up.$_get(15)!);
        expect(actual2).assertEqual(expected2);

      }
      {
        let uuid = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");
        let actual1: int = uuid.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);
        let actual2: number = Number(uuid.$_get(0)!);
        let expected2: number = 0x84;
        expect(actual2).assertEqual(expected2);

      }
      {
        let parsed = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");
        let generated = util.generateRandomBinaryUUID(true)!;
        let actual1: number = Number(parsed.$_get(15)!);
        let expected1: number = 0x9c;
        expect(actual1).assertEqual(expected1);
        let actual2: int = generated.length;
        let expected2: int = 16;
        expect(actual2).assertEqual(expected2);

      }
      {
        let uuid = util.generateRandomUUID(true);
        let parsed = util.parseUUID(uuid);
        let actual1: int = parsed.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);

      }
      {
        let bin = util.generateRandomBinaryUUID(true)!;
        let parsed = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");
        let actual1: int = bin.length;
        let expected1: number = parsed.length;
        expect(actual1).assertEqual(expected1);

      }
      {
        let parsed = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");
        let hex = '';
        for (let i = 0; i < 16; i++) {
          let hexByte: string = parsed.$_get(i).toString(16);
          hex += hexByte.length < 2 ? '0' + hexByte : hexByte;
        }
        let actual1: int = hex.length;
        let expected1: int = 32;
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_OVERVIEW_1700
     * @tc.name testUtilOvUUID003
     * @tc.desc Verify util module overview APIs UUID generation APIs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUtilOvUUID003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const u: string = util.generateRandomUUID();
        let actual1: int = u.length;
        let expected1: int = 36;
        expect(actual1).assertEqual(expected1);

      }
      {
        const u: string = util.generateRandomUUID();
        let actual1: string = String(u.charAt(14));
        let expected1: string = '4';
        expect(actual1).assertEqual(expected1);

      }
      {
        const u: string = util.generateRandomUUID();
        const v: string = String(u.charAt(19));
        expect("89ab".indexOf(v) >= 0).assertTrue();

      }
      {
        const u: string = util.generateRandomUUID();
        let actual1: string = String(u.charAt(8));
        let expected1: string = '-';
        expect(actual1).assertEqual(expected1);
        let actual2: string = String(u.charAt(13));
        let expected2: string = '-';
        expect(actual2).assertEqual(expected2);
        let actual3: string = String(u.charAt(18));
        let expected3: string = '-';
        expect(actual3).assertEqual(expected3);
        let actual4: string = String(u.charAt(23));
        let expected4: string = '-';
        expect(actual4).assertEqual(expected4);

      }
      {
        const u: string = util.generateRandomUUID();
        const hexes: string = "0123456789abcdef";
        let ok: boolean = true;
        let i: int = 0;
        while (i < u.length) {
          const c: string = String(u.charAt(i));
          if (String(c) !== '-' && hexes.indexOf(c) < 0) {
            ok = false;
            break;
          }
          i++;
        }
        expect(ok).assertTrue();

      }
      {
        const u: string = util.generateRandomUUID();
        let actual1: string = u.toLowerCase();
        let expected1: string = u;
        expect(actual1).assertEqual(expected1);

      }
      {
        const u1: string = util.generateRandomUUID();
        const u2: string = util.generateRandomUUID();
        let isSameUuid: boolean = u1 === u2;
        expect(isSameUuid).assertFalse();

      }
      {
        const u: string = util.generateRandomUUID(false);
        let actual1: int = u.length;
        let expected1: int = 36;
        expect(actual1).assertEqual(expected1);
        let actual2: string = String(u.charAt(14));
        let expected2: string = '4';
        expect(actual2).assertEqual(expected2);

      }
      {
        const u: string = util.generateRandomUUID(true);
        let actual1: int = u.length;
        let expected1: int = 36;
        expect(actual1).assertEqual(expected1);

      }
      {
        const u = util.generateRandomBinaryUUID();
        let actual1: int = u!.byteLength;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UTIL_OVERVIEW_1800
     * @tc.name testUtilOvUUID004
     * @tc.desc Verify util module overview APIs UUID generation APIs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUtilOvUUID004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const u = util.generateRandomBinaryUUID();
        const b: number = u![8];
        let actual1: number = b & 0xc0;
        let expected1: number = 0x80;
        expect(actual1).assertEqual(expected1);

      }
      {
        const u1 = util.generateRandomBinaryUUID();
        const u2 = util.generateRandomBinaryUUID();
        let same: boolean = true;
        let i: int = 0;
        while (i < 16) {
          if (u1![i] !== u2![i]) {
            same = false;
            break;
          }
          i++;
        }
        expect(same).assertFalse();

      }
      {
        const u = util.generateRandomBinaryUUID();
        let sum: int = 0;
        let i: int = 0;
        while (i < 16) {
          sum += u![i];
          i++;
        }
        let actual1: boolean = sum > 0;
        expect(actual1).assertTrue();

      }
      {
        const u = util.generateRandomBinaryUUID();
        let isUndefined: boolean = u === undefined;
        expect(isUndefined).assertFalse();

      }
      {
        const u: Uint8Array = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");
        const expected: Uint8Array =
          new Uint8Array([132, 189, 247, 150, 102, 204, 70, 85, 155, 137, 214, 33, 141, 16, 15, 156]);
        for (let i = 0; i < 16; i++) {
          expect(u.$_get(i)).assertEqual(expected.$_get(i));
        }

      }
      {
        const u: Uint8Array = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");
        let actual1: number = Number(u.$_get(0));
        let expected1: number = 0x84;
        expect(actual1).assertEqual(expected1);

      }
      {
        const u: Uint8Array = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");
        let actual1: number = Number(u.$_get(15));
        let expected1: number = 0x9c;
        expect(actual1).assertEqual(expected1);

      }
      {
        const u: Uint8Array = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");
        let actual1: number = Number(u.$_get(6)) >> 4;
        let expected1: int = 4;
        expect(actual1).assertEqual(expected1);

      }
      {
        const u: Uint8Array = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");
        let actual1: number = Number(u.$_get(8)) & 0xc0;
        let expected1: number = 0x80;
        expect(actual1).assertEqual(expected1);

      }
      {
        const u1: Uint8Array = util.parseUUID("84bdf796-66cc-4655-9b89-d6218d100f9c");
        const u2: Uint8Array = util.parseUUID("00112233-4455-4677-8899-aabbccddeeff");
        let actual1: number = Number(u2.$_get(0));
        let expected1: number = 0x00;
        expect(actual1).assertEqual(expected1);
        let isSameByte: boolean = u1.$_get(0) === u2.$_get(0);
        expect(isSameByte).assertFalse();

      }
    });

  });
}
