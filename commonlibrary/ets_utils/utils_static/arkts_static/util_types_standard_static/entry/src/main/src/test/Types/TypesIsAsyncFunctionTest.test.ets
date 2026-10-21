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
  beforeAll, afterEach, beforeEach, afterAll, describe, it, expect, TestType, Size, Level
} from '../../../../hypium/index';
import util from '@ohos.util';
import Utils from './../Util.test';

class AsyncTaskRunner {
  async run(): Promise<int> {
    return 7;
  }

  plainRun(): void {
  }
}

class PlainRecord {
  code: int = 7;
  name: string = 'obj';
}

class NullableFieldHolder {
  nullField: Object | null = null;
  undefinedField: Object | undefined = undefined;
}

class FunctionFieldHolder {
  asyncField: Object = async (): Promise<int> => {
    return 1;
  };

  syncField: (x: int) => int = (x: int): int => x;
}

class RecordBox {
  inner: Object = new PlainRecord();
}

class ThrowOnCall {
  calls: int = 0;

  run(): void {
    this.calls = this.calls + 1;
    throw new Error('sync throw');
  }

  async runAsync(): Promise<void> {
    this.calls = this.calls + 1;
    throw new Error('async throw');
  }
}

class ThenableLike {
  probe: () => void = (): void => {
  };
}

interface TaggedPojo {
  name: string;
  value: int;
}

function makeAsyncFunction(): Object {
  return async (): Promise<int> => {
    return 1;
  };
}

async function declareAsyncReturn(): Promise<string> {
  return 'async-result';
}

function declarePlainFunction(): void {
}

function probeAsyncFunction(value: Object): boolean {
  let probe: util.types = new util.types();
  return probe.isAsyncFunction(value);
}

class MixedMethodHost {
  async alpha(): Promise<int> {
    return 1;
  }

  async beta(): Promise<int> {
    return 2;
  }

  plain(): int {
    return 3;
  }
}

class BoundMethodHost {
  label: string = 'bound';

  async work(): Promise<string> {
    return this.label;
  }
}

class InheritRunner extends AsyncTaskRunner {
}

class PromiseMethodBase {
  fetch(): Promise<string> {
    return Promise.resolve<string>('base');
  }
}

class AsyncOverrideChild extends PromiseMethodBase {
  async fetch(): Promise<string> {
    return 'child';
  }
}

class SyncOverrideChild extends AsyncTaskRunner {
  run(): Promise<int> {
    return Promise.resolve<int>(0);
  }
}

class StaticAsyncHost {
  static async produce(): Promise<int> {
    return 21;
  }

  static plainProduce(): int {
    return 22;
  }
}

class CountingAsyncHost {
  calls: int = 0;

  async tick(): Promise<int> {
    this.calls = this.calls + 1;
    return this.calls;
  }
}

class MethodProvider {
  make(): Object {
    return async (): Promise<int> => {
      return 8;
    };
  }

  makePlain(): Object {
    return (): int => 9;
  }
}

class DetectionHost {
  probe(value: Object): boolean {
    let hostTypes: util.types = new util.types();
    return hostTypes.isAsyncFunction(value);
  }
}

interface AsyncHandlerContract {
  handler: () => Promise<int>;
}

interface AwaitableLike {
  then: () => Promise<int>;
}

function passThrough(value: Object): Object {
  return value;
}

function classifyWithEarlyReturn(value: Object): string {
  let classifier: util.types = new util.types();
  if (classifier.isAsyncFunction(value)) {
    return 'async';
  }
  return 'other';
}

function wrapInPlainArrow(value: Object): () => Object {
  return (): Object => value;
}

function thenIdentityChain(): Promise<int> {
  return Promise.resolve<int>(1).then((value: int): int => value);
}

export default function typesIsAsyncFunctionTest(): void {
  describe('TypesIsAsyncFunctionTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ASYNC_FUNCTION_0100
     * @tc.name testTypesIsAsyncFunction001
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts an async arrow that takes an int parameter and resolves a string; accepts an inline async arrow that resolves a numeric promise; carried by an Object typed variable; accepts an inline async arrow with no parameter and an empty body; that resolves a class instance.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAsyncFunction001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAsyncFunction returns true for an async arrow that takes an int parameter and resolves a string ---
      {
        let asyncChecker: util.types = new util.types();
        let doubled: (x: int) => Promise<int> = async (x: int): Promise<int> => { return x * 2; };
        expect(asyncChecker.isAsyncFunction(doubled)).assertTrue();
        let asyncChecker_2: util.types = new util.types();
        let text: () => Promise<string> = async (): Promise<string> => { return 'done'; };
        expect(asyncChecker_2.isAsyncFunction(text)).assertTrue();
      }

      // --- [2] Verify isAsyncFunction returns true for an inline async arrow that resolves a numeric promise ---
      {
        let asyncChecker: util.types = new util.types();
        expect(asyncChecker.isAsyncFunction(async (): Promise<int> => { return 1; })).assertTrue();
      }

      // --- [3] Verify isAsyncFunction returns true for an async arrow carried by an Object typed variable ---
      {
        let asyncChecker: util.types = new util.types();
        let carried: Object = async (): Promise<int> => { return 1; };
        expect(asyncChecker.isAsyncFunction(carried)).assertTrue();
      }

      // --- [4] Verify isAsyncFunction returns true for an inline async arrow with no parameter and an empty body ---
      {
        let asyncChecker: util.types = new util.types();
        expect(asyncChecker.isAsyncFunction(async (): Promise<void> => { })).assertTrue();
      }

      // --- [5] Verify isAsyncFunction returns true for an async arrow that resolves a class instance ---
      {
        let asyncChecker: util.types = new util.types();
        let maker: () => Promise<PlainRecord> = async (): Promise<PlainRecord> => { return new PlainRecord(); };
        expect(asyncChecker.isAsyncFunction(maker)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ASYNC_FUNCTION_0200
     * @tc.name testTypesIsAsyncFunction002
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts an async arrow with a statement block and a local variable and assigned to a Function typed variable; the true detection result can be bound to a boolean variable without losing its value; that declares an int and a string parameter; whose parameter carries a default value; async arrows are accepted when they gather rest arguments and when they take another async arrow as a parameter.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAsyncFunction002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAsyncFunction returns true for an async arrow with a statement block and a local variable and assigned to a Function typed variable ---
      {
        let asyncChecker: util.types = new util.types();
        let block: () => Promise<int> = async (): Promise<int> => {
          let base: int = 5;
          return base * 2;
        };
        expect(asyncChecker.isAsyncFunction(block)).assertTrue();
        let asyncChecker_2: util.types = new util.types();
        let fn: Function = async (): Promise<void> => { };
        expect(asyncChecker_2.isAsyncFunction(fn)).assertTrue();
      }

      // --- [2] Verify the true detection result can be bound to a boolean variable without losing its value ---
      {
        let asyncChecker: util.types = new util.types();
        let result: boolean = asyncChecker.isAsyncFunction(async (): Promise<int> => { return 1; });
        expect(result).assertTrue();
      }

      // --- [3] Verify isAsyncFunction returns true for an async arrow that declares an int and a string parameter ---
      {
        let asyncChecker: util.types = new util.types();
        let combine: (a: int, b: string) => Promise<string> = async (a: int, b: string): Promise<string> => {
          return b + a.toString();
        };
        expect(asyncChecker.isAsyncFunction(combine)).assertTrue();
      }

      // --- [4] Verify isAsyncFunction returns true for an async arrow whose parameter carries a default value ---
      {
        let asyncChecker: util.types = new util.types();
        let withDefault: (x: int) => Promise<int> = async (x: int = 2): Promise<int> => { return x; };
        expect(asyncChecker.isAsyncFunction(withDefault)).assertTrue();
      }

      // --- [5] Verify async arrows are accepted when they gather rest arguments and when they take another async arrow as a parameter ---
      {
        let asyncChecker: util.types = new util.types();
        let collect: (...rest: int[]) => Promise<int> = async (...rest: int[]): Promise<int> => { return rest.length; };
        expect(asyncChecker.isAsyncFunction(collect)).assertTrue();
        let asyncChecker_2: util.types = new util.types();
        let compose: (inner: () => Promise<int>) => Promise<int> = async (inner: () => Promise<int>): Promise<int> => {
          return inner();
        };
        expect(asyncChecker_2.isAsyncFunction(compose)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ASYNC_FUNCTION_0300
     * @tc.name testTypesIsAsyncFunction003
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts an async arrow whose parameter is typed by the TaggedPojo interface; accepts an async arrow that closes over a captured local constant; accepts a static async method reference and an async arrow whose parameter is typed Object; both async methods of one host instance are accepted through their references; three async functions coming from a declaration, a factory and a method reference are all accepted.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAsyncFunction003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAsyncFunction returns true for an async arrow whose parameter is typed by the TaggedPojo interface ---
      {
        let asyncChecker: util.types = new util.types();
        let describe: (item: TaggedPojo) => Promise<string> = async (item: TaggedPojo): Promise<string> => {
          return item.name;
        };
        expect(asyncChecker.isAsyncFunction(describe)).assertTrue();
      }

      // --- [2] Verify isAsyncFunction returns true for an async arrow that closes over a captured local constant ---
      {
        let asyncChecker: util.types = new util.types();
        let base: int = 40;
        let adder: () => Promise<int> = async (): Promise<int> => { return base + 2; };
        expect(asyncChecker.isAsyncFunction(adder)).assertTrue();
      }

      // --- [3] Verify isAsyncFunction returns true for a static async method reference and an async arrow whose parameter is typed Object ---
      {
        let asyncChecker: util.types = new util.types();
        expect(asyncChecker.isAsyncFunction(StaticAsyncHost.produce)).assertTrue();
        let asyncChecker_2: util.types = new util.types();
        let accept: (item: Object) => Promise<int> = async (item: Object): Promise<int> => { return 1; };
        expect(asyncChecker_2.isAsyncFunction(accept)).assertTrue();
      }

      // --- [4] Verify both async methods of one host instance are accepted through their references ---
      {
        let asyncChecker: util.types = new util.types();
        let host: MixedMethodHost = new MixedMethodHost();
        let flags: boolean[] = [asyncChecker.isAsyncFunction(host.alpha), asyncChecker.isAsyncFunction(host.beta)];
        expect(flags[0]).assertTrue();
        expect(flags[1]).assertTrue();
      }

      // --- [5] Verify three async functions coming from a declaration, a factory and a method reference are all accepted ---
      {
        let asyncProbe: util.types = new util.types();
        let runner: AsyncTaskRunner = new AsyncTaskRunner();
        let refs: Object[] = [declareAsyncReturn, makeAsyncFunction(), runner.run];
        let hits: int = 0;
        for (let i: int = 0; i < refs.length; i++) {
          if (asyncProbe.isAsyncFunction(refs[i])) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ASYNC_FUNCTION_0400
     * @tc.name testTypesIsAsyncFunction004
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts an async arrow read from an Object array element; a Set holding one async and one plain function yields exactly one async hit; accepts an async method reference of an instance retrieved from an Object array; retrieved from a Set iterator; and an async arrow carried over into a copied Map is accepted; stored at a non zero index of an Object array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAsyncFunction004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAsyncFunction returns true for an async arrow read from an Object array element ---
      {
        let asyncChecker: util.types = new util.types();
        let fns: Object[] = [async (): Promise<void> => { }];
        expect(asyncChecker.isAsyncFunction(fns[0])).assertTrue();
      }

      // --- [2] Verify a Set holding one async and one plain function yields exactly one async hit ---
      {
        let asyncProbe: util.types = new util.types();
        let pool: Set<Object> = new Set<Object>();
        pool.add(async (): Promise<void> => { });
        pool.add((): void => { });
        let hits: int = 0;
        for (const member of pool) {
          if (asyncProbe.isAsyncFunction(member)) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(1);
        expect(pool.size).assertEqual(2);
      }

      // --- [3] Verify isAsyncFunction returns true for an async method reference of an instance retrieved from an Object array ---
      {
        let asyncChecker: util.types = new util.types();
        let runner: AsyncTaskRunner = new AsyncTaskRunner();
        let hosts: Object[] = [runner];
        let picked: AsyncTaskRunner = hosts[0] as AsyncTaskRunner;
        expect(asyncChecker.isAsyncFunction(picked.run)).assertTrue();
      }

      // --- [4] Verify isAsyncFunction returns true for an async arrow retrieved from a Set iterator; and an async arrow carried over into a copied Map is accepted ---
      {
        let asyncChecker: util.types = new util.types();
        let pool: Set<Object> = new Set<Object>();
        pool.add(async (): Promise<void> => { });
        let iter: IterableIterator<Object> = pool.values();
        let picked: Object | undefined = iter.next().value;
        expect(asyncChecker.isAsyncFunction(picked as Object)).assertTrue();
        let asyncChecker_2: util.types = new util.types();
        let source: Map<string, Object> = new Map<string, Object>();
        source.set('f', makeAsyncFunction());
        let copy: Map<string, Object> = new Map<string, Object>(source);
        let fromCopy: Object | undefined = copy.get('f');
        expect(asyncChecker_2.isAsyncFunction(fromCopy as Object)).assertTrue();
      }

      // --- [5] Verify isAsyncFunction returns true for an async arrow stored at a non zero index of an Object array ---
      {
        let asyncChecker: util.types = new util.types();
        let row: Object[] = [new PlainRecord(), declarePlainFunction, async (): Promise<int> => { return 1; }];
        expect(asyncChecker.isAsyncFunction(row[2])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ASYNC_FUNCTION_0500
     * @tc.name testTypesIsAsyncFunction005
     * @tc.desc Merged batch (4 tests): Basic construction and recognition: checks recognition, covering async method references, plain instances and a synchronous override.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAsyncFunction005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the classification of an async function is the negation of a synchronous one ---
      {
        let asyncChecker: util.types = new util.types();
        let asyncHit: boolean = asyncChecker.isAsyncFunction(makeAsyncFunction());
        let plainHit: boolean = asyncChecker.isAsyncFunction(declarePlainFunction);
        expect(asyncHit).assertEqual(!plainHit);
      }

      // --- [2] Verify isAsyncFunction returns true for an async arrow produced by a seed carrying factory with a default argument ---
      {
        let asyncChecker: util.types = new util.types();
        let fromSeed: (seed: int) => Object = (seed: int = 3): Object => async (): Promise<int> => { return seed; };
        expect(asyncChecker.isAsyncFunction(fromSeed())).assertTrue();
      }

      // --- [3] Verify a throwing synchronous method reference is only classified and its body never executes ---
      {
        let asyncProbe: util.types = new util.types();
        let probe: ThrowOnCall = new ThrowOnCall();
        let detected: boolean = asyncProbe.isAsyncFunction(probe.run);
        expect(detected).assertFalse();
        expect(probe.calls).assertEqual(0);
      }

      // --- [4] Verify a throwing async method reference is classified as true and its body never executes ---
      {
        let asyncProbe: util.types = new util.types();
        let probe: ThrowOnCall = new ThrowOnCall();
        let detected: boolean = asyncProbe.isAsyncFunction(probe.runAsync);
        expect(detected).assertTrue();
        expect(probe.calls).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ASYNC_FUNCTION_0600
     * @tc.name testTypesIsAsyncFunction006
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: an async and a synchronous function argument are still callable after detection and the async one resolves its original value; one instance classifies a Promise instance and an async function; arrow and a plain function keep their classification after the holding array is reversed; rejects an async method reference is accepted while a plain instance and a synchronous override; arrow assigned inside an if block is accepted after the block.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAsyncFunction006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify an async and a synchronous function argument are still callable after detection and the async one resolves its original value ---
      {
        let asyncProbe: util.types = new util.types();
        let task: () => Promise<int> = async (): Promise<int> => { return 9; };
        let detected: boolean = asyncProbe.isAsyncFunction(task);
        let resolved: int = await task();
        expect(detected).assertTrue();
        expect(resolved).assertEqual(9);
        let asyncProbe_2: util.types = new util.types();
        let task_2: () => int = (): int => { return 5; };
        let detected_2: boolean = asyncProbe_2.isAsyncFunction(task_2);
        let produced: int = task_2();
        expect(detected_2).assertFalse();
        expect(produced).assertEqual(5);
      }

      // --- [2] Verify one instance classifies a Promise instance and an async function ---
      {
        let asyncChecker: util.types = new util.types();
        let promise: Promise<int> = Promise.resolve<int>(1);
        let promiseHit: boolean = asyncChecker.isAsyncFunction(promise);
        let asyncHit: boolean = asyncChecker.isAsyncFunction(makeAsyncFunction());
        expect(promiseHit).assertFalse();
        expect(asyncHit).assertTrue();
      }

      // --- [3] Verify an async arrow and a plain function keep their classification after the holding array is reversed ---
      {
        let asyncChecker: util.types = new util.types();
        let row: Object[] = [declarePlainFunction, makeAsyncFunction()];
        row.reverse();
        expect(asyncChecker.isAsyncFunction(row[0])).assertTrue();
        expect(asyncChecker.isAsyncFunction(row[1])).assertFalse();
      }

      // --- [4] Verify an async method reference is accepted while a plain instance and a synchronous override are rejected ---
      {
        let asyncChecker: util.types = new util.types();
        let runner: AsyncTaskRunner = new AsyncTaskRunner();
        let record: PlainRecord = new PlainRecord();
        let child: SyncOverrideChild = new SyncOverrideChild();
        expect(asyncChecker.isAsyncFunction(runner.run)).assertTrue();
        expect(asyncChecker.isAsyncFunction(record)).assertFalse();
        expect(asyncChecker.isAsyncFunction(child.run)).assertFalse();
      }

      // --- [5] Verify an async arrow assigned inside an if block is accepted after the block ---
      {
        let asyncChecker: util.types = new util.types();
        let flag: boolean = true;
        let handler: Object = new PlainRecord();
        if (flag) {
          handler = async (): Promise<int> => { return 1; };
        }
        expect(asyncChecker.isAsyncFunction(handler)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ASYNC_FUNCTION_0700
     * @tc.name testTypesIsAsyncFunction007
     * @tc.desc Merged batch (3 tests): Basic construction and recognition: accepts an async arrow that awaits a resolved promise; isAsyncFunction still reports an async function that was resolved into a promise after the await; isAsyncFunction returns true when detection follows an await of the same async function.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAsyncFunction007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify isAsyncFunction returns true for an async arrow that awaits a resolved promise ---
      {
        let asyncChecker: util.types = new util.types();
        let awaiting: () => Promise<int> = async (): Promise<int> => {
          let value: int = await Promise.resolve<int>(7);
          return value;
        };
        expect(asyncChecker.isAsyncFunction(awaiting)).assertTrue();
      }

      // --- [2] Verify isAsyncFunction still reports an async function that was resolved into a promise after the await ---
      {
        let asyncChecker: util.types = new util.types();
        let carried: Object = await Promise.resolve<Object>(makeAsyncFunction());
        expect(asyncChecker.isAsyncFunction(carried)).assertTrue();
      }

      // --- [3] Verify isAsyncFunction returns true when detection follows an await of the same async function ---
      {
        let asyncProbe: util.types = new util.types();
        let task: () => Promise<int> = async (): Promise<int> => { return 6; };
        let resolved: int = await task();
        expect(asyncProbe.isAsyncFunction(task)).assertTrue();
        expect(resolved).assertEqual(6);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ASYNC_FUNCTION_0800
     * @tc.name testTypesIsAsyncFunction008
     * @tc.desc Merged batch (3 tests): Type conversion and subclassing: verifies widening and subclass handling, covering Object widening.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAsyncFunction008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAsyncFunction returns true when a typed async arrow is widened to an Object variable ---
      {
        let asyncChecker: util.types = new util.types();
        let typed: () => Promise<int> = async (): Promise<int> => { return 3; };
        let widened: Object = typed;
        expect(asyncChecker.isAsyncFunction(widened)).assertTrue();
      }

      // --- [2] Verify isAsyncFunction returns true when an async method reference is widened to Object ---
      {
        let asyncChecker: util.types = new util.types();
        let host: MixedMethodHost = new MixedMethodHost();
        let widened: Object = host.alpha;
        expect(asyncChecker.isAsyncFunction(widened)).assertTrue();
      }

      // --- [3] Verify an async arrow read from a Map and widened to Object is accepted ---
      {
        let asyncChecker: util.types = new util.types();
        let byKey: Map<string, Object> = new Map<string, Object>();
        byKey.set('f', makeAsyncFunction());
        let widened: Object = byKey.get('f') as Object;
        expect(asyncChecker.isAsyncFunction(widened)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ASYNC_FUNCTION_0900
     * @tc.name testTypesIsAsyncFunction009
     * @tc.desc Merged batch (3 tests): Boundary overflow: verifies numeric limit and wrapping behavior, covering asynchronous flows and related extreme values.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAsyncFunction009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAsyncFunction returns false for the double upper limit Number.MAX_VALUE ---
      {
        let asyncChecker: util.types = new util.types();
        let largest: Object = Number.MAX_VALUE;
        expect(asyncChecker.isAsyncFunction(largest)).assertFalse();
      }

      // --- [2] Verify isAsyncFunction returns false for Number.MIN_VALUE, the smallest positive double ---
      {
        let asyncChecker: util.types = new util.types();
        let smallest: Object = Number.MIN_VALUE;
        let hits: int = 0;
        if (asyncChecker.isAsyncFunction(smallest)) {
          hits += 1;
        }
        expect(hits).assertEqual(0);
      }

      // --- [3] Verify an out of range DataView construction raises a RangeError while isAsyncFunction still rejects a valid view ---
      {
        let asyncProbe: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        try {
          new DataView(buffer, 8, 2);
          expect().assertFail();
        } catch (err) {
          expect(err.name).assertEqual('RangeError');
        }
        let view: DataView = new DataView(buffer, 0, 4);
        expect(asyncProbe.isAsyncFunction(view)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ASYNC_FUNCTION_1000
     * @tc.name testTypesIsAsyncFunction010
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects a string of 10000 repeated characters; -1 and the double 3.14 and the small ints 0, 1 and 100 are all rejected in a single pass; rejects the boxed number, string and boolean wrappers; rejects the non-finite doubles NaN and positive Infinity in a single pass; rejects the negative infinity double.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAsyncFunction010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAsyncFunction returns false for a string of 10000 repeated characters ---
      {
        let asyncProbe: util.types = new util.types();
        let text: string = 'a'.repeat(10000);
        expect(text.length).assertEqual(10000);
        expect(asyncProbe.isAsyncFunction(text)).assertFalse();
      }

      // --- [2] Verify -1 and the double 3.14 and the small ints 0, 1 and 100 are all rejected in a single pass ---
      {
        let asyncProbe: util.types = new util.types();
        let probes: Object[] = [-2147483648, -1, 2147483647, 3.14];
        let hits: int = 0;
        for (let i: int = 0; i < probes.length; i++) {
          let verdict: boolean = asyncProbe.isAsyncFunction(probes[i]);
          if (verdict) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(0);
        let asyncProbe_2: util.types = new util.types();
        let small: Object[] = [0, 1, 100];
        let hits_2: int = 0;
        for (let i_2: int = 0; i_2 < small.length; i_2++) {
          if (asyncProbe_2.isAsyncFunction(small[i_2])) {
            hits_2 = hits_2 + 1;
          }
        }
        expect(hits_2).assertEqual(0);
      }

      // --- [3] Verify isAsyncFunction returns false for the boxed number, string and boolean wrappers ---
      {
        let asyncChecker: util.types = new util.types();
        let boxedNumber: Object = new Number(1);
        let boxedText: Object = new String('x');
        let boxedFlag: Object = new Boolean(true);
        expect(asyncChecker.isAsyncFunction(boxedNumber)).assertFalse();
        expect(asyncChecker.isAsyncFunction(boxedText)).assertFalse();
        expect(asyncChecker.isAsyncFunction(boxedFlag)).assertFalse();
      }

      // --- [4] Verify isAsyncFunction returns false for the non-finite doubles NaN and positive Infinity in a single pass ---
      {
        let asyncChecker: util.types = new util.types();
        let nonFinite: Object[] = [Double.NaN, Double.POSITIVE_INFINITY];
        let hits: int = 0;
        for (const value of nonFinite) {
          if (asyncChecker.isAsyncFunction(value)) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(0);
      }

      // --- [5] Verify isAsyncFunction returns false for the negative infinity double ---
      {
        let asyncChecker: util.types = new util.types();
        let negatives: double[] = [Double.NEGATIVE_INFINITY];
        let hits: int = 0;
        for (let candidate of negatives) {
          if (!asyncChecker.isAsyncFunction(candidate)) {
            hits += 1;
          }
        }
        expect(hits).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ASYNC_FUNCTION_1100
     * @tc.name testTypesIsAsyncFunction011
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects Number.MAX_SAFE_INTEGER; isAsyncFunction rejects the boxed long, byte and short primitives collected in one Object array; rejects both boolean literals true and false; rejects the bigint literal 100n; rejects the bigint values 0n and both long bounds.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAsyncFunction011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAsyncFunction returns false for Number.MAX_SAFE_INTEGER ---
      {
        let asyncChecker: util.types = new util.types();
        let extremes: Object[] = [Number.MAX_SAFE_INTEGER];
        expect(asyncChecker.isAsyncFunction(extremes[0])).assertFalse();
      }

      // --- [2] Verify isAsyncFunction rejects the boxed long, byte and short primitives collected in one Object array ---
      {
        let asyncChecker: util.types = new util.types();
        let wide: long = 9007199254740993;
        let narrow: byte = 127;
        let half: short = 32767;
        let boxes: Object[] = [wide, narrow, half];
        expect(asyncChecker.isAsyncFunction(boxes[0])).assertFalse();
        expect(asyncChecker.isAsyncFunction(boxes[1])).assertFalse();
        expect(asyncChecker.isAsyncFunction(boxes[2])).assertFalse();
        expect(boxes.length).assertEqual(3);
      }

      // --- [3] Verify isAsyncFunction returns false for both boolean literals true and false ---
      {
        let asyncProbe: util.types = new util.types();
        let flags: Object[] = [true, false];
        let hits: int = 0;
        for (let i: int = 0; i < flags.length; i++) {
          if (asyncProbe.isAsyncFunction(flags[i])) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(0);
      }

      // --- [4] Verify isAsyncFunction returns false for the bigint literal 100n ---
      {
        let asyncChecker: util.types = new util.types();
        let big: Object = 100n;
        expect(asyncChecker.isAsyncFunction(big)).assertFalse();
      }

      // --- [5] Verify isAsyncFunction returns false for the bigint values 0n and both long bounds ---
      {
        let asyncProbe: util.types = new util.types();
        let bigs: Object[] = [0n, 9223372036854775807n, -9223372036854775808n];
        let hits: int = 0;
        for (let i: int = 0; i < bigs.length; i++) {
          if (asyncProbe.isAsyncFunction(bigs[i])) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ASYNC_FUNCTION_1200
     * @tc.name testTypesIsAsyncFunction012
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects a string that looks like async function source code; a batch of number, string, boolean and object arguments is classified as false; double negation keeps a true result true and a false result false; rejects empty, numeric and string arrays; building a Date from a non date string is rejected with a FormatError that is named and is not an async function.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAsyncFunction012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAsyncFunction returns false for a string that looks like async function source code ---
      {
        let asyncChecker: util.types = new util.types();
        let source: string = 'async (): Promise<void> => { }';
        expect(asyncChecker.isAsyncFunction(source)).assertFalse();
      }

      // --- [2] Verify a batch of number, string, boolean and object arguments is classified as false ---
      {
        let asyncProbe: util.types = new util.types();
        let mixed: Object[] = [0, '', true, new Object(), 'x'];
        let hits: int = 0;
        for (let i: int = 0; i < mixed.length; i++) {
          if (asyncProbe.isAsyncFunction(mixed[i])) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(0);
      }

      // --- [3] Verify double negation keeps a true result true and a false result false ---
      {
        let asyncProbe: util.types = new util.types();
        let positive: boolean = asyncProbe.isAsyncFunction(declareAsyncReturn);
        let negative: boolean = asyncProbe.isAsyncFunction(declarePlainFunction);
        expect(!!positive).assertTrue();
        expect(!!negative).assertFalse();
      }

      // --- [4] Verify isAsyncFunction returns false for empty, numeric and string arrays ---
      {
        let asyncProbe: util.types = new util.types();
        let emptyArray: int[] = [];
        let numberArray: int[] = [1, 2, 3];
        let textArray: string[] = ['a', 'b'];
        let boxes: Object[] = [emptyArray, numberArray, textArray];
        let hits: int = 0;
        for (let i: int = 0; i < boxes.length; i++) {
          if (asyncProbe.isAsyncFunction(boxes[i])) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(0);
      }

      // --- [5] Verify building a Date from a non date string is rejected with a FormatError that is named and is not an async function ---
      {
        let asyncProbe: util.types = new util.types();
        let judged: boolean = false;
        try {
          new Date('not-a-date');
          expect().assertFail();
        } catch (err) {
          judged = asyncProbe.isAsyncFunction(err as Object);
          expect(err.name).assertEqual('FormatError');
        }
        expect(judged).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ASYNC_FUNCTION_1300
     * @tc.name testTypesIsAsyncFunction013
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a synchronous arrow that resolves a promise without the async keyword; rejects an arrow whose body is empty and a synchronous arrow that returns a class instance; plain int arrow and the same arrow declaring a default parameter; synchronous arrow with a statement block; isAsyncFunction is false for Uint8ClampedArray, Int16Array, Uint16Array, Uint32Array and BigUint64Array views over one eight byte buffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAsyncFunction013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAsyncFunction returns false for a synchronous arrow that resolves a promise without the async keyword ---
      {
        let asyncChecker: util.types = new util.types();
        let notAsync: () => Promise<int> = (): Promise<int> => Promise.resolve<int>(1);
        expect(asyncChecker.isAsyncFunction(notAsync)).assertFalse();
      }

      // --- [2] Verify isAsyncFunction returns false for an arrow whose body is empty and a synchronous arrow that returns a class instance ---
      {
        let asyncChecker: util.types = new util.types();
        let empty: () => void = (): void => { };
        expect(asyncChecker.isAsyncFunction(empty)).assertFalse();
        let asyncChecker_2: util.types = new util.types();
        let maker: () => Object = (): Object => new PlainRecord();
        expect(asyncChecker_2.isAsyncFunction(maker)).assertFalse();
      }

      // --- [3] Verify a plain int arrow and the same arrow declaring a default parameter are both rejected ---
      {
        let asyncChecker: util.types = new util.types();
        let plain: (x: int) => int = (x: int): int => x;
        let withDefault: (a: int) => int = (a: int = 1): int => a;
        expect(asyncChecker.isAsyncFunction(plain)).assertFalse();
        expect(asyncChecker.isAsyncFunction(withDefault)).assertFalse();
      }

      // --- [4] Verify isAsyncFunction returns false for a synchronous arrow with a statement block ---
      {
        let asyncChecker: util.types = new util.types();
        let block: (x: int) => int = (x: int): int => {
          let next: int = x + 1;
          return next;
        };
        expect(asyncChecker.isAsyncFunction(block)).assertFalse();
      }

      // --- [5] Verify isAsyncFunction is false for Uint8ClampedArray, Int16Array, Uint16Array, Uint32Array and BigUint64Array views over one eight byte buffer ---
      {
        let asyncProbe: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let clamped: Uint8ClampedArray = new Uint8ClampedArray(buffer);
        let halves: Int16Array = new Int16Array(buffer);
        let shorts: Uint16Array = new Uint16Array(buffer);
        let quads: Uint32Array = new Uint32Array(buffer);
        let wides: BigUint64Array = new BigUint64Array(buffer);
        expect(asyncProbe.isAsyncFunction(clamped)).assertFalse();
        expect(asyncProbe.isAsyncFunction(halves)).assertFalse();
        expect(asyncProbe.isAsyncFunction(shorts)).assertFalse();
        expect(asyncProbe.isAsyncFunction(quads)).assertFalse();
        expect(asyncProbe.isAsyncFunction(wides)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ASYNC_FUNCTION_1400
     * @tc.name testTypesIsAsyncFunction014
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a synchronous arrow bound to a typed variable alias; rejects the synchronous method reference of a class instance and promises produced by Promise.race and Promise.any; class instance reached through an Object field; rejects an object literal constrained by an interface; bare Object and for a thenable like object carrying only a probe method.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAsyncFunction014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAsyncFunction returns false for a synchronous arrow bound to a typed variable alias ---
      {
        let asyncChecker: util.types = new util.types();
        let base: () => void = (): void => { };
        let alias: () => void = base;
        expect(asyncChecker.isAsyncFunction(alias)).assertFalse();
      }

      // --- [2] Verify isAsyncFunction returns false for the synchronous method reference of a class instance and promises produced by Promise.race and Promise.any ---
      {
        let asyncChecker: util.types = new util.types();
        let runner: AsyncTaskRunner = new AsyncTaskRunner();
        expect(asyncChecker.isAsyncFunction(runner.plainRun)).assertFalse();
        let asyncChecker_2: util.types = new util.types();
        let first: Promise<int> = Promise.resolve<int>(1);
        let second: Promise<int> = Promise.resolve<int>(2);
        let raced: Promise<int> = Promise.race<int>([first, second]);
        let anyPromise: Promise<int> = Promise.any<int>([first, second]);
        expect(asyncChecker_2.isAsyncFunction(raced)).assertFalse();
        expect(asyncChecker_2.isAsyncFunction(anyPromise)).assertFalse();
      }

      // --- [3] Verify isAsyncFunction returns false for a class instance reached through an Object field ---
      {
        let asyncChecker: util.types = new util.types();
        let box: RecordBox = new RecordBox();
        let inner: Object = box.inner;
        expect(asyncChecker.isAsyncFunction(inner)).assertFalse();
      }

      // --- [4] Verify isAsyncFunction returns false for an object literal constrained by an interface ---
      {
        let asyncChecker: util.types = new util.types();
        let pojo: TaggedPojo = { name: 'n', value: 1 };
        expect(asyncChecker.isAsyncFunction(pojo)).assertFalse();
      }

      // --- [5] Verify isAsyncFunction returns false for a bare Object and for a thenable like object carrying only a probe method ---
      {
        let asyncChecker: util.types = new util.types();
        let empty: Object = new Object();
        let thenable: ThenableLike = new ThenableLike();
        expect(asyncChecker.isAsyncFunction(empty)).assertFalse();
        expect(asyncChecker.isAsyncFunction(thenable)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ASYNC_FUNCTION_1500
     * @tc.name testTypesIsAsyncFunction015
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects an empty and for a populated Map instance; rejects a populated Set instance and WeakMap and for a WeakSet instance; rejects Date and ArrayBuffer instances, and for Error and RangeError instances; rejects six standard typed array instances over one buffer; rejects a DataView instance over a four byte buffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAsyncFunction015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAsyncFunction returns false for an empty and for a populated Map instance ---
      {
        let asyncProbe: util.types = new util.types();
        let emptyMap: Map<int, int> = new Map<int, int>();
        let filledMap: Map<string, int> = new Map<string, int>();
        filledMap.set('k', 1);
        let containers: Object[] = [emptyMap, filledMap];
        let hits: int = 0;
        for (let i: int = 0; i < containers.length; i++) {
          if (asyncProbe.isAsyncFunction(containers[i])) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(0);
      }

      // --- [2] Verify isAsyncFunction returns false for a populated Set instance and WeakMap and for a WeakSet instance ---
      {
        let asyncChecker: util.types = new util.types();
        let pool: Set<string> = new Set<string>();
        pool.add('a');
        expect(asyncChecker.isAsyncFunction(pool)).assertFalse();
        let asyncChecker_2: util.types = new util.types();
        let weakMap: WeakMap<PlainRecord, PlainRecord> = new WeakMap<PlainRecord, PlainRecord>();
        let weakSet: WeakSet<PlainRecord> = new WeakSet<PlainRecord>();
        expect(asyncChecker_2.isAsyncFunction(weakMap)).assertFalse();
        expect(asyncChecker_2.isAsyncFunction(weakSet)).assertFalse();
      }

      // --- [3] Verify isAsyncFunction returns false for Date and ArrayBuffer instances, and for Error and RangeError instances ---
      {
        let asyncChecker: util.types = new util.types();
        let stamp: Date = new Date(123);
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let plainError: Error = new Error('boom');
        let rangeError: Error = new RangeError('range');
        expect(asyncChecker.isAsyncFunction(stamp)).assertFalse();
        expect(asyncChecker.isAsyncFunction(buffer)).assertFalse();
        expect(asyncChecker.isAsyncFunction(plainError)).assertFalse();
        expect(asyncChecker.isAsyncFunction(rangeError)).assertFalse();
      }

      // --- [4] Verify isAsyncFunction returns false for six standard typed array instances over one buffer ---
      {
        let asyncProbe: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let views: Object[] = [
          new Uint8Array(buffer), new Int8Array(buffer), new Int32Array(buffer),
          new Float32Array(buffer), new Float64Array(buffer), new BigInt64Array(buffer)
        ];
        let hits: int = 0;
        for (let i: int = 0; i < views.length; i++) {
          if (asyncProbe.isAsyncFunction(views[i])) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(0);
      }

      // --- [5] Verify isAsyncFunction returns false for a DataView instance over a four byte buffer ---
      {
        let asyncChecker: util.types = new util.types();
        let view: DataView = new DataView(new ArrayBuffer(4));
        expect(asyncChecker.isAsyncFunction(view)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ASYNC_FUNCTION_1600
     * @tc.name testTypesIsAsyncFunction016
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects the key iterator of a populated Map; value iterator of a populated Set; isAsyncFunction returns false when the util.types instance itself is the argument; rejects a reference to a throwing method and true for an async function; built in Date.now static function.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAsyncFunction016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAsyncFunction returns false for the key iterator of a populated Map ---
      {
        let asyncChecker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('k', 1);
        let iter: IterableIterator<string> = m.keys();
        expect(asyncChecker.isAsyncFunction(iter)).assertFalse();
      }

      // --- [2] Verify isAsyncFunction returns false for the value iterator of a populated Set ---
      {
        let asyncChecker: util.types = new util.types();
        let pool: Set<int> = new Set<int>();
        pool.add(1);
        let iter: IterableIterator<int> = pool.values();
        expect(asyncChecker.isAsyncFunction(iter)).assertFalse();
      }

      // --- [3] Verify isAsyncFunction returns false when the util.types instance itself is the argument ---
      {
        let asyncChecker: util.types = new util.types();
        let probes: boolean[] = [asyncChecker.isAsyncFunction(asyncChecker)];
        expect(probes.indexOf(true)).assertEqual(-1);
      }

      // --- [4] Verify isAsyncFunction returns false for a reference to a throwing method and true for an async function ---
      {
        let asyncProbe: util.types = new util.types();
        let probe: ThrowOnCall = new ThrowOnCall();
        let rejected: boolean = asyncProbe.isAsyncFunction(probe.run);
        let accepted: boolean = asyncProbe.isAsyncFunction(makeAsyncFunction());
        expect(rejected).assertFalse();
        expect(accepted).assertTrue();
      }

      // --- [5] Verify isAsyncFunction returns false for the built in Date.now static function ---
      {
        let asyncChecker: util.types = new util.types();
        let builtin: Object = Date.now;
        expect(asyncChecker.isAsyncFunction(builtin)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ASYNC_FUNCTION_1700
     * @tc.name testTypesIsAsyncFunction017
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a Date getTime method detached from its instance and static plain method reference; rejects the plain method reference of an instance retrieved from an Object array; rejects the values iterator and the entries iterator of one Map; rejects the keys iterator and the entries iterator of one Set; rejects a promise produced by Promise.all and a then chain.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAsyncFunction017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAsyncFunction returns false for a Date getTime method detached from its instance and static plain method reference ---
      {
        let asyncChecker: util.types = new util.types();
        let stamp: Date = new Date(0);
        let detached: Object = stamp.getTime;
        expect(asyncChecker.isAsyncFunction(detached)).assertFalse();
        let asyncChecker_2: util.types = new util.types();
        expect(asyncChecker_2.isAsyncFunction(StaticAsyncHost.plainProduce)).assertFalse();
      }

      // --- [2] Verify isAsyncFunction returns false for the plain method reference of an instance retrieved from an Object array ---
      {
        let asyncProbe: util.types = new util.types();
        let runner: AsyncTaskRunner = new AsyncTaskRunner();
        let hosts: Object[] = [runner];
        let picked: AsyncTaskRunner = hosts[0] as AsyncTaskRunner;
        expect(asyncProbe.isAsyncFunction(picked.plainRun)).assertFalse();
        expect(hosts.length).assertEqual(1);
      }

      // --- [3] Verify isAsyncFunction returns false for the values iterator and the entries iterator of one Map ---
      {
        let asyncChecker: util.types = new util.types();
        let m: Map<string, int> = new Map<string, int>();
        m.set('k', 1);
        expect(asyncChecker.isAsyncFunction(m.values())).assertFalse();
        expect(asyncChecker.isAsyncFunction(m.entries())).assertFalse();
      }

      // --- [4] Verify isAsyncFunction returns false for the keys iterator and the entries iterator of one Set ---
      {
        let asyncChecker: util.types = new util.types();
        let pool: Set<int> = new Set<int>();
        pool.add(1);
        expect(asyncChecker.isAsyncFunction(pool.keys())).assertFalse();
        expect(asyncChecker.isAsyncFunction(pool.entries())).assertFalse();
      }

      // --- [5] Verify isAsyncFunction returns false for a promise produced by Promise.all and a then chain ---
      {
        let asyncChecker: util.types = new util.types();
        let all: Promise<int[]> = Promise.all([Promise.resolve<int>(1), Promise.resolve<int>(2)]);
        expect(asyncChecker.isAsyncFunction(all)).assertFalse();
        let asyncChecker_2: util.types = new util.types();
        let chained: Promise<int> = thenIdentityChain();
        expect(asyncChecker_2.isAsyncFunction(chained)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ASYNC_FUNCTION_1800
     * @tc.name testTypesIsAsyncFunction018
     * @tc.desc Merged batch (1 test): Non-target object rejection: rejects a plain arrow whose variable name mentions async.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAsyncFunction018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isAsyncFunction returns false for a plain arrow whose variable name mentions async ---
      {
        let asyncChecker: util.types = new util.types();
        let asyncLookingName: Object = (x: int): int => x;
        expect(asyncChecker.isAsyncFunction(asyncLookingName)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ASYNC_FUNCTION_1900
     * @tc.name testTypesIsAsyncFunction019
     * @tc.desc Merged batch (4 tests): State preservation and verdict changes: verifies async status across mutations, covering Map overwrites, holder sizes, nullable fields and repeats.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAsyncFunction019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify overwriting a Map entry from async to plain flips its result from true to false ---
      {
        let asyncChecker: util.types = new util.types();
        let byKey: Map<string, Object> = new Map<string, Object>();
        byKey.set('k', makeAsyncFunction());
        let before: boolean = asyncChecker.isAsyncFunction(byKey.get('k') as Object);
        byKey.set('k', declarePlainFunction);
        let after: boolean = asyncChecker.isAsyncFunction(byKey.get('k') as Object);
        expect(before).assertTrue();
        expect(after).assertFalse();
      }

      // --- [2] Verify detection does not change the size of the Set that holds the async arrow ---
      {
        let asyncProbe: util.types = new util.types();
        let pool: Set<Object> = new Set<Object>();
        let fn: Object = makeAsyncFunction();
        pool.add(fn);
        expect(asyncProbe.isAsyncFunction(fn)).assertTrue();
        expect(pool.size).assertEqual(1);
      }

      // --- [3] Verify Object or null fields and Object or undefined fields keep an async producer or method reference and reject a later record or Date ---
      {
        let asyncChecker: util.types = new util.types();
        let holder: NullableFieldHolder = new NullableFieldHolder();
        holder.nullField = makeAsyncFunction();
        expect(asyncChecker.isAsyncFunction(holder.nullField as Object)).assertTrue();
        holder.nullField = new PlainRecord();
        expect(asyncChecker.isAsyncFunction(holder.nullField as Object)).assertFalse();
        let asyncChecker_2: util.types = new util.types();
        let heap: NullableFieldHolder = new NullableFieldHolder();
        let host: AsyncTaskRunner = new AsyncTaskRunner();
        heap.undefinedField = host.run;
        expect(asyncChecker_2.isAsyncFunction(heap.undefinedField as Object)).assertTrue();
        heap.undefinedField = new Date(0);
        expect(asyncChecker_2.isAsyncFunction(heap.undefinedField as Object)).assertFalse();
      }

      // --- [4] Verify two consecutive detections of the same synchronous function on one instance both return false ---
      {
        let asyncChecker: util.types = new util.types();
        let first: boolean = asyncChecker.isAsyncFunction(declarePlainFunction);
        let second: boolean = asyncChecker.isAsyncFunction(declarePlainFunction);
        expect(first).assertFalse();
        expect(second).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_ASYNC_FUNCTION_2000
     * @tc.name testTypesIsAsyncFunction020
     * @tc.desc Merged batch (4 tests): Negative checks and side effects: verifies async detection, covering body non-execution, reassignment, flag driven factories and method references.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsAsyncFunction020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify detection does not execute the async body and a later call increments its counter to one ---
      {
        let asyncProbe: util.types = new util.types();
        let host: CountingAsyncHost = new CountingAsyncHost();
        let detected: boolean = asyncProbe.isAsyncFunction(host.tick);
        expect(detected).assertTrue();
        expect(host.calls).assertEqual(0);
        let produced: int = await host.tick();
        expect(produced).assertEqual(1);
        expect(host.calls).assertEqual(1);
      }

      // --- [2] Verify reassigning a variable from an async arrow to a plain function flips the result from true to false ---
      {
        let asyncChecker: util.types = new util.types();
        let handler: Object = makeAsyncFunction();
        let before: boolean = asyncChecker.isAsyncFunction(handler);
        handler = declarePlainFunction;
        let after: boolean = asyncChecker.isAsyncFunction(handler);
        expect(before).assertTrue();
        expect(after).assertFalse();
      }

      // --- [3] Verify a flag driven factory is true only on its async branch and a selector reaches the true branch for an async function neither typed nor a Date ---
      {
        let asyncChecker: util.types = new util.types();
        let flag: boolean = true;
        let chosen: Object = flag ? makeAsyncFunction() : declarePlainFunction;
        let other: Object = !flag ? makeAsyncFunction() : declarePlainFunction;
        expect(asyncChecker.isAsyncFunction(chosen)).assertTrue();
        expect(asyncChecker.isAsyncFunction(other)).assertFalse();
        let asyncChecker_2: util.types = new util.types();
        let fn: Object = makeAsyncFunction();
        let category: string = 'none';
        switch (asyncChecker_2.isAsyncFunction(fn)) {
          case true:
            category = asyncChecker_2.isTypedArray(fn) ? 'async and typed' : 'async only';
            break;
          default:
            category = 'not async';
            break;
        }
        expect(category).assertEqual('async only');
        expect(asyncChecker_2.isArrayBuffer(fn)).assertFalse();
        expect(asyncChecker_2.isDate(fn)).assertFalse();
      }

      // --- [4] Verify isAsyncFunction returns false for the detectors own method reference ---
      {
        let asyncChecker: util.types = new util.types();
        let apiRef: Object = asyncChecker.isAsyncFunction;
        expect(asyncChecker.isAsyncFunction(apiRef)).assertFalse();
      }
    });

  });
}
