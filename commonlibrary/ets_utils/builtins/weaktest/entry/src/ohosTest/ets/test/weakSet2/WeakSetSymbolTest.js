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
const WEAKSET_SYMBOL_A = Object(Symbol('weakset-test'));
const WEAKSET_SYMBOL_B = Object(Symbol.for('weakset-global-key'));
const WEAKSET_SYMBOL_C = Object(Symbol.iterator);
const WEAKSET_SYMBOL_D = Object(Symbol());
const WEAKSET_SYMBOL_E = Object(Symbol.for(''));
const WEAKSET_SYMBOL_F = Object(Symbol('weakset-id'));
const WEAKSET_SYMBOL_VALID_VALUES = [WEAKSET_SYMBOL_A, WEAKSET_SYMBOL_B, WEAKSET_SYMBOL_C, WEAKSET_SYMBOL_D, WEAKSET_SYMBOL_E, WEAKSET_SYMBOL_F, WEAKSET_SYMBOL_A];
export function getWeakSetSymbolValidValues() { return WEAKSET_SYMBOL_VALID_VALUES; }
