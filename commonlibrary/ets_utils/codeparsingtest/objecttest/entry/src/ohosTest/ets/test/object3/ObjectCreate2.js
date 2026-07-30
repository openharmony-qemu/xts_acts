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
