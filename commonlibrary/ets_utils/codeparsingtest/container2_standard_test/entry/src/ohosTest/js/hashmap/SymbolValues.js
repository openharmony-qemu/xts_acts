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

const SYMBOL_A = Symbol('test');
const SYMBOL_B = Symbol.for('globalKey');
const SYMBOL_C = Symbol.iterator;
const SYMBOL_D = Symbol();
const SYMBOL_E = Symbol.for('');
const SYMBOL_F = Symbol('id');
const SYMBOL_KEY_FOR_RESULT = Symbol.keyFor(Symbol('test'));

export {
  SYMBOL_A,
  SYMBOL_B,
  SYMBOL_C,
  SYMBOL_D,
  SYMBOL_E,
  SYMBOL_F,
  SYMBOL_KEY_FOR_RESULT,
};
