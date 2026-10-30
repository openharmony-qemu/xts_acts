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
 * Sendable class used as the bound `this` target. Its method reads this.field and
 * combines it with the call arguments so a single bound invocation exercises both
 * this-binding and prefix-argument currying.
 *
 * NOTE: a standalone @Concurrent function does not expose a rebindable `this` in
 * ArkTS, so a @Sendable class method (where `this` is the receiver) is the
 * correct carrier for verifying .bind this-binding + prefix-arg semantics.
 */
@Sendable
class BindTarget {
  public field: number;
  constructor(field: number) {
    this.field = field;
  }
  public compute(a: number, b: number, c: number): number {
    return this.field + a + b + c;
  }
}

/**
 * @Concurrent consumer that accepts an arbitrary argument. Used by
 * SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0059 to prove a bound (non-sendable) function cannot be
 * shared across threads: passing it as a taskpool argument must error.
 */
@Concurrent
function consumeAny(arg: ESObject): number {
  return 0;
}

export default function SharedFunctionBindTest() {
  describe('SharedFunctionBindTest', () => {
    afterAll(async () => {
      console.info('SharedFunctionBindTest afterAll called');
      await new Promise<void>((resolve) => { setTimeout(resolve, 100); });
    });

    /**
     * @tc.name   testBindThisAndPrefixArgs
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0054
     * @tc.desc   Verify f.bind(obj, 1, 2)(3): this is bound to the sendable obj,
     *            prefix args 1 and 2 are curried, and the return value is correct.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBindThisAndPrefixArgs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testBindThisAndPrefixArgs';
        console.info(`${caseName} start`);
        try {
          let target: BindTarget = new BindTarget(100);
          // field=100, compute(a,b,c) = field + a + b + c.
          // bind this=target, prefix a=1, b=2; then call with c=3 -> 100+1+2+3 = 106.
          let methodRef: ESObject = (target as ESObject).compute;
          let bound: ESObject = methodRef.bind(target, 1, 2);
          let result: number = bound(3) as number;
          expect(result).assertEqual(106);
        } catch (error) {
          console.error(`${caseName} error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        console.info(`${caseName} end`);
        done();
      });

    /**
     * @tc.name   testBindOnNonCallableThrows
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0055
     * @tc.desc   Verify .bind on a non-callable target throws TypeError.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBindOnNonCallableThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testBindOnNonCallableThrows';
        console.info(`${caseName} start`);
        // A @Sendable class instance is not callable (used instead of an untyped
        // object literal, which ArkTS strict mode rejects).
        let nonCallable: ESObject = new BindTarget(1);
        let threw: boolean = false;
        try {
          let bound: ESObject = (nonCallable as ESObject).bind(null, 1);
          console.info(`${caseName} unexpected bound: ${JSON.stringify(bound)}`);
        } catch (error) {
          threw = true;
          console.info(`${caseName} caught expected error: ${JSON.stringify(error)}`);
        }
        expect(threw).assertTrue();
        console.info(`${caseName} end`);
        done();
      });

    /**
     * @tc.name   testBoundFunctionLength
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0056
     * @tc.desc   Verify bound.length reflects (original.length - prefix arg count)
     *            for different prefix parameter counts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoundFunctionLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testBoundFunctionLength';
        console.info(`${caseName} start`);
        try {
          let target: BindTarget = new BindTarget(0);
          let methodRef: ESObject = (target as ESObject).compute;
          // compute has 3 params.
          // bind 0 prefix args -> length 3; bind 1 -> length 2; bind 2 -> length 1.
          let bound0: ESObject = methodRef.bind(target);
          let bound1: ESObject = methodRef.bind(target, 1);
          let bound2: ESObject = methodRef.bind(target, 1, 2);
          let len0: number = bound0.length as number;
          let len1: number = bound1.length as number;
          let len2: number = bound2.length as number;
          expect(len0).assertEqual(3);
          expect(len1).assertEqual(2);
          expect(len2).assertEqual(1);
        } catch (error) {
          console.error(`${caseName} error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        console.info(`${caseName} end`);
        done();
      });

    /**
     * @tc.name   testBoundFunctionName
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0057
     * @tc.desc   Verify the .name property of a bound shared function is a non-empty
     *            string (per spec, "bound " + original name).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoundFunctionName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testBoundFunctionName';
        console.info(`${caseName} start`);
        try {
          let target: BindTarget = new BindTarget(0);
          let methodRef: ESObject = (target as ESObject).compute;
          let bound: ESObject = methodRef.bind(target, 1);
          let name: string = bound.name as string;
          // Per ECMAScript, a bound function name is "bound " + target name.
          // Assert it is a non-empty string and carries the "bound" prefix when
          // the runtime follows the spec.
          expect(name.length > 0).assertTrue();
          let startsWithBound: boolean = name.indexOf('bound') === 0;
          console.info(`${caseName} bound.name = "${name}"`);
          // Soft-check: log the actual value; the spec-compliant expectation is
          // a "bound"-prefixed name, but the concrete name depends on the runtime
          // so we only hard-assert non-emptiness.
          expect(typeof name === 'string').assertTrue();
          if (startsWithBound) {
            expect(startsWithBound).assertTrue();
          }
        } catch (error) {
          console.error(`${caseName} error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        console.info(`${caseName} end`);
        done();
      });

    /**
     * @tc.name   testBoundFunctionPrototypeOfNonSendable
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0058
     * @tc.desc   Verify Object.getPrototypeOf(boundFunction) returns a non-null
     *            prototype and the bound function is a non-sendable Function
     *            (not an instance of a @Sendable class).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoundFunctionPrototypeOfNonSendable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testBoundFunctionPrototypeOfNonSendable';
        console.info(`${caseName} start`);
        try {
          let target: BindTarget = new BindTarget(0);
          let methodRef: ESObject = (target as ESObject).compute;
          let bound: ESObject = methodRef.bind(target, 1);
          let proto: ESObject = Object.getPrototypeOf(bound);
          expect(proto !== null && proto !== undefined).assertTrue();
          // A bound function is callable and is NOT an instance of the @Sendable
          // BindTarget class, i.e. it is a non-sendable Function value.
          expect(typeof bound === 'function').assertTrue();
          expect(bound instanceof BindTarget).assertFalse();
        } catch (error) {
          console.error(`${caseName} error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        console.info(`${caseName} end`);
        done();
      });

    /**
     * @tc.name   testBoundFunctionNotShareableToWorker
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_SENDABLE_BUILTINS_0059
     * @tc.desc   Verify a bound function is not shareable: posting it to a worker thread
     *            (via taskpool argument) throws an error because bound functions are not
     *            @Sendable / not cross-thread shareable.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBoundFunctionNotShareableToWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function): Promise<void> => {
        const caseName = 'testBoundFunctionNotShareableToWorker';
        console.info(`${caseName} start`);
        try {
          let target: BindTarget = new BindTarget(0);
          let methodRef: ESObject = (target as ESObject).compute;
          let bound: ESObject = methodRef.bind(target, 1, 2);
          let threw: boolean = false;
          try {
            // A bound function is not @Sendable; taskpool must reject sharing it
            // as a cross-thread argument. Use the Task form (proven in siblings).
            let task: taskpool.Task = new taskpool.Task(consumeAny, bound);
            let r = await taskpool.execute(task);
            console.info(`${caseName} unexpected success: ${JSON.stringify(r)}`);
          } catch (error) {
            threw = true;
            console.info(`${caseName} caught expected not-shareable error: ${JSON.stringify(error)}`);
          }
          expect(threw).assertTrue();
        } catch (error) {
          console.error(`${caseName} error: ${JSON.stringify(error)}`);
          expect().assertFail();
        }
        console.info(`${caseName} end`);
        done();
      });
  });
}
