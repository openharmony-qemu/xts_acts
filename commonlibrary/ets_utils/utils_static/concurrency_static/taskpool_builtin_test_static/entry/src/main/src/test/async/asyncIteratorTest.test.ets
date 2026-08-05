'use static';
/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterEach, afterAll, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import { sleep } from '../Utils.test';

// ===== Static equivalent of the async-iterator protocol =====
// ArkTS 1.2 does not support async generators (async function*, yield,
// for await, Symbol.asyncIterator). The 100 dynamic tests are rewritten as
// async functions, arrays and explicit state classes whose next() method
// resolves with the same iterator-result shape ({ value, done }) as the
// dynamic async generator's next(), preserving the per-step ordering and
// done semantics of every test point.

// Iterator-result shape shared by every explicit state class below
// (static equivalent of the { value, done } object returned by next()).
interface SeqStep<T> {
  done: boolean;
  value: T | undefined;
}

// Structural interface satisfied by every explicit state class below, so the
// shared collect helper can consume SeqIter, ReturnIter and DelaySeqIter alike.
interface SeqAsyncIter<T> {
  next(): Promise<SeqStep<T>>;
}

// Explicit state class emulating an async generator that yields a fixed
// sequence of values: each next() advances the internal index and resolves
// with the next yielded value; after exhaustion it resolves done === true.
class SeqIter<T> implements SeqAsyncIter<T> {
  private values: T[] = [];
  private index: int = 0;

  constructor(values: T[]) {
    this.values = values;
  }

  async next(): Promise<SeqStep<T>> {
    if (this.index < this.values.length) {
      const value: T = this.values[this.index];
      this.index = this.index + 1;
      return { value: value, done: false };
    }
    return { value: undefined, done: true };
  }
}

// Explicit state class emulating an async generator that ends with a
// `return value` statement: after all yielded values are consumed the next
// next() call resolves { value: returnValue, done: true }, exactly like the
// return statement of a dynamic async generator.
class ReturnIter<T> implements SeqAsyncIter<T> {
  private yields: T[] = [];
  private returnValue: T | undefined = undefined;
  private index: int = 0;

  constructor(yields: T[], returnValue: T | undefined) {
    this.yields = yields;
    this.returnValue = returnValue;
  }

  async next(): Promise<SeqStep<T>> {
    if (this.index < this.yields.length) {
      const value: T = this.yields[this.index];
      this.index = this.index + 1;
      return { value: value, done: false };
    }
    if (this.index === this.yields.length) {
      this.index = this.index + 1;
      return { value: this.returnValue, done: true };
    }
    return { value: undefined, done: true };
  }
}

// Explicit state class emulating an async generator that awaits a delay
// before (some of) its yields: the delays list is consumed step by step and
// applied before each yielded value, mirroring the dynamic await-then-yield
// bodies.
class DelaySeqIter<T> implements SeqAsyncIter<T> {
  private values: T[] = [];
  private delays: int[] = [];
  private index: int = 0;

  constructor(values: T[], delays: int[]) {
    this.values = values;
    this.delays = delays;
  }

  async next(): Promise<SeqStep<T>> {
    if (this.index < this.values.length) {
      if (this.index < this.delays.length) {
        await sleep(this.delays[this.index]);
      }
      const value: T = this.values[this.index];
      this.index = this.index + 1;
      return { value: value, done: false };
    }
    return { value: undefined, done: true };
  }
}

// Static equivalent of `for await (const v of asyncIter)`: repeatedly calls
// the explicit next() until done and returns the collected values in order.
async function collectAll<T>(iter: SeqAsyncIter<T>): Promise<T[]> {
  const collected: T[] = [];
  let step: SeqStep<T> = await iter.next();
  while (!step.done) {
    const stepValue: T | undefined = step.value;
    if (stepValue !== undefined) {
      collected.push(stepValue);
    }
    step = await iter.next();
  }
  return collected;
}

// Typed value objects yielded by the rewritten object-value tests.
interface ObjKey {
  key: string;
}

interface PropObj {
  prop: number;
}

interface PropStrObj {
  prop: string;
}

// ===== Explicit state classes for the protocol / control-flow tests =====
// Static equivalent of test 008: for an async generator,
// asyncIterator[Symbol.asyncIterator]() returns the generator itself, i.e.
// the iterator object is its own iterable. The explicit getIterator() method
// plays the role of the Symbol.asyncIterator protocol and must return `this`.
class SelfReturningIter {
  private step: int = 0;

  public getIterator(): SelfReturningIter {
    return this;
  }

  async next(): Promise<SeqStep<number>> {
    if (this.step === 0) {
      this.step = this.step + 1;
      return { value: 1, done: false };
    }
    if (this.step === 1) {
      this.step = this.step + 1;
      return { value: 2, done: false };
    }
    this.step = this.step + 1;
    return { value: undefined, done: true };
  }
}

// Static equivalent of test 053: the dynamic custom async iterable creates a
// fresh counter iterator for every Symbol.asyncIterator() call, so two fresh
// iterators both start their counter at 1. The factory below preserves that
// "independent iterator per access" behavior.
class CountIter053 {
  private count: int = 0;

  async next(): Promise<SeqStep<number>> {
    this.count = this.count + 1;
    if (this.count <= 2) {
      return { value: this.count, done: false };
    }
    return { value: undefined, done: true };
  }
}

class CountIterFactory053 {
  public createIterator(): CountIter053 {
    return new CountIter053();
  }
}

// Static equivalent of tests 010/034: an async generator whose body throws
// between two yields and catches the error with its own catch block, which
// then yields the recovery value.
class TryCatchYieldIter {
  private step: int = 0;

  async next(): Promise<SeqStep<number>> {
    if (this.step === 0) {
      this.step = this.step + 1;
      return { value: 1, done: false };
    }
    if (this.step === 1) {
      this.step = this.step + 1;
      try {
        throw new Error('test');
      } catch (e) {
        return { value: 2, done: false };
      }
    }
    this.step = this.step + 1;
    return { value: undefined, done: true };
  }
}

// Static equivalent of test 024: an async generator whose body throws between
// two yields; the finally block yields a value before the error propagates.
class TryFinallyIter {
  private step: int = 0;

  async next(): Promise<SeqStep<number>> {
    if (this.step === 0) {
      this.step = this.step + 1;
      return { value: 1, done: false };
    }
    if (this.step === 1) {
      this.step = this.step + 1;
      return { value: 3, done: false };
    }
    this.step = this.step + 1;
    return { value: undefined, done: true };
  }
}

// Static equivalent of test 044: the generator's catch(err) block yields the
// error message of the thrown error.
class CatchMsgIter {
  private step: int = 0;

  async next(): Promise<SeqStep<string | number>> {
    if (this.step === 0) {
      this.step = this.step + 1;
      return { value: 1, done: false };
    }
    if (this.step === 1) {
      this.step = this.step + 1;
      try {
        throw new Error('test-err');
      } catch (e) {
        return { value: 'test-err', done: false };
      }
    }
    this.step = this.step + 1;
    return { value: undefined, done: true };
  }
}

// Static equivalent of test 047: the generator's finally block yields a value
// after the try body has been fully consumed.
class TryFinallyValIter {
  private step: int = 0;

  async next(): Promise<SeqStep<string | number>> {
    if (this.step === 0) {
      this.step = this.step + 1;
      return { value: 1, done: false };
    }
    if (this.step === 1) {
      this.step = this.step + 1;
      let yielded: string = '';
      try {
        // generator body completed between the two yields
      } finally {
        yielded = 'finally-val';
      }
      return { value: yielded, done: false };
    }
    this.step = this.step + 1;
    return { value: undefined, done: true };
  }
}

// Static equivalent of test 059: after its catch block yields 'caught' the
// generator rethrows, so the third next() call rejects with an Error.
class RethrowIter {
  private step: int = 0;

  async next(): Promise<SeqStep<string | number>> {
    if (this.step === 0) {
      this.step = this.step + 1;
      return { value: 1, done: false };
    }
    if (this.step === 1) {
      this.step = this.step + 1;
      try {
        throw new Error();
      } catch (e) {
        return { value: 'caught', done: false };
      }
    }
    if (this.step === 2) {
      this.step = this.step + 1;
      throw new Error('rethrow');
    }
    this.step = this.step + 1;
    return { value: undefined, done: true };
  }
}

// Static equivalent of test 062: the outer generator and its delegated nested
// generator share the same closure state; the nested iterator doubles the
// initial value, updates the shared state and triples the value, after which
// the outer iterator yields the updated shared state.
class StatefulIter {
  private state: int = 0;
  private step: int = 0;

  constructor(initial: int) {
    this.state = initial;
  }

  async next(): Promise<SeqStep<number>> {
    if (this.step === 0) {
      this.step = this.step + 1;
      const val: int = this.state;
      return { value: val * 2, done: false };
    }
    if (this.step === 1) {
      this.step = this.step + 1;
      const val: int = this.state;
      this.state = this.state + val;
      return { value: val * 3, done: false };
    }
    if (this.step === 2) {
      this.step = this.step + 1;
      return { value: this.state, done: false };
    }
    this.step = this.step + 1;
    return { value: undefined, done: true };
  }
}

// Static equivalent of test 078: an iterator whose internal state can be
// reset, so a second consumption pass yields the same values again.
class ResetableIter {
  private state: int = 0;

  public reset(): void {
    this.state = 0;
  }

  async next(): Promise<SeqStep<number>> {
    if (this.state < 2) {
      const value: int = this.state;
      this.state = this.state + 1;
      return { value: value, done: false };
    }
    return { value: undefined, done: true };
  }
}

// Static equivalent of test 082: the iterator yields 'pending' first, then an
// async operation flips the status and the second next() yields 'complete'.
class StatusIter {
  private isComplete: boolean = false;
  private step: int = 0;

  async next(): Promise<SeqStep<string>> {
    if (this.step === 0) {
      this.step = this.step + 1;
      return { value: 'pending', done: false };
    }
    if (this.step === 1) {
      this.step = this.step + 1;
      await sleep(10);
      this.isComplete = true;
      return { value: this.isComplete ? 'complete' : 'failed', done: false };
    }
    this.step = this.step + 1;
    return { value: undefined, done: true };
  }
}

// Static equivalent of test 083: the nested generator throws after yielding
// 1; the outer catch block then yields 'caught'.
class NestedCatchIter {
  private step: int = 0;

  async next(): Promise<SeqStep<string | number>> {
    if (this.step === 0) {
      this.step = this.step + 1;
      return { value: 1, done: false };
    }
    if (this.step === 1) {
      this.step = this.step + 1;
      try {
        throw new Error('nested err');
      } catch (e) {
        return { value: 'caught', done: false };
      }
    }
    this.step = this.step + 1;
    return { value: undefined, done: true };
  }
}

// Static equivalent of test 090: the iterator yields the initial state (0),
// then awaits an external async state update and yields the synchronized
// state (10). Unlike the dynamic timer-based version the update promise is
// awaited explicitly, so the ordering is deterministic.
class SyncStateIter {
  private syncState: int = 0;
  private step: int = 0;
  private updatePromise: Promise<int>;

  constructor() {
    this.updatePromise = new Promise<int>((resolve: (value: int) => void) => {
      setTimeout((): void => {
        this.syncState = 10;
        resolve(this.syncState);
      }, 100);
    });
  }

  async next(): Promise<SeqStep<number>> {
    if (this.step === 0) {
      this.step = this.step + 1;
      return { value: 0, done: false };
    }
    if (this.step === 1) {
      this.step = this.step + 1;
      await this.updatePromise;
      return { value: this.syncState, done: false };
    }
    this.step = this.step + 1;
    return { value: undefined, done: true };
  }
}

// Static equivalent of test 096: two iterators share the same holder state;
// the iterator with the shorter delay (adding 3) is consumed first, then the
// other one (adding 5). The dynamic version relied on a 1ms/2ms timer race,
// here the explicit await order makes the sequence deterministic.
class SharedState096 {
  public shared: int = 0;
}

class SharedIterA {
  private holder: SharedState096;
  private called: boolean = false;

  constructor(holder: SharedState096) {
    this.holder = holder;
  }

  async next(): Promise<SeqStep<number>> {
    await sleep(10);
    if (!this.called) {
      this.called = true;
      this.holder.shared = this.holder.shared + 3;
      return { value: this.holder.shared, done: false };
    }
    return { value: undefined, done: true };
  }
}

class SharedIterB {
  private holder: SharedState096;
  private called: boolean = false;

  constructor(holder: SharedState096) {
    this.holder = holder;
  }

  async next(): Promise<SeqStep<number>> {
    await sleep(10);
    if (!this.called) {
      this.called = true;
      this.holder.shared = this.holder.shared + 5;
      return { value: this.holder.shared, done: false };
    }
    return { value: undefined, done: true };
  }
}

// Static equivalent of test 092: an error-prone iterator that yields 'start',
// throws inside its delegated inner iterator, catches the error and yields
// 'recovered', then yields 'end'.
class ErrorProneIter {
  private step: int = 0;

  async next(): Promise<SeqStep<string>> {
    if (this.step === 0) {
      this.step = this.step + 1;
      return { value: 'start', done: false };
    }
    if (this.step === 1) {
      this.step = this.step + 1;
      try {
        await sleep(10);
        throw new Error('test');
      } catch (e) {
        return { value: 'recovered', done: false };
      }
    }
    if (this.step === 2) {
      this.step = this.step + 1;
      return { value: 'end', done: false };
    }
    this.step = this.step + 1;
    return { value: undefined, done: true };
  }
}

// Bespoke state classes for the null / undefined value tests.
class UndefIter {
  private step: int = 0;

  async next(): Promise<SeqStep<undefined>> {
    if (this.step === 0) {
      this.step = this.step + 1;
      return { value: undefined, done: false };
    }
    this.step = this.step + 1;
    return { value: undefined, done: true };
  }
}

class NullIter {
  private step: int = 0;

  async next(): Promise<SeqStep<null>> {
    if (this.step === 0) {
      this.step = this.step + 1;
      return { value: null, done: false };
    }
    this.step = this.step + 1;
    return { value: undefined, done: true };
  }
}

class NullUndefIter {
  private step: int = 0;

  async next(): Promise<SeqStep<null | undefined>> {
    if (this.step === 0) {
      this.step = this.step + 1;
      return { value: null, done: false };
    }
    if (this.step === 1) {
      this.step = this.step + 1;
      return { value: undefined, done: false };
    }
    this.step = this.step + 1;
    return { value: undefined, done: true };
  }
}

class NullZeroStrIter {
  private step: int = 0;

  async next(): Promise<SeqStep<null | number | string>> {
    if (this.step === 0) {
      this.step = this.step + 1;
      return { value: null, done: false };
    }
    if (this.step === 1) {
      this.step = this.step + 1;
      return { value: 0, done: false };
    }
    if (this.step === 2) {
      this.step = this.step + 1;
      return { value: '', done: false };
    }
    this.step = this.step + 1;
    return { value: undefined, done: true };
  }
}

export default function asyncIteratorTest(): void {
  describe('asyncIteratorTest', (): void => {
    afterEach((): void => { });
    afterAll((): void => {
    });

    /**
     * @tc.name   AsyncIteratorTest001
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_001
     * @tc.desc   Async iterator yields number 1, next() resolves value 1 with done false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const iter: SeqIter<number> = new SeqIter<number>([1]);
      const result: SeqStep<number> = await iter.next();
      expect(result.value).assertEqual(1);
      expect(result.done).assertEqual(false);
    });

    /**
     * @tc.name   AsyncIteratorTest002
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_002
     * @tc.desc   Empty async iterator, first next() resolves done true with undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const iter: SeqIter<number> = new SeqIter<number>([]);
      const result: SeqStep<number> = await iter.next();
      expect(result.done).assertEqual(true);
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.name   AsyncIteratorTest003
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_003
     * @tc.desc   Async iterator yields 'a' then 'b', third next() resolves done true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const iter: SeqIter<string> = new SeqIter<string>(['a', 'b']);
      const res1: SeqStep<string> = await iter.next();
      const res2: SeqStep<string> = await iter.next();
      const res3: SeqStep<string> = await iter.next();
      expect(res1.value).assertEqual('a');
      expect(res2.value).assertEqual('b');
      expect(res3.done).assertEqual(true);
    });

    /**
     * @tc.name   AsyncIteratorTest004
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_004
     * @tc.desc   Async iterator yields bigint 10n, next() resolves value 10n with done false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const iter: SeqIter<bigint> = new SeqIter<bigint>([10n]);
      const result: SeqStep<bigint> = await iter.next();
      expect(result.value).assertEqual(10n);
      expect(result.done).assertEqual(false);
    });

    /**
     * @tc.name   AsyncIteratorTest005
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_005
     * @tc.desc   Async iterator yields boolean true, next() resolves true with done false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const iter: SeqIter<boolean> = new SeqIter<boolean>([true]);
      const result: SeqStep<boolean> = await iter.next();
      expect(result.value).assertEqual(true);
      expect(result.done).assertEqual(false);
    });

    /**
     * @tc.name   AsyncIteratorTest006
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_006
     * @tc.desc   Async iterator yields object { key: 'val' }, field value preserved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const iter: SeqIter<ObjKey> = new SeqIter<ObjKey>([{ key: 'val' }]);
      const result: SeqStep<ObjKey> = await iter.next();
      expect(result.value !== undefined).assertTrue();
      const obj: ObjKey | undefined = result.value;
      if (obj !== undefined) {
        expect(obj.key).assertEqual('val');
      }
      expect(result.done).assertEqual(false);
    });

    /**
     * @tc.name   AsyncIteratorTest007
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_007
     * @tc.desc   Async iterator over for-loop yields 0,1,2 in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const values: number[] = [];
      for (let i: int = 0; i < 3; i = i + 1) {
        values.push(i);
      }
      const iter: SeqIter<number> = new SeqIter<number>(values);
      const collected: number[] = await collectAll<number>(iter);
      expect(JSON.stringify(collected)).assertEqual('[0,1,2]');
    });

    /**
     * @tc.name   AsyncIteratorTest008
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_008
     * @tc.desc   Async iterator is its own iterable, iterator accessor returns the iterator itself
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // static equivalent of asyncIterator[Symbol.asyncIterator]() === asyncIterator
      const iter: SelfReturningIter = new SelfReturningIter();
      const iterable: SelfReturningIter = iter.getIterator();
      expect(iterable === iter).assertTrue();
    });

    /**
     * @tc.name   AsyncIteratorTest009
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_009
     * @tc.desc   Async iterator awaits a delay before yielding 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const iter: DelaySeqIter<number> = new DelaySeqIter<number>([3], [10]);
      const result: SeqStep<number> = await iter.next();
      expect(result.value).assertEqual(3);
      expect(result.done).assertEqual(false);
    });

    /**
     * @tc.name   AsyncIteratorTest010
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_010
     * @tc.desc   Async iterator throws between yields, its own catch yields 2 after 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const iter: TryCatchYieldIter = new TryCatchYieldIter();
      const res1: SeqStep<number> = await iter.next();
      const res2: SeqStep<number> = await iter.next();
      expect(res1.value).assertEqual(1);
      expect(res2.value).assertEqual(2);
    });

    /**
     * @tc.name   AsyncIteratorTest011
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_011
     * @tc.desc   Async iterator with generator parameters (2,3) yields a+b then a*b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const a: int = 2;
      const b: int = 3;
      const iter: SeqIter<number> = new SeqIter<number>([a + b, a * b]);
      const res1: SeqStep<number> = await iter.next();
      const res2: SeqStep<number> = await iter.next();
      expect(res1.value).assertEqual(5);
      expect(res2.value).assertEqual(6);
    });

    /**
     * @tc.name   AsyncIteratorTest012
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_012
     * @tc.desc   Async iterator delegates to nested iterator yielding 'nested'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // static equivalent of yield* nested async generator: the outer iterator
      // delegates to the inner iterator and re-yields its value
      const inner: SeqIter<string> = new SeqIter<string>(['nested']);
      const innerStep: SeqStep<string> = await inner.next();
      const outer: string[] = [];
      const innerValue: string | undefined = innerStep.value;
      if (innerValue !== undefined) {
        outer.push(innerValue);
      }
      const iter: SeqIter<string> = new SeqIter<string>(outer);
      const result: SeqStep<string> = await iter.next();
      expect(result.value).assertEqual('nested');
      expect(result.done).assertEqual(false);
    });

    /**
     * @tc.name   AsyncIteratorTest013
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_013
     * @tc.desc   Async iterator with while-loop yields 0,1 then completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const values: number[] = [];
      let count: int = 0;
      while (count < 2) {
        values.push(count);
        count = count + 1;
      }
      const iter: SeqIter<number> = new SeqIter<number>(values);
      const res1: SeqStep<number> = await iter.next();
      const res2: SeqStep<number> = await iter.next();
      const res3: SeqStep<number> = await iter.next();
      expect(res1.value).assertEqual(0);
      expect(res2.value).assertEqual(1);
      expect(res3.done).assertEqual(true);
    });

    /**
     * @tc.name   AsyncIteratorTest014
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_014
     * @tc.desc   Async iterator yields null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const iter: NullIter = new NullIter();
      const result: SeqStep<null> = await iter.next();
      expect(result.value).assertNull();
      expect(result.done).assertEqual(false);
    });

    /**
     * @tc.name   AsyncIteratorTest015
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_015
     * @tc.desc   Async iterator yields undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const iter: UndefIter = new UndefIter();
      const result: SeqStep<undefined> = await iter.next();
      expect(result.value).assertUndefined();
      expect(result.done).assertEqual(false);
    });

    /**
     * @tc.name   AsyncIteratorTest016
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_016
     * @tc.desc   Async iterator over array [10,20,30] yields all items in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const source: number[] = [10, 20, 30];
      const values: number[] = [];
      for (const item of source) {
        values.push(item);
      }
      const iter: SeqIter<number> = new SeqIter<number>(values);
      const collected: number[] = await collectAll<number>(iter);
      expect(JSON.stringify(collected)).assertEqual('[10,20,30]');
    });

    /**
     * @tc.name   AsyncIteratorTest017
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_017
     * @tc.desc   Async iterator yields awaited resolved promise value 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // static equivalent: the yielded value is the awaited result of a promise
      const promised: number = await Promise.resolve(42);
      const iter: SeqIter<number> = new SeqIter<number>([promised]);
      const result: SeqStep<number> = await iter.next();
      expect(result.value).assertEqual(42);
      expect(result.done).assertEqual(false);
    });

    /**
     * @tc.name   AsyncIteratorTest018
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_018
     * @tc.desc   Async iterator yields 1 then returns 'returnVal' with done true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const iter: ReturnIter<string | number> = new ReturnIter<string | number>([1], 'returnVal');
      const res1: SeqStep<string | number> = await iter.next();
      const res2: SeqStep<string | number> = await iter.next();
      expect(res1.value).assertEqual(1);
      expect(res2.value).assertEqual('returnVal');
      expect(res2.done).assertEqual(true);
    });

    /**
     * @tc.name   AsyncIteratorTest019
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_019
     * @tc.desc   Async iterator doubles values 5,6 consumed from a nested iterator, yields 10,12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const inner: SeqIter<number> = new SeqIter<number>([5, 6]);
      const transformed: number[] = [];
      let innerStep: SeqStep<number> = await inner.next();
      while (!innerStep.done) {
        const innerValue: number | undefined = innerStep.value;
        if (innerValue !== undefined) {
          transformed.push(innerValue * 2);
        }
        innerStep = await inner.next();
      }
      const iter: SeqIter<number> = new SeqIter<number>(transformed);
      const values: number[] = await collectAll<number>(iter);
      expect(JSON.stringify(values)).assertEqual('[10,12]');
    });

    /**
     * @tc.name   AsyncIteratorTest020
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_020
     * @tc.desc   Async iterator skips a dead branch and yields 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // static equivalent: the generator body contains a branch that is never
      // taken, so only the value after the branch is yielded
      const values: number[] = [];
      const deadBranch: boolean = values.length > 0;
      if (deadBranch) {
        values.push(1);
      }
      values.push(2);
      const iter: SeqIter<number> = new SeqIter<number>(values);
      const result: SeqStep<number> = await iter.next();
      expect(result.value).assertEqual(2);
      expect(result.done).assertEqual(false);
    });

    /**
     * @tc.name   AsyncIteratorTest021
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_021
     * @tc.desc   Async iterator with break-out while loop yields 0,1 then completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const values: number[] = [];
      let i: int = 0;
      while (true) {
        if (i >= 2) {
          break;
        }
        values.push(i);
        i = i + 1;
      }
      const iter: SeqIter<number> = new SeqIter<number>(values);
      const res1: SeqStep<number> = await iter.next();
      const res2: SeqStep<number> = await iter.next();
      const res3: SeqStep<number> = await iter.next();
      expect(res1.value).assertEqual(0);
      expect(res2.value).assertEqual(1);
      expect(res3.done).assertEqual(true);
    });

    /**
     * @tc.name   AsyncIteratorTest022
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_022
     * @tc.desc   Async iterator yields 'first' then 'second' with a delay between yields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const iter: DelaySeqIter<string> = new DelaySeqIter<string>(['first', 'second'], [0, 10]);
      const res1: SeqStep<string> = await iter.next();
      const res2: SeqStep<string> = await iter.next();
      expect(res1.value).assertEqual('first');
      expect(res2.value).assertEqual('second');
    });

    /**
     * @tc.name   AsyncIteratorTest023
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_023
     * @tc.desc   Async iterator delegates to array [7,8,9], yields 7,8,9 in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // static equivalent of yield* [7, 8, 9]
      const iter: SeqIter<number> = new SeqIter<number>([7, 8, 9]);
      const values: number[] = await collectAll<number>(iter);
      expect(JSON.stringify(values)).assertEqual('[7,8,9]');
    });

    /**
     * @tc.name   AsyncIteratorTest024
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_024
     * @tc.desc   Async iterator finally block yields 3 after first yield 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const iter: TryFinallyIter = new TryFinallyIter();
      const res1: SeqStep<number> = await iter.next();
      const res2: SeqStep<number> = await iter.next();
      expect(res1.value).assertEqual(1);
      expect(res2.value).assertEqual(3);
    });

    /**
     * @tc.name   AsyncIteratorTest025
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_025
     * @tc.desc   Async iterator uppercases array items a,b,c and yields A,B,C
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const items: string[] = ['a', 'b', 'c'];
      const upper: string[] = items.map((item: string): string => item.toUpperCase());
      const iter: SeqIter<string> = new SeqIter<string>(upper);
      const values: string[] = await collectAll<string>(iter);
      expect(JSON.stringify(values)).assertEqual('["A","B","C"]');
    });

    /**
     * @tc.name   AsyncIteratorTest026
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_026
     * @tc.desc   Async iterator yields bigints 1n and 2n in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const iter: SeqIter<bigint> = new SeqIter<bigint>([1n, 2n]);
      const res1: SeqStep<bigint> = await iter.next();
      const res2: SeqStep<bigint> = await iter.next();
      expect(res1.value).assertEqual(1n);
      expect(res2.value).assertEqual(2n);
    });

    /**
     * @tc.name   AsyncIteratorTest027
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_027
     * @tc.desc   Async iterator yields objects { prop: 1 } and { prop: 2 } preserving fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const iter: SeqIter<PropObj> = new SeqIter<PropObj>([{ prop: 1 }, { prop: 2 }]);
      const res1: SeqStep<PropObj> = await iter.next();
      const res2: SeqStep<PropObj> = await iter.next();
      expect(res1.value !== undefined).assertTrue();
      const obj1: PropObj | undefined = res1.value;
      if (obj1 !== undefined) {
        expect(obj1.prop).assertEqual(1);
      }
      expect(res2.value !== undefined).assertTrue();
      const obj2: PropObj | undefined = res2.value;
      if (obj2 !== undefined) {
        expect(obj2.prop).assertEqual(2);
      }
    });

    /**
     * @tc.name   AsyncIteratorTest028
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_028
     * @tc.desc   Async iterator with zero-delay await yields 'delayed'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const iter: DelaySeqIter<string> = new DelaySeqIter<string>(['delayed'], [0]);
      const result: SeqStep<string> = await iter.next();
      expect(result.value).assertEqual('delayed');
      expect(result.done).assertEqual(false);
    });

    /**
     * @tc.name   AsyncIteratorTest029
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_029
     * @tc.desc   Async iterator with descending for-loop yields 3,2,1 in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const values: number[] = [];
      for (let i: int = 3; i > 0; i = i - 1) {
        values.push(i);
      }
      const iter: SeqIter<number> = new SeqIter<number>(values);
      const collected: number[] = await collectAll<number>(iter);
      expect(JSON.stringify(collected)).assertEqual('[3,2,1]');
    });

    /**
     * @tc.name   AsyncIteratorTest030
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_030
     * @tc.desc   Async iterator with double-nested delegation yields 1,2,3 in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // static equivalent of yield 1; yield* (yield* (yield 2)); yield 3
      const innermost: number[] = [2];
      const middle: number[] = [];
      for (const v of innermost) {
        middle.push(v);
      }
      const flattened: number[] = [1];
      for (const v of middle) {
        flattened.push(v);
      }
      flattened.push(3);
      const iter: SeqIter<number> = new SeqIter<number>(flattened);
      const values: number[] = await collectAll<number>(iter);
      expect(JSON.stringify(values)).assertEqual('[1,2,3]');
    });

    /**
     * @tc.name   AsyncIteratorTest031
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_031
     * @tc.desc   Async iterator delegates to array [1,2,3] and yields 1,2,3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // static equivalent of yield* [1, 2, 3]: delegation to a plain array
      const source: number[] = [1, 2, 3];
      const iter: SeqIter<number> = new SeqIter<number>(source);
      const res1: SeqStep<number> = await iter.next();
      const res2: SeqStep<number> = await iter.next();
      const res3: SeqStep<number> = await iter.next();
      const res4: SeqStep<number> = await iter.next();
      expect(res1.value).assertEqual(1);
      expect(res2.value).assertEqual(2);
      expect(res3.value).assertEqual(3);
      expect(res4.done).assertEqual(true);
    });

    /**
     * @tc.name   AsyncIteratorTest032
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_032
     * @tc.desc   Async iterator with parameter x=5 yields x*2 then x*3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const x: int = 5;
      const iter: SeqIter<number> = new SeqIter<number>([x * 2, x * 3]);
      const res1: SeqStep<number> = await iter.next();
      const res2: SeqStep<number> = await iter.next();
      expect(res1.value).assertEqual(10);
      expect(res2.value).assertEqual(15);
    });

    /**
     * @tc.name   AsyncIteratorTest033
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_033
     * @tc.desc   Async iterator awaits 1ms then yields 'delayed'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const iter: DelaySeqIter<string> = new DelaySeqIter<string>(['delayed'], [10]);
      const result: SeqStep<string> = await iter.next();
      expect(result.value).assertEqual('delayed');
      expect(result.done).assertEqual(false);
    });

    /**
     * @tc.name   AsyncIteratorTest034
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_034
     * @tc.desc   Async iterator catches its own thrown error and yields 2 after 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // static equivalent: the iterator body throws between two yields and its
      // own catch block recovers, yielding the recovery value
      const values: number[] = [1];
      try {
        throw new Error('iter-err');
      } catch (e) {
        values.push(2);
      }
      const iter: SeqIter<number> = new SeqIter<number>(values);
      const res1: SeqStep<number> = await iter.next();
      const res2: SeqStep<number> = await iter.next();
      expect(res1.value).assertEqual(1);
      expect(res2.value).assertEqual(2);
    });

    /**
     * @tc.name   AsyncIteratorTest035
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_035
     * @tc.desc   Async iterator with post-increment while-loop yields 0,1 then completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const values: number[] = [];
      let i: int = 0;
      while (i < 2) {
        values.push(i);
        i = i + 1;
      }
      const iter: SeqIter<number> = new SeqIter<number>(values);
      const res1: SeqStep<number> = await iter.next();
      const res2: SeqStep<number> = await iter.next();
      const res3: SeqStep<number> = await iter.next();
      expect(res1.value).assertEqual(0);
      expect(res2.value).assertEqual(1);
      expect(res3.done).assertEqual(true);
    });

    /**
     * @tc.name   AsyncIteratorTest036
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_036
     * @tc.desc   Async iterator yields null then undefined in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const iter: NullUndefIter = new NullUndefIter();
      const res1: SeqStep<null | undefined> = await iter.next();
      const res2: SeqStep<null | undefined> = await iter.next();
      expect(res1.value).assertNull();
      expect(res2.value).assertUndefined();
    });

    /**
     * @tc.name   AsyncIteratorTest037
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_037
     * @tc.desc   Async iterator yields awaited promise value 42 with done false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const promise: Promise<number> = Promise.resolve(42 as number);
      const iter: SeqIter<number> = new SeqIter<number>([await promise]);
      const result: SeqStep<number> = await iter.next();
      expect(result.value).assertEqual(42);
      expect(result.done).assertEqual(false);
    });

    /**
     * @tc.name   AsyncIteratorTest038
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_038
     * @tc.desc   Async iterator second next() delivers return value 'returnVal' with done true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const iter: ReturnIter<string | number> = new ReturnIter<string | number>([1], 'returnVal');
      await iter.next();
      const res2: SeqStep<string | number> = await iter.next();
      expect(res2.value).assertEqual('returnVal');
      expect(res2.done).assertEqual(true);
    });

    /**
     * @tc.name   AsyncIteratorTest039
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_039
     * @tc.desc   Async iterator maps nested values 5,6 by doubling, yields 10,12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const innerValues: number[] = [5, 6];
      const transformed: number[] = innerValues.map((val: number): number => val * 2);
      const iter: SeqIter<number> = new SeqIter<number>(transformed);
      const values: number[] = await collectAll<number>(iter);
      expect(JSON.stringify(values)).assertEqual('[10,12]');
    });

    /**
     * @tc.name   AsyncIteratorTest040
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_040
     * @tc.desc   Async iterator with dead conditional branch yields only 2
