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
import { eq } from './deepEquals/assertDeepEquals';
// Class / reflect are ArkTS static stdlib builtins (also used via DeepTypeUtils).
import { Class, reflect } from 'std/core';

function isPlainObject(value: HypiumValue): boolean {
  return value !== null
    && typeof value === 'object'
    && !Array.isArray(value)
    && DeepTypeUtils.getType(value) === 'Object';
}

function objectContains(actualObj: object, expectValue: HypiumValue): boolean {
  if (typeof expectValue === 'string') {
    // typeof does not narrow HypiumValue to string for DeepTypeUtils.has.
    const key: string = expectValue as string;
    return DeepTypeUtils.has(actualObj, key);
  }
  if (!isPlainObject(expectValue)) {
    return false;
  }
  const expectObj = expectValue as object;
  // Guard reflection failures (e.g. unsupported plain/dynamic objects) so the
  // assert framework returns false instead of throwing.
  try {
    const expectCls = Class.of(expectObj);
    const actualCls = Class.of(actualObj);
    for (const field of reflect.getInstanceFieldsRecursive(expectCls)) {
      const key = field.getName();
      if (!DeepTypeUtils.has(actualObj, key)) {
        return false;
      }
      const actualField = actualCls.getInstanceField(key);
      if (actualField === undefined) {
        return false;
      }
      const expectFieldValue = field.getValue(expectObj);
      const actualFieldValue = actualField.getValue(actualObj);
      if (actualFieldValue === null || actualFieldValue === undefined
        || expectFieldValue === null || expectFieldValue === undefined) {
        if (actualFieldValue !== expectFieldValue) {
          return false;
        }
        continue;
      }
      if (!eq(actualFieldValue as HypiumValue, expectFieldValue as HypiumValue)) {
        return false;
      }
    }
    return true;
  } catch (e) {
    return false;
  }
}

export function assertContain(actualValue: HypiumValue, expect: HypiumValue[]): AssertResult {
  if (expect.length === 0) {
    return {
      pass: false,
      message: 'expected array must contain at least one element',
    };
  }
  let result = false;
  const expectValue = expect[0];
  if (typeof actualValue === 'string' && typeof expectValue === 'string') {
    const acValue = actualValue as string;
    const epValue = expectValue as string;
    result = acValue.indexOf(epValue) >= 0;
  } else if (Array.isArray(actualValue)) {
    const acValue = actualValue as HypiumValue[];
    result = acValue.includes(expectValue);
  } else if (isPlainObject(actualValue)) {
    result = objectContains(actualValue as object, expectValue);
  }

  const formatValue = (v: HypiumValue): string => {
    if (v === null || v === undefined) {
      return String(v);
    }
    if (typeof v === 'object') {
      return JSON.stringify(v);
    }
    return String(v);
  };
  const failMsg = `assertContain fail: ${formatValue(actualValue)} does not contain ${formatValue(expectValue)}`;
  return {
    pass: result,
    message: result ? '' : failMsg,
  };
}
