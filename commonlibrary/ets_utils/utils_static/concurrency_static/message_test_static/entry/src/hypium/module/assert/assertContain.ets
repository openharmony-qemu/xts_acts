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
  for (const field of reflect.getInstanceFieldsRecursive(Class.of(expectObj))) {
    const key = field.getName();
    if (!DeepTypeUtils.has(actualObj, key)) {
      return false;
    }
    const actualField = Class.of(actualObj).getInstanceField(key);
    if (actualField === null) {
      return false;
    }
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
    if (!eq(actualFieldValue as Object, expectFieldValue as Object)) {
      return false;
    }
  }
  return true;
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
