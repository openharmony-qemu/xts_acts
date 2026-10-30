/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, expect, it, TestType, Size, Level, afterAll } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';

/**
 * Shared @Concurrent functions used as call/apply targets.
 *
 * NOTE: In ArkTS strict mode Function.prototype.call/apply/bind are not directly
 * reachable on a typed function value, so every invocation below first casts the
 * function to ESObject and then performs a dynamic property access (.call/.apply).
 * This is the only strict-mode-safe path (@ts-ignore is disabled by
 * arkts-strict-typing-required).
 */
@Concurrent
function add(a: number, b: number): number {
  return a + b;
}

@Concurrent
function noArgFunc(): number {
  return 42;
}

@Sendable
class SendableParam {
  public x: number;
  constructor(x: number) {
    this.x = x;
  }
}

@Concurrent
function readSendableX(obj: SendableParam): number {
  return obj.x;
}

/**
 * Sendable class that owns a method used as a call/apply target.
 * Used by SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0050 (shared method as target) and
 * SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0044 (non-callable target).
 */
@Sendable
class MethodOwner {
  public marker: number = 1;
  public m(p: number): number {
    return p * 2;
  }
}

/**
 * Sendable class whose method reads `this.x`. Used by SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0047
 * to verify that .call rebinds `this` to the supplied sendable instance.
 *
 * NOTE: a standalone @Concurrent function does not expose a rebindable `this` in
 * ArkTS, so a @Sendable class method (where `this` is the receiver) is the
 * correct carrier for verifying .call this-rebinding semantics.
 */
@Sendable
class ThisHolder {
  public x: number;
  constructor(x: number) {
    this.x = x;
  }
  public getX(): number {
    return this.x;
  }
}

/**
 * Cross-thread call/apply verification executed on a taskpool worker thread.
 *
 * taskpool runs @Concurrent functions on worker threads, which is functionally
 * equivalent to worker.ThreadWorker for cross-thread semantics while keeping the
 * test self-contained (no separate worker .ets file or build-profile registration
 * required). The module-scope @Concurrent `add` is accessible from the worker.
 */
@Concurrent
function crossThreadCallVerify(): number {
  let fn: ESObject = add;
  return fn.call(null, 1, 2) as number;
}

@Concurrent
function crossThreadApplyVerify(): number {
  let fn: ESObject = add;
  let args: Array<number> = [1, 2];
  return fn.apply(null, args) as number;
}

export default function SharedFunctionCallApplyTest() {
  describe('SharedFunctionCallApplyTest', () => {
    afterAll(async () => {
      console.info('SharedFunctionCallApplyTest afterAll called');
      await new Promise<void>((resolve) => { setTimeout(resolve, 100); });
    });

    /**
     * @tc.name   testConcurrentFuncCallBasic
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0042
     * @tc.desc   Verify Function.call on a @Concurrent function: f.call(null, 1, 2) returns 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConcurrentFuncCallBasic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testConcurrentFuncCallBasic';
        console.info(`${caseName} start`);
        try {
          let fn: ESObject = add;
          let result: number = fn.call(null, 1, 2) as number;
          expect(result).assertEqual(3);
        } catch (error) {
          console.error(`${caseName} error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        console.info(`${caseName} end`);
        done();
      });

    /**
     * @tc.name   testConcurrentFuncApplyBasic
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0043
     * @tc.desc   Verify Function.apply on a @Concurrent function: f.apply(null, [1, 2]) returns 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConcurrentFuncApplyBasic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testConcurrentFuncApplyBasic';
        console.info(`${caseName} start`);
        try {
          let fn: ESObject = add;
          let args: Array<number> = [1, 2];
          let result: number = fn.apply(null, args) as number;
          expect(result).assertEqual(3);
        } catch (error) {
          console.error(`${caseName} error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        console.info(`${caseName} end`);
        done();
      });

    /**
     * @tc.name   testCallOnNonCallableThrows
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0044
     * @tc.desc   Verify .call on a non-callable target throws TypeError.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallOnNonCallableThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testCallOnNonCallableThrows';
        console.info(`${caseName} start`);
        // A plain sendable object instance is not callable; ArkTS strict mode
        // rejects untyped object literals (arkts-no-untyped-obj-literals), so a
        // @Sendable class instance is used as the non-callable target.
        let nonCallable: ESObject = new MethodOwner();
        let threw: boolean = false;
        try {
          let r: ESObject = nonCallable.call(null, 1, 2);
          console.info(`${caseName} unexpected return: ${JSON.stringify(r)}`);
        } catch (error) {
          threw = true;
          console.info(`${caseName} caught expected error: ${JSON.stringify(error)}`);
        }
        expect(threw).assertTrue();
        console.info(`${caseName} end`);
        done();
      });

    /**
     * @tc.name   testApplyWithNonObjectArgArrayThrows
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0045
     * @tc.desc   Verify f.apply(null, 1) with a non-object argArray throws TypeError.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testApplyWithNonObjectArgArrayThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testApplyWithNonObjectArgArrayThrows';
        console.info(`${caseName} start`);
        let fn: ESObject = add;
        let threw: boolean = false;
        try {
          let r: ESObject = fn.apply(null, 1);
          console.info(`${caseName} unexpected return: ${JSON.stringify(r)}`);
        } catch (error) {
          threw = true;
          console.info(`${caseName} caught expected error: ${JSON.stringify(error)}`);
        }
        expect(threw).assertTrue();
        console.info(`${caseName} end`);
        done();
      });

    /**
     * @tc.name   testCallApplyCrossThreadWorker
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0046
     * @tc.desc   Verify .call/.apply on a @Concurrent function executed on a worker thread
     *            produce the same result as on the main thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallApplyCrossThreadWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testCallApplyCrossThreadWorker';
        console.info(`${caseName} start`);
        try {
          // Main-thread reference result.
          let mainFn: ESObject = add;
          let mainCall: number = mainFn.call(null, 1, 2) as number;
          let mainArgs: Array<number> = [1, 2];
          let mainApply: number = mainFn.apply(null, mainArgs) as number;

          // Worker-thread (taskpool) results.
          let workerCall = await taskpool.execute(crossThreadCallVerify);
          let workerApply = await taskpool.execute(crossThreadApplyVerify);

          expect(workerCall as number).assertEqual(mainCall);
          expect(workerApply as number).assertEqual(mainApply);
          expect(workerCall as number).assertEqual(3);
          expect(workerApply as number).assertEqual(3);
        } catch (error) {
          console.error(`${caseName} error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        console.info(`${caseName} end`);
        done();
      });

    /**
     * @tc.name   testCallRebindsThisToSendable
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0047
     * @tc.desc   Verify .call rebinds `this` to the supplied sendable instance and the
     *            method reads this.x from the rebound receiver.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallRebindsThisToSendable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testCallRebindsThisToSendable';
        console.info(`${caseName} start`);
        try {
          let a: ThisHolder = new ThisHolder(10);
          let b: ThisHolder = new ThisHolder(99);
          // Extract the method via dynamic access and rebind `this` to b.
          let methodRef: ESObject = (a as ESObject).getX;
          let result: number = methodRef.call(b) as number;
          expect(result).assertEqual(99);
        } catch (error) {
          console.error(`${caseName} error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        console.info(`${caseName} end`);
        done();
      });

    /**
     * @tc.name   testApplyWithNullOrUndefinedArgArray
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0048
     * @tc.desc   Verify f.apply(null, null) and f.apply(null, undefined) are valid no-arg calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testApplyWithNullOrUndefinedArgArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testApplyWithNullOrUndefinedArgArray';
        console.info(`${caseName} start`);
        try {
          let fn: ESObject = noArgFunc;
          let r1: number = fn.apply(null, null) as number;
          let r2: number = fn.apply(null, undefined) as number;
          expect(r1).assertEqual(42);
          expect(r2).assertEqual(42);
        } catch (error) {
          console.error(`${caseName} error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        console.info(`${caseName} end`);
        done();
      });

    /**
     * @tc.name   testApplyWithEmptyArray
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0049
     * @tc.desc   Verify f.apply(null, []) is a valid no-arg call.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testApplyWithEmptyArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testApplyWithEmptyArray';
        console.info(`${caseName} start`);
        try {
          let fn: ESObject = noArgFunc;
          let empty: Array<number> = [];
          let result: number = fn.apply(null, empty) as number;
          expect(result).assertEqual(42);
        } catch (error) {
          console.error(`${caseName} error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        console.info(`${caseName} end`);
        done();
      });

    /**
     * @tc.name   testSharedMethodCallApply
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0050
     * @tc.desc   Verify obj.m.call(null, 1) and obj.m.apply(null, [1]) invoke a shared
     *            (sendable) class method as the call/apply target.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedMethodCallApply', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testSharedMethodCallApply';
        console.info(`${caseName} start`);
        try {
          let owner: MethodOwner = new MethodOwner();
          let methodRef: ESObject = (owner as ESObject).m;
          let oneArg: Array<number> = [1];
          let byCall: number = methodRef.call(null, 1) as number;
          let byApply: number = methodRef.apply(null, oneArg) as number;
          expect(byCall).assertEqual(2);
          expect(byApply).assertEqual(2);
        } catch (error) {
          console.error(`${caseName} error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        console.info(`${caseName} end`);
        done();
      });

    /**
     * @tc.name   testMultiWorkerConcurrentCallApply
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0051
     * @tc.desc   Verify multi-worker concurrent .call/.apply produce correct results
     *            across all concurrent workers.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMultiWorkerConcurrentCallApply', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testMultiWorkerConcurrentCallApply';
        console.info(`${caseName} start`);
        try {
          // Launch 4 concurrent call workers and 4 concurrent apply workers.
          let c1 = taskpool.execute(crossThreadCallVerify);
          let c2 = taskpool.execute(crossThreadCallVerify);
          let c3 = taskpool.execute(crossThreadCallVerify);
          let c4 = taskpool.execute(crossThreadCallVerify);
          let a1 = taskpool.execute(crossThreadApplyVerify);
          let a2 = taskpool.execute(crossThreadApplyVerify);
          let a3 = taskpool.execute(crossThreadApplyVerify);
          let a4 = taskpool.execute(crossThreadApplyVerify);

          let callResults = await Promise.all([c1, c2, c3, c4]);
          let applyResults = await Promise.all([a1, a2, a3, a4]);

          expect(callResults.length).assertEqual(4);
          expect(applyResults.length).assertEqual(4);
          expect(callResults[0] as number).assertEqual(3);
          expect(callResults[1] as number).assertEqual(3);
          expect(callResults[2] as number).assertEqual(3);
          expect(callResults[3] as number).assertEqual(3);
          expect(applyResults[0] as number).assertEqual(3);
          expect(applyResults[1] as number).assertEqual(3);
          expect(applyResults[2] as number).assertEqual(3);
          expect(applyResults[3] as number).assertEqual(3);
        } catch (error) {
          console.error(`${caseName} error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        console.info(`${caseName} end`);
        done();
      });

    /**
     * @tc.name   testCallOmitThisArg
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0052
     * @tc.desc   Verify f.call() with an omitted thisArg defaults thisArg to undefined
     *            and the call still executes the function body.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallOmitThisArg', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testCallOmitThisArg';
        console.info(`${caseName} start`);
        try {
          let fn: ESObject = noArgFunc;
          // Omit thisArg entirely; thisArg defaults to undefined (strict mode).
          let result: number = fn.call() as number;
          expect(result).assertEqual(42);
        } catch (error) {
          console.error(`${caseName} error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        console.info(`${caseName} end`);
        done();
      });

    /**
     * @tc.name   testCallPassesSendableParam
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0053
     * @tc.desc   Verify f.call(null, sendableObj) passes the sendable parameter correctly
     *            and the function reads sendableObj.x.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallPassesSendableParam', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testCallPassesSendableParam';
        console.info(`${caseName} start`);
        try {
          let fn: ESObject = readSendableX;
          let param: SendableParam = new SendableParam(77);
          let result: number = fn.call(null, param) as number;
          expect(result).assertEqual(77);
        } catch (error) {
          console.error(`${caseName} error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        console.info(`${caseName} end`);
        done();
      });
  });
}
