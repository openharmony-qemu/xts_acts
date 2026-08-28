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

const SET_SYMBOL_A = Symbol('set-test');
const SET_SYMBOL_B = Symbol.for('set-global-key');
const SET_SYMBOL_C = Symbol.iterator;
const SET_SYMBOL_D = Symbol();
const SET_SYMBOL_E = Symbol.for('');
const SET_SYMBOL_F = Symbol('set-id');
const SET_SYMBOL_VALID_VALUES = [
  SET_SYMBOL_A, SET_SYMBOL_B, SET_SYMBOL_C, SET_SYMBOL_D, SET_SYMBOL_E, SET_SYMBOL_F, SET_SYMBOL_A,
];

export function getSetSymbolValidValues() {
  return SET_SYMBOL_VALID_VALUES;
}
