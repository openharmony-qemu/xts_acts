/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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


export function getOwnPropertySymbolsSingle001() {
    const obj = {};
    const sym = Symbol('test');
    obj[sym] = 'value';
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, firstIsSame: result[0] === sym };
}

export function getOwnPropertySymbolsSymbolFor002() {
    const obj = {};
    const sym = Symbol.for('globalKey');
    obj[sym] = 'globalValue';
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, firstIsSame: result[0] === sym };
}

export function getOwnPropertySymbolsMultiple003() {
    const obj = {};
    const sym1 = Symbol('first');
    const sym2 = Symbol('second');
    obj[sym1] = 'value1';
    obj[sym2] = 'value2';
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, hasSym1: result.includes(sym1), hasSym2: result.includes(sym2) };
}

export function getOwnPropertySymbolsMany004() {
    const obj = {};
    const symbols = [];
    for (let i = 0; i < 100; i++) {
        const sym = Symbol(`symbol_${i}`);
        obj[sym] = i;
        symbols.push(sym);
    }
    const result = Object.getOwnPropertySymbols(obj);
    const allFound = symbols.every(sym => result.includes(sym));
    return { length: result.length, allFound: allFound };
}

export function getOwnPropertySymbolsMixedStrings005() {
    const obj = {};
    const sym = Symbol('onlySymbol');
    obj[sym] = 'symbolValue';
    obj.stringKey = 'stringValue';
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, hasSym: result.includes(sym), hasString: result.includes('stringKey') };
}

export function getOwnPropertySymbolsMixedNumbers006() {
    const obj = {};
    const sym = Symbol('num');
    obj[sym] = 'symbolValue';
    obj[0] = 'zero';
    obj[1] = 'one';
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, firstIsSame: result[0] === sym };
}

export function getOwnPropertySymbolsPlainObject007() {
    const obj = { a: 1, b: 2 };
    const sym = Symbol('test');
    obj[sym] = 'symbolValue';
    const result = Object.getOwnPropertySymbols(obj);
    return result.length;
}


export function getOwnPropertySymbolsNull008() {
    try {
        Object.getOwnPropertySymbols(null);
        return false;
    } catch (e) {
        return e.name;
    }
}

export function getOwnPropertySymbolsUndefined009() {
    try {
        Object.getOwnPropertySymbols(undefined);
        return false;
    } catch (e) {
        return e.name;
    }
}


export function getOwnPropertySymbolsNumber010() {
    const result = Object.getOwnPropertySymbols(42);
    return { isArray: Array.isArray(result), length: result.length };
}

export function getOwnPropertySymbolsNaN011() {
    const result = Object.getOwnPropertySymbols(NaN);
    return { isArray: Array.isArray(result), length: result.length };
}

export function getOwnPropertySymbolsInfinity012() {
    const result1 = Object.getOwnPropertySymbols(Infinity);
    const result2 = Object.getOwnPropertySymbols(-Infinity);
    return { posLength: result1.length, negLength: result2.length };
}


export function getOwnPropertySymbolsString013() {
    const result = Object.getOwnPropertySymbols('hello');
    return { isArray: Array.isArray(result), length: result.length };
}

export function getOwnPropertySymbolsEmptyString014() {
    const result = Object.getOwnPropertySymbols('');
    return result.length;
}


export function getOwnPropertySymbolsTrue015() {
    const result = Object.getOwnPropertySymbols(true);
    return { isArray: Array.isArray(result), length: result.length };
}

export function getOwnPropertySymbolsFalse016() {
    const result = Object.getOwnPropertySymbols(false);
    return result.length;
}


export function getOwnPropertySymbolsArray017() {
    const arr = [1, 2, 3];
    const sym = Symbol('arraySymbol');
    arr[sym] = 'arrayValue';
    const result = Object.getOwnPropertySymbols(arr);
    return { length: result.length, hasSym: result.includes(sym) };
}

export function getOwnPropertySymbolsFunction018() {
    function func() {}
    const sym = Symbol('funcSymbol');
    func[sym] = 'funcValue';
    const result = Object.getOwnPropertySymbols(func);
    return { length: result.length, hasSym: result.includes(sym) };
}

export function getOwnPropertySymbolsDate019() {
    const date = new Date();
    const sym = Symbol('dateSymbol');
    date[sym] = 'dateValue';
    const result = Object.getOwnPropertySymbols(date);
    return result.length;
}

export function getOwnPropertySymbolsRegExp020() {
    const regex = /test/gi;
    const sym = Symbol('regexSymbol');
    regex[sym] = 'regexValue';
    const result = Object.getOwnPropertySymbols(regex);
    return result.length;
}


export function getOwnPropertySymbolsInt8Array021() {
    const int8 = new Int8Array([1, 2, 3]);
    const sym = Symbol('int8Symbol');
    int8[sym] = 'int8Value';
    const result = Object.getOwnPropertySymbols(int8);
    return result.length;
}

export function getOwnPropertySymbolsFloat32Array022() {
    const float32 = new Float32Array([1.1, 2.2, 3.3]);
    const sym = Symbol('float32Symbol');
    float32[sym] = 'float32Value';
    const result = Object.getOwnPropertySymbols(float32);
    return result.length;
}


export function getOwnPropertySymbolsNoDesc023() {
    const obj = {};
    const sym = Symbol();
    obj[sym] = 'value';
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, firstIsSame: result[0] === sym };
}

export function getOwnPropertySymbolsWithDesc024() {
    const obj = {};
    const sym = Symbol('description');
    obj[sym] = 'value';
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, desc: result[0].description };
}

export function getOwnPropertySymbolsSameDesc025() {
    const obj = {};
    const sym1 = Symbol('test');
    const sym2 = Symbol('test');
    obj[sym1] = 'value1';
    obj[sym2] = 'value2';
    const result = Object.getOwnPropertySymbols(obj);
    return {
        length: result.length,
        sym1AndSym2NotEqual: sym1 !== sym2,
        hasSym1: result.includes(sym1),
        hasSym2: result.includes(sym2)
    };
}


export function getOwnPropertySymbolsGlobal026() {
    const obj = {};
    const sym = Symbol.for('globalKey');
    obj[sym] = 'globalValue';
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, firstIsSame: result[0] === sym, keyFor: Symbol.keyFor(result[0]) };
}

export function getOwnPropertySymbolsGlobalSame027() {
    const obj = {};
    const sym1 = Symbol.for('sameKey');
    const sym2 = Symbol.for('sameKey');
    obj[sym1] = 'value1';
    obj[sym2] = 'value2';
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, sameSymbol: sym1 === sym2 };
}

export function getOwnPropertySymbolsGlobalAndNormal028() {
    const obj = {};
    const sym1 = Symbol('normal');
    const sym2 = Symbol.for('global');
    obj[sym1] = 'normalValue';
    obj[sym2] = 'globalValue';
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, hasSym1: result.includes(sym1), hasSym2: result.includes(sym2) };
}


function createStepIterator() {
    let step = 0;
    function next() {
        if (step < 3) {
            return { value: step++, done: false };
        }
        return { done: true };
    }
    return { next };
}

export function getOwnPropertySymbolsIterator029() {
    const obj = {
        [Symbol.iterator]() {
            return createStepIterator();
        }
    };
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, isIterator: result[0] === Symbol.iterator };
}

export function getOwnPropertySymbolsToStringTag030() {
    const obj = {
        [Symbol.toStringTag]: 'MyObject'
    };
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, isToStringTag: result[0] === Symbol.toStringTag };
}

export function getOwnPropertySymbolsToPrimitive031() {
    const obj = {
        [Symbol.toPrimitive](hint) {
            if (hint === 'number') return 42;
            if (hint === 'string') return 'forty-two';
            return true;
        }
    };
    const result = Object.getOwnPropertySymbols(obj);
    return result.length;
}

export function getOwnPropertySymbolsMultiWellKnown032() {
    const obj = {
        [Symbol.iterator]: function* () { yield 1; yield 2; },
        [Symbol.toStringTag]: 'MyObj',
        [Symbol.toPrimitive]: () => 'primitive'
    };
    const result = Object.getOwnPropertySymbols(obj);
    return {
        length: result.length,
        hasIterator: result.includes(Symbol.iterator),
        hasToStringTag: result.includes(Symbol.toStringTag),
        hasToPrimitive: result.includes(Symbol.toPrimitive)
    };
}


export function getOwnPropertySymbolsEnumerable033() {
    const obj = {};
    const sym = Symbol('enumerable');
    Object.defineProperty(obj, sym, {
        value: 'enumValue',
        enumerable: true,
        configurable: true,
        writable: true
    });
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, firstIsSame: result[0] === sym };
}

export function getOwnPropertySymbolsNonEnumerable034() {
    const obj = {};
    const sym = Symbol('nonEnumerable');
    Object.defineProperty(obj, sym, {
        value: 'nonEnumValue',
        enumerable: false,
        configurable: true,
        writable: true
    });
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, firstIsSame: result[0] === sym };
}

export function getOwnPropertySymbolsMixedEnum035() {
    const obj = {};
    const sym1 = Symbol('enum');
    const sym2 = Symbol('nonEnum');
    Object.defineProperty(obj, sym1, { value: 1, enumerable: true });
    Object.defineProperty(obj, sym2, { value: 2, enumerable: false });
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, hasSym1: result.includes(sym1), hasSym2: result.includes(sym2) };
}


export function getOwnPropertySymbolsConfigurable036() {
    const obj = {};
    const sym = Symbol('configurable');
    Object.defineProperty(obj, sym, {
        value: 'configurableValue',
        configurable: true,
        enumerable: true
    });
    const result = Object.getOwnPropertySymbols(obj);
    return result.length;
}

export function getOwnPropertySymbolsNonConfigurable037() {
    const obj = {};
    const sym = Symbol('nonConfigurable');
    Object.defineProperty(obj, sym, {
        value: 'nonConfigValue',
        configurable: false,
        enumerable: true
    });
    const result = Object.getOwnPropertySymbols(obj);
    return result.length;
}

export function getOwnPropertySymbolsDeleteNonConfig038() {
    const obj = {};
    const sym = Symbol('test');
    Object.defineProperty(obj, sym, {
        value: 'value',
        configurable: false
    });
    const before = Object.getOwnPropertySymbols(obj);
    let deleteResult;
    try {
        deleteResult = delete obj[sym];
    } catch (e) {
        deleteResult = false;
    }
    const after = Object.getOwnPropertySymbols(obj);
    return { beforeLength: before.length, deleteResult: deleteResult, afterLength: after.length };
}


export function getOwnPropertySymbolsWritable039() {
    const obj = {};
    const sym = Symbol('writable');
    Object.defineProperty(obj, sym, {
        value: 'initialValue',
        writable: true,
        enumerable: true,
        configurable: true
    });
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length };
}

export function getOwnPropertySymbolsNonWritable040() {
    const obj = {};
    const sym = Symbol('nonWritable');
    Object.defineProperty(obj, sym, {
        value: 'fixedValue',
        writable: false,
        enumerable: true,
        configurable: true
    });
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length };
}


export function getOwnPropertySymbolsGetter041() {
    const obj = {};
    const sym = Symbol('getter');
    Object.defineProperty(obj, sym, {
        get() { return 'getterValue'; },
        enumerable: true,
        configurable: true
    });
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length };
}

export function getOwnPropertySymbolsSetter042() {
    const obj = {};
    let _value = 'initial';
    const sym = Symbol('setter');
    Object.defineProperty(obj, sym, {
        set(value) { _value = value; },
        get() { return _value; },
        enumerable: true,
        configurable: true
    });
    const result = Object.getOwnPropertySymbols(obj);
    return result.length;
}

export function getOwnPropertySymbolsGetterSetter043() {
    const obj = {};
    let value = 'test';
    const sym = Symbol('accessor');
    Object.defineProperty(obj, sym, {
        get() { return value; },
        set(newValue) { value = newValue; },
        enumerable: true,
        configurable: true
    });
    const result = Object.getOwnPropertySymbols(obj);
    return result.length;
}


export function getOwnPropertySymbolsFrozen044() {
    const obj = {};
    const sym = Symbol('frozen');
    obj[sym] = 'value';
    Object.freeze(obj);
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, firstIsSame: result[0] === sym };
}

export function getOwnPropertySymbolsFreezeAddNew045() {
    const obj = { a: 1 };
    Object.freeze(obj);
    const sym = Symbol('new');
    try { obj[sym] = 'newValue'; } catch (e) {}
    const result = Object.getOwnPropertySymbols(obj);
    return result.length;
}

export function getOwnPropertySymbolsFrozenMulti046() {
    const obj = {};
    const sym1 = Symbol('frozen1');
    const sym2 = Symbol('frozen2');
    obj[sym1] = 'value1';
    obj[sym2] = 'value2';
    Object.freeze(obj);
    const result = Object.getOwnPropertySymbols(obj);
    return result.length;
}


export function getOwnPropertySymbolsSealed047() {
    const obj = {};
    const sym = Symbol('sealed');
    obj[sym] = 'value';
    Object.seal(obj);
    const result = Object.getOwnPropertySymbols(obj);
    return result.length;
}

export function getOwnPropertySymbolsSealAddNew048() {
    const obj = { a: 1 };
    Object.seal(obj);
    const sym = Symbol('new');
    try { obj[sym] = 'newValue'; } catch (e) {}
    const result = Object.getOwnPropertySymbols(obj);
    return result.length;
}

export function getOwnPropertySymbolsSealDelete049() {
    const obj = {};
    const sym = Symbol('sealed');
    obj[sym] = 'value';
    Object.seal(obj);
    let canDelete;
    try {
        canDelete = delete obj[sym];
    } catch (e) {
        canDelete = false;
    }
    const result = Object.getOwnPropertySymbols(obj);
    return { canDelete: canDelete, length: result.length };
}

export function getOwnPropertySymbolsSealModify050() {
    const obj = {};
    const sym = Symbol('sealed');
    obj[sym] = 'oldValue';
    Object.seal(obj);
    obj[sym] = 'newValue';
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length };
}


export function getOwnPropertySymbolsNonExtensible051() {
    const obj = {};
    const sym = Symbol('nonExtensible');
    obj[sym] = 'value';
    Object.preventExtensions(obj);
    const result = Object.getOwnPropertySymbols(obj);
    return result.length;
}

export function getOwnPropertySymbolsNonExtAddNew052() {
    const obj = { a: 1 };
    Object.preventExtensions(obj);
    const sym = Symbol('new');
    try { obj[sym] = 'newValue'; } catch (e) {}
    const result = Object.getOwnPropertySymbols(obj);
    return result.length;
}

export function getOwnPropertySymbolsNonExtDelete053() {
    const obj = {};
    const sym = Symbol('nonExtensible');
    obj[sym] = 'value';
    Object.preventExtensions(obj);
    const canDelete = delete obj[sym];
    const result = Object.getOwnPropertySymbols(obj);
    return { canDelete: canDelete, length: result.length };
}


export function getOwnPropertySymbolsEmptyObj054() {
    const obj = {};
    const result = Object.getOwnPropertySymbols(obj);
    return { isArray: Array.isArray(result), length: result.length };
}

export function getOwnPropertySymbolsNullProto055() {
    const obj = Object.create(null);
    const result = Object.getOwnPropertySymbols(obj);
    return { isArray: Array.isArray(result), length: result.length };
}

export function getOwnPropertySymbolsNoSymbols056() {
    const obj = { a: 1, b: 'test', c: true };
    const result = Object.getOwnPropertySymbols(obj);
    return result.length;
}

export function getOwnPropertySymbols100057() {
    const obj = {};
    const symbols = [];
    for (let i = 0; i < 100; i++) {
        const sym = Symbol(`symbol_${i}`);
        obj[sym] = i;
        symbols.push(sym);
    }
    const result = Object.getOwnPropertySymbols(obj);
    const allFound = symbols.every(sym => result.includes(sym));
    return { length: result.length, allFound: allFound };
}


export function getOwnPropertySymbolsUndefinedVal058() {
    const obj = {};
    const sym = Symbol('undefined');
    obj[sym] = undefined;
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, firstIsSame: result[0] === sym };
}

export function getOwnPropertySymbolsNullVal059() {
    const obj = {};
    const sym = Symbol('null');
    obj[sym] = null;
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, firstIsSame: result[0] === sym };
}

export function getOwnPropertySymbolsNaNVal060() {
    const obj = {};
    const sym = Symbol('nan');
    obj[sym] = NaN;
    const result = Object.getOwnPropertySymbols(obj);
    return result.length;
}


export function getOwnPropertySymbolsProtoChain061() {
    const parent = {};
    const parentSym = Symbol('parent');
    parent[parentSym] = 'parentValue';
    const child = Object.create(parent);
    const childSym = Symbol('child');
    child[childSym] = 'childValue';
    const result = Object.getOwnPropertySymbols(child);
    return { length: result.length, hasChild: result.includes(childSym), hasParent: result.includes(parentSym) };
}

export function getOwnPropertySymbolsMultiInherit062() {
    const grandParent = {};
    const gpSym = Symbol('grandParent');
    grandParent[gpSym] = 'gpValue';
    const parent = Object.create(grandParent);
    const parentSym = Symbol('parent');
    parent[parentSym] = 'parentValue';
    const child = Object.create(parent);
    const childSym = Symbol('child');
    child[childSym] = 'childValue';
    const result = Object.getOwnPropertySymbols(child);
    return { length: result.length, hasChild: result.includes(childSym) };
}

export function getOwnPropertySymbolsNullProto063() {
    const obj = Object.create(null);
    const sym = Symbol('noProto');
    obj[sym] = 'value';
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, protoNull: Object.getPrototypeOf(obj) === null };
}

export function getOwnPropertySymbolsCreateWithProto064() {
    const proto = {};
    const protoSym = Symbol('proto');
    proto[protoSym] = 'protoValue';
    const obj = Object.create(proto);
    const objSym = Symbol('obj');
    obj[objSym] = 'objValue';
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, hasObj: result.includes(objSym) };
}

export function getOwnPropertySymbolsCreateWithProps065() {
    const sym = Symbol('created');
    const obj = Object.create({}, {
        [sym]: {
            value: 'createdValue',
            enumerable: true,
            writable: true,
            configurable: true
        }
    });
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, firstIsSame: result[0] === sym };
}

export function getOwnPropertySymbolsSetProto066() {
    const obj = {};
    const sym1 = Symbol('own');
    obj[sym1] = 'ownValue';
    const newProto = {};
    const protoSym = Symbol('proto');
    newProto[protoSym] = 'protoValue';
    Object.setPrototypeOf(obj, newProto);
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, hasSym1: result.includes(sym1) };
}


export function getOwnPropertySymbolsIsArray067() {
    const obj = {};
    const sym = Symbol('test');
    obj[sym] = 'value';
    const result = Object.getOwnPropertySymbols(obj);
    return Array.isArray(result);
}

export function getOwnPropertySymbolsEmptyArray068() {
    const obj = { a: 1, b: 2 };
    const result = Object.getOwnPropertySymbols(obj);
    return { isArray: Array.isArray(result), length: result.length };
}

export function getOwnPropertySymbolsAllSymbols069() {
    const obj = {};
    const sym1 = Symbol('s1');
    const sym2 = Symbol('s2');
    obj[sym1] = 'v1';
    obj[sym2] = 'v2';
    const result = Object.getOwnPropertySymbols(obj);
    return result.every(item => typeof item === 'symbol');
}

export function getOwnPropertySymbolsNewArray070() {
    const obj = {};
    const sym = Symbol('test');
    obj[sym] = 'value';
    const result1 = Object.getOwnPropertySymbols(obj);
    const result2 = Object.getOwnPropertySymbols(obj);
    return result1 !== result2;
}

export function getOwnPropertySymbolsModifyArray071() {
    const obj = {};
    const sym = Symbol('test');
    obj[sym] = 'value';
    const result = Object.getOwnPropertySymbols(obj);
    const originalLength = result.length;
    result.push(Symbol('added'));
    const afterModify = result.length;
    const originalUnchanged = Object.getOwnPropertySymbols(obj).length;
    return { originalLength: originalLength, afterModify: afterModify, originalUnchanged: originalUnchanged };
}

export function getOwnPropertySymbolsOrder072() {
    const obj = {};
    const sym1 = Symbol('first');
    const sym2 = Symbol('second');
    const sym3 = Symbol('third');
    obj[sym1] = 'v1';
    obj[sym2] = 'v2';
    obj[sym3] = 'v3';
    const result = Object.getOwnPropertySymbols(obj);
    return { first: result[0] === sym1, second: result[1] === sym2, third: result[2] === sym3 };
}

export function getOwnPropertySymbolsMap073() {
    const obj = {};
    obj[Symbol('a')] = 'va';
    obj[Symbol('b')] = 'vb';
    const result = Object.getOwnPropertySymbols(obj);
    return result.map(s => s.description);
}

export function getOwnPropertySymbolsKeyFor074() {
    const obj = {};
    const sym1 = Symbol.for('global1');
    const sym2 = Symbol('local');
    const sym3 = Symbol.for('global2');
    obj[sym1] = 'g1';
    obj[sym2] = 'l';
    obj[sym3] = 'g2';
    const result = Object.getOwnPropertySymbols(obj);
    return { key0: Symbol.keyFor(result[0]), key1: Symbol.keyFor(result[1]), key2: Symbol.keyFor(result[2]) };
}

export function getOwnPropertySymbolsDynamic075() {
    const obj = {};
    const sym1 = Symbol('s1');
    const sym2 = Symbol('s2');
    obj[sym1] = 'v1';
    const len1 = Object.getOwnPropertySymbols(obj).length;
    obj[sym2] = 'v2';
    const len2 = Object.getOwnPropertySymbols(obj).length;
    delete obj[sym1];
    const len3 = Object.getOwnPropertySymbols(obj).length;
    return { len1: len1, len2: len2, len3: len3 };
}


export function getOwnPropertySymbolsWithNames076() {
    const obj = {};
    const sym = Symbol('sym');
    obj[sym] = 'symValue';
    obj.stringKey = 'stringValue';
    const symbols = Object.getOwnPropertySymbols(obj);
    const names = Object.getOwnPropertyNames(obj);
    return { symLength: symbols.length, namesLength: names.length, symFirst: symbols[0] === sym, namesHasString: names.includes('stringKey') };
}

export function getOwnPropertySymbolsNotInNames077() {
    const obj = { a: 1, b: 2 };
    const sym = Symbol('onlySym');
    obj[sym] = 'symValue';
    const symbols = Object.getOwnPropertySymbols(obj);
    const names = Object.getOwnPropertyNames(obj);
    return { symHasA: symbols.includes('a'), namesHasSym: names.includes(sym) };
}

export function getOwnPropertySymbolsReflect078() {
    const obj = {};
    const sym = Symbol('sym');
    obj[sym] = 'symValue';
    obj.strKey = 'strValue';
    const ownKeys = Reflect.ownKeys(obj);
    const hasSym = ownKeys.includes(sym);
    const hasStr = ownKeys.includes('strKey');
    return { ownKeysLength: ownKeys.length, hasSym: hasSym, hasStr: hasStr };
}

export function getOwnPropertySymbolsReflectCompare079() {
    const obj = {};
    const sym1 = Symbol('s1');
    const sym2 = Symbol('s2');
    obj[sym1] = 'v1';
    obj[sym2] = 'v2';
    obj.str1 = 'sv1';
    obj.str2 = 'sv2';
    const ownKeys = Reflect.ownKeys(obj);
    const symbols = Object.getOwnPropertySymbols(obj);
    const stringKeys = ownKeys.filter(k => typeof k !== 'symbol');
    return symbols.length + stringKeys.length === ownKeys.length;
}

export function getOwnPropertySymbolsDescriptor080() {
    const obj = {};
    const sym = Symbol('desc');
    Object.defineProperty(obj, sym, {
        value: 'testValue',
        writable: false,
        enumerable: true,
        configurable: true
    });
    const symbols = Object.getOwnPropertySymbols(obj);
    const descriptor = Object.getOwnPropertyDescriptor(obj, symbols[0]);
    return { isWritable: descriptor.writable, isEnumerable: descriptor.enumerable };
}

export function getOwnPropertySymbolsKeys081() {
    const obj = {};
    const sym = Symbol('sym');
    obj[sym] = 'symValue';
    obj.enumerableStr = 'strValue';
    const keys = Object.keys(obj);
    const symbols = Object.getOwnPropertySymbols(obj);
    return { keysLength: keys.length, symLength: symbols.length };
}

export function getOwnPropertySymbolsValues082() {
    const obj = {};
    const sym = Symbol('sym');
    obj[sym] = 'symValue';
    obj.strKey = 'strValue';
    const values = Object.values(obj);
    const symbols = Object.getOwnPropertySymbols(obj);
    return { valuesLength: values.length, hasStrValue: values.includes('strValue'), hasSymValue: values.includes('symValue') };
}

export function getOwnPropertySymbolsAssign083() {
    const source = {};
    const sym = Symbol('sym');
    source[sym] = 'symValue';
    source.strKey = 'strValue';
    const target = {};
    Object.assign(target, source);
    const targetSymbols = Object.getOwnPropertySymbols(target);
    return { length: targetSymbols.length, hasSym: targetSymbols[0] === sym };
}

export function getOwnPropertySymbolsForIn084() {
    const obj = {};
    const sym = Symbol('sym');
    obj[sym] = 'symValue';
    obj.strKey = 'strValue';
    const forInKeys = [];
    for (const key in obj) {
        forInKeys.push(key);
    }
    return { forInLength: forInKeys.length, hasStr: forInKeys.includes('strKey') };
}

export function getOwnPropertySymbolsJSON085() {
    const obj = {};
    const sym = Symbol('sym');
    obj[sym] = 'symValue';
    obj.strKey = 'strValue';
    const json = JSON.stringify(obj);
    const parsed = JSON.parse(json);
    return { parsedSymUndefined: parsed[sym] === undefined, parsedStr: parsed.strKey, parsedSymsLength: Object.getOwnPropertySymbols(parsed).length };
}

export function getOwnPropertySymbolsFromEntries086() {
    const sym = Symbol('sym');
    const entries = [[sym, 'symValue'], ['strKey', 'strValue']];
    const obj = Object.fromEntries(entries);
    const symbols = Object.getOwnPropertySymbols(obj);
    return { length: symbols.length, hasSym: symbols[0] === sym };
}


export function getOwnPropertySymbolsNullErr087() {
    try {
        Object.getOwnPropertySymbols(null);
        return false;
    } catch (e) {
        return e.name;
    }
}

export function getOwnPropertySymbolsUndefinedErr088() {
    try {
        Object.getOwnPropertySymbols(undefined);
        return false;
    } catch (e) {
        return e.name;
    }
}

export function getOwnPropertySymbolsNoArg089() {
    try {
        Object.getOwnPropertySymbols();
        return false;
    } catch (e) {
        return e.name;
    }
}

export function getOwnPropertySymbolsNumberAuto090() {
    const result = Object.getOwnPropertySymbols(123);
    return { isArray: Array.isArray(result), length: result.length };
}

export function getOwnPropertySymbolsStringAuto091() {
    const result = Object.getOwnPropertySymbols('test');
    return { isArray: Array.isArray(result), length: result.length };
}

export function getOwnPropertySymbolsBoolAuto092() {
    const r1 = Object.getOwnPropertySymbols(true);
    const r2 = Object.getOwnPropertySymbols(false);
    return { r1Len: r1.length, r2Len: r2.length };
}

export function getOwnPropertySymbolsBigInt093() {
    const result = Object.getOwnPropertySymbols(BigInt(123));
    return { isArray: Array.isArray(result), length: result.length };
}

export function getOwnPropertySymbolsSymbolParam094() {
    const sym = Symbol('param');
    const result = Object.getOwnPropertySymbols(sym);
    return { isArray: Array.isArray(result), length: result.length };
}

export function getOwnPropertySymbolsMultiError095() {
    const results = [];
    const errorCases = [null, undefined, void 0];
    for (let i = 0; i < errorCases.length; i++) {
        try {
            Object.getOwnPropertySymbols(errorCases[i]);
            results.push('success');
        } catch (e) {
            results.push('error');
        }
    }
    return results;
}


export function getOwnPropertySymbolsProxy096() {
    const proxy = new Proxy({}, {
        get(target, prop) {
            if (prop === Symbol('test')) {
                return 'proxyValue';
            }
            return undefined;
        }
    });
    const sym = Symbol('test');
    proxy[sym] = 'value';
    const result = Object.getOwnPropertySymbols(proxy);
    return result.length;
}

export function getOwnPropertySymbolsRevocableProxy097() {
    const { proxy, revoke } = Proxy.revocable({}, {});
    const sym = Symbol('test');
    proxy[sym] = 'value';
    const result1 = Object.getOwnPropertySymbols(proxy);
    const result1Length = result1.length;
    revoke();
    let throws = false;
    try {
        Object.getOwnPropertySymbols(proxy);
    } catch (e) {
        throws = e.name;
    }
    return { result1Length: result1Length, throws: throws };
}


export function getOwnPropertySymbolsClassStatic098() {
    class MyClass {
        static [Symbol('static')] = 'staticValue';
    }
    const result = Object.getOwnPropertySymbols(MyClass);
    return { length: result.length };
}


export function getOwnPropertySymbolsIndex099() {
    const obj = {};
    const sym1 = Symbol('first');
    const sym2 = Symbol('second');
    obj[sym1] = 'v1';
    obj[sym2] = 'v2';
    const result = Object.getOwnPropertySymbols(obj);
    return { idx0: result[0] === sym1, idx1: result[1] === sym2, idxNeg1: result[-1] === undefined, idx100: result[100] === undefined };
}

export function getOwnPropertySymbolsLongDesc100() {
    const obj = {};
    const longDesc = 'a'.repeat(10000);
    const sym = Symbol(longDesc);
    obj[sym] = 'value';
    const result = Object.getOwnPropertySymbols(obj);
    return result[0].description.length;
}


export function getOwnPropertySymbolsHasInstance101() {
    const MyArray = {
        [Symbol.hasInstance](instance) {
            return Array.isArray(instance);
        }
    };
    const result = Object.getOwnPropertySymbols(MyArray);
    return result.length === 1 && result[0] === Symbol.hasInstance;
}

export function getOwnPropertySymbolsIsConcatSpreadable102() {
    const obj = {
        0: 1,
        1: 2,
        length: 2,
        [Symbol.isConcatSpreadable]: false
    };
    const result = Object.getOwnPropertySymbols(obj);
    return result.length === 1 && result[0] === Symbol.isConcatSpreadable;
}

export function getOwnPropertySymbolsMatch103() {
    const obj = {
        [Symbol.match](str) {
            return ['matched'];
        }
    };
    const result = Object.getOwnPropertySymbols(obj);
    return result.length === 1 && result[0] === Symbol.match;
}

export function getOwnPropertySymbolsReplace104() {
    const replacer = {
        [Symbol.replace](str) {
            return str.replace(/test/g, 'replaced');
        }
    };
    const result = Object.getOwnPropertySymbols(replacer);
    return result.length === 1 && result[0] === Symbol.replace;
}

export function getOwnPropertySymbolsSearch105() {
    const searcher = {
        [Symbol.search](str) {
            return str.indexOf('test');
        }
    };
    const result = Object.getOwnPropertySymbols(searcher);
    return result.length === 1 && result[0] === Symbol.search;
}

export function getOwnPropertySymbolsSplit106() {
    const splitter = {
        [Symbol.split](str) {
            return str.split(',');
        }
    };
    const result = Object.getOwnPropertySymbols(splitter);
    return result.length === 1 && result[0] === Symbol.split;
}

export function getOwnPropertySymbolsUnscopables107() {
    const obj = {
        foo: 1,
        bar: 2,
        [Symbol.unscopables]: {
            foo: false,
            bar: true
        }
    };
    const result = Object.getOwnPropertySymbols(obj);
    return result.length === 1 && result[0] === Symbol.unscopables;
}

export function getOwnPropertySymbolsSpecies108() {
    class MyArray extends Array {
        static get [Symbol.species]() {
            return Array;
        }
    }
    const result = Object.getOwnPropertySymbols(MyArray);
    return result.length >= 1;
}

export function getOwnPropertySymbols1000Props109() {
    const obj = {};
    const symbols = [];
    for (let i = 0; i < 1000; i++) {
        const sym = Symbol(`symbol_${i}`);
        obj[sym] = i;
        symbols.push(sym);
    }
    const result = Object.getOwnPropertySymbols(obj);
    return result.length;
}

export function getOwnPropertySymbolsProtoModify110() {
    const obj = {};
    const sym = Symbol('own');
    obj[sym] = 'ownValue';
    obj.__proto__ = { inherited: 'value' };
    const result = Object.getOwnPropertySymbols(obj);
    return result.length === 1 && result[0] === sym;
}

export function getOwnPropertySymbolsClassInherit111() {
    class Parent {
        constructor() {
            this[Symbol('parent')] = 'parentValue';
        }
    }
    class Child extends Parent {
        constructor() {
            super();
            this[Symbol('child')] = 'childValue';
        }
    }
    const child = new Child();
    const result = Object.getOwnPropertySymbols(child);
    return result.length;
}

export function getOwnPropertySymbolsAssignOnlyEnum112() {
    const source = {};
    const sym1 = Symbol('enum');
    const sym2 = Symbol('nonEnum');
    Object.defineProperty(source, sym1, { value: 'v1', enumerable: true });
    Object.defineProperty(source, sym2, { value: 'v2', enumerable: false });
    const target = {};
    Object.assign(target, source);
    const targetSymbols = Object.getOwnPropertySymbols(target);
    return targetSymbols.length === 1 && targetSymbols[0] === sym1;
}

export function getOwnPropertySymbolsGetterOnly113() {
    const obj = {};
    const sym = Symbol('getterOnly');
    Object.defineProperty(obj, sym, {
        get() { return 'readOnly'; },
        enumerable: true,
        configurable: true
    });
    const result = Object.getOwnPropertySymbols(obj);
    return result.length === 1 && result[0] === sym;
}

export function getOwnPropertySymbolsSetterOnly114() {
    const obj = {};
    let internalValue;
    const sym = Symbol('setterOnly');
    Object.defineProperty(obj, sym, {
        set(value) { internalValue = value; },
        enumerable: true,
        configurable: true
    });
    const result = Object.getOwnPropertySymbols(obj);
    return result.length === 1 && result[0] === sym;
}

export function getOwnPropertySymbolsDataAndAccessor115() {
    const obj = {};
    const sym1 = Symbol('data');
    const sym2 = Symbol('accessor');
    Object.defineProperty(obj, sym1, { value: 'dataValue', enumerable: true });
    Object.defineProperty(obj, sym2, { get() { return 'accessorValue'; }, enumerable: true });
    const result = Object.getOwnPropertySymbols(obj);
    return result.length === 2 && result.includes(sym1) && result.includes(sym2);
}

export function getOwnPropertySymbolsNonExtModify116() {
    const obj = {};
    const sym = Symbol('nonExtensible');
    obj[sym] = 'oldValue';
    Object.preventExtensions(obj);
    obj[sym] = 'newValue';
    const result = Object.getOwnPropertySymbols(obj);
    return { length: result.length, value: obj[sym] };
}

export function getOwnPropertySymbolsFrozenVsSealed117() {
    const frozen = {};
    const sealed = {};
    const sym1 = Symbol('sym1');
    const sym2 = Symbol('sym2');
    frozen[sym1] = 'value1';
    sealed[sym2] = 'value2';
    Object.freeze(frozen);
    Object.seal(sealed);
    const frozenResult = Object.getOwnPropertySymbols(frozen);
    const sealedResult = Object.getOwnPropertySymbols(sealed);
    return frozenResult.length + sealedResult.length;
}

export function getOwnPropertySymbolsProtoChainPollution118() {
    const obj = {};
    const sym = Symbol('own');
    obj[sym] = 'ownValue';
    const maliciousProto = { toString: () => 'hacked' };
    Object.setPrototypeOf(obj, maliciousProto);
    const result = Object.getOwnPropertySymbols(obj);
    return result.length === 1 && result[0] === sym;
}

export function getOwnPropertySymbolsSpecialDesc119() {
    const obj = {};
    const sym1 = Symbol('!@#$%^&*()');
    const sym2 = Symbol('你好世界');
    const sym3 = Symbol('emoji 😀');
    obj[sym1] = 1;
    obj[sym2] = 2;
    obj[sym3] = 3;
    const result = Object.getOwnPropertySymbols(obj);
    return result.length;
}

export function getOwnPropertySymbolsBigInt64Array120() {
    const bigInt64 = new BigInt64Array([1n, 2n, 3n]);
    const sym = Symbol('bigInt64Symbol');
    bigInt64[sym] = 'bigInt64Value';
    const result = Object.getOwnPropertySymbols(bigInt64);
    return result.length === 1 && result[0] === sym;
}
