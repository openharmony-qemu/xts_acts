export async function PromiseTryTest001() {
  const syncFunc = (a, b) => a + b;
  const promise = Promise.try(syncFunc, 3, 5);

  const result = await promise;
  return promise instanceof Promise && result === 8;
}

export async function PromiseTryTest002() {
  const errorFunc = (msg) => {
    throw new Error(msg);
  };
  const promise = Promise.try(errorFunc, 'Sync error occurred');

  const result = await Promise.allSettled([promise]);
  const rejectedResult = result[0];

  return rejectedResult.status === 'rejected' &&
    rejectedResult.reason.message === 'Sync error occurred';
}

export async function PromiseTryTest003() {
  const asyncFunc = async (delay, value) => {
    await new Promise(resolve => setTimeout(resolve, delay));
    return `Resolved: ${value}`;
  };
  const start = Date.now();
  const promise = Promise.try(asyncFunc, 15, 'test');

  const result = await promise;
  const end = Date.now();

  return result === 'Resolved: test' && (end - start) >= 15;
}

export async function PromiseTryTest004() {
  const errorFunc = () => {
    throw new Error('Uncaught sync error');
  };

  const tryPromise = Promise.try(errorFunc);
  const tryResult = await Promise.allSettled([tryPromise]);
  const tryRejected = tryResult[0].reason.message === 'Uncaught sync error';

  let resolveError = null;
  try {
    Promise.resolve(errorFunc());
  } catch (err) {
    resolveError = err;
  }
  const resolveThrew = resolveError?.message === 'Uncaught sync error';

  return tryRejected && resolveThrew;
}

export async function PromiseTryTest005() {
  const mixedErrorFunc = (isAsync, shouldThrow) => {
    if (shouldThrow && !isAsync) {
      throw new Error('Sync error');
    }
    return new Promise((resolve, reject) => {
      if (shouldThrow && isAsync) {
        setTimeout(() => reject(new Error('Async error')), 10);
      } else {
        setTimeout(() => resolve('Success'), 10);
      }
    });
  };

  const syncErrResult = await Promise.try(mixedErrorFunc, false, true).catch(err => err.message);
  const asyncErrResult = await Promise.try(mixedErrorFunc, true, true).catch(err => err.message);
  const successResult = await Promise.try(mixedErrorFunc, true, false).catch(err => err.message);

  return syncErrResult === 'Sync error' &&
    asyncErrResult === 'Async error' &&
    successResult === 'Success';
}

export async function PromiseTryTest006() {
  const multiArgFunc = (a, b, c) => {
    return `${a}-${b}-${c}`;
  };
  const promise = Promise.try(multiArgFunc, 'test', 42, true);

  const result = await promise;
  return result === 'test-42-true';
}

export async function PromiseTryTest007() {
  let cleanupExecuted = false;
  const cleanup = () => {
    cleanupExecuted = true;
  };

  await Promise.try(() => 'Success').finally(cleanup);
  const syncCleanup = cleanupExecuted;

  cleanupExecuted = false;
  await Promise.try(async () => {
    await new Promise(resolve => setTimeout(resolve, 5));
    throw new Error('Fail');
  }).catch(() => {}).finally(cleanup);
  const asyncCleanup = cleanupExecuted;

  return syncCleanup && asyncCleanup;
}

export async function PromiseTryTest008() {
  class CustomPromise extends Promise {
    static try(func, ...args) {
      return super.try(func, ...args);
    }
  }

  const customPromise = CustomPromise.try(() => 'Custom resolved');
  const result = await customPromise;

  return customPromise instanceof CustomPromise &&
    customPromise.constructor === CustomPromise &&
    result === 'Custom resolved';
}

export async function PromiseTryTest009() {
  const rejectedPromiseFunc = (msg) => {
    return Promise.reject(new Error(msg));
  };
  const promise = Promise.try(rejectedPromiseFunc, 'Async rejection');

  const result = await Promise.allSettled([promise]);
  const rejectedResult = result[0];

  return rejectedResult.status === 'rejected' &&
    rejectedResult.reason.message === 'Async rejection';
}

export async function PromiseTryTest010() {
  const executionOrder = [];

  Promise.try(() => {
    executionOrder.push('Promise.try func');
    return 'try result';
  });

  Promise.resolve().then(() => {
    executionOrder.push('Promise.resolve then');
  });

  executionOrder.push('Sync code');

  await new Promise(resolve => setTimeout(resolve, 0));

  return JSON.stringify(executionOrder) === JSON.stringify(['Promise.try func', 'Sync code', 'Promise.resolve then']);
}
export async function PromiseTryTest011() {
  const arrowSyncFunc = (x) => x * x;
  const promise = Promise.try(arrowSyncFunc, 6);
  const result = await promise;
  return promise instanceof Promise && result === 36;
}

export async function PromiseTryTest012() {
  const asyncErrorFunc = async (delay) => {
    await new Promise(resolve => setTimeout(resolve, delay));
    throw new Error('Delayed async error');
  };
  const promise = Promise.try(asyncErrorFunc, 10);
  const result = await Promise.allSettled([promise]);
  const rejectedResult = result[0];
  return rejectedResult.status === 'rejected' && rejectedResult.reason.message === 'Delayed async error';
}

export async function PromiseTryTest013() {
  const funcWithThis = function() {
    return this.value;
  };
  const context = { value: 'bound context' };
  const boundFunc = funcWithThis.bind(context);
  const promise = Promise.try(boundFunc);
  const result = await promise;
  return result === 'bound context';
}

export async function PromiseTryTest014() {
  const returnPromiseFunc = () => Promise.resolve('Promise from func');
  const promise = Promise.try(returnPromiseFunc);
  const result = await promise;
  return result === 'Promise from func';
}

export async function PromiseTryTest015() {
  let callCount = 0;
  const countFunc = () => {
    callCount++;
    return callCount;
  };
  await Promise.try(countFunc);
  await Promise.try(countFunc);
  return callCount === 2;
}

export async function PromiseTryTest016() {
  const nestedTryFunc = () => {
    return Promise.try(() => 'nested value');
  };
  const promise = Promise.try(nestedTryFunc);
  const result = await promise;
  return result === 'nested value';
}

export async function PromiseTryTest017() {
  const undefinedArgFunc = (a, b) => a ?? b;
  const promise1 = Promise.try(undefinedArgFunc, undefined, 'fallback');
  const promise2 = Promise.try(undefinedArgFunc, 'defined', null);
  const [res1, res2] = await Promise.all([promise1, promise2]);
  return res1 === 'fallback' && res2 === 'defined';
}

export async function PromiseTryTest018() {
  const objectReturnFunc = () => ({ name: 'test', value: 100 });
  const promise = Promise.try(objectReturnFunc);
  const result = await promise;
  return result.name === 'test' && result.value === 100;
}

export async function PromiseTryTest019() {
  const generatorFunc = function* (start, end) {
    for (let i = start; i <= end; i++) yield i;
  };
  const promise = Promise.try(generatorFunc, 2, 4);
  const iterator = await promise;
  const values = [];
  for (const val of iterator) values.push(val);
  return JSON.stringify(values) === JSON.stringify([2, 3, 4]);
}

export async function PromiseTryTest020() {
  const noArgFunc = () => 'no args';
  const promise = Promise.try(noArgFunc);
  const result = await promise;
  return result === 'no args' && promise instanceof Promise;
}

export async function PromiseTryTest021() {
  const asyncReturnUndefinedFunc = async () => {
    await new Promise(resolve => setTimeout(resolve, 5));
  };
  const promise = Promise.try(asyncReturnUndefinedFunc);
  const result = await promise;
  return result === undefined;
}

export async function PromiseTryTest022() {
  const throwTypeErrorFunc = () => {
    throw new TypeError('Type mismatch');
  };
  const promise = Promise.try(throwTypeErrorFunc);
  const result = await Promise.allSettled([promise]);
  const rejectedResult = result[0];
  return rejectedResult.status === 'rejected' && rejectedResult.reason instanceof TypeError;
}

export async function PromiseTryTest023() {
  let sideEffect = '';
  const sideEffectFunc = () => {
    sideEffect += 'executed';
    return sideEffect;
  };
  const promise = Promise.try(sideEffectFunc);
  await promise;
  return sideEffect === 'executed';
}

export async function PromiseTryTest024() {
  const arrayReturnFunc = () => [1, 2, 3].map(x => x * 2);
  const promise = Promise.try(arrayReturnFunc);
  const result = await promise;
  return JSON.stringify(result) === JSON.stringify([2, 4, 6]);
}

export async function PromiseTryTest025() {
  const asyncNestedFunc = async () => {
    return Promise.try(async () => {
      await new Promise(resolve => setTimeout(resolve, 8));
      return 'double nested';
    });
  };
  const promise = Promise.try(asyncNestedFunc);
  const result = await promise;
  return result === 'double nested';
}

export async function PromiseTryTest026() {
  const nullReturnFunc = () => null;
  const promise = Promise.try(nullReturnFunc);
  const result = await promise;
  return result === null;
}

export async function PromiseTryTest027() {
  const dateReturnFunc = () => new Date('2024-01-01');
  const promise = Promise.try(dateReturnFunc);
  const result = await promise;
  return result instanceof Date && result.getFullYear() === 2024;
}

export async function PromiseTryTest028() {
  const rejectAfterDelayFunc = () => {
    return new Promise((_, reject) => setTimeout(() => reject(new Error('Delayed reject')), 12));
  };
  const promise = Promise.try(rejectAfterDelayFunc);
  const result = await Promise.allSettled([promise]);
  const rejectedResult = result[0];
  return rejectedResult.status === 'rejected' && rejectedResult.reason.message === 'Delayed reject';
}

export async function PromiseTryTest029() {
  const multiStepFunc = (a, b, c) => {
    const sum = a + b;
    return sum * c;
  };
  const promise = Promise.try(multiStepFunc, 2, 3, 4);
  const result = await promise;
  return result === 20;
}

export async function PromiseTryTest030() {
  const symbolReturnFunc = () => Symbol('test-symbol');
  const promise = Promise.try(symbolReturnFunc);
  const result = await promise;
  return result instanceof Symbol && result.description === 'test-symbol';
}
export async function PromiseTryTest031() {
  const start = Date.now();
  const result = await Promise.try(() => 2)
    .then(val => Promise.try(() => new Promise(resolve => setTimeout(() => resolve(val * 3), 10))))
    .then(val => Promise.try(() => new Promise(resolve => setTimeout(() => resolve(val + 5), 15))));
  const end = Date.now();
  return result === 11 && (end - start) >= 25;
}

export async function PromiseTryTest032() {
  const timeLog = [];
  const level3 = () => new Promise(resolve => setTimeout(() => {
    timeLog.push('L3: 5ms');
    resolve(10);
  }, 5));
  const level2 = () => Promise.try(level3).then(val => {
    timeLog.push(`L2: ${val}`);
    return val * 2;
  });
  const level1 = () => Promise.try(level2).then(val => {
    timeLog.push(`L1: ${val}`);
    return val + 3;
  });

  const result = await Promise.try(level1);
  return result === 23 && JSON.stringify(timeLog) === JSON.stringify(['L3: 5ms', 'L2: 10', 'L1: 20']);
}

export async function PromiseTryTest033() {
  const start = Date.now();
  const innerAll = Promise.all([
    Promise.try(() => new Promise(resolve => setTimeout(() => resolve(10), 10))),
    Promise.try(() => new Promise(resolve => setTimeout(() => resolve(20), 5)))
  ]);
  const outerAll = Promise.all([
    innerAll,
    Promise.try(() => new Promise(resolve => setTimeout(() => resolve(30), 15)))
  ]);
  const result = await outerAll;
  const end = Date.now();
  return JSON.stringify(result) === JSON.stringify([[10, 20], 30]) && (end - start) >= 15;
}

export async function PromiseTryTest034() {
  const timeLog = [];
  const step1 = () => Promise.try(() => new Promise(resolve => setTimeout(() => {
    timeLog.push('step1');
    resolve(1);
  }, 5)));
  const step2 = (val) => Promise.try(() => new Promise(resolve => setTimeout(() => {
    timeLog.push('step2');
    resolve(val * 2);
  }, 10)));
  const step3 = (val) => Promise.try(() => new Promise(resolve => setTimeout(() => {
    timeLog.push('step3');
    resolve(val + 3);
  }, 8)));

  const result = await step1().then(step2).then(step3);
  return result === 5 && JSON.stringify(timeLog) === JSON.stringify(['step1', 'step2', 'step3']);
}

export async function PromiseTryTest035() {
  const start = Date.now();
  const recursiveTry = (depth) => {
    if (depth === 0) return Promise.try(() => 1);
    return Promise.try(() => recursiveTry(depth - 1))
      .then(val => new Promise(resolve => setTimeout(() => resolve(val * 2), 5)));
  };
  const result = await recursiveTry(4);
  const end = Date.now();
  return result === 16 && (end - start) >= 20;
}

export async function PromiseTryTest036() {
  const timeLog = [];
  const asyncError = () => new Promise((_, reject) => setTimeout(() => reject(new Error('err')), 5));
  const result = await Promise.try(asyncError)
    .catch(err => Promise.try(() => new Promise(resolve => setTimeout(() => {
      timeLog.push('caught');
      resolve(`handled: ${err.message}`);
    }, 10))))
    .then(val => {
      timeLog.push('then');
      return val;
    });
  return result === 'handled: err' && JSON.stringify(timeLog) === JSON.stringify(['caught', 'then']);
}

export async function PromiseTryTest037() {
  const start = Date.now();
  const raceCandidates = [
    Promise.try(() => new Promise(resolve => setTimeout(() => resolve('slow'), 20))),
    Promise.try(() => new Promise(resolve => setTimeout(() => resolve('fast'), 10)))
  ];
  const result = await Promise.race(raceCandidates);
  const end = Date.now();
  return result === 'fast' && (end - start) >= 10 && (end - start) < 20;
}

export async function PromiseTryTest038() {
  const timeLog = [];
  const level4 = () => Promise.try(() => new Promise(resolve => setTimeout(() => {
    timeLog.push('L4');
    resolve(2);
  }, 3)));
  const level3 = () => Promise.try(level4).then(val => new Promise(resolve => setTimeout(() => {
    timeLog.push('L3');
    resolve(val * 3);
  }, 4)));
  const level2 = () => Promise.try(level3).then(val => new Promise(resolve => setTimeout(() => {
    timeLog.push('L2');
    resolve(val + 5);
  }, 2)));
  const level1 = () => Promise.try(level2).then(val => new Promise(resolve => setTimeout(() => {
    timeLog.push('L1');
    resolve(val);
  }, 1)));

  const result = await level1();
  return result === 11 && JSON.stringify(timeLog) === JSON.stringify(['L4', 'L3', 'L2', 'L1']);
}

export async function PromiseTryTest039() {
  const start = Date.now();
  const anyCandidates = [
    Promise.try(() => new Promise(resolve => setTimeout(() => resolve('30ms'), 30))),
    Promise.try(() => new Promise(resolve => setTimeout(() => resolve('15ms'), 15))),
    Promise.try(() => new Promise(resolve => setTimeout(() => resolve('10ms'), 10)))
  ];
  const result = await Promise.any(anyCandidates);
  const end = Date.now();
  return result === '10ms' && (end - start) >= 10;
}

export async function PromiseTryTest040() {
  let shared = 0;
  const stepA = () => Promise.try(() => new Promise(resolve => setTimeout(() => {
    shared = 5;
    resolve(shared);
  }, 5)));
  const stepB = (val) => Promise.try(() => new Promise(resolve => setTimeout(() => {
    shared = val * 2;
    resolve(shared);
  }, 8)));
  const stepC = (val) => Promise.try(() => {
    shared = val + 3;
    return shared;
  });

  const result = await stepA().then(stepB).then(stepC);
  return result === 13 && shared === 13;
}

export async function PromiseTryTest041() {
  const start = Date.now();
  const nestedAll = Promise.try(() => Promise.all([
    Promise.try(() => new Promise(resolve => setTimeout(() => resolve(1), 10))),
    Promise.try(() => Promise.all([
      Promise.try(() => new Promise(resolve => setTimeout(() => resolve(2), 5))),
      Promise.try(() => new Promise(resolve => setTimeout(() => resolve(3), 8)))
    ]))
  ]));
  const result = await nestedAll;
  const end = Date.now();
  return JSON.stringify(result) === JSON.stringify([1, [2, 3]]) && (end - start) >= 10;
}

export async function PromiseTryTest042() {
  const timeLog = [];
  const delayStep = (name, delay, val) => Promise.try(() => new Promise(resolve => setTimeout(() => {
    timeLog.push(name);
    resolve(val);
  }, delay)));

  await delayStep('A', 10, 1)
    .then(val => delayStep('B', 5, val * 2))
    .then(val => delayStep('C', 15, val + 3));

  return JSON.stringify(timeLog) === JSON.stringify(['A', 'B', 'C']);
}

export async function PromiseTryTest043() {
  const start = Date.now();
  const failThenRecover = Promise.try(() => new Promise((_, reject) => setTimeout(() => reject(new Error('fail')), 5)))
    .catch(err => Promise.try(() => new Promise(resolve => setTimeout(() => resolve(`recovered: ${err.message}`), 10))))
    .then(val => Promise.try(() => new Promise(resolve => setTimeout(() => resolve(val.toUpperCase()), 8))));
  const result = await failThenRecover;
  const end = Date.now();
  return result === 'RECOVERED: FAIL' && (end - start) >= 23;
}

export async function PromiseTryTest044() {
  const timeLog = [];
  const genStep = async function* () {
    yield Promise.try(() => new Promise(resolve => setTimeout(() => {
      timeLog.push('gen1');
      resolve(1);
    }, 3)));
    yield Promise.try(() => new Promise(resolve => setTimeout(() => {
      timeLog.push('gen2');
      resolve(2);
    }, 6)));
  };

  const results = [];
  for await (const p of genStep()) {
    results.push(await p);
  }
  return JSON.stringify(results) === JSON.stringify([1, 2]) && JSON.stringify(timeLog) === JSON.stringify(['gen1', 'gen2']);
}

export async function PromiseTryTest045() {
  const start = Date.now();
  const conditionalCascade = (shouldDelay) => Promise.try(() => {
    if (shouldDelay) {
      return new Promise(resolve => setTimeout(() => resolve(10), 15));
    }
    return 5;
  }).then(val => Promise.try(() => val * 2));

  const result1 = await conditionalCascade(true);
  const time1 = Date.now() - start;
  const result2 = await conditionalCascade(false);
  const time2 = Date.now() - start - time1;

  return result1 === 20 && result2 === 10 && time1 >= 15 && time2 < 5;
}

export async function PromiseTryTest046() {
  const timeLog = [];
  const finallyStep = () => Promise.try(() => new Promise(resolve => setTimeout(() => {
    timeLog.push('then');
    resolve(10);
  }, 5))).finally(() => {
    timeLog.push('finally');
  });

  await finallyStep().then(val => Promise.try(() => val * 2));
  return JSON.stringify(timeLog) === JSON.stringify(['then', 'finally']);
}

export async function PromiseTryTest047() {
  const start = Date.now();
  const multiLevelRace = Promise.race([
    Promise.try(() => new Promise(resolve => setTimeout(() => resolve(
      Promise.try(() => new Promise(resolve => setTimeout(() => resolve('inner-slow'), 20)))
    ), 10))),
    Promise.try(() => new Promise(resolve => setTimeout(() => resolve('outer-fast'), 15)))
  ]);
  const result = await multiLevelRace;
  const end = Date.now();
  return result === 'outer-fast' && (end - start) >= 15;
}

export async function PromiseTryTest048() {
  const timeLog = [];
  const nestedThen = Promise.try(() => 1)
    .then(val => Promise.try(() => new Promise(resolve => setTimeout(() => {
      timeLog.push(`val1: ${val}`);
      resolve(val + 1);
    }, 5))))
    .then(val => Promise.try(() => new Promise(resolve => setTimeout(() => {
      timeLog.push(`val2: ${val}`);
      resolve(val + 1);
    }, 10))))
    .then(val => Promise.try(() => {
      timeLog.push(`val3: ${val}`);
      return val;
    }));

  const result = await nestedThen;
  return result === 3 && JSON.stringify(timeLog) === JSON.stringify(['val1: 1', 'val2: 2', 'val3: 3']);
}

export async function PromiseTryTest049() {
  const start = Date.now();
  const allSettledNested = Promise.try(() => Promise.allSettled([
    Promise.try(() => new Promise(resolve => setTimeout(() => resolve(10), 10))),
    Promise.try(() => new Promise((_, reject) => setTimeout(() => reject(new Error('err')), 5)))
  ]));
  const result = await allSettledNested;
  const end = Date.now();
  return result[0].status === 'fulfilled' && result[0].value === 10 &&
    result[1].status === 'rejected' && result[1].reason.message === 'err' &&
    (end - start) >= 10;
}

export async function PromiseTryTest050() {
  const start = Date.now();
  const exponentialDelay = (base, times) => {
    let delay = base;
    return Promise.try(() => 1)
      .then(val => new Promise(resolve => setTimeout(() => resolve(val * 2), delay)))
      .then(val => {
        delay *= 2;
        return new Promise(resolve => setTimeout(() => resolve(val * 2), delay));
      })
      .then(val => {
        delay *= 2;
        return new Promise(resolve => setTimeout(() => resolve(val * 2), delay));
      });
  };
  const result = await exponentialDelay(2, 3);
  const end = Date.now();
  return result === 8 && (end - start) >= 14;
}
export async function PromiseTryTest051() {
  const asyncNestedWrap = () => Promise.try(async () => {
    await new Promise(resolve => setTimeout(resolve, 8));
    return Promise.try(() => 'nested async value');
  });
  const result = await Promise.try(asyncNestedWrap);
  return result === 'nested async value';
}

export async function PromiseTryTest052() {
  const timeLog = [];
  const asyncStep1 = () => Promise.try(() => new Promise(resolve => setTimeout(() => {
    timeLog.push('step1 done');
    resolve(5);
  }, 10)));
  const asyncStep2 = (val) => Promise.try(async () => {
    await new Promise(resolve => setTimeout(resolve, 5));
    timeLog.push('step2 done');
    return val * 3;
  });

  const result = await asyncStep1().then(asyncStep2);
  return result === 15 && JSON.stringify(timeLog) === JSON.stringify(['step1 done', 'step2 done']);
}

export async function PromiseTryTest053() {
  const errorInNested = () => Promise.try(() => {
    return Promise.try(() => {
      throw new Error('deep sync error');
    });
  });
  const result = await Promise.allSettled([Promise.try(errorInNested)]);
  const rejected = result[0];
  return rejected.status === 'rejected' && rejected.reason.message === 'deep sync error';
}

export async function PromiseTryTest054() {
  let counter = 0;
  const asyncIncrement = () => Promise.try(async () => {
    await new Promise(resolve => setTimeout(resolve, 3));
    counter++;
    return counter;
  });

  const [res1, res2] = await Promise.all([asyncIncrement(), asyncIncrement()]);
  return res1 === 1 && res2 === 2 && counter === 2;
}

export async function PromiseTryTest055() {
  const asyncReturnPromise = async () => {
    await new Promise(resolve => setTimeout(resolve, 6));
    return Promise.resolve('async promise value');
  };
  const result = await Promise.try(asyncReturnPromise);
  return result === 'async promise value';
}

export async function PromiseTryTest056() {
  const timeLog = [];
  const failNestedAsync = () => Promise.try(async () => {
    await new Promise(resolve => setTimeout(resolve, 4));
    return Promise.try(() => {
      throw new Error('nested async error');
    });
  });

  const result = await Promise.try(failNestedAsync).catch(err => {
    timeLog.push('caught');
    return err.message;
  });
  return result === 'nested async error' && JSON.stringify(timeLog) === JSON.stringify(['caught']);
}

export async function PromiseTryTest057() {
  const nestedAllAsync = () => Promise.try(() => Promise.all([
    Promise.try(async () => {
      await new Promise(resolve => setTimeout(resolve, 7));
      return 'a';
    }),
    Promise.try(async () => {
      await new Promise(resolve => setTimeout(resolve, 5));
      return 'b';
    })
  ]));
  const result = await Promise.try(nestedAllAsync);
  return JSON.stringify(result) === JSON.stringify(['a', 'b']);
}

export async function PromiseTryTest058() {
  const asyncWithThis = async function() {
    await new Promise(resolve => setTimeout(resolve, 4));
    return this.data;
  };
  const context = { data: 'async bound data' };
  const boundFunc = asyncWithThis.bind(context);
  const result = await Promise.try(boundFunc);
  return result === 'async bound data';
}

export async function PromiseTryTest059() {
  const timeLog = [];
  const chainAsync = Promise.try(() => new Promise(resolve => setTimeout(() => {
    timeLog.push('1');
    resolve(1);
  }, 5)))
    .then(val => Promise.try(async () => {
      await new Promise(resolve => setTimeout(resolve, 3));
      timeLog.push('2');
      return val + 1;
    }))
    .then(val => Promise.try(() => {
      timeLog.push('3');
      return val + 1;
    }));

  const result = await chainAsync;
  return result === 3 && JSON.stringify(timeLog) === JSON.stringify(['1', '2', '3']);
}

export async function PromiseTryTest060() {
  const asyncReject = async () => {
    await new Promise(resolve => setTimeout(resolve, 5));
    throw new Error('async reject');
  };
  const result = await Promise.allSettled([Promise.try(asyncReject)]);
  const rejected = result[0];
  return rejected.status === 'rejected' && rejected.reason.message === 'async reject';
}

export async function PromiseTryTest061() {
  const nestedTryAsync = async () => {
    return Promise.try(async () => {
      await new Promise(resolve => setTimeout(resolve, 4));
      return Promise.try(() => 'triple nested');
    });
  };
  const result = await Promise.try(nestedTryAsync);
  return result === 'triple nested';
}

export async function PromiseTryTest062() {
  let sideEffect = '';
  const asyncSideEffect = () => Promise.try(async () => {
    await new Promise(resolve => setTimeout(resolve, 3));
    sideEffect = 'modified';
    return sideEffect;
  });

  const result = await asyncSideEffect();
  return result === 'modified' && sideEffect === 'modified';
}

export async function PromiseTryTest063() {
  const asyncRace = () => Promise.race([
    Promise.try(async () => {
      await new Promise(resolve => setTimeout(resolve, 10));
      return 'slow';
    }),
    Promise.try(async () => {
      await new Promise(resolve => setTimeout(resolve, 4));
      return 'fast';
    })
  ]);
  const result = await Promise.try(asyncRace);
  return result === 'fast';
}

export async function PromiseTryTest064() {
  const errorInAsyncThen = () => Promise.try(() => 10)
    .then(val => Promise.try(async () => {
      await new Promise(resolve => setTimeout(resolve, 5));
      throw new Error(`error at ${val}`);
    }));
  const result = await Promise.allSettled([errorInAsyncThen()]);
  const rejected = result[0];
  return rejected.status === 'rejected' && rejected.reason.message === 'error at 10';
}

export async function PromiseTryTest065() {
  const asyncObjectReturn = async () => {
    await new Promise(resolve => setTimeout(resolve, 6));
    return { type: 'async', value: 100 };
  };
  const result = await Promise.try(asyncObjectReturn);
  return result.type === 'async' && result.value === 100;
}

export async function PromiseTryTest066() {
  const timeLog = [];
  const finallyWithAsync = Promise.try(async () => {
    await new Promise(resolve => setTimeout(resolve, 5));
    timeLog.push('then');
    return 20;
  }).finally(() => {
    timeLog.push('finally');
  });

  const result = await finallyWithAsync;
  return result === 20 && JSON.stringify(timeLog) === JSON.stringify(['then', 'finally']);
}

export async function PromiseTryTest067() {
  const nestedRejectAsync = () => Promise.try(() => {
    return Promise.try(async () => {
      await new Promise(resolve => setTimeout(resolve, 3));
      return Promise.reject(new Error('deep async reject'));
    });
  });
  const result = await Promise.try(nestedRejectAsync).catch(err => err.message);
  return result === 'deep async reject';
}

export async function PromiseTryTest068() {
  const asyncArrayMap = async () => {
    const arr = [1, 2, 3];
    return Promise.all(arr.map(num => Promise.try(async () => {
      await new Promise(resolve => setTimeout(resolve, 2));
      return num * 3;
    })));
  };
  const result = await Promise.try(asyncArrayMap);
  return JSON.stringify(result) === JSON.stringify([3, 6, 9]);
}

export async function PromiseTryTest069() {
  const timeLog = [];
  const recoverFromNested = Promise.try(() => {
    return Promise.try(() => {
      throw new Error('inner fail');
    });
  }).catch(err => Promise.try(async () => {
    await new Promise(resolve => setTimeout(resolve, 5));
    timeLog.push('recovered');
    return `handled: ${err.message}`;
  }));

  const result = await recoverFromNested;
  return result === 'handled: inner fail' && JSON.stringify(timeLog) === JSON.stringify(['recovered']);
}

export async function PromiseTryTest070() {
  const asyncSymbolReturn = async () => {
    await new Promise(resolve => setTimeout(resolve, 4));
    return Symbol('async-symbol');
  };
  const result = await Promise.try(asyncSymbolReturn);
  return result instanceof Symbol && result.description === 'async-symbol';
}
export async function PromiseTryTest071() {
  const start = Date.now();
  const nestedAllRace = Promise.try(() => Promise.all([
    Promise.race([
      Promise.try(() => new Promise(resolve => setTimeout(() => resolve('race1'), 8))),
      Promise.try(() => new Promise(resolve => setTimeout(() => resolve('race2'), 3)))
    ]),
    Promise.try(() => new Promise(resolve => setTimeout(() => resolve('all1'), 10)))
  ]));
  const result = await nestedAllRace;
  const end = Date.now();
  return JSON.stringify(result) === JSON.stringify(['race2', 'all1']) && (end - start) >= 10;
}

export async function PromiseTryTest072() {
  const timeLog = [];
  const recursiveAsync = async (depth) => {
    if (depth === 0) return Promise.try(() => {
      timeLog.push('base');
      return 1;
    });
    const val = await Promise.try(() => recursiveAsync(depth - 1));
    return Promise.try(() => new Promise(resolve => setTimeout(() => {
      timeLog.push(`depth${depth}`);
      resolve(val * 2);
    }, 2)));
  };
  const result = await recursiveAsync(3);
  return result === 8 && JSON.stringify(timeLog) === JSON.stringify(['base', 'depth1', 'depth2', 'depth3']);
}

export async function PromiseTryTest073() {
  const asyncWithFinally = () => Promise.try(async () => {
    await new Promise(resolve => setTimeout(resolve, 5));
    throw new Error('fail');
  }).catch(err => err.message).finally(() => 'cleanup');
  const result = await Promise.try(asyncWithFinally);
  return result === 'fail';
}

export async function PromiseTryTest074() {
  const start = Date.now();
  const parallelNested = Promise.all([
    Promise.try(() => new Promise(resolve => setTimeout(() => resolve(1), 10))),
    Promise.try(() => Promise.all([
      Promise.try(() => new Promise(resolve => setTimeout(() => resolve(2), 5))),
      Promise.try(() => new Promise(resolve => setTimeout(() => resolve(3), 7)))
    ]))
  ]);
  const result = await parallelNested;
  const end = Date.now();
  return JSON.stringify(result) === JSON.stringify([1, [2, 3]]) && (end - start) >= 10;
}

export async function PromiseTryTest075() {
  let sharedState = 0;
  const asyncModify = () => Promise.try(async () => {
    await new Promise(resolve => setTimeout(resolve, 3));
    sharedState += 5;
    return sharedState;
  });
  const chain = Promise.try(asyncModify)
    .then(() => Promise.try(asyncModify))
    .then(() => sharedState);
  const result = await chain;
  return result === 10;
}

export async function PromiseTryTest076() {
  const timeLog = [];
  const failAndRecoverChain = Promise.try(() => new Promise((_, reject) => setTimeout(() => {
    timeLog.push('fail');
    reject(new Error('err'));
  }, 4)))
    .catch(err => Promise.try(() => new Promise(resolve => setTimeout(() => {
      timeLog.push('recover');
      resolve(`handled: ${err.message}`);
    }, 6))))
    .then(val => Promise.try(() => {
      timeLog.push('done');
      return val;
    }));
  const result = await failAndRecoverChain;
  return result === 'handled: err' && JSON.stringify(timeLog) === JSON.stringify(['fail', 'recover', 'done']);
}

export async function PromiseTryTest077() {
  const asyncGenerator = async function* () {
    yield Promise.try(() => new Promise(resolve => setTimeout(() => resolve(10), 5)));
    yield Promise.try(() => new Promise(resolve => setTimeout(() => resolve(20), 3)));
  };
  const results = [];
  for await (const p of asyncGenerator()) {
    results.push(await p);
  }
  return JSON.stringify(results) === JSON.stringify([10, 20]);
}

export async function PromiseTryTest078() {
  const start = Date.now();
  const conditionalAsyncCascade = (flag) => Promise.try(() => {
    if (flag) {
      return new Promise(resolve => setTimeout(() => resolve(5), 12));
    }
    throw new Error('flag false');
  }).catch(err => Promise.try(() => new Promise(resolve => setTimeout(() => resolve(err.message.length), 8))));
  const [res1, res2] = await Promise.all([conditionalAsyncCascade(true), conditionalAsyncCascade(false)]);
  const end = Date.now();
  return res1 === 5 && res2 === 10 && (end - start) >= 12;
}

export async function PromiseTryTest079() {
  const nestedThenable = () => Promise.try(() => {
    return {
      then(resolve) {
        setTimeout(() => resolve(Promise.try(() => 'thenable value')), 4);
      }
    };
  });
  const result = await Promise.try(nestedThenable);
  return result === 'thenable value';
}

export async function PromiseTryTest080() {
  const timeLog = [];
  const allSettledWithAsync = Promise.try(() => Promise.allSettled([
    Promise.try(() => new Promise(resolve => setTimeout(() => {
      timeLog.push('fulfill');
      resolve(100);
    }, 6))),
    Promise.try(() => new Promise((_, reject) => setTimeout(() => {
      timeLog.push('reject');
      reject(new Error('err'));
    }, 3)))
  ]));
  const result = await allSettledWithAsync;
  return result[0].status === 'fulfilled' && result[0].value === 100 &&
    result[1].status === 'rejected' && result[1].reason.message === 'err' &&
    JSON.stringify(timeLog) === JSON.stringify(['reject', 'fulfill']);
}

export async function PromiseTryTest081() {
  const start = Date.now();
  const multiLevelFinally = Promise.try(() => new Promise(resolve => setTimeout(() => resolve(1), 5)))
    .finally(() => Promise.try(() => new Promise(resolve => setTimeout(resolve, 3))))
    .then(val => Promise.try(() => new Promise(resolve => setTimeout(() => resolve(val * 2), 4))))
    .finally(() => Promise.try(() => new Promise(resolve => setTimeout(resolve, 2))));
  const result = await multiLevelFinally;
  const end = Date.now();
  return result === 2 && (end - start) >= 14;
}

export async function PromiseTryTest082() {
  const asyncBindWithArgs = async function(a, b) {
    await new Promise(resolve => setTimeout(resolve, 4));
    return this.base + a + b;
  };
  const context = { base: 10 };
  const bound = asyncBindWithArgs.bind(context, 5, 3);
  const result = await Promise.try(bound);
  return result === 18;
}

export async function PromiseTryTest083() {
  const timeLog = [];
  const sequentialAsync = [
    () => Promise.try(() => new Promise(resolve => setTimeout(() => {
      timeLog.push('a');
      resolve(1);
    }, 3))),
    (val) => Promise.try(() => new Promise(resolve => setTimeout(() => {
      timeLog.push('b');
      resolve(val + 2);
    }, 5))),
    (val) => Promise.try(() => new Promise(resolve => setTimeout(() => {
      timeLog.push('c');
      resolve(val * 3);
    }, 2)))
  ];
  const result = await sequentialAsync.reduce((acc, fn) => acc.then(fn), Promise.resolve());
  return result === 9 && JSON.stringify(timeLog) === JSON.stringify(['a', 'b', 'c']);
}

export async function PromiseTryTest084() {
  const nestedAny = () => Promise.try(() => Promise.any([
    Promise.try(() => new Promise(resolve => setTimeout(() => resolve('any1'), 10))),
    Promise.try(() => Promise.any([
      Promise.try(() => new Promise(resolve => setTimeout(() => resolve('any2'), 4))),
      Promise.try(() => new Promise(resolve => setTimeout(() => resolve('any3'), 6)))
    ]))
  ]));
  const result = await Promise.try(nestedAny);
  return result === 'any2';
}

export async function PromiseTryTest085() {
  let callOrder = [];
  const syncStep = () => Promise.try(() => {
    callOrder.push('sync');
    return 1;
  });
  const asyncStep = (val) => Promise.try(async () => {
    await new Promise(resolve => setTimeout(resolve, 2));
    callOrder.push('async');
    return val * 2;
  });
  await syncStep().then(asyncStep);
  return JSON.stringify(callOrder) === JSON.stringify(['sync', 'async']);
}

export async function PromiseTryTest086() {
  const start = Date.now();
  const delayedRejectCatch = Promise.try(() => new Promise((_, reject) => setTimeout(() => reject(new Error('late err')), 10)))
    .then(val => val + 1)
    .catch(err => Promise.try(() => new Promise(resolve => setTimeout(() => resolve(err.message), 5))));
  const result = await delayedRejectCatch;
  const end = Date.now();
  return result === 'late err' && (end - start) >= 15;
}

export async function PromiseTryTest087() {
  const customPromiseSubclass = class extends Promise {
    static try(fn, ...args) {
      return super.try(fn, ...args);
    }
    log() {
      return this.then(val => `logged: ${val}`);
    }
  };
  const promise = customPromiseSubclass.try(() => new Promise(resolve => setTimeout(() => resolve('subclass val'), 4)));
  const result = await promise.log();
  return result === 'logged: subclass val' && promise instanceof customPromiseSubclass;
}

export async function PromiseTryTest088() {
  const timeLog = [];
  const asyncNestedCatch = Promise.try(() => {
    return Promise.try(async () => {
      await new Promise(resolve => setTimeout(resolve, 3));
      throw new Error('inner');
    }).catch(err => {
      timeLog.push('inner catch');
      throw new Error(`wrapped: ${err.message}`);
    });
  }).catch(err => {
    timeLog.push('outer catch');
    return err.message;
  });
  const result = await asyncNestedCatch;
  return result === 'wrapped: inner' && JSON.stringify(timeLog) === JSON.stringify(['inner catch', 'outer catch']);
}

export async function PromiseTryTest089() {
  const start = Date.now();
  const parallelAsyncModify = Promise.all([
    Promise.try(async () => {
      await new Promise(resolve => setTimeout(resolve, 5));
      return 10;
    }),
    Promise.try(async () => {
      await new Promise(resolve => setTimeout(resolve, 8));
      return 20;
    })
  ]);
  const result = await parallelAsyncModify;
  const end = Date.now();
  return JSON.stringify(result) === JSON.stringify([10, 20]) && (end - start) >= 8;
}

export async function PromiseTryTest090() {
  const asyncReturnUndefined = async () => {
    await new Promise(resolve => setTimeout(resolve, 3));
  };
  const result = await Promise.try(asyncReturnUndefined);
  return result === undefined;
}

export async function PromiseTryTest091() {
  const timeLog = [];
  const cascadeWithFinally = Promise.try(() => new Promise(resolve => setTimeout(() => {
    timeLog.push('step1');
    resolve(2);
  }, 4)))
    .finally(() => timeLog.push('finally1'))
    .then(val => Promise.try(() => new Promise(resolve => setTimeout(() => {
      timeLog.push('step2');
      resolve(val * 3);
    }, 2))))
    .finally(() => timeLog.push('finally2'));
  const result = await cascadeWithFinally;
  return result === 6 && JSON.stringify(timeLog) === JSON.stringify(['step1', 'finally1', 'step2', 'finally2']);
}

export async function PromiseTryTest092() {
  const nestedPromiseResolve = () => Promise.try(() => Promise.resolve(Promise.try(() => new Promise(resolve => setTimeout(() => resolve('deep resolve'), 5)))));
  const result = await nestedPromiseResolve;
  return result === 'deep resolve';
}

export async function PromiseTryTest093() {
  const start = Date.now();
  const asyncGeneratorChain = async function* () {
    yield Promise.try(() => new Promise(resolve => setTimeout(() => resolve(1), 3)));
    yield Promise.try(() => new Promise(resolve => setTimeout(() => resolve(2), 5)));
    yield Promise.try(() => new Promise(resolve => setTimeout(() => resolve(3), 2)));
  };
  let sum = 0;
  for await (const p of asyncGeneratorChain()) {
    sum += await p;
  }
  const end = Date.now();
  return sum === 6 && (end - start) >= 10;
}

export async function PromiseTryTest094() {
  const asyncErrorType = async () => {
    await new Promise(resolve => setTimeout(resolve, 4));
    throw new RangeError('out of range');
  };
  const result = await Promise.allSettled([Promise.try(asyncErrorType)]);
  const rejected = result[0];
  return rejected.status === 'rejected' && rejected.reason instanceof RangeError;
}

export async function PromiseTryTest095() {
  const timeLog = [];
  const raceWithNestedTry = Promise.race([
    Promise.try(() => new Promise(resolve => setTimeout(() => {
      timeLog.push('raceA');
      resolve('A');
    }, 10))),
    Promise.try(() => Promise.try(() => new Promise(resolve => setTimeout(() => {
      timeLog.push('raceB');
      resolve('B');
    }, 5))))
  ]);
  const result = await raceWithNestedTry;
  return result === 'B' && JSON.stringify(timeLog) === JSON.stringify(['raceB']);
}

export async function PromiseTryTest096() {
  const asyncObjectModify = async () => {
    await new Promise(resolve => setTimeout(resolve, 3));
    const obj = { a: 1 };
    return Promise.try(() => {
      obj.a = 2;
      return obj;
    });
  };
  const result = await Promise.try(asyncObjectModify);
  return result.a === 2;
}

export async function PromiseTryTest097() {
  const start = Date.now();
  const multiDelayCascade = Promise.try(() => new Promise(resolve => setTimeout(() => resolve(1), 2)))
    .then(val => Promise.try(() => new Promise(resolve => setTimeout(() => resolve(val * 2), 4))))
    .then(val => Promise.try(() => new Promise(resolve => setTimeout(() => resolve(val + 3), 6))))
    .then(val => Promise.try(() => new Promise(resolve => setTimeout(() => resolve(val * 4), 8))));
  const result = await multiDelayCascade;
  const end = Date.now();
  return result === 28 && (end - start) >= 20;
}

export async function PromiseTryTest098() {
  const timeLog = [];
  const allSettledNestedAsync = Promise.try(() => Promise.allSettled([
    Promise.try(async () => {
      await new Promise(resolve => setTimeout(resolve, 5));
      timeLog.push('a');
      return 'a-val';
    }),
    Promise.try(async () => {
      await new Promise(resolve => setTimeout(resolve, 3));
      timeLog.push('b');
      throw new Error('b-err');
    })
  ]));
  const result = await allSettledNestedAsync;
  return result[0].status === 'fulfilled' && result[0].value === 'a-val' &&
    result[1].status === 'rejected' && result[1].reason.message === 'b-err' &&
    JSON.stringify(timeLog) === JSON.stringify(['b', 'a']);
}

export async function PromiseTryTest099() {
  const asyncSymbolNested = async () => {
    await new Promise(resolve => setTimeout(resolve, 4));
    return Promise.try(() => Symbol('nested-symbol'));
  };
  const result = await Promise.try(asyncSymbolNested);
  return result instanceof Symbol && result.description === 'nested-symbol';
}

export async function PromiseTryTest100() {
  const start = Date.now();
  const recursiveCascadeWithDelay = async (depth, delay) => {
    if (depth === 0) return Promise.try(() => 2);
    const prev = await Promise.try(() => recursiveCascadeWithDelay(depth - 1, delay));
    return Promise.try(() => new Promise(resolve => setTimeout(() => resolve(prev * 2), delay)));
  };
  const result = await recursiveCascadeWithDelay(3, 5);
  const end = Date.now();
  return result === 16 && (end - start) >= 15;
}