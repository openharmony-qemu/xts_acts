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

if (typeof Object.groupBy === 'undefined') {
    Object.groupBy = function (items, callbackfn) {
        var result = Object.create(null);
        var iterator = items[Symbol.iterator]();
        var index = 0;
        var entry = iterator.next();
        while (!entry.done) {
            var key = callbackfn(entry.value, index);
            var propertyKey = typeof key === 'symbol' ? key : String(key);
            if (!result[propertyKey]) {
                result[propertyKey] = [];
            }
            result[propertyKey].push(entry.value);
            index++;
            entry = iterator.next();
        }
        return result;
    };
}

if (typeof Map.groupBy === 'undefined') {
    Map.groupBy = function (items, callbackfn) {
        var result = new Map();
        var iterator = items[Symbol.iterator]();
        var index = 0;
        var entry = iterator.next();
        while (!entry.done) {
            var key = callbackfn(entry.value, index);
            if (!result.has(key)) {
                result.set(key, []);
            }
            result.get(key).push(entry.value);
            index++;
            entry = iterator.next();
        }
        return result;
    };
}

export function groupByStringProp001() {
  const inventory = [
    { name: "asparagus", type: "vegetables", quantity: 9 },
    { name: "bananas", type: "fruit", quantity: 5 },
    { name: "goat", type: "meat", quantity: 23 },
    { name: "cherries", type: "fruit", quantity: 12 },
    { name: "fish", type: "meat", quantity: 22 },
  ];
  const result = Object.groupBy(inventory, function(item) { return item.type; });
  return {
    hasVeg: result.vegetables !== undefined,
    hasFruit: result.fruit !== undefined,
    hasMeat: result.meat !== undefined,
    vegLength: result.vegetables ? result.vegetables.length : 0,
    fruitLength: result.fruit ? result.fruit.length : 0,
    meatLength: result.meat ? result.meat.length : 0
  };
}

export function groupByNumberProp002() {
  const data = [
    { id: 1, category: 1 },
    { id: 2, category: 2 },
    { id: 3, category: 1 },
  ];
  const result = Object.groupBy(data, function(item) { return item.category; });
  return {
    hasKey1: result['1'] !== undefined,
    hasKey2: result['2'] !== undefined,
    key1Len: result['1'] ? result['1'].length : 0,
    key2Len: result['2'] ? result['2'].length : 0
  };
}

export function groupByCondition003() {
  const inventory = [
    { name: "asparagus", type: "vegetables", quantity: 5 },
    { name: "bananas", type: "fruit", quantity: 0 },
    { name: "goat", type: "meat", quantity: 23 },
    { name: "cherries", type: "fruit", quantity: 5 },
    { name: "fish", type: "meat", quantity: 22 },
  ];
  const result = Object.groupBy(inventory, function(item) { return item.quantity > 5 ? "ok" : "restock"; });
  return {
    hasOk: result.ok !== undefined,
    hasRestock: result.restock !== undefined,
    okLen: result.ok ? result.ok.length : 0,
    restockLen: result.restock ? result.restock.length : 0
  };
}

export function groupByArrowCallback004() {
  const arr = [1, 2, 3, 4, 5];
  const result = Object.groupBy(arr, function(x) { return x % 2 === 0 ? "even" : "odd"; });
  return { oddLen: result.odd ? result.odd.length : 0, evenLen: result.even ? result.even.length : 0 };
}

export function groupByRegularCallback005() {
  const arr = [1, 2, 3, 4, 5];
  function groupFn(x) { return x % 2 === 0 ? "even" : "odd"; }
  const result = Object.groupBy(arr, groupFn);
  return { oddLen: result.odd ? result.odd.length : 0 };
}

export function groupByNormalArray006() {
  const arr = [1, 2, 3, 4, 5];
  const result = Object.groupBy(arr, function(x) { return x > 3 ? "big" : "small"; });
  return { smallLen: result.small ? result.small.length : 0, bigLen: result.big ? result.big.length : 0 };
}

export function groupByEmptyArray007() {
  const result = Object.groupBy([], function(x) { return x; });
  return Object.keys(result).length;
}

export function groupBySingleArray008() {
  const arr = [1];
  const result = Object.groupBy(arr, function(x) { return "group" + x; });
  return { hasKey: result.group1 !== undefined, len: result.group1 ? result.group1.length : 0 };
}

export function groupBySpecialValues009() {
  const arr = [1, undefined, null, NaN, 2];
  const result = Object.groupBy(arr, function(x) { return typeof x; });
  return {
    hasNumber: result.number !== undefined,
    hasUndefined: result.undefined !== undefined,
    hasObject: result.object !== undefined,
    numberLen: result.number ? result.number.length : 0
  };
}

export function groupByInt8Array010() {
  const arr = new Int8Array([1, 2, 3, -1, -2]);
  const result = Object.groupBy(arr, function(x) { return x >= 0 ? "positive" : "negative"; });
  return { posLen: result.positive ? result.positive.length : 0, negLen: result.negative ? result.negative.length : 0 };
}

export function groupByFloat32Array011() {
  const arr = new Float32Array([1.1, 2.2, 3.3, NaN, Infinity]);
  const result = Object.groupBy(arr, function(x) {
    if (Number.isNaN(x)) return "NaN";
    if (!Number.isFinite(x)) return "Infinite";
    return "finite";
  });
  return {
    hasNaN: result.NaN !== undefined,
    hasInfinite: result.Infinite !== undefined,
    hasFinite: result.finite !== undefined
  };
}

export function groupByString012() {
  const str = "hello";
  const result = Object.groupBy(str, function(char) { return char; });
  return { hLen: result.h ? result.h.length : 0, lLen: result.l ? result.l.length : 0, oLen: result.o ? result.o.length : 0 };
}

export function groupByEmptyString013() {
  const str = "";
  const result = Object.groupBy(str, function(char) { return char; });
  return Object.keys(result).length;
}

export function groupBySet014() {
  const set = new Set([1, 2, 3]);
  const result = Object.groupBy(set, function(x) { return x % 2 === 0 ? "even" : "odd"; });
  return { oddLen: result.odd ? result.odd.length : 0, evenLen: result.even ? result.even.length : 0 };
}

export function groupByEmptySet015() {
  const set = new Set();
  const result = Object.groupBy(set, function(x) { return x; });
  return Object.keys(result).length;
}

export function groupByMap016() {
  const map = new Map([["a", 1], ["b", 2], ["c", 1]]);
  const result = Object.groupBy(map, function(entry) { return entry[1]; });
  return { key1Len: result['1'] ? result['1'].length : 0, key2Len: result['2'] ? result['2'].length : 0 };
}

export function groupByReturnNumber017() {
  const arr = [1, 2, 3, 4];
  const result = Object.groupBy(arr, function(x) { return x; });
  return { has1: result['1'] !== undefined, has4: result['4'] !== undefined };
}

export function groupByReturnBoolean018() {
  const arr = [1, 2, 3, 4, 5];
  const result = Object.groupBy(arr, function(x) { return x > 3; });
  return { trueLen: result['true'] ? result['true'].length : 0, falseLen: result['false'] ? result['false'].length : 0 };
}

export function groupByReturnNull019() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return null; });
  return { hasNull: result['null'] !== undefined, nullLen: result['null'] ? result['null'].length : 0 };
}

export function groupByReturnUndefined020() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return undefined; });
  return { hasUndef: result['undefined'] !== undefined, len: result['undefined'] ? result['undefined'].length : 0 };
}

export function groupByReturnNaN021() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return NaN; });
  return { hasNaN: result['NaN'] !== undefined, len: result['NaN'] ? result['NaN'].length : 0 };
}

export function groupByIndex022() {
  const arr = ["a", "b", "c", "d"];
  const result = Object.groupBy(arr, function(element, index) { return index % 2 === 0 ? "evenIndex" : "oddIndex"; });
  return { evenLen: result.evenIndex ? result.evenIndex.length : 0, oddLen: result.oddIndex ? result.oddIndex.length : 0 };
}

export function groupByElementAndIndex023() {
  const arr = [10, 20, 30, 40];
  const result = Object.groupBy(arr, function(element, index) { return element + index; });
  return { keysLength: Object.keys(result).length };
}

export function groupByNoParams024() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function() { return "singleGroup"; });
  return { len: result.singleGroup ? result.singleGroup.length : 0 };
}

export function groupBySymbolKey025() {
  const sym = Symbol("group1");
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return sym; });
  return { hasSymbolKey: result[sym] !== undefined, symLen: result[sym] ? result[sym].length : 0 };
}

export function groupByEmptyStringKey026() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return ""; });
  return { hasEmpty: result[''] !== undefined, len: result[''] ? result[''].length : 0 };
}

export function groupByProtoKey027() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return "__proto__"; });
  return { hasProto: result['__proto__'] !== undefined, len: result['__proto__'] ? result['__proto__'].length : 0 };
}

export function groupByNaNValues028() {
  const arr = [NaN, 1, NaN, 2];
  const result = Object.groupBy(arr, function(x) { return Number.isNaN(x) ? "NaN" : "number"; });
  return { nanLen: result.NaN ? result.NaN.length : 0, numLen: result.number ? result.number.length : 0 };
}

export function groupByInfinity029() {
  const arr = [Infinity, -Infinity, 1, Infinity];
  const result = Object.groupBy(arr, function(x) {
    if (x === Infinity) return "posInf";
    if (x === -Infinity) return "negInf";
    return "finite";
  });
  return {
    posLen: result.posInf ? result.posInf.length : 0,
    negLen: result.negInf ? result.negInf.length : 0,
    finLen: result.finite ? result.finite.length : 0
  };
}

export function groupByNegZero030() {
  const arr = [0, -0, 1];
  const result = Object.groupBy(arr, function(x) { return Object.is(x, -0) ? "negZero" : "other"; });
  return { negLen: result.negZero ? result.negZero.length : 0, otherLen: result.other ? result.other.length : 0 };
}

export function groupByNullElement031() {
  const arr = [null, 1, null, 2];
  const result = Object.groupBy(arr, function(x) { return x === null ? "nullGroup" : "nonNull"; });
  return { nullLen: result.nullGroup ? result.nullGroup.length : 0, nonNullLen: result.nonNull ? result.nonNull.length : 0 };
}

export function groupByEmptyArray032() {
  const result = Object.groupBy([], function(x) { return x; });
  return Object.keys(result).length;
}

export function groupByLargeArray033() {
  const largeArr = Array.from({ length: 1000 }, function(v, i) { return i; });
  const result = Object.groupBy(largeArr, function(x) { return (x % 10).toString(); });
  return Object.keys(result).length;
}

export function groupBySingleGroup034() {
  const largeArr = Array.from({ length: 1000 }, function(v, i) { return i; });
  const result = Object.groupBy(largeArr, function(x) { return "all"; });
  return result.all ? result.all.length : 0;
}

export function groupByFirstIndex035() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x, index) { return index === 0 ? "first" : "others"; });
  return { firstLen: result.first ? result.first.length : 0, othersLen: result.others ? result.others.length : 0 };
}

export function groupByLastIndex036() {
  const arr = [1, 2, 3];
  const lastIndex = arr.length - 1;
  const result = Object.groupBy(arr, function(x, index) { return index === lastIndex ? "last" : "others"; });
  return { lastLen: result.last ? result.last.length : 0, othersLen: result.others ? result.others.length : 0 };
}

export function groupByObjectElement037() {
  const arr = [{ a: 1 }, { b: 2 }, { a: 1 }];
  const result = Object.groupBy(arr, function(element) { return element.a ? "hasA" : "noA"; });
  return { hasALen: result.hasA ? result.hasA.length : 0, noALen: result.noA ? result.noA.length : 0 };
}

export function groupByArrayElement038() {
  const arr = [[1, 2], [3, 4], [1, 2]];
  const result = Object.groupBy(arr, function(element) { return element.length; });
  const key = '2';
  return result[key] ? result[key].length : 0;
}

export function groupByNullProto039() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return x % 2 === 0 ? "even" : "odd"; });
  return Object.getPrototypeOf(result) === null;
}

export function groupByNoInherited040() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return "test"; });
  return {
    noHasOwnProp: result.hasOwnProperty === undefined,
    noToString: result.toString === undefined,
    noValueOf: result.valueOf === undefined
  };
}

export function groupByNoConstructor041() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return "test"; });
  return result.constructor === undefined;
}

export function groupByDotAccess042() {
  const arr = [1, 2, 3, 4];
  const result = Object.groupBy(arr, function(x) { return x % 2 === 0 ? "even" : "odd"; });
  return { evenLen: result.even ? result.even.length : 0, oddLen: result.odd ? result.odd.length : 0 };
}

export function groupByBracketAccess043() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return x; });
  return { val1: result['1'] ? result['1'].length : 0, val3: result['3'] ? result['3'].length : 0 };
}

export function groupByKeys044() {
  const arr = [1, 2, 3, 4];
  const result = Object.groupBy(arr, function(x) { return x % 2 === 0 ? "even" : "odd"; });
  return Object.keys(result).length;
}

export function groupByValues045() {
  const arr = [1, 2, 3, 4];
  const result = Object.groupBy(arr, function(x) { return x % 2 === 0 ? "even" : "odd"; });
  return Object.values(result).length;
}

export function groupByEntries046() {
  const arr = [1, 2, 3, 4];
  const result = Object.groupBy(arr, function(x) { return x % 2 === 0 ? "even" : "odd"; });
  return Object.entries(result).length;
}

export function groupByReference047() {
  const obj1 = { value: 1 };
  const obj2 = { value: 2 };
  const arr = [obj1, obj2];
  const result = Object.groupBy(arr, function(x) { return x.value > 1 ? "big" : "small"; });
  obj1.value = 100;
  return result.small[0].value;
}

export function groupByOrder048() {
  const arr = [1, 2, 3, 4, 5];
  const result = Object.groupBy(arr, function(x) { return x % 2 === 0 ? "even" : "odd"; });
  return {
    oddFirst: result.odd ? result.odd[0] : -1,
    oddSecond: result.odd ? result.odd[1] : -1,
    evenFirst: result.even ? result.even[0] : -1
  };
}

export function groupByKeyOrder049() {
  const arr = [1, 2, 3, 4];
  const result = Object.groupBy(arr, function(x) { return x % 2 === 0 ? "even" : "odd"; });
  const keys = Object.keys(result);
  return { firstKey: keys[0], secondKey: keys[1] };
}

export function groupByNonIterable050() {
  try {
    Object.groupBy(123, function(x) { return x; });
    return false;
  } catch (e) {
    return e.name;
  }
}

export function groupByNullItems051() {
  try {
    Object.groupBy(null, function(x) { return x; });
    return false;
  } catch (e) {
    return e.name;
  }
}

export function groupByUndefinedItems052() {
  try {
    Object.groupBy(undefined, function(x) { return x; });
    return false;
  } catch (e) {
    return e.name;
  }
}

export function groupByNonFuncCallback053() {
  try {
    Object.groupBy([1, 2, 3], "not a function");
    return false;
  } catch (e) {
    return e.name;
  }
}

export function groupByNoArgs054() {
  try {
    Object.groupBy();
    return false;
  } catch (e) {
    return e.name;
  }
}

export function groupByCallbackThrows055() {
  const arr = [1, 2, 3];
  try {
    Object.groupBy(arr, function(x) {
      if (x === 2) throw new Error("test error");
      return x;
    });
    return false;
  } catch (e) {
    return e.message === "test error";
  }
}

export function groupByVsMapGroupBy056() {
  const arr = [1, 2, 3, 4];
  const objResult = Object.groupBy(arr, function(x) { return x % 2 === 0 ? "even" : "odd"; });
  const mapResult = Map.groupBy(arr, function(x) { return x % 2 === 0 ? "even" : "odd"; });
  return { objType: typeof objResult, mapType: mapResult?.constructor?.name=== "Map" };
}

export function groupByWithFilter057() {
  const arr = [1, 2, 3, 4, 5, 6];
  const filtered = arr.filter(function(x) { return x > 2; });
  const result = Object.groupBy(filtered, function(x) { return x % 2 === 0 ? "even" : "odd"; });
  return { oddLen: result.odd ? result.odd.length : 0, evenLen: result.even ? result.even.length : 0 };
}

export function groupByJSONStringify058() {
  const arr = [1, 2, 3, 4];
  const result = Object.groupBy(arr, function(x) { return x % 2 === 0 ? "even" : "odd"; });
  return JSON.stringify(result);
}

export function groupByDestructure059() {
  const arr = [1, 2, 3, 4];
  const result = Object.groupBy(arr, function(x) { return x % 2 === 0 ? "even" : "odd"; });
  const odd = result.odd;
  const even = result.even;
  return { oddLen: odd ? odd.length : 0, evenLen: even ? even.length : 0 };
}

export function groupByChineseKey060() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return x === 1 ? "一组" : "其他"; });
  return { hasGroup1: result['一组'] !== undefined, hasOther: result['其他'] !== undefined };
}

function createSimpleNumberIterator() {
    let i = 0;
    return {
        next: function() {
            if (i < 3) return { value: i++, done: false };
            return { done: true };
        }
    };
}

export function groupByCustomIterable061() {
  const iterable = {
    [Symbol.iterator]: function() {
      return createSimpleNumberIterator();
    }
  };
  const result = Object.groupBy(iterable, function(x) { return String(x); });
  return Object.keys(result).length;
}

export function groupByGenerator062() {
  function* gen() {
    yield 1;
    yield 2;
    yield 3;
  }
  const result = Object.groupBy(gen(), function(x) { return x % 2 === 0 ? "even" : "odd"; });
  return result.odd.length + result.even.length;
}

export function groupByReturnObject063() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return { key: x }; });
  return result['[object Object]'] !== undefined && result['[object Object]'].length === 3;
}


export function groupByReturnBigInt065() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return BigInt(x); });
  return result['1'].length === 1 && result['2'].length === 1 && result['3'].length === 1;
}

export function groupByReturnInfinity066() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return Infinity; });
  return result['Infinity'] !== undefined && result['Infinity'].length === 3;
}

export function groupByMultiSymbolKeys067() {
  const sym1 = Symbol("a");
  const sym2 = Symbol("b");
  const arr = [1, 2, 3, 4];
  const result = Object.groupBy(arr, function(x) { return x % 2 === 0 ? sym1 : sym2; });
  const syms = Object.getOwnPropertySymbols(result);
  return syms.length === 2;
}

export function groupBySymbolForKey068() {
  const sym = Symbol.for("global");
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return sym; });
  return result[sym] !== undefined && result[sym].length === 3;
}

export function groupByConstructorKey069() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return "constructor"; });
  return result['constructor'] !== undefined && result['constructor'].length === 3;
}

export function groupByHasOwnPropertyKey070() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return "hasOwnProperty"; });
  return result['hasOwnProperty'] !== undefined && result['hasOwnProperty'].length === 3;
}

export function groupByToStringKey071() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return "toString"; });
  return result['toString'] !== undefined && result['toString'].length === 3;
}

export function groupBySpecialCharsKeys072() {
  const arr = "!@#".split("");
  const result = Object.groupBy(arr, function(x) { return x; });
  return Object.keys(result).length;
}

export function groupByEscapeChars073() {
  const arr = ["a\nb", "c\td", "e", "f\rg"];
  const result = Object.groupBy(arr, function(x) {
    if (x.indexOf("\n") !== -1) return "newline";
    if (x.indexOf("\t") !== -1) return "tab";
    if (x.indexOf("\r") !== -1) return "carriage";
    return "normal";
  });
  return Object.keys(result).length;
}

export function groupByEmojiKeys074() {
  const arr = ["a", "b", "a", "c"];
  const result = Object.groupBy(arr, function(x) { return x; });
  return Object.keys(result).length;
}

export function groupByForIn075() {
  const arr = [1, 2, 3, 4];
  const result = Object.groupBy(arr, function(x) { return x % 2 === 0 ? "even" : "odd"; });
  const keys = [];
  for (const key in result) {
    keys.push(key);
  }
  return keys.length;
}

export function groupByGetOwnPropNames076() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return String(x); });
  return Object.getOwnPropertyNames(result).length;
}

export function groupByGetOwnPropSymbols077() {
  const sym = Symbol("key");
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return sym; });
  return Object.getOwnPropertySymbols(result).length;
}

export function groupByPropertyDescriptor078() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return "test"; });
  const desc = Object.getOwnPropertyDescriptor(result, "test");
  return desc !== undefined && desc.enumerable === true && desc.writable === true && desc.configurable === true;
}

export function groupByFreezeResult079() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return "test"; });
  Object.freeze(result);
  return Object.isFrozen(result);
}

export function groupBySealResult080() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return "test"; });
  Object.seal(result);
  return Object.isSealed(result);
}

export function groupByPreventExtensions081() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return "test"; });
  Object.preventExtensions(result);
  return !Object.isExtensible(result);
}

function createGroupByThrowingIterator() {
    let i = 0;
    return {
        next: function() {
            if (i === 2) throw new Error("iterator error");
            if (i < 3) return { value: i++, done: false };
            return { done: true };
        }
    };
}

export function groupByIteratorThrows082() {
  const iterable = {
    [Symbol.iterator]: function() {
      return createGroupByThrowingIterator();
    }
  };
  try {
    Object.groupBy(iterable, function(x) { return x; });
    return false;
  } catch (e) {
    return e.message === "iterator error";
  }
}

export function groupByExtraArgs083() {
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return String(x); }, "extra1", "extra2");
  return result['1'].length === 1;
}

export function groupByWithReduce084() {
  const arr = [1, 2, 3, 4];
  const groupByResult = Object.groupBy(arr, function(x) { return x % 2 === 0 ? "even" : "odd"; });
  const reduceResult = arr.reduce(function(acc, x) {
    const key = x % 2 === 0 ? "even" : "odd";
    if (!acc[key]) acc[key] = [];
    acc[key].push(x);
    return acc;
  }, {});
  return groupByResult.odd.length === reduceResult.odd.length && groupByResult.even.length === reduceResult.even.length;
}

export function groupByWithFlatMap085() {
  const arr = [[1, 2], [3, 4], [5]];
  const flatMapped = arr.flatMap(function(x) { return x; });
  const result = Object.groupBy(flatMapped, function(x) { return x % 2 === 0 ? "even" : "odd"; });
  return result.odd.length === 3 && result.even.length === 2;
}

export function groupByWithSort086() {
  const arr = [3, 1, 4, 2];
  const sorted = arr.slice().sort(function(a, b) { return a - b; });
  const result = Object.groupBy(sorted, function(x) { return x % 2 === 0 ? "even" : "odd"; });
  return result.odd[0] === 1 && result.odd[1] === 3;
}

export function groupByClassInstances087() {
  function Person(name, age) {
    this.name = name;
    this.age = age;
  }
  const people = [
    new Person("Alice", 25),
    new Person("Bob", 30),
    new Person("Carol", 25)
  ];
  const result = Object.groupBy(people, function(p) { return p.age; });
  return result['25'].length === 2 && result['30'].length === 1;
}

export function groupBySymbolKeyJSON088() {
  const sym = Symbol("key");
  const arr = [1, 2, 3];
  const result = Object.groupBy(arr, function(x) { return sym; });
  const json = JSON.stringify(result);
  return json === '{}';
}

export function groupBySpread089() {
  const arr = [1, 2, 3, 4];
  const result = Object.groupBy(arr, function(x) { return x % 2 === 0 ? "even" : "odd"; });
  const copy = Object.assign({}, result);
  return copy.odd.length === 2 && copy.even.length === 2;
}

export function groupByBigIntElements090() {
  const arr = [1n, 2n, 1n, 3n];
  const result = Object.groupBy(arr, function(x) { return x.toString(); });
  return result['1'].length === 2 && result['2'].length === 1 && result['3'].length === 1;
}
