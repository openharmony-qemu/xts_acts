/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { expect } from '@ohos/hypium-dynamic';
import privacyComputation from '@ohos.security.privacyComputation';
import { HexToUint8Array, StringToUint8Array } from '../common/CommonUtils';

export const TARGET: Uint8Array = new Uint8Array([0x01, 0x02, 0x03]);
export const OTHER: Uint8Array = new Uint8Array([0x07, 0x08, 0x09]);
export const VALUE_A: Uint8Array = new Uint8Array([0xa1, 0xa2]);
export const VALUE_B: Uint8Array = new Uint8Array([0xb1, 0xb2, 0xb3]);
export const EXTRA_VALUE_CIPHER: Uint8Array = new Uint8Array([0xc1, 0xc2]);
export const PREHASHED_32: Uint8Array = new Uint8Array(32).fill(0x11);
export const PREHASHED_48: Uint8Array = new Uint8Array(48).fill(0x22);
export const PREHASHED_64: Uint8Array = new Uint8Array(64).fill(0x33);
export const INVALID_PREHASHED_33: Uint8Array = new Uint8Array(33).fill(0x44);
export const ABC: Uint8Array = StringToUint8Array('abc');
export const SHA256_ABC: Uint8Array = HexToUint8Array(
  'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad'
);

export interface ErrorLike {
  code?: number;
  message?: string;
}

export function buildProtocol(
  dataSetSize: privacyComputation.DataSetSize,
  protocolType: privacyComputation.ProtocolType
): privacyComputation.PrivacyProtocol {
  return {
    dataSetSize,
    protocolType
  };
}

export function buildTarget(
  elemData: Uint8Array,
  hashAlg?: privacyComputation.HashAlg
): privacyComputation.TargetElement {
  if (hashAlg === undefined) {
    return { elemData };
  }
  return { elemData, hashAlg };
}

export function buildElement(
  elemKey: Uint8Array,
  elemValue?: Uint8Array,
  hashAlg?: privacyComputation.HashAlg
): privacyComputation.Element {
  const element: privacyComputation.Element = { elemKey };
  if (elemValue !== undefined) {
    element.elemValue = elemValue;
  }
  if (hashAlg !== undefined) {
    element.hashAlg = hashAlg;
  }
  return element;
}

/**
 * Probe whether the device runs the open-source (software) privacyComputation implementation.
 *
 * NOTE: this is an async probe and must NOT be awaited from List.test.ets testsuite();
 * the entry function has to stay synchronous. Use it only inside a describe/beforeAll
 * (or an individual test case) when an API-probe based detection is really needed.
 *
 * @returns true when the capability is unavailable (probe throws), false otherwise
 */
export async function CheckSoftware(): Promise<boolean> {
  try {
    const protocol: privacyComputation.PrivacyProtocol = buildProtocol(
      privacyComputation.DataSetSize.SIZE_128,
      privacyComputation.ProtocolType.PIR_PROTOCOL
    );
    const targetElement: privacyComputation.TargetElement = buildTarget(
      TARGET,
      privacyComputation.HashAlg.SHA256
    );
    await privacyComputation.genPrivacyTarget(targetElement, protocol);
    return false;
  } catch (err) {
    return true;
  }
}

export function assertUint8ArrayEqual(actual: Uint8Array, expected: Uint8Array): void {
  expect(actual.length).assertEqual(expected.length);
  for (let i = 0; i < expected.length; i++) {
    expect(actual[i]).assertEqual(expected[i]);
  }
}

export function uint8ArrayEquals(actual: Uint8Array | undefined, expected: Uint8Array): boolean {
  if (actual === undefined || actual.length !== expected.length) {
    return false;
  }
  for (let i = 0; i < expected.length; i++) {
    if (actual[i] !== expected[i]) {
      return false;
    }
  }
  return true;
}
