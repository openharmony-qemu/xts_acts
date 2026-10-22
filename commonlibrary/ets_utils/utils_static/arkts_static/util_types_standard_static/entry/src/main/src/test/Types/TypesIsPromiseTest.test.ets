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

class PromisePayload {
  code: int = 7;
  name: string = 'payload';
}

class PromiseFieldHolder {
  single: Promise<int> = Promise.resolve<int>(7);
  payload: Object = Promise.resolve<PromisePayload>(new PromisePayload());
  nested: Object = Promise.resolve<Promise<int>>(Promise.resolve<int>(5));
}

class NullablePromiseHolder {
  nullField: Object | null = null;
  undefinedField: Object | undefined = undefined;
}

class AsyncTaskRunner {
  async run(): Promise<int> {
    return 11;
  }

  async label(): Promise<string> {
    return 'runner-label';
  }

  async flag(): Promise<boolean> {
    return true;
  }

  plainRun(): void {
  }
}

class ThenableBox {
  then(resolve: (value: int) => void): void {
    resolve(1);
  }
}

class PartialThenableBox {
  then(): void {
  }

  catchProbe(): void {
  }
}

interface ThenableShape {
  then: () => void;
}

interface LabelledRecord {
  name: string;
  value: int;
}

class LabelledEntity {
  name: string = 'entity';
  value: int = 3;
}

class SubError extends Error {
  constructor(message: string) {
    super(message);
  }
}

class ProbeStore {
  private items: Map<string, Object> = new Map<string, Object>();

  put(key: string, value: Object): void {
    this.items.set(key, value);
  }

  fetch(key: string): Object | undefined {
    return this.items.get(key);
  }
}

function makeResolvedPromise(): Object {
  return Promise.resolve<int>(1);
}

function makeThenable(): Object {
  return new ThenableBox();
}

function makePayloadPromise(): Object {
  return Promise.resolve<PromisePayload>(new PromisePayload());
}

function probePromise(value: Object): boolean {
  let probe: util.types = new util.types();
  return probe.isPromise(value);
}

function echoObject(value: Object): Object {
  return value;
}

function labelForPromise(hit: boolean): string {
  return hit ? 'promise' : 'plain';
}

async function declareAsyncValue(): Promise<int> {
  return 11;
}

async function declareAsyncText(): Promise<string> {
  return 'promise-check';
}

async function declareAsyncFlag(): Promise<boolean> {
  return true;
}

async function declareAsyncByte(): Promise<byte> {
  return 5;
}

async function declareAsyncShort(): Promise<short> {
  return 50;
}

async function declareAsyncLong(): Promise<long> {
  return 5000;
}

async function declareAsyncFloat(): Promise<float> {
  return 2.5f;
}

async function declareAsyncDouble(): Promise<double> {
  return 2.5;
}

async function declareAsyncPayload(): Promise<PromisePayload> {
  return new PromisePayload();
}

async function declareNested(): Promise<Promise<int>> {
  return Promise.resolve<int>(9);
}

async function declareAsyncSet(): Promise<Set<string>> {
  return new Set<string>();
}

async function declareAsyncMap(): Promise<Map<string, int>> {
  let built: Map<string, int> = new Map<string, int>();
  built.set('k', 1);
  return built;
}

async function declareThrownPromise(): Promise<int> {
  throw new Error('reject-probe');
}

async function declareAwaiting(): Promise<int> {
  let inner: int = await declareAsyncValue();
  return inner + 1;
}

function attachThen(source: Promise<int>, delta: int): Promise<int> {
  return source.then((value: int): int => value + delta);
}

function attachScaledThen(source: Promise<int>, factor: int): Promise<int> {
  return source.then((value: int): int => value * factor);
}

function attachGuardedThen(source: Promise<int>, fallback: int): Promise<int> {
  return source.then((value: int): int => value, (): int => fallback);
}

function attachCatch(source: Promise<int>, fallback: int): Promise<int> {
  return source.catch((): int => fallback);
}

function attachFinally(source: Promise<int>): Promise<int> {
  return source.finally((): void => { });
}

function attachCountThen(source: Promise<int[]>): Promise<int> {
  return source.then((values: int[]): int => values.length);
}

function attachArrayCatch(source: Promise<int[]>, fallback: int[]): Promise<int[]> {
  return source.catch((): int[] => fallback);
}

function attachTextThen(source: Promise<int>): Promise<string> {
  return source.then((value: int): string => value.toString());
}

function attachNameThen(source: Promise<PromisePayload>): Promise<string> {
  return source.then((value: PromisePayload): string => value.name);
}

function exercisePartialThenable(box: PartialThenableBox): void {
  box.then();
  box.catchProbe();
}

class AsyncSeat {
  produce: () => Promise<int> = async (): Promise<int> => { return 21; };
  settled: Object = Promise.resolve<int>(1);
}

class MixedSlotHolder {
  held: Object = Promise.resolve<int>(3);
  fake: Object = new ThenableBox();
}

class DerivedTaskRunner extends AsyncTaskRunner {
  async extra(): Promise<string> {
    return 'extra';
  }
}

class PromiseStaticStore {
  static promiseSlot: Object = Promise.resolve<int>(17);
  static intSlot: Object = 21;
}

class VerdictKeeper {
  private judge: util.types = new util.types();

  classify(value: Object): boolean {
    return this.judge.isPromise(value);
  }
}

class MutableView {
  then: () => void = (): void => { };
  label: string = 'mutable';
}

interface AsyncSlot {
  spawn: () => Promise<string>;
}

interface PromiseCarrier {
  carried: Object;
  tag: string;
}

function invokeProducer(produce: () => Promise<int>): Object {
  return produce();
}

function relayAsync(): Object {
  return declareAsyncValue();
}

function pickPromiseByFlag(hit: boolean): Object {
  return hit ? Promise.resolve<int>(1) : new Map<string, string>();
}

function collectPromises(values: Object[]): Object[] {
  let judge: util.types = new util.types();
  return values.filter((value: Object): boolean => judge.isPromise(value));
}

function firstNonPromiseAt(values: Object[]): int {
  let judge: util.types = new util.types();
  let cursor: int = 0;
  while (cursor < values.length) {
    if (!judge.isPromise(values[cursor])) {
      return cursor;
    }
    cursor = cursor + 1;
  }
  return -1;
}

async function sumAwaiting(list: Promise<int>[]): Promise<int> {
  let total: int = 0;
  for (const item of list) {
    total += await item;
  }
  return total;
}

function coercePromise(value: Object): Promise<int> {
  let judge: util.types = new util.types();
  return judge.isPromise(value) ? (value as Promise<int>) : Promise.resolve<int>(0);
}

export default function typesIsPromiseTest(): void {
  describe('TypesIsPromiseTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_0100
     * @tc.name testTypesIsPromise001
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts a promise created by Promise.resolve with the string value resolved-text; accepts the void promise produced by Promise.resolve without any argument; the promises produced by then and catch continuations of a resolved promise are both recognised; accepts the promise produced by attaching a finally handler to a resolved promise; accepts a promise whose type argument is itself a promise type.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isPromise returns true for a promise created by Promise.resolve with the string value resolved-text ---
      {
        let promiseChecker: util.types = new util.types();
        let resolved: Promise<string> = Promise.resolve<string>('resolved-text');
        expect(promiseChecker.isPromise(resolved)).assertTrue();
      }

      // --- [2] Verify isPromise returns true for the void promise produced by Promise.resolve without any argument ---
      {
        let promiseChecker: util.types = new util.types();
        let resolved: Promise<void> = Promise.resolve();
        expect(promiseChecker.isPromise(resolved)).assertTrue();
      }

      // --- [3] Verify the promises produced by then and catch continuations of a resolved promise are both recognised ---
      {
        let promiseChecker: util.types = new util.types();
        let viaThen: Object = attachThen(Promise.resolve<int>(4), 1);
        let viaCatch: Object = attachCatch(Promise.resolve<int>(6), 0);
        expect(promiseChecker.isPromise(viaThen)).assertTrue();
        expect(promiseChecker.isPromise(viaCatch)).assertTrue();
      }

      // --- [4] Verify isPromise returns true for the promise produced by attaching a finally handler to a resolved promise ---
      {
        let promiseChecker: util.types = new util.types();
        let chained: Object = attachFinally(Promise.resolve<int>(7));
        expect(promiseChecker.isPromise(chained)).assertTrue();
      }

      // --- [5] Verify isPromise returns true for a promise whose type argument is itself a promise type ---
      {
        let promiseChecker: util.types = new util.types();
        let nested: Object = declareNested();
        let candidates: Object[] = [nested];
        let hits: int = 0;
        for (let candidate of candidates) {
          if (promiseChecker.isPromise(candidate)) {
            hits += 1;
          }
        }
        expect(hits).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_0200
     * @tc.name testTypesIsPromise002
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts both an inner promise and the outer promise created by resolving with that promise; the promise produced by a two step then chain is still reported as a promise and finally handler on an async result is reported as a promise; accepts a class instance promise and for the string continuation built from it; accepts two invocations of one async function declaration produce two distinct promise objects that; accepts a flag driven factory yields a promise on one branch and a non promise on the other and a slice copied promise.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isPromise returns true for both an inner promise and the outer promise created by resolving with that promise ---
      {
        let promiseChecker: util.types = new util.types();
        let inner: Promise<int> = Promise.resolve<int>(8);
        let adopted: Object = Promise.resolve<Promise<int>>(inner);
        expect(promiseChecker.isPromise(inner)).assertTrue();
        expect(promiseChecker.isPromise(adopted)).assertTrue();
      }

      // --- [2] Verify the promise produced by a two step then chain is still reported as a promise and finally handler on an async result is reported as a promise ---
      {
        let promiseChecker: util.types = new util.types();
        let once: Promise<int> = attachThen(Promise.resolve<int>(1), 1);
        let chained: Object = attachThen(once, 1);
        expect(promiseChecker.isPromise(chained)).assertTrue();
        let promiseChecker_2: util.types = new util.types();
        let start: Promise<int> = declareAsyncValue();
        let closed: Object = attachFinally(start);
        expect(promiseChecker_2.isPromise(closed)).assertTrue();
      }

      // --- [3] Verify isPromise returns true for a class instance promise and for the string continuation built from it ---
      {
        let promiseChecker: util.types = new util.types();
        let made: Object = makePayloadPromise();
        let followed: Object = attachNameThen(Promise.resolve<PromisePayload>(new PromisePayload()));
        expect(promiseChecker.isPromise(made)).assertTrue();
        expect(promiseChecker.isPromise(followed)).assertTrue();
      }

      // --- [4] Verify two invocations of one async function declaration produce two distinct promise objects that are both accepted ---
      {
        let promiseProbe: util.types = new util.types();
        let first: Object = declareAsyncValue();
        let second: Object = declareAsyncValue();
        let accepted: int = 0;
        if (promiseProbe.isPromise(first)) {
          accepted += 1;
        }
        if (promiseProbe.isPromise(second)) {
          accepted += 1;
        }
        expect(accepted).assertEqual(2);
        expect(first !== second).assertTrue();
      }

      // --- [5] Verify a flag driven factory yields a promise on one branch and a non promise on the other and a slice copied promise is accepted ---
      {
        let promiseChecker: util.types = new util.types();
        expect(promiseChecker.isPromise(pickPromiseByFlag(true))).assertTrue();
        expect(promiseChecker.isPromise(pickPromiseByFlag(false))).assertFalse();
        let promiseProbe: util.types = new util.types();
        let row: Object[] = [Promise.resolve<int>(6), 'x'];
        let head: Object[] = row.slice(0, 1);
        expect(head.length).assertEqual(1);
        expect(promiseProbe.isPromise(head[0])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_0300
     * @tc.name testTypesIsPromise003
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: Promise.any chooses the resolved member of a mixed pair and both the result and the resolved input are promises; isPromise reports true only for the promise entry of a Map that also holds the int 2; the value part of the first Map entries pair is accepted when that entry holds a promise; detection before and after inserting a promise into a Map leaves the entry reachable and stored and fresh verdicts agree; one instance classifies a promise, then a thenable, then a string in sequence without carrying over state.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Promise.any chooses the resolved member of a mixed pair and both the result and the resolved input are promises ---
      {
        let promiseProbe: util.types = new util.types();
        let good: Promise<int> = Promise.resolve<int>(8);
        let bad: Promise<int> = Promise.reject<int>(new Error('nope'));
        let firstOk: Promise<int> = Promise.any<int>([good, bad]);
        expect(promiseProbe.isPromise(firstOk)).assertTrue();
        expect(promiseProbe.isPromise(good)).assertTrue();
      }

      // --- [2] Verify isPromise reports true only for the promise entry of a Map that also holds the int 2 ---
      {
        let promiseChecker: util.types = new util.types();
        let mixed: Map<string, Object> = new Map<string, Object>();
        mixed.set('p', Promise.resolve<int>(1));
        mixed.set('n', 2);
        let promiseSlot: Object | undefined = mixed.get('p');
        let countSlot: Object | undefined = mixed.get('n');
        expect(promiseChecker.isPromise(promiseSlot as Object)).assertTrue();
        expect(promiseChecker.isPromise(countSlot as Object)).assertFalse();
      }

      // --- [3] Verify the value part of the first Map entries pair is accepted when that entry holds a promise ---
      {
        let promiseProbe: util.types = new util.types();
        let slots: Map<string, Object> = new Map<string, Object>();
        slots.set('p', Promise.resolve<int>(1));
        let pairs: IterableIterator<[string, Object]> = slots.entries();
        let pair: [string, Object] = pairs.next().value!;
        expect(pair[0]).assertEqual('p');
        expect(promiseProbe.isPromise(pair[1] as Object)).assertTrue();
      }

      // --- [4] Verify detection before and after inserting a promise into a Map leaves the entry reachable and stored and fresh verdicts agree ---
      {
        let promiseProbe: util.types = new util.types();
        let carried: Promise<int> = Promise.resolve<int>(6);
        let slots: Map<string, Object> = new Map<string, Object>();
        expect(promiseProbe.isPromise(carried)).assertTrue();
        slots.set('p', carried);
        expect(slots.get('p') as Object).assertEqual(carried);
        expect(promiseProbe.isPromise(slots.get('p') as Object)).assertTrue();
        let promiseChecker: util.types = new util.types();
        let source: Object = makeResolvedPromise();
        let stored: boolean = promiseChecker.isPromise(source);
        let fresh: boolean = promiseChecker.isPromise(source);
        expect(stored).assertEqual(fresh);
        expect(stored).assertTrue();
      }

      // --- [5] Verify one instance classifies a promise, then a thenable, then a string in sequence without carrying over state ---
      {
        let promiseChecker: util.types = new util.types();
        let firstHit: boolean = promiseChecker.isPromise(Promise.resolve<int>(1));
        let secondHit: boolean = promiseChecker.isPromise(new ThenableBox());
        let thirdHit: boolean = promiseChecker.isPromise('probe');
        expect(firstHit).assertTrue();
        expect(secondHit).assertFalse();
        expect(thirdHit).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_0400
     * @tc.name testTypesIsPromise004
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts a promise resolved with the double 2.5, a decimal literal rather than an int literal; accepts a promise resolved with the boolean true; accepts the promise returned by invoking an async method of a class instance; accepts the promise returned by an async method whose resolved value is a string; accepts the promise returned by an async function that throws and one that awaits another async function.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isPromise returns true for a promise resolved with the double 2.5, a decimal literal rather than an int literal ---
      {
        let promiseChecker: util.types = new util.types();
        let resolved: Promise<double> = Promise.resolve<double>(2.5);
        expect(promiseChecker.isPromise(resolved)).assertTrue();
      }

      // --- [2] Verify isPromise returns true for a promise resolved with the boolean true ---
      {
        let promiseChecker: util.types = new util.types();
        let resolved: Promise<boolean> = Promise.resolve<boolean>(true);
        expect(promiseChecker.isPromise(resolved)).assertTrue();
      }

      // --- [3] Verify isPromise returns true for the promise returned by invoking an async method of a class instance ---
      {
        let promiseChecker: util.types = new util.types();
        let runner: AsyncTaskRunner = new AsyncTaskRunner();
        let produced: Object = runner.run();
        expect(promiseChecker.isPromise(produced)).assertTrue();
      }

      // --- [4] Verify isPromise returns true for the promise returned by an async method whose resolved value is a string ---
      {
        let promiseChecker: util.types = new util.types();
        let runner: AsyncTaskRunner = new AsyncTaskRunner();
        let produced: Object = runner.label();
        let flags: boolean[] = [promiseChecker.isPromise(produced)];
        expect(flags[0]).assertTrue();
      }

      // --- [5] Verify the promise returned by an async function that throws and one that awaits another async function are both accepted ---
      {
        let promiseChecker: util.types = new util.types();
        let thrown: Promise<int> = declareThrownPromise();
        expect(promiseChecker.isPromise(thrown)).assertTrue();
        let guarded: Object = attachGuardedThen(thrown, -1);
        expect(promiseChecker.isPromise(guarded)).assertTrue();
        let promiseChecker_2: util.types = new util.types();
        let produced: Object = declareAwaiting();
        let flags: boolean[] = [promiseChecker_2.isPromise(produced)];
        expect(flags[0]).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_0500
     * @tc.name testTypesIsPromise005
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: accepts the Promise.allSettled result over two resolved promises and Promise.all over two async call sites; the promise produced by chaining then, catch and finally on one resolved promise is still a promise; the continuation attached to a Promise.all result is reported as a promise; an async arrow whose declared result is Promise of void produces a promise; a promise whose type argument is a Map from string to int is recognized and awaits to a Map holding the single entry k.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify the Promise.allSettled result over two resolved promises and Promise.all over two async call sites are both accepted ---
      {
        let promiseChecker: util.types = new util.types();
        let first: Promise<int> = Promise.resolve<int>(1);
        let second: Promise<int> = Promise.resolve<int>(2);
        let settled: Object = Promise.allSettled<int>([first, second]);
        expect(promiseChecker.isPromise(settled)).assertTrue();
        let promiseProbe: util.types = new util.types();
        let runner: AsyncTaskRunner = new AsyncTaskRunner();
        let members: Promise<int>[] = [runner.run(), declareAsyncValue()];
        let all: Promise<int[]> = Promise.all<int>(members);
        expect(promiseProbe.isPromise(all)).assertTrue();
        let values: int[] = await all;
        expect(values.length).assertEqual(2);
      }

      // --- [2] Verify the promise produced by chaining then, catch and finally on one resolved promise is still a promise ---
      {
        let promiseChecker: util.types = new util.types();
        let stepped: Promise<int> = attachThen(Promise.resolve<int>(1), 1);
        let recovered: Promise<int> = attachCatch(stepped, -1);
        let chained: Object = attachFinally(recovered);
        expect(promiseChecker.isPromise(chained)).assertTrue();
      }

      // --- [3] Verify the continuation attached to a Promise.all result is reported as a promise ---
      {
        let promiseChecker: util.types = new util.types();
        let members: Promise<int>[] = [Promise.resolve<int>(1)];
        let all: Promise<int[]> = Promise.all<int>(members);
        let follower: Object = attachCountThen(all);
        expect(promiseChecker.isPromise(follower)).assertTrue();
        expect(promiseChecker.isPromise(all)).assertTrue();
      }

      // --- [4] Verify an async arrow whose declared result is Promise of void produces a promise ---
      {
        let promiseChecker: util.types = new util.types();
        let produce: () => Promise<void> = async (): Promise<void> => { };
        let produced: Object = produce();
        expect(promiseChecker.isPromise(produced)).assertTrue();
        await (produced as Promise<void>);
      }

      // --- [5] Verify a promise whose type argument is a Map from string to int is recognized and awaits to a Map holding the single entry k ---
      {
        let promiseProbe: util.types = new util.types();
        let pending: Promise<Map<string, int>> = declareAsyncMap();
        expect(promiseProbe.isPromise(pending)).assertTrue();
        let table: Map<string, int> = await pending;
        expect(table.size).assertEqual(1);
        expect(table.get('k')!).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_0600
     * @tc.name testTypesIsPromise006
     * @tc.desc Merged batch (5 tests): Basic construction and recognition: a promise whose type argument is a Set of strings is recognized and awaits to the empty Set it was built with; an awaited promise fulfilled with 11 is accepted and can be awaited twice with the same value after a detection; accepts Promise.race over an empty promise array, which never settles; accepts Promise.all of two resolved promises and awaiting it yields both fulfilled values; Promise.race resolves to its first settled member and Promise.any to the first fulfilment, both accepted.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify a promise whose type argument is a Set of strings is recognized and awaits to the empty Set it was built with ---
      {
        let promiseProbe: util.types = new util.types();
        let pending: Promise<Set<string>> = declareAsyncSet();
        expect(promiseProbe.isPromise(pending)).assertTrue();
        let bucket: Set<string> = await pending;
        expect(bucket.has('a')).assertFalse();
        expect(bucket.size).assertEqual(0);
      }

      // --- [2] Verify an awaited promise fulfilled with 11 is accepted and can be awaited twice with the same value after a detection ---
      {
        let promiseProbe: util.types = new util.types();
        let ready: Promise<int> = declareAsyncValue();
        let resolved: int = await ready;
        expect(resolved).assertEqual(11);
        expect(promiseProbe.isPromise(ready)).assertTrue();
        let promiseProbe_2: util.types = new util.types();
        let ready_2: Promise<int> = declareAsyncValue();
        let detected: boolean = promiseProbe_2.isPromise(ready_2);
        let firstRead: int = await ready_2;
        let secondRead: int = await ready_2;
        expect(detected).assertTrue();
        expect(firstRead).assertEqual(11);
        expect(secondRead).assertEqual(11);
      }

      // --- [3] Verify isPromise returns true for Promise.race over an empty promise array, which never settles ---
      {
        let promiseProbe: util.types = new util.types();
        let none: Promise<int>[] = [];
        let pending: Promise<int> = Promise.race<int>(none);
        expect(promiseProbe.isPromise(pending)).assertTrue();
      }

      // --- [4] Verify isPromise returns true for Promise.all of two resolved promises and awaiting it yields both fulfilled values ---
      {
        let promiseProbe: util.types = new util.types();
        let one: Promise<int> = Promise.resolve<int>(1);
        let two: Promise<int> = Promise.resolve<int>(2);
        let all: Promise<int[]> = Promise.all<int>([one, two]);
        expect(promiseProbe.isPromise(all)).assertTrue();
        let values: int[] = await all;
        expect(values.length).assertEqual(2);
        expect(values[0]).assertEqual(1);
      }

      // --- [5] Verify Promise.race resolves to its first settled member and Promise.any to the first fulfilment, both accepted ---
      {
        let promiseProbe: util.types = new util.types();
        let first: Promise<int> = Promise.resolve<int>(1);
        let second: Promise<int> = Promise.resolve<int>(2);
        let raced: Promise<int> = Promise.race<int>([first, second]);
        expect(promiseProbe.isPromise(raced)).assertTrue();
        let winner: int = await raced;
        expect(winner).assertEqual(1);
        let promiseProbe_2: util.types = new util.types();
        let first_2: Promise<int> = Promise.resolve<int>(1);
        let second_2: Promise<int> = Promise.resolve<int>(2);
        let anyOf: Promise<int> = Promise.any<int>([first_2, second_2]);
        let verdict: boolean = promiseProbe_2.isPromise(anyOf);
        let winner_2: int = await anyOf;
        expect(verdict).assertTrue();
        expect(winner_2).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_0700
     * @tc.name testTypesIsPromise007
     * @tc.desc Merged batch (2 tests): Basic construction and recognition: the promise produced by a then transformation resolves to the transformed value; the continuation attached to the promise returned by an async method is reported as a promise.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify the promise produced by a then transformation resolves to the transformed value while the source promise is still accepted ---
      {
        let promiseProbe: util.types = new util.types();
        let source: Promise<int> = Promise.resolve<int>(4);
        let follower: Promise<int> = attachThen(source, 1);
        let stepped: int = await follower;
        expect(stepped).assertEqual(5);
        expect(promiseProbe.isPromise(follower)).assertTrue();
        expect(promiseProbe.isPromise(source)).assertTrue();
      }

      // --- [2] Verify the continuation attached to the promise returned by an async method is reported as a promise ---
      {
        let promiseChecker: util.types = new util.types();
        let runner: AsyncTaskRunner = new AsyncTaskRunner();
        let follower: Object = attachTextThen(runner.run());
        expect(promiseChecker.isPromise(follower)).assertTrue();
        expect(promiseChecker.isPromise(runner.run())).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_0800
     * @tc.name testTypesIsPromise008
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: awaiting the promise produced by finally still yields the original value rather than the handler result; a promise deleted from its Set is still accepted and still awaits to its value; awaiting a promise resolved with another flattens to the inner int and a conditional pick awaits its chosen value, both sides accepted; a promise retains its identity and awaits to its value after the Map that held it is cleared; detection of a promise used as a Map key leaves the Map size and the stored entry intact.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify awaiting the promise produced by finally still yields the original value rather than the handler result ---
      {
        let promiseProbe: util.types = new util.types();
        let base: Promise<int> = Promise.resolve<int>(1);
        let closed: Promise<int> = attachFinally(base);
        let passed: int = await closed;
        expect(passed).assertEqual(1);
        expect(promiseProbe.isPromise(closed)).assertTrue();
      }

      // --- [2] Verify a promise deleted from its Set is still accepted and still awaits to its value ---
      {
        let promiseProbe: util.types = new util.types();
        let pool: Set<Object> = new Set<Object>();
        let carried: Promise<int> = Promise.resolve<int>(4);
        pool.add(carried);
        pool.delete(carried);
        expect(pool.size).assertEqual(0);
        expect(promiseProbe.isPromise(carried)).assertTrue();
        let value: int = await carried;
        expect(value).assertEqual(4);
      }

      // --- [3] Verify awaiting a promise resolved with another flattens to the inner int and a conditional pick awaits its chosen value, both sides accepted ---
      {
        let promiseProbe: util.types = new util.types();
        let inner: Promise<int> = Promise.resolve<int>(5);
        let outer: Promise<int> = Promise.resolve<Promise<int>>(inner);
        expect(promiseProbe.isPromise(outer)).assertTrue();
        expect(promiseProbe.isPromise(inner)).assertTrue();
        let flattened: int = await outer;
        expect(flattened).assertEqual(5);
        let promiseProbe_2: util.types = new util.types();
        let left: Promise<int> = Promise.resolve<int>(2);
        let right: Promise<int> = Promise.resolve<int>(3);
        let flag: boolean = false;
        let chosen: Promise<int> = flag ? left : right;
        let value: int = await chosen;
        expect(value).assertEqual(3);
        expect(promiseProbe_2.isPromise(left)).assertTrue();
        expect(promiseProbe_2.isPromise(right)).assertTrue();
      }

      // --- [4] Verify a promise retains its identity and awaits to its value after the Map that held it is cleared ---
      {
        let promiseProbe: util.types = new util.types();
        let slots: Map<string, Object> = new Map<string, Object>();
        let carried: Promise<int> = Promise.resolve<int>(2);
        slots.set('p', carried);
        slots.clear();
        expect(slots.size).assertEqual(0);
        expect(promiseProbe.isPromise(carried)).assertTrue();
        let value: int = await carried;
        expect(value).assertEqual(2);
      }

      // --- [5] Verify detection of a promise used as a Map key leaves the Map size and the stored entry intact ---
      {
        let promiseProbe: util.types = new util.types();
        let key: Object = Promise.resolve<int>(1);
        let slots: Map<Object, string> = new Map<Object, string>();
        slots.set(key, 'one');
        let sizeBefore: int = slots.size;
        expect(promiseProbe.isPromise(key)).assertTrue();
        expect(slots.size).assertEqual(sizeBefore);
        expect(slots.get(key)).assertEqual('one');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_0900
     * @tc.name testTypesIsPromise009
     * @tc.desc Merged batch (5 tests): State preservation and aliasing: awaiting every member inside a length driven while loop accumulates the total; accepts detection leaves an array length and both elements unchanged and a promise passed through an echoing helper; an async producer resolving to a class instance yields a promise whose awaited value keeps its fields; a promise of the float type stays recognized through a typed forwarding lambda and awaits to its value; an async function that awaits an inner promise stays recognized and settles to the inner value plus one.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify awaiting every member inside a length driven while loop accumulates the total while the first member stays accepted ---
      {
        let promiseProbe: util.types = new util.types();
        let members: Promise<int>[] = [Promise.resolve<int>(1), Promise.resolve<int>(2), Promise.resolve<int>(3)];
        let cursor: int = 0;
        let total: int = 0;
        while (cursor < members.length) {
          total += await members[cursor];
          cursor = cursor + 1;
        }
        expect(total).assertEqual(6);
        expect(promiseProbe.isPromise(members[0])).assertTrue();
      }

      // --- [2] Verify detection leaves an array length and both elements unchanged and a promise passed through an echoing helper is accepted ---
      {
        let promiseProbe: util.types = new util.types();
        let carried: Promise<int> = Promise.resolve<int>(1);
        let row: Object[] = [carried, 'x'];
        expect(promiseProbe.isPromise(row[0])).assertTrue();
        expect(row.length).assertEqual(2);
        expect(row[0]).assertEqual(carried);
        expect(row[1]).assertEqual('x');
        let promiseProbe_2: util.types = new util.types();
        let source: Object = declareAsyncValue();
        let echoed: Object = echoObject(source);
        expect(promiseProbe_2.isPromise(echoed)).assertTrue();
        expect(echoed).assertEqual(source);
      }

      // --- [3] Verify an async producer resolving to a class instance yields a promise whose awaited value keeps its fields ---
      {
        let promiseProbe: util.types = new util.types();
        let pending: Promise<PromisePayload> = declareAsyncPayload();
        expect(promiseProbe.isPromise(pending)).assertTrue();
        let delivered: PromisePayload = await pending;
        expect(delivered.name).assertEqual('payload');
        expect(delivered.code).assertEqual(7);
      }

      // --- [4] Verify a promise of the float type stays recognized through a typed forwarding lambda and awaits to its value ---
      {
        let promiseProbe: util.types = new util.types();
        let relay: (input: Promise<float>) => Object = (input: Promise<float>): Object => input;
        let passed: Object = relay(declareAsyncFloat());
        expect(promiseProbe.isPromise(passed)).assertTrue();
        let value: float = await (passed as Promise<float>);
        expect(value).assertEqual(2.5f);
      }

      // --- [5] Verify an async function that awaits an inner promise stays recognized and settles to the inner value plus one ---
      {
        let promiseProbe: util.types = new util.types();
        let derived: Promise<int> = declareAwaiting();
        expect(promiseProbe.isPromise(derived)).assertTrue();
        let lifted: int = await derived;
        let base: int = await declareAsyncValue();
        expect(lifted).assertEqual(base + 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_1000
     * @tc.name testTypesIsPromise010
     * @tc.desc Merged batch (2 tests): State preservation and aliasing: the awaited value of an async method keying a Map while the method promise stays accepted; a running total built from two sequential awaits while both source promises remain accepted.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify the awaited value of an async method keying a Map while the method promise stays accepted ---
      {
        let promiseProbe: util.types = new util.types();
        let produced: Object = new AsyncTaskRunner().run();
        let value: int = await (produced as Promise<int>);
        let table: Map<int, string> = new Map<int, string>();
        table.set(value, 'eleven');
        expect(table.get(11)).assertEqual('eleven');
        expect(promiseProbe.isPromise(produced)).assertTrue();
      }

      // --- [2] Verify a running total built from two sequential awaits while both source promises remain accepted ---
      {
        let promiseProbe: util.types = new util.types();
        let first: Promise<int> = Promise.resolve<int>(4);
        let second: Promise<int> = Promise.resolve<int>(5);
        let sum: int = await first;
        sum += await second;
        expect(sum).assertEqual(9);
        expect(promiseProbe.isPromise(first)).assertTrue();
        expect(promiseProbe.isPromise(second)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_1100
     * @tc.name testTypesIsPromise011
     * @tc.desc Merged batch (3 tests): Type conversion and subclassing: verifies widening and subclass handling, covering conversion and subclass paths and Object widening.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify async methods declared on a derived class and inherited from its base both produce promises ---
      {
        let promiseProbe: util.types = new util.types();
        let runner: DerivedTaskRunner = new DerivedTaskRunner();
        let produced: Object = runner.extra();
        expect(promiseProbe.isPromise(produced)).assertTrue();
        let text: string = await (produced as Promise<string>);
        expect(text).assertEqual('extra');
        expect(promiseProbe.isPromise(runner.run())).assertTrue();
      }

      // --- [2] Verify a promise widened from a typed promise variable into an Object variable is accepted and still awaits to its value ---
      {
        let promiseProbe: util.types = new util.types();
        let typed: Promise<int> = Promise.resolve<int>(8);
        let widened: Object = typed;
        expect(promiseProbe.isPromise(widened)).assertTrue();
        let value: int = await (widened as Promise<int>);
        expect(value).assertEqual(8);
      }

      // --- [3] Verify a coercion helper returns the input promise unchanged but substitutes a fallback for a non promise input ---
      {
        let promiseProbe: util.types = new util.types();
        let carried: Object = Promise.resolve<int>(9);
        let kept: Promise<int> = coercePromise(carried);
        let value: int = await kept;
        expect(value).assertEqual(9);
        let swappedPromise: Promise<int> = coercePromise(new Map<string, string>());
        expect(promiseProbe.isPromise(swappedPromise)).assertTrue();
        let fallback: int = await swappedPromise;
        expect(fallback).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_1200
     * @tc.name testTypesIsPromise012
     * @tc.desc Merged batch (4 tests): Boundary values: verifies boundary handling, covering empty inputs including Uint32Array, Map and Error.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify isPromise returns true for the promises stored in and fetched from a class that wraps a Map ---
      {
        let promiseChecker: util.types = new util.types();
        let store: ProbeStore = new ProbeStore();
        store.put('queued', Promise.resolve<int>(7));
        store.put('text', declareAsyncText());
        let first: Object | undefined = store.fetch('queued');
        let second: Object | undefined = store.fetch('text');
        expect(promiseChecker.isPromise(first as Object)).assertTrue();
        expect(promiseChecker.isPromise(second as Object)).assertTrue();
      }

      // --- [2] Verify a Uint32Array whose byte offset exceeds a four byte buffer raises RangeError while isPromise still reports true for a promise ---
      {
        let promiseProbe: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        try {
          new Uint32Array(buffer, 8, 2);
          expect().assertFail();
        } catch (err) {
          expect(err.name).assertEqual('RangeError');
        }
        let safe: Uint32Array = new Uint32Array(buffer, 0, 1);
        expect(promiseProbe.isPromise(safe)).assertFalse();
        expect(promiseProbe.isPromise(Promise.resolve<int>(1))).assertTrue();
      }

      // --- [3] Verify isPromise returns true for Promise.all over an empty promise array whose awaited result is an empty array ---
      {
        let promiseProbe: util.types = new util.types();
        let none: Promise<int>[] = [];
        let empty: Promise<int[]> = Promise.all<int>(none);
        expect(promiseProbe.isPromise(empty)).assertTrue();
        let values: int[] = await empty;
        expect(values.length).assertEqual(0);
      }

      // --- [4] Verify isPromise rejects the empty string, a 5000 character string, pro concatenated with mise and the uppercase PROMISE in a single pass ---
      {
        let promiseProbe: util.types = new util.types();
        let joined: string = 'pro' + 'mise';
        let longText: string = 'a'.repeat(5000);
        let candidates: string[] = ['', longText, joined, 'promise'.toUpperCase()];
        let hits: int = 0;
        for (const text of candidates) {
          if (promiseProbe.isPromise(text)) {
            hits = hits + 1;
          }
        }
        expect(longText.length).assertEqual(5000);
        expect(joined).assertEqual('promise');
        expect(candidates[3]).assertEqual('PROMISE');
        expect(hits).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_1300
     * @tc.name testTypesIsPromise013
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects Promise.race over two resolved promises yields one promise while the plain number argument; rejects the single character string p; the ints 0, 1 and the upper bound 2147483647 and the negated int 1 are all rejected in a single pass; isPromise rejects the byte value 5 and the short value 50 as distinct narrow integer types; rejects the double value 2.5 and NaN value produced by dividing the double zero by itself.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify Promise.race over two resolved promises yields one promise while the plain number argument is rejected ---
      {
        let promiseProbe: util.types = new util.types();
        let quick: Promise<int> = Promise.resolve<int>(5);
        let slow: Promise<int> = Promise.resolve<int>(6);
        let winner: Promise<int> = Promise.race<int>([quick, slow]);
        expect(promiseProbe.isPromise(winner)).assertTrue();
        expect(promiseProbe.isPromise(5)).assertFalse();
      }

      // --- [2] Verify isPromise returns false for the single character string p ---
      {
        let promiseChecker: util.types = new util.types();
        let judged: boolean = promiseChecker.isPromise('p');
        expect(judged).assertFalse();
      }

      // --- [3] Verify the ints 0, 1 and the upper bound 2147483647 and the negated int 1 are all rejected in a single pass ---
      {
        let promiseProbe: util.types = new util.types();
        let ints: int[] = [0, 1, 2147483647];
        let hits: int = 0;
        for (let i: int = 0; i < ints.length; i++) {
          if (promiseProbe.isPromise(ints[i])) {
            hits = hits + 1;
          }
        }
        expect(hits).assertEqual(0);
        let promiseChecker: util.types = new util.types();
        let below: int = -1;
        expect(promiseChecker.isPromise(below)).assertFalse();
      }

      // --- [4] Verify isPromise rejects the byte value 5 and the short value 50 as distinct narrow integer types ---
      {
        let promiseChecker: util.types = new util.types();
        let small: byte = 5;
        let medium: short = 50;
        expect(promiseChecker.isPromise(small)).assertFalse();
        expect(promiseChecker.isPromise(medium)).assertFalse();
      }

      // --- [5] Verify isPromise returns false for the double value 2.5 and NaN value produced by dividing the double zero by itself ---
      {
        let real: double = 2.5;
        expect(probePromise(real)).assertFalse();
        let promiseChecker: util.types = new util.types();
        let zero: double = 0.0;
        let notANumber: double = zero / zero;
        expect(promiseChecker.isPromise(notANumber)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_1400
     * @tc.name testTypesIsPromise014
     * @tc.desc Merged batch (5 tests): Primitive value rejection: rejects the positive double Infinity value; rejects both boolean primitives true and false; int 42 produced by the arithmetic expression six times seven; double 0.5 produced by dividing one by two; negative double value minus 2.5.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isPromise returns false for the positive double Infinity value ---
      {
        let promiseProbe: util.types = new util.types();
        let endless: double = Double.POSITIVE_INFINITY;
        expect(promiseProbe.isPromise(endless)).assertFalse();
      }

      // --- [2] Verify isPromise returns false for both boolean primitives true and false ---
      {
        let promiseChecker: util.types = new util.types();
        let values: boolean[] = [true, false];
        let accepted: int = 0;
        for (let i: int = 0; i < values.length; i++) {
          if (promiseChecker.isPromise(values[i])) {
            accepted = accepted + 1;
          }
        }
        expect(accepted).assertEqual(0);
      }

      // --- [3] Verify isPromise returns false for the int 42 produced by the arithmetic expression six times seven ---
      {
        let promiseProbe: util.types = new util.types();
        let derived: int = 6 * 7;
        expect(derived).assertEqual(42);
        expect(promiseProbe.isPromise(derived)).assertFalse();
      }

      // --- [4] Verify isPromise returns false for the double 0.5 produced by dividing one by two ---
      {
        let promiseProbe: util.types = new util.types();
        let fraction: double = 1.0 / 2.0;
        expect(fraction).assertEqual(0.5);
        expect(promiseProbe.isPromise(fraction)).assertFalse();
      }

      // --- [5] Verify isPromise returns false for the negative double value minus 2.5 ---
      {
        let lower: double = -2.5;
        let relayed: Object = echoObject(lower);
        let promiseProbe: util.types = new util.types();
        expect(promiseProbe.isPromise(relayed)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_1500
     * @tc.name testTypesIsPromise015
     * @tc.desc Merged batch (2 tests): Primitive value rejection: rejects a BigInt64Array over an eight byte ArrayBuffer; Map holding a single string entry.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isPromise returns false for a BigInt64Array over an eight byte ArrayBuffer ---
      {
        let promiseChecker: util.types = new util.types();
        let wide: BigInt64Array = new BigInt64Array(new ArrayBuffer(8));
        expect(promiseChecker.isPromise(wide)).assertFalse();
      }

      // --- [2] Verify isPromise returns false for a Map holding a single string entry ---
      {
        let promiseProbe: util.types = new util.types();
        let table: Map<string, string> = new Map<string, string>();
        table.set('k', 'v');
        expect(table.size).assertEqual(1);
        expect(promiseProbe.isPromise(table)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_1600
     * @tc.name testTypesIsPromise016
     * @tc.desc Merged batch (4 tests): Primitive value rejection: verifies rejection of primitive and other non-object inputs, covering awaited results.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify feeding the boolean outcome of a detection into a second detection reports false ---
      {
        let promiseChecker: util.types = new util.types();
        let source: Object = Promise.resolve<int>(1);
        let outcome: boolean = promiseChecker.isPromise(source);
        expect(outcome).assertTrue();
        expect(promiseChecker.isPromise(outcome)).assertFalse();
      }

      // --- [2] Verify isPromise returns false for a Set that holds a single string ---
      {
        let promiseProbe: util.types = new util.types();
        let pool: Set<string> = new Set<string>();
        pool.add('probe');
        expect(pool.size).assertEqual(1);
        expect(promiseProbe.isPromise(pool)).assertFalse();
      }

      // --- [3] Verify isPromise returns false for an Array of the three ints 1, 2 and 3 ---
      {
        let promiseProbe: util.types = new util.types();
        let numbers: int[] = [1, 2, 3];
        expect(promiseProbe.isPromise(numbers)).assertFalse();
      }

      // --- [4] Verify an async method resolving to a boolean yields a promise while the awaited boolean itself is rejected ---
      {
        let promiseProbe: util.types = new util.types();
        let runner: AsyncTaskRunner = new AsyncTaskRunner();
        let produced: Object = runner.flag();
        expect(promiseProbe.isPromise(produced)).assertTrue();
        let value: boolean = await (produced as Promise<boolean>);
        expect(value).assertTrue();
        expect(promiseProbe.isPromise(value)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_1700
     * @tc.name testTypesIsPromise017
     * @tc.desc Merged batch (5 tests): Non-target object rejection: one Object variable reports false for a thenable and true after it is reassigned to a real promise; a Promise.all containing a rejecting member is still a promise and its catch handler yields a fallback promise; an async method reference is rejected while the promise it returns is accepted and an optional variable is followed through; Promise.allSettled over a resolved and a rejected promise yields a promise; a catch handler attached to a resolved promise is not invoked.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify one Object variable reports false for a thenable and true after it is reassigned to a real promise ---
      {
        let promiseChecker: util.types = new util.types();
        let slot: Object = makeThenable();
        let asThenable: boolean = promiseChecker.isPromise(slot);
        slot = makeResolvedPromise();
        let asPromise: boolean = promiseChecker.isPromise(slot);
        expect(asThenable).assertFalse();
        expect(asPromise).assertTrue();
      }

      // --- [2] Verify a Promise.all containing a rejecting member is still a promise and its catch handler yields a fallback promise ---
      {
        let promiseProbe: util.types = new util.types();
        let ok: Promise<int> = Promise.resolve<int>(1);
        let bad: Promise<int> = Promise.reject<int>(new Error('member-rejects'));
        let all: Promise<int[]> = Promise.all<int>([ok, bad]);
        expect(promiseProbe.isPromise(all)).assertTrue();
        let guarded: Object = attachArrayCatch(all, [0]);
        expect(promiseProbe.isPromise(guarded)).assertTrue();
        let values: int[] = await (guarded as Promise<int[]>);
        expect(values.length).assertEqual(1);
      }

      // --- [3] Verify an async method reference is rejected while the promise it returns is accepted and an optional variable is followed through ---
      {
        let promiseChecker: util.types = new util.types();
        let runner: AsyncTaskRunner = new AsyncTaskRunner();
        let asReference: boolean = promiseChecker.isPromise(runner.flag);
        let asResult: boolean = promiseChecker.isPromise(runner.flag());
        expect(asReference).assertFalse();
        expect(asResult).assertTrue();
        let promiseChecker_2: util.types = new util.types();
        let missing: Object | undefined = declareAsyncValue;
        expect(promiseChecker_2.isPromise(missing as Object)).assertFalse();
        let produced: Object | undefined = declareAsyncValue();
        expect(promiseChecker_2.isPromise(produced as Object)).assertTrue();
      }

      // --- [4] Verify Promise.allSettled over a resolved and a rejected promise yields a promise while the rejected input is one too ---
      {
        let promiseProbe: util.types = new util.types();
        let ok: Promise<int> = Promise.resolve<int>(1);
        let bad: Promise<int> = Promise.reject<int>(new Error('late'));
        let settled: Promise<PromiseSettledResult<int>[]> = Promise.allSettled<int>([ok, bad]);
        expect(promiseProbe.isPromise(settled)).assertTrue();
        expect(promiseProbe.isPromise(bad)).assertTrue();
      }

      // --- [5] Verify a catch handler attached to a resolved promise is not invoked so its awaited value is the untouched original 61 ---
      {
        let promiseProbe: util.types = new util.types();
        let base: Promise<int> = Promise.resolve<int>(61);
        let unhandled: Promise<int> = attachCatch(base, 0);
        let kept: int = await unhandled;
        expect(kept).assertEqual(61);
        expect(promiseProbe.isPromise(unhandled)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_1800
     * @tc.name testTypesIsPromise018
     * @tc.desc Merged batch (3 tests): Non-target object rejection: a promise filter over a thenable and a Map keeps nothing; a thenable is rejected by isPromise and also by date, native error and map detection; a rejected promise and the promise returned by its catch handler are both promises.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify a promise filter over a thenable and a Map keeps nothing while weak map, buffer and view checks reject ---
      {
        let promiseChecker: util.types = new util.types();
        let fake: ThenableBox = new ThenableBox();
        let candidates: Object[] = [fake, new Map<string, string>()];
        let detected: Object[] = candidates.filter((candidate: Object): boolean => promiseChecker.isPromise(candidate));
        expect(detected.length).assertEqual(0);
        expect(promiseChecker.isWeakMap(fake)).assertFalse();
        expect(promiseChecker.isAnyArrayBuffer(fake)).assertFalse();
        expect(promiseChecker.isArrayBufferView(fake)).assertFalse();
      }

      // --- [2] Verify a thenable is rejected by isPromise and also by date, native error and map detection ---
      {
        let promiseChecker: util.types = new util.types();
        let fake: ThenableBox = new ThenableBox();
        expect(promiseChecker.isPromise(fake)).assertFalse();
        expect(promiseChecker.isDate(fake)).assertFalse();
        expect(promiseChecker.isNativeError(fake)).assertFalse();
        expect(promiseChecker.isMap(fake)).assertFalse();
      }

      // --- [3] Verify a rejected promise and the promise returned by its catch handler are both promises while a bare error is not ---
      {
        let promiseProbe: util.types = new util.types();
        let failure: Promise<int> = Promise.reject<int>(new Error('bad'));
        let recovered: Promise<int> = attachCatch(failure, 0);
        expect(promiseProbe.isPromise(failure)).assertTrue();
        expect(promiseProbe.isPromise(recovered)).assertTrue();
        expect(promiseProbe.isPromise(new Error('plain'))).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_1900
     * @tc.name testTypesIsPromise019
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects an object literal whose only member is a then function; rejects a thenable returned from a factory whose declared result type is Object and instance carried in a Map value slot; rejects the async function declaration itself rather than for its call result; rejects an async arrow when the function object itself is passed; a reference to an async method of a derived class instance is not a promise when it is lifted into a function variable.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isPromise returns false for an object literal whose only member is a then function ---
      {
        let promiseChecker: util.types = new util.types();
        let shaped: ThenableShape = { then: (): void => { } };
        expect(promiseChecker.isPromise(shaped)).assertFalse();
      }

      // --- [2] Verify isPromise returns false for a thenable returned from a factory whose declared result type is Object and instance carried in a Map value slot ---
      {
        let promiseChecker: util.types = new util.types();
        expect(promiseChecker.isPromise(makeThenable())).assertFalse();
        let promiseChecker_2: util.types = new util.types();
        let slots: Map<string, Object> = new Map<string, Object>();
        slots.set('fake', new ThenableBox());
        let got: Object | undefined = slots.get('fake');
        expect(promiseChecker_2.isPromise(got as Object)).assertFalse();
      }

      // --- [3] Verify isPromise returns false for the async function declaration itself rather than for its call result ---
      {
        let promiseChecker: util.types = new util.types();
        expect(promiseChecker.isPromise(declareAsyncValue)).assertFalse();
      }

      // --- [4] Verify isPromise returns false for an async arrow when the function object itself is passed ---
      {
        let promiseChecker: util.types = new util.types();
        let produce: () => Promise<int> = async (): Promise<int> => { return 3; };
        expect(promiseChecker.isPromise(produce)).assertFalse();
      }

      // --- [5] Verify a reference to an async method of a derived class instance is not a promise when it is lifted into a function variable ---
      {
        let promiseChecker: util.types = new util.types();
        let derived: DerivedTaskRunner = new DerivedTaskRunner();
        let lifted: () => Promise<string> = derived.extra;
        expect(promiseChecker.isPromise(lifted)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_2000
     * @tc.name testTypesIsPromise020
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a synchronous arrow function stored in a variable and the two async function objects held by an Object array; boxed zero stored in a Map value slot and read back; rejects an eight byte ArrayBuffer; Uint8Array built from the three byte values 1, 2 and 3; rejects Int32Array and Float64Array views.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isPromise returns false for a synchronous arrow function stored in a variable and the two async function objects held by an Object array ---
      {
        let promiseChecker: util.types = new util.types();
        let count: () => int = (): int => 5;
        expect(promiseChecker.isPromise(count)).assertFalse();
        let promiseChecker_2: util.types = new util.types();
        let fns: Object[] = [declareAsyncValue, async (): Promise<int> => { return 1; }];
        expect(promiseChecker_2.isPromise(fns[0])).assertFalse();
        expect(promiseChecker_2.isPromise(fns[1])).assertFalse();
      }

      // --- [2] Verify isPromise returns false for a boxed zero stored in a Map value slot and read back ---
      {
        let promiseChecker: util.types = new util.types();
        let slots: Map<string, Object> = new Map<string, Object>();
        slots.set('empty', 0.0 as Object);
        let got: Object | undefined = slots.get('empty');
        expect(promiseChecker.isPromise(got as Object)).assertFalse();
      }

      // --- [3] Verify isPromise returns false for an eight byte ArrayBuffer ---
      {
        let promiseProbe: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        expect(buffer.byteLength).assertEqual(8);
        expect(promiseProbe.isPromise(buffer)).assertFalse();
      }

      // --- [4] Verify isPromise returns false for a Uint8Array built from the three byte values 1, 2 and 3 ---
      {
        let promiseProbe: util.types = new util.types();
        let bytes: Uint8Array = new Uint8Array([1, 2, 3]);
        expect(bytes.length).assertEqual(3);
        expect(promiseProbe.isPromise(bytes)).assertFalse();
      }

      // --- [5] Verify isPromise returns false for Int32Array and Float64Array views ---
      {
        let promiseChecker: util.types = new util.types();
        let words: Int32Array = new Int32Array(new ArrayBuffer(4));
        expect(promiseChecker.isPromise(words)).assertFalse();
        let reals: Float64Array = new Float64Array(new ArrayBuffer(8));
        expect(promiseChecker.isPromise(reals)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_2100
     * @tc.name testTypesIsPromise021
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects a WeakMap keyed by a class instance; WeakSet that holds a class instance; Date instance created from the current time and RegExp built from the pattern probe; rejects the values iterator of a Set; isPromise rejects a labelled class instance and an Error instance, each keeping its own name.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isPromise returns false for a WeakMap keyed by a class instance ---
      {
        let promiseProbe: util.types = new util.types();
        let weak: WeakMap<ProbeStore, ProbeStore> = new WeakMap<ProbeStore, ProbeStore>();
        let key: ProbeStore = new ProbeStore();
        weak.set(key, key);
        expect(weak.has(key)).assertTrue();
        expect(promiseProbe.isPromise(weak)).assertFalse();
      }

      // --- [2] Verify isPromise returns false for a WeakSet that holds a class instance ---
      {
        let promiseProbe: util.types = new util.types();
        let weak: WeakSet<ProbeStore> = new WeakSet<ProbeStore>();
        let member: ProbeStore = new ProbeStore();
        weak.add(member);
        expect(weak.has(member)).assertTrue();
        expect(promiseProbe.isPromise(weak)).assertFalse();
      }

      // --- [3] Verify isPromise returns false for a Date instance created from the current time and RegExp built from the pattern probe ---
      {
        let promiseChecker: util.types = new util.types();
        let stamp: Date = new Date();
        expect(promiseChecker.isPromise(stamp)).assertFalse();
        let promiseProbe: util.types = new util.types();
        let pattern: RegExp = new RegExp('probe');
        expect(pattern.source).assertEqual('probe');
        expect(promiseProbe.isPromise(pattern)).assertFalse();
      }

      // --- [4] Verify isPromise returns false for the values iterator of a Set ---
      {
        let promiseChecker: util.types = new util.types();
        let pool: Set<string> = new Set<string>();
        pool.add('probe');
        let walker: IterableIterator<string> = pool.values();
        expect(promiseChecker.isPromise(walker)).assertFalse();
      }

      // --- [5] Verify isPromise rejects a labelled class instance and an Error instance, each keeping its own name ---
      {
        let promiseProbe: util.types = new util.types();
        let entity: LabelledEntity = new LabelledEntity();
        let failure: Error = new Error('probe');
        expect(entity.name).assertEqual('entity');
        expect(failure.name).assertEqual('Error');
        expect(promiseProbe.isPromise(entity)).assertFalse();
        expect(promiseProbe.isPromise(failure)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_2200
     * @tc.name testTypesIsPromise022
     * @tc.desc Merged batch (5 tests): Non-target object rejection: rejects an object literal typed by an interface with name and value members; a TypeError carried in a typed Map slot is still rejected by isPromise and keeps the name TypeError; an ArrayBuffer and a Map are rejected by isPromise while their own predicates accept them; reading a Uint8Array at index 5 of a two element array raises RangeError; a partial thenable is rejected by its internal brand, not member names, even after its methods are invoked.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isPromise returns false for an object literal typed by an interface with name and value members ---
      {
        let promiseProbe: util.types = new util.types();
        let record: LabelledRecord = { name: 'entry', value: 3 };
        expect(record.name).assertEqual('entry');
        expect(promiseProbe.isPromise(record)).assertFalse();
      }

      // --- [2] Verify a TypeError carried in a typed Map slot is still rejected by isPromise and keeps the name TypeError ---
      {
        let promiseProbe: util.types = new util.types();
        let failure: Error = new TypeError('bad type');
        let slots: Map<string, Object> = new Map<string, Object>();
        slots.set('typed', failure);
        expect(failure.name).assertEqual('TypeError');
        let got: Object | undefined = slots.get('typed');
        expect(promiseProbe.isPromise(got as Object)).assertFalse();
      }

      // --- [3] Verify an ArrayBuffer and a Map are rejected by isPromise while their own predicates accept them ---
      {
        let promiseChecker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        expect(promiseChecker.isPromise(buffer)).assertFalse();
        expect(promiseChecker.isArrayBuffer(buffer)).assertTrue();
        let table: Map<string, string> = new Map<string, string>();
        expect(promiseChecker.isPromise(table)).assertFalse();
        expect(promiseChecker.isMap(table)).assertTrue();
      }

      // --- [4] Verify reading a Uint8Array at index 5 of a two element array raises RangeError while isPromise still rejects that array ---
      {
        let promiseProbe: util.types = new util.types();
        let small: Uint8Array = new Uint8Array([1, 2]);
        try {
          small.$_get(5);
          expect().assertFail();
        } catch (err) {
          expect(err.name).assertEqual('RangeError');
        }
        expect(promiseProbe.isPromise(small)).assertFalse();
      }

      // --- [5] Verify a partial thenable is rejected by its internal brand, not member names, even after its methods are invoked ---
      {
        let promiseChecker: util.types = new util.types();
        let fake: PartialThenableBox = new PartialThenableBox();
        expect(promiseChecker.isPromise(fake)).assertFalse();
        exercisePartialThenable(fake);
        expect(promiseChecker.isPromise(fake)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_2300
     * @tc.name testTypesIsPromise023
     * @tc.desc Merged batch (4 tests): Non-target object rejection: verifies rejection of unrelated objects, covering repeated calls and other unrelated kinds.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify repeated detection of a thenable does not mutate its label field ---
      {
        let promiseProbe: util.types = new util.types();
        let mutable: MutableView = new MutableView();
        let first: boolean = promiseProbe.isPromise(mutable);
        let labelAfterFirst: string = mutable.label;
        let second: boolean = promiseProbe.isPromise(mutable);
        expect(first).assertFalse();
        expect(second).assertFalse();
        expect(mutable.label).assertEqual(labelAfterFirst);
        expect(labelAfterFirst).assertEqual('mutable');
      }

      // --- [2] Verify a user defined Error subclass keeps the base name Error and its own message while isPromise rejects it ---
      {
        let promiseProbe: util.types = new util.types();
        let failure: Error = new SubError('sub class probe');
        expect(failure.message).assertEqual('sub class probe');
        let verdict: boolean = promiseProbe.isPromise(failure);
        expect(verdict).assertFalse();
        expect(failure.name).assertEqual('Error');
      }

      // --- [3] Verify three consecutive detections of the same thenable on one instance all return false ---
      {
        let promiseChecker: util.types = new util.types();
        let source: Object = new ThenableBox();
        let first: boolean = promiseChecker.isPromise(source);
        let second: boolean = promiseChecker.isPromise(source);
        let third: boolean = promiseChecker.isPromise(source);
        expect(first).assertFalse();
        expect(second).assertFalse();
        expect(third).assertFalse();
      }

      // --- [4] Verify isPromise returns false for the Int8Array, Int16Array and Uint32Array kinds over one ArrayBuffer ---
      {
        let promiseChecker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let signedBytes: Int8Array = new Int8Array(buffer);
        let halfWords: Int16Array = new Int16Array(buffer);
        let words: Uint32Array = new Uint32Array(buffer);
        expect(promiseChecker.isPromise(signedBytes)).assertFalse();
        expect(promiseChecker.isPromise(halfWords)).assertFalse();
        expect(promiseChecker.isPromise(words)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_2400
     * @tc.name testTypesIsPromise024
     * @tc.desc Merged batch (4 tests): State preservation and aliasing: checks that later reads still see the original state, covering Object widening.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify promises read from an array, a Map and a class field stay accepted, and a then continuation of the field promise is accepted ---
      {
        let promiseChecker: util.types = new util.types();
        let source: Object = Promise.resolve<int>(3);
        let row: Object[] = [source];
        let slots: Map<string, Object> = new Map<string, Object>();
        slots.set('s', source);
        let holder: PromiseFieldHolder = new PromiseFieldHolder();
        let fromRow: boolean = promiseChecker.isPromise(row[0]);
        let fromMap: boolean = promiseChecker.isPromise(slots.get('s') as Object);
        let fromField: boolean = promiseChecker.isPromise(holder.single);
        expect(fromRow).assertTrue();
        expect(fromMap).assertTrue();
        expect(fromField).assertTrue();
        let promiseChecker_2: util.types = new util.types();
        let holder_2: PromiseFieldHolder = new PromiseFieldHolder();
        let follower: Object = attachScaledThen(holder_2.single, 2);
        expect(promiseChecker_2.isPromise(follower)).assertTrue();
        expect(promiseChecker_2.isPromise(holder_2.single)).assertTrue();
      }

      // --- [2] Verify detection leaves the then field of a thenable object pointing at the same function ---
      {
        let promiseProbe: util.types = new util.types();
        let mutable: MutableView = new MutableView();
        let before: () => void = mutable.then;
        let hit: boolean = promiseProbe.isPromise(mutable);
        let after: () => void = mutable.then;
        expect(hit).assertFalse();
        expect(before).assertEqual(after);
      }

      // --- [3] Verify isPromise returns true for a promise reached through an Object variable and through a second alias of it ---
      {
        let promiseChecker: util.types = new util.types();
        let carried: Object = Promise.resolve<int>(5);
        let alias: Object = carried;
        expect(promiseChecker.isPromise(carried)).assertTrue();
        expect(promiseChecker.isPromise(alias)).assertTrue();
      }

      // --- [4] Verify a promise used as a WeakSet member is accepted and remains a member after the detection ---
      {
        let promiseProbe: util.types = new util.types();
        let weak: WeakSet<Promise<int>> = new WeakSet<Promise<int>>();
        let carried: Promise<int> = Promise.resolve<int>(4);
        weak.add(carried);
        expect(promiseProbe.isPromise(carried)).assertTrue();
        expect(weak.has(carried)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_2500
     * @tc.name testTypesIsPromise025
     * @tc.desc Merged batch (5 tests): Container and field storage: accepts promises read back from the two elements of an Object array; the promise held in the element slot of a byte typed promise array is recognized as one; a promise of the short type stored in a typed Map slot is recognized through the key; accepts a promise used as a Map key and read back through the keys iterator; accepts promises held in three class fields of int, class instance and nested promise shape.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify isPromise returns true for promises read back from the two elements of an Object array ---
      {
        let promiseChecker: util.types = new util.types();
        let row: Object[] = [Promise.resolve<int>(1), declareAsyncValue()];
        expect(promiseChecker.isPromise(row[0])).assertTrue();
        expect(promiseChecker.isPromise(row[1])).assertTrue();
      }

      // --- [2] Verify the promise held in the element slot of a byte typed promise array is recognized as one ---
      {
        let promiseProbe: util.types = new util.types();
        let queue: Promise<byte>[] = [declareAsyncByte()];
        let head: Object = queue[0];
        expect(promiseProbe.isPromise(head)).assertTrue();
      }

      // --- [3] Verify a promise of the short type stored in a typed Map slot is recognized through the key ---
      {
        let promiseProbe: util.types = new util.types();
        let slots: Map<string, Promise<short>> = new Map<string, Promise<short>>();
        slots.set('narrow', declareAsyncShort());
        expect(slots.size).assertEqual(1);
        expect(promiseProbe.isPromise(slots.get('narrow')!)).assertTrue();
      }

      // --- [4] Verify isPromise returns true for a promise used as a Map key and read back through the keys iterator ---
      {
        let promiseChecker: util.types = new util.types();
        let keyed: Map<Object, string> = new Map<Object, string>();
        keyed.set(Promise.resolve<int>(3), 'carrier');
        let walker: IterableIterator<Object> = keyed.keys();
        let first: Object | undefined = walker.next().value;
        expect(promiseChecker.isPromise(first as Object)).assertTrue();
      }

      // --- [5] Verify isPromise returns true for promises held in three class fields of int, class instance and nested promise shape ---
      {
        let promiseChecker: util.types = new util.types();
        let holder: PromiseFieldHolder = new PromiseFieldHolder();
        expect(promiseChecker.isPromise(holder.single)).assertTrue();
        expect(promiseChecker.isPromise(holder.payload)).assertTrue();
        expect(promiseChecker.isPromise(holder.nested)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_2600
     * @tc.name testTypesIsPromise026
     * @tc.desc Merged batch (5 tests): Container and field storage: two nullable holders carrying a promise and a Date respectively are judged by what their fields actually hold; isPromise reports true only for the promise element of an array that also holds a string and an int; a promise used as a Map key is still accepted with its entry reachable and its attached continuation is accepted too; detection of a Set member leaves the Set size and both members reachable; a promise in the inner Map of a two level map and one in the field of a store held as a Map value are accepted through two lookups.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two nullable holders carrying a promise and a Date respectively are judged by what their fields actually hold ---
      {
        let promiseChecker: util.types = new util.types();
        let holder: NullablePromiseHolder = new NullablePromiseHolder();
        holder.nullField = Promise.resolve<int>(2);
        holder.undefinedField = new Date(0);
        expect(promiseChecker.isPromise(holder.nullField as Object)).assertTrue();
        expect(promiseChecker.isPromise(holder.undefinedField as Object)).assertFalse();
      }

      // --- [2] Verify isPromise reports true only for the promise element of an array that also holds a string and an int ---
      {
        let promiseChecker: util.types = new util.types();
        let mixed: Object[] = [Promise.resolve<int>(1), 'text', 3];
        expect(promiseChecker.isPromise(mixed[0])).assertTrue();
        expect(promiseChecker.isPromise(mixed[1])).assertFalse();
        expect(promiseChecker.isPromise(mixed[2])).assertFalse();
      }

      // --- [3] Verify a promise used as a Map key is still accepted with its entry reachable and its attached continuation is accepted too ---
      {
        let promiseProbe: util.types = new util.types();
        let keyed: Map<Object, string> = new Map<Object, string>();
        let key: Object = Promise.resolve<int>(4);
        keyed.set(key, 'stored');
        expect(promiseProbe.isPromise(key)).assertTrue();
        expect(keyed.get(key)).assertEqual('stored');
        let promiseChecker: util.types = new util.types();
        let slots: Map<string, Object> = new Map<string, Object>();
        slots.set('base', Promise.resolve<int>(2));
        let base: Object | undefined = slots.get('base');
        let followed: Object = attachThen(base as Promise<int>, 5);
        expect(promiseChecker.isPromise(base as Object)).assertTrue();
        expect(promiseChecker.isPromise(followed)).assertTrue();
      }

      // --- [4] Verify detection of a Set member leaves the Set size and both members reachable ---
      {
        let promiseProbe: util.types = new util.types();
        let carried: Promise<int> = Promise.resolve<int>(6);
        let pool: Set<Object> = new Set<Object>();
        pool.add(carried);
        pool.add('a');
        expect(promiseProbe.isPromise(carried)).assertTrue();
        expect(pool.size).assertEqual(2);
        expect(pool.has(carried)).assertTrue();
        expect(pool.has('a')).assertTrue();
      }

      // --- [5] Verify a promise in the inner Map of a two level map and one in the field of a store held as a Map value are accepted through two lookups ---
      {
        let promiseChecker: util.types = new util.types();
        let nested: Map<string, Map<string, Object>> = new Map<string, Map<string, Object>>();
        let inner: Map<string, Object> = new Map<string, Object>();
        inner.set('p', Promise.resolve<int>(5));
        nested.set('outer', inner);
        let fetched: Map<string, Object> = nested.get('outer')!;
        expect(promiseChecker.isPromise(fetched.get('p') as Object)).assertTrue();
        let promiseChecker_2: util.types = new util.types();
        let seats: Map<string, ProbeStore> = new Map<string, ProbeStore>();
        let store: ProbeStore = new ProbeStore();
        store.put('queued', Promise.resolve<int>(3));
        seats.set('store', store);
        let reached: ProbeStore = seats.get('store')!;
        expect(promiseChecker_2.isPromise(reached.fetch('queued') as Object)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_2700
     * @tc.name testTypesIsPromise027
     * @tc.desc Merged batch (2 tests): Container and field storage: one promise instance stored in two array slots is accepted from both slots; isPromise accepts the promise indexOf locates at its own slot.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify one promise instance stored in two array slots is accepted from both slots ---
      {
        let promiseProbe: util.types = new util.types();
        let carried: Promise<int> = Promise.resolve<int>(3);
        let row: Object[] = [carried, carried];
        expect(promiseProbe.isPromise(row[0])).assertTrue();
        expect(promiseProbe.isPromise(row[1])).assertTrue();
        expect(row[0]).assertEqual(row[1]);
      }

      // --- [2] Verify isPromise accepts the promise indexOf locates at its own slot while a same valued twin is missed with minus one ---
      {
        let promiseChecker: util.types = new util.types();
        let target: Promise<int> = Promise.resolve<int>(4);
        let twin: Promise<int> = Promise.resolve<int>(4);
        let pool: Promise<int>[] = [Promise.resolve<int>(3), target, Promise.resolve<int>(5)];
        let at: int = pool.indexOf(target);
        let miss: int = pool.indexOf(twin);
        expect(at).assertEqual(1);
        expect(miss).assertEqual(-1);
        expect(promiseChecker.isPromise(pool[at])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_2800
     * @tc.name testTypesIsPromise028
     * @tc.desc Merged batch (5 tests): Container and field storage: accepts a combinator nested inside another combinator; an async method invoked on a class instance fetched from a Map slot produces a promise; promise pushed into an array after construction and one held as a WeakMap value under a class key; promise held in the field of an interface typed object literal; accepts the promise returned by an async arrow stored in a class field, and the sibling field promise.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify isPromise returns true for a combinator nested inside another combinator ---
      {
        let promiseProbe: util.types = new util.types();
        let inner: Promise<int> = Promise.resolve<int>(1);
        let outer: Promise<int> = Promise.resolve<int>(2);
        let raced: Promise<int> = Promise.race<int>([inner, outer]);
        let all: Promise<int[]> = Promise.all<int>([raced, inner]);
        expect(promiseProbe.isPromise(raced)).assertTrue();
        expect(promiseProbe.isPromise(all)).assertTrue();
        let values: int[] = await all;
        expect(values.length).assertEqual(2);
      }

      // --- [2] Verify an async method invoked on a class instance fetched from a Map slot produces a promise ---
      {
        let promiseChecker: util.types = new util.types();
        let seats: Map<string, AsyncTaskRunner> = new Map<string, AsyncTaskRunner>();
        seats.set('runner', new AsyncTaskRunner());
        let runner: AsyncTaskRunner = seats.get('runner')!;
        expect(promiseChecker.isPromise(runner.run())).assertTrue();
      }

      // --- [3] Verify a promise pushed into an array after construction and one held as a WeakMap value under a class key are accepted ---
      {
        let promiseProbe: util.types = new util.types();
        let row: Object[] = [];
        row.push(Promise.resolve<int>(7));
        expect(promiseProbe.isPromise(row[0])).assertTrue();
        expect(row.length).assertEqual(1);
        let promiseChecker: util.types = new util.types();
        let weak: WeakMap<ProbeStore, Promise<int>> = new WeakMap<ProbeStore, Promise<int>>();
        let key: ProbeStore = new ProbeStore();
        weak.set(key, Promise.resolve<int>(3));
        let carried: Promise<int> | undefined = weak.get(key);
        expect(promiseChecker.isPromise(carried as Object)).assertTrue();
      }

      // --- [4] Verify a promise held in the field of an interface typed object literal is accepted ---
      {
        let promiseProbe: util.types = new util.types();
        let carrier: PromiseCarrier = { carried: Promise.resolve<int>(5), tag: 'carrier' };
        expect(promiseProbe.isPromise(carrier.carried)).assertTrue();
        expect(carrier.tag).assertEqual('carrier');
      }

      // --- [5] Verify the promise returned by an async arrow stored in a class field, and the sibling field promise, are both accepted ---
      {
        let promiseProbe: util.types = new util.types();
        let seat: AsyncSeat = new AsyncSeat();
        let produced: Object = seat.produce();
        expect(promiseProbe.isPromise(produced)).assertTrue();
        let value: int = await (produced as Promise<int>);
        expect(value).assertEqual(21);
        expect(promiseProbe.isPromise(seat.settled)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_2900
     * @tc.name testTypesIsPromise029
     * @tc.desc Merged batch (5 tests): Container and field storage: one slot reports promise true then error true after the promise is swapped for an Error instance; a filter helper that runs detection collects exactly the two promise elements of a mixed array; no element of a bigint array is accepted, counting zero hits over the positive one and the signed 64 bit minimum; accepts the promise returned by invoking an async arrow that is stored in a variable; a promise of the long type is counted in a loop and its slot still awaits to the long value.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify one slot reports promise true then error true after the promise is swapped for an Error instance ---
      {
        let promiseChecker: util.types = new util.types();
        let slot: Object = Promise.resolve<int>(1);
        let asPromise: boolean = promiseChecker.isPromise(slot);
        let asErrorBefore: boolean = promiseChecker.isNativeError(slot);
        slot = new SubError('probe');
        let asErrorAfter: boolean = promiseChecker.isNativeError(slot);
        let asPromiseAfter: boolean = promiseChecker.isPromise(slot);
        expect(asPromise).assertTrue();
        expect(asErrorBefore).assertFalse();
        expect(asErrorAfter).assertTrue();
        expect(asPromiseAfter).assertFalse();
      }

      // --- [2] Verify a filter helper that runs detection collects exactly the two promise elements of a mixed array ---
      {
        let row: Object[] = [Promise.resolve<int>(1), 'x', declareAsyncValue(), new Map<string, string>()];
        let hits: Object[] = collectPromises(row);
        expect(hits.length).assertEqual(2);
      }

      // --- [3] Verify no element of a bigint array is accepted, counting zero hits over the positive one and the signed 64 bit minimum ---
      {
        let promiseChecker: util.types = new util.types();
        let bigs: bigint[] = [BigInt(1), BigInt('-9223372036854775808')];
        let accepted: int = 0;
        for (let i: int = 0; i < bigs.length; i++) {
          if (promiseChecker.isPromise(bigs[i])) {
            accepted = accepted + 1;
          }
        }
        expect(accepted).assertEqual(0);
      }

      // --- [4] Verify isPromise returns true for the promise returned by invoking an async arrow that is stored in a variable ---
      {
        let promiseChecker: util.types = new util.types();
        let produce: () => Promise<int> = async (): Promise<int> => { return 3; };
        let produced: Object = produce();
        expect(promiseChecker.isPromise(produced)).assertTrue();
      }

      // --- [5] Verify a promise of the long type is counted in a loop and its slot still awaits to the long value ---
      {
        let promiseProbe: util.types = new util.types();
        let list: Promise<long>[] = [declareAsyncLong()];
        let accepted: int = 0;
        for (const pending of list) {
          if (promiseProbe.isPromise(pending)) {
            accepted = accepted + 1;
          }
        }
        expect(accepted).assertEqual(1);
        let expected: long = 5000;
        let value: long = await list[0];
        expect(value).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_3000
     * @tc.name testTypesIsPromise030
     * @tc.desc Merged batch (2 tests): Container and field storage: the promise returned by an async arrow stored in an interface typed object field; awaiting a promise read from a Map slot yields the stored value.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify the promise returned by an async arrow stored in an interface typed object field ---
      {
        let promiseProbe: util.types = new util.types();
        let slot: AsyncSlot = { spawn: async (): Promise<string> => { return 'spawned'; } };
        let produced: Object = slot.spawn();
        expect(promiseProbe.isPromise(produced)).assertTrue();
        let text: string = await (produced as Promise<string>);
        expect(text).assertEqual('spawned');
      }

      // --- [2] Verify awaiting a promise read from a Map slot yields the stored value while the slot still holds an accepted promise ---
      {
        let promiseProbe: util.types = new util.types();
        let slots: Map<string, Object> = new Map<string, Object>();
        slots.set('p', Promise.resolve<int>(7));
        let held: Object = slots.get('p')!;
        let value: int = await (held as Promise<int>);
        expect(value).assertEqual(7);
        expect(promiseProbe.isPromise(slots.get('p') as Object)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_3100
     * @tc.name testTypesIsPromise031
     * @tc.desc Merged batch (5 tests): API call consistency: the same Object variable reports true while it holds a promise and false after it is reassigned to a string; accepts a resolved int promise while a Map stays rejected and string promise; rejects Promise.all over two resolved promises yields a promise that isPromise accepts; a variable declared Object or null is recognized as a promise when it holds one and rejected when it holds a Date; two independent then continuations attached to the same async result are both reported as promises.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify the same Object variable reports true while it holds a promise and false after it is reassigned to a string ---
      {
        let promiseChecker: util.types = new util.types();
        let slot: Object = Promise.resolve<int>(4);
        let whilePromise: boolean = promiseChecker.isPromise(slot);
        slot = 'not a promise';
        let whileText: boolean = promiseChecker.isPromise(slot);
        expect(whilePromise).assertTrue();
        expect(whileText).assertFalse();
      }

      // --- [2] Verify isPromise returns true for a resolved int promise while a Map stays rejected and string promise while a Date stays rejected ---
      {
        let promiseProbe: util.types = new util.types();
        expect(promiseProbe.isPromise(Promise.resolve<int>(1))).assertTrue();
        expect(promiseProbe.isPromise(new Map<string, int>())).assertFalse();
        let promiseProbe_2: util.types = new util.types();
        expect(promiseProbe_2.isPromise(Promise.resolve('ok'))).assertTrue();
        expect(promiseProbe_2.isPromise(new Date(0))).assertFalse();
      }

      // --- [3] Verify Promise.all over two resolved promises yields a promise that isPromise accepts while the source array is rejected ---
      {
        let promiseProbe: util.types = new util.types();
        let first: Promise<int> = Promise.resolve<int>(1);
        let second: Promise<int> = Promise.resolve<int>(2);
        let joined: Promise<Array<int>> = Promise.all<int>([first, second]);
        expect(promiseProbe.isPromise(joined)).assertTrue();
        expect(promiseProbe.isPromise([first, second])).assertFalse();
      }

      // --- [4] Verify a variable declared Object or null is recognized as a promise when it holds one and rejected when it holds a Date ---
      {
        let promiseChecker: util.types = new util.types();
        let given: Object | null = Promise.resolve<int>(1);
        expect(promiseChecker.isPromise(given as Object)).assertTrue();
        let other: Object | null = new Date(0);
        expect(promiseChecker.isPromise(other as Object)).assertFalse();
      }

      // --- [5] Verify two independent then continuations attached to the same async result are both reported as promises ---
      {
        let promiseChecker: util.types = new util.types();
        let start: Promise<int> = declareAsyncValue();
        let firstStep: Object = attachThen(start, 1);
        let secondStep: Object = attachThen(start, 2);
        expect(promiseChecker.isPromise(firstStep)).assertTrue();
        expect(promiseChecker.isPromise(secondStep)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_3200
     * @tc.name testTypesIsPromise032
     * @tc.desc Merged batch (5 tests): API call consistency: two separate util.types instances both report true for the same promise instance; the probe helper agrees with a direct call for a promise and for the int 7; a promise is accepted only by isPromise while four other predicates reject it, and a Record promise slot passes beside an int slot; one types instance interleaves map iterator detection with promise detection without cross contamination; one types instance distinguishes a typed array view from a promise and from a bare buffer.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify two separate util.types instances both report true for the same promise instance ---
      {
        let first: util.types = new util.types();
        let second: util.types = new util.types();
        let source: Object = Promise.resolve<int>(8);
        let firstHit: boolean = first.isPromise(source);
        let secondHit: boolean = second.isPromise(source);
        expect(firstHit).assertTrue();
        expect(secondHit).assertTrue();
        expect(firstHit).assertEqual(secondHit);
      }

      // --- [2] Verify the probe helper agrees with a direct call for a promise and for the int 7 ---
      {
        let promiseProbe: util.types = new util.types();
        let source: Object = makeResolvedPromise();
        let direct: boolean = promiseProbe.isPromise(source);
        let viaHelper: boolean = probePromise(source);
        expect(direct).assertEqual(viaHelper);
        expect(direct).assertTrue();
        expect(probePromise(7)).assertEqual(promiseProbe.isPromise(7));
        expect(probePromise(7)).assertFalse();
      }

      // --- [3] Verify a promise is accepted only by isPromise while four other predicates reject it, and a Record promise slot passes beside an int slot ---
      {
        let promiseChecker: util.types = new util.types();
        let source: Promise<int> = Promise.resolve<int>(7);
        expect(promiseChecker.isPromise(source)).assertTrue();
        expect(promiseChecker.isArrayBuffer(source)).assertFalse();
        expect(promiseChecker.isMap(source)).assertFalse();
        expect(promiseChecker.isDate(source)).assertFalse();
        expect(promiseChecker.isNativeError(source)).assertFalse();
        let promiseChecker_2: util.types = new util.types();
        let table: Record<string, Object> = { 'p': Promise.resolve<int>(1), 'n': 2 };
        expect(promiseChecker_2.isPromise(table['p']!)).assertTrue();
        expect(promiseChecker_2.isPromise(table['n']!)).assertFalse();
      }

      // --- [4] Verify one types instance interleaves map iterator detection with promise detection without cross contamination ---
      {
        let promiseChecker: util.types = new util.types();
        let table: Map<string, string> = new Map<string, string>();
        table.set('k', 'v');
        let walker: IterableIterator<string> = table.keys();
        let carried: Object = Promise.resolve<int>(1);
        expect(promiseChecker.isMapIterator(walker)).assertTrue();
        expect(promiseChecker.isPromise(walker)).assertFalse();
        expect(promiseChecker.isPromise(carried)).assertTrue();
        expect(promiseChecker.isMapIterator(carried)).assertFalse();
      }

      // --- [5] Verify one types instance distinguishes a typed array view from a promise and from a bare buffer ---
      {
        let promiseChecker: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let view: Uint8Array = new Uint8Array(buffer);
        let carried: Object = Promise.resolve<int>(1);
        expect(promiseChecker.isPromise(view)).assertFalse();
        expect(promiseChecker.isArrayBufferView(view)).assertTrue();
        expect(promiseChecker.isTypedArray(view)).assertTrue();
        expect(promiseChecker.isArrayBuffer(view)).assertFalse();
        expect(promiseChecker.isPromise(carried)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_3300
     * @tc.name testTypesIsPromise033
     * @tc.desc Merged batch (5 tests): API call consistency: a promise is accepted by isPromise while set, regular expression and weak map detection all reject it; an async method reference and an async arrow object are both accepted by isAsyncFunction and both rejected by isPromise; a Set holding a promise stays a Set while its promise member is accepted and its iterator is not a map iterator; the promise produced by a then continuation is accepted; a DataView is accepted as a buffer view but rejected by isPromise and by typed array detection.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a promise is accepted by isPromise while set, regular expression and weak map detection all reject it ---
      {
        let promiseChecker: util.types = new util.types();
        let carried: Object = Promise.resolve<int>(1);
        expect(promiseChecker.isPromise(carried)).assertTrue();
        expect(promiseChecker.isSet(carried)).assertFalse();
        expect(promiseChecker.isRegExp(carried)).assertFalse();
        expect(promiseChecker.isWeakMap(carried)).assertFalse();
      }

      // --- [2] Verify an async method reference and an async arrow object are both accepted by isAsyncFunction and both rejected by isPromise ---
      {
        let promiseChecker: util.types = new util.types();
        let runner: AsyncTaskRunner = new AsyncTaskRunner();
        let methodRef: Object = runner.run;
        let arrowRef: Function = async (): Promise<int> => { return 1; };
        expect(promiseChecker.isAsyncFunction(methodRef)).assertTrue();
        expect(promiseChecker.isPromise(methodRef)).assertFalse();
        expect(promiseChecker.isAsyncFunction(arrowRef)).assertTrue();
        expect(promiseChecker.isPromise(arrowRef)).assertFalse();
      }

      // --- [3] Verify a Set holding a promise stays a Set while its promise member is accepted and its iterator is not a map iterator ---
      {
        let promiseChecker: util.types = new util.types();
        let carried: Promise<int> = Promise.resolve<int>(1);
        let pool: Set<Object> = new Set<Object>();
        pool.add(carried);
        let walker: IterableIterator<Object> = pool.values();
        expect(promiseChecker.isPromise(walker.next().value as Object)).assertTrue();
        expect(promiseChecker.isSet(pool)).assertTrue();
        expect(promiseChecker.isPromise(pool)).assertFalse();
        expect(promiseChecker.isMapIterator(walker)).assertFalse();
      }

      // --- [4] Verify the promise produced by a then continuation is accepted while set iterator, async function and date detection reject it ---
      {
        let promiseChecker: util.types = new util.types();
        let contiguous: Object = attachThen(Promise.resolve<int>(1), 1);
        expect(promiseChecker.isPromise(contiguous)).assertTrue();
        expect(promiseChecker.isSetIterator(contiguous)).assertFalse();
        expect(promiseChecker.isAsyncFunction(contiguous)).assertFalse();
        expect(promiseChecker.isDate(contiguous)).assertFalse();
      }

      // --- [5] Verify a DataView is accepted as a buffer view but rejected by isPromise and by typed array detection ---
      {
        let promiseChecker: util.types = new util.types();
        let view: DataView = new DataView(new ArrayBuffer(8));
        let carried: Object = Promise.resolve<int>(1);
        expect(promiseChecker.isPromise(view)).assertFalse();
        expect(promiseChecker.isArrayBufferView(view)).assertTrue();
        expect(promiseChecker.isTypedArray(view)).assertFalse();
        expect(promiseChecker.isPromise(carried)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_3400
     * @tc.name testTypesIsPromise034
     * @tc.desc Merged batch (1 test): API call consistency: an async function reference held in a Record slot is rejected by isPromise and accepted by isAsyncFunction.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an async function reference held in a Record slot is rejected by isPromise and accepted by isAsyncFunction ---
      {
        let promiseChecker: util.types = new util.types();
        let table: Record<string, Object> = { 'fn': declareAsyncValue };
        let stored: Object = table['fn']!;
        expect(promiseChecker.isPromise(stored)).assertFalse();
        expect(promiseChecker.isAsyncFunction(stored)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_3500
     * @tc.name testTypesIsPromise035
     * @tc.desc Merged batch (5 tests): API call consistency: rejects a promise kept in a class static field is recognized; finally on a rejected promise keeps the rejection and its chained promise is still accepted; a promise Set member is accepted while the int member is rejected and a holder's promise field passes while its thenable field fails; the promise and the int read in order from a Map values iterator are accepted and rejected respectively; accepts a promise selected by a boolean conditional expression whose condition is false.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify a promise kept in a class static field is recognized while the static numeric field beside it is rejected ---
      {
        let promiseChecker: util.types = new util.types();
        let throughField: boolean = promiseChecker.isPromise(PromiseStaticStore.promiseSlot);
        let throughNumber: boolean = promiseChecker.isPromise(PromiseStaticStore.intSlot);
        expect(throughField).assertTrue();
        expect(throughNumber).assertFalse();
      }

      // --- [2] Verify finally on a rejected promise keeps the rejection and its chained promise is still accepted ---
      {
        let promiseProbe: util.types = new util.types();
        let bad: Promise<int> = Promise.reject<int>(new Error('kept'));
        let closed: Promise<int> = attachFinally(bad);
        let recovered: int = await attachGuardedThen(closed, -1);
        expect(recovered).assertEqual(-1);
        expect(promiseProbe.isPromise(closed)).assertTrue();
      }

      // --- [3] Verify a promise Set member is accepted while the int member is rejected and a holder's promise field passes while its thenable field fails ---
      {
        let promiseChecker: util.types = new util.types();
        let pool: Set<Object> = new Set<Object>();
        let carried: Promise<int> = Promise.resolve<int>(5);
        pool.add(carried);
        pool.add(6);
        let walker: IterableIterator<Object> = pool.values();
        expect(promiseChecker.isPromise(walker.next().value as Object)).assertTrue();
        expect(promiseChecker.isPromise(walker.next().value as Object)).assertFalse();
        let promiseChecker_2: util.types = new util.types();
        let holder: MixedSlotHolder = new MixedSlotHolder();
        expect(promiseChecker_2.isPromise(holder.held)).assertTrue();
        expect(promiseChecker_2.isPromise(holder.fake)).assertFalse();
      }

      // --- [4] Verify the promise and the int read in order from a Map values iterator are accepted and rejected respectively ---
      {
        let promiseChecker: util.types = new util.types();
        let slots: Map<string, Object> = new Map<string, Object>();
        slots.set('p', Promise.resolve<int>(1));
        slots.set('n', 2);
        let walker: IterableIterator<Object> = slots.values();
        expect(promiseChecker.isPromise(walker.next().value as Object)).assertTrue();
        expect(promiseChecker.isPromise(walker.next().value as Object)).assertFalse();
      }

      // --- [5] Verify isPromise returns true for a promise selected by a boolean conditional expression whose condition is false ---
      {
        let promiseChecker: util.types = new util.types();
        let flag: boolean = false;
        let left: Object = Promise.resolve<int>(6);
        let right: Object = declareAsyncValue();
        let chosen: Object = flag ? left : right;
        expect(promiseChecker.isPromise(chosen)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_3600
     * @tc.name testTypesIsPromise036
     * @tc.desc Merged batch (5 tests): API call consistency: a conditional expression reports true when it picks a promise and false when the condition is inverted to pick a Map; the promise whose type argument is the double type is the branch a false condition selects, and it is recognized and awaits to 2.5; a combinator promise is accepted by isPromise; a rejected promise and its catch result are both accepted while awaiting the catch value yields -1; rejects detection of a promise reports true both before and after its await while the awaited int.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify a conditional expression reports true when it picks a promise and false when the condition is inverted to pick a Map ---
      {
        let promiseChecker: util.types = new util.types();
        let flag: boolean = true;
        let left: Object = Promise.resolve<int>(5);
        let right: Object = new Map<string, string>();
        let chosen: Object = flag ? left : right;
        let flipped: Object = !flag ? left : right;
        expect(promiseChecker.isPromise(chosen)).assertTrue();
        expect(promiseChecker.isPromise(flipped)).assertFalse();
      }

      // --- [2] Verify the promise whose type argument is the double type is the branch a false condition selects, and it is recognized and awaits to 2.5 ---
      {
        let promiseProbe: util.types = new util.types();
        let pick: boolean = false;
        let chosen: Promise<double> = pick ? Promise.resolve<double>(1.5) : declareAsyncDouble();
        expect(promiseProbe.isPromise(chosen)).assertTrue();
        let value: double = await chosen;
        expect(value).assertEqual(2.5);
      }

      // --- [3] Verify a combinator promise is accepted by isPromise while buffer, buffer view and map iterator detection reject it ---
      {
        let promiseChecker: util.types = new util.types();
        let members: Promise<int>[] = [Promise.resolve<int>(1), Promise.resolve<int>(2)];
        let all: Object = Promise.all<int>(members);
        expect(promiseChecker.isPromise(all)).assertTrue();
        expect(promiseChecker.isAnyArrayBuffer(all)).assertFalse();
        expect(promiseChecker.isArrayBufferView(all)).assertFalse();
        expect(promiseChecker.isMapIterator(all)).assertFalse();
      }

      // --- [4] Verify a rejected promise and its catch result are both accepted while awaiting the catch value yields -1 ---
      {
        let promiseProbe: util.types = new util.types();
        let bad: Promise<int> = Promise.reject<int>(new Error('nope'));
        let caught: Promise<int> = attachCatch(bad, -1);
        let fallback: int = await caught;
        expect(fallback).assertEqual(-1);
        expect(promiseProbe.isPromise(caught)).assertTrue();
        expect(promiseProbe.isPromise(bad)).assertTrue();
      }

      // --- [5] Verify detection of a promise reports true both before and after its await while the awaited int is rejected ---
      {
        let promiseChecker: util.types = new util.types();
        let ready: Promise<int> = Promise.resolve<int>(9);
        let before: boolean = promiseChecker.isPromise(ready);
        let value: int = await ready;
        let after: boolean = promiseChecker.isPromise(ready);
        expect(before).assertTrue();
        expect(after).assertTrue();
        expect(promiseChecker.isPromise(value)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_3700
     * @tc.name testTypesIsPromise037
     * @tc.desc Merged batch (2 tests): API call consistency: rejects re-wrapping an awaited int with Promise.resolve yields an accepted promise while the raw int; accepts the int array produced by awaiting a Promise.all is not a promise.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify re-wrapping an awaited int with Promise.resolve yields an accepted promise while the raw int is rejected ---
      {
        let promiseProbe: util.types = new util.types();
        let source: Promise<int> = Promise.resolve<int>(8);
        let value: int = await source;
        let rewrapped: Promise<int> = Promise.resolve<int>(value);
        expect(promiseProbe.isPromise(rewrapped)).assertTrue();
        expect(promiseProbe.isPromise(value)).assertFalse();
        expect(value).assertEqual(8);
      }

      // --- [2] Verify the int array produced by awaiting a Promise.all is not a promise while the combinator itself is accepted ---
      {
        let promiseChecker: util.types = new util.types();
        let members: Promise<int>[] = [Promise.resolve<int>(1), Promise.resolve<int>(2)];
        let all: Promise<int[]> = Promise.all<int>(members);
        expect(promiseChecker.isPromise(all)).assertTrue();
        let values: int[] = await all;
        expect(promiseChecker.isPromise(values)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_3800
     * @tc.name testTypesIsPromise038
     * @tc.desc Merged batch (5 tests): Program integration: one shared member array drives both Promise.all and Promise.race and both combinators are promises; invoking an async function passed as an argument to another function returns a promise; the label helper classifies the detection outcome of a promise as promise and of a class instance as plain; a class method that holds its own types instance classifies a promise and a Map for a ternary label; a class method that holds its own types instance drives a switch that labels an async call result.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify one shared member array drives both Promise.all and Promise.race and both combinators are promises ---
      {
        let promiseProbe: util.types = new util.types();
        let members: Promise<int>[] = [Promise.resolve<int>(1), Promise.resolve<int>(2)];
        let all: Promise<int[]> = Promise.all<int>(members);
        let raced: Promise<int> = Promise.race<int>(members);
        expect(promiseProbe.isPromise(all)).assertTrue();
        expect(promiseProbe.isPromise(raced)).assertTrue();
        let values: int[] = await all;
        expect(values.length).assertEqual(2);
      }

      // --- [2] Verify invoking an async function passed as an argument to another function returns a promise ---
      {
        let promiseProbe: util.types = new util.types();
        let produced: Object = invokeProducer(async (): Promise<int> => { return 2; });
        expect(promiseProbe.isPromise(produced)).assertTrue();
        let value: int = await (produced as Promise<int>);
        expect(value).assertEqual(2);
      }

      // --- [3] Verify the label helper classifies the detection outcome of a promise as promise and of a class instance as plain ---
      {
        let promiseProbe: util.types = new util.types();
        let promiseLabel: string = labelForPromise(promiseProbe.isPromise(makeResolvedPromise()));
        let objectLabel: string = labelForPromise(promiseProbe.isPromise(new LabelledEntity()));
        expect(promiseLabel).assertEqual('promise');
        expect(objectLabel).assertEqual('plain');
      }

      // --- [4] Verify a class method that holds its own types instance classifies a promise and a Map for a ternary label ---
      {
        let keeper: VerdictKeeper = new VerdictKeeper();
        let label: string = keeper.classify(Promise.resolve<int>(1)) ? 'promise' : 'plain';
        expect(label).assertEqual('promise');
        let other: string = keeper.classify(new Map<string, string>()) ? 'promise' : 'plain';
        expect(other).assertEqual('plain');
      }

      // --- [5] Verify a class method that holds its own types instance drives a switch that labels an async call result ---
      {
        let keeper: VerdictKeeper = new VerdictKeeper();
        let label: string = 'pending';
        switch (keeper.classify(declareAsyncValue())) {
          case true:
            label = 'async-result';
            break;
          default:
            label = 'plain';
            break;
        }
        expect(label).assertEqual('async-result');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_3900
     * @tc.name testTypesIsPromise039
     * @tc.desc Merged batch (5 tests): Program integration: a scanning helper reports the index of the first non promise and minus one when every element is a promise; a promise whose type argument is the boolean type is recognized and its awaited flag drives a text label; accepts an unawaited async result and the label helper maps the verdict to 'promise'; an async helper that awaits inside a loop returns a promise whose awaited value is the accumulated sum; a promise passed through an echo helper is still accepted and still awaits to its original value.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify a scanning helper reports the index of the first non promise and minus one when every element is a promise ---
      {
        let mixed: Object[] = [Promise.resolve<int>(1), Promise.resolve<int>(2), 'stop', Promise.resolve<int>(4)];
        expect(firstNonPromiseAt(mixed)).assertEqual(2);
        let allPromises: Object[] = [Promise.resolve<int>(1), Promise.resolve<int>(2)];
        expect(firstNonPromiseAt(allPromises)).assertEqual(-1);
      }

      // --- [2] Verify a promise whose type argument is the boolean type is recognized and its awaited flag drives a text label ---
      {
        let promiseProbe: util.types = new util.types();
        let pending: Promise<boolean> = declareAsyncFlag();
        expect(promiseProbe.isPromise(pending)).assertTrue();
        let raised: boolean = await pending;
        let verdict: string = raised ? 'raised' : 'lowered';
        expect(verdict).assertEqual('raised');
      }

      // --- [3] Verify isPromise returns true for an unawaited async result and the label helper maps the verdict to 'promise' ---
      {
        let promiseProbe: util.types = new util.types();
        let pending: Object = declareAsyncValue();
        let hit: boolean = promiseProbe.isPromise(pending);
        expect(hit).assertTrue();
        expect(labelForPromise(hit)).assertEqual('promise');
      }

      // --- [4] Verify an async helper that awaits inside a loop returns a promise whose awaited value is the accumulated sum ---
      {
        let promiseProbe: util.types = new util.types();
        let one: Promise<int> = Promise.resolve<int>(1);
        let two: Promise<int> = Promise.resolve<int>(2);
        let produced: Object = sumAwaiting([one, two]);
        expect(promiseProbe.isPromise(produced)).assertTrue();
        let total: int = await (produced as Promise<int>);
        expect(total).assertEqual(3);
      }

      // --- [5] Verify a promise passed through an echo helper is still accepted and still awaits to its original value ---
      {
        let promiseProbe: util.types = new util.types();
        let source: Object = declareAsyncValue();
        let passed: Object = echoObject(source);
        expect(promiseProbe.isPromise(passed)).assertTrue();
        let value: int = await (passed as Promise<int>);
        expect(value).assertEqual(11);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_4000
     * @tc.name testTypesIsPromise040
     * @tc.desc Merged batch (1 test): Program integration: a wrapper returning an async call result is accepted as a promise and awaits to the relayed value.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify a wrapper returning an async call result is accepted as a promise and awaits to the relayed value ---
      {
        let promiseProbe: util.types = new util.types();
        let inner: Object = declareAsyncValue();
        let relayed: Object = relayAsync();
        let relayVerdict: boolean = promiseProbe.isPromise(relayed);
        let innerVerdict: boolean = promiseProbe.isPromise(inner);
        expect(relayVerdict).assertTrue();
        expect(innerVerdict).assertTrue();
        let value: int = await (relayed as Promise<int>);
        expect(value).assertEqual(11);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPES_IS_PROMISE_4100
     * @tc.name testTypesIsPromise041
     * @tc.desc Merged batch (1 test): Miscellaneous checks: verifies remaining edge cases, covering buffer windows and subarrays and related edge cases.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testTypesIsPromise041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an out of range DataView over a four byte buffer raises RangeError while isPromise still rejects a valid view ---
      {
        let promiseProbe: util.types = new util.types();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        try {
          new DataView(buffer, 8, 2);
          expect().assertFail();
        } catch (err) {
          expect(err.name).assertEqual('RangeError');
        }
        let view: DataView = new DataView(buffer, 0, 4);
        expect(promiseProbe.isPromise(view)).assertFalse();
      }
    });

  });
}
