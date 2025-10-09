export function MapSetTest007(){
    const obj = { id: 1 };
    const map = new Map();
    map.set(obj, 'object value');
    return { map,obj };
}

export function MapSetTest009(){
    const sym = Symbol('key');
    const map = new Map();
    map.set(sym, 'symbol value');
    return { map,sym };
}

export function MapSetTest010(){
    const func = () => {};
    const map = new Map();
    map.set(func, 'function value');
    return { map,func };
}

export function MapSetTest016(){
    const valueObj = { name: 'Test' };
    const map = new Map();
    map.set('obj', valueObj);
    return { map,valueObj };
}

export function MapSetTest017(){
    const valueObj = { name: 'Test' };
    const map = new Map();
    map.set('key', valueObj);
    valueObj.name = 'Modified';
    return { map,valueObj };
}

export function MapSetTest021(){
    const innerMap = new Map([['a', 1]]);
    const map = new Map();
    map.set('inner', innerMap);
    return { map,innerMap };
}

export function MapSetTest022(){
    const innerSet = new Set([1, 2, 3]);
    const map = new Map();
    map.set('inner', innerSet);
    return { map,innerSet };
}

export function MapSetTest038(){
    const sym = Symbol.for('shared');
    const map = new Map();
    map.set(sym, 'shared symbol');
    return { map,sym };
}

export function MapSetTest039(){
    const map = new Map();
    map.set(Symbol.iterator, 'iterator symbol');
    return {map} ;
}

export function MapSetTest040(){
    const obj = Object.freeze({ prop: 'value' });
    const map = new Map();
    map.set(obj, 'frozen object');
    return { map,obj };
}

export function MapSetTest041(){
    const obj = Object.seal({ prop: 'value' });
    const map = new Map();
    map.set(obj, 'sealed object');
    return { map,obj};
}

export function MapSetTest042(){
    const obj = {};
    const map = new Map();
    map.set(obj, 'empty object');
    return { map,obj};
}

export function MapSetTest043(){
    const obj = {};
    const map = new Map();
    map.set(obj, 'empty object');
    return { map,obj};
}

export function MapSetTest055(){
    function* generator() { yield 1; }
    const map = new Map();
    map.set(generator, 'generator as key');
    return { map,generator};
}

export function MapSetTest058(){
    const func = ()=> {};
    const boundFunc = func.bind({});
    const map = new Map();
    map.set(boundFunc, 'bound function as key');
    return { map,boundFunc};
}

export function MapSetTest059(){
    const target = {};
    const proxy = new Proxy(target, {});
    const map = new Map();
    map.set(proxy, 'proxy as key');
    return { map,proxy};
}

export function MapSetTest060(){
    const { proxy, revoke } = Proxy.revocable({}, {});
    const map = new Map();
    map.set(proxy, 'revocable proxy');
    return { map,revoke,proxy};
}

export function MapSetTest067(){
    const map = new Map();
    map.set(Reflect, 'reflect object');
    return { map,Reflect};
}

export function MapSetTest082(){
    const sym = Symbol('description');
    const map = new Map();
    map.set(sym, 'symbol')
        .set('description', 'string');
    return { map,sym};
}

export function MapSetTest087(){
    const obj = Object.create(null);
    const map = new Map();
    map.set(obj, 'null prototype');
    return { obj,map};
}

export function MapSetTest088(){
    const proto = {};
    const obj = Object.create(proto);
    const map = new Map();
    map.set(proto, 'prototype')
        .set(obj, 'instance');
    return { obj,map,proto};
}

export function MapSetTest095(){
    const target = {};
    const proxy = new Proxy(target, {});
    const map = new Map();
    map.set(proxy, 'proxy')
        .set(target, 'target');
    return { map,proxy,target};
}

export function MapSetTest096(){
    function* generator() { yield 1; }
    const genObj = generator();
    const map = new Map();
    map.set(genObj, 'generator object');
    return { map,genObj};
}

export function MapSetTest097(){
    async function* asyncGenerator() { yield 1; }
    const asyncGenObj = asyncGenerator();
    const map = new Map();
    map.set(asyncGenObj, 'async generator object');
    return {map, asyncGenObj};
}