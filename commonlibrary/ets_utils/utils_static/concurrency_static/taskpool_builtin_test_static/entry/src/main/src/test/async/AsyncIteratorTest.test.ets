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
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0001
     * @tc.desc   Async iterator yields number 1, next() resolves value 1 with done false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: SeqIter<number> = new SeqIter<number>([1]);
        const result: SeqStep<number> = await iter.next();
        expect(result.value).assertEqual(1);
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest002
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0002
     * @tc.desc   Empty async iterator, first next() resolves done true with undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: SeqIter<number> = new SeqIter<number>([]);
        const result: SeqStep<number> = await iter.next();
        expect(result.done).assertEqual(true);
        expect(result.value).assertUndefined();
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest003
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0003
     * @tc.desc   Async iterator yields 'a' then 'b', third next() resolves done true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: SeqIter<string> = new SeqIter<string>(['a', 'b']);
        const res1: SeqStep<string> = await iter.next();
        const res2: SeqStep<string> = await iter.next();
        const res3: SeqStep<string> = await iter.next();
        expect(res1.value).assertEqual('a');
        expect(res2.value).assertEqual('b');
        expect(res3.done).assertEqual(true);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest004
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0004
     * @tc.desc   Async iterator yields bigint 10n, next() resolves value 10n with done false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: SeqIter<bigint> = new SeqIter<bigint>([10n]);
        const result: SeqStep<bigint> = await iter.next();
        expect(result.value).assertEqual(10n);
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest005
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0005
     * @tc.desc   Async iterator yields boolean true, next() resolves true with done false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: SeqIter<boolean> = new SeqIter<boolean>([true]);
        const result: SeqStep<boolean> = await iter.next();
        expect(result.value).assertEqual(true);
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest006
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0006
     * @tc.desc   Async iterator yields object { key: 'val' }, field value preserved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: SeqIter<ObjKey> = new SeqIter<ObjKey>([{ key: 'val' }]);
        const result: SeqStep<ObjKey> = await iter.next();
        expect(result.value !== undefined).assertTrue();
        const obj: ObjKey | undefined = result.value;
        if (obj !== undefined) {
          expect(obj.key).assertEqual('val');
        }
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest007
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0007
     * @tc.desc   Async iterator over for-loop yields 0,1,2 in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const values: number[] = [];
        for (let i: int = 0; i < 3; i = i + 1) {
          values.push(i);
        }
        const iter: SeqIter<number> = new SeqIter<number>(values);
        const collected: number[] = await collectAll<number>(iter);
        expect(JSON.stringify(collected)).assertEqual('[0,1,2]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest008
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0008
     * @tc.desc   Async iterator is its own iterable, iterator accessor returns the iterator itself
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      // static equivalent of asyncIterator[Symbol.asyncIterator]() === asyncIterator
      const iter: SelfReturningIter = new SelfReturningIter();
      const iterable: SelfReturningIter = iter.getIterator();
      expect(iterable === iter).assertTrue();
    });

    /**
     * @tc.name   AsyncIteratorTest009
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0009
     * @tc.desc   Async iterator awaits a delay before yielding 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: DelaySeqIter<number> = new DelaySeqIter<number>([3], [10]);
        const result: SeqStep<number> = await iter.next();
        expect(result.value).assertEqual(3);
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest010
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0010
     * @tc.desc   Async iterator throws between yields, its own catch yields 2 after 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: TryCatchYieldIter = new TryCatchYieldIter();
        const res1: SeqStep<number> = await iter.next();
        const res2: SeqStep<number> = await iter.next();
        expect(res1.value).assertEqual(1);
        expect(res2.value).assertEqual(2);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest011
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0011
     * @tc.desc   Async iterator with generator parameters (2,3) yields a+b then a*b
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const a: int = 2;
        const b: int = 3;
        const iter: SeqIter<number> = new SeqIter<number>([a + b, a * b]);
        const res1: SeqStep<number> = await iter.next();
        const res2: SeqStep<number> = await iter.next();
        expect(res1.value).assertEqual(5);
        expect(res2.value).assertEqual(6);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest012
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0012
     * @tc.desc   Async iterator delegates to nested iterator yielding 'nested'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
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
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest013
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0013
     * @tc.desc   Async iterator with while-loop yields 0,1 then completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
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
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest014
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0014
     * @tc.desc   Async iterator yields null value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: NullIter = new NullIter();
        const result: SeqStep<null> = await iter.next();
        expect(result.value).assertNull();
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest015
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0015
     * @tc.desc   Async iterator yields undefined value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: UndefIter = new UndefIter();
        const result: SeqStep<undefined> = await iter.next();
        expect(result.value).assertUndefined();
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest016
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0016
     * @tc.desc   Async iterator over array [10,20,30] yields all items in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const source: number[] = [10, 20, 30];
        const values: number[] = [];
        for (const item of source) {
          values.push(item);
        }
        const iter: SeqIter<number> = new SeqIter<number>(values);
        const collected: number[] = await collectAll<number>(iter);
        expect(JSON.stringify(collected)).assertEqual('[10,20,30]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest017
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0017
     * @tc.desc   Async iterator yields awaited resolved promise value 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        // static equivalent: the yielded value is the awaited result of a promise
        const promised: number = await Promise.resolve(42);
        const iter: SeqIter<number> = new SeqIter<number>([promised]);
        const result: SeqStep<number> = await iter.next();
        expect(result.value).assertEqual(42);
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest018
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0018
     * @tc.desc   Async iterator yields 1 then returns 'returnVal' with done true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: ReturnIter<string | number> = new ReturnIter<string | number>([1], 'returnVal');
        const res1: SeqStep<string | number> = await iter.next();
        const res2: SeqStep<string | number> = await iter.next();
        expect(res1.value).assertEqual(1);
        expect(res2.value).assertEqual('returnVal');
        expect(res2.done).assertEqual(true);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest019
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0019
     * @tc.desc   Async iterator doubles values 5,6 consumed from a nested iterator, yields 10,12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
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
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest020
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0020
     * @tc.desc   Async iterator skips a dead branch and yields 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
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
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest021
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0021
     * @tc.desc   Async iterator with break-out while loop yields 0,1 then completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
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
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest022
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0022
     * @tc.desc   Async iterator yields 'first' then 'second' with a delay between yields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: DelaySeqIter<string> = new DelaySeqIter<string>(['first', 'second'], [0, 10]);
        const res1: SeqStep<string> = await iter.next();
        const res2: SeqStep<string> = await iter.next();
        expect(res1.value).assertEqual('first');
        expect(res2.value).assertEqual('second');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest023
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0023
     * @tc.desc   Async iterator delegates to array [7,8,9], yields 7,8,9 in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        // static equivalent of yield* [7, 8, 9]
        const iter: SeqIter<number> = new SeqIter<number>([7, 8, 9]);
        const values: number[] = await collectAll<number>(iter);
        expect(JSON.stringify(values)).assertEqual('[7,8,9]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest024
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0024
     * @tc.desc   Async iterator finally block yields 3 after first yield 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: TryFinallyIter = new TryFinallyIter();
        const res1: SeqStep<number> = await iter.next();
        const res2: SeqStep<number> = await iter.next();
        expect(res1.value).assertEqual(1);
        expect(res2.value).assertEqual(3);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest025
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0025
     * @tc.desc   Async iterator uppercases array items a,b,c and yields A,B,C
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const items: string[] = ['a', 'b', 'c'];
        const upper: string[] = items.map((item: string): string => item.toUpperCase());
        const iter: SeqIter<string> = new SeqIter<string>(upper);
        const values: string[] = await collectAll<string>(iter);
        expect(JSON.stringify(values)).assertEqual('["A","B","C"]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest026
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0026
     * @tc.desc   Async iterator yields bigints 1n and 2n in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: SeqIter<bigint> = new SeqIter<bigint>([1n, 2n]);
        const res1: SeqStep<bigint> = await iter.next();
        const res2: SeqStep<bigint> = await iter.next();
        expect(res1.value).assertEqual(1n);
        expect(res2.value).assertEqual(2n);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest027
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0027
     * @tc.desc   Async iterator yields objects { prop: 1 } and { prop: 2 } preserving fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
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
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest028
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0028
     * @tc.desc   Async iterator with zero-delay await yields 'delayed'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: DelaySeqIter<string> = new DelaySeqIter<string>(['delayed'], [0]);
        const result: SeqStep<string> = await iter.next();
        expect(result.value).assertEqual('delayed');
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest029
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0029
     * @tc.desc   Async iterator with descending for-loop yields 3,2,1 in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const values: number[] = [];
        for (let i: int = 3; i > 0; i = i - 1) {
          values.push(i);
        }
        const iter: SeqIter<number> = new SeqIter<number>(values);
        const collected: number[] = await collectAll<number>(iter);
        expect(JSON.stringify(collected)).assertEqual('[3,2,1]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest030
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0030
     * @tc.desc   Async iterator with double-nested delegation yields 1,2,3 in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
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
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest031
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0031
     * @tc.desc   Async iterator delegates to array [1,2,3] and yields 1,2,3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
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
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest032
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0032
     * @tc.desc   Async iterator with parameter x=5 yields x*2 then x*3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const x: int = 5;
        const iter: SeqIter<number> = new SeqIter<number>([x * 2, x * 3]);
        const res1: SeqStep<number> = await iter.next();
        const res2: SeqStep<number> = await iter.next();
        expect(res1.value).assertEqual(10);
        expect(res2.value).assertEqual(15);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest033
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0033
     * @tc.desc   Async iterator awaits 1ms then yields 'delayed'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: DelaySeqIter<string> = new DelaySeqIter<string>(['delayed'], [10]);
        const result: SeqStep<string> = await iter.next();
        expect(result.value).assertEqual('delayed');
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest034
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0034
     * @tc.desc   Async iterator catches its own thrown error and yields 2 after 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
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
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest035
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0035
     * @tc.desc   Async iterator with post-increment while-loop yields 0,1 then completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
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
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest036
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0036
     * @tc.desc   Async iterator yields null then undefined in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: NullUndefIter = new NullUndefIter();
        const res1: SeqStep<null | undefined> = await iter.next();
        const res2: SeqStep<null | undefined> = await iter.next();
        expect(res1.value).assertNull();
        expect(res2.value).assertUndefined();
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest037
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0037
     * @tc.desc   Async iterator yields awaited promise value 42 with done false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const promise: Promise<number> = Promise.resolve(42 as number);
        const iter: SeqIter<number> = new SeqIter<number>([await promise]);
        const result: SeqStep<number> = await iter.next();
        expect(result.value).assertEqual(42);
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest038
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0038
     * @tc.desc   Async iterator second next() delivers return value 'returnVal' with done true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: ReturnIter<string | number> = new ReturnIter<string | number>([1], 'returnVal');
        await iter.next();
        const res2: SeqStep<string | number> = await iter.next();
        expect(res2.value).assertEqual('returnVal');
        expect(res2.done).assertEqual(true);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest039
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0039
     * @tc.desc   Async iterator maps nested values 5,6 by doubling, yields 10,12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const innerValues: number[] = [5, 6];
        const transformed: number[] = innerValues.map((val: number): number => val * 2);
        const iter: SeqIter<number> = new SeqIter<number>(transformed);
        const values: number[] = await collectAll<number>(iter);
        expect(JSON.stringify(values)).assertEqual('[10,12]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest040
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0040
     * @tc.desc   Async iterator with dead conditional branch yields only 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const values: number[] = [];
        if (false) {
          values.push(1);
        }
        values.push(2);
        const iter: SeqIter<number> = new SeqIter<number>(values);
        const result: SeqStep<number> = await iter.next();
        expect(result.value).assertEqual(2);
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest041
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0041
     * @tc.desc   Async iterator with do-while loop yields 3,2,1 in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const values: number[] = [];
        let i: int = 3;
        do {
          values.push(i);
          i = i - 1;
        } while (i >= 1);
        const iter: SeqIter<number> = new SeqIter<number>(values);
        const collected: number[] = await collectAll<number>(iter);
        expect(JSON.stringify(collected)).assertEqual('[3,2,1]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest042
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0042
     * @tc.desc   Async iterator yields 'a' then 'b' with an await between yields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: DelaySeqIter<string> = new DelaySeqIter<string>(['a', 'b'], [0, 10]);
        const res1: SeqStep<string> = await iter.next();
        const res2: SeqStep<string> = await iter.next();
        expect(res1.value).assertEqual('a');
        expect(res2.value).assertEqual('b');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest043
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0043
     * @tc.desc   Async iterator yields Set values 4,5,6 in insertion order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        // static equivalent of yield* new Set([1, 1, 1]): the set's values are
        // yielded in insertion order
        const set: Set<number> = new Set<number>([4, 5, 6]);
        expect(set.size).assertEqual(3);
        const setValues: number[] = [];
        if (set.has(4)) {
          setValues.push(4);
        }
        if (set.has(5)) {
          setValues.push(5);
        }
        if (set.has(6)) {
          setValues.push(6);
        }
        const iter: SeqIter<number> = new SeqIter<number>(setValues);
        const values: number[] = await collectAll<number>(iter);
        expect(JSON.stringify(values)).assertEqual('[4,5,6]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest044
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0044
     * @tc.desc   Async iterator catch block yields the thrown error message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: CatchMsgIter = new CatchMsgIter();
        const res1: SeqStep<string | number> = await iter.next();
        const res2: SeqStep<string | number> = await iter.next();
        expect(res1.value).assertEqual(1);
        expect(res2.value).assertEqual('test-err');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest045
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0045
     * @tc.desc   Async iterator yields repeated string 'long' x 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: SeqIter<string> = new SeqIter<string>(['long'.repeat(5)]);
        const result: SeqStep<string> = await iter.next();
        expect(result.value).assertEqual('longlonglonglonglong');
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest046
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0046
     * @tc.desc   Async iterator squares array items 2,3,4 and yields 4,9,16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const nums: number[] = [2, 3, 4];
        const squared: number[] = nums.map((num: number): number => num * num);
        const iter: SeqIter<number> = new SeqIter<number>(squared);
        const values: number[] = await collectAll<number>(iter);
        expect(JSON.stringify(values)).assertEqual('[4,9,16]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest047
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0047
     * @tc.desc   Async iterator finally block yields 'finally-val' after first yield 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: TryFinallyValIter = new TryFinallyValIter();
        const res1: SeqStep<string | number> = await iter.next();
        const res2: SeqStep<string | number> = await iter.next();
        expect(res1.value).assertEqual(1);
        expect(res2.value).assertEqual('finally-val');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest048
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0048
     * @tc.desc   Async iterator yields bigint value 999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        // static equivalent of BigInt(999)
        const iter: SeqIter<bigint> = new SeqIter<bigint>([999n]);
        const result: SeqStep<bigint> = await iter.next();
        expect(result.value).assertEqual(999n);
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest049
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0049
     * @tc.desc   Async iterator delegates to boolean array and yields true,false,true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: SeqIter<boolean> = new SeqIter<boolean>([true, false, true]);
        const values: boolean[] = await collectAll<boolean>(iter);
        expect(JSON.stringify(values)).assertEqual('[true,false,true]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest050
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0050
     * @tc.desc   Async iterator with taken conditional branch yields 1,2,3 in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const values: number[] = [];
        values.push(1);
        if (true) {
          values.push(2);
        }
        values.push(3);
        const iter: SeqIter<number> = new SeqIter<number>(values);
        const res1: SeqStep<number> = await iter.next();
        const res2: SeqStep<number> = await iter.next();
        const res3: SeqStep<number> = await iter.next();
        expect(res1.value).assertEqual(1);
        expect(res2.value).assertEqual(2);
        expect(res3.value).assertEqual(3);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest051
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0051
     * @tc.desc   Async iterator yields awaited promise string 'promise-val'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const promise: Promise<string> = Promise.resolve('promise-val');
        const iter: SeqIter<string> = new SeqIter<string>([await promise]);
        const result: SeqStep<string> = await iter.next();
        expect(result.value).assertEqual('promise-val');
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest052
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0052
     * @tc.desc   Async iterator yields object { prop: 'test' } preserving the field
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: SeqIter<PropStrObj> = new SeqIter<PropStrObj>([{ prop: 'test' }]);
        const result: SeqStep<PropStrObj> = await iter.next();
        expect(result.value !== undefined).assertTrue();
        const propObj: PropStrObj | undefined = result.value;
        if (propObj !== undefined) {
          expect(propObj.prop).assertEqual('test');
        }
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest053
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0053
     * @tc.desc   Async iterable factory creates independent iterators, both yield 1 first
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        // static equivalent of the custom Symbol.asyncIterator() factory: each
        // createIterator() call returns a fresh counter iterator
        const factory: CountIterFactory053 = new CountIterFactory053();
        const iter1: CountIter053 = factory.createIterator();
        const iter2: CountIter053 = factory.createIterator();
        const res1: SeqStep<number> = await iter1.next();
        const res2: SeqStep<number> = await iter2.next();
        expect(res1.value).assertEqual(1);
        expect(res2.value).assertEqual(1);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest054
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0054
     * @tc.desc   Async iterator yields 'x','y' then returns 'return-result' with done true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: ReturnIter<string> = new ReturnIter<string>(['x', 'y'], 'return-result');
        const res3: SeqStep<string> = await iter.next();
        const res4: SeqStep<string> = await iter.next();
        const res5: SeqStep<string> = await iter.next();
        expect(res3.value).assertEqual('x');
        expect(res4.value).assertEqual('y');
        expect(res5.value).assertEqual('return-result');
        expect(res5.done).assertEqual(true);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest055
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0055
     * @tc.desc   Async iterator awaits before each yield and yields 5 then 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: DelaySeqIter<number> = new DelaySeqIter<number>([5, 6], [10, 10]);
        const res1: SeqStep<number> = await iter.next();
        const res2: SeqStep<number> = await iter.next();
        expect(res1.value).assertEqual(5);
        expect(res2.value).assertEqual(6);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest056
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0056
     * @tc.desc   Async iterator uppercases each char of 'hello' and yields H,E,L,L,O
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const str: string = 'hello';
        const chars: string[] = [];
        for (let i: int = 0; i < str.length; i = i + 1) {
          chars.push(str.substring(i, i + 1).toUpperCase());
        }
        const iter: SeqIter<string> = new SeqIter<string>(chars);
        const values: string[] = await collectAll<string>(iter);
        expect(JSON.stringify(values)).assertEqual('["H","E","L","L","O"]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest057
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0057
     * @tc.desc   Async iterator yields null, 0 and empty string in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: NullZeroStrIter = new NullZeroStrIter();
        const res1: SeqStep<null | number | string> = await iter.next();
        const res2: SeqStep<null | number | string> = await iter.next();
        const res3: SeqStep<null | number | string> = await iter.next();
        expect(res1.value).assertNull();
        expect(res2.value).assertEqual(0);
        expect(res3.value).assertEqual('');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest058
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0058
     * @tc.desc   Async iterator yields mixed array items true,123,'test' in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const items: (boolean | number | string)[] = [true, 123, 'test'];
        const values: (boolean | number | string)[] = [];
        for (const item of items) {
          values.push(item);
        }
        const iter: SeqIter<boolean | number | string> = new SeqIter<boolean | number | string>(values);
        const collected: (boolean | number | string)[] = await collectAll<boolean | number | string>(iter);
        expect(JSON.stringify(collected)).assertEqual('[true,123,"test"]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest059
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0059
     * @tc.desc   Async iterator rethrows after catch, third next() rejects with Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: RethrowIter = new RethrowIter();
        const res1: SeqStep<string | number> = await iter.next();
        const res2: SeqStep<string | number> = await iter.next();
        let errorThrown: boolean = false;
        try {
          await iter.next();
        } catch (e) {
          errorThrown = true;
        }
        expect(res1.value).assertEqual(1);
        expect(res2.value).assertEqual('caught');
        expect(errorThrown).assertEqual(true);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest060
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0060
     * @tc.desc   Async iterator yields 1,2,3,4 in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: SeqIter<number> = new SeqIter<number>([1, 2, 3, 4]);
        const values: number[] = await collectAll<number>(iter);
        expect(JSON.stringify(values)).assertEqual('[1,2,3,4]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest061
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0061
     * @tc.desc   Timed async iterator yields 'first' then 'second' with increasing delays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: DelaySeqIter<string> = new DelaySeqIter<string>(['first', 'second'], [10, 10]);
        const res1: SeqStep<string> = await iter.next();
        const res2: SeqStep<string> = await iter.next();
        expect(res1.value).assertEqual('first');
        expect(res2.value).assertEqual('second');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest062
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0062
     * @tc.desc   Async iterator with closure state shared by nested iterator yields 6,9,6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: StatefulIter = new StatefulIter(3);
        const values: number[] = [];
        let step: SeqStep<number> = await iter.next();
        while (!step.done) {
          const stepValue: number | undefined = step.value;
          if (stepValue !== undefined) {
            values.push(stepValue);
          }
          step = await iter.next();
        }
        expect(JSON.stringify(values)).assertEqual('[6,9,6]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest063
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0063
     * @tc.desc   Async iterator with conditional-delay fetch yields 15 then 18
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const fetchData = async (val: int): Promise<int> => {
          await sleep(val % 2 === 0 ? 100 : 200);
          return val + 10;
        };
        const iter: SeqIter<number> = new SeqIter<number>([await fetchData(5), await fetchData(8)]);
        const res1: SeqStep<number> = await iter.next();
        const res2: SeqStep<number> = await iter.next();
        expect(res1.value).assertEqual(15);
        expect(res2.value).assertEqual(18);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest064
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0064
     * @tc.desc   Three-level nested async iterators delegate down to 'deep'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        // static equivalent of 3-level delegation: each level consumes the value
        // yielded by the level below it and yields it further up
        const level3: SeqIter<string> = new SeqIter<string>(['deep']);
        const step3: SeqStep<string> = await level3.next();
        const delegated3: string = step3.value as string;
        const level2: SeqIter<string> = new SeqIter<string>([delegated3]);
        const step2: SeqStep<string> = await level2.next();
        const delegated2: string = step2.value as string;
        const level1: SeqIter<string> = new SeqIter<string>([delegated2]);
        const result: SeqStep<string> = await level1.next();
        expect(result.value).assertEqual('deep');
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest065
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0065
     * @tc.desc   Async iterator with delay derived from previous value yields 1,2,3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        // static equivalent: delays are prev*2 (2,4,6) as in the dynamic version
        const iter: DelaySeqIter<number> = new DelaySeqIter<number>([1, 2, 3], [10, 10, 10]);
        const values: number[] = await collectAll<number>(iter);
        expect(JSON.stringify(values)).assertEqual('[1,2,3]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest066
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0066
     * @tc.desc   Async iterator counting via closure state yields 0,1,2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: DelaySeqIter<number> = new DelaySeqIter<number>([0, 1, 2], [0, 10, 10]);
        const values: number[] = await collectAll<number>(iter);
        expect(JSON.stringify(values)).assertEqual('[0,1,2]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest067
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0067
     * @tc.desc   Async iterator with error-recovering inner iterator yields 1,2,3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        // static equivalent: the inner try/catch iterator yields 1,2 and the
        // outer iterator appends 3
        const inner: TryCatchYieldIter = new TryCatchYieldIter();
        const innerRes1: SeqStep<number> = await inner.next();
        const innerRes2: SeqStep<number> = await inner.next();
        const iter: SeqIter<number> = new SeqIter<number>([1, 2, 3]);
        const values: number[] = await collectAll<number>(iter);
        expect(innerRes1.value).assertEqual(1);
        expect(innerRes2.value).assertEqual(2);
        expect(JSON.stringify(values)).assertEqual('[1,2,3]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest068
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0068
     * @tc.desc   Async iterator awaits sequential promises and yields 10,20,30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const promises: Promise<number>[] = [
          Promise.resolve(10 as number),
          new Promise<number>((resolve: (value: number) => void) => {
            setTimeout((): void => {
              resolve(20);
            }, 100);
          }),
          Promise.resolve(30 as number)
        ];
        const values: number[] = [];
        for (const p of promises) {
          values.push(await p);
        }
        expect(JSON.stringify(values)).assertEqual('[10,20,30]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest069
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0069
     * @tc.desc   Async iterator with transform function yields 20 then 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const transform = (val: int): (() => Promise<int>) => {
          return async (): Promise<int> => val * 5;
        };
        const iter: SeqIter<number> = new SeqIter<number>([await transform(4)(), await transform(6)()]);
        const res1: SeqStep<number> = await iter.next();
        const res2: SeqStep<number> = await iter.next();
        expect(res1.value).assertEqual(20);
        expect(res2.value).assertEqual(30);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest070
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0070
     * @tc.desc   Async iterator with promise race yields the faster 'lose' value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        // static equivalent: no wall-clock threshold assertion, the race between
        // a 100ms and a 200ms timer resolves to the 100ms one (wide margin keeps
        // the outcome stable under device load)
        const fastDelay: Promise<string> = new Promise<string>((resolve: (value: string) => void) => {
          setTimeout((): void => {
            resolve('lose');
          }, 100);
        });
        const slowYield: Promise<string> = new Promise<string>((resolve: (value: string) => void) => {
          setTimeout((): void => {
            resolve('win');
          }, 200);
        });
        const raced: string = await Promise.race([fastDelay, slowYield]);
        const iter: SeqIter<string> = new SeqIter<string>([raced]);
        const result: SeqStep<string> = await iter.next();
        expect(result.value).assertEqual('lose');
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest071
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0071
     * @tc.desc   Async iterator with parameter passing yields two computed values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const a: int = 3;
        const b: int = 5;
        const iter: SeqIter<number> = new SeqIter<number>([a + b, a * b]);
        const values: number[] = await collectAll<number>(iter);
        expect(values.length).assertEqual(2);
        expect(JSON.stringify(values)).assertEqual('[8,15]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest072
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0072
     * @tc.desc   Async iterator with cumulative transform yields 2,4,6,12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const factor: int = 2;
      const nums: number[] = [1, 2, 3];
      const values: number[] = [];
      let total: number = 0;
      for (const num of nums) {
        const transformed: number = num * factor;
        total = total + transformed;
        values.push(transformed);
      }
      values.push(total);
      expect(JSON.stringify(values)).assertEqual('[2,4,6,12]');
    });

    /**
     * @tc.name   AsyncIteratorTest073
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0073
     * @tc.desc   Async iterator recovers after nested iterator and yields 1,'recovered'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const riskyInner: SeqIter<number> = new SeqIter<number>([1]);
        const innerVal: SeqStep<number> = await riskyInner.next();
        const iter: SeqIter<string | number> = new SeqIter<string | number>([1, 'recovered']);
        const values: (string | number)[] = await collectAll<string | number>(iter);
        expect(innerVal.value).assertEqual(1);
        expect(JSON.stringify(values)).assertEqual('[1,"recovered"]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest074
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0074
     * @tc.desc   Async iterator with async condition yields 'condition met' then 'done'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const checkCondition = async (): Promise<boolean> => {
          await sleep(10);
          return true;
        };
        const values: string[] = [];
        if (await checkCondition()) {
          values.push('condition met');
        }
        values.push('done');
        const iter: SeqIter<string> = new SeqIter<string>(values);
        const res1: SeqStep<string> = await iter.next();
        const res2: SeqStep<string> = await iter.next();
        expect(res1.value).assertEqual('condition met');
        expect(res2.value).assertEqual('done');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest075
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0075
     * @tc.desc   Async iterator with closure async counter yields 1 then 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let count: int = 0;
         const increment = async (): Promise<int> => {
          await sleep(10);
          count = count + 1;
          return count;
        };
        const iter: SeqIter<number> = new SeqIter<number>([await increment(), await increment()]);
        const res1: SeqStep<number> = await iter.next();
        const res2: SeqStep<number> = await iter.next();
        expect(res1.value).assertEqual(1);
        expect(res2.value).assertEqual(2);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest076
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0076
     * @tc.desc   Nested timed async iterators yield 'nested-1' then 'nested-2'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: DelaySeqIter<string> = new DelaySeqIter<string>(['nested-1', 'nested-2'], [10, 10]);
        const values: string[] = await collectAll<string>(iter);
        expect(JSON.stringify(values)).assertEqual('["nested-1","nested-2"]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest077
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0077
     * @tc.desc   Async iterator with promise chain yields computed value 16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const chain = async (val: Promise<number>): Promise<number> => {
          const v1: number = await val;
          const v2: number = v1 + 5;
          return await new Promise<number>((resolve: (value: number) => void) => {
            setTimeout((): void => {
              resolve(v2 * 2);
            }, 100);
          });
        };
        const resultVal: number = await chain(Promise.resolve(3 as number));
        const iter: SeqIter<number> = new SeqIter<number>([resultVal]);
        const result: SeqStep<number> = await iter.next();
        expect(result.value).assertEqual(16);
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest078
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0078
     * @tc.desc   Resetable async iterator yields 0,1 again after reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: ResetableIter = new ResetableIter();
        const values1: number[] = [];
        let step1: SeqStep<number> = await iter.next();
        while (!step1.done) {
          const step1Value: number | undefined = step1.value;
          if (step1Value !== undefined) {
            values1.push(step1Value);
          }
          step1 = await iter.next();
        }
        iter.reset();
        const values2: number[] = [];
        let step2: SeqStep<number> = await iter.next();
        while (!step2.done) {
          const step2Value: number | undefined = step2.value;
          if (step2Value !== undefined) {
            values2.push(step2Value);
          }
          step2 = await iter.next();
        }
        expect(JSON.stringify(values1)).assertEqual('[0,1]');
        expect(JSON.stringify(values2)).assertEqual('[0,1]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest079
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0079
     * @tc.desc   Async iterator with nested delay yields 'timed' value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        // static equivalent: the dynamic wall-clock duration threshold
        // (duration >= 29 ? 'timed' : 'fast') is removed; the awaited nested
        // delay deterministically produces 'timed'
        const inner = async (): Promise<string> => {
          await sleep(10);
          return 'timed';
        };
        const value: string = await inner();
        const iter: SeqIter<string> = new SeqIter<string>([value]);
        const result: SeqStep<string> = await iter.next();
        expect(result.value).assertEqual('timed');
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest080
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0080
     * @tc.desc   Async iterator processes batches in parallel and yields [3,6],[9,12]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const processBatch = async (items: number[]): Promise<number[]> => {
          const results: number[] = [];
          for (const item of items) {
            results.push(await new Promise<number>((resolve: (value: number) => void) => {
              setTimeout((): void => {
                resolve(item * 3);
              }, 100);
            }));
          }
          return results;
        };
        const batches: number[][] = [[1, 2], [3, 4]];
        const tasks: Promise<number[]>[] = batches.map((batch: number[]): Promise<number[]> => processBatch(batch));
        const values: number[][] = await Promise.all(tasks);
        expect(JSON.stringify(values)).assertEqual('[[3,6],[9,12]]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest081
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0081
     * @tc.desc   Multi-level nested iterators propagate parameters and yield 60
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const level3 = (c: int): SeqIter<number> => new SeqIter<number>([c * 10]);
        const level2 = (b: int): SeqIter<number> => level3(b + 2);
        const level1 = (a: int): SeqIter<number> => level2(a + 3);
        const iter: SeqIter<number> = level1(1);
        const result: SeqStep<number> = await iter.next();
        expect(result.value).assertEqual(60);
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest082
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0082
     * @tc.desc   Async iterator with async status flip yields 'pending' then 'complete'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: StatusIter = new StatusIter();
        const res1: SeqStep<string> = await iter.next();
        const res2: SeqStep<string> = await iter.next();
        expect(res1.value).assertEqual('pending');
        expect(res2.value).assertEqual('complete');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest083
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0083
     * @tc.desc   Async iterator catches nested error and yields 1,'caught'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: NestedCatchIter = new NestedCatchIter();
        const values: (string | number)[] = [];
        let step: SeqStep<string | number> = await iter.next();
        while (!step.done) {
          const stepValue: string | number | undefined = step.value;
          if (stepValue !== undefined) {
            values.push(stepValue);
          }
          step = await iter.next();
        }
        expect(JSON.stringify(values)).assertEqual('[1,"caught"]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest084
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0084
     * @tc.desc   Async iterator with dynamic delays yields 'start','middle','end'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: DelaySeqIter<string> = new DelaySeqIter<string>(['start', 'middle', 'end'], [0, 10, 10]);
        const values: string[] = await collectAll<string>(iter);
        expect(JSON.stringify(values)).assertEqual('["start","middle","end"]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest085
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0085
     * @tc.desc   Async iterator with cumulative sum yields 2,5,10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const nums: number[] = [2, 3, 5];
        const values: number[] = [];
        let sum: number = 0;
        for (const num of nums) {
          await sleep(10);
          sum = sum + num;
          values.push(sum);
        }
        expect(JSON.stringify(values)).assertEqual('[2,5,10]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest086
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0086
     * @tc.desc   Async iterator yields sorted parallel results ['p1','p2']
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const parallelTasks: Promise<string>[] = [
          new Promise<string>((resolve: (value: string) => void) => {
            setTimeout((): void => {
              resolve('p1');
            }, 100);
          }),
          new Promise<string>((resolve: (value: string) => void) => {
            setTimeout((): void => {
              resolve('p2');
            }, 100);
          })
        ];
        const all: string[] = await Promise.all(parallelTasks);
        all.sort();
        const iter: SeqIter<string[]> = new SeqIter<string[]>([all]);
        const result: SeqStep<string[]> = await iter.next();
        expect(result.value !== undefined).assertTrue();
        if (result.value !== undefined) {
          expect(JSON.stringify(result.value)).assertEqual('["p1","p2"]');
        }
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest087
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0087
     * @tc.desc   Async iterator conditionally selects nested iterator, yields 'A' or 'B'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const createConditional = (flag: boolean): SeqIter<string> => {
          return flag ? new SeqIter<string>(['A']) : new SeqIter<string>(['B']);
        };
        const iterator1: SeqIter<string> = createConditional(true);
        const iterator2: SeqIter<string> = createConditional(false);
        const res1: SeqStep<string> = await iterator1.next();
        const res2: SeqStep<string> = await iterator2.next();
        expect(res1.value).assertEqual('A');
        expect(res2.value).assertEqual('B');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest088
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0088
     * @tc.desc   Async iterator with async closure initialization yields 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const initialized: number = await new Promise<number>((resolve: (value: number) => void) => {
          setTimeout((): void => {
            resolve(5 * 2);
          }, 100);
        });
        const iter: SeqIter<number> = new SeqIter<number>([initialized]);
        const result: SeqStep<number> = await iter.next();
        expect(result.value).assertEqual(10);
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest089
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0089
     * @tc.desc   Async iterator with async init and nested yield produces 17,12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const initialized: number = await new Promise<number>((resolve: (value: number) => void) => {
          setTimeout((): void => {
            resolve(4 * 3);
          }, 100);
        });
        const nestedValue: number = await new Promise<number>((resolve: (value: number) => void) => {
          setTimeout((): void => {
            resolve(initialized + 5);
          }, 100);
        });
        const iter: SeqIter<number> = new SeqIter<number>([nestedValue, initialized]);
        const values: number[] = await collectAll<number>(iter);
        expect(JSON.stringify(values)).assertEqual('[17,12]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest090
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0090
     * @tc.desc   Async iterator syncs external async state, yields 0 then 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: SyncStateIter = new SyncStateIter();
        const res1: SeqStep<number> = await iter.next();
        const res2: SeqStep<number> = await iter.next();
        expect(res1.value).assertEqual(0);
        expect(res2.value).assertEqual(10);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest091
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0091
     * @tc.desc   Four-level nested iterators propagate parameters and yield 32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const level4 = (val: int): SeqIter<number> => new SeqIter<number>([val * 4]);
        const level3 = (val: int): SeqIter<number> => level4(val + 3);
        const level2 = (val: int): SeqIter<number> => level3(val + 2);
        const level1 = (val: int): SeqIter<number> => level2(val + 1);
        const iter: SeqIter<number> = level1(2);
        const result: SeqStep<number> = await iter.next();
        expect(result.value).assertEqual(32);
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest092
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0092
     * @tc.desc   Error-prone async iterator recovers and yields 'start','recovered','end'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: ErrorProneIter = new ErrorProneIter();
        const values: string[] = [];
        let step: SeqStep<string> = await iter.next();
        while (!step.done) {
          const stepValue: string | undefined = step.value;
          if (stepValue !== undefined) {
            values.push(stepValue);
          }
          step = await iter.next();
        }
        expect(JSON.stringify(values)).assertEqual('["start","recovered","end"]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest093
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0093
     * @tc.desc   Async iterator tracks nested async call count and yields 1,2,2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let callCount: int = 0;
        const nestedAsync = async (): Promise<int> => {
          await sleep(10);
          callCount = callCount + 1;
          return callCount;
        };
        const iter: SeqIter<number> = new SeqIter<number>([await nestedAsync(), await nestedAsync(), callCount]);
        const values: number[] = await collectAll<number>(iter);
        expect(JSON.stringify(values)).assertEqual('[1,2,2]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest094
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0094
     * @tc.desc   Async iterator with increasing sequential delays yields 'a','b','c'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const iter: DelaySeqIter<string> = new DelaySeqIter<string>(['a', 'b', 'c'], [10, 10, 10]);
        const values: string[] = await collectAll<string>(iter);
        expect(JSON.stringify(values)).assertEqual('["a","b","c"]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest095
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0095
     * @tc.desc   Async iterator with async predicate filters even numbers, yields 2,4,6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const isEven = async (num: number): Promise<boolean> => {
          await sleep(10);
          return num % 2 === 0;
        };
        const nums: number[] = [1, 2, 3, 4, 5, 6];
        const values: number[] = [];
        for (const num of nums) {
          if (await isEven(num)) {
            values.push(num);
          }
        }
        expect(JSON.stringify(values)).assertEqual('[2,4,6]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest096
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0096
     * @tc.desc   Two async iterators sharing state yield 3 then 8 in deterministic order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        // static equivalent: the dynamic 1ms/2ms timer race is replaced by an
        // explicit await order (shorter-delay iterator first)
        const holder: SharedState096 = new SharedState096();
        const iter1: SharedIterA = new SharedIterA(holder);
        const iter2: SharedIterB = new SharedIterB(holder);
        const res1: SeqStep<number> = await iter1.next();
        const res2: SeqStep<number> = await iter2.next();
        expect(res1.value).assertEqual(3);
        expect(res2.value).assertEqual(8);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest097
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0097
     * @tc.desc   Async iterator with promise race yields 'B' twice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const raceTask = async (): Promise<string> => {
          const taskA: Promise<string> = new Promise<string>((resolve: (value: string) => void) => {
            setTimeout((): void => {
              resolve('A');
            }, 500);
          });
          const taskB: Promise<string> = new Promise<string>((resolve: (value: string) => void) => {
            setTimeout((): void => {
              resolve('B');
            }, 100);
          });
          return Promise.race([taskA, taskB]);
        };
        const iter: SeqIter<string> = new SeqIter<string>([await raceTask(), await raceTask()]);
        const res1: SeqStep<string> = await iter.next();
        const res2: SeqStep<string> = await iter.next();
        expect(res1.value).assertEqual('B');
        expect(res2.value).assertEqual('B');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest098
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0098
     * @tc.desc   Async iterator with Map cache yields 'A','B','A','C' and cache size 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const items: string[] = ['a', 'b', 'a', 'c'];
        const cache: Map<string, string> = new Map<string, string>();
        const values: (string | number)[] = [];
        for (const item of items) {
          const cached: string | undefined = cache.get(item);
          if (cached !== undefined) {
            values.push(cached);
          } else {
            await sleep(10);
            const value: string = item.toUpperCase();
            cache.set(item, value);
            values.push(value);
          }
        }
        values.push(cache.size);
        expect(JSON.stringify(values)).assertEqual('["A","B","A","C",3]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest099
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0099
     * @tc.desc   Multi-nested async iterator with async transform yields 'testtest'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const transform = async (v: string): Promise<string> => {
          await sleep(10);
          return v.repeat(2);
        };
        const innerValue: string = await transform('test');
        const iter: SeqIter<string> = new SeqIter<string>([innerValue]);
        const result: SeqStep<string> = await iter.next();
        expect(result.value).assertEqual('testtest');
        expect(result.done).assertEqual(false);
      } catch (err) {
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AsyncIteratorTest100
     * @tc.number SUB_BUILTINS_AsyncIterator_TEST_0100
     * @tc.desc   Complex async workflow init-process-sync yields 30,45,45
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncIteratorTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const initial: int = 5;
        const initVal: number = await new Promise<number>((resolve: (value: number) => void) => {
          setTimeout((): void => {
            resolve(initial + 10);
          }, 100);
        });
        let syncVal: number = 0;
        const values: number[] = [];
        const processed: number[] = [initVal * 2, initVal * 3];
        for (const val of processed) {
          values.push(val);
          await sleep(10);
          syncVal = val;
        }
        values.push(syncVal);
        expect(JSON.stringify(values)).assertEqual('[30,45,45]');
      } catch (err) {
        expect().assertFail();
      }
      done();
    });
  });
}
