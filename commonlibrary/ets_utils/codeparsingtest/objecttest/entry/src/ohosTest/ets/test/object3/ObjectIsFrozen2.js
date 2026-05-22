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

export function ObjectIsFrozen2Test001() {
    const obj = {
        set: new Set([1, 2, 3, 2, 1])
    };
    const beforeFreeze = Object.isFrozen(obj);
    Object.freeze(obj);
    const afterFreezeObj = Object.isFrozen(obj);
    const afterFreezeSet = Object.isFrozen(obj.set);
    return [beforeFreeze, afterFreezeObj, afterFreezeSet];
}

export function ObjectIsFrozen2Test002() {
    const proto = { inherited: "value" };
    const obj = Object.create(proto);
    obj.own = "ownValue";

    Object.freeze(obj);
    const isFrozen = Object.isFrozen(obj);
    const inheritedVal = obj.inherited;
    return [isFrozen, inheritedVal];
}

export function ObjectIsFrozen2Test003() {
    const proto = { inherited: "value" };
    const obj = Object.create(proto);

    Object.freeze(obj);
    const isFrozen = Object.isFrozen(obj);
    proto.inherited = "newValue";
    const newInheritedVal = obj.inherited;
    return [isFrozen, newInheritedVal];
}

export function ObjectIsFrozen2Test004() {
    const obj = { a: 1 };
    obj.self = obj;

    const beforeFreeze = Object.isFrozen(obj);
    Object.freeze(obj);
    const afterFreezeObj = Object.isFrozen(obj);
    const afterFreezeSelf = Object.isFrozen(obj.self);
    return [beforeFreeze, afterFreezeObj, afterFreezeSelf];
}

export function ObjectIsFrozen2Test005() {
    const obj1 = { name: "obj1" };
    const obj2 = { name: "obj2" };
    obj1.ref = obj2;
    obj2.ref = obj1;

    Object.freeze(obj1);
    const isFrozenObj1 = Object.isFrozen(obj1);
    const isFrozenObj2 = Object.isFrozen(obj2);
    const isFrozenObj1Ref = Object.isFrozen(obj1.ref);
    return [isFrozenObj1, isFrozenObj2, isFrozenObj1Ref];
}

export function ObjectIsFrozen2Test006() {
    let typeError1, typeError2, typeError3;
    try {
        Object.isFrozen(1);
    } catch (e) {
        typeError1 = e instanceof TypeError;
    }

    try {
        Object.isFrozen("string");
    } catch (e) {
        typeError2 = e instanceof TypeError;
    }

    try {
        Object.isFrozen(true);
    } catch (e) {
        typeError3 = e instanceof TypeError;
    }
    return [typeError1, typeError2, typeError3];
}

export function ObjectIsFrozen2Test007() {
    const num = Object.isFrozen(1);
    const str = Object.isFrozen("string");
    const bool = Object.isFrozen(true);
    const nul = Object.isFrozen(null);
    const undef = Object.isFrozen(undefined);
    const sym = Object.isFrozen(Symbol());
    return [num, str, bool, nul, undef, sym];
}

export function ObjectIsFrozen2Test008() {
    const res = Object.isFrozen(undefined);
    return res;
}

export function ObjectIsFrozen2Test009() {
    const res = Object.isFrozen(null);
    return res;
}

export function ObjectIsFrozen2Test012() {
    const emptyObj = {};
    const beforePrevent = Object.isFrozen(emptyObj);

    Object.preventExtensions(emptyObj);
    const afterPrevent = Object.isFrozen(emptyObj);
    return [beforePrevent, afterPrevent];
}

export function ObjectIsFrozen2Test013() {
    const obj = { a: 1, b: 2 };
    Object.preventExtensions(obj);
    const afterPrevent = Object.isFrozen(obj);

    delete obj.a;
    delete obj.b;
    const afterDelete = Object.isFrozen(obj);
    return [afterPrevent, afterDelete];
}

export function ObjectIsFrozen2Test014() {
    const obj = { a: 1, b: 2, c: 3 };
    Object.preventExtensions(obj);
    const afterPrevent = Object.isFrozen(obj);

    delete obj.c;
    const afterDelete = Object.isFrozen(obj);
    return [afterPrevent, afterDelete];
}

export function ObjectIsFrozen2Test015() {
    const obj = { a: 1 };
    Object.freeze(obj);
    const afterFreeze = Object.isFrozen(obj);

    Object.preventExtensions(obj);
    const afterPrevent = Object.isFrozen(obj);

    Object.seal(obj);
    const afterSeal = Object.isFrozen(obj);
    return [afterFreeze, afterPrevent, afterSeal];
}

export function ObjectIsFrozen2Test016() {
    const obj1 = { a: 1 };
    const init = [Object.isExtensible(obj1), Object.isSealed(obj1), Object.isFrozen(obj1)];

    Object.preventExtensions(obj1);
    const afterPrevent = [Object.isExtensible(obj1), Object.isSealed(obj1), Object.isFrozen(obj1)];

    Object.seal(obj1);
    const afterSeal = [Object.isExtensible(obj1), Object.isSealed(obj1), Object.isFrozen(obj1)];

    Object.freeze(obj1);
    const afterFreeze = [Object.isExtensible(obj1), Object.isSealed(obj1), Object.isFrozen(obj1)];

    return [init, afterPrevent, afterSeal, afterFreeze];
}

export function ObjectIsFrozen2Test017() {
    const obj = { a: 1 };
    Object.freeze(obj);

    const val = obj.a;
    const isFrozen = Object.isFrozen(obj);
    return [val, isFrozen];
}

export function ObjectIsFrozen2Test018() {
    const obj = { a: 1 };
    Object.freeze(obj);
    let isTypeError = false;
    try {
        obj.a = 2;
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError;
}

export function ObjectIsFrozen2Test019() {
    const obj = { a: 1, b: "test", c: [1, 2, 3] };
    Object.freeze(obj);
    const isFrozen = Object.isFrozen(obj);
    const str = JSON.stringify(obj);
    return [isFrozen, str];
}

export function ObjectIsFrozen2Test020() {
    const frozen = { a: 1 };
    Object.freeze(frozen);
    const frozenRes = Object.isFrozen(frozen);

    const parsed = JSON.parse(JSON.stringify(frozen));
    const parsedRes = Object.isFrozen(parsed);
    return [frozenRes, parsedRes];
}

export function ObjectIsFrozen2Test021() {
    const len = Object.isFrozen.length;
    const name = Object.isFrozen.name;
    const hasCall = typeof Object.isFrozen.call === 'function';
    const hasBind = typeof Object.isFrozen.bind === 'function';
    return [len, name, hasCall, hasBind];
}

export function ObjectIsFrozen2Test022() {
    const obj = { a: 1 };
    Object.freeze(obj);

    const callRes = Object.isFrozen.call(null, obj);
    const applyRes = Object.isFrozen.apply(null, [obj]);
    const boundIsFrozen = Object.isFrozen.bind(null);
    const boundRes = boundIsFrozen(obj);
    return [callRes, applyRes, boundRes];
}

export function ObjectIsFrozen2Test025() {
    const obj = { a: 1, b: 2 };
    Object.freeze(obj);
    let isTypeError = false;
    try {
        delete obj.a;
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    const val = obj.a;
    return [isTypeError, val];
}

export function ObjectIsFrozen2Test026() {
    const obj = { a: 1, b: 2 };
    Object.freeze(obj);
    const val = obj.a;
    return val;
}

export function ObjectIsFrozen2Test027() {
    const obj = { a: 1, b: 2 };
    Object.freeze(obj);
    const res = Object.isFrozen(obj);
    return res;
}

export function ObjectIsFrozen2Test030() {
    const obj = { a: 1, b: "test", c: [1, 2, 3] };

    Object.freeze(obj);
    const isFrozen = Object.isFrozen(obj);

    return isFrozen;
}

export function ObjectIsFrozen2Test031() {
    function deepFreeze(obj) {
        Object.keys(obj).forEach(key => {
            if (typeof obj[key] === 'object' && obj[key] !== null) {
                deepFreeze(obj[key]);
            }
        });
        return Object.freeze(obj);
    }

    const deepObj = {
        a: { b: { c: { d: { e: 1 } } } },
        arr: [1, [2, [3, [4]]]]
    };

    const start = Date.now();
    deepFreeze(deepObj);
    const end = Date.now();
    const deepFreezeTime = end - start;

    const isFrozenRoot = Object.isFrozen(deepObj);
    const isFrozenA = Object.isFrozen(deepObj.a);
    const isFrozenAB = Object.isFrozen(deepObj.a.b);

    return [isFrozenRoot, isFrozenA, isFrozenAB];
}

export function ObjectIsFrozen2Test032() {
    const config = {
        apiUrl: "https://api.example.com",
        timeout: 5000,
        retryCount: 3
    };

    Object.freeze(config);
    const isFrozen = Object.isFrozen(config);
    let isProtected = false;
    try {
        config.apiUrl = "https://malicious.com";
    } catch (e) {
        isProtected = true;
    }
    return [isFrozen, isProtected];
}

export function ObjectIsFrozen2Test033() {
    const COLORS = Object.freeze({
        RED: "#FF0000",
        GREEN: "#00FF00",
        BLUE: "#0000FF"
    });

    const isFrozen = Object.isFrozen(COLORS);
    const redVal = COLORS.RED;
    let isProtected = false;
    try {
        COLORS.RED = "#NEW_COLOR";
    } catch (e) {
        isProtected = true;
    }
    return [isFrozen, redVal, isProtected];
}

export function ObjectIsFrozen2Test034() {
    function createImmutablePoint(x, y) {
        return Object.freeze({ x, y });
    }

    const point = createImmutablePoint(10, 20);
    const isFrozen = Object.isFrozen(point);
    let isProtected = false;
    try {
        point.x = 30;
    } catch (e) {
        isProtected = true;
    }
    return [isFrozen, isProtected];
}

export function ObjectIsFrozen2Test035() {
    class ConfigurableEntity {
        constructor() {
            this.config = Object.freeze({
                version: "1.0.0",
                author: "Developer"
            });
        }

        updateConfig() {

            try {
                this.config.version = "2.0.0";
            } catch (e) {
                this.config = Object.freeze({
                    version: "2.0.0",
                    author: this.config.author
                });
            }
        }
    }

    const entity = new ConfigurableEntity();
    const initIsFrozen = Object.isFrozen(entity.config);
    entity.updateConfig();
    const afterUpdateIsFrozen = Object.isFrozen(entity.config);
    const newVersion = entity.config.version;
    return [initIsFrozen, afterUpdateIsFrozen, newVersion];
}

export function ObjectIsFrozen2Test036() {
    let isTypeError = false;
    try {
        Object.isFrozen("string");
    } catch (e) {
        isTypeError = e instanceof TypeError;
    }
    return isTypeError;
}

export function ObjectIsFrozen2Test037() {
    const str = Object.isFrozen("string");
    const num = Object.isFrozen(123);
    const bool = Object.isFrozen(true);
    return [str, num, bool];
}

export function ObjectIsFrozen2Test038() {
    const obj = { a: 1 };
    Object.freeze(obj);

    const isExtensible = Object.isExtensible(obj);
    const isSealed = Object.isSealed(obj);
    const isFrozen = Object.isFrozen(obj);
    return [isExtensible, isSealed, isFrozen];
}

export function ObjectIsFrozen2Test039() {
    const obj = { a: 1 };
    Object.seal(obj);

    const isExtensible = Object.isExtensible(obj);
    const isSealed = Object.isSealed(obj);
    const isFrozen = Object.isFrozen(obj);
    return [isExtensible, isSealed, isFrozen];
}

export function ObjectIsFrozen2Test040() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);

    const isExtensible = Object.isExtensible(obj);
    const isSealed = Object.isSealed(obj);
    const isFrozen = Object.isFrozen(obj);
    return [isExtensible, isSealed, isFrozen];
}
