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

module.exports = {
  createSymbol,
  deleteProperty,
  hasProperty,
  hasOwnProperty,
  objectKeys,
  enumerableKeyCount,
  ownPropertyNames,
  ownPropertySymbols,
  ownPropertyDescriptor,
  defineProperty,
  createObject,
  getPrototypeOf,
  freeze,
  seal,
  preventExtensions,
  assign,
  createProxy,
  nestedConfig,
  stringify,
  setUnsafe,
};
