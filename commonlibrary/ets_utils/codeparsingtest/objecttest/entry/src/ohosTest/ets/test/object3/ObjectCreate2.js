'use strict'

export function ObjectCreate2Test001() {
    const obj = Object.create({}, {
        prop: { value: 1, writable: true }
    });
    Object.freeze(obj);
    try {
        obj.prop = 2;
    } catch (error) {
        return obj.prop;
    }
}

export function ObjectCreate2Test002() {
    const obj = Object.create({}, {
        prop: { value: 1, configurable: true }
    });
    Object.seal(obj);

    try {
        delete obj.prop;
    } catch (error) {
        return obj.prop;
    }
}

export function ObjectCreate2Test003() {
    const obj = Object.create({});
    Object.preventExtensions(obj);

    try {
        obj.newProp = 1;
    } catch (error) {
        return obj.newProp;
    }
}

export function ObjectCreate2Test004() {
    const proto = { inherited: 1 };
    const obj = Object.create(proto, {
        own: { value: 2, enumerable: true },
        hidden: { value: 3, enumerable: false }
    });
    const result = Object.keys(obj);

    return result;
}

export function ObjectCreate2Test005() {
    const proto = { inherited: 1 };
    const obj = Object.create(proto, {
        own: { value: 2, enumerable: true }
    });
    const result = Object.values(obj);

    return result;
}

export function ObjectCreate2Test006() {
    const proto = { inherited: 1 };
    const obj = Object.create(proto, {
        own: { value: 2, enumerable: true }
    });
    const result = Object.entries(obj);

    return result;
}

export function ObjectCreate2Test007() {
    const obj = Object.create({ inherited: 1 });
    Object.assign(obj, { a: 2, b: 3 });

    return [obj.a, obj.b, obj.inherited];
}

export function ObjectCreate2Test008() {
    const obj = Object.create(null);
    Object.assign(obj, { a: 1, b: 2 });

    return [obj.a, obj.hasOwnProperty];
}

export function ObjectCreate2Test009() {
    const proto = { inherited: 1 };
    const obj = Object.create(proto, {
        own: { value: 2, enumerable: true }
    });
    const keys = [];
    for (let key in obj) {
        keys.push(key);
    }

    return keys;
}

export function ObjectCreate2Test010() {
    const proto = { inherited: 1 };
    const obj = Object.create(proto, {
        own: { value: 2 }
    });
    const res1 = 'own' in obj;
    const res2 = 'inherited' in obj;
    const res3 = 'nonexistent' in obj;

    return [res1, res2, res3];
}

export function ObjectCreate2Test011() {
    const proto = { inherited: 1 };
    const obj = Object.create(proto, {
        own: { value: 2, enumerable: true }
    });
    const res1 = obj.hasOwnProperty('own');
    const res2 = obj.hasOwnProperty('inherited');

    return [res1, res2];
}

export function ObjectCreate2Test012() {
    const obj1 = Object.create({});
    const obj2 = Object.create(null);
    const res1 = typeof obj1;
    const res2 = typeof obj2;

    return [res1, res2];
}

export function ObjectCreate2Test013() {
    const obj1 = Object.create({});
    const res1 = obj1 instanceof Object;
    const obj2 = Object.create(null);
    const res2 = obj2 instanceof Object;

    return [res1, res2];
}

export function ObjectCreate2Test014() {
    const proto = { method() { return 'test'; } };
    const start = Date.now();
    const objects = [];
    for (let i = 0; i < 100000; i++) {
        objects.push(Object.create(proto));
    }
    const end = Date.now();
    const duration = end - start;

    return objects.length;
}

export function ObjectCreate2Test015() {
    const start = Date.now();
    const objects = [];
    for (let i = 0; i < 100000; i++) {
        objects.push(Object.create(null));
    }
    const end = Date.now();
    const duration = end - start;

    return objects.length;
}

export function ObjectCreate2Test016() {
    const simpleProto = { a: 1 };
    const complexProto = {
        a: 1, b: 2, c: 3,
        method1() {},
        method2() {},
        nested: { d: 4, e: 5 }
    };
    const simpleObj = Object.create(simpleProto);
    const complexObj = Object.create(complexProto);

    return [
        Object.getPrototypeOf(simpleObj) === simpleProto,
        Object.getPrototypeOf(complexObj) === complexProto
    ];
}

export function ObjectCreate2Test017() {
    const normalObj = Object.create({});
    const nullProtoObj = Object.create(null);
    const res1 = Object.keys(normalObj).length;
    const res2 = Object.keys(nullProtoObj).length;

    return [res1, res2];
}

export function ObjectCreate2Test018() {
    let proto = { prop: 'value' };
    for (let i = 0; i < 10; i++) {
        proto = Object.create(proto);
    }
    const obj = Object.create(proto);
    const start = Date.now();
    for (let i = 0; i < 1000000; i++) {
        obj.prop;
    }
    const end = Date.now();
    const duration = end - start;

    return obj.prop;
}

export function ObjectCreate2Test019() {
    const proto = { prop: 'prototype' };
    const obj = Object.create(proto);
    obj.ownProp = 'own';

    const start1 = Date.now();
    for (let i = 0; i < 1000000; i++) {
        obj.ownProp;
    }
    const end1 = Date.now();

    const start2 = Date.now();
    for (let i = 0; i < 1000000; i++) {
        obj.prop;
    }
    const end2 = Date.now();

    return [obj.ownProp, obj.prop];
}

export function ObjectCreate2Test020() {
    function Constructor() {
        this.prop = 'value';
    }

    const start1 = Date.now();

    const instances1 = [];
    for (let i = 0; i < 100000; i++) {
        instances1.push(new Constructor());
    }
    const end1 = Date.now();

    const proto = { prop: 'value' };
    const start2 = Date.now();

    const instances2 = [];
    for (let i = 0; i < 100000; i++) {
        instances2.push(Object.create(proto));
    }
    const end2 = Date.now();

    return instances1.length + instances2.length;
}

export function ObjectCreate2Test021() {
    const start1 = Date.now();
    const list1 = [];
    for (let i = 0; i < 100000; i++) {
        const obj = {};
        list1.push(obj);
    }
    const end1 = Date.now();

    const start2 = Date.now();
    const list2 = [];
    for (let i = 0; i < 100000; i++) {
        const obj = Object.create(Object.prototype);
        list2.push(obj);
    }
    const end2 = Date.now();

    return list1.length + list2.length;
}

export function ObjectCreate2Test022() {
    function createObjects() {
        const objects = [];
        for (let i = 0; i < 10000; i++) {
            objects.push(Object.create({ prop: 'value' }));
        }
        return objects;
    }

    let objs = createObjects();

    const count = objs.length;
    objs = null;

    return count;
}

export function ObjectCreate2Test023() {
    const sharedProto = {
        method() { return 'shared'; },
        data: 'shared data'
    };
    const objects = [];
    for (let i = 0; i < 1000; i++) {
        objects.push(Object.create(sharedProto));
    }

    const isSameMethod = objects[0].method === objects[999].method;

    return [objects.length, isSameMethod];
}
