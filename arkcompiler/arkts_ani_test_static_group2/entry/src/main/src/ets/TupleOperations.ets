'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

function getMixedTuple(): [int, string, boolean, double] {
  return [42, 'hello', true, 3.14]
}

function getIntTuple(): [int, int, int] {
  return [10, 20, 30]
}

function getBoolTuple(): [boolean, boolean] {
  return [true, false]
}

function getDoubleTuple(): [double, double] {
  return [1.5, 2.5]
}

function getRefTuple(): [string, string] {
  return ['test', 'world']
}

function getAllPrimitiveTuple(): [boolean, byte, short, int, long, float, double] {
  return [true, 1 as byte, 2 as short, 3, 4 as long, 5.0 as float, 6.0]
}

function getTupleForSet(): [int, string] {
  return [0, '']
}
