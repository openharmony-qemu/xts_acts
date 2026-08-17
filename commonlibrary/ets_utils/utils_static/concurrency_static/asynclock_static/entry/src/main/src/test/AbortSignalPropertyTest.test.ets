'use static';
/*
 * Copyright (c) 2026 RKH Corp.
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

import { describe, it, expect, TestType, Level, Size } from '../../../hypium/index';
import { sleep } from './utils/utils';

interface CustomObject {
  id: number;
}

export default function AbortSignalPropertyTest(): void {
  // OpenHarmony AsyncLock AbortSignal: aborted/reason are public writable fields
  // (stdlib AsyncLockManager), not DOM-style read-only getters; assign directly in cases.
  describe('AbortSignalPropertyTest', (): void => {
    /**
     * @tc.name    testAbortSignalProperty0100
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_0100
     * @tc.desc    Verify property access requires no parameters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "Aborted";
      let aborted: boolean = signal.aborted;
      let reason: string = signal.reason;
      expect(aborted).assertFalse();
      expect(reason).assertEqual("Aborted");
    });

    /**
     * @tc.name    testAbortSignalProperty0200
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_0200
     * @tc.desc    Verify property access has no parameter types
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "Aborted";
      expect(signal.aborted).assertFalse();
      expect(signal.reason).assertEqual("Aborted");
    });

    /**
     * @tc.name    testAbortSignalProperty0300
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_0300
     * @tc.desc    Verify get aborted property
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "Aborted";
      expect(typeof signal.aborted).assertEqual("boolean");
    });

    /**
     * @tc.name    testAbortSignalProperty0400
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_0400
     * @tc.desc    Verify get reason property
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "Aborted";
      expect(signal.reason).assertEqual("Aborted");
    });

    /**
     * @tc.name    testAbortSignalProperty0500
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_0500
     * @tc.desc    Verify get all properties
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<number>();
      signal.aborted = false;
      signal.reason = 123;
      expect(signal.aborted).assertFalse();
      expect(signal.reason).assertEqual(123);
    });

    /**
     * @tc.name    testAbortSignalProperty0600
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_0600
     * @tc.desc    Verify property structure is correct
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<void>();
      signal.aborted = false;
      signal.reason = undefined;
      expect(signal.aborted).assertFalse();
      expect(signal.reason).assertUndefined();
    });

    /**
     * @tc.name    testAbortSignalProperty0700
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_0700
     * @tc.desc    Verify aborted is false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "test";
      expect(signal.aborted).assertFalse();
    });

    /**
     * @tc.name    testAbortSignalProperty0800
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_0800
     * @tc.desc    Verify aborted is true
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = true;
      signal.reason = "Cancelled";
      expect(signal.aborted).assertTrue();
    });

    /**
     * @tc.name    testAbortSignalProperty0900
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_0900
     * @tc.desc    Verify aborted initial value is false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      expect(signal.aborted).assertFalse();
    });

    /**
     * @tc.name    testAbortSignalProperty1000
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_1000
     * @tc.desc    Verify aborted dynamic modification
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAbortSignalProperty1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "test";
      signal.aborted = true;
      expect(signal.aborted).assertTrue();
    });

    /**
     * @tc.name    testAbortSignalProperty1100
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_1100
     * @tc.desc    Verify aborted multiple modifications
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAbortSignalProperty1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "test";
      signal.aborted = true;
      signal.aborted = false;
      signal.aborted = true;
      expect(signal.aborted).assertTrue();
    });

    /**
     * @tc.name    testAbortSignalProperty1200
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_1200
     * @tc.desc    Verify reason is string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "User cancelled";
      expect(signal.reason).assertEqual("User cancelled");
    });

    /**
     * @tc.name    testAbortSignalProperty1300
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_1300
     * @tc.desc    Verify reason is number
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<number>();
      signal.aborted = false;
      signal.reason = 123;
      expect(signal.reason).assertEqual(123);
    });

    /**
     * @tc.name    testAbortSignalProperty1400
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_1400
     * @tc.desc    Verify reason is undefined
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<void>();
      signal.aborted = false;
      signal.reason = undefined;
      expect(signal.reason).assertUndefined();
    });

    /**
     * @tc.name    testAbortSignalProperty1500
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_1500
     * @tc.desc    Verify reason is boolean
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<boolean>();
      signal.aborted = false;
      signal.reason = true;
      expect(signal.reason).assertTrue();
    });

    /**
     * @tc.name    testAbortSignalProperty1600
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_1600
     * @tc.desc    Verify reason is object
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<CustomObject>();
      signal.aborted = false;
      signal.reason = { id: 1 };
      expect(signal.reason.id).assertEqual(1);
    });

    /**
     * @tc.name    testAbortSignalProperty1700
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_1700
     * @tc.desc    Verify reason is empty string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "";
      expect(signal.reason).assertEqual("");
    });

    /**
     * @tc.name    testAbortSignalProperty1800
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_1800
     * @tc.desc    Verify reason with special strings
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal1 = new AbortSignal<string>();
      signal1.aborted = false;
      signal1.reason = "取消原因";
      let signal2 = new AbortSignal<string>();
      signal2.aborted = false;
      signal2.reason = "Cancelled 😀";
      expect(signal1.reason).assertEqual("取消原因");
      expect(signal2.reason).assertEqual("Cancelled 😀");
    });

    /**
     * @tc.name    testAbortSignalProperty1900
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_1900
     * @tc.desc    Verify reason dynamic modification
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAbortSignalProperty1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "initial";
      signal.reason = "new reason";
      expect(signal.reason).assertEqual("new reason");
    });

    /**
     * @tc.name    testAbortSignalProperty2000
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_2000
     * @tc.desc    Verify aborted type is boolean
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "test";
      expect(typeof signal.aborted).assertEqual("boolean");
    });

    /**
     * @tc.name    testAbortSignalProperty2100
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_2100
     * @tc.desc    Verify reason type is T
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal1 = new AbortSignal<string>();
      signal1.aborted = false;
      signal1.reason = "text";
      let signal2 = new AbortSignal<number>();
      signal2.aborted = false;
      signal2.reason = 100;
      expect(typeof signal1.reason).assertEqual("string");
      expect(typeof signal2.reason).assertEqual("number");
    });

    /**
     * @tc.name    testAbortSignalProperty2200
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_2200
     * @tc.desc    Verify aborted stays false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "test";
      expect(signal.aborted).assertFalse();
    });

    /**
     * @tc.name    testAbortSignalProperty2300
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_2300
     * @tc.desc    Verify aborted property is not undefined
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "test";
      expect(signal.aborted).not().assertUndefined();
    });

    /**
     * @tc.name    testAbortSignalProperty2400
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_2400
     * @tc.desc    Verify set aborted to false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = true;
      signal.reason = "test";
      signal.aborted = false;
      expect(signal.aborted).assertFalse();
    });

    /**
     * @tc.name    testAbortSignalProperty2500
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_2500
     * @tc.desc    Verify set reason to number
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<number>();
      signal.aborted = false;
      signal.reason = 0;
      signal.reason = 100;
      expect(signal.reason).assertEqual(100);
    });

    /**
     * @tc.name    testAbortSignalProperty2600
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_2600
     * @tc.desc    Verify set reason to object
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<CustomObject>();
      signal.aborted = false;
      signal.reason = { id: 0 };
      signal.reason = { id: 100 };
      expect(signal.reason.id).assertEqual(100);
    });

    /**
     * @tc.name    testAbortSignalProperty2700
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_2700
     * @tc.desc    Verify reason empty values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal1 = new AbortSignal<string>();
      signal1.aborted = false;
      signal1.reason = "";
      let signal2 = new AbortSignal<number>();
      signal2.aborted = false;
      signal2.reason = 0;
      expect(signal1.reason).assertEqual("");
      expect(signal2.reason).assertEqual(0);
    });

    /**
     * @tc.name    testAbortSignalProperty2800
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_2800
     * @tc.desc    Verify reason is not optional
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "test";
      expect(signal.reason).assertEqual("test");
    });

    /**
     * @tc.name    testAbortSignalProperty2900
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_2900
     * @tc.desc    Verify reason can be modified
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "initial";
      signal.reason = "modified";
      expect(signal.reason).assertEqual("modified");
    });

    /**
     * @tc.name    testAbortSignalProperty3000
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_3000
     * @tc.desc    Verify generic T is string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "text";
      expect(typeof signal.reason).assertEqual("string");
    });

    /**
     * @tc.name    testAbortSignalProperty3100
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_3100
     * @tc.desc    Verify generic T is number
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<number>();
      signal.aborted = false;
      signal.reason = 100;
      expect(typeof signal.reason).assertEqual("number");
    });

    /**
     * @tc.name    testAbortSignalProperty3200
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_3200
     * @tc.desc    Verify generic T is void
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<void>();
      signal.aborted = false;
      signal.reason = undefined;
      expect(signal.reason).assertUndefined();
    });

    /**
     * @tc.name    testAbortSignalProperty3300
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_3300
     * @tc.desc    Verify generic T is boolean
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<boolean>();
      signal.aborted = false;
      signal.reason = true;
      expect(typeof signal.reason).assertEqual("boolean");
    });

    /**
     * @tc.name    testAbortSignalProperty3400
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_3400
     * @tc.desc    Verify generic T is custom object
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<CustomObject>();
      signal.aborted = false;
      signal.reason = { id: 1 };
      expect(typeof signal.reason).assertEqual("object");
    });

    /**
     * @tc.name    testAbortSignalProperty3500
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_3500
     * @tc.desc    Verify generic T is array type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<number[]>();
      signal.aborted = false;
      signal.reason = [1, 2, 3];
      expect(Array.isArray(signal.reason)).assertTrue();
    });

    /**
     * @tc.name    testAbortSignalProperty3600
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_3600
     * @tc.desc    Verify generic T is union type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let stringSignal = new AbortSignal<string | number>();
      stringSignal.aborted = false;
      stringSignal.reason = "text";
      let numberSignal = new AbortSignal<string | number>();
      numberSignal.aborted = false;
      numberSignal.reason = 100;
      expect(stringSignal.reason).assertEqual("text");
      expect(numberSignal.reason).assertEqual(100);
    });

    /**
     * @tc.name    testAbortSignalProperty3700
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_3700
     * @tc.desc    Verify aborted is not affected by generic
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal1 = new AbortSignal<string>();
      signal1.aborted = false;
      signal1.reason = "";
      let signal2 = new AbortSignal<number>();
      signal2.aborted = false;
      signal2.reason = 0;
      expect(typeof signal1.aborted).assertEqual("boolean");
      expect(typeof signal2.aborted).assertEqual("boolean");
    });

    /**
     * @tc.name    testAbortSignalProperty3800
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_3800
     * @tc.desc    Verify aborted false plus reason set
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "Waiting";
      expect(signal.aborted).assertFalse();
      expect(signal.reason).assertEqual("Waiting");
    });

    /**
     * @tc.name    testAbortSignalProperty3900
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_3900
     * @tc.desc    Verify aborted true plus reason set
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = true;
      signal.reason = "Cancelled";
      expect(signal.aborted).assertTrue();
      expect(signal.reason).assertEqual("Cancelled");
    });

    /**
     * @tc.name    testAbortSignalProperty4000
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_4000
     * @tc.desc    Verify dynamic modification combination
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAbortSignalProperty4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "initial";
      signal.aborted = true;
      signal.reason = "User cancelled";
      expect(signal.aborted).assertTrue();
      expect(signal.reason).assertEqual("User cancelled");
    });

    /**
     * @tc.name    testAbortSignalProperty4100
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_4100
     * @tc.desc    Verify create AsyncLockOptions using AbortSignal
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAbortSignalProperty4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s = new AbortSignal<string>();
      s.aborted = false;
      s.reason = "Aborted";
      let options = new AsyncLockOptions<string>();
      options.signal = s;
      expect(options.signal!.aborted).assertFalse();
      expect(options.signal!.reason).assertEqual("Aborted");
    });

    /**
     * @tc.name    testAbortSignalProperty4200
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_4200
     * @tc.desc    Verify user proactively cancel the operation
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAbortSignalProperty4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "test";
      signal.aborted = true;
      signal.reason = "User clicked cancel button";
      expect(signal.aborted).assertTrue();
    });

    /**
     * @tc.name    testAbortSignalProperty4300
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_4300
     * @tc.desc    Verify aborted property remains stable after repeated access
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAbortSignalProperty4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "test";
      for (let i = 0; i < 1000; i++) {
        expect(signal.aborted).assertFalse();
      }
    });

    /**
     * @tc.name    testAbortSignalProperty4400
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_4400
     * @tc.desc    Verify reason property remains stable after repeated access
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAbortSignalProperty4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "test";
      let val: string = "";
      for (let i = 0; i < 1000; i++) {
        val = signal.reason;
      }
      expect(val).assertEqual("test");
      expect(signal.reason).assertEqual("test");
    });

    /**
     * @tc.name    testAbortSignalProperty4500
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_4500
     * @tc.desc    Verify aborted repeated modification keeps final value stable
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAbortSignalProperty4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "test";
      for (let i = 0; i < 1000; i++) {
        signal.aborted = true;
        signal.aborted = false;
      }
      expect(signal.aborted).assertFalse();
    });

    /**
     * @tc.name    testAbortSignalProperty4600
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_4600
     * @tc.desc    Verify AbortSignal aborted and reason properties accessible
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = true;
      signal.reason = "Cancelled";
      expect(signal.aborted).assertTrue();
      expect(signal.reason).assertEqual("Cancelled");
    });

    /**
     * @tc.name    testAbortSignalProperty4700
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_4700
     * @tc.desc    Verify JSON serialization includes field values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = true;
      signal.reason = "test";
      let json = JSON.stringify(signal);
      expect(json).assertContain('"aborted"');
      expect(json).assertContain('"reason"');
      expect(json).assertContain('"test"');
    });

    /**
     * @tc.name    testAbortSignalProperty4800
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_4800
     * @tc.desc    Verify all properties accessible
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "test";
      expect(signal.aborted).assertFalse();
      expect(signal.reason).assertEqual("test");
    });

    /**
     * @tc.name    testAbortSignalProperty4900
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_4900
     * @tc.desc    Verify boolean only has true or false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal1 = new AbortSignal<string>();
      signal1.aborted = true;
      signal1.reason = "test";
      let signal2 = new AbortSignal<string>();
      signal2.aborted = false;
      signal2.reason = "test";
      expect(signal1.aborted).assertTrue();
      expect(signal2.aborted).assertFalse();
    });

    /**
     * @tc.name    testAbortSignalProperty5000
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_5000
     * @tc.desc    Verify property modification does not affect other properties
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "initial";
      signal.aborted = true;
      expect(signal.reason).assertEqual("initial");
    });

    /**
     * @tc.name    testAbortSignalProperty5100
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_5100
     * @tc.desc    Verify aborted stays false after local property init
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "test";
      expect(signal.aborted).assertFalse();
    });

    /**
     * @tc.name    testAbortSignalProperty5200
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_5200
     * @tc.desc    Verify aborted false and reason persistence after initialization
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string>();
      signal.aborted = false;
      signal.reason = "test";
      expect(signal.aborted).assertFalse();
      expect(signal.reason).assertEqual("test");
    });

    /**
     * @tc.name    testAbortSignalProperty5300
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_5300
     * @tc.desc    Verify set reason to Number.MAX_VALUE
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<number>();
      signal.aborted = false;
      signal.reason = Number.MAX_VALUE;
      expect(signal.reason).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.name    testAbortSignalProperty5400
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_5400
     * @tc.desc    Verify set reason to NaN
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<number>();
      signal.aborted = false;
      signal.reason = NaN;
      expect(signal.reason).assertNaN();
    });

    /**
     * @tc.name    testAbortSignalProperty5500
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_5500
     * @tc.desc    Verify reason is null when generic T allows null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAbortSignalProperty5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let signal = new AbortSignal<string | null>();
      signal.aborted = false;
      signal.reason = null;
      expect(signal.reason).assertNull();
      expect(signal.aborted).assertFalse();
    });

    /**
     * @tc.name    testAbortSignalProperty5600
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_5600
     * @tc.desc    Verify reason can be set to null from non-null value when generic allows null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAbortSignalProperty5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let signal = new AbortSignal<string | null>();
      signal.aborted = false;
      signal.reason = "test";
      signal.reason = null;
      expect(signal.reason).assertNull();
      expect(signal.aborted).assertFalse();
    });

    /**
     * @tc.name    testAbortSignalProperty5700
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_5700
     * @tc.desc    Verify lock request cancelled dynamically by setting signal aborted true
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAbortSignalProperty5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let s = new AbortSignal<string>();
        s.aborted = false;
        s.reason = "test";
        let options = new AsyncLockOptions<string>();
        options.signal = s;
        let executed: boolean = false;
        let holder = lock.lockAsync<void>(
          (): Promise<void> => {
          try {
            return sleep(200);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        let p = lock.lockAsync<void, string>(
          () => {
          executed = true;
        }, AsyncLockMode.EXCLUSIVE, options);
        s.aborted = true;
        s.reason = "User cancelled";
        let rejected: boolean = false;
        try {
          await p;
        } catch (error) {
          rejected = true;
        }
        expect(rejected).assertTrue();
        expect(executed).assertFalse();
        await holder;
        done();
      } catch (error) {
        console.error("testAbortSignalProperty5700 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAbortSignalProperty5800
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_5800
     * @tc.desc    Verify waiting lock request cancelled via AbortSignal and lock still usable
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAbortSignalProperty5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let s = new AbortSignal<string>();
        s.aborted = false;
        s.reason = "User cancelled";
        let options = new AsyncLockOptions<string>();
        options.signal = s;
        let holder = lock.lockAsync<void>(
          (): Promise<void> => {
          try {
            return sleep(200);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        let p = lock.lockAsync<void, string>(
          () => {
        }, AsyncLockMode.EXCLUSIVE, options);
        let pendingCount: number = lock.query().pending.length;
        expect(pendingCount).assertLarger(0);
        s.aborted = true;
        let rejected: boolean = false;
        try {
          await p;
        } catch (error) {
          rejected = true;
        }
        expect(rejected).assertTrue();
        await holder;
        let reacquired: boolean = false;
        await lock.lockAsync<void>(
          () => {
          try {
            reacquired = true;
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        expect(reacquired).assertTrue();
        done();
      } catch (error) {
        console.error("testAbortSignalProperty5800 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAbortSignalProperty5900
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_5900
     * @tc.desc    Verify setting aborted true before cancellation rejects one request only
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAbortSignalProperty5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let s1 = new AbortSignal<string>();
        s1.aborted = false;
        s1.reason = "first";
        let s2 = new AbortSignal<string>();
        s2.aborted = false;
        s2.reason = "second";
        let options1 = new AsyncLockOptions<string>();
        options1.signal = s1;
        let options2 = new AsyncLockOptions<string>();
        options2.signal = s2;
        let holder = lock.lockAsync<void>(
          (): Promise<void> => {
          try {
            return sleep(200);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        let secondExecuted: boolean = false;
        let p1: Promise<void> = lock.lockAsync<void, string>(
          () => {
          try {
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.EXCLUSIVE, options1);
        let p2: Promise<void> = lock.lockAsync<void, string>(
          () => {
          try {
            secondExecuted = true;
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.EXCLUSIVE, options2);
        s1.aborted = true;
        let firstRejected: boolean = false;
        try {
          await p1;
        } catch (error) {
          firstRejected = true;
        }
        expect(firstRejected).assertTrue();
        expect(secondExecuted).assertFalse();
        await holder;
        await p2;
        expect(secondExecuted).assertTrue();
        done();
      } catch (error) {
        console.error("testAbortSignalProperty5900 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAbortSignalProperty6000
     * @tc.number  SUB_ABORT_SIGNAL_PROPERTY_TEST_6000
     * @tc.desc    Verify timeout auto cancels pending request by setting signal aborted true
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAbortSignalProperty6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let s = new AbortSignal<string>();
        s.aborted = false;
        s.reason = "";
        let options = new AsyncLockOptions<string>();
        options.signal = s;
        let holder: Promise<void> = lock.lockAsync<void>(
          (): Promise<void> => {
          try {
            return sleep(300);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        let p: Promise<void> = lock.lockAsync<void, string>(
          () => {
          try {
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.EXCLUSIVE, options);
        let timeoutElapsed: Promise<void> = (async (): Promise<void> => {
          try {
            await sleep(100);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
          s.aborted = true;
          s.reason = "Timeout exceeded";
        })();
        await timeoutElapsed;
        expect(s.aborted).assertTrue();
        expect(s.reason).assertEqual("Timeout exceeded");
        let rejected: boolean = false;
        try {
          await p;
        } catch (error) {
          rejected = true;
        }
        expect(rejected).assertTrue();
        await holder;
        done();
      } catch (error) {
        console.error("testAbortSignalProperty6000 failed");
        expect(false).assertFail();
        done();
      }
    });

  });
}
