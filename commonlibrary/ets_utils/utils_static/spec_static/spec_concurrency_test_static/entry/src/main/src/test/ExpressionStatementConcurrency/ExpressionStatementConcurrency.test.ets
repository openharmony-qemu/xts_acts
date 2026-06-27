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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import hilog from '@ohos.hilog'

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

async function returnPromiseNumber(): Promise<number> {
  return Promise.resolve(10.0);
}

async function returnPromiseString(): Promise<string> {
  return Promise.resolve("hello");
}

async function returnFalse(): Promise<boolean> {
  return false;
}

async function returnTrue(): Promise<boolean> {
  return true;
}

async function returnNull(): Promise<string | null> {
  return null;
}

async function returnArray(): Promise<number[]> {
  return [1, 2, 3];
}

async function returnNestedPromise(): Promise<Promise<number>> {
  return Promise.resolve(Promise.resolve(42.0));
}

let loopCounter: int = 0;
let switchValue: int = 0;
let finallyCleanupCalled: boolean = false;

async function incrementCounter(): Promise<void> {
  loopCounter++;
  return;
}

async function mightThrowFunc(): Promise<number> {
  throw new Error("inner error");
}

async function tryCatchThrowWrapper(): Promise<number> {
  try {
    await mightThrowFunc();
    return 0;
  } catch (e) {
    throw new Error("wrapped error");
  }
}

async function cleanupFunc(): Promise<void> {
  finallyCleanupCalled = true;
  return;
}

async function returnAwaitFunc(): Promise<number> {
  return await returnPromiseNumber();
}

async function checkCondition(): Promise<boolean> {
  return loopCounter < 3;
}

async function throwFunc(): Promise<void> {
  throw new Error("throw error");
}

async function catchReturnFunc(): Promise<number> {
  try {
    await throwFunc();
    return 0;
  } catch (e) {
    return 100;
  }
}

export default function ExpressionStatementConcurrencyTest():void {
  describe('ExpressionStatementConcurrencyTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach(async (): Promise<void> => {
      await sleep(30);
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.number SUB_SPEC_EXPR_STMT_CONCURRENCY_0100
     * @tc.name AwaitOperatorPrecedenceTest
     * @tc.desc test await operator precedence: await a + b equals (await a) + b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitOperatorPrecedenceTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-088: await operator precedence with + operator
      let a: Promise<number> = Promise.resolve(5.0);
      let b: number = 3;
      
      let result1: number = await a + b;
      expect(result1).assertEqual(8);
      
      let result2: number = (await a) + b;
      expect(result2).assertEqual(8);
      
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_SPEC_EXPR_STMT_CONCURRENCY_0200
     * @tc.name AwaitInTernaryExpressionTest
     * @tc.desc test await in ternary expression: only one branch's await executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitInTernaryExpressionTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-089: await in ternary expression
      let condition: boolean = true;
      
      let result1: number = condition ? await returnPromiseNumber() : await returnPromiseNumber();
      expect(result1).assertEqual(10);
      
      condition = false;
      let result2: string = condition ? await returnPromiseString() : await returnPromiseString();
      expect(result2).assertEqual("hello");
    });

    /**
     * @tc.number SUB_SPEC_EXPR_STMT_CONCURRENCY_0300
     * @tc.name AwaitInAssignmentExpressionTest
     * @tc.desc test await in assignment expression: await suspends then assigns value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitInAssignmentExpressionTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-090: await in assignment expression
      let x: number = 0;
      x = await returnPromiseNumber();
      expect(x).assertEqual(10);
      
      let y: string = "";
      y = await returnPromiseString();
      expect(y).assertEqual("hello");
    });

    /**
     * @tc.number SUB_SPEC_EXPR_STMT_CONCURRENCY_0400
     * @tc.name AwaitInLogicalAndExpressionTest
     * @tc.desc test await in logical && expression: short-circuit evaluation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitInLogicalAndExpressionTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-091: await in logical && expression
      let result1: boolean = await returnFalse() && await returnTrue();
      expect(result1).assertFalse();
      
      let result2: boolean = await returnTrue() && await returnTrue();
      expect(result2).assertTrue();
    });

    /**
     * @tc.number SUB_SPEC_EXPR_STMT_CONCURRENCY_0500
     * @tc.name AwaitInLogicalOrExpressionTest
     * @tc.desc test await in logical || expression: short-circuit evaluation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitInLogicalOrExpressionTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-092: await in logical || expression
      let result1: boolean = await returnTrue() || await returnFalse();
      expect(result1).assertTrue();
      
      let result2: boolean = await returnFalse() || await returnTrue();
      expect(result2).assertTrue();
    });

    /**
     * @tc.number SUB_SPEC_EXPR_STMT_CONCURRENCY_0600
     * @tc.name AwaitNullishCoalescingTest
     * @tc.desc test await with nullish coalescing: await f() ?? "default"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitNullishCoalescingTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-093: await + nullish coalescing
      let result1: string | null = await returnNull();
      let final1: string = result1 ?? "default";
      expect(final1).assertEqual("default");
      
      let result2: string = await returnPromiseString();
      let final2: string = result2 ?? "default";
      expect(final2).assertEqual("hello");
    });

    /**
     * @tc.number SUB_SPEC_EXPR_STMT_CONCURRENCY_0700
     * @tc.name AwaitTypeAssertionTest
     * @tc.desc test await with type assertion: (await f()) as Number is valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitTypeAssertionTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-094: await + as type assertion (valid case only)
      let result: number = await returnPromiseNumber();
      expect(result).assertEqual(10);
      
      let resultAsObject: Object = result as Object;
      expect(resultAsObject).not().assertNull();
    });

    /**
     * @tc.number SUB_SPEC_EXPR_STMT_CONCURRENCY_0800
     * @tc.name AwaitInForLoopTest
     * @tc.desc test await in for loop: suspends on each iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitInForLoopTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-095: await in for loop
      loopCounter = 0;
      for (let i: int = 0; i < 3; i++) {
        await incrementCounter();
      }
      expect(loopCounter).assertEqual(3);
    });

    /**
     * @tc.number SUB_SPEC_EXPR_STMT_CONCURRENCY_0900
     * @tc.name AwaitInWhileLoopTest
     * @tc.desc test await in while loop: suspends on each iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitInWhileLoopTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-096: await in while loop
      loopCounter = 0;
      while (loopCounter < 3) {
        await incrementCounter();
      }
      expect(loopCounter).assertEqual(3);
    });

    /**
     * @tc.number SUB_SPEC_EXPR_STMT_CONCURRENCY_1000
     * @tc.name AwaitInForOfLoopTest
     * @tc.desc test await in for-of loop: suspends for each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitInForOfLoopTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-097: await in for-of loop
      loopCounter = 0;
      let arr: number[] = [1, 2, 3];
      for (const item of arr) {
        await incrementCounter();
      }
      expect(loopCounter).assertEqual(3);
    });

    /**
     * @tc.number SUB_SPEC_EXPR_STMT_CONCURRENCY_1100
     * @tc.name AwaitInSwitchTest
     * @tc.desc test await in switch statement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitInSwitchTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-098: await in switch
      switchValue = 1;
      let result: number = 0;
      
      switch (switchValue) {
        case 1:
          result = await returnPromiseNumber();
          break;
        case 2:
          result = 20;
          break;
        default:
          result = 0;
      }
      
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_SPEC_EXPR_STMT_CONCURRENCY_1200
     * @tc.name AsyncTryCatchThrowAwaitTest
     * @tc.desc test async function try-catch with throw and await: rejected→catch→throw→Promise rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncTryCatchThrowAwaitTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-099: async function try-catch with throw + await
      let caught: boolean = false;
      let errorMsg: string = "";
      
      try {
        await tryCatchThrowWrapper();
      } catch (e) {
        caught = true;
        errorMsg = (e as Error).message;
      }
      
      expect(caught).assertTrue();
      expect(errorMsg).assertEqual("wrapped error");
    });

    /**
     * @tc.number SUB_SPEC_EXPR_STMT_CONCURRENCY_1300
     * @tc.name AsyncFinallyAwaitTest
     * @tc.desc test async function finally with await: finally can also await
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncFinallyAwaitTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-100: async function finally + await
      finallyCleanupCalled = false;
      
      try {
        await returnPromiseNumber();
      } finally {
        await cleanupFunc();
      }
      
      expect(finallyCleanupCalled).assertTrue();
    });

    /**
     * @tc.number SUB_SPEC_EXPR_STMT_CONCURRENCY_1400
     * @tc.name ReturnAwaitTest
     * @tc.desc test return await: await g()→resolved value→boxed as Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ReturnAwaitTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-101: return await
      let result: number = await returnAwaitFunc();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_SPEC_EXPR_STMT_CONCURRENCY_1500
     * @tc.name AwaitInDoWhileConditionTest
     * @tc.desc test await in do-while condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AwaitInDoWhileConditionTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-102: await in do-while condition
      loopCounter = 0;
      do {
        loopCounter++;
      } while (await checkCondition());
      expect(loopCounter).assertEqual(3);
    });

    /**
     * @tc.number SUB_SPEC_EXPR_STMT_CONCURRENCY_1600
     * @tc.name AwaitInArrayLiteralTest
     * @tc.desc test await in array literal: each await suspends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AwaitInArrayLiteralTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // TC-103: await in array literal
      let arr: number[] = [await returnPromiseNumber(), await returnPromiseNumber()];
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_SPEC_EXPR_STMT_CONCURRENCY_1700
     * @tc.name AwaitAwaitChainTest
     * @tc.desc test await chain: await await f() where f() returns Promise<Promise<T>>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AwaitAwaitChainTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // TC-104: await await chain
      let innerPromise = await returnNestedPromise();
      let result: number = await innerPromise;
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_SPEC_EXPR_STMT_CONCURRENCY_1800
     * @tc.name AwaitSpreadOperatorTest
     * @tc.desc test await with spread operator: await f() returns Promise<Array>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AwaitSpreadOperatorTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // TC-105: await + spread operator
      let arr: number[] = await returnArray();
      let spreadArr: number[] = [0, ...arr, 4];
      expect(spreadArr.length).assertEqual(5);
      expect(spreadArr[0]).assertEqual(0);
      expect(spreadArr[1]).assertEqual(1);
      expect(spreadArr[2]).assertEqual(2);
      expect(spreadArr[3]).assertEqual(3);
      expect(spreadArr[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_SPEC_EXPR_STMT_CONCURRENCY_1900
     * @tc.name AsyncCatchReturnTest
     * @tc.desc test async function catch with return: catch returns defaultValue→Promise resolved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncCatchReturnTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-106: async function catch with return
      let result: number = await catchReturnFunc();
      expect(result).assertEqual(100);
    });
  });
}