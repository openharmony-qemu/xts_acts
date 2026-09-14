/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import util from '@ohos.util';

class Temperature {
    constructor(value) {
        this._temp = value;
    }

    compareTo(value) {
        return this._temp >= value.getTemp();
    }

    getTemp() {
        return this._temp;
    }

    toString() {
        return this._temp.toString();
    }
}

let tempLower = new Temperature(30);
let tempUpper = new Temperature(40);
let tempLess = new Temperature(20);
let tempMiDF = new Temperature(35);
let tempMidS = new Temperature(39);
let tempMore = new Temperature(45);

let rangeHp = new util.ScopeHelper(tempLower, tempUpper);
let rangeHpFir = new util.ScopeHelper(tempMiDF, tempMidS);
let rangeHpSec = new util.ScopeHelper(tempLess, tempMore);
let rangeHpThi = new util.ScopeHelper(tempLess, tempMiDF);
let rangeHpFif = new util.ScopeHelper(tempMiDF, tempMore);

export function testIsNumberObject001() {
    let proc = new util.types();
    let result = proc.isNumberObject(new Number(0));
    return result;
}

export function testIsNumberObject002() {
    let proc = new util.types();
    let result = proc.isNumberObject(new Number(10));
    return result;
}

export function testIsNumberObject003() {
    let proc = new util.types();
    let result = proc.isNumberObject(new Number(200));
    return result;
}

export function testIsNumberObject004() {
    let proc = new util.types();
    let result = proc.isNumberObject(0);
    return result;
}

export function testIsNumberObject005() {
    let proc = new util.types();
    let result = proc.isNumberObject(100);
    return result;
}

export function testIsPromise001() {
    let proc = new util.types();
    let result = proc.isPromise(Promise.resolve(42));
    return result;
}

export function testIsPromise002() {
    let proc = new util.types();
    let result = proc.isPromise(Promise.resolve(33));
    return result;
}

export function testIsPromise003() {
    let proc = new util.types();
    let result = proc.isPromise(Promise.resolve(44));
    return result;
}

export function testIsPromise004() {
    let proc = new util.types();
    let err = Error(33);
    let result = proc.isPromise(Promise.reject(err));
    return result;
}

export function testIsPromise005() {
    let proc = new util.types();
    let err = Error(23);
    let result = proc.isPromise(Promise.reject(err));
    return result;
}

export function testIsProxy001() {
    let proc = new util.types();
    const target = {};
    const proxy = new Proxy(target, {});
    let result = proc.isProxy(proxy);
    return result;
}

export function testIsProxy002() {
    let proc = new util.types();
    const target = {};
    const proxy = new Proxy(target, {});
    let result = proc.isProxy(target);
    return result;
}

export function testIsProxy003() {
    let proc = new util.types();
    const handler = {
        get: function (obj, prop) {
            return prop in obj ? obj[prop] : 37;
        }
    };
    const p = new Proxy({}, handler);
    let result = proc.isProxy(p);
    return result;
}

export function testIsProxy004() {
    let proc = new util.types();
    const handler = {
        get: function (obj, prop) {
            return prop in obj ? obj[prop] : 121;
        }
    };
    const p = new Proxy({}, handler);
    let result = proc.isProxy(p);
    return result;
}

export function testIsProxy005() {
    let proc = new util.types();
    const handler = {
        get: function (obj, prop) {
            return prop in obj ? obj[prop] : 121;
        }
    };
    const p = new Proxy({}, handler);
    let result = proc.isProxy(handler);
    return result;
}

export function testIsRegExp001() {
    let proc = new util.types();
    let result = proc.isRegExp(new RegExp('abc'));
    return result;
}

export function testIsRegExp002() {
    let proc = new util.types();
    let result = proc.isRegExp(/abc/);
    return result;
}

export function testIsRegExp003() {
    let proc = new util.types();
    let result = proc.isRegExp(new RegExp('fgd'));
    return result;
}

export function testIsRegExp004() {
    let proc = new util.types();
    let result = proc.isRegExp(new RegExp('123'));
    return result;
}

export function testIsRegExp005() {
    let proc = new util.types();
    let result = proc.isRegExp(new RegExp(/ab+c/, 'i'));
    return result;
}

export function testIsSet001() {
    let proc = new util.types();
    let result = proc.isSet(new Set());
    return result;
}

export function testIsSet002() {
    let proc = new util.types();
    let result = proc.isSet(new Map());
    return result;
}

export function testIsSet003() {
    let proc = new util.types();
    let result = proc.isSet(new String());
    return result;
}

export function testIsSet004() {
    let proc = new util.types();
    let result = proc.isSet(new Boolean());
    return result;
}

export function testIsSet005() {
    let proc = new util.types();
    let result = proc.isSet(new WeakSet());
    return result;
}

export function testIsSetIterator001() {
    let proc = new util.types();
    const set = new Set();
    let result = proc.isSetIterator(set.keys());
    return result;
}

export function testIsSetIterator002() {
    let proc = new util.types();
    const set = new Set();
    let result = proc.isSetIterator(set.values());
    return result;
}

export function testIsSetIterator003() {
    let proc = new util.types();
    const set = new Set();
    let result = proc.isSetIterator(set.entries());
    return result;
}

export function testIsSetIterator004() {
    let proc = new util.types();
    const set = new Set();
    let result = proc.isSetIterator(set[Symbol.iterator]());
    return result;
}

export function testIsSetIterator005() {
    let proc = new util.types();
    const set = new Set();
    let result = proc.isSetIterator(set);
    return result;
}

export function testIsSharedArrayBuffer001() {
    let proc = new util.types();
    let result = proc.isSharedArrayBuffer(new SharedArrayBuffer([]));
    return result;
}

export function testIsSharedArrayBuffer002() {
    let proc = new util.types();
    let result = proc.isSharedArrayBuffer(new Int16Array([]));
    return result;
}

export function testIsSharedArrayBuffer003() {
    let proc = new util.types();
    let result = proc.isSharedArrayBuffer(new Int32Array([]));
    return result;
}

export function testIsSharedArrayBuffer004() {
    let proc = new util.types();
    let result = proc.isSharedArrayBuffer(new ArrayBuffer([]));
    return result;
}

export function testIsSharedArrayBuffer005() {
    let proc = new util.types();
    let result = proc.isSharedArrayBuffer(new Uint8Array([]));
    return result;
}

export function testIsStringObject001() {
    let proc = new util.types();
    let result = proc.isStringObject(new String('foo'));
    return result;
}

export function testIsStringObject002() {
    let proc = new util.types();
    let result = proc.isStringObject(new String('twoo'));
    return result;
}

export function testIsStringObject003() {
    let proc = new util.types();
    let result = proc.isStringObject(new String('fdfsfd'));
    return result;
}

export function testIsStringObject004() {
    let proc = new util.types();
    let result = proc.isStringObject('ffds111');
    return result;
}

export function testIsStringObject005() {
    let proc = new util.types();
    let result = proc.isStringObject('foo');
    return result;
}

export function testIsSymbolObject001() {
    let proc = new util.types();
    const symbols = Symbol('foo');
    let result = proc.isSymbolObject(Object(symbols));
    return result;
}

export function testIsSymbolObject002() {
    let proc = new util.types();
    const symbols = Symbol('s12');
    let result = proc.isSymbolObject(Object(symbols));
    return result;
}

export function testIsSymbolObject003() {
    let proc = new util.types();
    const symbols = Symbol('sads');
    let result = proc.isSymbolObject(Object(symbols));
    return result;
}

export function testIsSymbolObject004() {
    let proc = new util.types();
    const symbols = Symbol('asdd');
    let result = proc.isSymbolObject(symbols);
    return result;
}

export function testIsSymbolObject005() {
    let proc = new util.types();
    const symbols = Symbol('foo');
    let result = proc.isSymbolObject(symbols);
    return result;
}

export function testIsTypedArray001() {
    let proc = new util.types();
    let result = proc.isTypedArray(new Float64Array([]));
    return result;
}

export function testIsTypedArray002() {
    let proc = new util.types();
    let result = proc.isTypedArray(new Uint8Array([]));
    return result;
}

export function testIsTypedArray003() {
    let proc = new util.types();
    let result = proc.isTypedArray(new Uint16Array([]));
    return result;
}

export function testIsTypedArray004() {
    let proc = new util.types();
    let result = proc.isTypedArray(new Uint32Array([]));
    return result;
}

export function testIsTypedArray005() {
    let proc = new util.types();
    let result = proc.isTypedArray(new ArrayBuffer());
    return result;
}

export function testIsUint8Array001() {
    let proc = new util.types();
    let result = proc.isUint8Array(new Uint8Array([]));
    return result;
}

export function testIsUint8Array002() {
    let proc = new util.types();
    let result = proc.isUint8Array(new Uint16Array([]));
    return result;
}

export function testIsUint8Array003() {
    let proc = new util.types();
    let result = proc.isUint8Array(new Uint32Array([]));
    return result;
}

export function testIsUint8Array004() {
    let proc = new util.types();
    let result = proc.isUint8Array(new Int8Array([]));
    return result;
}

export function testIsUint8Array005() {
    let proc = new util.types();
    let result = proc.isUint8Array(new Int16Array([]));
    return result;
}

export function testIsUint8ClampedArray001() {
    let proc = new util.types();
    let result = proc.isUint8ClampedArray(new Uint8ClampedArray([]));
    return result;
}

export function testIsUint8ClampedArray002() {
    let proc = new util.types();
    let result = proc.isUint8ClampedArray(new Int8Array([]));
    return result;
}

export function testIsUint8ClampedArray003() {
    let proc = new util.types();
    let result = proc.isUint8ClampedArray(new Int16Array([]));
    return result;
}

export function testIsUint8ClampedArray004() {
    let proc = new util.types();
    let result = proc.isUint8ClampedArray(new Int32Array([]));
    return result;
}

export function testIsUint8ClampedArray005() {
    let proc = new util.types();
    let result = proc.isUint8ClampedArray(new Uint32Array([]));
    return result;
}

export function testIsUint16Array001() {
    let proc = new util.types();
    let result = proc.isUint16Array(new Uint16Array([]));
    return result;
}

export function testIsUint16Array002() {
    let proc = new util.types();
    let result = proc.isUint16Array(new Uint8Array([]));
    return result;
}

export function testIsUint16Array003() {
    let proc = new util.types();
    let result = proc.isUint16Array(new Uint32Array([]));
    return result;
}

export function testIsUint16Array004() {
    let proc = new util.types();
    let result = proc.isUint16Array(new Uint8ClampedArray([]));
    return result;
}

export function testIsUint16Array005() {
    let proc = new util.types();
    let result = proc.isUint16Array(new Int8Array([]));
    return result;
}

export function testIsUint32Array001() {
    let proc = new util.types();
    let result = proc.isUint32Array(new Uint32Array([]));
    return result;
}

export function testIsUint32Array002() {
    let proc = new util.types();
    let result = proc.isUint32Array(new Uint8Array([]));
    return result;
}

export function testIsUint32Array003() {
    let proc = new util.types();
    let result = proc.isUint32Array(new Uint16Array([]));
    return result;
}

export function testIsUint32Array004() {
    let proc = new util.types();
    let result = proc.isUint32Array(new Int8Array([]));
    return result;
}

export function testIsUint32Array005() {
    let proc = new util.types();
    let result = proc.isUint32Array(new Uint8ClampedArray([]));
    return result;
}

export function testIsWeakMap001() {
    let proc = new util.types();
    let result = proc.isWeakMap(new WeakMap());
    return result;
}

export function testIsWeakMap002() {
    let proc = new util.types();
    let result = proc.isWeakMap(new Map());
    return result;
}

export function testIsWeakMap003() {
    let proc = new util.types();
    let result = proc.isWeakMap(new Set());
    return result;
}

export function testIsWeakMap004() {
    let proc = new util.types();
    let result = proc.isWeakMap(new String());
    return result;
}

export function testIsWeakMap005() {
    let proc = new util.types();
    let result = proc.isWeakMap(new WeakSet());
    return result;
}

export function testIsWeakSet001() {
    let proc = new util.types();
    let result = proc.isWeakSet(new WeakSet());
    return result;
}

export function testIsWeakSet002() {
    let proc = new util.types();
    let result = proc.isWeakSet(new WeakMap());
    return result;
}

export function testIsWeakSet003() {
    let proc = new util.types();
    let result = proc.isWeakSet(new String());
    return result;
}

export function testIsWeakSet004() {
    let proc = new util.types();
    let result = proc.isWeakSet(new Set());
    return result;
}

export function testIsWeakSet005() {
    let proc = new util.types();
    let result = proc.isWeakSet(new Map());
    return result;
}

export function testUtilRandomUUID001() {
    let result = util.randomUUID(true);
    return result.length;
}

export function testUtilRandomUUID002() {
    let result = util.randomUUID(false);
    return result.length;
}

export function testUtilRandomBinaryUUID001() {
    let result = util.randomBinaryUUID(true);
    return result.length;
}

export function testUtilRandomBinaryUUID002() {
    let result = util.randomBinaryUUID(false);
    return result.length;
}

export function testUtilParseUUID001() {
    let result = util.parseUUID('84bdf796-66cc-4655-9b89-d6218d100f9c');
    return result.length;
}

export function testUtilParseUUID002() {
    try {
        let result = util.parseUUID('84df796-66cc-4655-9b89-d6218d100f9c');
        return '';
    } catch (e) {
        return e.message;
    }
}

export function testUtilParseUUID003() {
    try {
        let result = util.parseUUID('84Wdf796-66cc-4655-9b89-d6218d100f9c');
        return '';
    } catch (e) {
        return e.message;
    }
}

export function testUtilgenerateRandomUUID001() {
    let result = util.generateRandomUUID(true);
    return result.length;
}

export function testUtilgenerateRandomUUID002() {
    let result = util.generateRandomUUID(false);
    return result.length;
}

export function testUtilgenerateRandomUUID003() {
    let sum = 0
    for (let i = 0; i < 10; i++) {
        let result = util.generateRandomUUID(true);
        if (result.length === 36) {
            sum++;
        }
    }
    if (sum !== 10) return false;
    return true;
}

export function testUtilgenerateRandomBinaryUUID001() {
    let result = util.generateRandomBinaryUUID(true);
    return result.length;
}

export function testUtilgenerateRandomBinaryUUID002() {
    let result = util.generateRandomBinaryUUID(false);
    return result.length;
}

export function test_getLower_001() {
    let result = rangeHp.getLower()
    return result.toString();
}

export function test_getLower_002() {
    let result = rangeHpFir.getLower()
    return result.toString();
}

export function test_getLower_003() {
    let result = rangeHpSec.getLower()
    return result.toString();
}

export function test_getLower_004() {
    let result = rangeHpThi.getLower()
    return result.toString();
}

export function test_getLower_005() {
    let result = rangeHpFif.getLower()
    return result.toString();
}

export function test_getUpper_001() {
    let result = rangeHp.getUpper()
    return result.toString();
}

export function test_getUpper_002() {
    let result = rangeHpFir.getUpper()
    return result.toString();
}

export function test_getUpper_003() {
    let result = rangeHpSec.getUpper()
    return result.toString();
}

export function test_getUpper_004() {
    let result = rangeHpThi.getUpper()
    return result.toString();
}

export function test_getUpper_005() {
    let result = rangeHpFif.getUpper()
    return result.toString();
}

export function test_clamp_001() {
    let result = rangeHp.clamp(tempLess)
    return result.toString();
}

export function test_clamp_002() {
    let result = rangeHp.clamp(tempMiDF)
    return result.toString();
}

export function test_clamp_003() {
    let result = rangeHp.clamp(tempMore)
    return result.toString();
}

export function test_clamp_004() {
    let result = rangeHp.clamp(tempLower)
    return result.toString();
}

export function test_clamp_005() {
    let result = rangeHp.clamp(tempUpper)
    return result.toString();
}

export function test_contains_001() {
    let result = rangeHp.contains(tempLess)
    return result;
}

export function test_contains_002() {
    let result = rangeHp.contains(tempMiDF)
    return result;
}

export function test_contains_003() {
    let result = rangeHp.contains(tempMore)
    return result;
}

export function test_contains_004() {
    let result = rangeHp.contains(tempLower)
    return result;
}

export function test_contains_005() {
    let result = rangeHp.contains(tempUpper)
    return result;
}

export function test_contains_006() {
    let result = rangeHp.contains(rangeHpFir)
    return result;
}

export function test_contains_007() {
    let result = rangeHp.contains(rangeHpSec)
    return result;
}

export function test_contains_008() {
    let result = rangeHp.contains(rangeHpThi)
    return result;
}

export function test_contains_009() {
    let result = rangeHp.contains(rangeHpFif)
    return result;
}

export function test_contains_010() {
    let result = rangeHp.contains(rangeHp)
    return result;
}

export function test_expand_001() {
    let result = rangeHp.expand(tempMiDF, tempMidS)
    return result.toString();
}

export function test_expand_002() {
    let result = rangeHp.expand(tempLess, tempMore)
    return result.toString();
}

export function test_expand_003() {
    let result = rangeHp.expand(tempLess, tempMiDF)
    return result.toString();
}

export function test_expand_004() {
    let result = rangeHp.expand(tempMiDF, tempMore)
    return result.toString();
}

export function test_expand_005() {
    let result = rangeHp.expand(tempLower, tempUpper)
    return result.toString();
}

export function test_expand_006() {
    let result = rangeHp.expand(rangeHpFir)
    return result.toString();
}

export function test_expand_007() {
    let result = rangeHp.expand(rangeHpSec)
    return result.toString();
}

export function test_expand_008() {
    let result = rangeHp.expand(rangeHpThi)
    return result.toString();
}

export function test_expand_009() {
    let result = rangeHp.expand(rangeHpFif)
    return result.toString();
}

export function test_expand_010() {
    let result = rangeHp.expand(rangeHp)
    return result.toString();
}

export function test_expand_011() {
    let result = rangeHp.expand(tempMiDF)
    return result.toString();
}

export function test_expand_012() {
    let result = rangeHp.expand(tempLess)
    return result.toString();
}

export function test_expand_013() {
    let result = rangeHp.expand(tempMore)
    return result.toString();
}

export function test_expand_014() {
    let result = rangeHp.expand(tempLower)
    return result.toString();
}

export function test_expand_015() {
    let result = rangeHp.expand(tempUpper)
    return result.toString();
}

export function test_intersect_001() {
    let result = rangeHp.intersect(rangeHpFir)
    return result.toString();
}

export function test_intersect_002() {
    let result = rangeHp.intersect(rangeHpSec)
    return result.toString();
}

export function test_intersect_003() {
    let result = rangeHp.intersect(rangeHpThi)
    return result.toString();
}

export function test_intersect_004() {
    let result = rangeHp.intersect(rangeHpFif)
    return result.toString();
}

export function test_intersect_005() {
    let result = rangeHp.intersect(rangeHp)
    return result.toString();
}

export function test_intersect_006() {
    let result = rangeHp.intersect(tempMiDF, tempMidS)
    return result.toString();
}

export function test_intersect_007() {
    let result = rangeHp.intersect(tempLess, tempMore)
    return result.toString();
}

export function test_intersect_008() {
    let result = rangeHp.intersect(tempLess, tempMiDF)
    return result.toString();
}

export function test_intersect_009() {
    let result = rangeHp.intersect(tempMiDF, tempMore)
    return result.toString();
}

export function test_intersect_010() {
    let result = rangeHp.intersect(tempLower, tempUpper)
    return result.toString();
}

export function test_toString_001() {
    let result = rangeHp.toString()
    return result.toString();
}

export function test_toString_002() {
    let result = rangeHpFir.toString()
    return result.toString();
}

export function test_toString_003() {
    let result = rangeHpSec.toString()
    return result.toString();
}

export function test_toString_004() {
    let result = rangeHpThi.toString()
    return result.toString();
}

export function test_toString_005() {
    let result = rangeHpFif.toString()
    return result.toString();
}

export function test_constructor_throwError_001() {
    try {
        let range = new util.ScopeHelper(1, 2);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_intersect_throwError_001() {
    try {
        let result = rangeHp.intersect("str")
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_intersect_throwError_002() {
    try {
        let result = rangeHp.intersect(tempMiDF, 123)
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_expand_throwError_001() {
    try {
        let result = rangeHp.expand(tempMiDF, "123")
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_expand_throwError_002() {
    try {
        let result = rangeHp.expand(123)
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_contains_throwError_001() {
    try {
        let result = rangeHp.contains("str")
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_clamp_throwError_001() {
    try {
        let result = rangeHp.clamp(123)
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function testLRUCacheUpdateGetCapacity001() {
    let that = new util.LRUCache()
    that.updateCapacity(10)
    let result = that.getCapacity()
    return result;
}

export function testLRUCacheUpdateGetCapacity002() {
    let that = new util.LRUCache()
    that.updateCapacity(2147483646)
    let result = that.getCapacity()
    return result;
}

export function testLRUCacheUpdateGetCapacity003() {
    let that = new util.LRUCache(100)
    that.updateCapacity(20)
    let result = that.getCapacity()
    return result;
}

export function testLRUCacheUpdateGetCapacity004() {
    let that = new util.LRUCache(50)
    that.updateCapacity(2)
    let result = that.getCapacity()
    return result;
}

export function testLRUCacheUpdateGetCapacity005() {
    let that = new util.LRUCache(200)
    that.updateCapacity(100)
    let result = that.getCapacity()
    return result;
}

export function testLRUCacheUpdateGetCapacity006() {
    let that = new util.LRUCache(200)
    try {
        that.updateCapacity('a');
    } catch (e) {
        return e.code
    }

}

export function testLRUCacheGet001() {
    let that = new util.LRUCache(100)
    that.put(1, 2)
    let result = that.get(1)
    return result;
}

export function testLRUCacheGet002() {
    let that = new util.LRUCache(100)
    that.put(1, 2)
    let result = that.get(5)
    return result;
}

export function testLRUCacheGet003() {
    let that = new util.LRUCache(100)
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    let result1 = that.get(20)
    let result2 = that.get('abcd')
    let result3 = that.get(2)
    return [result1, result2, result3];
}

export function testLRUCacheGet004() {
    let that = new util.LRUCache()
    that.put('1111', 'bcjdshc')
    that.put(20, 'cdjcaxb')
    that.put('abcd', 15)
    let result1 = that.get('1111')
    let result2 = that.get(20)
    let result3 = that.get('abcd')
    let result4 = that.get(25)
    return [result1, result2, result3, result4];
}

export function testLRUCacheGet005() {
    let that = new util.LRUCache()
    that.put('1111', 'bcjdshc')
    that.put(20, 'cdjcaxb')
    that.updateCapacity(2)
    that.put('abcd', 15)
    let result1 = that.get('1111')
    let result2 = that.get(20)
    let result3 = that.get('abcd')
    let result4 = that.get(25)
    return [result1, result2, result3, result4];
}

export function testLRUCacheGet006() {
    let that = new util.LRUCache()
    let un = undefined;
    that.put(20, 'cdjcaxb')
    try {
        let result1 = that.get(un);
    } catch (e) {
        return e.code
    }

}

export function testLRUCachePut001() {
    let that = new util.LRUCache()
    let temp = that.put('1111', 'bcjdshc')
    return temp;
}

export function testLRUCachePut002() {
    let that = new util.LRUCache()
    let temp1 = that.put('1111', 'bcjdshc')
    let temp2 = that.put('1111', 13)
    return temp2;
}

export function testLRUCachePut003() {
    let that = new util.LRUCache()
    let temp = that.put('1111', 'bcjdshc')
    let temp1 = that.put(1, 12)
    let temp2 = that.put(2, 5)
    let temp3 = that.put(2, 'adasfdad')
    let temp4 = that.put('abc', 10)
    return [temp1, temp2, temp3, temp4];
}

export function testLRUCachePut004() {
    let that = new util.LRUCache()
    let temp = that.put('1111', 'bcjdshc')
    let temp1 = that.put(1, 12)
    let temp2 = that.put(2, 5)
    that.updateCapacity(2)
    let temp3 = that.put(2, 'adasfdad')
    let temp4 = that.put('1111', 10)
    return [temp, temp1, temp2, temp3, temp4];
}

export function testLRUCachePut005() {
    let that = new util.LRUCache()
    let temp = that.put('1111', 'bcjdshc')
    let temp1 = that.put(1, 12)
    let temp2 = that.put(2, 5)
    let temp3 = that.put(1, 10)
    let temp4 = that.put(2, 22)
    let temp5 = that.put(2, 30)
    return [temp, temp1, temp2, temp3, temp4, temp5];
}

export function testLRUCachePut006() {
    let that = new util.LRUCache()
    let un = undefined;
    try {
        that.put(un, 'bcjdshc')
    } catch (e) {
        return e.code
    }
}

export function testLRUCacheGetCreateCount001() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.get(3)
    that.get(5)
    that.get(10)
    let result = that.getCreateCount()
    return result;
}

export function testLRUCacheGetCreateCount002() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.get(6)
    that.get(8)
    that.get(20)
    let result = that.getCreateCount()
    return result;
}

export function testLRUCacheGetCreateCount003() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    that.get('abc')
    that.get('cndk')
    let result = that.getCreateCount()
    return result;
}

export function testLRUCacheGetCreateCount004() {
    let that = new util.LRUCache()
    that.put(5, 2)
    that.put(10, 10)
    that.put('abcd', 'abcd')
    that.get(3)
    that.get(20)
    that.get(12)
    let result = that.getCreateCount()
    return result;
}

export function testLRUCacheGetCreateCount005() {
    let that = new util.LRUCache()
    that.put('xsjk', 'bcjds')
    that.put('ajc', 10)
    that.put('abcd', 15)
    that.get(2)
    that.get(10)
    that.get(30)
    let result = that.getCreateCount()
    return result;
}

export function testLRUCacheGetMissCount001() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.get(3)
    that.get(5)
    that.get(10)
    let result = that.getMissCount()
    return result;
}

export function testLRUCacheGetMissCount002() {
    let that = new util.LRUCache()
    that.put(5, 2)
    that.put(1, 10)
    that.put('abcd', 'bcjsc')
    that.get(2)
    that.get(10)
    that.get(15)
    let result = that.getMissCount()
    return result;
}

export function testLRUCacheGetMissCount003() {
    let that = new util.LRUCache()
    that.put(10, 10)
    that.put(3, 20)
    that.put(12, 16)
    that.get(1)
    that.get(2)
    that.get(6)
    let result = that.getMissCount()
    return result;
}

export function testLRUCacheGetMissCount004() {
    let that = new util.LRUCache()
    that.put('acb', 'asdc')
    that.put('vfb', 1)
    that.put('abcd', 'abcd')
    that.get(3)
    that.get(5)
    that.get(10)
    let result = that.getMissCount()
    return result;
}

export function testLRUCacheGetMissCount005() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.get(3)
    that.get(5)
    that.get(10)
    that.contains(2)
    that.contains(6)
    let result = that.getMissCount()
    return result;
}

export function testLRUCacheGetMissCount006() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.get(1)
    that.get(2)
    that.get('abcd')
    let result = that.getMissCount()
    return result;
}

export function testLRUCacheGetRemovalCount001() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.put(3, 20)
    that.put(5, 30)
    let result = that.getRemovalCount()
    return result;
}

export function testLRUCacheGetRemovalCount002() {
    let that = new util.LRUCache()
    that.put(10, 2)
    that.put(3, 2)
    that.put(15, 15)
    that.put(1, 20)
    let result = that.getRemovalCount()
    return result;
}

export function testLRUCacheGetRemovalCount003() {
    let that = new util.LRUCache()
    that.put('abc', 2)
    that.put('abcd', 'abcd')
    that.put(3, 2)
    let result = that.getRemovalCount()
    return result;
}

export function testLRUCacheGetRemovalCount004() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.updateCapacity(2)
    that.put(3, 20)
    that.put(5, 30)
    let result = that.getRemovalCount()
    return result;
}

export function testLRUCacheGetRemovalCount005() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.updateCapacity(3)
    that.put('string', 20)
    that.put('abc', 30)
    that.put(10, 20)
    let result = that.getRemovalCount()
    return result;
}

export function testLRUCacheGetMatchCount001() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.get(1)
    that.get(2)
    that.get('abcd')
    let result = that.getMatchCount()
    return result;
}

export function testLRUCacheGetMatchCount002() {
    let that = new util.LRUCache()
    that.put(10, 2)
    that.put(2, 1)
    that.put('abcd', 15)
    that.get(10)
    that.get(2)
    that.get('abcd')
    that.get('string')
    let result = that.getMatchCount()
    return result;
}

export function testLRUCacheGetMatchCount003() {
    let that = new util.LRUCache()
    that.put(0, 1)
    that.put(30, 10)
    that.put('abcd', 15)
    that.get(0)
    that.get(30)
    that.get('abcd')
    let result = that.getMatchCount()
    return result;
}

export function testLRUCacheGetMatchCount004() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.get(1)
    that.get(2)
    that.get('abcd')
    that.contains(2)
    that.contains('abcd')
    that.contains(20)
    let result = that.getMatchCount()
    return result;
}

export function testLRUCacheGetMatchCount005() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.put('string', 'string')
    that.get(1)
    that.get(2)
    that.get('abcd')
    that.get('string')
    that.contains(2)
    that.contains('abcd')
    that.contains('string')
    that.contains(10)
    let result = that.getMatchCount()
    return result;
}

export function testLRUCacheGetMatchCount006() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.get(5)
    let result = that.getMatchCount()
    return result;
}

export function testLRUCacheGetPutCount001() {
    let that = new util.LRUCache()
    that.put(1, 2)
    let result = that.getPutCount()
    return result;
}

export function testLRUCacheGetPutCount002() {
    let that = new util.LRUCache()
    that.put(5, 3)
    that.put(2, 10)
    let result = that.getPutCount()
    return result;
}

export function testLRUCacheGetPutCount003() {
    let that = new util.LRUCache()
    that.put('string', 2)
    that.put('abcd', 1)
    that.put('ab', 'a')
    let result = that.getPutCount()
    return result;
}

export function testLRUCacheGetPutCount004() {
    let that = new util.LRUCache()
    that.put('string', 'string')
    that.put('ac', 'abc')
    that.put('abcd', 15)
    let result = that.getPutCount()
    return result;
}

export function testLRUCacheGetPutCount005() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    that.updateCapacity(2)
    that.put('abcd', 'abc')
    let result = that.getPutCount()
    return result;
}

export function testLRUCacheGetCapacity001() {
    let that = new util.LRUCache()
    let result = that.getCapacity()
    return result;
}

export function testLRUCacheGetCapacity002() {
    let that = new util.LRUCache(2)
    let result = that.getCapacity()
    return result;
}

export function testLRUCacheGetCapacity003() {
    let that = new util.LRUCache(100)
    let result = that.getCapacity()
    return result;
}

export function testLRUCacheGetCapacity004() {
    let that = new util.LRUCache()
    that.updateCapacity(50)
    let result = that.getCapacity()
    return result;
}

export function testLRUCacheGetCapacity005() {
    let that = new util.LRUCache(100)
    that.updateCapacity(10)
    let result = that.getCapacity()
    return result;
}

export function testLRUCacheLength001() {
    let that = new util.LRUCache()
    let result = that.length
    return result;
}

export function testLRUCacheLength002() {
    let that = new util.LRUCache()
    that.put(1, 2)
    let result = that.length
    return result;
}

export function testLRUCacheLength003() {
    let that = new util.LRUCache()
    that.put('abc', 2)
    that.put('string', 'string')
    let result = that.length
    return result;
}

export function testLRUCacheLength004() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.put('abcd', 20)
    let result = that.length
    return result;
}

export function testLRUCacheLength005() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    that.put('abcd', 15)
    that.put('abcd', 20)
    that.updateCapacity(3);
    that.put(5, 33);
    that.put(25, 35);
    let result = that.length
    return result;
}

export function testLRUCacheClear001() {
    let that = new util.LRUCache()
    that.put(1, 2)
    let result1 = that.length
    that.clear()
    let result2 = that.length
    return [result1, result2];
}

export function testLRUCacheClear002() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    that.put(5, 33);
    that.put(25, 35);
    let result1 = that.length
    that.clear()
    let result2 = that.length
    return [result1, result2];
}

export function testLRUCacheClear003() {
    let that = new util.LRUCache()
    that.put('abc', 2)
    that.put(2, 'abc')
    that.put('ancd', 'abcd')
    that.put(10, 35)
    let result1 = that.length
    that.clear()
    let result2 = that.length
    return [result1, result2];
}

export function testLRUCacheClear004() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    that.put(5, 33);
    that.updateCapacity(3);
    let result1 = that.length
    that.clear()
    let result2 = that.length
    return [result1, result2];
}

export function testLRUCacheClear005() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    that.put(5, 33);
    that.put('abcd', 'string');
    that.updateCapacity(2);
    let result1 = that.length
    that.clear()
    let result2 = that.length
    return [result1, result2];
}

export function testLRUCacheIsEmpty001() {
    let that = new util.LRUCache()
    that.put(1, 2)
    let result = that.isEmpty()
    return result;
}

export function testLRUCacheIsEmpty002() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    let result = that.isEmpty()
    return result;
}

export function testLRUCacheIsEmpty003() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    that.put(5, 33)
    let result = that.isEmpty()
    return result;
}

export function testLRUCacheIsEmpty004() {
    let that = new util.LRUCache()
    that.put('abc', 2)
    that.put('string', 10)
    that.put('ab', 'abc')
    let result = that.isEmpty()
    return result;
}

export function testLRUCacheIsEmpty005() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(2, 10)
    that.put(5, 33);
    that.clear()
    let result = that.isEmpty()
    return result;
}

export function testLRUCacheContains001() {
    let that = new util.LRUCache()
    that.put(1, 2)
    let result = that.contains(1)
    return result;
}

export function testLRUCacheContains002() {
    let that = new util.LRUCache()
    that.put(0, 5)
    let result = that.contains(0)
    return result;
}

export function testLRUCacheContains003() {
    let that = new util.LRUCache()
    that.put('abc', 'abc')
    let result = that.contains(1)
    return result;
}

export function testLRUCacheContains004() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put('abcd', 20)
    let result1 = that.contains(1)
    let result2 = that.contains(20)
    return [result1, result2];
}

export function testLRUCacheContains005() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put('string', 'string')
    let result1 = that.contains(1)
    let result2 = that.contains('string')
    let result3 = that.contains(0)
    return [result1, result2, result3];
}

export function testLRUCacheContains006() {
    let that = new util.LRUCache()
    that.put('abc', 'abc')
    let un = undefined;
    try {
        that.contains(un)
    } catch (e) {
        return e.code
    }
}

export function testLRUCacheRemove001() {
    let that = new util.LRUCache()
    that.put(1, 2)
    let result = that.remove(1)
    return result;
}

export function testLRUCacheRemove002() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put('abcd', 20)
    let result1 = that.remove(1)
    let result2 = that.remove('abcd')
    return [result1, result2];
}

export function testLRUCacheRemove003() {
    let that = new util.LRUCache()
    that.put(1, 2)
    let result1 = that.remove(1)
    let result2 = that.remove(5)
    return [result1, result2];
}

export function testLRUCacheRemove004() {
    let that = new util.LRUCache()
    that.put(0, 'abc')
    that.put('abcd', 20)
    let result1 = that.remove(1)
    let result2 = that.remove('abcd')
    return [result1, result2];
}

export function testLRUCacheRemove005() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    let result1 = that.remove(1)
    let result2 = that.remove(3)
    let result3 = that.get(3)
    return [result1, result2, result3];
}

export function testLRUCacheRemove006() {
    let that = new util.LRUCache()
    that.put(1, 2)
    let un = undefined;
    try {
        that.remove(un)
    } catch (e) {
        return e.code
    }
}

export function testLRUCacheCreateDefault001() {
    let that = new util.LRUCache()
    let result = that.createDefault(1)
    return result;
}

export function testLRUCacheCreateDefault002() {
    let that = new util.LRUCache()
    let result = that.createDefault(0)
    return result;
}

export function testLRUCacheCreateDefault003() {
    let that = new util.LRUCache()
    let result = that.createDefault('string')
    return result;
}

export function testLRUCacheCreateDefault004() {
    let that = new util.LRUCache()
    let result = that.createDefault(10)
    return result;
}

export function testLRUCacheCreateDefault005() {
    let that = new util.LRUCache()
    let result1 = that.createDefault('abc')
    let result2 = that.createDefault('ab')
    return [result1, result2];
}

export function testLRUCacheCreateDefault006() {
    let that = new util.LRUCache()
    let un = undefined;
    try {
        that.createDefault(un);
    } catch (e) {
        return e.code
    }
}

export function testLRUCacheKeys001() {
    let that = new util.LRUCache()
    that.put('string', 'abc')
    let result = that.keys()
    return result[0];
}

export function testLRUCacheKeys002() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    let result = that.keys()
    return [result[0], result[1], result[2], result[3]];
}

export function testLRUCacheKeys003() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    let result = that.keys()
    return [result[0], result[1], result[2], result[3]];
}

export function testLRUCacheKeys004() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    that.contains(1)
    let result = that.keys()
    return [result[0], result[1], result[2], result[3]];
}

export function testLRUCacheKeys005() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    that.remove(5)
    that.contains(3)
    that.get(1)
    that.contains('abc')
    let result = that.keys()
    return [result[0], result[1], result[2]];
}

export function testLRUCacheValues001() {
    let that = new util.LRUCache()
    that.put('string', 'abc')
    let result = that.values()
    return result[0];
}

export function testLRUCacheValues002() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    let result = that.values()
    return [result[0], result[1], result[2], result[3]];
}

export function testLRUCacheValues003() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    let result = that.values()
    return [result[0], result[1], result[2], result[3]];
}

export function testLRUCacheValues004() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    that.contains(1)
    let result = that.values()
    return [result[0], result[1], result[2], result[3]];
}

export function testLRUCacheValues005() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    that.remove(5)
    that.contains(3)
    that.get(1)
    that.contains('abc')
    let result = that.values()
    return [result[0], result[1], result[2]];
}

export function testLRUCacheToString001() {
    let that = new util.LRUCache()
    that.put('1111', 'bcjdshc')
    that.put(1, 2)
    let result = that.toString()
    return result;
}

export function testLRUCacheToString002() {
    let that = new util.LRUCache()
    that.put('1111', 'bcjdshc')
    that.put(1, 2)
    that.get(1)
    that.get('1111')
    let result = that.toString()
    return result;
}

export function testLRUCacheToString003() {
    let that = new util.LRUCache(100)
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    let result = that.toString()
    return result;
}

export function testLRUCacheToString004() {
    let that = new util.LRUCache(100)
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    that.get(2)
    let result = that.toString()
    return result;
}

export function testLRUCacheToString005() {
    let that = new util.LRUCache(100)
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    that.get(2)
    that.get(1)
    that.contains(5)
    let result = that.toString()
    return result;
}

export function testLRUCacheEntries001() {
    let that = new util.LRUCache()
    that.put('string', 'abc')
    let i = 0;
    let arr = {};
    for (let entry of that.entries()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
    }
    if (arr[1] !== 'abc') return false;
    return true;
}

export function testLRUCacheEntries002() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    let i = 0;
    let arr = {};
    for (let entry of that.entries()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
    }
    if (arr[1] !== 2) return false;
    return true;
}

export function testLRUCacheEntries003() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    let i = 0;
    let arr = {};
    for (let entry of that.entries()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
    }
    if (arr[0] !== 1) return false;
    return true;
}

export function testLRUCacheEntries004() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    that.contains(1)
    let i = 0;
    let arr = {};
    for (let entry of that.entries()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
    }
    if (arr[1] !== 15) return false;
    if (arr[3] !== 20) return false;
    return true;
}

export function testLRUCacheEntries005() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    that.remove(5)
    that.contains(3)
    that.get(1)
    that.contains('abc')
    let i = 0;
    let arr = {};
    for (let entry of that.entries()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
    }
    if (arr[1] !== 10) return false;
    if (arr[3] !== 2) return false;
    if (arr[5] !== 20) return false;
    return true;
}

export function testLRUCacheSymbol001() {
    let that = new util.LRUCache()
    that.put('string', 'abc')
    that.put('abc', 20)
    let i = 0;
    let arr = {};
    for (let entry of that[Symbol.iterator]()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
    }
    if (arr[1] !== 'abc') return false;
    return true;
}

export function testLRUCacheSymbol002() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    let i = 0;
    let arr = {};
    for (let entry of that[Symbol.iterator]()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
    }
    if (arr[1] !== 2) return false;
    return true;
}

export function testLRUCacheSymbol003() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    let i = 0;
    let arr = {};
    for (let entry of that[Symbol.iterator]()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
    }
    if (arr[0] !== 1) return false;
    return true;
}

export function testLRUCacheSymbol004() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    that.contains(1)
    let i = 0;
    let arr = {};
    for (let entry of that[Symbol.iterator]()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
    }
    if (arr[1] !== 15) return false;
    if (arr[3] !== 20) return false;
    return true;
}

export function testLRUCacheSymbol005() {
    let that = new util.LRUCache()
    that.put(1, 2)
    that.put(3, 10)
    that.put(5, 15)
    that.put('abc', 20)
    that.get(3)
    that.remove(5)
    that.contains(3)
    that.get(1)
    that.contains('abc')
    let i = 0;
    let arr = {};
    for (let entry of that[Symbol.iterator]()) {
        arr[i] = entry[0];
        i++;
        arr[i] = entry[1];
        i++;
    }
    if (arr[1] !== 10) return false;
    if (arr[3] !== 2) return false;
    if (arr[5] !== 20) return false;
    return true;
}

export function testLRUCacheAfterRemoval001() {
    let arr = [];

    class ChildLRUCache extends util.LRUCache {
        constructor() {
            super();
        }

        static getInstance() {
            if (this.instance == null) {
                this.instance = new ChildLRUCache();
            }
            return this.instance;
        }

        afterRemoval(isEvict, key, value, newValue) {
            if (isEvict === false) {
                arr = [key, value, newValue];
            }
        }
    }

    ChildLRUCache.getInstance().afterRemoval(false, 10, 30, null)
    return arr[0];
}

export function testLRUCacheAfterRemoval002() {
    let arr = [];

    class ChildLRUCache extends util.LRUCache {
        constructor() {
            super();
        }

        static getInstance() {
            if (this.instance == null) {
                this.instance = new ChildLRUCache();
            }
            return this.instance;
        }

        afterRemoval(isEvict, key, value, newValue) {
            if (isEvict === false) {
                arr = [key, value, newValue];
            }
        }
    }

    ChildLRUCache.getInstance().afterRemoval(false, 'string', 10, null)
    return arr[0];
}

export function testLRUCacheAfterRemoval003() {
    let arr = [];

    class ChildLRUCache extends util.LRUCache {
        constructor() {
            super();
        }

        static getInstance() {
            if (this.instance == null) {
                this.instance = new ChildLRUCache();
            }
            return this.instance;
        }

        afterRemoval(isEvict, key, value, newValue) {
            if (isEvict === false) {
                arr = [key, value, newValue];
            }
        }
    }

    ChildLRUCache.getInstance().afterRemoval(false, 10, 30, 12)
    return arr[2];
}

export function testLRUCacheAfterRemoval004() {
    let arr = [];

    class ChildLRUCache extends util.LRUCache {
        constructor() {
            super();
        }

        static getInstance() {
            if (this.instance == null) {
                this.instance = new ChildLRUCache();
            }
            return this.instance;
        }

        afterRemoval(isEvict, key, value, newValue) {
            if (isEvict === false) {
                arr = [key, value, newValue];
            }
        }
    }

    ChildLRUCache.getInstance().afterRemoval(false, 'abc', 30, 'string')
    return arr[1];
}

export function testLRUCacheAfterRemoval005() {
    let arr = [];

    class ChildLRUCache extends util.LRUCache {
        constructor() {
            super();
        }

        static getInstance() {
            if (this.instance == null) {
                this.instance = new ChildLRUCache();
            }
            return this.instance;
        }

        afterRemoval(isEvict, key, value, newValue) {
            if (isEvict === true) {
                arr = [key, value, newValue];
            }
        }
    }

    ChildLRUCache.getInstance().afterRemoval(true, 'abc', 'ab', 'string')
    return arr[2];
}

export function testLRUCacheAfterRemoval006() {
    let arr = [];

    class ChildLRUCache extends util.LRUCache {
        constructor(capacity) {
            super(capacity);
        }

        afterRemoval(isEvict, key, value, newValue) {
            if (isEvict === true) {
                arr = [key, value];
            }
        }
    }

    let that = new ChildLRUCache(2);
    that.put(1, 2)
    that.put(3, 10)
    that.put('abc', 20)
    return arr[1];
}

export function testLRUCacheAfterRemoval007() {
    let arr = [];

    class ChildLRUCache extends util.LRUCache {
        constructor(capacity) {
            super(capacity);
        }

        afterRemoval(isEvict, key, value, newValue) {
            if (isEvict === false) {
                arr = [key, value, newValue];
            }
        }
    }

    let that = new ChildLRUCache(3);
    that.put(1, 2)
    that.put(3, 10)
    that.put(1, 8)
    return arr[2];
}

export function testLRUCacheAfterRemoval008() {
    let arrk = [];
    let arrv = [];

    class ChildLRUCache extends util.LRUCache {
        constructor(capacity) {
            super(capacity);
        }

        afterRemoval(isEvict, key, value, newValue) {
            if (isEvict === false) {
                arrk.push(key);
                arrv.push(value);
            }
        }
    }

    let that = new ChildLRUCache(3);
    that.put(1, 2)
    that.put(3, 10)
    that.put(2, 8)
    that.clear();
    return [arrk[0], arrk[1], arrk[2], arrv[0], arrv[1], arrv[2]];
}

export function testLRUCacheConstrcutor001() {
    try {
        let that = new util.LRUCache(0.1)
        return '';
    } catch (e) {
        return e.code;
    }
}

export function testLRUCacheConstrcutor002() {
    try {
        let that = new util.LRUCache(-0.1)
        return '';
    } catch (e) {
        return e.code
    }
}

export function testLRUCacheUpdateGetCapacity007() {
    let that = new util.LRUCache(200)
    try {
        that.updateCapacity(-20);
    } catch (e) {
        return e.code
    }
}

export function testLRUCacheUpdateGetCapacity008() {
    let that = new util.LRUCache(200)
    try {
        that.updateCapacity(50.5);
    } catch (e) {
        return e.code
    }
}

export function testLRUCacheGet007() {
    let that = new util.LRUCache()
    that.put(20, 'cdjcaxb')
    try {
        let result1 = that.get(null);
    } catch (e) {
        return e.code
    }
}

export function testLRUCachePut007() {
    let that = new util.LRUCache()
    try {
        that.put(null, 'bcjdshc')
    } catch (e) {
        return e.code
    }
}

export function testLRUCachePut008() {
    let that = new util.LRUCache()
    try {
        that.put(123, null)
    } catch (e) {
        return e.code
    }
}

export function testLRUCacheRemove007() {
    let that = new util.LRUCache()
    that.put(1, 2)
    try {
        that.remove(null)
    } catch (e) {
        return e.code
    }
}

export function testUtilformat001() {
    let format = "%i,%s";
    let value1 = 1.5;
    let value2 = "qwer";
    let value3 = 15;
    let result = util.format(format, value1, value2, value3);
    return result;
}

export function testUtilformat002() {
    let format = "%O";
    let value = { name: 'jack', age: 15 };
    let result = util.format(format, value);
    return result;
}

export function testUtilformat003() {
    let format = "%o";
    let value = [1, 2, 3];
    let result = util.format(format, value);
    let res = '[ 1, 2, 3, [length]: 3 ]'
    return result;
}

export function testUtilformat004() {
    let format = "%s,%s,%s";
    let value1 = "1.5";
    let value2 = "qwer";
    let result = util.format(format, value1, value2);
    return result;
}

export function testUtilformat005() {
    let format = "%d,%d";
    let value1 = 6;
    let value2 = 16;
    let result = util.format(format, value1, value2);
    return result;
}

export function testUtilformatThrowError001() {
    try {
        let format = 123;
        let value1 = 1.5;
        let value2 = "qwer";
        let value3 = 15;
        let result = util.format(format, value1, value2, value3);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function testUtilerrnoToString001() {
    let errnum = 10;
    let result = util.errnoToString(errnum);
    return result;
}

export function testUtilerrnoToString002() {
    let errnum = 0;
    let result = util.errnoToString(errnum);
    return result;
}

export function testUtilerrnoToString003() {
    let errnum = -1;
    let result = util.errnoToString(errnum);
    return result;
}

export function testUtilerrnoToString004() {
    let errnum = 9;
    let result = util.errnoToString(errnum);
    return result;
}

export function testUtilerrnoToString005() {
    let errnum = 555;
    let result = util.errnoToString(errnum);
    return result;
}

export function testUtilerrnoToStringThrowError001() {
    try {
        let errnum = 'str';
        let result = util.errnoToString(errnum);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function testUtilRandomUUIDThrowError001() {
    try {
        let result = util.randomUUID(123);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function testUtilRandomBinaryUUIDThrowError001() {
    try {
        let result = util.randomBinaryUUID(123);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function testUtilParseUUIDThrow001() {
    try {
        let result = util.parseUUID(123);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_parseRationalNumber_001() {
    let res = util.RationalNumber.parseRationalNumber(2, 1)
    let result = res.valueOf()
    return result;
}

export function test_parseRationalNumberThrowError_001() {
    try {
        let pro = util.RationalNumber.parseRationalNumber('str', 2)
        let result = res.valueOf()
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_createRationalFromString_001() {
    let res = util.RationalNumber.createRationalFromString('-1:2')
    let result = res.valueOf()
    return result;
}

export function test_createRationalFromString_002() {
    let res = util.RationalNumber.createRationalFromString('+3/4')
    let result = res.valueOf()
    return result;
}

export function test_createRationalFromString_003() {
    let res = util.RationalNumber.createRationalFromString('+3:-4')
    let result = res.valueOf()
    return result;
}

export function test_createRationalFromString_004() {
    let res = util.RationalNumber.createRationalFromString('+2:4')
    let result = res.valueOf()
    return result;
}

export function test_createRationalFromString_005() {
    let res = util.RationalNumber.createRationalFromString('+2:-4')
    let result = res.valueOf()
    return result;
}

export function test_createRationalFromStringThrowError_001() {
    try {
        let res = util.RationalNumber.createRationalFromString(123)
        let result = res.valueOf()
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_compare_001() {
    let pro = util.RationalNumber.parseRationalNumber(2, 1)
    let proc = util.RationalNumber.parseRationalNumber(3, 4)
    let res = pro.compare(proc)
    return res;
}

export function test_compare_002() {
    let pro = util.RationalNumber.parseRationalNumber(2, 1)
    let proc = util.RationalNumber.parseRationalNumber(0, 0)
    let res = pro.compare(proc)
    return res;
}

export function test_compare_003() {
    let pro = util.RationalNumber.parseRationalNumber(2, 1)
    let proc = util.RationalNumber.parseRationalNumber(8, 3)
    let res = pro.compare(proc)
    return res;
}

export function test_compare_004() {
    let pro = util.RationalNumber.parseRationalNumber(2, 1)
    let proc = util.RationalNumber.parseRationalNumber(2, 1)
    let res = pro.compare(proc)
    return res;
}

export function test_compare_005() {
    let pro = util.RationalNumber.parseRationalNumber(0, 0)
    let proc = util.RationalNumber.parseRationalNumber(2, 1)
    let res = pro.compare(proc)
    return res;
}

export function test_compareThrowError_001() {
    try {
        let pro = util.RationalNumber.parseRationalNumber(2, 1)
        let proc = 'str'
        let res = pro.compare(proc)
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function testgetCommonFactor001() {
    let res = util.RationalNumber.getCommonFactor(4, 8)
    return res;
}

export function testgetCommonFactor002() {
    let res = util.RationalNumber.getCommonFactor(10, 15)
    return res;
}

export function testgetCommonFactor003() {
    let res = util.RationalNumber.getCommonFactor(8, 4)
    return res;
}

export function testgetCommonFactor004() {
    let res = util.RationalNumber.getCommonFactor(8, 16)
    return res;
}

export function testgetCommonFactor005() {
    let res = util.RationalNumber.getCommonFactor(2, 16)
    return res;
}

export function testgetCommonFactorThrowError001() {
    try {
        let res = util.RationalNumber.getCommonFactor('str', 8)
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function testUtilGetHash001() {
    let person = {
        name: "Alice",
        age: 30
    };
    let result1 = util.getHash(person);
    let result2 = util.getHash(person);
    return result1 == result2;
}

export function testUtilGetHash002() {
    let numbers = [1, 2, 3, 4, 5];
    let result1 = util.getHash(numbers);
    let result2 = util.getHash(numbers);
    return result1 == result2;
}

export function testUtilGetHash003() {
    class Car {
        make;
        model;

        constructor(make, model) {
            this.make = make;
            this.model = model;
        }
    }

    let myCar = new Car("Toyota", "Corolla");
    let result1 = util.getHash(myCar);
    let result2 = util.getHash(myCar);
    return result1 == result2;
}

export function testUtilGetHash004() {
    let now = new Date();
    let result1 = util.getHash(now);
    let result2 = util.getHash(now);
    return result1 == result2;
}

export function testUtilGetHash005() {
    let regex = new RegExp("abc");
    let result1 = util.getHash(regex);
    let result2 = util.getHash(regex);
    return result1 == result2;
}

export function testUtilGetHash006() {
    let mathObject = Math;
    let result1 = util.getHash(mathObject);
    let result2 = util.getHash(mathObject);
    return result1 == result2;
}

export function test_encodeSync_base64_001() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([115, 49, 51]);
    let rarray = new Uint8Array([99, 122, 69, 122]);
    let result = that.encodeSync(array);
    for (let i = 0; i < 4; i++) {
        if (result[i] !== rarray[i]) return false;
    }
    return true;
}

export function test_encodeSync_base64_002() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
    let rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
    let result = that.encodeSync(array);
    for (let i = 0; i < 20; i++) {
        if (result[i] !== rarray[i]) return false;
    }
    return true;
}

export function test_encodeSync_base64_003() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 69, 110, 99, 111, 100, 105, 110, 103, 32, 105,
        110, 32, 78, 111, 100, 101, 46, 106, 115]);
    let rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 86, 117, 89, 50, 57, 107, 97, 87, 53, 110,
        73, 71, 108, 117, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
    let result = that.encodeSync(array);
    for (let i = 0; i < 36; i++) {
        if (result[i] !== rarray[i]) return false;
    }
    return true;
}

export function test_encodeSync_base64_004() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([168, 174, 155, 255]);
    let rarray = new Uint8Array([113, 75, 54, 98, 47, 119, 61, 61]);
    let result = that.encodeSync(array);
    for (let i = 0; i < 8; i++) {
        if (result[i] !== rarray[i]) return false;
    }
    return true;
}

export function test_encodeSync_base64_005() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([66, 97, 115, 101, 54, 52]);
    let rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
    let result = that.encodeSync(array);
    for (let i = 0; i < 8; i++) {
        if (result[i] !== rarray[i]) return false;
    }
    return true;
}

export function test_encodeSync_base64_006() {
    try {
        let that = new util.Base64Helper();
        let array = new Uint32Array([66, 97, 115, 101, 54, 52]);
        let result = that.encodeSync(array);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_encodeToStringSync_base64_001() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([115, 49, 51]);
    let result = that.encodeToStringSync(array)
    return result;
}

export function test_encodeToStringSync_base64_002() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
    let result = that.encodeToStringSync(array);
    return result;
}

export function test_encodeToStringSync_base64_003() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 69, 110, 99, 111, 100, 105, 110, 103, 32, 105, 110,
        32, 78, 111, 100, 101, 46, 106, 115]);
    let result = that.encodeToStringSync(array);
    return result;
}

export function test_encodeToStringSync_base64_004() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([168, 174, 155, 255]);
    let result = that.encodeToStringSync(array);
    return result;
}

export function test_encodeToStringSync_base64_005() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([66, 97, 115, 101, 54, 52]);
    let result = that.encodeToStringSync(array);
    return result;
}

export function test_encodeToStringSync_base64_006() {
    try {
        let that = new util.Base64Helper()
        let array = new Uint32Array([66, 97, 115, 101, 54, 52]);
        let result = that.encodeToStringSync(array);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_decodeSync_base64_001() {
    let that = new util.Base64Helper()
    let buff = 'czEz';
    let rarray = new Uint8Array([115, 49, 51]);
    let result = that.decodeSync(buff);
    for (let i = 0; i < 3; i++) {
        if (result[i] !== rarray[i]) return false;
    }
    return true;
}

export function test_decodeSync_base64_002() {
    let that = new util.Base64Helper()
    let buff = 'QmFzZTY0IE5vZGUuanM=';
    let rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
    let result = that.decodeSync(buff);
    for (let i = 0; i < 14; i++) {
        if (result[i] !== rarray[i]) return false;
    }
    return true;
}

export function test_decodeSync_base64_003() {
    let that = new util.Base64Helper()
    let buff = 'QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=';
    let rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 69, 110, 99, 111, 100, 105, 110, 103, 32,
        105, 110, 32, 78, 111, 100, 101, 46, 106, 115]);
    let result = that.decodeSync(buff);
    for (let i = 0; i < 26; i++) {
        if (result[i] !== rarray[i]) return false;
    }
    return true;
}

export function test_decodeSync_base64_004() {
    let that = new util.Base64Helper()
    let buff = 'qK6b/w==';
    let rarray = new Uint8Array([168, 174, 155, 255]);
    let result = that.decodeSync(buff);
    for (let i = 0; i < 4; i++) {
        if (result[i] !== rarray[i]) return false;
    }
    return true;
}

export function test_decodeSync_base64_005() {
    let that = new util.Base64Helper()
    let buff = 'QmFzZTY0';
    let rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
    let result = that.decodeSync(buff);
    for (let i = 0; i < 6; i++) {
        if (result[i] !== rarray[i]) return false;
    }
    return true;
}

export function test_decodeSync_base64_006() {
    try {
        let that = new util.Base64Helper()
        let array = new Uint32Array([99, 122, 69, 122]);
        let result = that.decodeSync(array);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_decodeSync_base64_007() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
    let rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
    let result = that.decodeSync(array);
    for (let i = 0; i < 14; i++) {
        if (result[i] !== rarray[i]) return false;
    }
    return true;
}

export function test_decodeSync_base64_008() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 86, 117, 89, 50, 57, 107, 97, 87,
        53, 110, 73, 71, 108, 117, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
    let rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 69, 110, 99, 111, 100, 105, 110, 103, 32, 105,
        110, 32, 78, 111, 100, 101, 46, 106, 115]);
    let result = that.decodeSync(array);
    for (let i = 0; i < 26; i++) {
        if (result[i] !== rarray[i]) return false;
    }
    return true;
}

export function test_decodeSync_base64_009() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([113, 75, 54, 98, 47, 119, 61, 61]);
    let rarray = new Uint8Array([168, 174, 155, 255]);
    let result = that.decodeSync(array);
    for (let i = 0; i < 4; i++) {
        if (result[i] !== rarray[i]) return false;
    }
    return true;
}

export function test_decodeSync_base64_010() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
    let rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
    let result = that.decodeSync(array);
    for (let i = 0; i < 6; i++) {
        if (result[i] !== rarray[i]) return false;
    }
    return true;
}

export async function test_encodeAsync_base64_001() {
    let that = new util.Base64Helper();
    let array = new Uint8Array([115, 49, 51]);
    let rarray = new Uint8Array([99, 122, 69, 122]);
    let val = await that.encode(array);
    for (let i = 0; i < rarray.length; i++) {
        if (val[i] !== rarray[i]) return false;
    }
    return true;
}

export async function test_encodeAsync_base64_002() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
    let rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
    let val = await that.encode(array);
    for (let i = 0; i < rarray.length; i++) {
        if (val[i] !== rarray[i]) return false;
    }
    return true;
}

export async function test_encodeAsync_base64_003() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 69, 110, 99, 111, 100, 105, 110, 103, 32, 105, 110, 32,
        78, 111, 100, 101, 46, 106, 115]);
    let rarray =
        new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 86, 117, 89, 50, 57, 107, 97, 87, 53, 110, 73,
            71, 108, 117, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
    let val = await that.encode(array);
    for (let i = 0; i < rarray.length; i++) {
        if (val[i] !== rarray[i]) return false;
    }
    return true;
}

export async function test_encodeAsync_base64_004() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([168, 174, 155, 255]);
    let rarray = new Uint8Array([113, 75, 54, 98, 47, 119, 61, 61]);
    let val = await that.encode(array);
    for (let i = 0; i < rarray.length; i++) {
        if (val[i] !== rarray[i]) return false;
    }
    return true;
}

export async function test_encodeAsync_base64_005() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([66, 97, 115, 101, 54, 52]);
    let rarray = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
    let val = await that.encode(array);
    for (let i = 0; i < rarray.length; i++) {
        if (val[i] !== rarray[i]) return false;
    }
    return true;
}

export function test_encodeSync_base64_throwError_001() {
    try {
        let that = new util.Base64Helper()
        let array = new Uint32Array([66, 97, 115, 101, 54, 52]);
        that.encode(array)
        return '';
    } catch (e) {
        return e.toString();
    }
}

export async function test_encodeToString_base64_001() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([115, 49, 51]);
    let val = await that.encodeToString(array);
    if (val !== 'czEz') return false;
    return true;
}

export async function test_encodeToString_base64_002() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
    let val = await that.encodeToString(array);
    if (val !== 'QmFzZTY0IE5vZGUuanM=') return false;
    return true;
}

export async function test_encodeToString_base64_003() {
    let that = new util.Base64Helper()
    let array = new Uint8Array(
        [81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 86, 117, 89, 50, 57, 107, 97, 87, 53, 110, 73, 71, 108,
            117, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
    let val = await that.encodeToString(array);
    if (val !== 'UW1GelpUWTBJRVZ1WTI5a2FXNW5JR2x1SUU1dlpHVXVhbk09') {
        return false
    }
    return true;
}

export async function test_encodeToString_base64_004() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([168, 174, 155, 255]);
    let val = await that.encodeToString(array);
    if (val !== 'qK6b/w==') return false;
    return true;
}

export async function test_encodeToString_base64_005() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([66, 97, 115, 101, 54, 52]);
    let val = await that.encodeToString(array);
    if (val !== 'QmFzZTY0') return false;
    return true;
}

export function test_encodeToString_base64_006() {
    try {
        let that = new util.Base64Helper()
        let array = new Uint32Array([66, 97, 115, 101, 54, 52]);
        that.encodeToString(array)
        return '';
    } catch (e) {
        return e.toString();
    }
}

export async function test_decode_base64_001() {
    let that = new util.Base64Helper()
    let buff = 'czEz';
    let array = new Uint8Array([115, 49, 51]);
    let val = await that.decode(buff);
    for (let i = 0; i < array.length; i++) {
        if (val[i] !== array[i]) return false;
    }
    return true;
}

export async function test_decode_base64_002() {
    let that = new util.Base64Helper()
    let buff = 'QmFzZTY0IE5vZGUuanM=';
    let array = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
    let val = await that.decode(buff);
    for (let i = 0; i < array.length; i++) {
        if (val[i] !== array[i]) return false;
    }
    return true;
}

export async function test_decode_base64_003() {
    let that = new util.Base64Helper()
    let buff = 'QmFzZTY0IEVuY29kaW5nIGluIE5vZGUuanM=';
    let array =
        new Uint8Array([66, 97, 115, 101, 54, 52, 32, 69, 110, 99, 111, 100, 105, 110, 103, 32, 105, 110, 32, 78,
            111, 100, 101, 46, 106, 115]);
    let val = await that.decode(buff);
    for (let i = 0; i < array.length; i++) {
        if (val[i] !== array[i]) return false;
    }
    return true;
}

export async function test_decode_base64_004() {
    let that = new util.Base64Helper()
    let buff = 'qK6b/w==';
    let array = new Uint8Array([168, 174, 155, 255]);
    let val = await that.decode(buff);
    for (let i = 0; i < array.length; i++) {
        if (val[i] !== array[i]) return false;
    }
    return true;
}

export async function test_decode_base64_005() {
    let that = new util.Base64Helper()
    let buff = 'QmFzZTY0';
    let rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
    let val = await that.decode(buff);
    for (let i = 0; i < rarray.length; i++) {
        if (val[i] !== rarray[i]) return false;
    }
    return true;
}

export async function test_decode_base64_006() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([99, 122, 69, 122]);
    let rarray = new Uint8Array([115, 49, 51]);
    let val = await that.decode(array);
    for (let i = 0; i < rarray.length; i++) {
        if (val[i] !== rarray[i]) return false;
    }
    return true;
}

export async function test_decode_base64_007() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
    let rarray = new Uint8Array([66, 97, 115, 101, 54, 52, 32, 78, 111, 100, 101, 46, 106, 115]);
    let val = await that.decode(array);
    for (let i = 0; i < rarray.length; i++) {
        if (val[i] !== rarray[i]) return false;
    }
    return true;
}

export async function test_decode_base64_008() {
    let that = new util.Base64Helper()
    let array = new Uint8Array(
        [81, 109, 70, 122, 90, 84, 89, 48, 73, 69, 86, 117, 89, 50, 57, 107, 97, 87, 53, 110, 73, 71, 108,
            117, 73, 69, 53, 118, 90, 71, 85, 117, 97, 110, 77, 61]);
    let rarray =
        new Uint8Array([66, 97, 115, 101, 54, 52, 32, 69, 110, 99, 111, 100, 105, 110, 103, 32, 105, 110, 32, 78, 111,
            100, 101, 46, 106, 115]);
    let val = await that.decode(array);
    for (let i = 0; i < rarray.length; i++) {
        if (val[i] !== rarray[i]) return false;
    }
    return true;
}

export async function test_decode_base64_009() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([113, 75, 54, 98, 47, 119, 61, 61]);
    let rarray = new Uint8Array([168, 174, 155, 255]);
    let val = await that.decode(array);
    for (let i = 0; i < rarray.length; i++) {
        if (val[i] !== rarray[i]) return false;
    }
    return true;
}

export async function test_decode_base64_010() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([81, 109, 70, 122, 90, 84, 89, 48]);
    let rarray = new Uint8Array([66, 97, 115, 101, 54, 52]);
    let val = await that.decode(array);
    for (let i = 0; i < rarray.length; i++) {
        if (val[i] !== rarray[i]) return false;
    }
    return true;
}

export function test_decode_base64_throwError_001() {
    try {
        let that = new util.Base64Helper()
        let array = new Uint16Array([99, 122, 69, 122]);
        that.decode(array)
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_encodeToStringSync_mime_base64_001() {
    let that = new util.Base64Helper()
    let array = new Uint8Array(
        [77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110, 111, 116, 111,
            110, 108, 121, 98, 121, 104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116, 104, 105,
            115, 115, 105, 110, 103, 117, 108, 97, 114, 112, 97, 115, 115, 105, 111, 110, 102, 114, 111, 109, 111, 116,
            104, 101, 114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104, 105, 115, 97, 108, 117, 115, 116,
            111, 102, 116, 104, 101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115, 104, 111,
            114, 116, 118, 101, 104, 101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108,
            112, 108, 101, 97, 115, 117, 114, 101]);
    let result = that.encodeToStringSync(array, util.Type.MIME);
    return result;
}

export function test_decodeSync_mime_base64_002() {
    let that = new util.Base64Helper()
    let buff =
        'TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz\r\naW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\r\naGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=\r\n';
    let rarray = new Uint8Array(
        [77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110, 111, 116, 111,
            110, 108, 121, 98, 121, 104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116, 104, 105,
            115, 115, 105, 110, 103, 117, 108, 97, 114, 112, 97, 115, 115, 105, 111, 110, 102, 114, 111, 109, 111, 116,
            104, 101, 114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104, 105, 115, 97, 108, 117, 115, 116,
            111, 102, 116, 104, 101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115, 104, 111,
            114, 116, 118, 101, 104, 101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108,
            112, 108, 101, 97, 115, 117, 114, 101]);
    let result = that.decodeSync(buff, util.Type.MIME);
    for (let i = 0; i < rarray.length; i++) {
        if (result[i] !== rarray[i]) return false;
    }
    return true;
}

export async function test_encodeToString_mime_base64_003() {
    let that = new util.Base64Helper()
    let array = new Uint8Array(
        [77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110, 111, 116, 111,
            110, 108, 121, 98, 121, 104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116, 104, 105,
            115, 115, 105, 110, 103, 117, 108, 97, 114, 112, 97, 115, 115, 105, 111, 110, 102, 114, 111, 109, 111, 116,
            104, 101, 114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104, 105, 115, 97, 108, 117, 115, 116,
            111, 102, 116, 104, 101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115, 104, 111,
            114, 116, 118, 101, 104, 101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108,
            112, 108, 101, 97, 115, 117, 114, 101]);
    let val = await that.encodeToString(array, util.Type.MIME);
    if (val !==
        'TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz\r\naW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\r\naGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=\r\n') return false;
    return true;
}

export async function test_encodeToString_mime_base64_004() {
    let that = new util.Base64Helper()
    let buff =
        'TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz\r\naW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\r\naGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=\r\n';
    let array = new Uint8Array(
        [77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110, 111, 116, 111,
            110, 108, 121, 98, 121, 104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116, 104, 105,
            115, 115, 105, 110, 103, 117, 108, 97, 114, 112, 97, 115, 115, 105, 111, 110, 102, 114, 111, 109, 111, 116,
            104, 101, 114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104, 105, 115, 97, 108, 117, 115, 116,
            111, 102, 116, 104, 101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115, 104, 111,
            114, 116, 118, 101, 104, 101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108,
            112, 108, 101, 97, 115, 117, 114, 101]);
    let val = await that.decode(buff, util.Type.MIME);
    for (let i = 0; i < array.length; i++) {
        if (val[i] !== array[i]) return false;
    }
    return true;
}

export function test_encodeToStringSync_basic_base64_001() {
    let that = new util.Base64Helper()
    let array = new Uint8Array(
        [77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110, 111, 116, 111,
            110, 108, 121, 98, 121, 104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116, 104, 105,
            115, 115, 105, 110, 103, 117, 108, 97, 114, 112, 97, 115, 115, 105, 111, 110, 102, 114, 111, 109, 111, 116,
            104, 101, 114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104, 105, 115, 97, 108, 117, 115, 116,
            111, 102, 116, 104, 101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115, 104, 111,
            114, 116, 118, 101, 104, 101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108,
            112, 108, 101, 97, 115, 117, 114, 101]);
    let result = that.encodeToStringSync(array, util.Type.BASIC);
    return result;
}

export function test_decodeSync_basic_base64_002() {
    let that = new util.Base64Helper()
    let buff =
        'TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNzaW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZlaGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=';
    let rarray = new Uint8Array(
        [77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110, 111, 116, 111,
            110, 108, 121, 98, 121, 104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116, 104, 105,
            115, 115, 105, 110, 103, 117, 108, 97, 114, 112, 97, 115, 115, 105, 111, 110, 102, 114, 111, 109, 111, 116,
            104, 101, 114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104, 105, 115, 97, 108, 117, 115, 116,
            111, 102, 116, 104, 101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115, 104, 111,
            114, 116, 118, 101, 104, 101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108,
            112, 108, 101, 97, 115, 117, 114, 101]);
    let result = that.decodeSync(buff, util.Type.BASIC);
    for (let i = 0; i < rarray.length; i++) {
        if (result[i] !== rarray[i]) return false;
    }
    return true;
}

export async function test_encodeToString_basic_base64_003() {
    let that = new util.Base64Helper()
    let array = new Uint8Array(
        [77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110, 111, 116, 111,
            110, 108, 121, 98, 121, 104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116, 104, 105,
            115, 115, 105, 110, 103, 117, 108, 97, 114, 112, 97, 115, 115, 105, 111, 110, 102, 114, 111, 109, 111, 116,
            104, 101, 114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104, 105, 115, 97, 108, 117, 115, 116,
            111, 102, 116, 104, 101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115, 104, 111,
            114, 116, 118, 101, 104, 101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108,
            112, 108, 101, 97, 115, 117, 114, 101]);
    let val = await that.encodeToString(array, util.Type.BASIC);
    if (val !==
        'TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNzaW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZlaGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=') return false;
    return true;
}

export async function test_encodeToString_basic_base64_004() {
    let that = new util.Base64Helper()
    let buff =
        'TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNzaW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZlaGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=';
    let array = new Uint8Array(
        [77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110, 111, 116, 111,
            110, 108, 121, 98, 121, 104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116, 104, 105,
            115, 115, 105, 110, 103, 117, 108, 97, 114, 112, 97, 115, 115, 105, 111, 110, 102, 114, 111, 109, 111, 116,
            104, 101, 114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104, 105, 115, 97, 108, 117, 115, 116,
            111, 102, 116, 104, 101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115, 104, 111,
            114, 116, 118, 101, 104, 101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108,
            112, 108, 101, 97, 115, 117, 114, 101]);
    let val = await that.decode(buff, util.Type.BASIC);
    for (let i = 0; i < array.length; i++) {
        if (val[i] !== array[i]) return false;
    }
    return true;
}

export function test_decodeSync_base64_throwError_001() {
    try {
        let that = new util.Base64Helper()
        let array = new Uint8Array([99, 122, 69, 122, 115, 119, 58]);
        that.decodeSync(array)
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_decodeSync_base64_throwError_002() {
    try {
        let that = new util.Base64Helper()
        let array = new Uint8Array([99, 42, 69, 122, 115, 119, 36, 110]);
        that.decodeSync(array)
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_decodeSync_base64_throwError_003() {
    try {
        let that = new util.Base64Helper()
        let str = "QmFzZTY0IE5vZGU@@";
        that.decodeSync(str)
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_decodeSync_base64_throwError_004() {
    try {
        let that = new util.Base64Helper()
        let str = "QmFzZTY0IEVuY29k&&&aW5nIGluIE5vZGUua$$$%%%";
        that.decodeSync(str)
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_decodeSync_base64_throwError_005() {
    try {
        let that = new util.Base64Helper()
        let str = "";
        that.decodeSync(str)
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_decodeSync_base64_throwError_006() {
    try {
        let that = new util.Base64Helper()
        let str = " ";
        that.decodeSync(str)
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_encodeToStringSync_mime_base64_throwError_007() {
    try {
        let that = new util.Base64Helper()
        let array = new Uint8Array([2, 192, 254, 253, 5, 132, 69]);
        let result = that.encodeToStringSync(array, util.Type.MIME);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_encodeToStringSync_base64url_001() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([2, 192, 254, 253, 5, 132, 69]);
    let result = that.encodeToStringSync(array);
    let resBas = that.encodeToStringSync(array, util.Type.BASIC);
    let resUrl = that.encodeToStringSync(array, util.Type.BASIC_URL_SAFE);
    return [result, resBas, resUrl];
}

export function test_encodeToStringSync_base64url_002() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([2, 192, 254, 65, 97, 17, 67, 223, 178]);
    let result = that.encodeToStringSync(array);
    let resBas = that.encodeToStringSync(array, util.Type.BASIC);
    let resUrl = that.encodeToStringSync(array, util.Type.BASIC_URL_SAFE);
    return [result, resBas, resUrl];
}

export function test_encodeToStringSync_base64url_003() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([2, 192, 255, 65, 97, 17, 67, 223, 242]);
    let result = that.encodeToStringSync(array);
    let resBas = that.encodeToStringSync(array, util.Type.BASIC);
    let resUrl = that.encodeToStringSync(array, util.Type.BASIC_URL_SAFE);
    return [result, resBas, resUrl];
}

export function test_encodeSync_base64url_001() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([2, 192, 254, 253, 5, 132, 69]);
    let result = that.encodeSync(array);
    let resBas = that.encodeSync(array, util.Type.BASIC);
    let resUrl = that.encodeSync(array, util.Type.BASIC_URL_SAFE);
    let arrBas = new Uint8Array([65, 115, 68, 43, 47, 81, 87, 69, 82, 81, 61, 61]);
    let arrUrl = new Uint8Array([65, 115, 68, 45, 95, 81, 87, 69, 82, 81]);
    return [result.every((value, index) => value === arrBas[index]),
        resBas.every((value, index) => value === arrBas[index]),
        resUrl.every((value, index) => value === arrUrl[index])];
}

export function test_encodeSync_base64url_002() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([2, 192, 254, 65, 97, 17, 67, 223, 178]);
    let result = that.encodeSync(array);
    let resBas = that.encodeSync(array, util.Type.BASIC);
    let resUrl = that.encodeSync(array, util.Type.BASIC_URL_SAFE);
    let arrBas = new Uint8Array([65, 115, 68, 43, 81, 87, 69, 82, 81, 57, 43, 121]);
    let arrUrl = new Uint8Array([65, 115, 68, 45, 81, 87, 69, 82, 81, 57, 45, 121]);
    return [result.every((value, index) => value === arrBas[index]),
        resBas.every((value, index) => value === arrBas[index]),
        resUrl.every((value, index) => value === arrUrl[index])];
}

export function test_encodeSync_base64url_003() {
    let that = new util.Base64Helper()
    let array = new Uint8Array([2, 192, 255, 65, 97, 17, 67, 223, 242]);
    let result = that.encodeSync(array);
    let resBas = that.encodeSync(array, util.Type.BASIC);
    let resUrl = that.encodeSync(array, util.Type.BASIC_URL_SAFE);
    let arrBas = new Uint8Array([65, 115, 68, 47, 81, 87, 69, 82, 81, 57, 47, 121]);
    let arrUrl = new Uint8Array([65, 115, 68, 95, 81, 87, 69, 82, 81, 57, 95, 121]);
    return [result.every((value, index) => value === arrBas[index]),
        resBas.every((value, index) => value === arrBas[index]),
        resUrl.every((value, index) => value === arrUrl[index])];
}

export async function test_encodeToString_base64url_001() {
    let that = new util.Base64Helper();
    let array = new Uint8Array([2, 192, 254, 253, 5, 132, 69]);
    let result = await that.encodeToString(array);
    if (result !== 'AsD+/QWERQ==') return false;
    let resBas = await that.encodeToString(array, util.Type.BASIC);
    if (resBas !== 'AsD+/QWERQ==') return false;
    let resUrl = await that.encodeToString(array, util.Type.BASIC_URL_SAFE);
    if (resUrl !== 'AsD-_QWERQ') return false;
    return true;
}

export async function test_encodeToString_base64url_002() {
    let that = new util.Base64Helper();
    let array = new Uint8Array([2, 192, 254, 65, 97, 17, 67, 223, 178]);
    let result = await that.encodeToString(array);
    if (result !== 'AsD+QWERQ9+y') return false;
    let resBas = await that.encodeToString(array, util.Type.BASIC);
    if (resBas !== 'AsD+QWERQ9+y') return false;
    let resUrl = await that.encodeToString(array, util.Type.BASIC_URL_SAFE);
    if (resUrl !== 'AsD-QWERQ9-y') return false;
    return true;
}

export async function test_encodeToString_base64url_003() {
    let that = new util.Base64Helper();
    let array = new Uint8Array([2, 192, 255, 65, 97, 17, 67, 223, 242]);
    let result = await that.encodeToString(array);
    if (result !== 'AsD/QWERQ9/y') return false;
    let resBas = await that.encodeToString(array, util.Type.BASIC);
    if (resBas !== 'AsD/QWERQ9/y') return false;
    let resUrl = await that.encodeToString(array, util.Type.BASIC_URL_SAFE);
    if (resUrl !== 'AsD_QWERQ9_y') return false;
    return true;
}

export async function test_encode_base64url_001() {
    let that = new util.Base64Helper();
    let array = new Uint8Array([2, 192, 254, 253, 5, 132, 69]);
    let arrBas = new Uint8Array([65, 115, 68, 43, 47, 81, 87, 69, 82, 81, 61, 61]);
    let arrUrl = new Uint8Array([65, 115, 68, 45, 95, 81, 87, 69, 82, 81]);
    let result = await that.encode(array);
    if (result.every((value, index) => value === arrBas[index]) !== true) return false;
    let resBas = await that.encode(array, util.Type.BASIC);
    if (resBas.every((value, index) => value === arrBas[index]) !== true) return false;
    let resUrl = await that.encode(array, util.Type.BASIC_URL_SAFE);
    if (resUrl.every((value, index) => value === arrUrl[index]) !== true) return false;
    return true;
}

export async function test_encode_base64url_002() {
    let that = new util.Base64Helper();
    let array = new Uint8Array([2, 192, 254, 65, 97, 17, 67, 223, 178]);
    let arrBas = new Uint8Array([65, 115, 68, 43, 81, 87, 69, 82, 81, 57, 43, 121]);
    let arrUrl = new Uint8Array([65, 115, 68, 45, 81, 87, 69, 82, 81, 57, 45, 121]);
    let result = await that.encode(array);
    if (result.every((value, index) => value === arrBas[index]) !== true) return false;
    let resBas = await that.encode(array, util.Type.BASIC);
    if (resBas.every((value, index) => value === arrBas[index]) !== true) return false;
    let resUrl = await that.encode(array, util.Type.BASIC_URL_SAFE);
    if (resUrl.every((value, index) => value === arrUrl[index]) !== true) return false;
    return true;
}

export async function test_encode_base64url_003() {
    let that = new util.Base64Helper();
    let array = new Uint8Array([2, 192, 255, 65, 97, 17, 67, 223, 242]);
    let arrBas = new Uint8Array([65, 115, 68, 47, 81, 87, 69, 82, 81, 57, 47, 121]);
    let arrUrl = new Uint8Array([65, 115, 68, 95, 81, 87, 69, 82, 81, 57, 95, 121]);
    let result = await that.encode(array);
    if (result.every((value, index) => value === arrBas[index]) !== true) return false;
    let resBas = await that.encode(array, util.Type.BASIC);
    if (resBas.every((value, index) => value === arrBas[index]) !== true) return false;
    let resUrl = await that.encode(array, util.Type.BASIC_URL_SAFE);
    if (resUrl.every((value, index) => value === arrUrl[index]) !== true) return false;
    return true;
}

export function test_decodeSync_base64url_001() {
    let that = new util.Base64Helper();
    let str = "AsD+/QWERQ==";
    let strUrl = "AsD-_QWERQ";
    let array = new Uint8Array([2, 192, 254, 253, 5, 132, 69]);
    let result = that.decodeSync(str);
    let resBas = that.decodeSync(str, util.Type.BASIC);
    let resUrl = that.decodeSync(strUrl, util.Type.BASIC_URL_SAFE);
    return [result.every((value, index) => value === array[index]),
        resBas.every((value, index) => value === array[index]), resUrl.every((value, index) => value === array[index])];
}

export function test_decodeSync_base64url_002() {
    let that = new util.Base64Helper();
    let str = "AsD+QWERQ9+y";
    let strUrl = "AsD-QWERQ9-y";
    let array = new Uint8Array([2, 192, 254, 65, 97, 17, 67, 223, 178]);
    let result = that.decodeSync(str);
    let resBas = that.decodeSync(str, util.Type.BASIC);
    let resUrl = that.decodeSync(strUrl, util.Type.BASIC_URL_SAFE);
    return [result.every((value, index) => value === array[index]),
        resBas.every((value, index) => value === array[index]), resUrl.every((value, index) => value === array[index])];
}

export function test_decodeSync_base64url_003() {
    let that = new util.Base64Helper();
    let str = "AsD/QWERQ9/y";
    let strUrl = "AsD_QWERQ9_y";
    let array = new Uint8Array([2, 192, 255, 65, 97, 17, 67, 223, 242]);
    let result = that.decodeSync(str);
    let resBas = that.decodeSync(str, util.Type.BASIC);
    let resUrl = that.decodeSync(strUrl, util.Type.BASIC_URL_SAFE);
    return [result.every((value, index) => value === array[index]),
        resBas.every((value, index) => value === array[index]), resUrl.every((value, index) => value === array[index])];
}

export function test_decodeSync_base64url_004() {
    let that = new util.Base64Helper();
    let arrBas = new Uint8Array([65, 115, 68, 43, 47, 81, 87, 69, 82, 81, 61, 61]);
    let arrURL = new Uint8Array([65, 115, 68, 45, 95, 81, 87, 69, 82, 81]);
    let array = new Uint8Array([2, 192, 254, 253, 5, 132, 69]);
    let result = that.decodeSync(arrBas);
    let resBas = that.decodeSync(arrBas, util.Type.BASIC);
    let resUrl = that.decodeSync(arrURL, util.Type.BASIC_URL_SAFE);
    return [result.every((value, index) => value === array[index]),
        resBas.every((value, index) => value === array[index]), resUrl.every((value, index) => value === array[index])];
}

export function test_decodeSync_base64url_005() {
    let that = new util.Base64Helper();
    let arrBas = new Uint8Array([65, 115, 68, 43, 81, 87, 69, 82, 81, 57, 43, 121]);
    let arrURL = new Uint8Array([65, 115, 68, 45, 81, 87, 69, 82, 81, 57, 45, 121]);
    let array = new Uint8Array([2, 192, 254, 65, 97, 17, 67, 223, 178]);
    let result = that.decodeSync(arrBas);
    let resBas = that.decodeSync(arrBas, util.Type.BASIC);
    let resUrl = that.decodeSync(arrURL, util.Type.BASIC_URL_SAFE);
    return [result.every((value, index) => value === array[index]),
        resBas.every((value, index) => value === array[index]), resUrl.every((value, index) => value === array[index])];
}

export function test_decodeSync_base64url_006() {
    let that = new util.Base64Helper();
    let arrBas = new Uint8Array([65, 115, 68, 47, 81, 87, 69, 82, 81, 57, 47, 121]);
    let arrURL = new Uint8Array([65, 115, 68, 95, 81, 87, 69, 82, 81, 57, 95, 121]);
    let array = new Uint8Array([2, 192, 255, 65, 97, 17, 67, 223, 242]);
    let result = that.decodeSync(arrBas);
    let resBas = that.decodeSync(arrBas, util.Type.BASIC);
    let resUrl = that.decodeSync(arrURL, util.Type.BASIC_URL_SAFE);
    return [result.every((value, index) => value === array[index]),
        resBas.every((value, index) => value === array[index]), resUrl.every((value, index) => value === array[index])];
}

export async function test_decode_base64url_001() {
    let that = new util.Base64Helper();
    let str = "AsD+/QWERQ==";
    let strUrl = "AsD-_QWERQ";
    let array = new Uint8Array([2, 192, 254, 253, 5, 132, 69]);
    let result = await that.decode(str);
    if (result.every((value, index) => value === array[index]) !== true) return false;
    let resBas = await that.decode(str, util.Type.BASIC);
    if (resBas.every((value, index) => value === array[index]) !== true) return false;
    let resUrl = await that.decode(strUrl, util.Type.BASIC_URL_SAFE);
    if (resUrl.every((value, index) => value === array[index]) !== true) return false;
    return true;
}

export async function test_decode_base64url_002() {
    let that = new util.Base64Helper();
    let str = "AsD+QWERQ9+y";
    let strUrl = "AsD-QWERQ9-y";
    let array = new Uint8Array([2, 192, 254, 65, 97, 17, 67, 223, 178]);
    let result = await that.decode(str);
    if (result.every((value, index) => value === array[index]) !== true) return false;
    let resBas = await that.decode(str, util.Type.BASIC);
    if (resBas.every((value, index) => value === array[index]) !== true) return false;
    let resUrl = await that.decode(strUrl, util.Type.BASIC_URL_SAFE);
    if (resUrl.every((value, index) => value === array[index]) !== true) return false;
    return true;
}

export async function test_decode_base64url_003() {
    let that = new util.Base64Helper();
    let str = "AsD/QWERQ9/y";
    let strUrl = "AsD_QWERQ9_y";
    let array = new Uint8Array([2, 192, 255, 65, 97, 17, 67, 223, 242]);
    let result = await that.decode(str);
    if (result.every((value, index) => value === array[index]) !== true) return false;
    let resBas = await that.decode(str, util.Type.BASIC);
    if (resBas.every((value, index) => value === array[index]) !== true) return false;
    let resUrl = await that.decode(strUrl, util.Type.BASIC_URL_SAFE);
    if (resUrl.every((value, index) => value === array[index]) !== true) return false;
    return true;
}

export function test_encodesync_throwError_001() {
    try {
        let that = new util.Base64Helper();
        let array = new Uint8Array([115, 49, 51]);
        that.encodeSync(array, 5);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_encodesync_throwError_002() {
    try {
        let that = new util.Base64Helper();
        let array = new Uint8Array([115, 49, 51]);
        that.encodeSync(array, util.Type.MIME);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_encodesync_throwError_003() {
    try {
        let that = new util.Base64Helper();
        let array = new Uint8Array([115, 49, 51]);
        that.encodeSync(array, util.Type.MIME_URL_SAFE);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_encodeToStringSync_throwError_001() {
    try {
        let that = new util.Base64Helper();
        let array = new Uint8Array([115, 49, 51]);
        that.encodeToStringSync(array, 4);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_encode_throwError_001() {
    try {
        let that = new util.Base64Helper();
        let array = new Uint8Array([115, 49, 51]);
        that.encode(array, 6);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_encode_throwError_002() {
    try {
        let that = new util.Base64Helper();
        let array = new Uint8Array([115, 49, 51]);
        that.encode(array, util.Type.MIME);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_encode_throwError_003() {
    try {
        let that = new util.Base64Helper();
        let array = new Uint8Array([115, 49, 51]);
        that.encode(array, util.Type.MIME_URL_SAFE);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_encodeToString_throwError_001() {
    try {
        let that = new util.Base64Helper();
        let array = new Uint8Array([115, 49, 51]);
        that.encodeToString(array, 5);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_encodeSync_base64_throw_error_001() {
    try {
        let that = new util.Base64Helper();
        let array = new Uint8Array([]);
        let result = that.encodeSync(array);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_encodeToStringSync_base64_throw_error_002() {
    try {
        let that = new util.Base64Helper()
        let array = new Uint8Array([]);
        let result = that.encodeToStringSync(array);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_decodeSync_base64_throw_error_003() {
    try {
        let that = new util.Base64Helper()
        let array = new Uint8Array([]);
        let result = that.decodeSync(array);
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_encodeAsync_base64_throwError_004() {
    try {
        let that = new util.Base64Helper()
        let array = new Uint8Array([]);
        that.encode(array)
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_encodeToString_base64_throwError_005() {
    try {
        let that = new util.Base64Helper()
        let array = new Uint8Array([]);
        that.encodeToString(array)
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_decode_base64_throwError_006() {
    try {
        let that = new util.Base64Helper()
        let array = new Uint8Array([]);
        that.decode(array)
        return '';
    } catch (e) {
        return e.toString();
    }
}

export function test_decode_base64_throwError_007() {
    try {
        let base64Helper = new util.Base64Helper();
        base64Helper.decode('1')
        return '';
    } catch (e) {
        return e.code;
    }
}

export function test_decode_base64_throwError_008() {
    try {
        let base64Helper = new util.Base64Helper();
        base64Helper.decode('12')
        return '';
    } catch (e) {
        return e.code
    }
}

export function test_decode_base64_throwError_009() {
    try {
        let base64Helper = new util.Base64Helper();
        base64Helper.decode('150')
        return '';
    } catch (e) {
        return e.code
    }
}
