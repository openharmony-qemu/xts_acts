'use static'
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
import { DeepTypeUtils } from './deepEquals/DeepTypeUtils';

function matchesTypeName(actualType: string, expectType: string): boolean {
  if (actualType === expectType) {
    return true;
  }
  if (actualType.toLowerCase() === expectType.toLowerCase()) {
    return true;
  }
  // Class.of().getName() may return a qualified name (e.g. pkg.MyClass).
  const parts = actualType.split('.');
  const simpleName = parts[parts.length - 1];
  return simpleName === expectType || simpleName.toLowerCase() === expectType.toLowerCase();
}

function resolveTypeName(actualValue: HypiumValue): string {
  const builtinType = DeepTypeUtils.getType(actualValue);
  if (builtinType !== 'Object') {
    return builtinType;
  }
  if (actualValue === null || typeof actualValue !== 'object') {
    return builtinType;
  }
  try {
    return Class.of(actualValue as object).getName();
  } catch (e) {
    return builtinType;
  }
}

export function assertInstanceOf(actualValue: HypiumValue, expected: string[]): AssertResult {
  if (expected.length === 0) {
    return {
      pass: false,
      message: 'expected type array is empty',
    };
  }
  const expectType = expected[0];
  // Any non-null object matches expectType 'Object' (including arrays / custom classes).
  if (expectType === 'Object' && actualValue !== null && typeof actualValue === 'object') {
    return {
      pass: true,
      message: '',
    };
  }
  const actualType = resolveTypeName(actualValue);
  const pass = matchesTypeName(actualType, expectType);
  return {
    pass,
    message: pass ? '' : `${String(actualValue)} is not  ${expectType}`,
  };
}
