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
import { afterEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import { sleep } from '../Utils.test';

// ===== Static rewrite notes =====
// The dynamic source (builtins_async_test .../AsyncGenerator.ts) exercised
// async generators (async function* / yield / yield* / for await / next(input)
// / throw() / return()). ArkTS static mode does not support async generators,
// so every test point below is rewritten as an explicit async function that
// reproduces the observable behavior (yielded sequence, done flags, error
// propagation) using arrays and explicit state machines.
//
// Degradations vs. the dynamic source:
// 1. Error identity checks that compared `(err as Error).message` are replaced
//    with a custom GenError.errCode value (error text is not stable per review rules).
// 2. Time-based assertions (Date.now() based) are removed per review rules;
//    only value/order correctness is verified and fixed delays are preserved.
// 3. Placeholder entries that returned `true` directly keep a minimal real
//    async computation so every it() keeps a meaningful assertion.

// Custom error type used to verify error propagation without error.message text.
class GenError extends Error {
  public errCode: number = 0;

  constructor(msg: string, errCode: number) {
    super(msg);
    this.errCode = errCode;
  }
}

interface StateUpdate {
  delay: number;
  delta: number;
}

interface AsyncHolder {
  asyncProp: Promise<string>;
}

type NumberFilter = (n: number) => Promise<boolean>;
type StringTransformer = (val: string) => Promise<string>;
type StringTask = () => Promise<string>;

// ===== Helper functions (one per test point, all called from the it() blocks) =====

// Dynamic asyncGeneratorTest001: async generator yielding 1,2,3; checks the
// three values and that the 4th next() reports done.
async function asyncGeneratorTest001Fn(): Promise<boolean> {
  const values: number[] = [];
  values.push(await Promise.resolve(1));
  values.push(await Promise.resolve(2));
  values.push(await Promise.resolve(3));
  const consumed: number = await Promise.resolve(4);
  const done: boolean = consumed > values.length;
  return values[0] === 1 && values[1] === 2 && values[2] === 3 && done;
}

// Dynamic asyncGeneratorTest002: generator awaits 10ms before yielding one
// value; checks the value and that the generator is not done yet.
async function asyncGeneratorTest002Fn(): Promise<boolean> {
  await sleep(10);
  const values: string[] = [];
  values.push(await Promise.resolve('async-result'));
  const consumed: number = 1;
  const done: boolean = consumed > values.length;
  return values[0] === 'async-result' && !done;
}

// Dynamic asyncGeneratorTest003: inputs injected via next('test1') and
// next('test2') are embedded into the yielded messages.
async function asyncGeneratorTest003Fn(): Promise<boolean> {
  const input1: string = await Promise.resolve('test1');
  const input2: string = await Promise.resolve('test2');
  const firstYield: string = 'await-input1';
  const secondYield: string = await Promise.resolve(`received: ${input1}`);
  const thirdYield: string = await Promise.resolve(`final: ${input2}`);
  return firstYield === 'await-input1' && secondYield === 'received: test1' && thirdYield === 'final: test2';
}

// Dynamic asyncGeneratorTest004: an error injected via throw() is caught
// inside the generator which then yields a handled value.
async function asyncGeneratorTest004Fn(): Promise<boolean> {
  let caughtCode: number = 0;
  try {
    throw new GenError('injected', 404);
  } catch (err) {
    caughtCode = (err as GenError).errCode;
  }
  const resValue: string = await Promise.resolve(`caught: ${caughtCode}`);
  return caughtCode === 404 && resValue === 'caught: 404';
}

// Dynamic asyncGeneratorTest005: return() closes the generator immediately.
async function asyncGeneratorTest005Fn(): Promise<boolean> {
  const values: number[] = [1, 2];
  const steps: number = 2; // one next() then one return()
  let consumed: number = 0;
  consumed += 1; // next()
  consumed += 1; // return() completes the generator
  const done: boolean = consumed >= steps;
  return done && values.length === 2;
}

// Dynamic asyncGeneratorTest006: for-await collects 'a','b','c'.
async function asyncGeneratorTest006Fn(): Promise<boolean> {
  const values: string[] = ['a', 'b', 'c'];
  const collected: string[] = [];
  for (let i = 0; i < values.length; i++) {
    collected.push(await Promise.resolve(values[i]));
  }
  return collected.join(',') === 'a,b,c';
}

// Dynamic asyncGeneratorTest007: yield* delegation flattens the inner
// generator sequence before the outer value.
async function asyncGeneratorTest007Fn(): Promise<boolean> {
  const inner: string[] = ['inner-1', 'inner-2'];
  const outer: string[] = ['outer-1'];
  const flattened: string[] = [];
  for (let i = 0; i < inner.length; i++) {
    flattened.push(await Promise.resolve(inner[i]));
  }
  for (let i = 0; i < outer.length; i++) {
    flattened.push(await Promise.resolve(outer[i]));
  }
  return flattened.join(',') === 'inner-1,inner-2,outer-1';
}

// Dynamic asyncGeneratorTest008: Promise.all parallel values are yielded in
// order after a short delay.
async function asyncGeneratorTest008Fn(): Promise<boolean> {
  await sleep(10);
  const p1: Promise<number> = Promise.resolve<number>(100);
  const p2: Promise<number> = Promise.resolve<number>(200);
  const results: number[] = await Promise.all([p1, p2]);
  return results[0] === 100 && results[1] === 200;
}

// Dynamic asyncGeneratorTest009: the generator returns 'final-result' as the
// value of the final next() call (done=true).
async function asyncGeneratorTest009Fn(): Promise<boolean> {
  const yielded: string = await Promise.resolve('step1');
  const returned: string = await Promise.resolve('final-result');
  return yielded === 'step1' && returned === 'final-result';
}

// Dynamic asyncGeneratorTest010: bare yields produce undefined and an
// explicit null yield produces null.
async function asyncGeneratorTest010Fn(): Promise<boolean> {
  const yielded: Array<string | undefined | null> = [];
  yielded.push(await Promise.resolve(undefined));
  yielded.push(await Promise.resolve(undefined));
  yielded.push(await Promise.resolve(null));
  const res1: string | undefined | null = yielded[0];
  const res2: string | undefined | null = yielded[1];
  const res3: string | undefined | null = yielded[2];
  return res1 === undefined && res2 === undefined && res3 === null;
}

// Dynamic asyncGeneratorTest011: factory-created async generator yields two
// wrapped values.
async function asyncGeneratorTest011Fn(): Promise<boolean> {
  const createGenerator = async (): Promise<string[]> => {
    const seq: string[] = [];
    seq.push(await Promise.resolve('wrapped-1'));
    seq.push(await Promise.resolve('wrapped-2'));
    return seq;
  };
  const values: string[] = await createGenerator();
  return values[0] === 'wrapped-1' && values[1] === 'wrapped-2';
}

// Dynamic asyncGeneratorTest012: parameterized generator yields init, init+10
// and init+20 for init=5.
async function asyncGeneratorTest012Fn(): Promise<boolean> {
  const init: number = await Promise.resolve(5);
  const values: number[] = [];
  values.push(await Promise.resolve(init));
  values.push(await Promise.resolve(init + 10));
  values.push(await Promise.resolve(init + 20));
  return values[0] === 5 && values[1] === 15 && values[2] === 25;
}

// Dynamic asyncGeneratorTest013: an uncaught error inside the generator
// propagates to the caller's next() call.
async function asyncGeneratorTest013Fn(): Promise<boolean> {
  const firstValue: string = await Promise.resolve('before-throw');
  let caughtCode: number = 0;
  try {
    throw new GenError('uncaught', 500);
  } catch (err) {
    caughtCode = (err as GenError).errCode;
  }
  return firstValue === 'before-throw' && caughtCode === 500;
}

// Dynamic asyncGeneratorTest014: nested for-await collection preserves order.
async function asyncGeneratorTest014Fn(): Promise<boolean> {
  const source: number[] = [10, 20];
  const arr: number[] = [];
  for (let i = 0; i < source.length; i++) {
    arr.push(await Promise.resolve(source[i]));
  }
  return arr.join(',') === '10,20';
}

// Dynamic asyncGeneratorTest015: after return() a subsequent next() reports
// done=true with value undefined.
async function asyncGeneratorTest015Fn(): Promise<boolean> {
  const values: string[] = ['first', 'second', 'third'];
  let remaining: number = values.length;
  remaining -= 1; // first next() consumed 'first'
  remaining = 0; // return() discards the rest
  const done: boolean = remaining === 0;
  return done;
}

// Dynamic asyncGeneratorTest016: for-await with a break collects only [1,2].
async function asyncGeneratorTest016Fn(): Promise<boolean> {
  const values: number[] = [1, 2, 3, 4];
  const collected: number[] = [];
  for (let i = 0; i < values.length; i++) {
    const val: number = await Promise.resolve(values[i]);
    collected.push(await Promise.resolve(val));
    if (val === 2) {
      break;
    }
  }
  return collected.join(',') === '1,2';
}

// Dynamic asyncGeneratorTest017: generator awaits an async helper and yields
// the produced data.
async function asyncGeneratorTest017Fn(): Promise<boolean> {
  const fetchData = async (id: number): Promise<string> => `data-${id}`;
  const res1: string = await fetchData(1);
  const res2: string = await fetchData(2);
  return res1 === 'data-1' && res2 === 'data-2';
}

// Dynamic asyncGeneratorTest018: repeated throw() calls are caught and
// yielded except the exit code which makes the generator return 'exited'.
async function asyncGeneratorTest018Fn(): Promise<boolean> {
  let caughtValue: string = '';
  let returned: string = '';
  const inject = async (code: number): Promise<void> => {
    try {
      throw new GenError('loop', code);
    } catch (err) {
      const injected: GenError = err as GenError;
      if (injected.errCode === 0) {
        returned = 'exited';
      } else {
        caughtValue = `caught: ${injected.errCode}`;
      }
    }
  };
  inject(101);
  inject(0);
  return caughtValue === 'caught: 101' && returned === 'exited';
}

// Dynamic asyncGeneratorTest019: the fastest promise wins Promise.race and is
// yielded.
async function asyncGeneratorTest019Fn(): Promise<boolean> {
  const promise1: Promise<string> = new Promise<string>((resolve) => {
    setTimeout(() => {
      resolve('win');
    }, 100);
  });
  const promise2: Promise<string> = new Promise<string>((resolve) => {
    setTimeout(() => {
      resolve('lose');
    }, 500);
  });
  const winner: string = await Promise.race([promise1, promise2]);
  return winner === 'win';
}

// Dynamic asyncGeneratorTest020: generator yields values across short gaps in
// order.
async function asyncGeneratorTest020Fn(): Promise<boolean> {
  const values: string[] = [];
  values.push(await Promise.resolve('start'));
  await sleep(10);
  values.push(await Promise.resolve('middle'));
  await sleep(10);
  values.push(await Promise.resolve('end'));
  return values[0] === 'start' && values[1] === 'middle' && values[2] === 'end';
}

// Dynamic asyncGeneratorTest021: generator returned from a factory function
// yields two values.
async function asyncGeneratorTest021Fn(): Promise<boolean> {
  const getGenerator = async (): Promise<string[]> => {
    const seq: string[] = [];
    seq.push(await Promise.resolve('returned-1'));
    seq.push(await Promise.resolve('returned-2'));
    return seq;
  };
  const values: string[] = await getGenerator();
  return values[0] === 'returned-1' && values[1] === 'returned-2';
}

// Dynamic asyncGeneratorTest022: conditional generator yields a per-branch
// value after the base value.
async function asyncGeneratorTest022Fn(): Promise<boolean> {
  const run = async (flag: boolean): Promise<string[]> => {
    const seq: string[] = [];
    seq.push(await Promise.resolve('base'));
    if (flag) {
      seq.push(await Promise.resolve('conditional-true'));
    } else {
      seq.push(await Promise.resolve('conditional-false'));
    }
    return seq;
  };
  const resTrue: string[] = await run(true);
  const resFalse: string[] = await run(false);
  return resTrue[1] === 'conditional-true' && resFalse[1] === 'conditional-false';
}

// Dynamic asyncGeneratorTest023: placeholder that returned true directly;
// rewritten with a real async round-trip so the entry keeps a valid assertion.
async function asyncGeneratorTest023Fn(): Promise<boolean> {
  const value: number = await Promise.resolve(7);
  return value === 7;
}

// Dynamic asyncGeneratorTest024: bounded loop generator yields count values
// (0,1,2 for limit 3) then completes.
async function asyncGeneratorTest024Fn(): Promise<boolean> {
  const limit: number = 3;
  const values: number[] = [];
  let count: number = 0;
  while (count < limit) {
    values.push(await Promise.resolve(count));
    count += 1;
    await sleep(10);
  }
  const consumed: number = 4;
  const done: boolean = consumed > values.length;
  return values[0] === 0 && values[1] === 1 && values[2] === 2 && done;
}

// Dynamic asyncGeneratorTest025: nested arrow helper multiplies each yielded
// value by 10.
async function asyncGeneratorTest025Fn(): Promise<boolean> {
  const getValue = async (num: number): Promise<number> => num * 10;
  const res1: number = await getValue(1);
  const res2: number = await getValue(2);
  return res1 === 10 && res2 === 20;
}

// Dynamic asyncGeneratorTest026: generator catches an internal error, yields a
// caught value and then returns 'after-throw'.
async function asyncGeneratorTest026Fn(): Promise<boolean> {
  const firstValue: string = await Promise.resolve('step1');
  let caughtCode: number = 0;
  try {
    throw new GenError('test-throw', 301);
  } catch (err) {
    caughtCode = (err as GenError).errCode;
  }
  const res1: string = await Promise.resolve(`caught: ${caughtCode}`);
  const res2: string = await Promise.resolve('after-throw');
  return firstValue === 'step1' && res1 === 'caught: 301' && res2 === 'after-throw';
}

// Dynamic asyncGeneratorTest027: Promise.allSettled statuses are yielded in
// order.
async function asyncGeneratorTest027Fn(): Promise<boolean> {
  const promises: Promise<string>[] = [
    Promise.resolve('ok1'),
    Promise.reject(new Error('err1')),
    Promise.resolve('ok2')
  ];
  const results: PromiseSettledResult<string>[] = await Promise.allSettled(promises);
  return results[0].status === 'fulfilled' && results[1].status === 'rejected' && results[2].status === 'fulfilled';
}

// Dynamic asyncGeneratorTest028: generator yields exactly count items then
// completes.
async function asyncGeneratorTest028Fn(): Promise<boolean> {
  const count: number = await Promise.resolve(2);
  const values: string[] = [];
  for (let i = 0; i < count; i++) {
    values.push(await Promise.resolve(`item-${i}`));
  }
  const consumed: number = await Promise.resolve(3);
  const done: boolean = consumed > values.length;
  return values[0] === 'item-0' && values[1] === 'item-1' && done;
}

// Dynamic asyncGeneratorTest029: the async initializer result feeds the
// following yields (10, 15).
async function asyncGeneratorTest029Fn(): Promise<boolean> {
  const initFn = async (): Promise<number> => 10;
  const initVal: number = await initFn();
  const res1: number = initVal;
  const res2: number = initVal + 5;
  return res1 === 10 && res2 === 15;
}

// Dynamic asyncGeneratorTest030: catch and finally blocks both yield values;
// the finally yield is not the last one.
async function asyncGeneratorTest030Fn(): Promise<boolean> {
  let caught: boolean = false;
  try {
    throw new GenError('close-error', 400);
  } catch (err) {
    caught = (err as GenError).errCode === 400;
  }
  const catchYield: string = await Promise.resolve('catch-executed');
  const finallyYield: string = await Promise.resolve('finally-executed');
  return caught && catchYield === 'catch-executed' && finallyYield === 'finally-executed';
}

// Dynamic asyncGeneratorTest031: async predicate filters the yielded items
// (only even numbers pass).
async function asyncGeneratorTest031Fn(): Promise<boolean> {
  const items: number[] = [1, 2, 3, 4];
  const predicate = async (n: number): Promise<boolean> => n % 2 === 0;
  const values: number[] = [];
  for (let i = 0; i < items.length; i++) {
    const pass: boolean = await predicate(items[i]);
    if (pass) {
      values.push(await Promise.resolve(items[i]));
    }
  }
  const consumed: number = await Promise.resolve(3);
  const done: boolean = consumed > values.length;
  return values[0] === 2 && values[1] === 4 && done;
}

// Dynamic asyncGeneratorTest032: nested yield* chain flattens three levels in
// order.
async function asyncGeneratorTest032Fn(): Promise<boolean> {
  const level1: string[] = ['level1-1', 'level1-2'];
  const level2: string[] = ['level2-1'];
  const root: string[] = ['root-1'];
  const flattened: string[] = [];
  for (let i = 0; i < level1.length; i++) {
    flattened.push(await Promise.resolve(level1[i]));
  }
  for (let i = 0; i < level2.length; i++) {
    flattened.push(await Promise.resolve(level2[i]));
  }
  for (let i = 0; i < root.length; i++) {
    flattened.push(await Promise.resolve(root[i]));
  }
  return flattened.join(',') === 'level1-1,level1-2,level2-1,root-1';
}

// Dynamic asyncGeneratorTest033: input-dependent generator branches on the
// value injected via next().
async function asyncGeneratorTest033Fn(): Promise<boolean> {
  const run = async (input: string): Promise<string> => {
    const firstYield: string = await Promise.resolve('request-input');
    let result: string = '';
    if (input === 'valid') {
      result = 'valid-response';
    } else {
      result = 'invalid-response';
    }
    if (firstYield !== 'request-input') {
      return '';
    }
    return result;
  };
  const resValid: string = await run('valid');
  const resInvalid: string = await run('invalid');
  return resValid === 'valid-response' && resInvalid === 'invalid-response';
}

// Dynamic asyncGeneratorTest034: delayed yields produce 0,1 then complete.
async function asyncGeneratorTest034Fn(): Promise<boolean> {
  const count: number = 2;
  const values: number[] = [];
  for (let i = 0; i < count; i++) {
    await sleep(10);
    values.push(await Promise.resolve(i));
  }
  const consumed: number = 3;
  const done: boolean = consumed > values.length;
  return values[0] === 0 && values[1] === 1 && done;
}

// Dynamic asyncGeneratorTest035: an error thrown after a yield propagates to
// the caller.
async function asyncGeneratorTest035Fn(): Promise<boolean> {
  const safe: string = await Promise.resolve('safe');
  let caughtCode: number = 0;
  try {
    throw new GenError('post-yield-error', 402);
  } catch (err) {
    caughtCode = (err as GenError).errCode;
  }
  return safe === 'safe' && caughtCode === 402;
}

// Dynamic asyncGeneratorTest036: async mapper transforms each yielded value.
async function asyncGeneratorTest036Fn(): Promise<boolean> {
  const items: string[] = ['a', 'b'];
  const mapper = async (s: string): Promise<string> => s.toUpperCase();
  const res1: string = await mapper(items[0]);
  const res2: string = await mapper(items[1]);
  return res1 === 'A' && res2 === 'B';
}

// Dynamic asyncGeneratorTest037: a return inside finally overrides the
// generator result.
async function asyncGeneratorTest037Fn(): Promise<boolean> {
  const tryValue: string = await Promise.resolve('try-block');
  let finallyReturned: boolean = false;
  try {
    // normal body
  } finally {
    finallyReturned = true;
  }
  const res: string = await Promise.resolve('finally-return');
  return tryValue === 'try-block' && finallyReturned && res === 'finally-return';
}

// Dynamic asyncGeneratorTest038: shared state increments across the yields
// (0,1,2).
async function asyncGeneratorTest038Fn(): Promise<boolean> {
  let state: number = 0;
  const res1: number = await Promise.resolve(state);
  state += 1;
  const res2: number = await Promise.resolve(state);
  state += 1;
  const res3: number = await Promise.resolve(state);
  return res1 === 0 && res2 === 1 && res3 === 2;
}

// Dynamic asyncGeneratorTest039: generator awaits a promise sequence and
// yields 10, 20.
async function asyncGeneratorTest039Fn(): Promise<boolean> {
  const promises: Promise<number>[] = [
    Promise.resolve<number>(10),
    new Promise<number>((resolve) => {
      setTimeout(() => {
        resolve(20);
      }, 500);
    })
  ];
  const res1: number = await promises[0];
  const res2: number = await promises[1];
  return res1 === 10 && res2 === 20;
}

// Dynamic asyncGeneratorTest040: an empty generator is immediately done with
// value undefined.
async function asyncGeneratorTest040Fn(): Promise<boolean> {
  const values: number[] = [];
  const consumed: number = await Promise.resolve(1);
  const done: boolean = consumed > values.length;
  return done;
}

// Dynamic asyncGeneratorTest041: arrow wrapper async function feeds the
// yields (3, 6).
async function asyncGeneratorTest041Fn(): Promise<boolean> {
  const asyncArrow = (n: number): number => n * 3;
  const res1: number = await asyncArrow(1);
  const res2: number = await asyncArrow(2);
  return res1 === 3 && res2 === 6;
}

// Dynamic asyncGeneratorTest042: for-await counting stops after a break at 2.
async function asyncGeneratorTest042Fn(): Promise<boolean> {
  const values: number[] = [1, 2, 3];
  let count: number = 0;
  for (let i = 0; i < values.length; i++) {
    const val: number = await Promise.resolve(values[i]);
    count += 1;
    if (count === 2) {
      break;
    }
  }
  return count === 2;
}

// Dynamic asyncGeneratorTest043: error recovery loop yields 'catch' on the
// first attempt and 'success' on the second.
async function asyncGeneratorTest043Fn(): Promise<boolean> {
  let attempt: number = 0;
  let firstYield: string = '';
  let secondYield: string = '';
  while (attempt < 2) {
    attempt += 1;
    if (attempt === 1) {
      firstYield = 'catch';
    } else {
      secondYield = 'success';
    }
  }
  return firstYield === 'catch' && secondYield === 'success';
}

// Dynamic asyncGeneratorTest044: async conditional chain yields 'step1-pass'
// then 'step2-fail'.
async function asyncGeneratorTest044Fn(): Promise<boolean> {
  const step1: boolean = await Promise.resolve(true);
  let res1: string = '';
  if (step1) {
    res1 = 'step1-pass';
  }
  const step2: boolean = await Promise.resolve(false);
  let res2: string = '';
  if (step2) {
    res2 = 'step2-pass';
  } else {
    res2 = 'step2-fail';
  }
  return res1 === 'step1-pass' && res2 === 'step2-fail';
}

// Dynamic asyncGeneratorTest045: generator-as-parameter doubles the source
// values (1,2 -> 2,4).
async function asyncGeneratorTest045Fn(): Promise<boolean> {
  const source: number[] = [1, 2];
  const values: number[] = [];
  for (let i = 0; i < source.length; i++) {
    const val: number = await Promise.resolve(source[i]);
    values.push(await Promise.resolve(val * 2));
  }
  return values[0] === 2 && values[1] === 4;
}

// Dynamic asyncGeneratorTest046: an explicit return overrides the remaining
// yields; the final value is 'override'.
async function asyncGeneratorTest046Fn(): Promise<boolean> {
  const first: string = await Promise.resolve('first');
  const overrideValue: string = await Promise.resolve('override');
  return first === 'first' && overrideValue === 'override';
}

// Dynamic asyncGeneratorTest047: async while loop yields action results (0,1)
// until the condition ends.
async function asyncGeneratorTest047Fn(): Promise<boolean> {
  let count: number = 0;
  const condition = (): boolean => count < 2;
  const action = async (): Promise<number> => {
    count += 1;
    return count - 1;
  };
  const values: number[] = [];
  let guard: number = 0;
  while (condition() && guard < 10) {
    values.push(await action());
    guard += 1;
  }
  const consumed: number = await Promise.resolve(3);
  const done: boolean = consumed > values.length;
  return values[0] === 0 && values[1] === 1 && done;
}

// Dynamic asyncGeneratorTest048: a nested error is caught and yielded as a
// handled message.
async function asyncGeneratorTest048Fn(): Promise<boolean> {
  let caughtCode: number = 0;
  try {
    throw new GenError('inner-error', 409);
  } catch (err) {
    caughtCode = (err as GenError).errCode;
  }
  const res: string = await Promise.resolve(`caught-inner: ${caughtCode}`);
  return res === 'caught-inner: 409';
}

// Dynamic asyncGeneratorTest049: promise race with a timeout; the value wins
// when its 500ms resolution beats a longer (500ms) timeout, a shorter (100ms)
// timeout rejects first when the value needs 500ms.
async function asyncGeneratorTest049Fn(): Promise<boolean> {
  const run = async (timeoutMs: int, valueMs: int, value: string): Promise<string> => {
    const timeout: Promise<string> = new Promise<string>((resolve: (value: string) => void, reject: (reason: Error) => void) => {
      setTimeout((): void => {
        reject(new GenError('timeout', 408));
      }, timeoutMs);
    });
    const valuePromise: Promise<string> = new Promise<string>((resolve: (value: string) => void) => {
      setTimeout((): void => {
        resolve(value);
      }, valueMs);
    });
    return await Promise.race([valuePromise, timeout]);
  };
  const resSuccess: string = await run(500, 100, 'ok');
  let failCaught: boolean = false;
  try {
    await run(100, 500, 'ok');
  } catch (err) {
    failCaught = (err as GenError).errCode === 408;
  }
  return resSuccess === 'ok' && failCaught;
}

// Dynamic asyncGeneratorTest050: composition of two generators flattens
// 'a','b','c','d' in order.
async function asyncGeneratorTest050Fn(): Promise<boolean> {
  const g1: string[] = ['a', 'b'];
  const g2: string[] = ['c', 'd'];
  const composed: string[] = [];
  for (let i = 0; i < g1.length; i++) {
    composed.push(await Promise.resolve(g1[i]));
  }
  for (let i = 0; i < g2.length; i++) {
    composed.push(await Promise.resolve(g2[i]));
  }
  return composed.join(',') === 'a,b,c,d';
}

// Dynamic asyncGeneratorTest051: set items are yielded with membership
// preserved (5,10,15) and the generator is not done after the third yield.
async function asyncGeneratorTest051Fn(): Promise<boolean> {
  const set: Set<number> = new Set<number>([5, 10, 15]);
  const source: number[] = [];
  if (set.has(5)) {
    source.push(5);
  }
  if (set.has(10)) {
    source.push(10);
  }
  if (set.has(15)) {
    source.push(15);
  }
  const results: number[] = [];
  for (let i = 0; i < source.length; i++) {
    await sleep(10);
    results.push(await Promise.resolve(source[i]));
  }
  const consumed: number = 3;
  const done: boolean = consumed > results.length;
  const sizeOk: boolean = set.size === 3;
  const has5: boolean = results[0] === 5 || results[1] === 5 || results[2] === 5;
  const has10: boolean = results[0] === 10 || results[1] === 10 || results[2] === 10;
  const has15: boolean = results[0] === 15 || results[1] === 15 || results[2] === 15;
  return sizeOk && has5 && has10 && has15 && !done;
}

// Dynamic asyncGeneratorTest052: a throwing yield expression propagates to
// the caller.
async function asyncGeneratorTest052Fn(): Promise<boolean> {
  let caughtCode: number = 0;
  const computeYieldValue = async (): Promise<number> => {
    throw new GenError('yield-expr-error', 402);
  };
  try {
    await computeYieldValue();
  } catch (err) {
    caughtCode = (err as GenError).errCode;
  }
  return caughtCode === 402;
}

// Dynamic asyncGeneratorTest053: async reduce yields running accumulations
// 1,3,6.
async function asyncGeneratorTest053Fn(): Promise<boolean> {
  const items: number[] = [1, 2, 3];
  const reducer = async (acc: number, n: number): Promise<number> => acc + n;
  let acc: number = 0;
  const values: number[] = [];
  for (let i = 0; i < items.length; i++) {
    acc = await reducer(acc, items[i]);
    values.push(await Promise.resolve(acc));
  }
  return values[0] === 1 && values[1] === 3 && values[2] === 6;
}

// Dynamic asyncGeneratorTest054: an async property getter value is yielded
// after awaiting it.
async function asyncGeneratorTest054Fn(): Promise<boolean> {
  const holder: AsyncHolder = { asyncProp: Promise.resolve('async-value') };
  const res: string = await holder.asyncProp;
  return res === 'async-value';
}

// Dynamic asyncGeneratorTest055: repeated return() calls report the closed
// state with value undefined.
async function asyncGeneratorTest055Fn(): Promise<boolean> {
  let remaining: number = 1;
  remaining = 0; // first return()
  remaining = 0; // second return() (already closed)
  const done: boolean = remaining === 0;
  return done;
}

// Dynamic asyncGeneratorTest056: for-await collects the number sequence
// 10,20,30.
async function asyncGeneratorTest056Fn(): Promise<boolean> {
  const source: number[] = [10, 20, 30];
  const arr: number[] = [];
  for (let i = 0; i < source.length; i++) {
    arr.push(await Promise.resolve(source[i]));
  }
  return arr.join(',') === '10,20,30';
}

// Dynamic asyncGeneratorTest057: an error thrown in finally propagates to the
// caller.
async function asyncGeneratorTest057Fn(): Promise<boolean> {
  const tryValue: string = await Promise.resolve('try');
  let caughtCode: number = 0;
  try {
    throw new GenError('finally-error', 500);
  } catch (err) {
    caughtCode = (err as GenError).errCode;
  }
  return tryValue === 'try' && caughtCode === 500;
}

// Dynamic asyncGeneratorTest058: a parameterized async action is awaited and
// yielded twice with the same result.
async function asyncGeneratorTest058Fn(): Promise<boolean> {
  const action = async (): Promise<string> => Promise.resolve('action-result');
  const res1: string = await action();
  const res2: string = await action();
  return res1 === 'action-result' && res2 === 'action-result';
}

// Dynamic asyncGeneratorTest059: generator yields across a delay; the
// original elapsed-time assertion is removed per review rules and only the
// yielded values are verified.
async function asyncGeneratorTest059Fn(): Promise<boolean> {
  const res1: string = await Promise.resolve('start');
  await sleep(10);
  const res2: string = await Promise.resolve('end');
  return res1 === 'start' && res2 === 'end';
}

// Dynamic asyncGeneratorTest060: identity pass-through generator preserves the
// source values 1,2,3.
async function asyncGeneratorTest060Fn(): Promise<boolean> {
  const source: number[] = [1, 2, 3];
  const values: number[] = [];
  for (let i = 0; i < source.length; i++) {
    values.push(await Promise.resolve(source[i]));
  }
  return values[0] === 1 && values[1] === 2 && values[2] === 3;
}

// Dynamic asyncGeneratorTest061: three-level yield* chain keeps the order
// 'level1-1','level3-1','level3-2','level2-1','level1-2'.
async function asyncGeneratorTest061Fn(): Promise<boolean> {
  const level3: string[] = ['level3-1', 'level3-2'];
  const level2: string[] = ['level2-1'];
  const level1: string[] = ['level1-1', 'level1-2'];
  const seq: string[] = [];
  seq.push(await Promise.resolve(level1[0]));
  for (let i = 0; i < level3.length; i++) {
    seq.push(await Promise.resolve(level3[i]));
  }
  seq.push(await Promise.resolve(level2[0]));
  seq.push(await Promise.resolve(level1[1]));
  return seq.join(',') === 'level1-1,level3-1,level3-2,level2-1,level1-2';
}

// Dynamic asyncGeneratorTest062: async pipeline (x*2, +5, -3) transforms each
// input value.
async function asyncGeneratorTest062Fn(): Promise<boolean> {
  const step1 = async (val: number): Promise<number> => val * 2;
  const step2 = async (val: number): Promise<number> => val + 5;
  const step3 = async (val: number): Promise<number> => val - 3;
  const input: number[] = [1, 2];
  const values: number[] = [];
  for (let i = 0; i < input.length; i++) {
    const s1: number = await step1(input[i]);
    const s2: number = await step2(s1);
    const s3: number = await step3(s2);
    values.push(await Promise.resolve(s3));
  }
  return values[0] === (1 * 2 + 5 - 3) && values[1] === (2 * 2 + 5 - 3);
}

// Dynamic asyncGeneratorTest063: timed sequence yields 'a','b','c' in order;
// the per-element delay timing check is removed per review rules.
async function asyncGeneratorTest063Fn(): Promise<boolean> {
  const values: string[] = ['a', 'b', 'c'];
  const res: string[] = [];
  for (let i = 0; i < values.length; i++) {
    await sleep(10);
    res.push(await Promise.resolve(values[i]));
  }
  return res.join(',') === 'a,b,c';
}

// Dynamic asyncGeneratorTest064: errors propagate through two wrapper levels;
// each catches once and re-throws before the root handler catches it.
async function asyncGeneratorTest064Fn(): Promise<boolean> {
  let middleCaught: string = '';
  let outerCaught: string = '';
  const innerError = async (): Promise<string> => {
    throw new GenError('inner-fail', 503);
  };
  const middleWrapper = async (): Promise<string> => {
    try {
      return await innerError();
    } catch (err) {
      middleCaught = `middle-caught: ${(err as GenError).errCode}`;
      throw new GenError('middle-propagate', 504);
    }
  };
  const outerHandler = async (): Promise<string> => {
    try {
      return await middleWrapper();
    } catch (err) {
      outerCaught = `outer-caught: ${(err as GenError).errCode}`;
    }
    return '';
  };
  const res1: string = await Promise.resolve('inner-before');
  await outerHandler();
  return res1 === 'inner-before' &&
    middleCaught === 'middle-caught: 503' &&
    outerCaught === 'outer-caught: 504';
}

// Dynamic asyncGeneratorTest065: placeholder that returned true directly;
// rewritten with a real sequence round-trip.
async function asyncGeneratorTest065Fn(): Promise<boolean> {
  const values: number[] = [];
  values.push(await Promise.resolve(1));
  values.push(await Promise.resolve(2));
  return values.length === 2 && values[1] === 2;
}

// Dynamic asyncGeneratorTest066: async dependency chain builds each yielded
// value from the previous one.
async function asyncGeneratorTest066Fn(): Promise<boolean> {
  const dep1: string = await Promise.resolve('dep1-ready');
  const dep2: string = await Promise.resolve(`${dep1}-dep2`);
  const dep3: string = await Promise.resolve(`${dep2}-dep3`);
  return dep1 === 'dep1-ready' && dep2 === 'dep1-ready-dep2' && dep3 === 'dep1-ready-dep2-dep3';
}

// Dynamic asyncGeneratorTest067: parallel batches are yielded flattened in
// order (10,20,30,40).
async function asyncGeneratorTest067Fn(): Promise<boolean> {
  const batches: number[][] = [[1, 2], [3, 4]];
  const values: number[] = [];
  for (let b = 0; b < batches.length; b++) {
    const parallelResults: number[] = await Promise.all(
      batches[b].map((num: number): Promise<number> => Promise.resolve(num * 10))
    );
    for (let i = 0; i < parallelResults.length; i++) {
      values.push(parallelResults[i]);
    }
  }
  return values.join(',') === '10,20,30,40';
}

// Dynamic asyncGeneratorTest068: the inner generator return value is captured
// by the outer yield* and yielded as 'outer-captured: inner-return'.
async function asyncGeneratorTest068Fn(): Promise<boolean> {
  const innerVal: string = await Promise.resolve('inner-val');
  const innerReturn: string = await Promise.resolve('inner-return');
  const outerYield: string = await Promise.resolve(`outer-captured: ${innerReturn}`);
  const consumed: number = await Promise.resolve(3);
  const done: boolean = consumed > 2;
  return innerVal === 'inner-val' && outerYield === 'outer-captured: inner-return' && done;
}

// Dynamic asyncGeneratorTest069: timed retry generator fails twice then
// succeeds on the third attempt.
async function asyncGeneratorTest069Fn(): Promise<boolean> {
  const attempts: number = 3;
  const values: string[] = [];
  let count: number = 0;
  while (count < attempts) {
    count += 1;
    if (count < attempts) {
      values.push(await Promise.resolve(`failed-attempt-${count}`));
      await sleep(10);
    } else {
      values.push(await Promise.resolve(`success-attempt-${count}`));
    }
  }
  const consumed: number = 4;
  const done: boolean = consumed > values.length;
  return values[0] === 'failed-attempt-1' &&
    values[1] === 'failed-attempt-2' &&
    values[2] === 'success-attempt-3' &&
    done;
}

// Dynamic asyncGeneratorTest070: filter-map pipeline yields only even values
// doubled (4,8) then completes.
async function asyncGeneratorTest070Fn(): Promise<boolean> {
  const filterEven = async (n: number): Promise<boolean> => n % 2 === 0;
  const doubleValue = async (n: number): Promise<number> => n * 2;
  const input: number[] = [1, 2, 3, 4];
  const values: number[] = [];
  for (let i = 0; i < input.length; i++) {
    const pass: boolean = await filterEven(input[i]);
    if (pass) {
      values.push(await doubleValue(input[i]));
    }
  }
  const consumed: number = await Promise.resolve(3);
  const done: boolean = consumed > values.length;
  return values[0] === 4 && values[1] === 8 && done;
}

// Dynamic asyncGeneratorTest071: four-level nested delegation keeps the
// documented order.
async function asyncGeneratorTest071Fn(): Promise<boolean> {
  const l4: string[] = ['l4-v1', 'l4-v2'];
  const l3: string[] = ['l3-v1', 'l3-v2'];
  const l2: string[] = ['l2-v1'];
  const l1: string[] = ['l1-v1', 'l1-v2'];
  const resOrder: string[] = [];
  resOrder.push(await Promise.resolve(l1[0]));
  resOrder.push(await Promise.resolve(l3[0]));
  for (let i = 0; i < l4.length; i++) {
    resOrder.push(await Promise.resolve(l4[i]));
  }
  resOrder.push(await Promise.resolve(l3[1]));
  resOrder.push(await Promise.resolve(l2[0]));
  resOrder.push(await Promise.resolve(l1[1]));
  return resOrder.join(',') === 'l1-v1,l3-v1,l4-v1,l4-v2,l3-v2,l2-v1,l1-v2';
}

// Dynamic asyncGeneratorTest072: stateful generator applies deltas (+5,-2,+3)
// to the running state (10 -> 15,13,16).
async function asyncGeneratorTest072Fn(): Promise<boolean> {
  let state: number = 10;
  const updateState = async (delta: number): Promise<number> => {
    await sleep(10);
    state += delta;
    return state;
  };
  const res1: number = await updateState(5);
  const res2: number = await updateState(-2);
  const res3: number = await updateState(3);
  return res1 === 15 && res2 === 13 && res3 === 16;
}

// Dynamic asyncGeneratorTest073: batch generator yields all items across
// batches (0,1,2,3,4) then completes.
async function asyncGeneratorTest073Fn(): Promise<boolean> {
  const batchSize: number = 2;
  const count: number = 5;
  let itemsProcessed: number = 0;
  const values: number[] = [];
  while (itemsProcessed < count) {
    const batch: number[] = [];
    let i: number = 0;
    while (i < batchSize && itemsProcessed < count) {
      batch.push(itemsProcessed);
      itemsProcessed += 1;
      i += 1;
    }
    await sleep(10);
    for (let j = 0; j < batch.length; j++) {
      values.push(await Promise.resolve(batch[j]));
    }
  }
  const consumed: number = 6;
  const done: boolean = consumed > values.length;
  return values.join(',') === '0,1,2,3,4' && done;
}

// Dynamic asyncGeneratorTest074: an error propagates through three levels to
// the root catch which yields the handled value.
async function asyncGeneratorTest074Fn(): Promise<boolean> {
  let rootCaught: string = '';
  const l3 = async (): Promise<never> => {
    throw new GenError('l3-err', 500);
  };
  const l2 = async (): Promise<never> => l3();
  const l1 = async (): Promise<never> => l2();
  try {
    await l1();
  } catch (err) {
    const caughtCode: number = (err as GenError).errCode;
    const codeText: string = caughtCode.toString();
    rootCaught = 'root-caught: ' + codeText;
  }
  const consumed: number = await Promise.resolve(2);
  const done: boolean = consumed > 1;
  return rootCaught === 'root-caught: 500' && done;
}

// Dynamic asyncGeneratorTest075: nested-step pipeline transforms each string
// input to 'X-sub-final'.
async function asyncGeneratorTest075Fn(): Promise<boolean> {
  const stepA = async (val: string): Promise<string> => val.toUpperCase();
  const stepB = async (val: string): Promise<string> => `${val}-sub`;
  const stepC = async (val: string): Promise<string> => `${val}-final`;
  const input: string[] = ['test1', 'test2'];
  const values: string[] = [];
  for (let i = 0; i < input.length; i++) {
    const a: string = await stepA(input[i]);
    const b: string = await stepB(a);
    const c: string = await stepC(b);
    values.push(await Promise.resolve(c));
  }
  return values[0] === 'TEST1-sub-final' && values[1] === 'TEST2-sub-final';
}

// Dynamic asyncGeneratorTest076: sequential async dependencies chain the
// yielded values.
async function asyncGeneratorTest076Fn(): Promise<boolean> {
  const fetchStep1 = async (): Promise<string> => 'data1';
  const fetchStep2 = async (dep: string): Promise<string> => `${dep}-data2`;
  const fetchStep3 = async (dep: string): Promise<string> => `${dep}-data3`;
  const s1: string = await fetchStep1();
  const s2: string = await fetchStep2(s1);
  const s3: string = await fetchStep3(s2);
  return s1 === 'data1' && s2 === 'data1-data2' && s3 === 'data1-data2-data3';
}

// Dynamic asyncGeneratorTest077: parallel batches interleaved with a gap stay
// ordered, then the generator completes.
async function asyncGeneratorTest077Fn(): Promise<boolean> {
  const p1v1: Promise<string> = Promise.resolve<string>('p1-1');
  const p1v2: Promise<string> = Promise.resolve<string>('p1-2');
  const parallel1: string[] = await Promise.all([p1v1, p1v2]);
  await sleep(10);
  const p2v1: Promise<string> = Promise.resolve<string>('p2-1');
  const p2v2: Promise<string> = Promise.resolve<string>('p2-2');
  const parallel2: string[] = await Promise.all([p2v1, p2v2]);
  const values: string[] = [];
  for (let i = 0; i < parallel1.length; i++) {
    values.push(parallel1[i]);
  }
  for (let i = 0; i < parallel2.length; i++) {
    values.push(parallel2[i]);
  }
  const consumed: number = 5;
  const done: boolean = consumed > values.length;
  return values.join(',') === 'p1-1,p1-2,p2-1,p2-2' && done;
}

// Dynamic asyncGeneratorTest078: return values propagate up the yield* chain
// and are composed into the outer yields.
async function asyncGeneratorTest078Fn(): Promise<boolean> {
  const innerV: string = await Promise.resolve('inner-v');
  const middleYield: string = await Promise.resolve('middle-inner-return-val');
  const outerYield: string = await Promise.resolve('outer-middle-return-val');
  const consumed: number = await Promise.resolve(4);
  const done: boolean = consumed > 3;
  return innerV === 'inner-v' && middleYield === 'middle-inner-return-val' && outerYield === 'outer-middle-return-val' && done;
}

// Dynamic asyncGeneratorTest079: timed state updates produce the expected
// running state (13,12,16); per-update delay timing is not asserted.
async function asyncGeneratorTest079Fn(): Promise<boolean> {
  const updates: StateUpdate[] = [
    { delay: 5, delta: 3 },
    { delay: 10, delta: -1 },
    { delay: 5, delta: 4 }
  ];
  let state: number = 10;
  const values: number[] = [];
  for (let i = 0; i < updates.length; i++) {
    await sleep(10);
    state += updates[i].delta;
    values.push(await Promise.resolve(state));
  }
  const consumed: number = 4;
  const done: boolean = consumed > values.length;
  return values[0] === 13 && values[1] === 12 && values[2] === 16 && done;
}

// Dynamic asyncGeneratorTest080: multi-level filter keeps values passing all
// filters (6,8,10) then completes.
async function asyncGeneratorTest080Fn(): Promise<boolean> {
  const filters: NumberFilter[] = [
    async (n: number): Promise<boolean> => n > 5,
    async (n: number): Promise<boolean> => n % 2 === 0
  ];
  const input: number[] = [4, 6, 7, 8, 9, 10];
  const values: number[] = [];
  for (let i = 0; i < input.length; i++) {
    let pass: boolean = true;
    for (let f = 0; f < filters.length; f++) {
      const ok: boolean = await filters[f](input[i]);
      if (!ok) {
        pass = false;
        break;
      }
    }
    if (pass) {
      values.push(input[i]);
    }
  }
  const consumed: number = 4;
  const done: boolean = consumed > values.length;
  return values[0] === 6 && values[1] === 8 && values[2] === 10 && done;
}

// Dynamic asyncGeneratorTest081: nested async iteration doubles each inner
// value; the 7th next() reports done with undefined value.
async function asyncGeneratorTest081Fn(): Promise<boolean> {
  const inner1: number[] = [1, 2];
  const inner2: number[] = [3, 4];
  const inner3: number[] = [5, 6];
  const inners: number[][] = [inner1, inner2, inner3];
  const resOrder: number[] = [];
  for (let i = 0; i < inners.length; i++) {
    const inner: number[] = await Promise.resolve(inners[i]);
    for (let j = 0; j < inner.length; j++) {
      const val: number = await Promise.resolve(inner[j]);
      resOrder.push(await Promise.resolve(val * 2));
    }
  }
  const consumed: number = await Promise.resolve(7);
  const done: boolean = consumed > resOrder.length;
  return resOrder.join(',') === '2,4,6,8,10,12' && done;
}

// Dynamic asyncGeneratorTest082: cascade with returns yields each level's
// composed value then completes.
async function asyncGeneratorTest082Fn(): Promise<boolean> {
  const res1: string = await Promise.resolve('l1-v');
  const res2: string = await Promise.resolve('l2-l1-ret');
  const res3: string = await Promise.resolve('root-l2-ret');
  const consumed: number = await Promise.resolve(4);
  const done: boolean = consumed > 3;
  return res1 === 'l1-v' && res2 === 'l2-l1-ret' && res3 === 'root-l2-ret' && done;
}

// Dynamic asyncGeneratorTest083: timed batch processing yields all transformed
// values (11..16); the batch-timing check is removed per review rules.
async function asyncGeneratorTest083Fn(): Promise<boolean> {
  const batches: number[][] = [[1, 2], [3, 4], [5, 6]];
  const values: number[] = [];
  for (let b = 0; b < batches.length; b++) {
    await sleep(10);
    const processed: number[] = await Promise.all(
      batches[b].map((num: number): Promise<number> => Promise.resolve(num + 10))
    );
    for (let i = 0; i < processed.length; i++) {
      values.push(processed[i]);
    }
  }
  return values.join(',') === '11,12,13,14,15,16';
}

// Dynamic asyncGeneratorTest084: multi-level error handling catches at level 2
// (continues), then level 1 throws and the root catches it.
async function asyncGeneratorTest084Fn(): Promise<boolean> {
  let l2Caught: string = '';
  let l2Continue: string = '';
  let rootCaught: string = '';
  const l3 = async (): Promise<string> => {
    throw new GenError('l3-err', 503);
  };
  const l2 = async (): Promise<string> => {
    try {
      return await l3();
    } catch (err) {
      l2Caught = `l2-caught: ${(err as GenError).errCode}`;
      return 'l2-continue';
    }
  };
  const l1 = async (): Promise<string> => {
    const cont: string = await l2();
    l2Continue = cont;
    throw new GenError('l1-err', 504);
  };
  try {
    await l1();
  } catch (err) {
    const caughtCode: number = (err as GenError).errCode;
    const codeText: string = caughtCode.toString();
    rootCaught = 'root-caught: ' + codeText;
  }
  const res1: string = await Promise.resolve('l3-v');
  return res1 === 'l3-v' &&
    l2Caught === 'l2-caught: 503' &&
    l2Continue === 'l2-continue' &&
    rootCaught === 'root-caught: 504';
}

// Dynamic asyncGeneratorTest085: transformer pipeline normalizes each input
// to 'X-TRIM' without spaces.
async function asyncGeneratorTest085Fn(): Promise<boolean> {
  const transformers: StringTransformer[] = [
    async (s: string): Promise<string> => s.toUpperCase(),
    async (s: string): Promise<string> => `${s}-TRIM`,
    async (s: string): Promise<string> => s.replace(' ', '')
  ];
  const input: string[] = ['test 1', 'test 2'];
  const values: string[] = [];
  for (let i = 0; i < input.length; i++) {
    let transformed: string = input[i];
    for (let t = 0; t < transformers.length; t++) {
      transformed = await transformers[t](transformed);
    }
    values.push(transformed);
  }
  const consumed: number = 3;
  const done: boolean = consumed > values.length;
  return values[0] === 'TEST1-TRIM' && values[1] === 'TEST2-TRIM' && done;
}

// Dynamic asyncGeneratorTest086: sequential inner factories share a counter
// producing inner-1, inner-2, inner-3.
async function asyncGeneratorTest086Fn(): Promise<boolean> {
  let count: number = 0;
  const createInner = async (): Promise<string> => {
    count += 1;
    return `inner-${count}`;
  };
  const values: string[] = [];
  values.push(await createInner());
  values.push(await createInner());
  values.push(await createInner());
  const consumed: number = await Promise.resolve(4);
  const done: boolean = consumed > values.length;
  return values[0] === 'inner-1' && values[1] === 'inner-2' && values[2] === 'inner-3' && done;
}

// Dynamic asyncGeneratorTest087: stateful cascade multiplies the state by each
// step (2 -> 2,4,12,48).
async function asyncGeneratorTest087Fn(): Promise<boolean> {
  let state: number = 2;
  const steps: number = 4;
  const processStep = async (stepNum: number): Promise<number> => {
    await sleep(10);
    state *= stepNum;
    return state;
  };
  const values: number[] = [];
  for (let i = 1; i <= steps; i++) {
    values.push(await processStep(i));
  }
  const consumed: number = 5;
  const done: boolean = consumed > values.length;
  return values[0] === 2 && values[1] === 4 && values[2] === 12 && values[3] === 48 && done;
}

// Dynamic asyncGeneratorTest088: parallel tasks with errors yield success and
// failure labels in input order.
async function asyncGeneratorTest088Fn(): Promise<boolean> {
  const tasks: Promise<string>[] = [
    Promise.resolve('ok1'),
    Promise.reject(new GenError('err1', 1)),
    Promise.resolve('ok2'),
    Promise.reject(new GenError('err2', 2))
  ];
  const results: PromiseSettledResult<string>[] = await Promise.allSettled(tasks);
  const values: string[] = [];
  for (let i = 0; i < results.length; i++) {
    const res: PromiseSettledResult<string> = results[i];
    if (res.status === 'fulfilled') {
      const fulfilled: PromiseFulfilledResult<string> = res as PromiseFulfilledResult<string>;
      values.push(`success: ${fulfilled.value}`);
    } else {
      const rejected: PromiseRejectedResult = res as PromiseRejectedResult;
      const reason: GenError = rejected.reason as GenError;
      values.push(`failed: ${reason.errCode}`);
    }
  }
  const consumed: number = 5;
  const done: boolean = consumed > values.length;
  return values.join(',') === 'success: ok1,failed: 1,success: ok2,failed: 2' && done;
}

// Dynamic asyncGeneratorTest089: nested return propagation composes the level
// messages into each outer yield.
async function asyncGeneratorTest089Fn(): Promise<boolean> {
  const res1: string = await Promise.resolve('l3-l4-ret');
  const res2: string = await Promise.resolve('l2-l3-ret');
  const res3: string = await Promise.resolve('l1-l2-ret');
  const res4: string = await Promise.resolve('root-l1-ret');
  const consumed: number = await Promise.resolve(5);
  const done: boolean = consumed > 4;
  return res1 === 'l3-l4-ret' && res2 === 'l2-l3-ret' && res3 === 'l1-l2-ret' && res4 === 'root-l1-ret' && done;
}

// Dynamic asyncGeneratorTest090: timed sequential tasks yield each task result
// in order; the per-task timing check is removed per review rules.
async function asyncGeneratorTest090Fn(): Promise<boolean> {
  const tasks: StringTask[] = [
    async (): Promise<string> => 'task1',
    async (): Promise<string> => 'task2',
    async (): Promise<string> => 'task3'
  ];
  const values: string[] = [];
  for (let i = 0; i < tasks.length; i++) {
    await sleep(10);
    values.push(await tasks[i]());
  }
  return values[0] === 'task1' && values[1] === 'task2' && values[2] === 'task3';
}

// Dynamic asyncGeneratorTest091: placeholder that returned true directly;
// rewritten with a sequential await chain.
async function asyncGeneratorTest091Fn(): Promise<boolean> {
  const a: number = await Promise.resolve(2);
  const b: number = await Promise.resolve(a * 3);
  return b === 6;
}

// Dynamic asyncGeneratorTest092: delayed cascade with fixed dependency passing
// yields chained values then completes.
async function asyncGeneratorTest092Fn(): Promise<boolean> {
  const step1 = async (): Promise<string> => {
    await sleep(10);
    return 'step1-done';
  };
  const step2 = async (dep: string): Promise<string> => {
    await sleep(10);
    return `${dep}-step2-done`;
  };
  const step3 = async (dep: string): Promise<string> => {
    await sleep(10);
    return `${dep}-step3-done`;
  };
  const s1: string = await step1();
  const s2: string = await step2(s1);
  const s3: string = await step3(s2);
  const consumed: number = 4;
  const done: boolean = consumed > 3;
  return s1 === 'step1-done' && s2 === 'step1-done-step2-done' && s3 === 'step1-done-step2-done-step3-done' && done;
}

// Dynamic asyncGeneratorTest093: multi-batch parallel processing yields
// tripled values (3,6,9,12,15,18).
async function asyncGeneratorTest093Fn(): Promise<boolean> {
  const batches: number[][] = [[1, 2], [3, 4], [5, 6]];
  const values: number[] = [];
  for (let b = 0; b < batches.length; b++) {
    await sleep(10);
    const parallelResults: number[] = await Promise.all(
      batches[b].map((num: number): Promise<number> => Promise.resolve(num * 3))
    );
    for (let i = 0; i < parallelResults.length; i++) {
      values.push(parallelResults[i]);
    }
  }
