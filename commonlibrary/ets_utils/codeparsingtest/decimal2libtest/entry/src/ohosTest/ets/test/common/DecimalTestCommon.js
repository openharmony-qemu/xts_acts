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

/**
 * Decimal 测试公共辅助函数（合并自原 DecimalTestCommon.js、DecimalConfigJsUtils.js、
 * DecimalConfigPropertiesJsUtils.js、DecimalToFractionJsUtils.js、DecimalUnionJsUtils.js）。
 *
 * 设计目标：
 *   1. 统一 sleep() 实现，消除原 61 个文件中各自重复定义（原 decimal3 用 1ms，decimal4 用 30ms，参数名 ms/time 不一致）
 *   2. 统一错误码断言风格，消除原 5 种不同的 try-catch-assert 写法
 *   3. 集中 Decimal.set({ defaults: true }) 配置重置，避免 afterEach 行为不一致导致测试污染
 *   4. 提供 Object/Reflect/Symbol/BigInt 等 .ets 中不便直接使用的底层操作封装
 *
 * 使用方式（在 .ets 测试文件中）：
 *   import * as common from '../common/DecimalTestCommon';
 *   await common.sleep(30);
 *   expect(common.getThrownCode(() => new Decimal(null))).assertEqual(401);
 *   common.resetDecimalConfig(Decimal);
 *   common.createSymbol('key');
 */

/** 统一的 sleep 时长（毫秒）。低端设备 1ms 不足以让异步操作完成，统一为 30ms。 */
const DEFAULT_SLEEP_MS = 30;

/**
 * 异步等待。
 * @param {number} ms - 等待毫秒数，默认 30ms
 * @returns {Promise<void>}
 */
function sleep(ms) {
  const wait = (ms === undefined || ms === null) ? DEFAULT_SLEEP_MS : ms;
  return new Promise(function (resolve) {
    setTimeout(resolve, wait);
  });
}

/**
 * 执行 fn 并返回抛出错误的 code；若 fn 未抛错则返回 null。
 *
 * 用此函数可消除大量样板：
 *   原：
 *     let errCode: number = -1;
 *     try { new Decimal(null); } catch (e) { errCode = (e as ESObject).code; }
 *     expect(errCode).assertEqual(401);
 *   优化后：
 *     expect(common.getThrownCode(() => new Decimal(null))).assertEqual(401);
 *
 * @param {() => void} fn - 待执行函数
 * @returns {number | null} 抛出错误的 code 字段，或 null（未抛错）
 */
function getThrownCode(fn) {
  try {
    fn();
    return null;
  } catch (e) {
    if (e && e.code !== undefined) {
      return e.code;
    }
    return null;
  }
}

/**
 * 判断 fn 是否抛出指定 code 的错误。
 * @param {() => void} fn - 待执行函数
 * @param {number} code - 期望的错误码
 * @returns {boolean}
 */
function throwsCode(fn, code) {
  return getThrownCode(fn) === code;
}

/**
 * 判断 fn 是否抛出任意错误（不关心 code）。
 * @param {() => void} fn - 待执行函数
 * @returns {boolean}
 */
function throws(fn) {
  try {
    fn();
    return false;
  } catch (e) {
    return true;
  }
}

/**
 * 重置 Decimal 全局配置为默认值。
 * 应在 afterEach 中调用，防止某测试设置的 precision/rounding/toExpPos/toExpNeg 配置污染后续测试。
 *
 * @param {object} Decimal - Decimal 构造器（从 @kit.ArkTS 导入）
 */
function resetDecimalConfig(Decimal) {
  Decimal.set({ defaults: true });
}

/**
 * 构造一个 afterEach 钩子函数：sleep + 重置 Decimal 配置。
 * 用法：
 *   afterEach(common.createAfterEach(Decimal));
 *
 * @param {object} Decimal - Decimal 构造器
 * @returns {() => Promise<void>}
 */
function createAfterEach(Decimal) {
  return async function () {
    resetDecimalConfig(Decimal);
  };
}

/**
 * 创建一个 BigInt 值。
 *
 * ArkTS .ets 文件中直接书写 BigInt 字面量（如 100n）或调用 BigInt() 不够稳定，
 * 且 BigInt 不属于 Decimal 构造器接受的 Value 联合类型，需经 ESObject 中转后再 `as Value`。
 * 这里统一通过 .js 辅助函数创建，保证跨测试文件一致可用。
 *
 * @param {number|string|bigint} value - 用于构造 BigInt 的值
 * @returns {ESObject} BigInt 值（以 ESObject 形式返回，调用方再 `as Value`）
 */
function createBigInt(value) {
  return BigInt(value);
}

/**
 * 创建一个 Symbol 值。
 *
 * 统一在 .js 中创建 Symbol，避免 .ets 中直接调用 Symbol()
 * 的类型推断问题；返回 ESObject，调用方再 `as Value` 传入待测接口。
 *
 * @param {string} description - Symbol 的描述符
 * @returns {ESObject} Symbol 值
 */
function createSymbol(description) {
  return Symbol(description);
}


function deleteProperty(target, key) {
  try {
    return delete target[key];
  } catch (error) {
    return false;
  }
}

function hasProperty(target, key) {
  return key in target;
}

function hasOwnProperty(target, key) {
  return Object.prototype.hasOwnProperty.call(target, key);
}

function objectKeys(target) {
  return Object.keys(target);
}

function enumerableKeyCount(target) {
  let count = 0;
  for (const key in target) {
    count++;
  }
  return count;
}

function ownPropertyNames(target) {
  return Object.getOwnPropertyNames(target);
}

function ownPropertySymbols(target) {
  return Object.getOwnPropertySymbols(target);
}

function ownPropertyDescriptor(target, key) {
  return Object.getOwnPropertyDescriptor(target, key);
}

function defineProperty(target, key, descriptor) {
  Object.defineProperty(target, key, descriptor);
  return target;
}

function createObject(prototype) {
  return Object.create(prototype);
}

function getPrototypeOf(target) {
  return Object.getPrototypeOf(target);
}

function freeze(target) {
  return Object.freeze(target);
}

function seal(target) {
  return Object.seal(target);
}

function preventExtensions(target) {
  return Object.preventExtensions(target);
}

function assign(target, source) {
  return Object.assign(target, source);
}

function createProxy(target, mode) {
  if (mode === 'precision7') {
    return new Proxy(target, {
      get: function (object, key) {
        return key === 'precision' ? 7 : object[key];
      },
    });
  }
  if (mode === 'undefined') {
    return new Proxy(target, {
      get: function () {
        return undefined;
      },
    });
  }
  if (mode === 'throw') {
    return new Proxy(target, {
      get: function () {
        throw new Error('proxy');
      },
    });
  }
  return new Proxy(target, {});
}

function nestedConfig(kind) {
  if (kind === 'nestedA') return { precision: 5, nested: { a: 1 } };
  if (kind === 'deepX') return { toExpNeg: -4, deep: { level2: { x: 1 } } };
  if (kind === 'nestedPrecision') return { precision: 5, nested: { precision: 8 } };
  if (kind === 'invalidPrecision') return { precision: {} };
  if (kind === 'precisionA') return { precision: { a: 1 } };
  if (kind === 'childConfig') return { config: { precision: 5 } };
  if (kind === 'cryptoObject') return { crypto: {} };
  if (kind === 'toExpPosObject') return { toExpPos: {} };
  if (kind === 'deepExtra') return { precision: 3, extra: { a: { b: 1 } } };
  if (kind === 'arrayLike') return { 0: 'x', length: 2, precision: 5 };
  return {};
}

function stringify(target) {
  return JSON.stringify(target);
}

function setUnsafe(decimal, config, extraArgument) {
  decimal.set(config, extraArgument);
}


function symbolMaxDenominatorThrows(decimal) {
  try {
    decimal.toFraction(Symbol('d'));
  } catch (error) {
    return true;
  }
  return false;
}


function invalidPrimitiveValuesThrow(decimalConstructor) {
  const values = [100n, BigInt('9007199254740991'), Symbol('invalid')];
  for (let i = 0; i < values.length; i++) {
    try {
      new decimalConstructor(values[i]);
      return false;
    } catch (error) {
      continue;
    }
  }
  return true;
}

module.exports = {
  DEFAULT_SLEEP_MS: DEFAULT_SLEEP_MS,
  sleep: sleep,
  getThrownCode: getThrownCode,
  throwsCode: throwsCode,
  throws: throws,
  resetDecimalConfig: resetDecimalConfig,
  createAfterEach: createAfterEach,
  createBigInt: createBigInt,
  createSymbol: createSymbol,
  deleteProperty: deleteProperty,
  hasProperty: hasProperty,
  hasOwnProperty: hasOwnProperty,
  objectKeys: objectKeys,
  enumerableKeyCount: enumerableKeyCount,
  ownPropertyNames: ownPropertyNames,
  ownPropertySymbols: ownPropertySymbols,
  ownPropertyDescriptor: ownPropertyDescriptor,
  defineProperty: defineProperty,
  createObject: createObject,
  getPrototypeOf: getPrototypeOf,
  freeze: freeze,
  seal: seal,
  preventExtensions: preventExtensions,
  assign: assign,
  createProxy: createProxy,
  nestedConfig: nestedConfig,
  stringify: stringify,
  setUnsafe: setUnsafe,
  symbolMaxDenominatorThrows: symbolMaxDenominatorThrows,
  invalidPrimitiveValuesThrow: invalidPrimitiveValuesThrow,
};
