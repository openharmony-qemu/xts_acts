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
const WEAKMAP_SYMBOL_A = Symbol('weakmap-test');
const WEAKMAP_SYMBOL_B = Symbol.for('weakmap-global-key');
const WEAKMAP_SYMBOL_C = Symbol.iterator;
const WEAKMAP_SYMBOL_D = Symbol();
const WEAKMAP_SYMBOL_E = Symbol.for('');
const WEAKMAP_SYMBOL_F = Symbol('weakmap-id');
const WEAKMAP_SYMBOL_VALID_VALUES = [WEAKMAP_SYMBOL_A, WEAKMAP_SYMBOL_B, WEAKMAP_SYMBOL_C, WEAKMAP_SYMBOL_D, WEAKMAP_SYMBOL_E, WEAKMAP_SYMBOL_F, WEAKMAP_SYMBOL_A];
export function getWeakMapSymbolValidValues() { return WEAKMAP_SYMBOL_VALID_VALUES; }
