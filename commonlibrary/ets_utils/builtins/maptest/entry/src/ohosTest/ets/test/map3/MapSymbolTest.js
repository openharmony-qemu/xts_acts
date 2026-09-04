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

const MAP_SYMBOL_A = Symbol('map-test');
const MAP_SYMBOL_B = Symbol.for('map-global-key');
const MAP_SYMBOL_C = Symbol.iterator;
const MAP_SYMBOL_D = Symbol();
const MAP_SYMBOL_E = Symbol.for('');
const MAP_SYMBOL_F = Symbol('map-id');
const MAP_SYMBOL_VALID_VALUES = [
  MAP_SYMBOL_A, MAP_SYMBOL_B, MAP_SYMBOL_C, MAP_SYMBOL_D, MAP_SYMBOL_E, MAP_SYMBOL_F, MAP_SYMBOL_A,
];

export function getMapSymbolValidValues() {
  return MAP_SYMBOL_VALID_VALUES;
}
