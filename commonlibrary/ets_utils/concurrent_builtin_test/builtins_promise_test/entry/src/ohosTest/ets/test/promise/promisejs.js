export const invalidPromiseCall = () => {
    // 显式类型转换模拟错误调用，聚焦运行时错误捕获
    Promise((resolve) => resolve());
};

export const errorMessage20 = 'thenable error occurred';
const faultyThenable = {
    then: function (onFulfilled, onRejected) {
        // Throw an error instead of calling the handlers
        throw new Error(errorMessage20);
    }
};

export const promise20 = new Promise((resolve) => {
    resolve(faultyThenable);
});

class ArrayThenable {
    then(onFulfilled) {
        return new Promise((resolve) => {
            resolve(['a', 'b', 'c']);
        }).then(onFulfilled);
    }
}

export class MultiCallThenable {
    constructor() {
        this.value = 10;
    }

    then(onFulfilled) {
        this.value *= 2;
        return new Promise((resolve) => {
            resolve();
        }).then(() => {
            if (onFulfilled) {
                return onFulfilled(this.value);
            }
            return undefined;
        });
    }
}

export const promise92 = new Promise((resolve) => {
    resolve(new ArrayThenable());
}).then(items => items.map(item => item.toUpperCase()));
const createNestedPromise = (value) => {
    return new Promise((resolve) => {
        resolve(new Promise((resolve) => {
            setTimeout(() => resolve(value * 2), 10);
        }));
    });
};

export const promise77 = new Promise((resolve) => {
    resolve([
        createNestedPromise(1),
        createNestedPromise(2),
        createNestedPromise(3)
    ]);
}).then((promises) => Promise.all(promises));

class ErrorThenable {
    then(onFulfilled, onRejected) {
        return new Promise((_, reject) => {
            reject(new Error('thenable error'));
        }).then(onFulfilled, onRejected);
    }
}

export class WrapperThenable84 {
    then(onFulfilled) {
        return new Promise((resolve) => {
            resolve(new ErrorThenable());
        }).then(onFulfilled);
    }
}

class InnerThenable {
    then(onFulfilled) {
        return new Promise((resolve) => {
            resolve('inner');
        }).then(onFulfilled);
    }
}

class OuterThenable {
    then(onFulfilled) {
        return new Promise((resolve) => {
            resolve(new InnerThenable());
        }).then(onFulfilled);
    }
}

export const promise75 = new Promise((resolve) => {
    resolve(new OuterThenable());
});

class StepThenable77 {
    constructor(step, delay) {
        this.step = step;
        this.delay = delay;
    }

    then(onFulfilled) {
        return new Promise((resolve) => {
            setTimeout(() => {
                const value = this.step * 10;
                resolve(onFulfilled ? onFulfilled(value) : value);
            }, this.delay);
        });
    }
}

export const finalResult77 = await Promise.resolve(new StepThenable(1, 10))
    .then((thenable) => thenable)
    .then((v) => new StepThenable(v / 10 + 2, 15))
    .then((thenable) => thenable)
    .then((v) => new StepThenable(v / 10 + 3, 20))
    .then((thenable) => thenable);

export const DelayedRejectThenable97 = {
    then: (onFulfilled, onRejected) => {
        timingEvents.push('Thenable then() called');
        setTimeout(() => {
            timingEvents.push('Thenable rejecting');
            onRejected?.('Delayed thenable rejection');
        }, 25);
    }
};


export async function PromiseCatchTest036() {
    let caughtRejectionReason = '';
    let chainCompletionStatus = 'unfinished';
    const timingLog = [];

    // Create promise via Promise.withResolvers() (ES2022+ API)
    const { promise, reject: resolverReject } = Promise.withResolvers();

    // Simulate delayed rejection (mimics async operation failure)
    setTimeout(() => {
        const rejectTime = Date.now();
        timingLog.push(`Resolver reject triggered at ${rejectTime}`);
        resolverReject('Payment gateway timeout: Failed to process transaction');
    }, 35);

    // Chain: wait for withResolvers promise → catch rejection → update status
    await promise
        .then((val) => {
        timingLog.push(`Unexpected resolve: ${val}`);
        chainCompletionStatus = 'resolved';
    })
    .catch((reason) => {
        const catchTime = Date.now();
        timingLog.push(`Catch executed at ${catchTime}`);
        caughtRejectionReason = reason;
        chainCompletionStatus = 'rejected_and_handled';
    })
    .finally(() => {
        timingLog.push('Finally block executed');
    });

    // Verify rejection capture
    if (caughtRejectionReason != 'Payment gateway timeout: Failed to process transaction' ||
        chainCompletionStatus != 'rejected_and_handled' ||
        timingLog.length != 3 || !timingLog[0].includes('Resolver reject triggered') ||
        !timingLog[1].includes('Catch executed') ||
        !timingLog[2].includes('Finally block executed')) {
        return false
    }
    return true
}

export async function PromiseCatchTest068(){
    let caughtWithResolversErr = '';

    await Promise.resolve()
        .then(() => {
            // Nested chain using Promise.withResolvers()
            const { promise, reject } = Promise.withResolvers();
            setTimeout(() => {
                reject('Rejected via nested withResolvers');
            }, 25);
            return promise;
        })
        .then((val) => `Processed: ${val}`)// Unreachable
    .catch((err) => {
        caughtWithResolversErr = err;
    });

    return caughtWithResolversErr=='Rejected via nested withResolvers';
}

export async function PromiseCatchTest081() {
    let loadError = null;
    let fallbackImage = null;

    const loadImage = (src) => {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                reject(`Failed to load image: ${src} (404 Not Found)`);
            }, 25);
        });
    };

    await loadImage('/images/nonexistent.jpg')
    .then((img) => {
    return img.src;
})
.catch((err) => {
    loadError = err;
    return '/images/placeholder.png';
})
    .then((imgSrc) => {
        fallbackImage = imgSrc;
    });

return (
    loadError === 'Failed to load image: /images/nonexistent.jpg (404 Not Found)' &&
        fallbackImage === '/images/placeholder.png'
);
}










