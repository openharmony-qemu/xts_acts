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

export function ObjectAssign3Test001() {
    const source = { name: 'self' };
    source.self = source;
    const target = {};
    const result = Object.assign(target, source);

    let a = result.self === source;
    let b = result.self.name;
    return [a, b]
}

export function ObjectAssign3Test002() {
    const a = { name: 'a' };
    const b = { name: 'b' };
    a.ref = b;
    b.ref = a;
    const target = {};
    const result = Object.assign(target, a);

    let a1 = result.ref.name;
    let b1 = result.ref.ref === a;
    return [a1, b1];
}

export function ObjectAssign3Test003() {
    const source = [1, 2, 3];
    source.push(source);
    const target = [];
    const result = Object.assign(target, source);

    let res = result[3] === source;
    return res;
}

export function ObjectAssign3Test004() {
    const target = {};
    const sources = [];
    for (let i = 0; i < 100; i++) {
        sources.push({ [`prop${i}`]: i });
    }
    const result = Object.assign(target, ...sources);

    let res = Object.keys(result).length;
    return res;
}

export function ObjectAssign3Test005() {
    const target = { a: 1 };
    const result = Object.assign(target, null, undefined, null);

    let a1 = { ...result };
    let b1 = result === target;
    return [a1, b1];
}

export function ObjectAssign3Test006() {
    const target = {};
    const result = Object.assign(target,
        { a: 1 }, {}, {},
        { b: 2 }, {},
        { c: 3 }
    );

    let res = { ...result };
    return res;
}

export function ObjectAssign3Test007() {
    const result = Object.assign.call(Object, {}, { a: 1 });

    let res = { ...result };
    return res;
}

export function ObjectAssign3Test008() {
    const sources = [{ a: 1 }, { b: 2 }, { c: 3 }];
    const result = Object.assign.apply(Object, [{}].concat(sources));

    let res = { ...result };
    return res;
}

export function ObjectAssign3Test009() {
    const boundAssign = Object.assign.bind(Object, {});
    const result = boundAssign({ a: 1 }, { b: 2 });

    let res = { ...result };
    return res;
}

export function ObjectAssign3Test010() {
    const result = Reflect.apply(Object.assign, Object, [{}, { a: 1 }]);

    let res = { ...result };
    return res;
}
