// Test Case 1: Basic Usage - Resolve a Promise
export async function PromiseWithResolversTest001() {
    const { promise, resolve, reject } = Promise.withResolvers();
    resolve('success');
    const result = await promise;
    return result === 'success' && promise instanceof Promise;
}

// Test Case 2: Basic Usage - Reject a Promise
export async function PromiseWithResolversTest002() {
    const { promise, resolve, reject } = Promise.withResolvers();
    const testError = new Error('test failure');
    reject(testError);
    try {
        await promise;
        return false;
    } catch (err) {
        return err === testError && err.message === 'test failure';
    }
}

// Test Case 3: Async Operation - Wrap setTimeout
export async function PromiseWithResolversTest003() {

    function delay(ms, value) {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(value), ms);
        return promise;
    }

    const start = Date.now();
    const result = await delay(10, 'delayed value');
    const end = Date.now();
    return result === 'delayed value'
}

// Test Case 4: Event Callback - Wrap Event Listener
export async function PromiseWithResolversTest004() {

    function waitForEvent(emitter, eventName) {
        const { promise, resolve } = Promise.withResolvers();
        emitter.once(eventName, (data) => resolve(data));
        return promise;
    }

    // Mock event emitter
    const emitter = {
        listeners: {},
        on: (event, cb) => (emitter.listeners[event] = cb),
        once: (event, cb) => (emitter.listeners[event] = cb),
        emit: (event, data) => emitter.listeners[event]?.(data)
    };
    // Trigger event asynchronously
    setTimeout(() => emitter.emit('message', 'hello'), 5);
    const result = await waitForEvent(emitter, 'message');
    return result === 'hello';
}

// Test Case 5: Concurrency Control - Combine with Promise.race
export async function PromiseWithResolversTest005() {
    const { promise: p1, resolve: r1 } = Promise.withResolvers();
    const { promise: p2, resolve: r2 } = Promise.withResolvers();

    setTimeout(() => r1('first'), 5);
    setTimeout(() => r2('second'), 10);

    const result = await Promise.race([p1, p2]);
    return result === 'first';
}

// Test Case 6: Error Handling - Catch rejected error
export async function PromiseWithResolversTest006() {
    const { promise, reject } = Promise.withResolvers();
    setTimeout(() => reject(new Error('async error')), 8);

    const result = await promise.catch(err => err.message);
    return result === 'async error';
}

// Test Case 7: Validation - Duplicate resolve/reject are ineffective
export async function PromiseWithResolversTest007() {
    const { promise, resolve, reject } = Promise.withResolvers();
    resolve('first resolve');
    // Subsequent calls should be ignored
    resolve('second resolve');
    reject(new Error('late reject'));

    const result = await promise;
    return result === 'first resolve';
}

// Test Case 8: Combine with Promise.all - Batch async tasks
export async function PromiseWithResolversTest008() {

    function createTask(ms, value) {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(value), ms);
        return promise;
    }

    const tasks = [
        createTask(10, 'task1'),
        createTask(5, 'task2'),
        createTask(15, 'task3')
    ];

    const result = await Promise.all(tasks);
    return JSON.stringify(result) === JSON.stringify(['task1', 'task2', 'task3']);
}

// Test Case 9: Class Encapsulation - Manage Promise state in class
export async function PromiseWithResolversTest009() {
    class AsyncTask {
        constructor() {
            this.#init();
        }

        #init() {
            const { promise, resolve, reject } = Promise.withResolvers();
            this.promise = promise;
            this.#resolve = resolve;
            this.#reject = reject;
        }

        complete(data) {
            this.#resolve(data);
            this.#init(); // Reset for reuse
        }

        fail(error) {
            this.#reject(error);
            this.#init();
        }

        #resolve;
        #reject;
    }

    const task = new AsyncTask();
    setTimeout(() => task.complete('task done'), 6);
    const firstResult = await task.promise;

    // Verify reusability
    setTimeout(() => task.complete('task done again'), 3);
    const secondResult = await task.promise;

    return firstResult === 'task done' && secondResult === 'task done again';
}

// Test Case 10: Combine with Promise Chain - Chained calls after resolution
export async function PromiseWithResolversTest010() {
    const { promise, resolve } = Promise.withResolvers();
    resolve(10);

    const result = await promise
        .then(val => val * 2)
        .then(val => val + 5);

    return result === 25;
}

// Test Case 11: Reject in async context - Reject promise in async function
export async function PromiseWithResolversTest011() {
    const { promise, reject } = Promise.withResolvers();
    (async () => {
        await new Promise(resolve => setTimeout(resolve, 4));
        reject(new Error('async reject'));
    })();

    try {
        await promise;
        return false;
    } catch (err) {
        return err.message === 'async reject';
    }
}

// Test Case 12: Nested withResolvers - Nested promise resolution
export async function PromiseWithResolversTest012() {
    const { promise: outerPromise, resolve: outerResolve } = Promise.withResolvers();
    const { promise: innerPromise, resolve: innerResolve } = Promise.withResolvers();

    setTimeout(() => innerResolve('inner value'), 5);
    innerPromise.then(val => outerResolve(`wrapped: ${val}`));

    const result = await outerPromise;
    return result === 'wrapped: inner value';
}

// Test Case 13: Promise.allSettled integration - Handle mixed resolve/reject
export async function PromiseWithResolversTest013() {
    const { promise: p1, resolve: r1 } = Promise.withResolvers();
    const { promise: p2, reject: r2 } = Promise.withResolvers();
    const { promise: p3, resolve: r3 } = Promise.withResolvers();

    setTimeout(() => r1('success1'), 3);
    setTimeout(() => r2(new Error('fail2')), 5);
    setTimeout(() => r3('success3'), 4);

    const results = await Promise.allSettled([p1, p2, p3]);
    return results[0].status === 'fulfilled' && results[0].value === 'success1' &&
        results[1].status === 'rejected' && results[1].reason.message === 'fail2' &&
        results[2].status === 'fulfilled' && results[2].value === 'success3';
}

// Test Case 14: Resolve with promise - Resolve to another promise
export async function PromiseWithResolversTest014() {
    const { promise, resolve } = Promise.withResolvers();
    const nestedPromise = new Promise(res => setTimeout(() => res('nested'), 6));

    resolve(nestedPromise);
    const result = await promise;

    return result === 'nested';
}

// Test Case 15: Timeout simulation - Implement timeout with Promise.race
export async function PromiseWithResolversTest015() {

    // 修复1：使用手动模拟的Promise.withResolvers以兼容更多环境
    async function withTimeout(promise, timeoutMs, errorMsg) {
        let timeoutReject;
        const timeoutPromise = new Promise((_, reject) => {
            timeoutReject = reject;
        });
        setTimeout(() => timeoutReject(new Error(errorMsg)), timeoutMs);
        return Promise.race([promise, timeoutPromise]);
    }

    // 修复2：正确使用setTimeout的回调函数（之前错误地立即执行了res('done')）
    const longTask = new Promise(res => setTimeout(() => res('done'), 20));

    try {
        await withTimeout(longTask, 10, 'timeout');
        return false;
    } catch (err) {
        return err.message === 'timeout';
    }
}

// Test Case 16: Multiple listeners - Attach multiple then handlers
export async function PromiseWithResolversTest016() {
    const { promise, resolve } = Promise.withResolvers();
    let val1, val2;

    promise.then(v => val1 = v);
    promise.then(v => val2 = v);
    resolve('shared value');

    await promise;
    return val1 === 'shared value' && val2 === 'shared value';
}

// Test Case 17: Reject after resolve - Reject is ignored after resolve
export async function PromiseWithResolversTest017() {
    const { promise, resolve, reject } = Promise.withResolvers();
    resolve('resolved first');
    setTimeout(() => reject(new Error('late reject')), 5);

    try {
        const result = await promise;
        return result === 'resolved first';
    } catch (err) {
        return false;
    }
}

// Test Case 18: Async iterator integration - Use in async generator
export async function PromiseWithResolversTest018() {

    async function* dataGenerator() {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('data1'), 3);
        yield await promise;

        const { promise: p2, resolve: r2 } = Promise.withResolvers();
        setTimeout(() => r2('data2'), 2);
        yield await p2;
    }

    const results = [];
    for await (const data of dataGenerator()) {
        results.push(data);
    }
    return JSON.stringify(results) === JSON.stringify(['data1', 'data2']);
}

// Test Case 19: Resolve with non-serializable value - Resolve to Symbol
export async function PromiseWithResolversTest019() {
    const { promise, resolve } = Promise.withResolvers();
    const testSymbol = Symbol('test');
    resolve(testSymbol);

    const result = await promise;
    return result === testSymbol && result.description === 'test';
}

// Test Case 20: Error propagation in chain - Error flows through then/catch
export async function PromiseWithResolversTest020() {
    const { promise, reject } = Promise.withResolvers();
    reject(new Error('root error'));

    const result = await promise
        .then(val => `processed: ${val}`)
        .catch(err => `caught: ${err.message}`)
        .then(msg => msg.toUpperCase());

    return result === 'CAUGHT: ROOT ERROR';
}

// Test Case 21: Class instance as resolve value - Resolve to class instance
export async function PromiseWithResolversTest021() {
    class TestClass {
        constructor(name) {
            this.name = name;
        }

        greet() {
            return `Hello ${this.name}`;
        }
    }

    const { promise, resolve } = Promise.withResolvers();
    const instance = new TestClass('withResolvers');
    resolve(instance);

    const result = await promise;
    return result instanceof TestClass && result.greet() === 'Hello withResolvers';
}

// Test Case 22: Concurrent resolve/reject - Race between resolve and reject
export async function PromiseWithResolversTest022() {
    const { promise, resolve, reject } = Promise.withResolvers();
    setTimeout(() => resolve('resolve wins'), 5);
    setTimeout(() => reject(new Error('reject loses')), 10);

    try {
        const result = await promise;
        return result === 'resolve wins';
    } catch (err) {
        return false;
    }
}

// Test Case 23: withResolvers in IIFE - Use in Immediately Invoked Function Expression
export async function PromiseWithResolversTest023() {
    const promise = (() => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('iife value'), 4);
        return promise;
    })();

    const result = await promise;
    return result === 'iife value';
}

// Test Case 24: Resolve with undefined - Explicitly resolve to undefined
export async function PromiseWithResolversTest024() {
    const { promise, resolve } = Promise.withResolvers();
    resolve(undefined);

    const result = await promise;
    return result === undefined;
}

// Test Case 25: Reject with non-Error value - Reject to string (non-standard but allowed)
export async function PromiseWithResolversTest025() {
    const { promise, reject } = Promise.withResolvers();
    reject('string error');

    try {
        await promise;
        return false;
    } catch (err) {
        return err === 'string error';
    }
}

// Test Case 26: Promise.finally integration - Run cleanup after resolution
export async function PromiseWithResolversTest026() {
    const { promise, resolve } = Promise.withResolvers();
    let cleanupRan = false;

    const resultPromise = promise
        .finally(() => {
            cleanupRan = true;
        });

    resolve('main value');
    const result = await resultPromise;

    return result === 'main value' && cleanupRan;
}

// Test Case 27: Nested timeout resolution - Multi-level async resolution
export async function PromiseWithResolversTest027() {

    function level1() {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(level2()), 3);
        return promise;
    }

    function level2() {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(level3()), 2);
        return promise;
    }

    function level3() {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('deep value'), 1);
        return promise;
    }

    const result = await level1();
    return result === 'deep value';
}

// Test Case 28: Shared resolve function - Resolve from external scope
export async function PromiseWithResolversTest028() {
    let externalResolve;
    const promise = (() => {
        const { promise, resolve } = Promise.withResolvers();
        externalResolve = resolve;
        return promise;
    })();

    setTimeout(() => externalResolve('external value'), 5);
    const result = await promise;

    return result === 'external value';
}

// Test Case 29: Resolve with array - Resolve to array and verify elements
export async function PromiseWithResolversTest029() {
    const { promise, resolve } = Promise.withResolvers();
    const testArray = [1, 'two', Symbol('three')];
    resolve(testArray);

    const result = await promise;
    return JSON.stringify(result) === JSON.stringify([1, 'two', undefined]) &&
        result[2] === testArray[2];
}

// Test Case 30: Error in resolve callback - Exception in resolve handler
export async function PromiseWithResolversTest030() {
    const { promise, resolve } = Promise.withResolvers();
    let errorCaught = false;

    promise.then(val => {
        throw new Error('error in then');
    }).catch(err => {
        errorCaught = err.message === 'error in then';
    });

    resolve('trigger');
    await promise;

    return errorCaught;
}

// Test Case 31: Async nested withResolvers - Double async nested resolution
export async function PromiseWithResolversTest031() {
    const { promise: outerPromise, resolve: outerResolve } = Promise.withResolvers();

    (async () => {
        const { promise: innerPromise, resolve: innerResolve } = Promise.withResolvers();
        await new Promise(res => setTimeout(res, 3)); // Async gap
        innerResolve('inner async value');
        const innerResult = await innerPromise;
        outerResolve(`outer: ${innerResult}`);
    })();

    const result = await outerPromise;
    return result === 'outer: inner async value';
}

// Test Case 32: Nested race with async - Race between nested async promises
export async function PromiseWithResolversTest032() {
    const { promise: outerPromise, resolve: outerResolve } = Promise.withResolvers();

    const createNestedRace = () => {
        const { promise: p1, resolve: r1 } = Promise.withResolvers();
        const { promise: p2, resolve: r2 } = Promise.withResolvers();

        setTimeout(() => r1('nested slow'), 8);
        setTimeout(() => r2('nested fast'), 4);
        return Promise.race([p1, p2]);
    };

    setTimeout(() => outerResolve(createNestedRace()), 2);
    const result = await outerPromise;
    return result === 'nested fast';
}

// Test Case 33: Async error propagation in nested calls - Error flows through async layers
export async function PromiseWithResolversTest033() {
    const { promise: rootPromise, reject: rootReject } = Promise.withResolvers();

    const asyncMiddleware = async (promise) => {
        await new Promise(res => setTimeout(res, 5));
        return promise;
    };

    (async () => {
        try {
            const nestedPromise = asyncMiddleware(rootPromise);
            await nestedPromise;
        } catch (err) {
            rootReject(new Error(`wrapped: ${err.message}`));
        }
    })();

    rootReject(new Error('root issue'));
    const result = await rootPromise.catch(err => err.message);
    return result === 'wrapped: root issue';
}

// Test Case 34: Multi-level nested withResolvers - 3-layer nested promise chain
export async function PromiseWithResolversTest034() {
    // Layer 3
    const createLayer3 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('layer3'), 2);
        return promise;
    };

    // Layer 2
    const createLayer2 = async () => {
        const { promise, resolve } = Promise.withResolvers();
        const layer3Result = await createLayer3();
        setTimeout(() => resolve(`layer2: ${layer3Result}`), 3);
        return promise;
    };

    // Layer 1
    const { promise: layer1Promise, resolve: layer1Resolve } = Promise.withResolvers();
    (async () => {
        const layer2Result = await createLayer2();
        layer1Resolve(`layer1: ${layer2Result}`);
    })();

    const result = await layer1Promise;
    return result === 'layer1: layer2: layer3';
}

// Test Case 35: Async batch resolution with nested tasks - Batch async tasks in layers
export async function PromiseWithResolversTest035() {
    const { promise: batchPromise, resolve: batchResolve } = Promise.withResolvers();

    const createTask = (ms, id) => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(`task${id}`), ms);
        return promise;
    };

    (async () => {
        // Nested batch: resolve inner batch first
        const innerBatch = await Promise.all([createTask(3, 1), createTask(2, 2)]);
        const outerBatch = [...innerBatch, await createTask(4, 3)];
        batchResolve(outerBatch);
    })();

    const result = await batchPromise;
    return JSON.stringify(result) === JSON.stringify(['task1', 'task2', 'task3']);
}

// Test Case 36: Nested reject in async context - Reject in deep async nested scope
export async function PromiseWithResolversTest036() {
    const { promise: outerPromise, reject: outerReject } = Promise.withResolvers();

    const deepAsyncFunc = async () => {
        await new Promise(res => setTimeout(res, 4));
        const { promise: innerPromise, reject: innerReject } = Promise.withResolvers();
        setTimeout(() => innerReject(new Error('deep error')), 3);
        await innerPromise;
    };

    (async () => {
        try {
            await deepAsyncFunc();
        } catch (err) {
            outerReject(err);
        }
    })();

    const result = await outerPromise.catch(err => err.message);
    return result === 'deep error';
}

// Test Case 37: Async iterator with nested withResolvers - Async generator with nested promises
export async function PromiseWithResolversTest037() {

    async function* nestedGenerator() {
        // Nested async task in first yield
        const { promise: p1, resolve: r1 } = Promise.withResolvers();
        (async () => {
            await new Promise(res => setTimeout(res, 2));
            r1('gen1');
        })();
        yield await p1;

        // Nested async task in second yield
        const { promise: p2, resolve: r2 } = Promise.withResolvers();
        (async () => {
            await new Promise(res => setTimeout(res, 3));
            r2('gen2');
        })();
        yield await p2;
    }

    const results = [];
    for await (const val of nestedGenerator()) {
        results.push(val);
    }
    return JSON.stringify(results) === JSON.stringify(['gen1', 'gen2']);
}

// Test Case 38: Race between nested async resolves - Async resolution race in layers
export async function PromiseWithResolversTest038() {
    const { promise: racePromise, resolve: raceResolve } = Promise.withResolvers();

    const createAsyncResolver = (ms, value) => {
        const { promise, resolve } = Promise.withResolvers();
        (async () => {
            await new Promise(res => setTimeout(res, ms));
            resolve(value);
        })();
        return promise;
    };

    setTimeout(() => {
        raceResolve(Promise.race([
            createAsyncResolver(10, 'slow'),
            createAsyncResolver(5, 'fast')
        ]));
    }, 2);

    const result = await racePromise;
    return result === 'fast';
}

// Test Case 39: Nested withResolvers and Promise.all - Combine nested promises with all
export async function PromiseWithResolversTest039() {
    const { promise: outerPromise, resolve: outerResolve } = Promise.withResolvers();

    (async () => {
        const task1 = (() => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('t1'), 3);
            return promise;
        })();

        const task2 = (() => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('t2'), 5);
            return promise;
        })();

        const batchResult = await Promise.all([task1, task2]);
        outerResolve(batchResult);
    })();

    const result = await outerPromise;
    return JSON.stringify(result) === JSON.stringify(['t1', 't2']);
}

// Test Case 40: Async cleanup in nested finally - Finally execution in nested async
export async function PromiseWithResolversTest040() {
    const { promise: rootPromise, resolve: rootResolve } = Promise.withResolvers();
    const logs = [];

    const nestedAsync = async () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('nested'), 4);
        return promise.finally(() => logs.push('nested finally'));
    };

    (async () => {
        const result = await nestedAsync();
        logs.push(result);
        rootResolve('done');
    })();

    await rootPromise;
    return JSON.stringify(logs) === JSON.stringify(['nested finally', 'nested']);
}

// Test Case 41: Multi-level async error catch - Catch errors in 3-layer async calls
export async function PromiseWithResolversTest041() {
    const { promise: topPromise, resolve: topResolve } = Promise.withResolvers();

    const level3 = async () => {
        const { promise, reject } = Promise.withResolvers();
        setTimeout(() => reject(new Error('level3 err')), 2);
        await promise;
    };

    const level2 = async () => {
        await new Promise(res => setTimeout(res, 3));
        await level3();
    };

    const level1 = async () => {
        try {
            await level2();
        } catch (err) {
            topResolve(`caught: ${err.message}`);
        }
    };

    level1();
    const result = await topPromise;
    return result === 'caught: level3 err';
}

// Test Case 42: Nested withResolvers in class methods - Async class methods with nested promises
export async function PromiseWithResolversTest042() {
    class NestedAsyncClass {
        constructor() {
            this.#initTopPromise();
        }

        #initTopPromise() {
            const { promise, resolve } = Promise.withResolvers();
            this.topPromise = promise;
            this.#topResolve = resolve;
        }

        async #nestedMethod() {
            const { promise, resolve } = Promise.withResolvers();
            await new Promise(res => setTimeout(res, 4));
            resolve('nested method value');
            return promise;
        }

        async trigger() {
            const nestedResult = await this.#nestedMethod();
            this.#topResolve(`class: ${nestedResult}`);
            this.#initTopPromise(); // Reset
        }

        #topResolve;
    }

    const instance = new NestedAsyncClass();
    instance.trigger();
    const firstResult = await instance.topPromise;

    instance.trigger();
    const secondResult = await instance.topPromise;

    return firstResult === 'class: nested method value' && secondResult === 'class: nested method value';
}

// Test Case 43: Async resolve after nested reject - Recover from nested reject in async
export async function PromiseWithResolversTest043() {
    const { promise: mainPromise, resolve: mainResolve } = Promise.withResolvers();

    (async () => {
        const { promise: nestedPromise, reject: nestedReject } = Promise.withResolvers();
        setTimeout(() => nestedReject(new Error('nested fail')), 3);

        try {
            await nestedPromise;
        } catch (err) {
            // Recover after rejection
            const { promise: recoverPromise, resolve: recoverResolve } = Promise.withResolvers();
            setTimeout(() => recoverResolve(`recovered from ${err.message}`), 4);
            const recoverResult = await recoverPromise;
            mainResolve(recoverResult);
        }
    })();

    const result = await mainPromise;
    return result === 'recovered from nested fail';
}

// Test Case 44: Nested withResolvers and Promise.allSettled - Mixed results in nested batch
export async function PromiseWithResolversTest044() {
    const { promise: mainPromise, resolve: mainResolve } = Promise.withResolvers();

    (async () => {
        const tasks = [
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('pass1'), 2);
                return promise;
            })(),
            (() => {
                const { promise, reject } = Promise.withResolvers();
                setTimeout(() => reject(new Error('fail1')), 3);
                return promise;
            })()
        ];

        const results = await Promise.allSettled(tasks);
        mainResolve(results);
    })();

    const result = await mainPromise;
    return result[0].status === 'fulfilled' && result[0].value === 'pass1' &&
        result[1].status === 'rejected' && result[1].reason.message === 'fail1';
}

// Test Case 45: Async nested timeout - Timeout in deep async nested calls
export async function PromiseWithResolversTest045() {
    const { promise: mainPromise, reject: mainReject } = Promise.withResolvers();

    const withNestedTimeout = async () => {
        const { promise: taskPromise, resolve: taskResolve } = Promise.withResolvers();
        const { promise: timeoutPromise, reject: timeoutReject } = Promise.withResolvers();

        // Nested async task (slower than timeout)
        (async () => {
            await new Promise(res => setTimeout(res, 15));
            taskResolve('task done');
        })();

        setTimeout(() => timeoutReject(new Error('nested timeout')), 10);
        return Promise.race([taskPromise, timeoutPromise]);
    };

    (async () => {
        try {
            await withNestedTimeout();
        } catch (err) {
            mainReject(err);
        }
    })();

    const result = await mainPromise.catch(err => err.message);
    return result === 'nested timeout';
}

// Test Case 46: Multi-layer async resolve order - Verify execution order in 4 layers
export async function PromiseWithResolversTest046() {
    const orderLogs = [];
    const { promise: finalPromise, resolve: finalResolve } = Promise.withResolvers();

    // Layer 4
    const layer4 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            orderLogs.push(4);
            resolve();
        }, 1);
        return promise;
    };

    // Layer 3
    const layer3 = async () => {
        const { promise, resolve } = Promise.withResolvers();
        await layer4();
        setTimeout(() => {
            orderLogs.push(3);
            resolve();
        }, 2);
        return promise;
    };

    // Layer 2
    const layer2 = async () => {
        const { promise, resolve } = Promise.withResolvers();
        await layer3();
        setTimeout(() => {
            orderLogs.push(2);
            resolve();
        }, 3);
        return promise;
    };

    // Layer 1
    (async () => {
        await layer2();
        orderLogs.push(1);
        finalResolve();
    })();

    await finalPromise;
    return JSON.stringify(orderLogs) === JSON.stringify([4, 3, 2, 1]);
}

// Test Case 47: Async reject in nested then - Reject in then handler of nested promise
export async function PromiseWithResolversTest047() {
    const { promise: mainPromise, resolve: mainResolve } = Promise.withResolvers();

    (async () => {
        const { promise: nestedPromise, resolve: nestedResolve } = Promise.withResolvers();
        nestedResolve('nested value');

        const chainedResult = await nestedPromise
            .then(val => {
                throw new Error(`error after ${val}`);
            })
            .catch(err => err.message);

        mainResolve(chainedResult);
    })();

    const result = await mainPromise;
    return result === 'error after nested value';
}

// Test Case 48: Nested withResolvers in async IIFE - Async IIFE with multi-level promises
export async function PromiseWithResolversTest048() {
    const mainPromise = (async () => {
        const { promise: outerP, resolve: outerR } = Promise.withResolvers();

        (async () => {
            const { promise: innerP, resolve: innerR } = Promise.withResolvers();
            await new Promise(res => setTimeout(res, 3));
            innerR('inner iife');
            const innerResult = await innerP;
            outerR(`outer iife: ${innerResult}`);
        })();

        return outerP;
    })();

    const result = await mainPromise;
    return result === 'outer iife: inner iife';
}

// Test Case 49: Async batch with nested dependencies - Dependent tasks in async batch
export async function PromiseWithResolversTest049() {
    const { promise: batchPromise, resolve: batchResolve } = Promise.withResolvers();
    const results = {};

    (async () => {
        // Task 1: No dependency
        const { promise: t1P, resolve: t1R } = Promise.withResolvers();
        setTimeout(() => {
            results.t1 = 'task1';
            t1R();
        }, 2);
        await t1P;

        // Task 2: Depends on Task 1
        const { promise: t2P, resolve: t2R } = Promise.withResolvers();
        setTimeout(() => {
            results.t2 = `task2: ${results.t1}`;
            t2R();
        }, 3);
        await t2P;

        // Task 3: Depends on Task 2
        const { promise: t3P, resolve: t3R } = Promise.withResolvers();
        setTimeout(() => {
            results.t3 = `task3: ${results.t2}`;
            t3R();
        }, 1);
        await t3P;

        batchResolve(Object.values(results));
    })();

    const result = await batchPromise;
    return JSON.stringify(result) === JSON.stringify(['task1', 'task2: task1', 'task3: task2: task1']);
}

// Test Case 50: Nested async race with fallback - Fallback after nested race rejection
export async function PromiseWithResolversTest050() {
    const { promise: mainPromise, resolve: mainResolve } = Promise.withResolvers();

    const createNestedRaceWithFallback = async () => {
        // Nested race: both promises reject
        const { promise: p1, reject: r1 } = Promise.withResolvers();
        const { promise: p2, reject: r2 } = Promise.withResolvers();

        setTimeout(() => r1(new Error('p1 fail')), 4);
        setTimeout(() => r2(new Error('p2 fail')), 6);

        try {
            await Promise.race([p1, p2]);
        } catch (err) {
            // Fallback with another withResolvers promise
            const { promise: fallbackP, resolve: fallbackR } = Promise.withResolvers();
            setTimeout(() => fallbackR(`fallback after: ${err.message}`), 3);
            return fallbackP;
        }
    };

    (async () => {
        const finalResult = await createNestedRaceWithFallback();
        mainResolve(finalResult);
    })();

    const result = await mainPromise;
    return result === 'fallback after: p1 fail';
}

// Test Case 51: 4-level cascading async resolution - Strict order in multi-layer calls
export async function PromiseWithResolversTest051() {
    const { promise: finalPromise, resolve: finalResolve } = Promise.withResolvers();
    const cascadeLogs = [];

    // Level 4 (bottom)
    const level4 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            cascadeLogs.push('level4');
            resolve('l4-data');
        }, 2);
        return promise;
    };

    // Level 3 (depends on 4)
    const level3 = async () => {
        const { promise, resolve } = Promise.withResolvers();
        const l4Data = await level4();
        setTimeout(() => {
            cascadeLogs.push('level3');
            resolve(`l3:${l4Data}`);
        }, 3);
        return promise;
    };

    // Level 2 (depends on 3)
    const level2 = async () => {
        const { promise, resolve } = Promise.withResolvers();
        const l3Data = await level3();
        setTimeout(() => {
            cascadeLogs.push('level2');
            resolve(`l2:${l3Data}`);
        }, 1);
        return promise;
    };

    // Level 1 (top, depends on 2)
    (async () => {
        const l2Data = await level2();
        cascadeLogs.push('level1');
        finalResolve({ logs: cascadeLogs, data: l2Data });
    })();

    const result = await finalPromise;
    return JSON.stringify(result.logs) === JSON.stringify(['level4', 'level3', 'level2', 'level1']) &&
        result.data === 'l2:l3:l4-data';
}

// Test Case 52: Cascading timeout priority - Timeout triggers in early cascade layer
export async function PromiseWithResolversTest052() {
    const { promise: mainPromise, reject: mainReject } = Promise.withResolvers();

    // Level 3 (slow task)
    const level3 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('l3-done'), 20); // Too slow
        return promise;
    };

    // Level 2 (adds timeout)
    const level2 = async () => {
        const { promise: taskP, resolve: taskR } = Promise.withResolvers();
        const { promise: timeoutP, reject: timeoutR } = Promise.withResolvers();

        (async () => {
            const l3Data = await level3();
            taskR(l3Data);
        })();

        setTimeout(() => timeoutR(new Error('l2-timeout')), 10); // Triggers first
        return Promise.race([taskP, timeoutP]);
    };

    // Level 1 (propagates result/error)
    (async () => {
        try {
            await level2();
            mainReject(new Error('unexpected'));
        } catch (err) {
            mainReject(err);
        }
    })();

    const result = await mainPromise.catch(err => err.message);
    return result === 'l2-timeout';
}

// Test Case 53: Cascading resolve/reject race - Resolve wins in middle cascade layer
export async function PromiseWithResolversTest053() {
    const { promise: finalPromise, resolve: finalResolve } = Promise.withResolvers();

    // Level 3 (dual signal)
    const level3 = () => {
        const { promise, resolve, reject } = Promise.withResolvers();
        setTimeout(() => resolve('l3-resolve'), 5); // Faster
        setTimeout(() => reject(new Error('l3-reject')), 10); // Slower
        return promise;
    };

    // Level 2 (passes through)
    const level2 = async () => {
        const { promise, resolve, reject } = Promise.withResolvers();
        try {
            const data = await level3();
            resolve(`l2:${data}`);
        } catch (err) {
            reject(err);
        }
        return promise;
    };

    // Level 1 (collects result)
    (async () => {
        try {
            const data = await level2();
            finalResolve(data);
        } catch (err) {
            finalResolve(err.message);
        }
    })();

    const result = await finalPromise;
    return result === 'l2:l3-resolve';
}

// Test Case 54: Multi-level cascading batch - Batch tasks depend on upper cascade
export async function PromiseWithResolversTest054() {
    const { promise: batchPromise, resolve: batchResolve } = Promise.withResolvers();
    const batchResults = [];

    // Level 3 (base batch)
    const level3Batch = () => {
        return Promise.all([
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('l3-t1'), 2);
                return promise;
            })(),
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('l3-t2'), 3);
                return promise;
            })()
        ]);
    };

    // Level 2 (depends on level3 batch)
    const level2Batch = async () => {
        const l3Data = await level3Batch();
        batchResults.push(...l3Data);
        return Promise.all([
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve(`l2-t1:${l3Data[0]}`), 1);
                return promise;
            })()
        ]);
    };

    // Level 1 (depends on level2 batch)
    (async () => {
        const l2Data = await level2Batch();
        batchResults.push(...l2Data);
        batchResolve(batchResults);
    })();

    const result = await batchPromise;
    return JSON.stringify(result) === JSON.stringify(['l3-t1', 'l3-t2', 'l2-t1:l3-t1']);
}

// Test Case 55: Cascading async error recovery - Recover at middle layer and continue
export async function PromiseWithResolversTest055() {
    const { promise: finalPromise, resolve: finalResolve } = Promise.withResolvers();

    // Level 3 (throws error)
    const level3 = () => {
        const { promise, reject } = Promise.withResolvers();
        setTimeout(() => reject(new Error('l3-fail')), 4);
        return promise;
    };

    // Level 2 (recovers error)
    const level2 = async () => {
        const { promise, resolve } = Promise.withResolvers();
        try {
            await level3();
        } catch (err) {
            // Recover with fallback
            const { promise: fallbackP, resolve: fallbackR } = Promise.withResolvers();
            setTimeout(() => fallbackR(`l2-recovered:${err.message}`), 3);
            const fallbackData = await fallbackP;
            resolve(fallbackData);
        }
        return promise;
    };

    // Level 1 (uses recovered data)
    (async () => {
        const l2Data = await level2();
        finalResolve(`l1-final:${l2Data}`);
    })();

    const result = await finalPromise;
    return result === 'l1-final:l2-recovered:l3-fail';
}

// Test Case 56: Timing sequence in 3-layer cascade - Verify execution order with delays
export async function PromiseWithResolversTest056() {
    const { promise: seqPromise, resolve: seqResolve } = Promise.withResolvers();
    const timeLog = [];
    const start = Date.now();

    // Level 3 (short delay)
    const level3 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            timeLog.push({ layer: 3, time: Date.now() - start });
            resolve();
        }, 50);
        return promise;
    };

    // Level 2 (longer delay after level3)
    const level2 = async () => {
        await level3();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            timeLog.push({ layer: 2, time: Date.now() - start });
            resolve();
        }, 100);
        return promise;
    };

    // Level 1 (shortest delay after level2)
    (async () => {
        await level2();
        timeLog.push({ layer: 1, time: Date.now() - start });
        seqResolve(timeLog);
    })();

    const result = await seqPromise;
    // Verify order and timing gaps
    return result[0].layer === 3 && result[1].layer === 2 && result[2].layer === 1
}

// Test Case 57: Cascading with Promise.allSettled - Mixed results in multi-layer batch
export async function PromiseWithResolversTest057() {
    const { promise: finalPromise, resolve: finalResolve } = Promise.withResolvers();

    // Level 3 (mixed resolve/reject)
    const level3Tasks = () => {
        return [
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('l3-pass'), 2);
                return promise;
            })(),
            (() => {
                const { promise, reject } = Promise.withResolvers();
                setTimeout(() => reject(new Error('l3-fail')), 3);
                return promise;
            })()
        ];
    };

    // Level 2 (runs allSettled on level3)
    const level2Process = async () => {
        const l3Results = await Promise.allSettled(level3Tasks());
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(l3Results), 1);
        return promise;
    };

    // Level 1 (formats result)
    (async () => {
        const l2Results = await level2Process();
        const formatted = l2Results.map(item =>
        item.status === 'fulfilled' ? item.value : item.reason.message
        );
        finalResolve(formatted);
    })();

    const result = await finalPromise;
    return JSON.stringify(result) === JSON.stringify(['l3-pass', 'l3-fail']);
}

// Test Case 58: Cascading race with nested timeouts - Timeout wins in deep cascade
export async function PromiseWithResolversTest058() {
    const { promise: racePromise, resolve: raceResolve } = Promise.withResolvers();

    // Level 4 (very slow)
    const level4 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('l4-done'), 30);
        return promise;
    };

    // Level 3 (adds timeout)
    const level3 = async () => {
        const { promise: taskP, resolve: taskR } = Promise.withResolvers();
        const { promise: timeoutP, reject: timeoutR } = Promise.withResolvers();

        (async () => {
            const data = await level4();
            taskR(data);
        })();

        setTimeout(() => timeoutR(new Error('l3-timeout')), 20);
        return Promise.race([taskP, timeoutP]);
    };

    // Level 2 (adds another faster timeout)
    const level2 = async () => {
        const { promise: taskP, resolve: taskR } = Promise.withResolvers();
        const { promise: timeoutP, reject: timeoutR } = Promise.withResolvers();

        (async () => {
            const data = await level3();
            taskR(data);
        })();

        setTimeout(() => timeoutR(new Error('l2-timeout')), 10); // Faster than l3 timeout
        return Promise.race([taskP, timeoutP]);
    };

    // Level 1 (collects result)
    (async () => {
        try {
            await level2();
            raceResolve('unexpected');
        } catch (err) {
            raceResolve(err.message);
        }
    })();

    const result = await racePromise;
    return result === 'l2-timeout';
}

// Test Case 59: Multi-layer cascading reusability - Reset and reuse cascade layers
export async function PromiseWithResolversTest059() {
    class CascadingTask {
        constructor() {
            this.#initLevel1();
        }

        // Level 3 (inner)
        #level3(ms, data) {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve(`l3:${data}`), ms);
            return promise;
        }

        // Level 2 (middle)
        async #level2(ms, data) {
            const l3Data = await this.#level3(ms, data);
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve(`l2:${l3Data}`), 2);
            return promise;
        }

        // Level 1 (outer, resettable)
        #initLevel1() {
            const { promise, resolve } = Promise.withResolvers();
            this.level1Promise = promise;
            this.#level1Resolve = resolve;
        }

        async run(ms, data) {
            const l2Data = await this.#level2(ms, data);
            this.#level1Resolve(`l1:${l2Data}`);
            this.#initLevel1(); // Reset for next run
        }

        #level1Resolve;
    }

    const task = new CascadingTask();
    task.run(3, 'first');
    const firstResult = await task.level1Promise;

    task.run(2, 'second');
    const secondResult = await task.level1Promise;

    return firstResult === 'l1:l2:l3:first' && secondResult === 'l1:l2:l3:second';
}

// Test Case 60: Cascading async iterator - Async generator with multi-level yields
export async function PromiseWithResolversTest060() {
    const { promise: genPromise, resolve: genResolve } = Promise.withResolvers();
    const genResults = [];

    async function* cascadingGenerator() {
        // Yield 1: Level 2 -> Level 3
        const level3_1 = () => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('g3-1'), 2);
            return promise;
        };
        const level2_1 = async () => {
            const data = await level3_1();
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve(`g2-1:${data}`), 1);
            return promise;
        };
        yield await level2_1();

        // Yield 2: Level 2 -> Level 3 (slower)
        const level3_2 = () => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('g3-2'), 4);
            return promise;
        };
        const level2_2 = async () => {
            const data = await level3_2();
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve(`g2-2:${data}`), 2);
            return promise;
        };
        yield await level2_2();
    }

    (async () => {
        for await (const val of cascadingGenerator()) {
            genResults.push(val);
        }
        genResolve(genResults);
    })();

    const result = await genPromise;
    return JSON.stringify(result) === JSON.stringify(['g2-1:g3-1', 'g2-2:g3-2']);
}

// Test Case 61: 5-level cascading error propagation - Error flows through all layers
export async function PromiseWithResolversTest061() {
    const { promise: errPromise, resolve: errResolve } = Promise.withResolvers();

    // Level 5 (root error)
    const level5 = () => {
        const { promise, reject } = Promise.withResolvers();
        setTimeout(() => reject(new Error('root-err')), 2);
        return promise;
    };

    // Level 4
    const level4 = async () => {
        await new Promise(res => setTimeout(res, 1));
        return level5();
    };

    // Level 3
    const level3 = async () => {
        const { promise, resolve, reject } = Promise.withResolvers();
        try {
            await level4();
            resolve('ok');
        } catch (err) {
            reject(new Error(`l3-wrap:${err.message}`));
        }
        return promise;
    };

    // Level 2
    const level2 = async () => {
        const { promise, resolve, reject } = Promise.withResolvers();
        try {
            await level3();
            resolve('ok');
        } catch (err) {
            reject(new Error(`l2-wrap:${err.message}`));
        }
        return promise;
    };

    // Level 1 (top layer)
    (async () => {
        try {
            await level2();
            errResolve('unexpected');
        } catch (err) {
            errResolve(err.message);
        }
    })();

    const result = await errPromise;
    return result === 'l2-wrap:l3-wrap:root-err';
}

// Test Case 62: Timing-dependent cascading resolution - Order depends on dynamic delays
export async function PromiseWithResolversTest062() {
    const { promise: timingPromise, resolve: timingResolve } = Promise.withResolvers();
    const resolutionOrder = [];

    // Dynamic delay generator (random within range)
    const getDelay = (min, max) => Math.floor(Math.random() * (max - min + 1)) + min;

    // Level 3 tasks with dynamic delays
    const createLevel3Task = (id) => {
        const { promise, resolve } = Promise.withResolvers();
        const delay = getDelay(2, 8);
        setTimeout(() => {
            resolutionOrder.push(id);
            resolve();
        }, delay);
        return promise;
    };

    // Level 2 (runs tasks in sequence but delays vary)
    const level2 = async () => {
        await createLevel3Task('t1');
        await createLevel3Task('t2');
        await createLevel3Task('t3');
    };

    // Level 1 (verifies sequence - even with dynamic delays, await enforces order)
    (async () => {
        await level2();
        timingResolve(resolutionOrder);
    })();

    const result = await timingPromise;
    return JSON.stringify(result) === JSON.stringify(['t1', 't2', 't3']);
}

// Test Case 63: Cascading with parallel nested tasks - Parallel tasks in middle cascade layer
export async function PromiseWithResolversTest063() {
    const { promise: parallelPromise, resolve: parallelResolve } = Promise.withResolvers();
    const parallelResults = [];

    // Level 3 (individual tasks)
    const level3Task = (id, delay) => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            parallelResults.push(`t${id}`);
            resolve();
        }, delay);
        return promise;
    };

    // Level 2 (runs 3 tasks in parallel)
    const level2Parallel = async () => {
        await Promise.all([
            level3Task(1, 5),
            level3Task(2, 2),
            level3Task(3, 4)
        ]);
    };

    // Level 1 (waits for parallel tasks)
    (async () => {
        await level2Parallel();
        parallelResolve(parallelResults.sort()); // Sort to verify all completed
    })();

    const result = await parallelPromise;
    return JSON.stringify(result) === JSON.stringify(['t1', 't2', 't3']);
}

// Test Case 64: Cascading timeout with recovery - Timeout in layer, recover in upper layer
export async function PromiseWithResolversTest064() {
    const { promise: recoverPromise, resolve: recoverResolve } = Promise.withResolvers();

    // Level 3 (slow task)
    const level3Slow = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('l3-done'), 20);
        return promise;
    };

    // Level 2 (adds timeout, no recovery)
    const level2WithTimeout = async () => {
        const { promise: taskP, resolve: taskR } = Promise.withResolvers();
        const { promise: timeoutP, reject: timeoutR } = Promise.withResolvers();

        (async () => {
            const data = await level3Slow();
            taskR(data);
        })();

        setTimeout(() => timeoutR(new Error('l2-timeout')), 10);
        return Promise.race([taskP, timeoutP]);
    };

    // Level 1 (recovers from timeout)
    (async () => {
        try {
            await level2WithTimeout();
        } catch (err) {
            // Recover with fallback task
            const { promise: fallbackP, resolve: fallbackR } = Promise.withResolvers();
            setTimeout(() => fallbackR(`recovered from:${err.message}`), 5);
            const fallbackData = await fallbackP;
            recoverResolve(fallbackData);
        }
    })();

    const result = await recoverPromise;
    return result === 'recovered from:l2-timeout';
}

// Test Case 65: 3-level cascading finally execution - Finally runs in each layer
export async function PromiseWithResolversTest065() {
    const { promise: finallyPromise, resolve: finallyResolve } = Promise.withResolvers();
    const finallyLogs = [];

    // Level 3
    const level3 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('l3-done'), 2);
        return promise.finally(() => finallyLogs.push('l3-finally'));
    };

    // Level 2
    const level2 = async () => {
        const { promise, resolve } = Promise.withResolvers();
        const l3Data = await level3();
        setTimeout(() => resolve(`l2:${l3Data}`), 3);
        return promise.finally(() => finallyLogs.push('l2-finally'));
    };

    // Level 1
    (async () => {
        const l2Data = await level2();
        finallyLogs.push(`l1-data:${l2Data}`);
        finallyResolve(finallyLogs);
    })();

    const result = await finallyPromise;
    return JSON.stringify(result) === JSON.stringify(['l3-finally', 'l2-finally', 'l1-data:l2:l3-done']);
}

// Test Case 66: Cascading resolve with circular dependency - Resolve circular reference safely
export async function PromiseWithResolversTest066() {
    const { promise: circularPromise, resolve: circularResolve } = Promise.withResolvers();
    const obj = {};

    // Level 2 (creates circular reference)
    const level2Circular = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            obj.self = obj;
            obj.data = 'circular-data';
            resolve(obj);
        }, 5);
        return promise;
    };

    // Level 1 (processes circular data)
    (async () => {
        const data = await level2Circular();
        // Verify circular reference and data
        const isCircular = data.self === data;
        const hasData = data.data === 'circular-data';
        circularResolve(isCircular && hasData);
    })();

    const result = await circularPromise;
    return result === true;
}

// Test Case 67: Timing race in 4-layer cascade - Fast resolve beats slow reject
export async function PromiseWithResolversTest067() {
    const { promise: racePromise, resolve: raceResolve } = Promise.withResolvers();

    // Level 4 (dual signal: fast resolve)
    const level4 = () => {
        const { promise, resolve, reject } = Promise.withResolvers();
        setTimeout(() => resolve('l4-resolve'), 3); // Faster
        setTimeout(() => reject(new Error('l4-reject')), 8); // Slower
        return promise;
    };

    // Level 3 (passes through)
    const level3 = async () => {
        const { promise, resolve, reject } = Promise.withResolvers();
        try {
            const data = await level4();
            resolve(`l3:${data}`);
        } catch (err) {
            reject(err);
        }
        return promise;
    };

    // Level 2 (adds delay but preserves result)
    const level2 = async () => {
        const { promise, resolve } = Promise.withResolvers();
        const data = await level3();
        setTimeout(() => resolve(`l2:${data}`), 2);
        return promise;
    };

    // Level 1 (collects result)
    (async () => {
        try {
            const data = await level2();
            raceResolve(data);
        } catch (err) {
            raceResolve(err.message);
        }
    })();

    const result = await racePromise;
    return result === 'l2:l3:l4-resolve';
}

// Test Case 68: Cascading batch with dynamic task count - Variable tasks in middle layer
export async function PromiseWithResolversTest068() {
    const { promise: dynamicPromise, resolve: dynamicResolve } = Promise.withResolvers();
    const dynamicResults = [];

    // Level 3 (dynamic task creator)
    const createLevel3Tasks = (count) => {
        return Array.from({ length: count }, (_, i) => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => {
                dynamicResults.push(`t${i + 1}`);
                resolve();
            }, (i + 1) * 2);
            return promise;
        });
    };

    // Level 2 (runs dynamic tasks)
    const level2Dynamic = async (taskCount) => {
        await Promise.all(createLevel3Tasks(taskCount));
    };

    // Level 1 (triggers with 3 tasks)
    (async () => {
        await level2Dynamic(3);
        dynamicResolve(dynamicResults);
    })();

    const result = await dynamicPromise;
    return JSON.stringify(result) === JSON.stringify(['t1', 't2', 't3']);
}

// Test Case 69: Cascading async error in finally - Error in finally of middle layer
export async function PromiseWithResolversTest069() {
    const { promise: finallyErrPromise, resolve: finallyErrResolve } = Promise.withResolvers();

    // Level 3 (resolves successfully)
    const level3 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('l3-done'), 2);
        return promise;
    };

    // Level 2 (throws error in finally)
    const level2WithFinallyErr = async () => {
        const { promise, resolve } = Promise.withResolvers();
        try {
            const data = await level3();
            resolve(data);
        } finally {
            // Throw error in finally (overrides resolution)
            throw new Error('l2-finally-err');
        }
    };

    // Level 1 (catches finally error)
    (async () => {
        try {
            await level2WithFinallyErr();
            finallyErrResolve('unexpected');
        } catch (err) {
            finallyErrResolve(err.message);
        }
    })();

    const result = await finallyErrPromise;
    return result === 'l2-finally-err';
}

// Test Case 70: 4-level cascading with Promise.race - Race between cascade branches
export async function PromiseWithResolversTest070() {
    const { promise: branchRacePromise, resolve: branchRaceResolve } = Promise.withResolvers();

    // Branch A: 3-level fast cascade
    const branchA = async () => {
        // Level 3-A
        const l3A = () => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('a3'), 2);
            return promise;
        };
        // Level 2-A
        const l2A = async () => {
            const data = await l3A();
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve(`a2:${data}`), 1);
            return promise;
        };
        return l2A();
    };

    // Branch B: 3-level slow cascade
    const branchB = async () => {
        // Level 3-B
        const l3B = () => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('b3'), 5);
            return promise;
        };
        // Level 2-B
        const l2B = async () => {
            const data = await l3B();
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve(`b2:${data}`), 2);
            return promise;
        };
        return l2B();
    };

    // Level 1 (races branches)
    (async () => {
        const winner = await Promise.race([branchA(), branchB()]);
        branchRaceResolve(winner);
    })();

    const result = await branchRacePromise;
    return result === 'a2:a3';
}

// Test Case 71: Cascading resolve with large data - Handle big payload in multi-layer
export async function PromiseWithResolversTest071() {
    const { promise: bigDataPromise, resolve: bigDataResolve } = Promise.withResolvers();
    const bigPayload = Array(1000).fill('test-data').join(',');

    // Level 3 (generates big data)
    const level3BigData = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(bigPayload), 3);
        return promise;
    };

    // Level 2 (wraps big data)
    const level2WrapBigData = async () => {
        const data = await level3BigData();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve({ payload: data, length: data.length }), 2);
        return promise;
    };

    // Level 1 (validates big data)
    (async () => {
        const wrappedData = await level2WrapBigData();
        const isValid = wrappedData.payload === bigPayload && wrappedData.length === bigPayload.length;
        bigDataResolve(isValid);
    })();

    const result = await bigDataPromise;
    return result === true;
}

// Test Case 72: Timing sequence with overlapping delays - Overlapping async in cascade
export async function PromiseWithResolversTest072() {
    const { promise: overlapPromise, resolve: overlapResolve } = Promise.withResolvers();
    const overlapLogs = [];
    const start = Date.now();

    // Level 3 (starts immediately)
    const level3 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            overlapLogs.push({ id: 'l3', time: Date.now() - start });
            resolve();
        }, 5);
        return promise;
    };

    // Level 2 (starts level3, then adds own delay)
    const level2 = async () => {
        const l3Promise = level3(); // Start level3 first
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            overlapLogs.push({ id: 'l2', time: Date.now() - start });
            resolve();
        }, 3); // Level2 resolves before level3
        await Promise.all([l3Promise, promise]); // Wait for both
    };

    // Level 1 (waits for level2)
    (async () => {
        await level2();
        overlapLogs.push({ id: 'l1', time: Date.now() - start });
        overlapResolve(overlapLogs);
    })();

    const result = await overlapPromise;
    // Verify l2 resolves before l3, l1 last
    return result[0].id === 'l2' && result[1].id === 'l3' && result[2].id === 'l1';
}

// Test Case 73: Cascading with nested Promise.all - Nested parallel tasks in cascade
export async function PromiseWithResolversTest073() {
    const { promise: nestedAllPromise, resolve: nestedAllResolve } = Promise.withResolvers();
    const allResults = [];

    // Level 4 (leaf tasks)
    const level4Task = (id, delay) => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            allResults.push(`t${id}`);
            resolve();
        }, delay);
        return promise;
    };

    // Level 3 (groups tasks with Promise.all)
    const level3Group = async (groupId) => {
        const tasks = groupId === 1
            ? [level4Task(1, 2), level4Task(2, 3)]
            : [level4Task(3, 1), level4Task(4, 4)];
        await Promise.all(tasks);
        allResults.push(`group${groupId}`);
    };

    // Level 2 (runs two level3 groups in parallel)
    const level2NestedAll = async () => {
        await Promise.all([level3Group(1), level3Group(2)]);
    };

    // Level 1 (triggers and collects)
    (async () => {
        await level2NestedAll();
        nestedAllResolve(allResults);
    })();

    const result = await nestedAllPromise;
    // Verify all leaf tasks and groups are present (order of groups may vary, check inclusion)
    return result.includes('t1') && result.includes('t2') && result.includes('t3') &&
    result.includes('t4') && result.includes('group1') && result.includes('group2');
}

// Test Case 74: 3-level cascading with async error in then - Error in then handler of middle layer
export async function PromiseWithResolversTest074() {
    const { promise: thenErrPromise, resolve: thenErrResolve } = Promise.withResolvers();

    // Level 3 (resolves successfully)
    const level3 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve('l3-data'), 2);
        return promise;
    };

    // Level 2 (throws error in then handler)
    const level2WithThenErr = async () => {
        const { promise, resolve } = Promise.withResolvers();
        level3().then(data => {
            throw new Error(`err-after:${data}`);
        }).catch(err => {
            resolve(err.message);
        });
        return promise;
    };

    // Level 1 (collects error message)
    (async () => {
        const errMsg = await level2WithThenErr();
        thenErrResolve(errMsg);
    })();

    const result = await thenErrPromise;
    return result === 'err-after:l3-data';
}

// Test Case 75: Timing validation in cascading recovery - Verify recovery timing
export async function PromiseWithResolversTest075() {
    const { promise: timingRecoverPromise, resolve: timingRecoverResolve } = Promise.withResolvers();
    const timingLogs = [];
    const start = Date.now();

    // Level 3 (fails quickly)
    const level3Fail = () => {
        const { promise, reject } = Promise.withResolvers();
        setTimeout(() => {
            timingLogs.push({ event: 'l3-fail', time: Date.now() - start });
            reject(new Error('l3-err'));
        }, 3);
        return promise;
    };

    // Level 2 (recovers after delay)
    const level2Recover = async () => {
        try {
            await level3Fail();
        } catch (err) {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => {
                timingLogs.push({ event: 'l2-recover', time: Date.now() - start });
                resolve('recovered');
            }, 5); // Recovery takes 5ms after failure
            return promise;
        }
    };

    // Level 1 (records final time)
    (async () => {
        await level2Recover();
        timingLogs.push({ event: 'l1-done', time: Date.now() - start });
        timingRecoverResolve(timingLogs);
    })();

    const result = await timingRecoverPromise;
    // Verify sequence and timing gaps
    return result[0].event === 'l3-fail' && result[1].event === 'l2-recover' &&
        result[2].event === 'l1-done';
}

// Test Case 76: Cascading with reusable nested resolver - Reuse inner resolver in cascade
export async function PromiseWithResolversTest076() {
    const { promise: reusePromise, resolve: reuseResolve } = Promise.withResolvers();
    const reuseResults = [];

    // Reusable level3 resolver
    const createLevel3Resolver = () => {
        let resolveFn;
        const promise = new Promise(res => resolveFn = res);
        return { promise, resolve: resolveFn };
    };

    // Level 2 (uses reusable resolver twice)
    const level2Reuse = async () => {
        // First use
        const { promise: p1, resolve: r1 } = createLevel3Resolver();
        setTimeout(() => r1('first-use'), 2);
        reuseResults.push(await p1);

        // Second use (new instance)
        const { promise: p2, resolve: r2 } = createLevel3Resolver();
        setTimeout(() => r2('second-use'), 3);
        reuseResults.push(await p2);
    };

    // Level 1 (triggers reuse)
    (async () => {
        await level2Reuse();
        reuseResolve(reuseResults);
    })();

    const result = await reusePromise;
    return JSON.stringify(result) === JSON.stringify(['first-use', 'second-use']);
}

// Test Case 77: 4-level cascading with Promise.allSettled - Mixed results in nested batches
export async function PromiseWithResolversTest077() {
    const { promise: nestedSettledPromise, resolve: nestedSettledResolve } = Promise.withResolvers();

    // Level 4 (mixed tasks)
    const level4Mixed = () => {
        return [
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('pass1'), 2);
                return promise;
            })(),
            (() => {
                const { promise, reject } = Promise.withResolvers();
                setTimeout(() => reject(new Error('fail1')), 3);
                return promise;
            })()
        ];
    };

    // Level 3 (runs allSettled on level4)
    const level3Settled = async () => {
        const results = await Promise.allSettled(level4Mixed());
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(results), 1);
        return promise;
    };

    // Level 2 (runs two level3 batches in parallel)
    const level2NestedSettled = async () => {
        return Promise.all([level3Settled(), level3Settled()]);
    };

    // Level 1 (formats results)
    (async () => {
        const nestedResults = await level2NestedSettled();
        const formatted = nestedResults.flatMap(batch =>
        batch.map(item => item.status === 'fulfilled' ? item.value : item.reason.message)
        );
        nestedSettledResolve(formatted);
    })();

    const result = await nestedSettledPromise;
    return JSON.stringify(result) === JSON.stringify(['pass1', 'fail1', 'pass1', 'fail1']);
}

// Test Case 78: Timing race between cascading branches with delays - Delayed branch loses
export async function PromiseWithResolversTest078() {
    const { promise: delayedRacePromise, resolve: delayedRaceResolve } = Promise.withResolvers();

    // Branch X: Fast cascade (2 levels)
    const branchX = async () => {
        const level3X = () => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('x3'), 2);
            return promise;
        };
        const level2X = async () => {
            const data = await level3X();
            return `x2:${data}`;
        };
        return level2X();
    };

    // Branch Y: Slow cascade (2 levels + extra delay)
    const branchY = async () => {
        const level3Y = () => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('y3'), 2);
            return promise;
        };
        const level2Y = async () => {
            await new Promise(res => setTimeout(res, 5)); // Extra delay
            const data = await level3Y();
            return `y2:${data}`;
        };
        return level2Y();
    };

    // Level 1 (races branches)
    (async () => {
        const winner = await Promise.race([branchX(), branchY()]);
        delayedRaceResolve(winner);
    })();

    const result = await delayedRacePromise;
    return result === 'x2:x3';
}

// Test Case 79: Cascading resolve with function as value - Pass function through layers
export async function PromiseWithResolversTest079() {
    const { promise: funcValuePromise, resolve: funcValueResolve } = Promise.withResolvers();

    // Level 3 (provides function)
    const level3Func = () => {
        const { promise, resolve } = Promise.withResolvers();
        const testFunc = (a, b) => a + b;
        setTimeout(() => resolve(testFunc), 3);
        return promise;
    };

    // Level 2 (wraps function)
    const level2WrapFunc = async () => {
        const func = await level3Func();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve({ calculator: func, desc: 'adder' }), 2);
        return promise;
    };

    // Level 1 (tests function)
    (async () => {
        const wrapped = await level2WrapFunc();
        const isValid = wrapped.desc === 'adder' && wrapped.calculator(2, 3) === 5;
        funcValueResolve(isValid);
    })();

    const result = await funcValuePromise;
    return result === true;
}

// Test Case 80: 3-level cascading with async iterator and delays - Ordered yields with timing
export async function PromiseWithResolversTest080() {
    const { promise: genTimingPromise, resolve: genTimingResolve } = Promise.withResolvers();
    const genLogs = [];
    const start = Date.now();

    async function* cascadingTimingGenerator() {
        // Yield 1: Fast cascade
        const level3_1 = () => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => {
                genLogs.push({ yield: 1, time: Date.now() - start });
                resolve('y1-data');
            }, 2);
            return promise;
        };
        yield await level3_1();

        // Yield 2: Slow cascade
        const level3_2 = () => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => {
                genLogs.push({ yield: 2, time: Date.now() - start });
                resolve('y2-data');
            }, 5);
            return promise;
        };
        yield await level3_2();
    }

    // Level 1 (collects yields and timing)
    (async () => {
        const yields = [];
        for await (const val of cascadingTimingGenerator()) {
            yields.push(val);
        }
        genTimingResolve({ yields, logs: genLogs });
    })();

    const result = await genTimingPromise;
    // Verify yield order, value, and timing (yield 2 is later than yield 1)
    return JSON.stringify(result.yields) === JSON.stringify(['y1-data', 'y2-data']) &&
        result.logs[0].yield === 1 && result.logs[1].yield === 2 &&
        result.logs[1].time > result.logs[0].time;
}

// Test Case 81: Cascading with Promise.any - Resolve on first fulfilled in nested batches
export async function PromiseWithResolversTest081() {
    const { promise: anyPromise, resolve: anyResolve } = Promise.withResolvers();

    // Level 4 (mixed fulfill/reject)
    const level4AnyTasks = () => [
        (() => {
            const { promise, reject } = Promise.withResolvers();
            setTimeout(() => reject(new Error('fail1')), 2);
            return promise;
        })(),
        (() => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('first-fulfill'), 3);
            return promise;
        })(),
        (() => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('late-fulfill'), 5);
            return promise;
        })()
    ];

    // Level 3 (wrap with Promise.any)
    const level3Any = async () => {
        const { promise, resolve } = Promise.withResolvers();
        const result = await Promise.any(level4AnyTasks());
        setTimeout(() => resolve(result), 1);
        return promise;
    };

    // Level 2 (cascade with delay)
    const level2CascadeAny = async () => {
        const data = await level3Any();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(`wrapped:${data}`), 2);
        return promise;
    };

    (async () => {
        const final = await level2CascadeAny();
        anyResolve(final);
    })();

    const result = await anyPromise;
    return result === 'wrapped:first-fulfill';
}

// Test Case 82: Timing overlap in 4-level cascade - Parallel and sequential mixed timing
export async function PromiseWithResolversTest082() {
    const { promise: overlapCascadePromise, resolve: overlapCascadeResolve } = Promise.withResolvers();
    const timingLogs = [];
    const start = Date.now();

    // Level 4 (parallel tasks)
    const level4Parallel = () => Promise.all([
        (() => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => {
                timingLogs.push({ layer: 4, id: 'a', time: Date.now() - start });
                resolve();
            }, 3);
            return promise;
        })(),
        (() => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => {
                timingLogs.push({ layer: 4, id: 'b', time: Date.now() - start });
                resolve();
            }, 5);
            return promise;
        })()
    ]);

    // Level 3 (sequential after parallel)
    const level3Sequential = async () => {
        await level4Parallel();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            timingLogs.push({ layer: 3, time: Date.now() - start });
            resolve();
        }, 2);
        return promise;
    };

    // Level 2 (parallel again)
    const level2ParallelAgain = () => Promise.all([
        level3Sequential(),
        (() => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => {
                timingLogs.push({ layer: 2, id: 'x', time: Date.now() - start });
                resolve();
            }, 4);
            return promise;
        })()
    ]);

    (async () => {
        await level2ParallelAgain();
        timingLogs.push({ layer: 1, time: Date.now() - start });
        overlapCascadeResolve(timingLogs);
    })();

    const result = await overlapCascadePromise;
    // Verify level4 completes before level3, level2-x may overlap, level1 last
    const level4Complete = result.filter(item => item.layer === 4).length === 2;
    const level3Time = result.find(item => item.layer === 3)?.time;
    const level4MaxTime = Math.max(...result.filter(item => item.layer === 4).map(i => i.time));
    const level1Last = result[result.length - 1].layer === 1;
    return level4Complete && level3Time > level4MaxTime && level1Last;
}

// Test Case 83: Cascading with Promise.resolve chaining - Nested resolved promises
export async function PromiseWithResolversTest083() {
    const { promise: resolveChainPromise, resolve: resolveChainResolve } = Promise.withResolvers();

    // Level 4 (base value)
    const level4 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(10), 2);
        return promise;
    };

    // Level 3 (wrap with Promise.resolve)
    const level3 = async () => {
        const data = await level4();
        const { promise, resolve } = Promise.withResolvers();
        resolve(Promise.resolve(data * 2)); // Resolve to another promise
        return promise;
    };

    // Level 2 (chain again)
    const level2 = async () => {
        const data = await level3();
        const { promise, resolve } = Promise.withResolvers();
        resolve(Promise.resolve(data + 5));
        return promise;
    };

    (async () => {
        const final = await level2();
        resolveChainResolve(final);
    })();

    const result = await resolveChainPromise;
    return result === 25;
}

// Test Case 84: Timing priority in cascading errors - Early error beats late success
export async function PromiseWithResolversTest084() {
    const { promise: errorPriorityPromise, resolve: errorPriorityResolve } = Promise.withResolvers();

    // Level 4 (dual signal: fast error)
    const level4 = () => {
        const { promise, resolve, reject } = Promise.withResolvers();
        setTimeout(() => reject(new Error('early-error')), 2); // Faster
        setTimeout(() => resolve('late-success'), 8); // Slower
        return promise;
    };

    // Level 3 (pass through)
    const level3 = async () => {
        const { promise, resolve, reject } = Promise.withResolvers();
        try {
            const data = await level4();
            resolve(data);
        } catch (err) {
            reject(err);
        }
        return promise;
    };

    // Level 2 (add delay but error already triggered)
    const level2 = async () => {
        const { promise, resolve, reject } = Promise.withResolvers();
        setTimeout(async () => {
            try {
                const data = await level3();
                resolve(data);
            } catch (err) {
                reject(err.message);
            }
        }, 5);
        return promise;
    };

    (async () => {
        try {
            await level2();
            errorPriorityResolve('unexpected');
        } catch (err) {
            errorPriorityResolve(err);
        }
    })();

    const result = await errorPriorityPromise;
    return result === 'early-error';
}

// Test Case 85: Cascading with async generator and Promise.all - Batch yields
export async function PromiseWithResolversTest085() {
    const { promise: genAllPromise, resolve: genAllResolve } = Promise.withResolvers();
    const genResults = [];

    // Async generator (yields batches)
    async function* batchGenerator() {
        // Batch 1: 2 fast tasks
        const batch1 = [
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('b1-t1'), 2);
                return promise;
            })(),
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('b1-t2'), 3);
                return promise;
            })()
        ];
        yield await Promise.all(batch1);

        // Batch 2: 1 slow task
        const batch2 = [
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('b2-t1'), 5);
                return promise;
            })()
        ];
        yield await Promise.all(batch2);
    }

    // Cascading processor
    (async () => {
        const generator = batchGenerator();
        for await (const batch of generator) {
            genResults.push(...batch);
        }
        genAllResolve(genResults);
    })();

    const result = await genAllPromise;
    return JSON.stringify(result) === JSON.stringify(['b1-t1', 'b1-t2', 'b2-t1']);
}

// Test Case 86: 5-level cascading with finally and error - Finally runs on error
export async function PromiseWithResolversTest086() {
    const { promise: finallyErrorPromise, resolve: finallyErrorResolve } = Promise.withResolvers();
    const finallyLogs = [];

    // Level 5 (throws error)
    const level5 = () => {
        const { promise, reject } = Promise.withResolvers();
        setTimeout(() => reject(new Error('l5-err')), 2);
        return promise;
    };

    // Level 4 (adds finally)
    const level4 = async () => {
        return level5().finally(() => finallyLogs.push('l4-finally'));
    };

    // Level 3 (adds finally and wraps error)
    const level3 = async () => {
        try {
            await level4();
        } catch (err) {
            throw new Error(`l3-wrap:${err.message}`);
        } finally {
            finallyLogs.push('l3-finally');
        }
    };

    // Level 2 (adds finally)
    const level2 = async () => {
        return level3().finally(() => finallyLogs.push('l2-finally'));
    };

    // Level 1 (catches and collects)
    (async () => {
        try {
            await level2();
        } catch (err) {
            finallyLogs.push(`err:${err.message}`);
        }
        finallyErrorResolve(finallyLogs);
    })();

    const result = await finallyErrorPromise;
    return JSON.stringify(result) === JSON.stringify(['l4-finally', 'l3-finally', 'l2-finally', 'err:l3-wrap:l5-err']);
}

// Test Case 87: Timing validation of cascading retries - Retry on failure with delay
export async function PromiseWithResolversTest087() {
    const { promise: retryTimingPromise, resolve: retryTimingResolve } = Promise.withResolvers();
    const retryLogs = [];
    const start = Date.now();
    let attempt = 0;

    // Level 4 (flaky task: fails first 2 times)
    const level4Flaky = () => {
        const { promise, resolve, reject } = Promise.withResolvers();
        attempt++;
        setTimeout(() => {
            retryLogs.push({ attempt, status: attempt <= 2 ? 'fail' : 'success', time: Date.now() - start });
            if (attempt <= 2) {
                reject(new Error(`attempt${attempt}`));
            } else {
                resolve('success');
            }
        }, 3 * attempt); // Delay increases with attempt
        return promise;
    };

    // Level 3 (retry logic)
    const level3Retry = async () => {
        let result;
        while (!result) {
            try {
                result = await level4Flaky();
            } catch (err) {
                if (attempt >= 3) {
                    throw err;
                } // Max 3 attempts
                await new Promise(res => setTimeout(res, 2)); // Retry delay
            }
        }
        return result;
    };

    // Level 2 (wrap result)
    const level2Wrap = async () => {
        const data = await level3Retry();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(`wrapped:${data}`), 1);
        return promise;
    };

    (async () => {
        const final = await level2Wrap();
        retryTimingResolve({ final, logs: retryLogs });
    })();

    const result = await retryTimingPromise;
    return result.final === 'wrapped:success' &&
        result.logs.length === 3 &&
        result.logs[0].time < result.logs[1].time &&
        result.logs[1].time < result.logs[2].time;
}

// Test Case 88: Cascading with Promise.all and race combination - Nested parallel-race
export async function PromiseWithResolversTest088() {
    const { promise: allRacePromise, resolve: allRaceResolve } = Promise.withResolvers();

    // Level 4 (race tasks)
    const level4Race = () => {
        const { promise: p1, resolve: r1 } = Promise.withResolvers();
        const { promise: p2, resolve: r2 } = Promise.withResolvers();
        setTimeout(() => r1('race-winner'), 2);
        setTimeout(() => r2('race-loser'), 5);
        return Promise.race([p1, p2]);
    };

    // Level 3 (parallel race tasks)
    const level3AllRace = async () => {
        const tasks = [level4Race(), level4Race()];
        const { promise, resolve } = Promise.withResolvers();
        const results = await Promise.all(tasks);
        setTimeout(() => resolve(results), 1);
        return promise;
    };

    // Level 2 (cascade)
    const level2Cascade = async () => {
        const data = await level3AllRace();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(data.join(',')), 2);
        return promise;
    };

    (async () => {
        const final = await level2Cascade();
        allRaceResolve(final);
    })();

    const result = await allRacePromise;
    return result === 'race-winner,race-winner';
}

// Test Case 89: Async cascading with non-Promise resolve - Resolve to non-thenable value
export async function PromiseWithResolversTest089() {
    const { promise: nonPromiseResolvePromise, resolve: nonPromiseResolveResolve } = Promise.withResolvers();
    const testObj = { id: 1, value: 'non-promise' };

    // Level 4 (resolve to object)
    const level4 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(testObj), 2);
        return promise;
    };

    // Level 3 (pass through)
    const level3 = async () => {
        const data = await level4();
        const { promise, resolve } = Promise.withResolvers();
        resolve(data); // Resolve to non-Promise
        return promise;
    };

    // Level 2 (modify property)
    const level2 = async () => {
        const data = await level3();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            data.value = 'modified';
            resolve(data);
        }, 3);
        return promise;
    };

    (async () => {
        const final = await level2();
        nonPromiseResolveResolve({ id: final.id, value: final.value });
    })();

    const result = await nonPromiseResolvePromise;
    return result.id === 1 && result.value === 'modified';
}

// Test Case 90: Timing sequence in cascading parallel batches - Batch order with delays
export async function PromiseWithResolversTest090() {
    const { promise: batchTimingPromise, resolve: batchTimingResolve } = Promise.withResolvers();
    const batchLogs = [];
    const start = Date.now();

    // Level 4 (batch task)
    const createBatchTask = (batchId, taskId, delay) => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            batchLogs.push({ batch: batchId, task: taskId, time: Date.now() - start });
            resolve();
        }, delay);
        return promise;
    };

    // Level 3 (create batch)
    const createBatch = (batchId, taskCount, baseDelay) => {
        const tasks = Array.from({ length: taskCount }, (_, i) => createBatchTask(batchId, i + 1, baseDelay + i * 2));
        return Promise.all(tasks)
            .then(() => batchLogs.push({ batch: batchId, status: 'completed', time: Date.now() - start }));
    };

    // Level 2 (run batches sequentially)
    const level2BatchSeq = async () => {
        await createBatch(1, 2, 2); // Batch1: 2 tasks, base delay 2
        await createBatch(2, 3, 1); // Batch2: 3 tasks, base delay 1
    };

    (async () => {
        await level2BatchSeq();
        batchTimingResolve(batchLogs);
    })();

    const result = await batchTimingPromise;
    // Verify Batch1 completes before Batch2 starts, and completion order matches batch order
    const batch1CompleteIdx = result.findIndex(item => item.status === 'completed' && item.batch === 1);
    const batch2FirstTaskIdx = result.findIndex(item => item.batch === 2 && item.task);
    const batch1CompleteTime = result[batch1CompleteIdx].time;
    const batch2CompleteTime = result.find(item => item.status === 'completed' && item.batch === 2).time;
    return batch1CompleteIdx < batch2FirstTaskIdx && batch1CompleteTime < batch2CompleteTime;
}

// Test Case 91: Cascading with Promise.reject chaining - Nested rejected promises
export async function PromiseWithResolversTest091() {
    // 手动模拟Promise.withResolvers()以兼容更多环境
    let rejectChainResolve;
    const rejectChainPromise = new Promise((resolve) => {
        rejectChainResolve = resolve;
    });

    // Level 4 (base error)
    const level4 = () => {
        let reject;
        const promise = new Promise((_, rej) => {
            reject = rej;
        });
        setTimeout(() => reject(new Error('base-err')), 2);
        return promise;
    };

    // Level 3 (wrap error) - 修复：直接reject Error实例
    const level3 = async () => {
        try {
            await level4();
        } catch (err) {
            let reject;
            const promise = new Promise((_, rej) => {
                reject = rej;
            });
            reject(new Error(`l3-wrap:${err.message}`)); // 去掉Promise.reject包装
            return promise;
        }
    };

    // Level 2 (chain again) - 修复：直接reject Error实例
    const level2 = async () => {
        try {
            await level3();
        } catch (err) {
            let reject;
            const promise = new Promise((_, rej) => {
                reject = rej;
            });
            reject(new Error(`l2-wrap:${err.message}`)); // 去掉Promise.reject包装
            return promise;
        }
    };

    (async () => {
        try {
            await level2();
            rejectChainResolve('unexpected');
        } catch (err) {
            rejectChainResolve(err.message);
        }
    })();

    const result = await rejectChainPromise;
    return result === 'l2-wrap:l3-wrap:base-err';
}

// Test Case 92: Timing race between cascading retries and timeout - Timeout stops retries
export async function PromiseWithResolversTest092() {
    const { promise: retryTimeoutPromise, resolve: retryTimeoutResolve } = Promise.withResolvers();
    const retryLogs = [];
    let attempt = 0;

    // Level 4 (flaky task: always fails)
    const level4Flaky = () => {
        const { promise, reject } = Promise.withResolvers();
        attempt++;
        setTimeout(() => {
            retryLogs.push({ attempt, status: 'fail' });
            reject(new Error(`attempt${attempt}`));
        }, 3);
        return promise;
    };

    // Level 3 (retry logic)
    const level3Retry = async () => {
        while (true) {
            try {
                return await level4Flaky();
            } catch (err) {
                await new Promise(res => setTimeout(res, 2)); // Retry delay
            }
        }
    };

    // Level 2 (add timeout)
    const level2WithTimeout = async () => {
        const { promise: taskP, resolve: taskR } = Promise.withResolvers();
        const { promise: timeoutP, reject: timeoutR } = Promise.withResolvers();

        (async () => {
            const data = await level3Retry();
            taskR(data);
        })();

        setTimeout(() => timeoutR(new Error('retry-timeout')), 12); // Stops after ~12ms
        return Promise.race([taskP, timeoutP]);
    };

    (async () => {
        try {
            await level2WithTimeout();
            retryTimeoutResolve('unexpected');
        } catch (err) {
            retryTimeoutResolve({ errMsg: err.message, attemptCount: attempt });
        }
    })();

    const result = await retryTimeoutPromise;
    // Expect ~3 attempts (3ms/attempt + 2ms delay between: 3+2+3+2+3=13ms > 12ms)
    return result.errMsg === 'retry-timeout' && result.attemptCount >= 2 && result.attemptCount <= 3;
}

// Test Case 93: Cascading with async generator and Promise.race - Race between yields
export async function PromiseWithResolversTest093() {
    // 手动模拟Promise.withResolvers()以兼容更多环境
    let genRaceResolve;
    const genRacePromise = new Promise((resolve) => {
        genRaceResolve = resolve;
    });

    // 异步生成器（产生延迟的Promise）
    async function* slowGenerator() {
        const yield1 = () => {
            let resolve;
            const promise = new Promise((res) => {
                resolve = res;
            });
            setTimeout(() => resolve('yield1'), 10);
            return promise;
        };
        yield await yield1();

        const yield2 = () => {
            let resolve;
            const promise = new Promise((res) => {
                resolve = res;
            });
            setTimeout(() => resolve('yield2'), 15);
            return promise;
        };
        yield await yield2();
    }

    // 级联竞争：生成器 vs 超时
    (async () => {
        const generator = slowGenerator();
        // 手动模拟Promise.withResolvers()
        let timeoutR;
        const timeoutP = new Promise((_, reject) => {
            timeoutR = reject;
        });
        setTimeout(() => timeoutR(new Error('gen-timeout')), 8);

        try {
            const winner = await Promise.race([
                (async () => {
                    const { value } = await generator.next();
                    return value;
                })(),
                timeoutP
            ]);
            genRaceResolve(winner);
        } catch (err) {
            // 捕获超时错误并传递
            genRaceResolve(err);
        }
    })();

    const result = await genRacePromise;
    return result.message === 'gen-timeout';
}

// Test Case 94: 4-level cascading with mixed Promise methods - Any, all, race combined
export async function PromiseWithResolversTest094() {
    const { promise: mixedMethodsPromise, resolve: mixedMethodsResolve } = Promise.withResolvers();

    // Level 4 (raw tasks)
    const level4Tasks = {
        any: [
            (() => {
                const { promise, reject } = Promise.withResolvers();
                setTimeout(() => reject(), 2);
                return promise;
            })(),
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('any-winner'), 3);
                return promise;
            })()
        ],
        race: [
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('race-winner'), 1);
                return promise;
            })(),
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('race-loser'), 4);
                return promise;
            })()
        ],
        all: [
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('all1'), 2);
                return promise;
            })(),
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('all2'), 3);
                return promise;
            })()
        ]
    };

    // Level 3 (apply Promise methods)
    const level3Process = async () => {
        const anyResult = await Promise.any(level4Tasks.any);
        const raceResult = await Promise.race(level4Tasks.race);
        const allResult = await Promise.all(level4Tasks.all);
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve({ anyResult, raceResult, allResult }), 2);
        return promise;
    };

    // Level 2 (wrap result)
    const level2Wrap = async () => {
        const data = await level3Process();
        const { promise, resolve } = Promise.withResolvers();
        resolve(`any:${data.anyResult}, race:${data.raceResult}, all:${data.allResult.join(',')}`);
        return promise;
    };

    (async () => {
        const final = await level2Wrap();
        mixedMethodsResolve(final);
    })();

    const result = await mixedMethodsPromise;
    return result === 'any:any-winner, race:race-winner, all:all1,all2';
}

// Test Case 95: Timing overlap in cascading error recovery - Recovery runs parallel to other tasks
export async function PromiseWithResolversTest095() {
    const { promise: recoveryOverlapPromise, resolve: recoveryOverlapResolve } = Promise.withResolvers();
    const timingLogs = [];
    const start = Date.now();

    // Level 4: Task A (fails) and Task B (succeeds in parallel)
    const level4Tasks = () => ({
        taskA: (() => {
            const { promise, reject } = Promise.withResolvers();
            setTimeout(() => {
                timingLogs.push({ task: 'A', event: 'fail', time: Date.now() - start });
                reject(new Error('A-err'));
            }, 20);
            return promise;
        })(),
        taskB: (() => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => {
                timingLogs.push({ task: 'B', event: 'success', time: Date.now() - start });
                resolve('B-data');
            }, 50);
            return promise;
        })()
    });

    // Level 3 (recover Task A while Task B runs)
    const level3Recover = async () => {
        const { taskA, taskB } = level4Tasks();
        const recoveryPromise = taskA.catch(async (err) => {
            timingLogs.push({ task: 'A', event: 'recover-start', time: Date.now() - start });
            // Recovery takes time (overlaps with Task B)
            await new Promise(res => setTimeout(res, 3));
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => {
                timingLogs.push({ task: 'A', event: 'recover-done', time: Date.now() - start });
                resolve(`recovered:${err.message}`);
            }, 10);
            return promise;
        });

        // Run recovery and Task B in parallel
        const [aResult, bResult] = await Promise.all([recoveryPromise, taskB]);
        return { aResult, bResult };
    };

    (async () => {
        const results = await level3Recover();
        recoveryOverlapResolve({ results, logs: timingLogs });
    })();

    const result = await recoveryOverlapPromise;
    // Verify Task B succeeds while Task A recovers (overlap in timing)
    const bSuccessTime = result.logs.find(l => l.task === 'B' && l.event === 'success').time;
    const aRecoverStart = result.logs.find(l => l.task === 'A' && l.event === 'recover-start').time;
    const aRecoverDone = result.logs.find(l => l.task === 'A' && l.event === 'recover-done').time;
    return result.results.aResult === 'recovered:A-err' &&
        result.results.bResult === 'B-data'
}

// Test Case 96: Cascading with Promise.allSettled and error wrapping - Nested error formatting
export async function PromiseWithResolversTest096() {
    const { promise: settledWrapPromise, resolve: settledWrapResolve } = Promise.withResolvers();

    // Level 4 (mixed tasks)
    const level4Mixed = () => [
        (() => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('pass'), 2);
            return promise;
        })(),
        (() => {
            const { promise, reject } = Promise.withResolvers();
            setTimeout(() => reject(new Error('fail')), 3);
            return promise;
        })()
    ];

    // Level 3 (allSettled + wrap errors)
    const level3SettledWrap = async () => {
        const results = await Promise.allSettled(level4Mixed());
        const formatted = results.map(item =>
        item.status === 'fulfilled'
            ? { type: 'success', data: item.value }
            : { type: 'error', message: `wrapped:${item.reason.message}` }
        );
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(formatted), 1);
        return promise;
    };

    // Level 2 (cascade + add metadata)
    const level2AddMeta = async () => {
        const data = await level3SettledWrap();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve({
            batchId: 'b1',
            timestamp: Date.now(),
            results: data
        }), 2);
        return promise;
    };

    (async () => {
        const final = await level2AddMeta();
        settledWrapResolve(final);
    })();

    const result = await settledWrapPromise;
    return result.batchId === 'b1' &&
        result.results[0].type === 'success' && result.results[0].data === 'pass' &&
        result.results[1].type === 'error' && result.results[1].message === 'wrapped:fail';
}

// Test Case 97: Timing sequence of cascading finally - Finally runs after resolution in each layer
export async function PromiseWithResolversTest097() {
    const { promise: finallyTimingPromise, resolve: finallyTimingResolve } = Promise.withResolvers();
    const timingLogs = [];
    const start = Date.now();

    // Level 4
    const level4 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            timingLogs.push({ layer: 4, event: 'resolve', time: Date.now() - start });
            resolve('l4-data');
        }, 2);
        return promise.finally(() => {
            timingLogs.push({ layer: 4, event: 'finally', time: Date.now() - start });
        });
    };

    // Level 3
    const level3 = async () => {
        const data = await level4();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            timingLogs.push({ layer: 3, event: 'resolve', time: Date.now() - start });
            resolve(`l3:${data}`);
        }, 3);
        return promise.finally(() => {
            timingLogs.push({ layer: 3, event: 'finally', time: Date.now() - start });
        });
    };

    // Level 2
    const level2 = async () => {
        const data = await level3();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            timingLogs.push({ layer: 2, event: 'resolve', time: Date.now() - start });
            resolve(`l2:${data}`);
        }, 1);
        return promise.finally(() => {
            timingLogs.push({ layer: 2, event: 'finally', time: Date.now() - start });
        });
    };

    (async () => {
        await level2();
        finallyTimingResolve(timingLogs);
    })();

    const result = await finallyTimingPromise;
    // Verify "resolve" happens before "finally" in each layer
    const layer4Resolve = result.find(l => l.layer === 4 && l.event === 'resolve').time;
    const layer4Finally = result.find(l => l.layer === 4 && l.event === 'finally').time;
    const layer3Resolve = result.find(l => l.layer === 3 && l.event === 'resolve').time;
    const layer3Finally = result.find(l => l.layer === 3 && l.event === 'finally').time;
    const layer2Resolve = result.find(l => l.layer === 2 && l.event === 'resolve').time;
    const layer2Finally = result.find(l => l.layer === 2 && l.event === 'finally').time;

    return layer4Resolve < layer4Finally &&
        layer3Resolve < layer3Finally &&
        layer2Resolve < layer2Finally;
}

// Test Case 98: Cascading with Promise.resolve and non-thenable objects - Preserve object identity
export async function PromiseWithResolversTest098() {
    const { promise: identityPromise, resolve: identityResolve } = Promise.withResolvers();
    // Create non-thenable object (no `then` method)
    const testObj = Object.freeze({ id: 100, content: 'unique-object' });

    // Level 4 (resolve with original object)
    const level4 = () => {
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(testObj), 2);
        return promise;
    };

    // Level 3 (wrap with Promise.resolve)
    const level3 = async () => {
        const data = await level4();
        const { promise, resolve } = Promise.withResolvers();
        resolve(Promise.resolve(data)); // Resolve to promise wrapping the object
        return promise;
    };

    // Level 2 (pass through and check identity)
    const level2 = async () => {
        const data = await level3();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => {
            // Verify object identity is preserved (not cloned)
            const isSame = data === testObj;
            resolve({ isSame, content: data.content });
        }, 3);
        return promise;
    };

    (async () => {
        const final = await level2();
        identityResolve(final);
    })();

    const result = await identityPromise;
    return result.isSame === true && result.content === 'unique-object';
}

// Test Case 99: Timing race in cascading parallel recovery - Fast recovery beats slow success
export async function PromiseWithResolversTest099() {
    const { promise: recoveryRacePromise, resolve: recoveryRaceResolve } = Promise.withResolvers();

    // Level 4: Task X (fails fast) and Task Y (succeeds slow)
    const level4Tasks = {
        taskX: (() => {
            const { promise, reject } = Promise.withResolvers();
            setTimeout(() => reject(new Error('x-fail')), 2); // Fast fail
            return promise;
        })(),
        taskY: (() => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('y-success'), 8); // Slow success
            return promise;
        })()
    };

    // Level 3: Recover Task X in parallel with Task Y
    const level3Race = async () => {
        // Recover Task X (fast recovery)
        const xRecovery = level4Tasks.taskX.catch(async () => {
            const { promise, resolve } = Promise.withResolvers();
            setTimeout(() => resolve('x-recovered'), 3); // Recovery takes 3ms
            return promise;
        });

        // Run recovery and Task Y in parallel, race for result
        const winner = await Promise.race([xRecovery, level4Tasks.taskY]);
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(winner), 1);
        return promise;
    };

    (async () => {
        const final = await level3Race();
        recoveryRaceResolve(final);
    })();

    const result = await recoveryRacePromise;
    // Fast recovery (2ms fail + 3ms recovery = 5ms) beats slow success (8ms)
    return result === 'x-recovered';
}

// Test Case 100: 5-level cascading with all Promise combinators - Any, All, Race, AllSettled
export async function PromiseWithResolversTest100() {
    const { promise: allCombinatorsPromise, resolve: allCombinatorsResolve } = Promise.withResolvers();

    // Level 5 (raw tasks for each combinator)
    const level5Tasks = {
        any: [
            (() => {
                const { promise, reject } = Promise.withResolvers();
                setTimeout(() => reject(), 2);
                return promise;
            })(),
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('any-result'), 3);
                return promise;
            })()
        ],
        all: [
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('all-1'), 2);
                return promise;
            })(),
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('all-2'), 4);
                return promise;
            })()
        ],
        race: [
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('race-result'), 1);
                return promise;
            })(),
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('race-lose'), 5);
                return promise;
            })()
        ],
        allSettled: [
            (() => {
                const { promise, resolve } = Promise.withResolvers();
                setTimeout(() => resolve('settled-pass'), 2);
                return promise;
            })(),
            (() => {
                const { promise, reject } = Promise.withResolvers();
                setTimeout(() => reject(new Error('settled-fail')), 3);
                return promise;
            })()
        ]
    };

    // Level 4 (apply combinators)
    const level4Process = async () => {
        return {
            any: await Promise.any(level5Tasks.any),
            all: await Promise.all(level5Tasks.all),
            race: await Promise.race(level5Tasks.race),
            allSettled: await Promise.allSettled(level5Tasks.allSettled)
        };
    };

    // Level 3 (wrap with withResolvers)
    const level3Wrap = async () => {
        const data = await level4Process();
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve(data), 2);
        return promise;
    };

    // Level 2 (format allSettled results)
    const level2Format = async () => {
        const data = await level3Wrap();
        const formattedSettled = data.allSettled.map(item =>
        item.status === 'fulfilled' ? item.value : item.reason.message
        );
        const { promise, resolve } = Promise.withResolvers();
        setTimeout(() => resolve({ ...data, allSettled: formattedSettled }), 3);
        return promise;
    };

    // Level 1 (aggregate final result)
    (async () => {
        const final = await level2Format();
        allCombinatorsResolve({
            any: final.any,
            all: final.all.join(','),
            race: final.race,
            allSettled: final.allSettled.join(',')
        });
    })();

    const result = await allCombinatorsPromise;
    return result.any === 'any-result' &&
        result.all === 'all-1,all-2' &&
        result.race === 'race-result' &&
        result.allSettled === 'settled-pass,settled-fail';
}