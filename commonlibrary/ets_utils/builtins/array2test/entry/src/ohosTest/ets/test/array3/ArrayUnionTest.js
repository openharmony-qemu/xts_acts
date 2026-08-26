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

class ArrayClassItem {
  constructor(id, label) {
    this.id = id;
    this.label = label;
  }
}

const UNION_CLASS_VALUE = new ArrayClassItem(Number.MAX_SAFE_INTEGER, '测试😀');
const UNION_DATE_VALUE = new Date(NaN);
/** @param {number} value @returns {number} */
const UNION_FUNCTION_VALUE = (value) => value * value;
const UNION_MAP_VALUE = new Map([['\u200B', -1]]);
const UNION_SET_VALUE = new Set([NaN, Infinity]);
const UNION_NESTED_VALUE = [NaN, Infinity];
const UNION_OBJECT_VALUE = {
  id: Number.MIN_SAFE_INTEGER,
  label: '\u200B',
  name: '测试😀',
  extra: Number.MAX_VALUE,
};
const UNION_REGEXP_VALUE = /[\u0000-\u001F]/g;

export function getUnionSymbol() {
  return Symbol.iterator;
}

export function getAtZero(values) {
  return values.at(-0);
}
