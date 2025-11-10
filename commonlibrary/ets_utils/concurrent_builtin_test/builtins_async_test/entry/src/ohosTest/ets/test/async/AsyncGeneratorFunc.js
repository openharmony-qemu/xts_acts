// Get AsyncGeneratorFunction constructor (per MDN recommendation)
const  AsyncGeneratorFunction = (async function* () {}).constructor;

export async function AsyncGeneratorFuncTest001() {
  const genFunc = new AsyncGeneratorFunction(`yield await Promise.resolve('test');`);
  const gen = genFunc();
  const res = await gen.next();
  return res.value === 'test' && res.done === false;
}

export async function AsyncGeneratorFuncTest002() {
  const genFunc = new AsyncGeneratorFunction(`
    yield await Promise.resolve(1);
    yield await Promise.resolve(2);
    yield await Promise.resolve(3);
  `);
  const gen = genFunc();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 1 && res2.value === 2 && res3.value === 3;
}

export async function AsyncGeneratorFuncTest003() {
  const genFunc = new AsyncGeneratorFunction('a', 'b', `
    yield await Promise.resolve(a + b);
    yield await Promise.resolve(a * b);
  `);
  const gen = genFunc(2, 3);
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 5 && res2.value === 6;
}

export async function AsyncGeneratorFuncTest004() {
  const genFunc = new AsyncGeneratorFunction(`yield 'prototype-test';`);
  return genFunc instanceof Function && genFunc instanceof AsyncGeneratorFunction;
}

export async function AsyncGeneratorFuncTest005() {
  return AsyncGeneratorFunction.prototype.constructor === AsyncGeneratorFunction;
}

export async function AsyncGeneratorFuncTest006() {
  const genFunc = new AsyncGeneratorFunction();
  return genFunc[Symbol.toStringTag] === 'AsyncGeneratorFunction';
}

export async function AsyncGeneratorFuncTest007() {
  const genFunc = new AsyncGeneratorFunction(`yield 'instance-test';`);
  const gen = genFunc();
  return gen[Symbol.toStringTag] === 'AsyncGenerator';
}

export async function AsyncGeneratorFuncTest008() {
  const genFunc = new AsyncGeneratorFunction(`
    try {
      throw new Error('test-error');
    } catch (err) {
      yield await Promise.resolve(err.message);
    }
  `);
  const gen = genFunc();
  const res = await gen.next();
  return res.value === 'test-error';
}

export async function AsyncGeneratorFuncTest009() {
  const genFunc = new AsyncGeneratorFunction(`
    yield 'before-return';
    return 'return-value';
  `);
  const gen = genFunc();
  await gen.next();
  const res = await gen.next();
  return res.value === 'return-value' && res.done === true;
}

export async function AsyncGeneratorFuncTest010() {
  const genFunc = new AsyncGeneratorFunction(`
    const delay = (ms: number) => new Promise(resolve => setTimeout(resolve, ms));
    await delay(10);
    yield 'delayed-result';
  `);
  const gen = genFunc();
  const res = await gen.next();
  return res.value === 'delayed-result';
}

export async function AsyncGeneratorFuncTest011() {
  const genFunc = new AsyncGeneratorFunction();
  const gen = genFunc();
  return Object.getPrototypeOf(gen) === genFunc.prototype;
}

export async function AsyncGeneratorFuncTest012() {
  const genFunc1 = new AsyncGeneratorFunction();
  const genFunc2 = new AsyncGeneratorFunction();
  return Object.getPrototypeOf(genFunc1.prototype) === Object.getPrototypeOf(genFunc2.prototype);
}

export async function AsyncGeneratorFuncTest013() {
  const genFunc = new AsyncGeneratorFunction(`
    yield 'a';
    yield 'b';
    yield 'c';
  `);
  let result = '';
  for await (const val of genFunc()) {
    result += val;
  }
  return result === 'abc';
}

export async function AsyncGeneratorFuncTest014() {
  const genFunc = new AsyncGeneratorFunction(`
    while (true) {
      try {
        yield 'loop';
      } catch (err) {
        yield err.message;
        break;
      }
    }
  `);
  const gen = genFunc();
  await gen.next();
  const res = await gen.throw(new Error('stop-loop'));
  return res.value === 'stop-loop';
}

export async function AsyncGeneratorFuncTest015() {
  const genFunc = new AsyncGeneratorFunction('multiplier', `
    yield await Promise.resolve(2 * multiplier);
    yield await Promise.resolve(3 * multiplier);
  `);
  const gen = genFunc(4);
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 8 && res2.value === 12;
}

export async function AsyncGeneratorFuncTest016() {
  const genFunc = new AsyncGeneratorFunction();
  const gen = genFunc();
  const res = await gen.next();
  return res.done === true && res.value === undefined;
}

export async function AsyncGeneratorFuncTest017() {
  const genFunc = new AsyncGeneratorFunction(`
    const promises = [Promise.resolve(10), Promise.resolve(20), Promise.resolve(30)];
    const results = await Promise.all(promises);
    yield* results;
  `);
  const gen = genFunc();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 10 && res2.value === 20 && res3.value === 30;
}

export async function AsyncGeneratorFuncTest018() {
  const genFunc = new AsyncGeneratorFunction(`yield 'inherit-test';`);
  return genFunc.hasOwnProperty('length') && genFunc.toString().startsWith('async function*');
}

export async function AsyncGeneratorFuncTest019() {
  const genFunc = new AsyncGeneratorFunction('count', `
    for (let i = 0; i < count; i++) {
      yield i;
    }
  `);
  const gen = genFunc(3);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  return res1.value === 0 && res2.value === 1 && res3.value === 2 && res4.done === true;
}

export async function AsyncGeneratorFuncTest020() {
  const genFunc = new AsyncGeneratorFunction(`
    const fetchData = async (id: number) => \`data-\${id}\`;
    yield await fetchData(1);
    yield await fetchData(2);
  `);
  const gen = genFunc();
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 'data-1' && res2.value === 'data-2';
}

export async function AsyncGeneratorFuncTest021() {
  const genFunc = new AsyncGeneratorFunction(`yield 'proto-mod-test';`);
  genFunc.prototype.customMethod = () => 'custom';
  const gen = genFunc();
  return (gen).customMethod() === 'custom';
}

export async function AsyncGeneratorFuncTest022() {
  const genFunc = new AsyncGeneratorFunction(`
    const p1 = new Promise(resolve => setTimeout(resolve, 10, 'win'));
    const p2 = new Promise(resolve => setTimeout(resolve, 20, 'lose'));
    const winner = await Promise.race([p1, p2]);
    yield winner;
  `);
  const gen = genFunc();
  const res = await gen.next();
  return res.value === 'win';
}

export async function AsyncGeneratorFuncTest023() {
  const genFunc = new AsyncGeneratorFunction('flag', `
    yield 'base';
    if (flag) {
      yield 'flag-true';
    } else {
      yield 'flag-false';
    }
  `);
  const genTrue = genFunc(true);
  const genFalse = genFunc(false);
  await genTrue.next();
  await genFalse.next();
  const resTrue = await genTrue.next();
  const resFalse = await genFalse.next();
  return resTrue.value === 'flag-true' && resFalse.value === 'flag-false';
}

export async function AsyncGeneratorFuncTest024() {
  const genFunc = new AsyncGeneratorFunction('a', 'b', `
    const sum = await Promise.resolve(a + b);
    const diff = await Promise.resolve(a - b);
    yield { sum, diff };
    yield sum * diff;
  `);
  const gen = genFunc(5, 3);
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value?.sum === 8 && res1.value?.diff === 2 && res2.value === 16;
}

export async function AsyncGeneratorFuncTest025() {
  const genFunc = new AsyncGeneratorFunction(`
    try {
      yield 'try-block';
    } finally {
      return 'finally-return';
    }
  `);
  const gen = genFunc();
  await gen.next();
  const res = await gen.next();
  return res.value === 'finally-return' && res.done === true;
}

export async function AsyncGeneratorFuncTest026() {
  const innerGenFunc = new AsyncGeneratorFunction(`yield 'inner';`);
  const outerGenFunc = new AsyncGeneratorFunction(`
    yield* innerGenFunc();
    yield 'outer';
  `);
  const gen = outerGenFunc();
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 'inner' && res2.value === 'outer';
}

export async function AsyncGeneratorFuncTest027() {
  const genFunc = new AsyncGeneratorFunction('items', `
    const asyncForEach = async (arr: number[], callback: (item: number) => Promise<void>) => {
      for (const item of arr) await callback(item);
    };
    const results: number[] = [];
    await asyncForEach(items, async (item) => results.push(item * 2));
    yield* results;
  `);
  const gen = genFunc([1, 2, 3]);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 2 && res2.value === 4 && res3.value === 6;
}

export async function AsyncGeneratorFuncTest028() {
  const genFunc = new AsyncGeneratorFunction(`
    const throwError = async () => { throw new Error('propagate'); };
    try {
      await throwError();
    } catch (err) {
      throw err;
    }
  `);
  const gen = genFunc();
  try {
    await gen.next();
    return false;
  } catch (err) {
    return (err).message === 'propagate';
  }
}

export async function AsyncGeneratorFuncTest029() {
  const paramNames = ['x', 'y'];
  const genFunc = new AsyncGeneratorFunction(...paramNames, `
    yield await Promise.resolve(x + y);
  `);
  const gen = genFunc(10, 20);
  const res = await gen.next();
  return res.value === 30;
}

export async function AsyncGeneratorFuncTest030() {
  const yieldStatements = Array.from({ length: 5 }, (_, i) => `yield await Promise.resolve(${i});`).join('\n');
  const genFunc = new AsyncGeneratorFunction(yieldStatements);
  const gen = genFunc();
  const results = [];
  for (let i = 0; i < 5; i++) {
    results.push((await gen.next()).value);
  }
  return JSON.stringify(results) === JSON.stringify([0, 1, 2, 3, 4]);
}


export async function AsyncGeneratorFuncTest031() {
  const genFunc = new AsyncGeneratorFunction('nums', `
    const double = (n: number) => n * 2;
    const asyncFilter = async (arr: number[], predicate: (n: number) => boolean) =>
      arr.filter(predicate);
    const filtered = await asyncFilter(nums, n => n % 2 === 0);
    yield* filtered.map(double);
  `);
  const gen = genFunc([1, 2, 3, 4, 5]);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  return res1.value === 4 && res2.value === 8 && res3.done === false && res4.done === true;
}

export async function AsyncGeneratorFuncTest032() {
  const genFunc = new AsyncGeneratorFunction(`
    const nestedGen = async function* (start: number) {
      yield start;
      yield start + 10;
    };
    yield* nestedGen(5);
    yield* nestedGen(20);
  `);
  const gen = genFunc();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  return res1.value === 5 && res2.value === 15 && res3.value === 20 && res4.value === 30;
}

export async function AsyncGeneratorFuncTest033() {
  const genFunc = new AsyncGeneratorFunction('delayMs', `
    const timer = (ms: number) => new Promise(resolve => setTimeout(resolve, ms));
    const start = Date.now();
    await timer(delayMs);
    yield Date.now() - start >= delayMs - 1 && Date.now() - start <= delayMs + 1;
  `);
  const gen = genFunc(10);
  const res = await gen.next();
  return res.value === true;
}

export async function AsyncGeneratorFuncTest034() {
  const genFunc = new AsyncGeneratorFunction('a', 'b', 'c', `
    const calculate = async (x: number, y: number, z: number) => {
      const sum = x + y + z;
      const product = x * y * z;
      return { sum, product };
    };
    const result = await calculate(a, b, c);
    yield result.sum;
    yield result.product;
  `);
  const gen = genFunc(2, 3, 4);
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 9 && res2.value === 24;
}

export async function AsyncGeneratorFuncTest035() {
  const genFunc = new AsyncGeneratorFunction(`
    try {
      const throwAsync = async () => {
        await Promise.resolve();
        throw new Error('async-error');
      };
      await throwAsync();
    } catch (err) {
      yield (err as Error).message;
    }
  `);
  const gen = genFunc();
  const res = await gen.next();
  return res.value === 'async-error';
}

export async function AsyncGeneratorFuncTest036() {
  const genFunc = new AsyncGeneratorFunction('limit', `
    let count = 0;
    while (count < limit) {
      yield count;
      count++;
      await new Promise(resolve => setTimeout(resolve, 1));
    }
  `);
  const gen = genFunc(3);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  return res1.value === 0 && res2.value === 1 && res3.value === 2 && res4.done === true;
}

export async function AsyncGeneratorFuncTest037() {
  const genFunc = new AsyncGeneratorFunction(`
    const compose = async (f: (x: string) => string, g: (x: string) => string, val: string) =>
      f(g(val));
    const upper = (s: string) => s.toUpperCase();
    const prefix = (s: string) => \`prefix-\${s}\`;
    yield await compose(upper, prefix, 'test');
  `);
  const gen = genFunc();
  const res = await gen.next();
  return res.value === 'PREFIX-TEST';
}

export async function AsyncGeneratorFuncTest038() {
  const genFunc = new AsyncGeneratorFunction('arr', `
    const asyncMap = async (array: number[], mapper: (n: number) => Promise<number>) =>
      Promise.all(array.map(mapper));
    const mapped = await asyncMap(arr, async (n) => n * 3);
    yield* mapped;
  `);
  const gen = genFunc([1, 2, 3]);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 3 && res2.value === 6 && res3.value === 9;
}

export async function AsyncGeneratorFuncTest039() {
  const genFunc = new AsyncGeneratorFunction(`
    yield 'first';
    return 'return-val';
    yield 'unreachable';
  `);
  const gen = genFunc();
  await gen.next();
  const res = await gen.next();
  return res.value === 'return-val' && res.done === true;
}

export async function AsyncGeneratorFuncTest040() {
  const genFunc = new AsyncGeneratorFunction('obj', `
    const getAsyncProp = async (o: { prop: Promise<string> }) => await o.prop;
    yield await getAsyncProp(obj);
  `);
  const gen = genFunc({ prop: Promise.resolve('async-prop') });
  const res = await gen.next();
  return res.value === 'async-prop';
}

export async function AsyncGeneratorFuncTest041() {
  const genFunc = new AsyncGeneratorFunction(`
    const level1 = async function* () {
      const level2 = async function* () {
        yield 'nested';
      };
      yield* level2();
    };
    yield* level1();
  `);
  const gen = genFunc();
  const res = await gen.next();
  return res.value === 'nested' && res.done === false;
}

export async function AsyncGeneratorFuncTest042() {
  const genFunc = new AsyncGeneratorFunction('a', 'b', `
    const add = async (x: number, y: number) => x + y;
    const subtract = async (x: number, y: number) => x - y;
    yield await add(a, b);
    yield await subtract(a, b);
  `);
  const gen = genFunc(10, 4);
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 14 && res2.value === 6;
}

export async function AsyncGeneratorFuncTest043() {
  const genFunc = new AsyncGeneratorFunction(`
    let state = 0;
    const update = async (delta: number) => {
      state += delta;
      return state;
    };
    yield await update(5);
    yield await update(3);
    yield await update(-2);
  `);
  const gen = genFunc();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 5 && res2.value === 8 && res3.value === 6;
}

export async function AsyncGeneratorFuncTest044() {
  const genFunc = new AsyncGeneratorFunction('promises', `
    const race = await Promise.race(promises as Promise<string>[]);
    yield race;
  `);
  const promises = [
    new Promise((resolve) => setTimeout(resolve, 5, 'winner')),
    new Promise((resolve) => setTimeout(resolve, 10, 'loser'))
  ];
  const gen = genFunc(promises);
  const res = await gen.next();
  return res.value === 'winner';
}

export async function AsyncGeneratorFuncTest045() {
  const genFunc = new AsyncGeneratorFunction(`
    const gen = async function* (items: string[]) {
      for (const item of items) {
        yield item.toUpperCase();
      }
    };
    const results: string[] = [];
    for await (const val of gen(['a', 'b', 'c'])) {
      results.push(val);
    }
    yield results.join('');
  `);
  const gen = genFunc();
  const res = await gen.next();
  return res.value === 'ABC';
}

export async function AsyncGeneratorFuncTest046() {
  const genFunc = new AsyncGeneratorFunction('n', `
    const factorial = async (num: number): Promise<number> => {
      if (num <= 1) return 1;
      return num * await factorial(num - 1);
    };
    yield await factorial(n);
  `);
  const gen = genFunc(5);
  const res = await gen.next();
  return res.value === 120;
}

export async function AsyncGeneratorFuncTest047() {
  const genFunc = new AsyncGeneratorFunction(`
    try {
      yield 'before-throw';
      throw new Error('sync-error');
    } catch (err) {
      yield (err as Error).message;
    }
  `);
  const gen = genFunc();
  await gen.next();
  const res = await gen.next();
  return res.value === 'sync-error';
}

export async function AsyncGeneratorFuncTest048() {
  const genFunc = new AsyncGeneratorFunction('arr1', 'arr2', `
    const merge = async (a: number[], b: number[]) => [...a, ...b];
    const merged = await merge(arr1, arr2);
    yield* merged;
  `);
  const gen = genFunc([1, 2], [3, 4]);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  return res1.value === 1 && res2.value === 2 && res3.value === 3 && res4.value === 4;
}

export async function AsyncGeneratorFuncTest049() {
  const genFunc = new AsyncGeneratorFunction(`
    const delay = (ms: number) => new Promise(resolve => setTimeout(resolve, ms));
    yield 'step1';
    await delay(5);
    yield 'step2';
    await delay(5);
    yield 'step3';
  `);
  const gen = genFunc();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 'step1' && res2.value === 'step2' && res3.value === 'step3';
}

export async function AsyncGeneratorFuncTest050() {
  const genFunc = new AsyncGeneratorFunction('key', 'value', `
    const createObj = async (k: string, v: number) => ({ [k]: v });
    const obj = await createObj(key, value);
    yield obj[key];
  `);
  const gen = genFunc('count', 100);
  const res = await gen.next();
  return res.value === 100;
}

export async function AsyncGeneratorFuncTest051() {
  const genFunc = new AsyncGeneratorFunction(`
    const gen1 = async function* () { yield 1; yield 2; };
    const gen2 = async function* () { yield 3; yield 4; };
    yield* gen1();
    yield* gen2();
  `);
  const gen = genFunc();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  return res1.value === 1 && res2.value === 2 && res3.value === 3 && res4.value === 4;
}

export async function AsyncGeneratorFuncTest052() {
  const genFunc = new AsyncGeneratorFunction('str', `
    const splitAsync = async (s: string) => s.split('');
    const chars = await splitAsync(str);
    yield* chars;
  `);
  const gen = genFunc('test');
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  return res1.value === 't' && res2.value === 'e' && res3.value === 's' && res4.value === 't';
}

export async function AsyncGeneratorFuncTest053() {
  const genFunc = new AsyncGeneratorFunction(`
    const throwLater = async () => {
      await new Promise(resolve => setTimeout(resolve, 5));
      throw new Error('delayed-error');
    };
    try {
      await throwLater();
    } catch (err) {
      yield (err as Error).message;
    }
  `);
  const gen = genFunc();
  const res = await gen.next();
  return res.value === 'delayed-error';
}

export async function AsyncGeneratorFuncTest054() {
  const genFunc = new AsyncGeneratorFunction('nums', `
    const sumAsync = async (arr: number[]) => arr.reduce((a, b) => a + b, 0);
    const sum = await sumAsync(nums);
    yield sum;
    yield sum * 2;
  `);
  const gen = genFunc([1, 2, 3, 4]);
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 10 && res2.value === 20;
}

export async function AsyncGeneratorFuncTest055() {
  const genFunc = new AsyncGeneratorFunction(`
    const nested = async function* (depth: number) {
      yield \`depth-\${depth}\`;
      if (depth < 3) yield* nested(depth + 1);
    };
    yield* nested(1);
  `);
  const gen = genFunc();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 'depth-1' && res2.value === 'depth-2' && res3.value === 'depth-3';
}

export async function AsyncGeneratorFuncTest056() {
  const genFunc = new AsyncGeneratorFunction('bool', `
    const conditional = async (b: boolean) => b ? 'true-val' : 'false-val';
    yield await conditional(bool);
  `);
  const genTrue = genFunc(true);
  const genFalse = genFunc(false);
  const resTrue = await genTrue.next();
  const resFalse = await genFalse.next();
  return resTrue.value === 'true-val' && resFalse.value === 'false-val';
}

export async function AsyncGeneratorFuncTest057() {
  const genFunc = new AsyncGeneratorFunction(`
    const promiseAll = await Promise.all([
      Promise.resolve(10),
      Promise.resolve(20),
      Promise.resolve(30)
    ]);
    yield* promiseAll;
  `);
  const gen = genFunc();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 10 && res2.value === 20 && res3.value === 30;
}

export async function AsyncGeneratorFuncTest058() {
  const genFunc = new AsyncGeneratorFunction('num', `
    const square = async (n: number) => n * n;
    const cube = async (n: number) => n * n * n;
    yield await square(num);
    yield await cube(num);
  `);
  const gen = genFunc(4);
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 16 && res2.value === 64;
}

export async function AsyncGeneratorFuncTest059() {
  const genFunc = new AsyncGeneratorFunction(`
    let count = 0;
    const interval = setInterval(() => count++, 1);
    await new Promise(resolve => setTimeout(resolve, 5));
    clearInterval(interval);
    yield count >= 4 && count <= 6;
  `);
  const gen = genFunc();
  const res = await gen.next();
  return res.value === true;
}

export async function AsyncGeneratorFuncTest060() {
  const genFunc = new AsyncGeneratorFunction('arr', `
    const filterAsync = async (array: string[], predicate: (s: string) => boolean) =>
      array.filter(predicate);
    const filtered = await filterAsync(arr, s => s.length > 3);
    yield* filtered;
  `);
  const gen = genFunc(['a', 'bb', 'ccc', 'dddd', 'eeeee']);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 'dddd' && res2.value === 'eeeee' && res3.done === true;
}


export async function AsyncGeneratorFuncTest061() {
  const genFunc = new AsyncGeneratorFunction('items', `
    const asyncFlatMap = async (arr: number[][], mapper: (n: number) => number) =>
      arr.flat().map(mapper);
    const result = await asyncFlatMap(items, n => n * 2);
    yield* result;
  `);
  const gen = genFunc([[1, 2], [3, 4], [5]]);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  const res5 = await gen.next();
  return res1.value === 2 && res2.value === 4 && res3.value === 6 && res4.value === 8 && res5.value === 10;
}

export async function AsyncGeneratorFuncTest062() {
  const genFunc = new AsyncGeneratorFunction(`
    const level1 = async function* () {
      const level2 = async function* () {
        const level3 = async function* () {
          yield 'three-level-nested';
        };
        yield* level3();
      };
      yield* level2();
    };
    yield* level1();
  `);
  const gen = genFunc();
  const res = await gen.next();
  return res.value === 'three-level-nested' && res.done === false;
}

export async function AsyncGeneratorFuncTest063() {
  const genFunc = new AsyncGeneratorFunction('a', 'b', `
    const asyncCompare = async (x: number, y: number) => ({
      equal: x === y,
      greater: x > y,
      less: x < y
    });
    const comparison = await asyncCompare(a, b);
    yield comparison.equal;
    yield comparison.greater;
    yield comparison.less;
  `);
  const gen = genFunc(5, 3);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === false && res2.value === true && res3.value === false;
}

export async function AsyncGeneratorFuncTest064() {
  const genFunc = new AsyncGeneratorFunction(`
    const delay = (ms: number) => new Promise(resolve => setTimeout(resolve, ms));
    const sequence = [
      { delay: 3, value: 'a' },
      { delay: 2, value: 'b' },
      { delay: 4, value: 'c' }
    ];
    for (const item of sequence) {
      await delay(item.delay);
      yield item.value;
    }
  `);
  const gen = genFunc();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 'a' && res2.value === 'b' && res3.value === 'c';
}

export async function AsyncGeneratorFuncTest065() {
  const genFunc = new AsyncGeneratorFunction('strs', `
    const asyncJoin = async (arr: string[], separator: string) => arr.join(separator);
    const joined = await asyncJoin(strs, '-');
    yield joined;
    yield joined.toUpperCase();
  `);
  const gen = genFunc(['hello', 'world', 'test']);
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 'hello-world-test' && res2.value === 'HELLO-WORLD-TEST';
}

export async function AsyncGeneratorFuncTest066() {
  const genFunc = new AsyncGeneratorFunction(`
    let state = { count: 0 };
    const updateState = async (delta: number) => {
      state.count += delta;
      return { ...state };
    };
    yield (await updateState(2)).count;
    yield (await updateState(3)).count;
    yield (await updateState(-1)).count;
  `);
  const gen = genFunc();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 2 && res2.value === 5 && res3.value === 4;
}

export async function AsyncGeneratorFuncTest067() {
  const genFunc = new AsyncGeneratorFunction('promises', `
    const settled = await Promise.allSettled(promises as Promise<number>[]);
    for (const res of settled) {
      yield res.status === 'fulfilled' ? res.value : 'rejected';
    }
  `);
  const promises = [
    Promise.resolve(10),
    Promise.reject(new Error('fail')),
    Promise.resolve(20)
  ];
  const gen = genFunc(promises);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 10 && res2.value === 'rejected' && res3.value === 20;
}

export async function AsyncGeneratorFuncTest068() {
  const genFunc = new AsyncGeneratorFunction('num', `
    const asyncRange = async (n: number) => Array.from({ length: n }, (_, i) => i);
    const range = await asyncRange(num);
    yield* range;
  `);
  const gen = genFunc(4);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  return res1.value === 0 && res2.value === 1 && res3.value === 2 && res4.value === 3;
}

export async function AsyncGeneratorFuncTest069() {
  const genFunc = new AsyncGeneratorFunction(`
    try {
      const nestedThrow = async function* () {
        yield 'before-nested-throw';
        throw new Error('nested-error');
      };
      yield* nestedThrow();
    } catch (err) {
      yield (err as Error).message;
    }
  `);
  const gen = genFunc();
  await gen.next();
  const res = await gen.next();
  return res.value === 'nested-error';
}

export async function AsyncGeneratorFuncTest070() {
  const genFunc = new AsyncGeneratorFunction('obj', 'keys', `
    const getAsyncValues = async (o: Record<string, number>, k: string[]) =>
      k.map(key => o[key]);
    const values = await getAsyncValues(obj, keys as string[]);
    yield* values;
  `);
  const gen = genFunc({ a: 10, b: 20, c: 30 }, ['b', 'a', 'c']);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 20 && res2.value === 10 && res3.value === 30;
}

export async function AsyncGeneratorFuncTest071() {
  const genFunc = new AsyncGeneratorFunction(`
    const delay = (ms: number) => new Promise(resolve => setTimeout(resolve, ms));
    const parallelTasks = [
      delay(5).then(() => 'task1'),
      delay(3).then(() => 'task2'),
      delay(7).then(() => 'task3')
    ];
    const results = await Promise.all(parallelTasks);
    yield* results;
  `);
  const gen = genFunc();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 'task1' && res2.value === 'task2' && res3.value === 'task3';
}

export async function AsyncGeneratorFuncTest072() {
  const genFunc = new AsyncGeneratorFunction('num1', 'num2', `
    const asyncGcd = async (a: number, b: number): Promise<number> => {
      if (b === 0) return a;
      return asyncGcd(b, a % b);
    };
    yield await asyncGcd(num1, num2);
  `);
  const gen = genFunc(12, 18);
  const res = await gen.next();
  return res.value === 6;
}

export async function AsyncGeneratorFuncTest073() {
  const genFunc = new AsyncGeneratorFunction(`
    const genA = async function* () { yield 'a1'; yield 'a2'; };
    const genB = async function* () { yield 'b1'; yield* genA(); yield 'b2'; };
    yield* genB();
  `);
  const gen = genFunc();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  return res1.value === 'b1' && res2.value === 'a1' && res3.value === 'a2' && res4.value === 'b2';
}

export async function AsyncGeneratorFuncTest074() {
  const genFunc = new AsyncGeneratorFunction('str', 'times', `
    const asyncRepeat = async (s: string, n: number) => Array(n).fill(s);
    const repeated = await asyncRepeat(str, times as number);
    yield* repeated;
  `);
  const gen = genFunc('test', 3);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 'test' && res2.value === 'test' && res3.value === 'test';
}

export async function AsyncGeneratorFuncTest075() {
  const genFunc = new AsyncGeneratorFunction(`
    const throwAfterDelay = async () => {
      await new Promise(resolve => setTimeout(resolve, 5));
      throw new Error('delayed-throw');
    };
    try {
      yield* (async function* () { await throwAfterDelay(); })();
    } catch (err) {
      yield (err as Error).message;
    }
  `);
  const gen = genFunc();
  const res = await gen.next();
  return res.value === 'delayed-throw';
}

export async function AsyncGeneratorFuncTest076() {
  const genFunc = new AsyncGeneratorFunction('nums', `
    const asyncSumOfSquares = async (arr: number[]) =>
      arr.reduce(async (acc, curr) => (await acc) + curr * curr, Promise.resolve(0));
    yield await asyncSumOfSquares(nums);
  `);
  const gen = genFunc([1, 2, 3]);
  const res = await gen.next();
  return res.value === 14;
}

export async function AsyncGeneratorFuncTest077() {
  const genFunc = new AsyncGeneratorFunction(`
    const level1 = async function* (val: string) {
      yield \`level1-\${val}\`;
      yield* (async function* () {
        yield \`level2-\${val}\`;
      })();
    };
    yield* level1('test');
  `);
  const gen = genFunc();
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 'level1-test' && res2.value === 'level2-test';
}

export async function AsyncGeneratorFuncTest078() {
  const genFunc = new AsyncGeneratorFunction('dateStr', `
    const parseAsync = async (s: string) => new Date(s);
    const date = await parseAsync(dateStr);
    yield date.getFullYear() === 2024;
    yield date.getMonth() === 0; // January is 0
  `);
  const gen = genFunc('2024-01-15');
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === true && res2.value === true;
}

export async function AsyncGeneratorFuncTest079() {
  const genFunc = new AsyncGeneratorFunction(`
    let count = 0;
    const intervalGen = async function* (ms: number, limit: number) {
      return new Promise(resolve => {
        const interval = setInterval(() => {
          if (count < limit) {
            this.next(count++);
          } else {
            clearInterval(interval);
            resolve(count);
          }
        }, ms);
      });
    };
    await intervalGen(1, 3);
    yield count === 3;
  `);
  const gen = genFunc();
  const res = await gen.next();
  return res.value === true;
}

export async function AsyncGeneratorFuncTest080() {
  const genFunc = new AsyncGeneratorFunction('arr', `
    const asyncUnique = async (array: number[]) => [...new Set(array)];
    const unique = await asyncUnique(arr);
    yield* unique;
  `);
  const gen = genFunc([1, 2, 2, 3, 3, 3]);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 1 && res2.value === 2 && res3.value === 3;
}

export async function AsyncGeneratorFuncTest081() {
  const genFunc = new AsyncGeneratorFunction('a', 'b', 'c', `
    const asyncCalculate = async (x: number, y: number, z: number) => {
      const sum = x + y + z;
      const avg = sum / 3;
      const product = x * y * z;
      return [sum, avg, product];
    };
    const results = await asyncCalculate(a, b, c);
    yield* results;
  `);
  const gen = genFunc(3, 6, 9);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 18 && res2.value === 6 && res3.value === 162;
}

export async function AsyncGeneratorFuncTest082() {
  const genFunc = new AsyncGeneratorFunction(`
    const nestedGen = async function* (depth: number) {
      yield depth;
      if (depth < 2) yield* nestedGen(depth + 1);
      yield -depth;
    };
    yield* nestedGen(0);
  `);
  const gen = genFunc();
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  const res5 = await gen.next();
  return res1.value === 0 && res2.value === 1 && res3.value === 2 && res4.value === -1 && res5.value === -0;
}

export async function AsyncGeneratorFuncTest083() {
  const genFunc = new AsyncGeneratorFunction('str', `
    const asyncReverse = async (s: string) => s.split('').reverse().join('');
    const reversed = await asyncReverse(str);
    yield reversed;
    yield reversed.toUpperCase();
  `);
  const gen = genFunc('hello');
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 'olleh' && res2.value === 'OLLEH';
}

export async function AsyncGeneratorFuncTest084() {
  const genFunc = new AsyncGeneratorFunction('nums', `
    const asyncFilterMap = async (
      arr: number[],
      filter: (n: number) => boolean,
      map: (n: number) => number
    ) => arr.filter(filter).map(map);
    const result = await asyncFilterMap(nums, n => n > 5, n => n - 5);
    yield* result;
  `);
  const gen = genFunc([3, 6, 8, 4, 10]);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 1 && res2.value === 3 && res3.value === 5;
}

export async function AsyncGeneratorFuncTest085() {
  const genFunc = new AsyncGeneratorFunction(`
    try {
      await (async function* () {
        throw new Error('immediate-throw');
      })().next();
    } catch (err) {
      yield (err as Error).message;
    }
  `);
  const gen = genFunc();
  const res = await gen.next();
  return res.value === 'immediate-throw';
}

export async function AsyncGeneratorFuncTest086() {
  const genFunc = new AsyncGeneratorFunction('obj', `
    const getAsyncNestedProp = async (o: { nested: { prop: number } }) => o.nested.prop;
    yield await getAsyncNestedProp(obj);
  `);
  const gen = genFunc({ nested: { prop: 42 } });
  const res = await gen.next();
  return res.value === 42;
}

export async function AsyncGeneratorFuncTest087() {
  const genFunc = new AsyncGeneratorFunction(`
    const delay = (ms: number) => new Promise(resolve => setTimeout(resolve, ms));
    const sequence = async function* () {
      yield 'start';
      await delay(2);
      yield 'middle';
      await delay(3);
      yield 'end';
    };
    const results: string[] = [];
    for await (const val of sequence()) {
      results.push(val);
    }
    yield results.join(',');
  `);
  const gen = genFunc();
  const res = await gen.next();
  return res.value === 'start,middle,end';
}

export async function AsyncGeneratorFuncTest088() {
  const genFunc = new AsyncGeneratorFunction('num', `
    const asyncFactorial = async (n: number): Promise<number> => {
      if (n <= 1) return 1;
      return n * await asyncFactorial(n - 1);
    };
    yield await asyncFactorial(num);
    yield await asyncFactorial(num + 1);
  `);
  const gen = genFunc(4);
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 24 && res2.value === 120;
}

export async function AsyncGeneratorFuncTest089() {
  const genFunc = new AsyncGeneratorFunction(`
    const gen1 = async function* () { yield 10; yield 20; };
    const gen2 = async function* (g: AsyncGenerator<number>) {
      for await (const val of g) {
        yield val * 2;
      }
    };
    yield* gen2(gen1());
  `);
  const gen = genFunc();
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 20 && res2.value === 40;
}

export async function AsyncGeneratorFuncTest090() {
  const genFunc = new AsyncGeneratorFunction('strs', `
    const asyncSort = async (arr: string[]) => [...arr].sort();
    const sorted = await asyncSort(strs);
    yield* sorted;
  `);
  const gen = genFunc(['banana', 'apple', 'cherry']);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  return res1.value === 'apple' && res2.value === 'banana' && res3.value === 'cherry';
}

export async function AsyncGeneratorFuncTest091() {
  const genFunc = new AsyncGeneratorFunction('a', 'b', `
    const asyncPower = async (base: number, exp: number) => Math.pow(base, exp);
    yield await asyncPower(a, b);
    yield await asyncPower(b, a);
  `);
  const gen = genFunc(2, 3);
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 8 && res2.value === 9;
}

export async function AsyncGeneratorFuncTest092() {
  const genFunc = new AsyncGeneratorFunction(`
    const nestedError = async function* () {
      try {
        yield 'before-error';
        throw new Error('inner-nested-error');
      } catch (err) {
        yield (err as Error).message;
        throw new Error('propagated-error');
      }
    };
    try {
      yield* nestedError();
    } catch (err) {
      yield (err as Error).message;
    }
  `);
  const gen = genFunc();
  await gen.next();
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 'inner-nested-error' && res2.value === 'propagated-error';
}

export async function AsyncGeneratorFuncTest093() {
  const genFunc = new AsyncGeneratorFunction('nums', `
    const asyncMax = async (arr: number[]) => Math.max(...arr);
    const asyncMin = async (arr: number[]) => Math.min(...arr);
    yield await asyncMax(nums);
    yield await asyncMin(nums);
  `);
  const gen = genFunc([5, 2, 9, 1, 7]);
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 9 && res2.value === 1;
}

export async function AsyncGeneratorFuncTest094() {
  const genFunc = new AsyncGeneratorFunction(`
    const gen = async function* (items: number[]) {
      for (const item of items) {
        yield item;
        await new Promise(resolve => setTimeout(resolve, 1));
      }
    };
    const results: number[] = [];
    for await (const val of gen([1, 2, 3])) {
      results.push(val);
    }
    yield JSON.stringify(results) === '[1,2,3]';
  `);
  const gen = genFunc();
  const res = await gen.next();
  return res.value === true;
}

export async function AsyncGeneratorFuncTest095() {
  const genFunc = new AsyncGeneratorFunction('str', `
    const asyncCharCode = async (s: string) => s.split('').map(c => c.charCodeAt(0));
    const codes = await asyncCharCode(str);
    yield* codes;
  `);
  const gen = genFunc('AB');
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 65 && res2.value === 66;
}

export async function AsyncGeneratorFuncTest096() {
  const genFunc = new AsyncGeneratorFunction('promises', `
    const race = await Promise.race(promises as Promise<{ value: string; delay: number }>[]);
    yield race.value;
    yield race.delay;
  `);
  const promises = [
    new Promise(resolve => setTimeout(() => resolve({ value: 'fast', delay: 2 }), 2)),
    new Promise(resolve => setTimeout(() => resolve({ value: 'slow', delay: 5 }), 5))
  ];
  const gen = genFunc(promises);
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === 'fast' && res2.value === 2;
}

export async function AsyncGeneratorFuncTest097() {
  const genFunc = new AsyncGeneratorFunction(`
    const level1 = async function* () {
      yield 'l1';
      yield* (async function* () {
        yield 'l2';
        yield* (async function* () {
          yield 'l3';
        })();
      })();
    };
    const results: string[] = [];
    for await (const val of level1()) {
      results.push(val);
    }
    yield results.join('') === 'l1l2l3';
  `);
  const gen = genFunc();
  const res = await gen.next();
  return res.value === true;
}

export async function AsyncGeneratorFuncTest098() {
  const genFunc = new AsyncGeneratorFunction('num', `
    const asyncIsPrime = async (n: number): Promise<boolean> => {
      if (n <= 1) return false;
      for (let i = 2; i <= Math.sqrt(n); i++) {
        if (n % i === 0) return false;
      }
      return true;
    };
    yield await asyncIsPrime(num);
  `);
  const genPrime = genFunc(7);
  const genNotPrime = genFunc(4);
  const resPrime = await genPrime.next();
  const resNotPrime = await genNotPrime.next();
  return resPrime.value === true && resNotPrime.value === false;
}

export async function AsyncGeneratorFuncTest099() {
  const genFunc = new AsyncGeneratorFunction('arr', `
    const asyncFlatten = async (array: any[]) => array.flat(Infinity);
    const flattened = await asyncFlatten(arr);
    yield* flattened;
  `);
  const gen = genFunc([1, [2, [3, 4], 5]]);
  const res1 = await gen.next();
  const res2 = await gen.next();
  const res3 = await gen.next();
  const res4 = await gen.next();
  const res5 = await gen.next();
  return res1.value === 1 && res2.value === 2 && res3.value === 3 && res4.value === 4 && res5.value === 5;
}

export async function AsyncGeneratorFuncTest100() {
  const genFunc = new AsyncGeneratorFunction(`
    const delay = (ms: number) => new Promise(resolve => setTimeout(resolve, ms));
    const start = Date.now();
    await delay(10);
    const end = Date.now();
    yield end - start >= 9 && end - start <= 11;
    yield (async function* () { return 'done'; })().next().then(res => res.value) === 'done';
  `);
  const gen = genFunc();
  const res1 = await gen.next();
  const res2 = await gen.next();
  return res1.value === true && res2.value === true;
}