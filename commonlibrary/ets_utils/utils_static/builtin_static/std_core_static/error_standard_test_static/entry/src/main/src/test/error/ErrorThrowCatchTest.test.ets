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
import { BusinessError } from '@kit.BasicServicesKit';

const handleWithRecovery = (shouldFailWith: string): string => {
  try {
    if (shouldFailWith === "type") {
      throw new TypeError("type mismatch");
    } else if (shouldFailWith === "range") {
      throw new RangeError("out of range");
    } else if (shouldFailWith === "custom") {
      throw new Error("CustomError", 500, "custom failure");
    } else {
      throw new Error("unknown error");
    }
  } catch (error) {
    if (error instanceof TypeError) {
      return error.name + ": " + error.message + ": retry with conversion";
    } else if (error instanceof RangeError) {
      return error.name + ": " + error.message + ": clamp value";
    } else {
      return error.name + ": " + error.message + ": generic fallback";
    }
  }
}

export default function ErrorThrowCatchTest(): void {
  describe('ErrorThrowCatchTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_0100
     * @tc.name testErrorThrowCatch001
     * @tc.desc Verify throw new Error('msg') is caught with correct message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caughtMsg: string = "";
      try {
        throw new Error("test@example.com");
      } catch (e) {
        caughtMsg = e.message;
      }
      expect(caughtMsg).assertEqual("test@example.com");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_0200
     * @tc.name testErrorThrowCatch002
     * @tc.desc Verify throw Error with code stores both code and message in catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caughtCode: number = 0;
      let caughtMsg: string = "";
      try {
        throw new Error(0x7FFFFFFF, "2026-02-30");
      } catch (e) {
        caughtCode = e.code;
        caughtMsg = e.message;
      }
      expect(caughtCode).assertEqual(2147483647);
      expect(caughtMsg).assertEqual("2026-02-30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_0300
     * @tc.name testErrorThrowCatch003
     * @tc.desc Verify throw with cause makes cause accessible in catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error("\u200B");
      let caughtCause: Object | undefined;
      try {
        throw new Error("123.45e6", { cause: cause });
      } catch (e) {
        caughtCause = e.cause;
      }
      expect(caughtCause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_0400
     * @tc.name testErrorThrowCatch004
     * @tc.desc Verify finally block always executes after try-catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trace: string = "";
      let caughtMsg: string = "";
      try {
        trace += "t";
        throw new Error("test");
      } catch (e) {
        trace += "c";
        caughtMsg = e.message;
      } finally {
        trace += "f";
      }
      expect(trace).assertEqual("tcf");
      expect(caughtMsg).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_0500
     * @tc.name testErrorThrowCatch005
     * @tc.desc Verify nested try-catch works correctly with inner catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let innerMsg: string = "";
      let outerMsg: string = "";
      try {
        try {
          throw new Error("<script>alert(1)</script>");
        } catch (e) {
          innerMsg = e.message;
          throw e;
        }
      } catch (e) {
        outerMsg = e.message;
      }
      expect(innerMsg).assertEqual("<script>alert(1)</script>");
      expect(outerMsg).assertEqual("<script>alert(1)</script>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_0600
     * @tc.name testErrorThrowCatch006
     * @tc.desc Verify caught error passes instanceof Error check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isErr: boolean = false;
      let caughtMsg: string = "";
      try {
        throw new Error("instance test");
      } catch (e) {
        isErr = e instanceof Error;
        caughtMsg = e.message;
      }
      expect(isErr).assertTrue();
      expect(caughtMsg).assertEqual("instance test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_0700
     * @tc.name testErrorThrowCatch007
     * @tc.desc Verify throw Error with overload3 (name, code, msg) is caught correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caughtName: string = "";
      let caughtCode: number = 0;
      let caughtMsg: string = "";
      try {
        throw new Error("Custom\u200BErr", -2147483648, "622202********1234");
      } catch (e) {
        caughtName = e.name;
        caughtCode = e.code;
        caughtMsg = e.message;
      }
      expect(caughtName).assertEqual("Custom\u200BErr");
      expect(caughtCode).assertEqual(-2147483648);
      expect(caughtMsg).assertEqual("622202********1234");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_0800
     * @tc.name testErrorThrowCatch008
     * @tc.desc Verify throw Error with overload4 (name, msg) is caught correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caughtName: string = "";
      let caughtCode: number = 0;
      let caughtMsg: string = "";
      try {
        throw new Error("310101199001011234", "\uFFFD");
      } catch (e) {
        caughtName = e.name;
        caughtCode = e.code;
        caughtMsg = e.message;
      }
      expect(caughtName).assertEqual("310101199001011234");
      expect(caughtCode).assertEqual(0);
      expect(caughtMsg).assertEqual("\uFFFD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_0900
     * @tc.name testErrorThrowCatch009
     * @tc.desc Verify throw Error with cause allows accessing cause object in catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let root: Error = new Error("25:00:00");
      let caughtCause: Object | undefined;
      try {
        throw new Error(0b1010, "wrapped", { cause: root });
      } catch (e) {
        caughtCause = e.cause;
      }
      expect(caughtCause).assertEqual(root);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_1000
     * @tc.name testErrorThrowCatch010
     * @tc.desc Verify throw in a 3-level nested function call propagates to outermost catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const level3 = (): void => {
        throw new Error("deep");
      };
      const level2 = (): void => {
        level3();
      };
      const level1 = (): void => {
        level2();
      };
      try {
        level1();
      } catch (e) {
        expect(e.message).assertEqual("deep");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_1100
     * @tc.name testErrorThrowCatch011
     * @tc.desc Verify throw Error with code from arithmetic expression is caught correctly
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caughtCode: number = 0;
      try {
        throw new Error((10 + 20) * 3);
      } catch (e) {
        caughtCode = e.code;
      }
      expect(caughtCode).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_1200
     * @tc.name testErrorThrowCatch012
     * @tc.desc Verify modifying err.message in catch block produces new value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(100, "original");
      try {
        throw err;
      } catch (e) {
        e.message = "mutated message";
      }
      expect(err.message).assertEqual("mutated message");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_1300
     * @tc.name testErrorThrowCatch013
     * @tc.desc Verify modifying err.code in catch block produces new value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error(100, "test");
      try {
        throw err;
      } catch (e) {
        e.code = 999;
      }
      expect(err.code).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_1400
     * @tc.name testErrorThrowCatch014
     * @tc.desc Verify mutate error in catch then re-throw passes new values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msgAfter: string = "";
      let err: Error = new Error("original");
      try {
        try {
          throw err;
        } catch (e) {
          e.message = "mutated";
          throw e;
        }
      } catch (e) {
        msgAfter = e.message;
      }
      expect(msgAfter).assertEqual("mutated");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_1500
     * @tc.name testErrorThrowCatch015
     * @tc.desc Verify caught Error name mutation preserves constructor code
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("OriginalName", 500, "msg");
      try {
        throw err;
      } catch (e) {
        e.name = "NewName";
      }
      expect(err.name).assertEqual("NewName");
      expect(err.code).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_1600
     * @tc.name testErrorThrowCatch016
     * @tc.desc Verify caught Error cause replacement is visible on original reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1: Error = new Error("cause1");
      let c2: Error = new Error("cause2");
      let err: Error = new Error("wrapper", { cause: c1 });
      try {
        throw err;
      } catch (e) {
        e.cause = c2;
      }
      expect(err.cause).assertEqual(c2);
      expect(err.cause).not().assertEqual(c1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_1700
     * @tc.name testErrorThrowCatch017
     * @tc.desc Verify mutating caught Error fields updates the same object
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error();
      try {
        throw err;
      } catch (e) {
        e.name = "Changed";
        e.message = "changed msg";
        e.code = 888;
        e.cause = new Error("root");
        e.stack = "custom stack";
      }
      expect(err.name).assertEqual("Changed");
      expect(err.message).assertEqual("changed msg");
      expect(err.code).assertEqual(888);
      expect(err.stack).assertEqual("custom stack");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_1800
     * @tc.name testErrorThrowCatch018
     * @tc.desc Verify try-catch without finally block catches TypeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caughtName: string = "";
      try {
        throw new TypeError("type error");
      } catch (e) {
        caughtName = e.name;
      }
      expect(caughtName).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_1900
     * @tc.name testErrorThrowCatch019
     * @tc.desc Verify try-finally without catch block still executes finally before error propagates
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trace: string = "";
      let caughtMsg: string = "";
      try {
        try {
          trace += "t";
          throw new Error("test");
        } finally {
          trace += "f";
        }
      } catch (e) {
        trace += "c";
        caughtMsg = e.message;
      }
      expect(trace).assertEqual("tfc");
      expect(caughtMsg).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_2000
     * @tc.name testErrorThrowCatch020
     * @tc.desc Verify 3-level nested try-catch blocks are isolated correctly with different Error types
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let results: string[] = [];
      try {
        try {
          try {
            throw new TypeError("type error");
          } catch (e) {
            results.push("inner");
            expect(e.name).assertEqual('TypeError');
          }
          throw new RangeError("range error");
        } catch (e) {
          results.push("middle");
          expect(e.name).assertEqual('RangeError');
        }
        throw new Error("generic error");
      } catch (e) {
        results.push("outer");
        expect(e.name).assertEqual('Error');
      }
      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual("inner");
      expect(results[1]).assertEqual("middle");
      expect(results[2]).assertEqual("outer");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_2100
     * @tc.name testErrorThrowCatch021
     * @tc.desc Verify catch block with return still executes finally block before returning
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trace: string = "";
      let caughtMsg: string = "";
      const fn = (): string => {
        try {
          trace += "t";
          throw new Error("err");
        } catch (e) {
          trace += "c";
          caughtMsg = e.message;
          return "fromCatch";
        } finally {
          trace += "f";
        }
      };
      let result: string = fn();
      expect(result).assertEqual("fromCatch");
      expect(trace).assertEqual("tcf");
      expect(caughtMsg).assertEqual("err");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_2200
     * @tc.name testErrorThrowCatch022
     * @tc.desc Verify try-catch-finally all blocks execute in order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trace: string = "";
      let caughtMsg: string = "";
      try {
        trace += "t";
        throw new Error("test");
      } catch (e) {
        trace += "c";
        caughtMsg = e.message;
      } finally {
        trace += "f";
      }
      expect(trace).assertEqual("tcf");
      expect(caughtMsg).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_2300
     * @tc.name testErrorThrowCatch023
     * @tc.desc Verify finally block executes when no exception occurs
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trace: string = "";
      let err: Error = new Error("not-thrown");
      try {
        trace += err.message;
      } catch (e) {
        trace += "c";
      } finally {
        trace += "f";
      }
      expect(trace).assertEqual("not-thrownf");
      expect(err.message).assertEqual("not-thrown");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_2400
     * @tc.name testErrorThrowCatch024
     * @tc.desc Verify caught error can be rethrown to outer catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outerMsg: string = "";
      try {
        try {
          throw new Error("rethrow");
        } catch (e) {
          throw e;
        }
      } catch (outer) {
        outerMsg = outer.message;
      }
      expect(outerMsg).assertEqual("rethrow");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_2500
     * @tc.name testErrorThrowCatch025
     * @tc.desc Verify catch-wrap creates new Error preserving original as cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outerMsg: string = "";
      let rootMsg: string = "";
      try {
        try {
          throw new Error("original");
        } catch (e) {
          throw new Error("wrapped", { cause: e });
        }
      } catch (outer) {
        outerMsg = outer.message;
        rootMsg = (outer.cause as Error).message;
      }
      expect(outerMsg).assertEqual("wrapped");
      expect(rootMsg).assertEqual("original");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_2600
     * @tc.name testErrorThrowCatch026
     * @tc.desc Verify multiple catch-wrap levels preserve full cause chain
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outerMsg: string = "";
      let middleMsg: string = "";
      let rootMsg: string = "";
      try {
        try {
          try {
            throw new Error("root");
          } catch (e) {
            throw new Error("level2", { cause: e });
          }
        } catch (e) {
          throw new Error("level3", { cause: e });
        }
      } catch (outer) {
        outerMsg = outer.message;
        middleMsg = (outer.cause as Error).message;
        rootMsg = ((outer.cause as Error).cause as Error).message;
      }
      expect(outerMsg).assertEqual("level3");
      expect(middleMsg).assertEqual("level2");
      expect(rootMsg).assertEqual("root");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_2700
     * @tc.name testErrorThrowCatch027
     * @tc.desc Verify 2-level nested try-catch isolation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trace: string = "";
      let innerMsg: string = "";
      try {
        try {
          throw new Error("inner");
        } catch (e) {
          trace += "inner";
          innerMsg = e.message;
        }
      } catch (e) {
        trace += "outer";
      }
      expect(trace).assertEqual("inner");
      expect(innerMsg).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_2800
     * @tc.name testErrorThrowCatch028
     * @tc.desc Verify 3-level nested try-catch each level catches and rethrows
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let catches: string[] = [];
      let messages: string[] = [];
      try {
        try {
          try {
            throw new Error("L3");
          } catch (e) {
            catches.push("L3_catch");
            messages.push(e.message);
            throw e;
          }
        } catch (e) {
          catches.push("L2_catch");
          messages.push(e.message);
          throw e;
        }
      } catch (e) {
        catches.push("L1_catch");
        messages.push(e.message);
      }
      expect(catches[0]).assertEqual("L3_catch");
      expect(catches[1]).assertEqual("L2_catch");
      expect(catches[2]).assertEqual("L1_catch");
      expect(messages[0]).assertEqual("L3");
      expect(messages[1]).assertEqual("L3");
      expect(messages[2]).assertEqual("L3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_2900
     * @tc.name testErrorThrowCatch029
     * @tc.desc Verify for loop try-catch catches error in each iteration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let catchCount: number = 0;
      let lastMessage: string = "";
      for (let i: number = 0; i < 5; i++) {
        try {
          throw new Error("iter-" + i);
        } catch (e) {
          catchCount++;
          lastMessage = e.message;
        }
      }
      expect(catchCount).assertEqual(5);
      expect(lastMessage).assertEqual("iter-4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_3000
     * @tc.name testErrorThrowCatch030
     * @tc.desc Verify while loop try-catch catches error each iteration
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: number = 0;
      let firstMessage: string = "";
      let i: number = 0;
      while (i < 3) {
        try {
          throw new Error("while-" + i);
        } catch (e) {
          if (count === 0) {
            firstMessage = e.message;
          }
          count++;
        }
        i++;
      }
      expect(count).assertEqual(3);
      expect(firstMessage).assertEqual("while-0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_3100
     * @tc.name testErrorThrowCatch031
     * @tc.desc Verify throw in for loop body interrupts the loop
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iterated: number = 0;
      try {
        for (let i: number = 0; i < 10; i++) {
          if (i === 3) {
            throw new Error("break loop");
          }
          iterated++;
        }
      } catch (e) {
        expect(e.message).assertEqual("break loop");
      }
      expect(iterated).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_3200
     * @tc.name testErrorThrowCatch032
     * @tc.desc Verify throw in switch case is caught by outer catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let val: number = 2;
        switch (val) {
          case 1:
            break;
          case 2:
            throw new Error("from switch");
          default:
            break;
        }
      } catch (e) {
        expect(e.message).assertEqual("from switch");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_3300
     * @tc.name testErrorThrowCatch033
     * @tc.desc Verify throw inside arrow function is caught at call site
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn: () => void = (): void => {
        throw new Error("arrow throw");
      };
      try {
        fn();
      } catch (e) {
        expect(e.message).assertEqual("arrow throw");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_3400
     * @tc.name testErrorThrowCatch034
     * @tc.desc Verify try block with return still executes finally
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trace: string = "";
      const fn = (): string => {
        try {
          trace += "t";
          let err: Error = new Error("fromTry");
          return err.message;
        } catch (e) {
          trace += "c";
          return "fromCatch";
        } finally {
          trace += "f";
        }
      };
      let result: string = fn();
      expect(result).assertEqual("fromTry");
      expect(trace).assertEqual("tf");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_3500
     * @tc.name testErrorThrowCatch035
     * @tc.desc Verify exception in finally overrides exception from catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caughtMsg: string = "";
      try {
        try {
          throw new Error("original");
        } catch (e) {
          throw new Error("fromCatch");
        } finally {
          throw new Error("fromFinally");
        }
      } catch (e) {
        caughtMsg = e.message;
      }
      expect(caughtMsg).assertEqual("fromFinally");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_3600
     * @tc.name testErrorThrowCatch036
     * @tc.desc Verify nested finally blocks execute in correct order
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let order: string = "";
      let caughtMsg: string = "";
      try {
        try {
          throw new Error("inner");
        } finally {
          order += "inner_finally;";
        }
      } catch (e) {
        order += "outer_catch;";
        caughtMsg = e.message;
      } finally {
        order += "outer_finally;";
      }
      expect(order).assertEqual("inner_finally;outer_catch;outer_finally;");
      expect(caughtMsg).assertEqual("inner");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_3700
     * @tc.name testErrorThrowCatch037
     * @tc.desc Verify instanceof check in catch block identifies Error type
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        throw new TypeError("type error msg");
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(e.message).assertEqual("type error msg");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_3800
     * @tc.name testErrorThrowCatch038
     * @tc.desc Verify Error properties name/code/message accessible in catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: Error = new Error("prop test");
      err.code = 42;
      try {
        throw err;
      } catch (e) {
        expect(e.name).assertEqual("Error");
        expect(e.code).assertEqual(42);
        expect(e.message).assertEqual("prop test");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_3900
     * @tc.name testErrorThrowCatch039
     * @tc.desc Verify modifying error properties in finally is visible
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e: Error = new Error("initial");
      try {
        throw e;
      } catch (ex) {
        expect(ex.message).assertEqual("initial");
      } finally {
        e.message = "modified";
      }
      expect(e.message).assertEqual("modified");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_4000
     * @tc.name testErrorThrowCatch040
     * @tc.desc Verify catch can conditionally rethrow based on error message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outerMsg: string = "";
      try {
        try {
          throw new Error("should_rethrow");
        } catch (e) {
          if (e.message === "should_handle") {
          } else {
            throw e;
          }
        }
      } catch (outer) {
        outerMsg = outer.message;
      }
      expect(outerMsg).assertEqual("should_rethrow");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_4100
     * @tc.name testErrorThrowCatch041
     * @tc.desc Verify execution continues normally after catch recovery
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trace: string = "";
      try {
        trace += "t";
        throw new Error("recoverable");
      } catch (e) {
        trace += "c";
        expect(e.message).assertEqual("recoverable");
      }
      trace += "a";
      expect(trace).assertEqual("tca");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_4200
     * @tc.name testErrorThrowCatch042
     * @tc.desc Verify TypeError triggers retry recovery path
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = handleWithRecovery("type");
      expect(result).assertEqual("TypeError: type mismatch: retry with conversion");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_4300
     * @tc.name testErrorThrowCatch043
     * @tc.desc Verify RangeError triggers clamp recovery path
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = handleWithRecovery("range");
      expect(result).assertEqual("RangeError: out of range: clamp value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_4400
     * @tc.name testErrorThrowCatch044
     * @tc.desc Verify generic Error triggers fallback recovery path
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = handleWithRecovery("custom");
      expect(result).assertEqual("CustomError: custom failure: generic fallback");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_4500
     * @tc.name testErrorThrowCatch045
     * @tc.desc Verify unknown error type triggers default fallback
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = handleWithRecovery("unknown");
      expect(result).assertEqual("Error: unknown error: generic fallback");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_4600
     * @tc.name testErrorThrowCatch046
     * @tc.desc Verify catch block executes fallback assignment and state is restored
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let state: string = "initial";
      let caughtMsg: string = "";
      try {
        throw new Error("fail");
      } catch (e) {
        state = "recovered";
        caughtMsg = e.message;
      }
      expect(state).assertEqual("recovered");
      expect(caughtMsg).assertEqual("fail");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_4700
     * @tc.name testErrorThrowCatch047
     * @tc.desc Verify Error thrown from nested function call preserves type and message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner = (): void => {
        throw new TypeError("nested type error");
      };
      let outer = (): void => {
        inner();
      };
      try {
        outer();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        expect(e.message).assertEqual("nested type error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_4800
     * @tc.name testErrorThrowCatch048
     * @tc.desc Verify Error with cause thrown from inner function preserves cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cause: Error = new Error("root");
      let inner = (): void => {
        throw new Error("wrapped", { cause: cause });
      };
      let caughtCause: Object | undefined = undefined;
      try {
        inner();
      } catch (e) {
        caughtCause = e.cause;
      }
      expect(caughtCause).assertEqual(cause);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_4900
     * @tc.name testErrorThrowCatch049
     * @tc.desc Verify RangeError thrown and caught preserves message
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let msg: string = "";
      try {
        throw new RangeError("out of bounds");
      } catch (e) {
        msg = e.message;
      }
      expect(msg).assertEqual("out of bounds");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_5000
     * @tc.name testErrorThrowCatch050
     * @tc.desc Verify Error thrown inside callback is caught by caller try-catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let invoke = (callback: () => void): void => {
        callback();
      };
      try {
        invoke((): void => {
          throw new Error("callback error");
        });
      } catch (e) {
        expect(e.message).assertEqual("callback error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_5100
     * @tc.name testErrorThrowCatch051
     * @tc.desc Verify thrown BusinessError preserves code and message after catch
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caughtCode: number = 0;
      let caughtMessage: string = '';
      try {
        throw new BusinessError(503, 'throw-business');
      } catch (e) {
        let caught: BusinessError = e as BusinessError;
        caughtCode = caught.code;
        caughtMessage = caught.message;
      }
      expect(caughtCode).assertEqual(503);
      expect(caughtMessage).assertEqual('throw-business');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_5200
     * @tc.name testErrorThrowCatch052
     * @tc.desc Verify caught BusinessError can be wrapped as Error cause
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let causeMessage: string = '';
      try {
        throw new BusinessError(504, 'business-origin');
      } catch (e) {
        let caught: BusinessError = e as BusinessError;
        let wrapped: Error = new Error('wrapped-business', { cause: caught });
        causeMessage = (wrapped.cause as BusinessError).message;
      }
      expect(causeMessage).assertEqual('business-origin');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_5300
     * @tc.name testErrorThrowCatch053
     * @tc.desc Verify BusinessError stack is readable after throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let stackText: string = "";
      try {
        throw new BusinessError(505, 'stack-business');
      } catch (e) {
        let caught: BusinessError = e as BusinessError;
        if (caught.stack !== undefined) {
          stackText = caught.stack as string;
        }
      }
      expect(stackText.indexOf('ErrorThrowCatchTest.test.ets')).not().assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_5400
     * @tc.name testErrorThrowCatch054
     * @tc.desc Verify BusinessError rethrow preserves same object reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: BusinessError = new BusinessError(506, 'rethrow-business');
      let caughtReference: BusinessError | undefined = undefined;
      try {
        try {
          throw original;
        } catch (e) {
          throw e;
        }
      } catch (e) {
        caughtReference = e as BusinessError;
      }
      expect(caughtReference).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_5500
     * @tc.name testErrorThrowCatch055
     * @tc.desc Verify nested try finally preserves thrown BusinessError values
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let trace: string = "";
      let caughtCode: number = 0;
      try {
        try {
          trace += "t";
          throw new BusinessError(508, 'nested-business');
        } finally {
          trace += "f";
        }
      } catch (e) {
        trace += "c";
        caughtCode = (e as BusinessError).code;
      }
      expect(trace).assertEqual("tfc");
      expect(caughtCode).assertEqual(508);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_5600
     * @tc.name testErrorThrowCatch056
     * @tc.desc Verify nested try-catch with TypeError wrapped as RangeError rethrow
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outerMsg: string = '';
      try {
        try {
          throw new TypeError('inner-type');
        } catch (e) {
          throw new RangeError('wrapped-range', { cause: e });
        }
      } catch (e) {
        outerMsg = e.message;
      }
      expect(outerMsg).assertEqual('wrapped-range');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ERROR_THROW_CATCH_5700
     * @tc.name testErrorThrowCatch057
     * @tc.desc Verify multiple Error subclasses in sequential try-catch blocks
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level Level 2
     */
    it('testErrorThrowCatch057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let results: string[] = [];
      let errors: Error[] = [new TypeError('t'), new RangeError('r'), new SyntaxError('s')];
      for (let i: int = 0; i < 3; i++) {
        try {
          throw errors[i];
        } catch (e) {
          results.push(e.message);
        }
      }
      expect(results[0]).assertEqual('t');
      expect(results[1]).assertEqual('r');
      expect(results[2]).assertEqual('s');
    });
  });
}
