'use strict'

export function ObjectFreeze3Test001() {
    const sym = Symbol('key');
    const obj = { [sym]: 'value' };
    Object.freeze(obj);
    try {
        delete obj[sym];
    } catch (e) {
        console.log(e instanceof TypeError);
    }

    return obj[sym];
}

export function ObjectFreeze3Test002() {
    const largeObj = {};
    for (let i = 0; i < 10000; i++) {
        largeObj['key' + i] = 'value' + i;
    }
    Object.freeze(largeObj);

    return Object.keys(largeObj).length;
}

export function ObjectFreeze3Test003() {
    function createFrozenObj() {
        const obj = { data: 'test' };
        Object.freeze(obj);
        return obj;
    }
    const frozenObj = createFrozenObj();

    return Object.isFrozen(frozenObj);
}

export function ObjectFreeze3Test004() {
    const obj = { a: 1 };
    Object.freeze(obj);
    Object.freeze(obj);
    Object.freeze(obj);

    return [Object.isFrozen(obj), obj.a]
}

export function ObjectFreeze3Test005() {
    const obj = { a: 1 };
    Object.freeze(obj);

    Object.freeze(obj);

    return Object.isFrozen(obj);
}

