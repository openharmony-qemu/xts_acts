/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class Neg<T extends number> {
  constructor (x: T) {}
}

class Pos<T extends number> {
  constructor (x: T) {}
}

namespace testNS1_1 {
  function foo(v: Object | undefined | null): void {
    expect(v instanceof Object || v === undefined).assertTrue()
  }
  function f1(v: Object | undefined): number {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: Object | undefined): number {
    if (v === undefined) {
      expect(v).assertEqual(undefined)
      return 1
    }
    else {
      expect(v instanceof Object || v === undefined).assertTrue()
      expect(v instanceof Object || v === undefined || v === null).assertTrue()
      foo(v)
      expect(v).assertEqual(5n)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(undefined)
    expect(res).assertEqual(1)
    res = f1(5n)
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS2_1 {
  function foo(v: Any): void {
    expect(v instanceof Object || v === undefined).assertTrue()
  }
  function f1(v: Object | undefined): number {
    expect(v instanceof Object || v === undefined).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: Object | undefined): number {
    if (v === undefined) {
      expect(v).assertEqual(undefined)
      return 1
    }
    else {
      expect(v instanceof Object || v === undefined).assertTrue()
      expect(v instanceof Object).assertTrue()
      foo(v)
      expect(v).assertEqual(10.7)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(undefined)
    expect(res).assertEqual(1)
    res = f1(10.7)
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS3_1 {
  function foo(v: Object | undefined | Any): void {
    expect(v instanceof Object || v === undefined).assertTrue()
  }
  function f1(v: Object | undefined): number {
    expect(v instanceof Object || v === undefined).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: Object | undefined): number {
    if (v === undefined) {
      expect(v).assertEqual(undefined)
      return 1
    }
    else {
      expect(v instanceof Object || v === undefined).assertTrue()
      expect(v instanceof Object || v === undefined).assertTrue()
      foo(v)
      expect(v).assertEqual("abc")
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(undefined)
    expect(res).assertEqual(1)
    res = f1("abc")
    expect(res).assertEqual(2)
    return true
  }
}

function foo_1(v: Object | undefined | null): void {
  expect(v === undefined || v === null || v instanceof Object).assertTrue()
}
function f1_1(v: Object | undefined): number {
  expect(v instanceof Object || v === undefined || v === null).assertTrue()
  foo_1(v)
  return f2_1(v)
}
function f2_1(v: Object | undefined): number {
  if (v === undefined) {
    expect(v).assertEqual(undefined)
    return 1
  }
  else {
    expect(v instanceof Object || v === undefined).assertTrue()
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    foo_1(v)
    expect(v).assertEqual(5n)
    return 2
  }
}

namespace testNS1_2 {
  function foo(v: Object | undefined | null): void {
    expect(v === undefined || v === null || v instanceof Object).assertTrue()
  }
  function f1(v: Object | undefined): number {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: Object | undefined): number {
    if (typeof v === 'bigint' || v === undefined) {
      expect(v).assertEqual(undefined)
      return 1
    }
    else {
      expect(v instanceof Object || v === undefined).assertTrue()
      expect(v instanceof Object || v === undefined || v === null).assertTrue()
      foo(v)
      expect(v).assertEqual(7)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(undefined)
    expect(res).assertEqual(1)
    res = f1(7)
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS2_2 {
  function foo(v: Any): void {
    expect(v instanceof Object || v === undefined).assertTrue()
  }
  function f1(v: Object | undefined): number {
    expect(v instanceof Object).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: Object | undefined): number {
    if (typeof v === 'bigint' || v === undefined) {
      expect(v).assertEqual(5n)
      return 1
    }
    else {
      expect(v instanceof Object || v === undefined).assertTrue()
      expect(v instanceof Object).assertTrue()
      foo(v)
      expect(v).assertEqual(10.7)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(5n)
    expect(res).assertEqual(1)
    res = f1(10.7)
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS3_2 {
  function foo(v: Object | undefined | Any): void {
    expect(v instanceof Object || v === undefined).assertTrue()
  }
  function f1(v: Object | undefined): number {
    expect(v instanceof Object || v === undefined).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: Object | undefined): number {
    if (typeof v === 'bigint' || v === undefined) {
      expect(v).assertEqual(123n)
      return 1
    }
    else {
      expect(v instanceof Object || v === undefined).assertTrue()
      expect(v instanceof Object || v === undefined).assertTrue()
      foo(v)
      expect(v).assertEqual("abc")
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(123n)
    expect(res).assertEqual(1)
    res = f1("abc")
    expect(res).assertEqual(2)
    return true
  }
}

function foo_2(v: Object | undefined | null): void {
  expect(v === undefined || v === null || v instanceof Object).assertTrue()
}
function f1_2(v: Object | undefined): number {
  expect(v instanceof Object || v === undefined || v === null).assertTrue()
  foo_2(v)
  return f2_2(v)
}
function f2_2(v: Object | undefined): number {
  if (typeof v === 'bigint' || v === undefined) {
    expect(v).assertEqual(undefined)
    return 1
  }
  else {
    expect(v instanceof Object || v === undefined).assertTrue()
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    foo_2(v)
    expect(v).assertEqual(7)
    return 2
  }
}

namespace testNS1_3 {
  function foo(v: Any): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
  }
  function f1(v: Object | undefined | null): number {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: Object | undefined | null): number {
    if (v === undefined) {
      expect(v).assertEqual(undefined)
      return 1
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue()
      expect(v instanceof Object).assertTrue()
      foo(v)
      expect(v).assertEqual(5n)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(undefined)
    expect(res).assertEqual(1)
    res = f1(5n)
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS2_3 {
  function foo(v: Object | undefined | Any): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
  }
  function f1(v: Object | undefined | null): number {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: Object | undefined | null): number {
    if (v === undefined) {
      expect(v).assertEqual(undefined)
      return 1
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue()
      expect(v instanceof Object || v === undefined || v === null).assertTrue()
      foo(v)
      expect(v).assertEqual(null)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(undefined)
    expect(res).assertEqual(1)
    res = f1(null)
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS3_3 {
  function foo(v: Object | Any | undefined): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
  }
  function f1(v: Object | undefined | null): number {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: Object | undefined | null): number {
    if (v === undefined) {
      expect(v).assertEqual(undefined)
      return 1
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue()
      expect(v instanceof Object || v === undefined).assertTrue()
      foo(v)
      expect(v).assertEqual(10.7)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(undefined)
    expect(res).assertEqual(1)
    res = f1(10.7)
    expect(res).assertEqual(2)
    return true
  }
}

function foo_3(v: Any): void {
  expect(v instanceof Object || v === undefined || v === null).assertTrue()
}
function f1_3(v: Object | undefined | null): number {
  expect(v instanceof Object || v === undefined).assertTrue()
  foo_3(v)
  return f2_3(v)
}
function f2_3(v: Object | undefined | null): number {
  if (v === undefined) {
    expect(v).assertEqual(undefined)
    return 1
  }
  else {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    expect(v instanceof Object).assertTrue()
    foo_3(v)
    expect(v).assertEqual(5n)
    return 2
  }
}

namespace testNS1_4 {
  function foo(v: Any): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
  }
  function f1(v: Object | undefined | null): number {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: Object | undefined | null): number {
    if (v === null) {
      expect(v).assertEqual(null)
      return 1
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue()
      expect(v instanceof Object || v === undefined || v === null).assertTrue()
      foo(v)
      expect(v).assertEqual(5n)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(null)
    expect(res).assertEqual(1)
    res = f1(5n)
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS2_4 {
  function foo(v: Object | undefined | Any): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
  }
  function f1(v: Object | undefined | null): number {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: Object | undefined | null): number {
    if (v === null) {
      expect(v).assertEqual(null)
      return 1
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue()
      expect(v instanceof Object || v === undefined || v === null).assertTrue()
      foo(v)
      expect(v).assertEqual(undefined)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(null)
    expect(res).assertEqual(1)
    res = f1(undefined)
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS3_4 {
  function foo(v: Object | null | undefined): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
  }
  function f1(v: Object | undefined | null): number {
    expect(v instanceof Object || v === null || v === undefined).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: Object | undefined | null): number {
    if (v === null) {
      expect(v).assertEqual(null)
      return 1
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue()
      expect(v instanceof Object || v === null || v === undefined).assertTrue()
      foo(v)
      expect(v).assertEqual(10.7)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(null)
    expect(res).assertEqual(1)
    res = f1(10.7)
    expect(res).assertEqual(2)
    return true
  }
}

function foo_4(v: Any): void {
  expect(v instanceof Object || v === undefined || v === null).assertTrue()
}
function f1_4(v: Object | undefined | null): number {
  expect(v instanceof Object || v === undefined || v === null).assertTrue()
  foo_4(v)
  return f2_4(v)
}
function f2_4(v: Object | undefined | null): number {
  if (v === null) {
    expect(v).assertEqual(null)
    return 1
  }
  else {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    expect(v instanceof Object).assertTrue()
    foo_4(v)
    expect(v).assertEqual(5n)
    return 2
  }
}

namespace testNS1_5 {
  function foo(v: Any): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
  }
  function f1(v: Object | undefined | null): number {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: Object | undefined | null): number {
    if (v === undefined || v === null) {
      expect(v).assertEqual(null)
      return 1
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue()
      expect(v instanceof Object || v === undefined || v === null).assertTrue()
      foo(v)
      expect(v).assertEqual(5n)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(null)
    expect(res).assertEqual(1)
    res = f1(5n)
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS2_5 {
  function foo(v: Object | undefined | Any): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
  }
  function f1(v: Object | undefined | null): number {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: Object | undefined | null): number {
    if (v === undefined || v === null) {
      expect(v).assertEqual(undefined)
      return 1
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue()
      expect(v instanceof Object || v === undefined || v === null).assertTrue()
      foo(v)
      expect(v).assertEqual("abc")
      return 2
    }
  }
  export function runTest(): boolean {
    let res: number = f1(undefined)
    expect(res).assertEqual(1)
    res = f1("abc")
    expect(res).assertEqual(2)
    return true
  }
}
namespace testNS3_5 {
  function foo(v: Object | null | undefined): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
  }
  function f1(v: Object | undefined | null): number {
    expect(v instanceof Object || v === null || v === undefined).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: Object | undefined | null): number {
    if (v === undefined || v === null) {
      expect(v).assertEqual(null)
      return 1
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue()
      expect(v instanceof Object || v === null || v === undefined).assertTrue()
      foo(v)
      expect(v).assertEqual(10.7)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(null)
    expect(res).assertEqual(1)
    res = f1(10.7)
    expect(res).assertEqual(2)
    return true
  }
}

function foo_5(v: Any): void {
  expect(v instanceof Object || v === undefined || v === null).assertTrue()
}
function f1_5(v: Object | undefined | null): number {
  expect(v instanceof Object || v === undefined || v === null).assertTrue()
  foo_5(v)
  return f2_5(v)
}
function f2_5(v: Object | undefined | null): number {
  if (v === undefined || v === null) {
    expect(v).assertEqual(null)
    return 1
  }
  else {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    expect(v instanceof Object).assertTrue()
    foo_5(v)
    expect(v).assertEqual(5n)
    return 2
  }
}

namespace testNS1_6 {
  function foo(v: Any): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
  }
  function f1(v: Object | undefined | null): number {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: Object | undefined | null): number {
    if (typeof v === 'bigint' || v === undefined || v === null) {
      expect(v).assertEqual(null)
      return 1
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue()
      expect(v instanceof Object).assertTrue()
      foo(v)
      expect(v).assertEqual(5)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(null)
    expect(res).assertEqual(1)
    res = f1(5)
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS2_6 {
  function foo(v: Object | undefined | Any): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
  }
  function f1(v: Object | undefined | null): number {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: Object | undefined | null): number {
    if (typeof v === 'bigint' || v === undefined || v === null) {
      expect(v).assertEqual(undefined)
      return 1
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue()
      expect(v instanceof Object || v === undefined || v === null).assertTrue()
      foo(v)
      expect(v).assertEqual("abc")
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(undefined)
    expect(res).assertEqual(1)
    res = f1("abc")
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS3_6 {
  function foo(v: Object | null | undefined): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
  }
  function f1(v: Object | undefined | null): number {
    expect(v instanceof Object || v === null || v === undefined).assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: Object | undefined | null): number {
    if (typeof v === 'bigint' || v === undefined || v === null) {
      expect(v).assertEqual(5n)
      return 1
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue()
      expect(v instanceof Object || v === null || v === undefined).assertTrue()
      foo(v)
      expect(v).assertEqual(10.7)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(5n)
    expect(res).assertEqual(1)
    res = f1(10.7)
    expect(res).assertEqual(2)
    return true
  }
}

function foo_6(v: Any): void {
  expect(v instanceof Object || v === undefined || v === null).assertTrue()
}
function f1_6(v: Object | undefined | null): number {
  expect(v instanceof Object || v === undefined || v === null).assertTrue()
  foo_6(v)
  return f2_6(v)
}
function f2_6(v: Object | undefined | null): number {
  if (typeof v === 'bigint' || v === undefined || v === null) {
    expect(v).assertEqual(null)
    return 1
  }
  else {
    expect(v instanceof Object || v === undefined || v === null).assertTrue()
    expect(v instanceof Object).assertTrue()
    foo_6(v)
    expect(v).assertEqual(5)
    return 2
  }
}

namespace testNS1_7 {
  function foo(v: number | boolean): void {
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
  }
  function f1(v: number | boolean): number {
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: number | boolean): number {
    if (typeof v === 'boolean') {
      expect(v).assertEqual(true)
      return 1
    }
    else {
      expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
      expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
      foo(v)
      expect(v).assertEqual(5)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(true)
    expect(res).assertEqual(1)
    res = f1(5)
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS2_7 {
  function foo(v: number | boolean): void {
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
  }
  function f1(v: number | boolean): number {
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: number | boolean): number {
    if (typeof v === 'boolean') {
      expect(v).assertEqual(true)
      return 1
    }
    else {
      expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
      expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
      foo(v)
      expect(v).assertEqual(-7)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(true)
    expect(res).assertEqual(1)
    res = f1(-7)
    expect(res).assertEqual(2)
    return true
  }
}

function foo_7(v: number | boolean): void {
  expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
}
function f1_7(v: number | boolean): number {
  expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
  foo_7(v)
  return f2_7(v)
}
function f2_7(v: number | boolean): number {
  if (typeof v === 'boolean') {
    expect(v).assertEqual(true)
    return 1
  }
  else {
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
    foo_7(v)
    expect(v).assertEqual(5)
    return 2
  }
}

namespace testNS1_8 {
  function foo(v: number | boolean): void {
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
  }
  function f1(v: number | boolean): number {
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: number | boolean): number {
    if (typeof v === 'number') {
      expect(v).assertEqual(5)
      return 1
    }
    else {
      expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
      expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
      foo(v)
      expect(v).assertEqual(true)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(5)
    expect(res).assertEqual(1)
    res = f1(true)
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS2_8 {
  function foo(v: number | boolean): void {
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
  }
  function f1(v: number | boolean): number {
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: number | boolean): number {
    if (typeof v === 'number') {
      expect(v).assertEqual(-7)
      return 1
    }
    else {
      expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
      expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
      foo(v)
      expect(v).assertEqual(true)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(-7)
    expect(res).assertEqual(1)
    res = f1(true)
    expect(res).assertEqual(2)
    return true
  }
}

function foo_8(v: number | boolean): void {
  expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
}
function f1_8(v: number | boolean): number {
  expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
  foo_8(v)
  return f2_8(v)
}
function f2_8(v: number | boolean): number {
  if (typeof v === 'number') {
    expect(v).assertEqual(5)
    return 1
  }
  else {
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
    expect(typeof v === 'number' || typeof v === 'boolean').assertTrue()
    foo_8(v)
    expect(v).assertEqual(true)
    return 2
  }
}

namespace testNS1_9 {
  function foo(v: number | boolean | string | number): void {
    expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
  }
  function f1(v: number | string | boolean): number {
    expect(typeof v === 'number' || typeof v === 'boolean' || typeof v === 'string').assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: number | string | boolean): number {
    if (typeof v === 'string') {
      expect(v).assertEqual("abc")
      return 1
    }
    else {
      expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
      expect(typeof v === 'number' || typeof v === 'boolean' || typeof v === 'string').assertTrue()
      foo(v)
      expect(v).assertEqual(5)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1("abc")
    expect(res).assertEqual(1)
    res = f1(5)
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS2_9 {
  function foo(v: Any): void {
    expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
  }
  function f1(v: number | string | boolean): number {
    expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: number | string | boolean): number {
    if (typeof v === 'string') {
      expect(v).assertEqual("cab")
      return 1
    }
    else {
      expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
      foo(v)
      expect(v).assertEqual(false)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1("cab")
    expect(res).assertEqual(1)
    res = f1(false)
    expect(res).assertEqual(2)
    return true
  }
}

function foo_9(v: number | boolean | string | number): void {
  expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
}
function f1_9(v: number | string | boolean): number {
  expect(typeof v === 'number' || typeof v === 'boolean' || typeof v === 'string').assertTrue()
  foo_9(v)
  return f2_9(v)
}
function f2_9(v: number | string | boolean): number {
  if (typeof v === 'string') {
    expect(v).assertEqual("abc")
    return 1
  }
  else {
    expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
    expect(typeof v === 'number' || typeof v === 'boolean' || typeof v === 'string').assertTrue()
    foo_9(v)
    expect(v).assertEqual(5)
    return 2
  }
}

namespace testNS1_10 {
  function foo(v: number | string | boolean | string): void {
    expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
  }
  function f1(v: number | string | boolean): number {
    expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: number | string | boolean): number {
    if (typeof v === 'string' || typeof v === 'boolean') {
      expect(v).assertEqual("abc")
      return 1
    }
    else {
      expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
      expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
      foo(v)
      expect(v).assertEqual(5)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1("abc")
    expect(res).assertEqual(1)
    res = f1(5)
    expect(res).assertEqual(2)
    return true
  }
}

namespace testNS2_10 {
  function foo(v: number | boolean | string | number): void {
    expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
  }
  function f1(v: number | string | boolean): number {
    expect(typeof v === 'number' || typeof v === 'boolean' || typeof v === 'string').assertTrue()
    foo(v)
    return f2(v)
  }
  function f2(v: number | string | boolean): number {
    if (typeof v === 'string' || typeof v === 'boolean') {
      expect(v).assertEqual(false)
      return 1
    }
    else {
      expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
      expect(typeof v === 'number' || typeof v === 'boolean' || typeof v === 'string').assertTrue()
      foo(v)
      expect(v).assertEqual(7)
      return 2
    }
  }

  export function runTest(): boolean {
    let res: number = f1(false)
    expect(res).assertEqual(1)
    res = f1(7)
    expect(res).assertEqual(2)
    return true
  }
}

function foo_10(v: number | string | boolean | string): void {
  expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
}
function f1_10(v: number | string | boolean): number {
  expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
  foo_10(v)
  return f2_10(v)
}
function f2_10(v: number | string | boolean): number {
  if (typeof v === 'string' || typeof v === 'boolean') {
    expect(v).assertEqual("abc")
    return 1
  }
  else {
    expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
    expect(typeof v === 'number' || typeof v === 'string' || typeof v === 'boolean').assertTrue()
    foo_10(v)
    expect(v).assertEqual(5)
    return 2
  }
}

namespace testNS1_11 {
  function foo(v: Object | undefined | null): void {
    expect(v === undefined || v === null || v instanceof Object).assertTrue();
  }
  function f1(v: Object | undefined | null): number {
    if (v instanceof Object || v === undefined || v === null) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: Object | undefined | null): number {
    if (v === undefined) {
      expect(v).assertEqual(undefined);
      return 1;
    }
    else {
      expect(v instanceof Object || v === undefined).assertTrue();
      expect(v instanceof Object || v === undefined || v === null).assertTrue();
      foo(v);
      expect(v).assertEqual(5n);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(undefined);
    expect(res).assertEqual(1);
    res = f1(5n);
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_11 {
  function foo(v: Any): void {
    expect(v instanceof Object || v === undefined).assertTrue();
  }
  function f1(v: Object | undefined): number {
    if (v instanceof Object || v === undefined) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: Object | undefined): number {
    if (v === undefined) {
      expect(v).assertEqual(undefined);
      return 1;
    }
    else {
      expect(v instanceof Object || v === undefined).assertTrue();
      foo(v);
      expect(v).assertEqual(10.7);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(undefined);
    expect(res).assertEqual(1);
    res = f1(10.7);
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_11 {
  function foo(v: Object | undefined | Any): void {
    expect(v instanceof Object || v === undefined).assertTrue();
  }
  function f1(v: Object | undefined): number {
    if (v instanceof Object || v === undefined) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: Object | undefined): number {
    if (v === undefined) {
      expect(v).assertEqual(undefined);
      return 1;
    }
    else {
      expect(v instanceof Object || v === undefined).assertTrue();
      expect(v instanceof Object || v === undefined).assertTrue();
      foo(v);
      expect(v).assertEqual("abc");
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(undefined);
    expect(res).assertEqual(1);
    res = f1("abc");
    expect(res).assertEqual(2);
    return true;
  }
}

function foo_11(v: Object | undefined | null): void {
  expect(v === undefined || v === null || v instanceof Object).assertTrue();
}
function f1_11(v: null | Object | undefined): number {
  if (v instanceof Object || v === undefined || v === null) {
    foo_11(v);
    return f2_11(v);
  }
  else {
    return 0;
  }
}
function f2_11(v: null | Object | undefined): number {
  if (v === undefined) {
    expect(v).assertEqual(undefined);
    return 1;
  }
  else {
    expect(v instanceof Object || v === undefined).assertTrue();
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
    foo_11(v);
    expect(v).assertEqual(5n);
    return 2;
  }
}

namespace testNS1_12 {
  function foo(v: Object | undefined | null): void {
    expect(v === undefined || v === null || v instanceof Object).assertTrue();
  }
  function f1(v: Object | undefined | null): number {
    if (v instanceof Object || v === undefined || v === null) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: Object | undefined | null): number {
    if (typeof v === 'bigint' || v === undefined) {
      expect(v).assertEqual(undefined);
      return 1;
    }
    else {
      expect(v instanceof Object || v === undefined).assertTrue();
      expect(v instanceof Object || v === undefined || v === null).assertTrue();
      foo(v);
      expect(v).assertEqual(7);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(undefined);
    expect(res).assertEqual(1);
    res = f1(7);
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_12 {
  function foo(v: Any): void {
    expect(v instanceof Object || v === undefined).assertTrue();
  }
  function f1(v: Object | undefined): number {
    if (v) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: Object | undefined): number {
    if (typeof v === 'bigint' || v === undefined) {
      expect(v).assertEqual(5n);
      return 1;
    }
    else {
      expect(v instanceof Object || v === undefined).assertTrue();
      foo(v);
      expect(v).assertEqual(10.7);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(5n);
    expect(res).assertEqual(1);
    res = f1(10.7);
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_12 {
  function foo(v: Object | undefined | Any): void {
    expect(v instanceof Object || v === undefined).assertTrue();
  }
  function f1(v: Object | undefined): number {
    if (v instanceof Object || v === undefined) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: Object | undefined): number {
    if (typeof v === 'bigint' || v === undefined) {
      expect(v).assertEqual(123n);
      return 1;
    }
    else {
      expect(v instanceof Object || v === undefined).assertTrue();
      expect(v instanceof Object || v === undefined).assertTrue();
      foo(v);
      expect(v).assertEqual("abc");
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(123n);
    expect(res).assertEqual(1);
    res = f1("abc");
    expect(res).assertEqual(2);
    return true;
  }
}

function foo_12(v: Object | undefined | null): void {
  expect(v === undefined || v === null || v instanceof Object).assertTrue();
}
function f1_12(v: null | Object | undefined): number {
  if (v instanceof Object || v === undefined || v === null) {
    foo_12(v);
    return f2_12(v);
  }
  else {
    return 0;
  }
}
function f2_12(v: null | Object | undefined): number {
  if (typeof v === 'bigint' || v === undefined) {
    expect(v).assertEqual(undefined);
    return 1;
  }
  else {
    expect(v instanceof Object || v === undefined).assertTrue();
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
    foo_12(v);
    expect(v).assertEqual(7);
    return 2;
  }
}

namespace testNS1_13 {
  function foo(v: Any): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
  }
  function f1(v: Object | undefined | null): number {
    if (v instanceof Object || v === undefined) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: Object | undefined | null): number {
    if (v === undefined) {
      expect(v).assertEqual(undefined);
      return 1;
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue();
      foo(v);
      expect(v).assertEqual(5n);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(undefined);
    expect(res).assertEqual(1);
    res = f1(5n);
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_13 {
  function foo(v: Object | undefined | Any): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
  }
  function f1(v: Object | undefined | null): number {
    if (v instanceof Object || v === undefined) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: Object | undefined | null): number {
    if (v === undefined) {
      expect(v).assertEqual(undefined);
      return 1;
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue();
      expect(v instanceof Object || v === undefined).assertTrue();
      foo(v);
      expect(v).assertEqual(null);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(undefined);
    expect(res).assertEqual(1);
    res = f1(null);
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_13 {
  function foo(v: Object | Any | undefined): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
  }
  function f1(v: Object | undefined | null): number {
    if (v instanceof Object || v === undefined) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: Object | undefined | null): number {
    if (v === undefined) {
      expect(v).assertEqual(undefined);
      return 1;
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue();
      expect(v instanceof Object || v === undefined).assertTrue();
      foo(v);
      expect(v).assertEqual(10.7);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(undefined);
    expect(res).assertEqual(1);
    res = f1(10.7);
    expect(res).assertEqual(2);
    return true;
  }
}

function foo_13(v: Any): void {
  expect(v instanceof Object || v === undefined || v === null).assertTrue();
}

function f1_13(v: Object | undefined | null): number {
  if (v instanceof Object || v === undefined || v === null) {
    foo_13(v);
    return f2_13(v);
  }
  return 0;
}

function f2_13(v: Object | undefined | null): number {
  if (v === undefined) {
    expect(v).assertEqual(undefined);
    return 1;
  }
  else {
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
    foo_13(v);
    expect(v).assertEqual(5n);
    return 2;
  }
}

namespace testNS1_14 {
  function foo(v: Any): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
  }
  function f1(v: Object | undefined | null): number {
    if (v) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: Object | undefined | null): number {
    if (v === null) {
      expect(v).assertEqual(null);
      return 1;
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue();
      foo(v);
      expect(v).assertEqual(5n);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(null);
    expect(res).assertEqual(1);
    res = f1(5n);
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_14 {
  function foo(v: Object | undefined | Any): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
  }
  function f1(v: Object | undefined | null): number {
    if (v instanceof Object || v === undefined) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: Object | undefined | null): number {
    if (v === null) {
      expect(v).assertEqual(null);
      return 1;
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue();
      expect(v instanceof Object || v === undefined).assertTrue();
      foo(v);
      expect(v).assertEqual(undefined);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(null);
    expect(res).assertEqual(1);
    res = f1(undefined);
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_14 {
  function foo(v: Object | null | undefined): void {
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
  }
  function f1(v: Object | undefined | null): number {
    if (v instanceof Object || v === null || v === undefined) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: Object | undefined | null): number {
    if (v === null) {
      expect(v).assertEqual(null);
      return 1;
    }
    else {
      expect(v instanceof Object || v === undefined || v === null).assertTrue();
      expect(v instanceof Object || v === null || v === undefined).assertTrue();
      foo(v);
      expect(v).assertEqual(10.7);
      return 2;
    }
  }

  export function runTest(): boolean {
    let res: number = f1(null);
    expect(res).assertEqual(1);
    res = f1(10.7);
    expect(res).assertEqual(2);
    return true;
  }
}

function foo_14(v: Any): void {
  expect(v instanceof Object || v === undefined || v === null).assertTrue();
}
function f1_14(v: Object | undefined | null): number {
  if (v instanceof Object || v === undefined || v === null) {
    foo_14(v);
    return f2_14(v);
  }
  else {
    return 0;
  }
}
function f2_14(v: Object | undefined | null): number {
  if (v === null) {
    expect(v).assertEqual(null);
    return 1;
  }
  else {
    expect(v instanceof Object || v === undefined || v === null).assertTrue();
    foo_14(v);
    expect(v).assertEqual(5n);
    return 2;
  }
}

export default function DiffTypeIsSubOfTypeTOnPredefinedTest(): void {
  describe('DiffTypeIsSubOfTypeTOnPredefinedTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0100
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0001
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnPredefined0001';
      let res: number = f1_1(undefined);
      expect(res).assertEqual(1);
      res = f1_1(5n);
      expect(res).assertEqual(2);
      expect(testNS1_1.runTest()).assertEqual(true);
      expect(testNS2_1.runTest()).assertEqual(true);
      expect(testNS3_1.runTest()).assertEqual(true);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0200
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0002
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnPredefined0002';
      let res: number = f1_2(undefined);
      expect(res).assertEqual(1);
      res = f1_2(7);
      expect(res).assertEqual(2);
      expect(testNS1_2.runTest()).assertEqual(true);
      expect(testNS2_2.runTest()).assertEqual(true);
      expect(testNS3_2.runTest()).assertEqual(true);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0300
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0003
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnPredefined0003';
      let res: number = f1_3(undefined);
      expect(res).assertEqual(1);
      res = f1_3(5n);
      expect(res).assertEqual(2);
      expect(testNS1_3.runTest()).assertEqual(true);
      expect(testNS2_3.runTest()).assertEqual(true);
      expect(testNS3_3.runTest()).assertEqual(true);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0400
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0004
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnPredefined0004';
      let res: number = f1_4(null);
      expect(res).assertEqual(1);
      res = f1_4(5n);
      expect(res).assertEqual(2);
      expect(testNS1_4.runTest()).assertEqual(true);
      expect(testNS2_4.runTest()).assertEqual(true);
      expect(testNS3_4.runTest()).assertEqual(true);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0500
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0005
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnPredefined0005';
      let res: number = f1_5(null);
      expect(res).assertEqual(1);
      res = f1_5(5n);
      expect(res).assertEqual(2);
      expect(testNS1_5.runTest()).assertEqual(true);
      expect(testNS2_5.runTest()).assertEqual(true);
      expect(testNS3_5.runTest()).assertEqual(true);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0600
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0006
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnPredefined0006';
      let res: number = f1_6(null);
      expect(res).assertEqual(1);
      res = f1_6(5);
      expect(res).assertEqual(2);
      expect(testNS1_6.runTest()).assertEqual(true);
      expect(testNS2_6.runTest()).assertEqual(true);
      expect(testNS3_6.runTest()).assertEqual(true);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0700
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0007
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnPredefined0007';
      let res: number = f1_7(true);
      expect(res).assertEqual(1);
      res = f1_7(5);
      expect(res).assertEqual(2);
      expect(testNS1_7.runTest()).assertEqual(true);
      expect(testNS2_7.runTest()).assertEqual(true);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0800
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0008
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnPredefined0008';
      let res: number = f1_8(5);
      expect(res).assertEqual(1);
      res = f1_8(true);
      expect(res).assertEqual(2);
      expect(testNS1_8.runTest()).assertEqual(true);
      expect(testNS2_8.runTest()).assertEqual(true);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_0900
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0009
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnPredefined0009';

      let res: number = f1_9("abc");
      expect(res).assertEqual(1);
      res = f1_9(5);
      expect(res).assertEqual(2);

      expect(testNS1_9.runTest()).assertEqual(true);
      expect(testNS2_9.runTest()).assertEqual(true);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_1000
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0010
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnPredefined0010';

      let res: number = f1_10("abc");
      expect(res).assertEqual(1);
      res = f1_10(5);
      expect(res).assertEqual(2);
      expect(testNS1_10.runTest()).assertEqual(true);
      expect(testNS2_10.runTest()).assertEqual(true);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_1100
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0011
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnPredefined0011';
      let res: number = f1_11(undefined);
      expect(res).assertEqual(1);
      res = f1_11(5n);
      expect(res).assertEqual(2);
      expect(testNS1_11.runTest()).assertEqual(true);
      expect(testNS2_11.runTest()).assertEqual(true);
      expect(testNS3_11.runTest()).assertEqual(true);
    });
    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_PREDEFINED_1200
     * @tc.name      testDiffTypeIsSubOfTypeTOnPredefined0012
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on predefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnPredefined0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnPredefined0012';
      let res: number = f1_12(undefined);
      expect(res).assertEqual(1);
      res = f1_12(7);
      expect(res).assertEqual(2);
      expect(testNS1_12.runTest()).assertEqual(true);
      expect(testNS2_12.runTest()).assertEqual(true);
      expect(testNS3_12.runTest()).assertEqual(true);
    });
  })
}