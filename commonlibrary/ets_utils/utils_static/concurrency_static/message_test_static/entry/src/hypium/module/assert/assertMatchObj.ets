'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { AssertResult } from '../modal/assertModel';
import { HypiumValue } from '../types/common';
import { jsonx } from 'std/core';

const MAX_DEPTH = 10;

function matchJsonElement(actual: jsonx.JsonElement, expected: jsonx.JsonElement,
  path: string, depth: number): string | null {
  if (depth >= MAX_DEPTH) {
    return `maximum recursion depth ${MAX_DEPTH} exceeded at ${path}`;
  }

  const expectedArray = expected.tryAsArray();
  if (expectedArray !== undefined) {
    const actualArray = actual.tryAsArray();
    if (actualArray === undefined || actualArray.length !== expectedArray.length) {
      return `${path}: array length does not match`;
    }
    for (let i = 0; i < expectedArray.length; i++) {
      const mismatch = matchJsonElement(actualArray[i], expectedArray[i], `${path}[${i}]`, depth + 1);
      if (mismatch !== null) {
        return mismatch;
      }
    }
    return null;
  }

  try {
    for (const entry of expected) {
      const key = entry[0];
      const expectedValue = entry[1];
      const actualValue = actual.tryGetElement(key);
      if (actualValue === undefined) {
        return `${path}.${key}: property not found in actual object`;
      }
      const mismatch = matchJsonElement(actualValue, expectedValue, `${path}.${key}`, depth + 1);
      if (mismatch !== null) {
        return mismatch;
      }
    }
    return null;
  } catch (e) {
    const actualText = JSON.stringifyJsonElement(actual);
    const expectedText = JSON.stringifyJsonElement(expected);
    return actualText === expectedText ? null : `${path}: actual=${actualText}, expected=${expectedText}`;
  }
}

export function assertMatchObj(actualValue: HypiumValue, expected: HypiumValue[]): AssertResult {
  if (typeof actualValue !== 'object' || actualValue === null) {
    return {
      pass: false,
      message: 'expect actual value to be an object',
    };
  }
  if (expected.length === 0 || typeof expected[0] !== 'object' || expected[0] === null) {
    return {
      pass: false,
      message: 'expect expected value to be an object',
    };
  }

  try {
    const actualJson = JSON.parseJsonElement(JSON.stringify(actualValue));
    const expectedJson = JSON.parseJsonElement(JSON.stringify(expected[0]));
    const mismatch = matchJsonElement(actualJson, expectedJson, '$', 0);
    return {
      pass: mismatch === null,
      message: mismatch === null ? '' : `object does not match expected structure: ${mismatch}`,
    };
  } catch (e) {
    const detail = e instanceof Error ? e.message : String(e);
    return {
      pass: false,
      message: `object comparison failed: ${detail}`,
    };
  }
}
