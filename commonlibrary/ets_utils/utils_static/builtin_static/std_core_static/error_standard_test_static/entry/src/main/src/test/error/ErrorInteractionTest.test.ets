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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

function returnsError(b: boolean): Error | undefined {
  if (b) {
    return new Error("returned as value");
  }
  return undefined;
}

function returnsErrorOrThrow(b: boolean): int {
  if (b) {
    throw new Error("thrown");
  }
  return 42;
}

class ErrorInteractionHolder {
  lastError: Error = new Error();

  store(err: Error): void {
    this.lastError = err;
  }

  getLast(): Error {
    return this.lastError;
  }
}

interface ErrorInteractionRecord {
  current: Error;
  label: string;
}

function isErrorInteractionInstance(value: Object): boolean {
  return value instanceof Error;
}

function passErrorInteractionValue<T>(value: T): T {
  return value;
}

export default function ErrorInteractionTest(): void {
  describe('ErrorInteractionTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_0100
     * @tc.name testErrorInteraction001
     * @tc.desc Verify new Error(42, 'err') via A1 produces 'Error: err' in toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(42, "err");
      expect(e.name).assertEqual("Error");
      expect(e.code).assertEqual(42);
      expect(e.message).assertEqual("err");
      expect(e.toString()).assertEqual("Error: err");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_0200
     * @tc.name testErrorInteraction002
     * @tc.desc Verify new Error('Custom', 500) via A3 produces 'Custom' (no message)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Custom", 500);
      expect(e.name).assertEqual("Custom");
      expect(e.code).assertEqual(500);
      expect(e.message).assertEqual("");
      expect(e.toString()).assertEqual("Custom");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_0300
     * @tc.name testErrorInteraction003
     * @tc.desc Verify toString output changes after name and message mutations
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      expect(e.toString()).assertEqual("Error");
      e.name = "CustomName";
      expect(e.toString()).assertEqual("CustomName");
      e.message = "msg";
      expect(e.toString()).assertEqual("CustomName: msg");
      e.name = "Error";
      expect(e.toString()).assertEqual("Error: msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_0400
     * @tc.name testErrorInteraction004
     * @tc.desc Verify changing code does NOT affect toString output
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("MyName", 100, "info");
      expect(e.toString()).assertEqual("MyName: info");
      e.code = 999;
      expect(e.toString()).assertEqual("MyName: info");
      e.code = -1;
      expect(e.toString()).assertEqual("MyName: info");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_0500
     * @tc.name testErrorInteraction005
     * @tc.desc Verify mutating one property does not affect others
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Orig", 10, "orig msg");
      expect(e.name).assertEqual("Orig");
      expect(e.code).assertEqual(10);
      expect(e.message).assertEqual("orig msg");
      e.name = "Changed";
      expect(e.name).assertEqual("Changed");
      expect(e.code).assertEqual(10);
      expect(e.message).assertEqual("orig msg");
      e.code = 99;
      expect(e.name).assertEqual("Changed");
      expect(e.code).assertEqual(99);
      expect(e.message).assertEqual("orig msg");
      e.message = "new msg";
      expect(e.name).assertEqual("Changed");
      expect(e.code).assertEqual(99);
      expect(e.message).assertEqual("new msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_0600
     * @tc.name testErrorInteraction006
     * @tc.desc Verify round-trip property changes preserve final value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("A", 1, "msgA");
      e.name = "B";
      e.name = "A";
      expect(e.name).assertEqual("A");
      e.code = 2;
      e.code = 1;
      expect(e.code).assertEqual(1);
      e.message = "msgB";
      e.message = "msgA";
      expect(e.message).assertEqual("msgA");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_0700
     * @tc.name testErrorInteraction007
     * @tc.desc Verify toString reflects full state after chained mutations
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.name = "Step1";
      e.message = "step1 msg";
      expect(e.toString()).assertEqual("Step1: step1 msg");
      e.name = "Step2";
      expect(e.toString()).assertEqual("Step2: step1 msg");
      e.message = "final";
      expect(e.toString()).assertEqual("Step2: final");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_0800
     * @tc.name testErrorInteraction008
     * @tc.desc Verify new Error('name', undefined) dispatches to A2: message='name', code=0, default name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("MyName", undefined);
      expect(e.name).assertEqual("Error");
      expect(e.message).assertEqual("MyName");
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_0900
     * @tc.name testErrorInteraction009
     * @tc.desc Verify new Error(0, '') dispatches to A1 with code=0 and empty message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(0, "");
      expect(e.name).assertEqual("Error");
      expect(e.code).assertEqual(0);
      expect(e.message).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_1000
     * @tc.name testErrorInteraction010
     * @tc.desc Verify new Error(0, 'msg', undefined) dispatches to A1 with code, message, undefined options
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(0, "msg", undefined);
      expect(e.name).assertEqual("Error");
      expect(e.code).assertEqual(0);
      expect(e.message).assertEqual("msg");
      expect(e.cause === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_1100
     * @tc.name testErrorInteraction011
     * @tc.desc Verify toString output does NOT contain cause information
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error("root cause");
      let e: Error = new Error("MyName", 42, "wrapped", { cause: cause });
      let s: string = e.toString();
      expect(s).assertEqual("MyName: wrapped");
      expect(s.includes("root")).assertEqual(false);
      expect(s.includes("cause")).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_1200
     * @tc.name testErrorInteraction012
     * @tc.desc Verify setting or mutating cause does NOT affect toString
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Test", "msg");
      expect(e.toString()).assertEqual("Test: msg");
      e.cause = new Error("new cause");
      expect(e.toString()).assertEqual("Test: msg");
      e.cause = undefined;
      expect(e.toString()).assertEqual("Test: msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_1300
     * @tc.name testErrorInteraction013
     * @tc.desc Verify new Error(0) and new Error() differ only in dispatch path but produce same result
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Error = new Error();
      let b: Error = new Error(0);
      expect(a.name).assertEqual(b.name);
      expect(a.code).assertEqual(b.code);
      expect(a.message).assertEqual(b.message);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_1400
     * @tc.name testErrorInteraction014
     * @tc.desc Verify Error(0) uses default name Error, not empty string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error(0);
      expect(e.name).assertEqual("Error");
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_1500
     * @tc.name testErrorInteraction015
     * @tc.desc Verify setting code to -1 after construction works
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.code = -1;
      expect(e.code).assertEqual(-1);
      e.code = 0;
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_1600
     * @tc.name testErrorInteraction016
     * @tc.desc Verify setting code to MAX_INT after construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error();
      e.code = 2147483647;
      expect(e.code).assertEqual(2147483647);
      e.code = 0;
      expect(e.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_1700
     * @tc.name testErrorInteraction017
     * @tc.desc Verify setting named Error instance name to empty string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("Original", 500, "msg");
      expect(e.name).assertEqual("Original");
      e.name = "";
      expect(e.name).assertEqual("");
      expect(e.code).assertEqual(500);
      expect(e.message).assertEqual("msg");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_1800
     * @tc.name testErrorInteraction018
     * @tc.desc Verify setting message to very long string after construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longMsg: string = "M".repeat(5000);
      let e: Error = new Error("T", 0);
      e.message = longMsg;
      expect(e.message.length).assertEqual(5000);
      expect(e.name).assertEqual("T");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_1900
     * @tc.name testErrorInteraction019
     * @tc.desc Verify setting cause from undefined to Error instance after construction
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("test");
      expect(e.cause === undefined).assertEqual(true);
      let cause: Error = new Error("root");
      e.cause = cause;
      expect(e.cause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_2000
     * @tc.name testErrorInteraction020
     * @tc.desc Verify resetting cause from Error instance back to undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error("root");
      let e: Error = new Error("test", { cause: cause });
      expect(e.cause).assertEqual(cause);
      e.cause = undefined;
      expect(e.cause === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_2100
     * @tc.name testErrorInteraction021
     * @tc.desc Verify two references to same Error: mutation through ref1 visible via ref2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Error = new Error("A", 10, "original");
      let b: Error = a;
      a.name = "B";
      b.code = 99;
      expect(a.name).assertEqual("B");
      expect(a.code).assertEqual(99);
      expect(b.name).assertEqual("B");
      expect(b.code).assertEqual(99);
      expect(a.message).assertEqual("original");
      expect(b.message).assertEqual("original");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_2200
     * @tc.name testErrorInteraction022
     * @tc.desc Verify shared cause object: mutate cause through one parent, visible via other
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Error = new Error("root");
      let e1: Error = new Error("e1", { cause: root });
      let e2: Error = new Error("e2", { cause: root });
      root.message = "mutated root";
      expect((e1.cause as Error).message).assertEqual("mutated root");
      expect((e2.cause as Error).message).assertEqual("mutated root");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_2300
     * @tc.name testErrorInteraction023
     * @tc.desc Verify stack is defined after throw with custom name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("CustomError", 999, "custom msg");
      let hasStack: boolean = false;
      try {
        throw e;
      } catch (caught) {
        hasStack = caught.stack !== undefined;
      }
      expect(hasStack).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_2400
     * @tc.name testErrorInteraction024
     * @tc.desc Verify stack is NOT enumerable (not in Object.keys)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("test");
      let keys: String[] = Object.keys(e) as String[];
      let hasStack: boolean = false;
      for (let i: int = 0; i < keys.length; i++) {
        if (keys[i] === "stack") {
          hasStack = true;
        }
      }
      expect(hasStack).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_2500
     * @tc.name testErrorInteraction025
     * @tc.desc Verify stack property is readable and non-empty after throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("direct");
      try {
        throw e;
      } catch (caught) {
        expect(caught.stack !== undefined).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_2600
     * @tc.name testErrorInteraction026
     * @tc.desc Verify re-throwing same Error instance preserves stack
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("persistent");
      let stack1: string | undefined = "";
      let stack2: string | undefined = "";
      try {
        throw e;
      } catch (caught) {
        stack1 = caught.stack;
      }
      try {
        throw e;
      } catch (caught) {
        stack2 = caught.stack;
      }
      expect(stack1).not().assertUndefined();
      expect(stack2).not().assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_2700
     * @tc.name testErrorInteraction027
     * @tc.desc Verify Finally Throw Overrides Original
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caughtMsg: string = "";
      try {
        try {
          throw new Error("original");
        } finally {
          throw new Error("override");
        }
      } catch (e) {
        caughtMsg = e.message;
      }
      expect(caughtMsg).assertEqual("override");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_2800
     * @tc.name testErrorInteraction028
     * @tc.desc Verify Finally Throw After Catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caughtMsg: string = "";
      try {
        try {
          throw new Error("original");
        } catch (e) {
          // handled
        } finally {
          throw new Error("from finally");
        }
      } catch (e) {
        caughtMsg = e.message;
      }
      expect(caughtMsg).assertEqual("from finally");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_2900
     * @tc.name testErrorInteraction029
     * @tc.desc Verify Finally Throw Suppresses Normal Return
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        try {
          // normal execution, no throw
        } finally {
          throw new Error("finally throws on normal path");
        }
      } catch (e) {
        expect(e.message).assertEqual("finally throws on normal path");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_3000
     * @tc.name testErrorInteraction030
     * @tc.desc Verify Finally Throw Chained
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caughtMsg: string = "";
      try {
        try {
          try {
            throw new Error("level1");
          } finally {
            throw new Error("level2");
          }
        } finally {
          throw new Error("level3");
        }
      } catch (e) {
        caughtMsg = e.message;
      }
      expect(caughtMsg).assertEqual("level3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_3100
     * @tc.name testErrorInteraction031
     * @tc.desc Verify Error As Return Value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Error | undefined = returnsError(true);
      expect(r !== undefined).assertEqual(true);
      expect((r as Error).message).assertEqual("returned as value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_3200
     * @tc.name testErrorInteraction032
     * @tc.desc Verify Error As Undefined Return
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Error | undefined = returnsError(false);
      expect(r === undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_3300
     * @tc.name testErrorInteraction033
     * @tc.desc Verify Error Or Normal Return
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        returnsErrorOrThrow(true);
      } catch (e) {
        expect(e.message).assertEqual("thrown");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_3400
     * @tc.name testErrorInteraction034
     * @tc.desc Verify Normal Return No Throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: int = returnsErrorOrThrow(false);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_3500
     * @tc.name testErrorInteraction035
     * @tc.desc Verify Closure Captures Error Ref
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("captured");
      let fn = (): string => {
        return e.message;
      };
      e.message = "mutated after capture";
      expect(fn()).assertEqual("mutated after capture");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_3600
     * @tc.name testErrorInteraction036
     * @tc.desc Verify Closure Throws Captured Error
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("from closure");
      let fn = (): Error => {
        throw e;
      };
      try {
        fn();
      } catch (ex) {
        expect(ex.message).assertEqual("from closure");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_3700
     * @tc.name testErrorInteraction037
     * @tc.desc Verify Closure Mutates Error Then Throws
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("before");
      let fn = (): void => {
        e.message = "mutated in closure";
        throw e;
      };
      try {
        fn();
      } catch (ex) {
        expect(ex.message).assertEqual("mutated in closure");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_3800
     * @tc.name testErrorInteraction038
     * @tc.desc Verify Catch Multiple Type Branches
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "";
      try {
        throw new TypeError("type!");
      } catch (e) {
        if (e instanceof TypeError) {
          result = "typeError";
        } else if (e instanceof RangeError) {
          result = "rangeError";
        } else {
          result = "other";
        }
      }
      expect(result).assertEqual("typeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_3900
     * @tc.name testErrorInteraction039
     * @tc.desc Verify Catch Multi Branch Rethrow
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outerCaught: boolean = false;
      try {
        try {
          throw new RangeError("range");
        } catch (e) {
          if (e instanceof TypeError) {
            // handled
          } else {
            throw e; // rethrow non-TypeError
          }
        }
      } catch (e) {
        outerCaught = true;
        expect(e.message).assertEqual("range");
      }
      expect(outerCaught).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_4000
     * @tc.name testErrorInteraction040
     * @tc.desc Verify Catch Multi Branch With Cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caughtType: string = "";
      try {
        let cause: Error = new Error("root cause");
        throw new TypeError("wrapped", { cause: cause });
      } catch (e) {
        if (e instanceof TypeError) {
          caughtType = "typeError";
          expect((e.cause as Error).message).assertEqual("root cause");
        } else {
          caughtType = "other";
        }
      }
      expect(caughtType).assertEqual("typeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_4100
     * @tc.name testErrorInteraction041
     * @tc.desc Verify Construct Does Not Throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        let e: Error = new Error(0, "safe");
        e.code = -1;
        e.message = "still safe";
        e.name = "SafeError";
      } catch (e) {
        threw = true;
      }
      expect(threw).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_4200
     * @tc.name testErrorInteraction042
     * @tc.desc Verify Property Access Does Not Throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threw: boolean = false;
      try {
        let e: Error = new Error(99, "access test");
        let n: string = e.name;
        let c: int = e.code;
        let m: string = e.message;
        let ca: Object | undefined = e.cause;
        let s: string | undefined = e.stack;
      } catch (e) {
        threw = true;
      }
      expect(threw).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_4300
     * @tc.name testErrorInteraction043
     * @tc.desc Verify Error passed as function parameter keeps reference mutation visible
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("original");
      let modifyMessage = (value: Error): void => {
        value.message = "modified";
      };
      modifyMessage(err);
      expect(err.message).assertEqual("modified");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_4400
     * @tc.name testErrorInteraction044
     * @tc.desc Verify Error stored and retrieved from class member field
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let holder: ErrorInteractionHolder = new ErrorInteractionHolder();
      let err: Error = new Error(500, "class field");
      holder.store(err);
      let retrieved: Error = holder.getLast();
      expect(retrieved).assertEqual(err);
      expect(retrieved.message).assertEqual("class field");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_4500
     * @tc.name testErrorInteraction045
     * @tc.desc Verify generic identity function preserves Error reference and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("generic");
      let same: Error = passErrorInteractionValue<Error>(err);
      expect(same).assertEqual(err);
      expect(same.message).assertEqual("generic");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_4600
     * @tc.name testErrorInteraction046
     * @tc.desc Verify instanceof helper identifies Error and rejects non-Error object
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("instance");
      let holder: ErrorInteractionHolder = new ErrorInteractionHolder();
      expect(isErrorInteractionInstance(err)).assertEqual(true);
      expect(isErrorInteractionInstance(holder)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_4700
     * @tc.name testErrorInteraction047
     * @tc.desc Verify Error stored in typed interface object keeps fields readable
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: ErrorInteractionRecord = {
        current: new Error("record error"),
        label: "record"
      };
      expect(record.label).assertEqual("record");
      expect(record.current.message).assertEqual("record error");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_4800
     * @tc.name testErrorInteraction048
     * @tc.desc Verify union variable can carry Error and string values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("union error");
      let value: Error | string = err;
      expect(value).assertEqual(err);
      expect(err.message).assertEqual("union error");
      value = "union string";
      expect(value).assertEqual("union string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_4900
     * @tc.name testErrorInteraction049
     * @tc.desc Verify Error as default function parameter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let withDefault = (err: Error = new Error("default")): Error => {
        return err;
      };
      expect(withDefault().message).assertEqual("default");
      expect(withDefault(new Error("custom")).message).assertEqual("custom");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_5000
     * @tc.name testErrorInteraction050
     * @tc.desc Verify Error in rest parameters preserves argument count and order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let collectMessages = (...errs: Error[]): string => {
        return errs[0].message + "|" + errs[1].message;
      };
      expect(collectMessages(new Error("a"), new Error("b"))).assertEqual("a|b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_5100
     * @tc.name testErrorInteraction051
     * @tc.desc Verify Error as optional parameter supports present and absent paths
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let format = (value: int, err?: Error): string => {
        if (err !== undefined) {
          return value + ":" + err.message;
        }
        return value + ":none";
      };
      expect(format(5, new Error("optional"))).assertEqual("5:optional");
      expect(format(10)).assertEqual("10:none");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_5200
     * @tc.name testErrorInteraction052
     * @tc.desc Verify Error assigned to Object type preserves reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("as object");
      let obj: Object = err;
      expect(obj).assertEqual(err);
      expect(err.message).assertEqual("as object");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_5300
     * @tc.name testErrorInteraction053
     * @tc.desc Verify caught TypeError preserves type name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new TypeError("type-interaction");
      } catch (e) {
        expect(e instanceof TypeError).assertEqual(true);
        expect((e as TypeError).name).assertEqual("TypeError");
        expect((e as TypeError).message).assertEqual("type-interaction");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_5400
     * @tc.name testErrorInteraction054
     * @tc.desc Verify caught RangeError preserves type name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new RangeError("range-interaction");
      } catch (e) {
        expect(e instanceof RangeError).assertEqual(true);
        expect((e as RangeError).name).assertEqual("RangeError");
        expect((e as RangeError).message).assertEqual("range-interaction");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_5500
     * @tc.name testErrorInteraction055
     * @tc.desc Verify caught SyntaxError preserves type name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new SyntaxError("syntax-interaction");
      } catch (e) {
        expect(e instanceof SyntaxError).assertEqual(true);
        expect((e as SyntaxError).name).assertEqual("SyntaxError");
        expect((e as SyntaxError).message).assertEqual("syntax-interaction");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_5600
     * @tc.name testErrorInteraction056
     * @tc.desc Verify caught ReferenceError preserves type name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new ReferenceError("reference-interaction");
      } catch (e) {
        expect(e instanceof ReferenceError).assertEqual(true);
        expect((e as ReferenceError).name).assertEqual("ReferenceError");
        expect((e as ReferenceError).message).assertEqual("reference-interaction");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_5700
     * @tc.name testErrorInteraction057
     * @tc.desc Verify caught EvalError preserves type name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new EvalError("eval-interaction");
      } catch (e) {
        expect(e instanceof EvalError).assertEqual(true);
        expect((e as EvalError).name).assertEqual("EvalError");
        expect((e as EvalError).message).assertEqual("eval-interaction");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_5800
     * @tc.name testErrorInteraction058
     * @tc.desc Verify caught URIError preserves type name and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new URIError("uri-interaction");
      } catch (e) {
        expect(e instanceof URIError).assertEqual(true);
        expect((e as URIError).name).assertEqual("URIError");
        expect((e as URIError).message).assertEqual("uri-interaction");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_5900
     * @tc.name testErrorInteraction059
     * @tc.desc Verify caught AggregateError preserves errors and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Error = new Error("aggregate-inner");
      try {
        throw new AggregateError([inner], "aggregate-interaction");
      } catch (e) {
        let agg: AggregateError = e as AggregateError;
        expect(e instanceof AggregateError).assertEqual(true);
        expect(agg.message).assertEqual("aggregate-interaction");
        expect(agg.errors[0]).assertEqual(inner);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_6000
     * @tc.name testErrorInteraction060
     * @tc.desc Verify caught base Error preserves cause reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error("base-cause");
      try {
        throw new Error("base-interaction", { cause: cause });
      } catch (e) {
        expect((e as Error).message).assertEqual("base-interaction");
        expect((e as Error).cause).assertEqual(cause);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_6100
     * @tc.name testErrorInteraction061
     * @tc.desc Verify shared cause between built-in errors reflects mutation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Error = new Error("shared-built-in-root");
      let typeParent: TypeError = new TypeError("type-parent", { cause: root });
      let rangeParent: RangeError = new RangeError("range-parent", { cause: root });
      root.message = "shared-built-in-mutated";
      expect((typeParent.cause as Error).message).assertEqual("shared-built-in-mutated");
      expect((rangeParent.cause as Error).message).assertEqual("shared-built-in-mutated");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_6200
     * @tc.name testErrorInteraction062
     * @tc.desc Verify mixed built-in cause chain preserves bottom message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Error = new Error("mixed-root");
      let middle: RangeError = new RangeError("mixed-range", { cause: root });
      let top: TypeError = new TypeError("mixed-type", { cause: middle });
      let resolvedMiddle: RangeError = top.cause as RangeError;
      let resolvedRoot: Error = resolvedMiddle.cause as Error;
      expect(resolvedMiddle.message).assertEqual("mixed-range");
      expect(resolvedRoot.message).assertEqual("mixed-root");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_6300
     * @tc.name testErrorInteraction063
     * @tc.desc Verify TypeError stack after throw contains type name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new TypeError("stack-type");
      } catch (e) {
        expect(((e as TypeError).stack as string).includes("TypeError")).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_6400
     * @tc.name testErrorInteraction064
     * @tc.desc Verify AggregateError stack after throw contains type name
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new AggregateError([], "stack-aggregate");
      } catch (e) {
        expect(((e as AggregateError).stack as string).includes("AggregateError")).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_6500
     * @tc.name testErrorInteraction065
     * @tc.desc Verify caught Error cause can be reassigned and cleared
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new Error("mutable-cause", { cause: new Error("initial-cause") });
      } catch (e) {
        let err: Error = e as Error;
        err.cause = new RangeError("replacement-cause");
        expect((err.cause as RangeError).message).assertEqual("replacement-cause");
        err.cause = undefined;
        expect(err.cause).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_6600
     * @tc.name testErrorInteraction066
     * @tc.desc Verify AggregateError cause survives throw catch with errors list
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leaf: Error = new Error("leaf-error");
      let cause: SyntaxError = new SyntaxError("aggregate-cause");
      try {
        throw new AggregateError([leaf], "aggregate-with-cause", { cause: cause });
      } catch (e) {
        let agg: AggregateError = e as AggregateError;
        expect(agg.errors[0]).assertEqual(leaf);
        expect((agg.cause as SyntaxError).message).assertEqual("aggregate-cause");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_INTERACTION_6700
     * @tc.name testErrorInteraction067
     * @tc.desc Verify caught built-in Error toString reflects message mutation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorInteraction067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new RangeError("before-mutation");
      } catch (e) {
        let err: RangeError = e as RangeError;
        err.message = "after-mutation";
        expect(err.toString()).assertEqual("RangeError: after-mutation");
      }
    });
  });
}
