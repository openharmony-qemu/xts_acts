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

export default function AsyncLockNamePropertyTest(): void {
  describe('AsyncLockNamePropertyTest', (): void => {

    /**
     * @tc.name    testAsyncLockNameProperty0100
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_0100
     * @tc.desc    Verify attribute access without parameters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockNameProperty0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      let name: string = lock.name;
      expect(typeof name).assertEqual('string');
    });

    /**
     * @tc.name    testAsyncLockNameProperty0200
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_0200
     * @tc.desc    Verify name property of lock created by request
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lockName = 'testLockName';
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual(lockName);
    });

    /**
     * @tc.name    testAsyncLockNameProperty0300
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_0300
     * @tc.desc    Verify name attribute contains special characters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lockName = 'lock_with_special_chars!@#$';
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual(lockName);
    });

    /**
     * @tc.name    testAsyncLockNameProperty0400
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_0400
     * @tc.desc    Verify name attribute contains Unicode characters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lockName = '测试锁_中文名称';
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual(lockName);
    });

    /**
     * @tc.name    testAsyncLockNameProperty0500
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_0500
     * @tc.desc    Verify name attribute contains emoji
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lockName = 'lock_emoji😀';
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual(lockName);
    });

    /**
     * @tc.name    testAsyncLockNameProperty0600
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_0600
     * @tc.desc    Verify name attribute is very long string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lockName = 'a'.repeat(1000);
      let lock = AsyncLock.request(lockName);
      expect(lock.name.length).assertEqual(1000);
    });

    /**
     * @tc.name    testAsyncLockNameProperty0700
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_0700
     * @tc.desc    Verify name attribute contains whitespace
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lockName = ' lock_name_with_spaces ';
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual(lockName);
    });

    /**
     * @tc.name    testAsyncLockNameProperty0800
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_0800
     * @tc.desc    Verify name attribute contains zero-width space
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lockName = 'lock\u200Bname';
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual(lockName);
    });

    /**
     * @tc.name    testAsyncLockNameProperty0900
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_0900
     * @tc.desc    Verify name attribute is not undefined
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockNameProperty0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lock = new AsyncLock();
      expect(typeof lock.name).assertEqual('string');
    });

    /**
     * @tc.name    testAsyncLockNameProperty1000
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_1000
     * @tc.desc    Verify name attribute is single character
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lockName = 'a';
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual('a');
    });

    /**
     * @tc.name    testAsyncLockNameProperty1100
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_1100
     * @tc.desc    Verify name attribute is numeric string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lockName = '123456';
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual('123456');
    });

    /**
     * @tc.name    testAsyncLockNameProperty1200
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_1200
     * @tc.desc    Verify name attribute contains hex string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lockName = '0x123_hex';
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual(lockName);
    });

    /**
     * @tc.name    testAsyncLockNameProperty1300
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_1300
     * @tc.desc    Verify name attribute is business format string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lockName = 'isAvailableLock';
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual("isAvailableLock");
    });

    /**
     * @tc.name    testAsyncLockNameProperty1400
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_1400
     * @tc.desc    Verify null object access name attribute throws exception
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let caught: boolean = false;
      let lock: AsyncLock | null = null;
      try {
        let name = lock!.name;
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockNameProperty1500
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_1500
     * @tc.desc    Verify name property value matches the requested lock name
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request("readOnlyTest");
      let name = lock.name;
      expect(name).assertEqual("readOnlyTest");
    });

    /**
     * @tc.name    testAsyncLockNameProperty1600
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_1600
     * @tc.desc    Verify different instances have independent name attributes
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock1 = AsyncLock.request('NameProperty1800_lock1');
      let lock2 = AsyncLock.request('NameProperty1800_lock2');
      expect(lock1.name).assertEqual('NameProperty1800_lock1');
      expect(lock2.name).assertEqual('NameProperty1800_lock2');
    });

    /**
     * @tc.name    testAsyncLockNameProperty1700
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_1700
     * @tc.desc    Verify same name request returns same instance
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock1 = AsyncLock.request('sameName');
      let lock2 = AsyncLock.request('sameName');
      expect(lock1 === lock2).assertTrue();
      expect(lock1.name).assertEqual(lock2.name);
    });

    /**
     * @tc.name    testAsyncLockNameProperty1800
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_1800
     * @tc.desc    Verify access name attribute in async function
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockNameProperty1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let getLockName = async (): Promise<string> => {
        let lock = AsyncLock.request('asyncLock');
        return lock.name;
      };
      let name = await getLockName();
      expect(name).assertEqual('asyncLock');

      } catch (error) {
        console.error("testAsyncLockNameProperty1800 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockNameProperty1900
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_1900
     * @tc.desc    Verify access name attribute in lockAsync callback
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockNameProperty1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = AsyncLock.request('callbackLock');
      const lockAsyncCallback1 = (): string => {
        try {
          return lock.name;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      let result: string = await lock.lockAsync<string>(
        lockAsyncCallback1);
      expect(result).assertEqual('callbackLock');

      } catch (error) {
        console.error("testAsyncLockNameProperty1900 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockNameProperty2000
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_2000
     * @tc.desc    Verify name attribute contains XSS string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lockName = '<script>alert(1)</script>';
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual(lockName);
    });

    /**
     * @tc.name    testAsyncLockNameProperty2100
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_2100
     * @tc.desc    Verify name attribute is Japanese string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lockName = 'テストロック';
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual(lockName);
    });

    /**
     * @tc.name    testAsyncLockNameProperty2200
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_2200
     * @tc.desc    Verify name attribute is Korean string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lockName = '테스트잠금';
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual(lockName);
    });

    /**
     * @tc.name    testAsyncLockNameProperty2300
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_2300
     * @tc.desc    Verify name attribute is Arabic string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lockName = 'الاختبار';
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual(lockName);
    });

    /**
     * @tc.name    testAsyncLockNameProperty2400
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_2400
     * @tc.desc    Verify name attribute contains escape characters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lockName = 'lock\\n\\t\\r';
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual(lockName);
    });

    /**
     * @tc.name    testAsyncLockNameProperty2500
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_2500
     * @tc.desc    Verify name attribute contains newline
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lockName = 'lock\nname';
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual(lockName);
    });

    /**
     * @tc.name    testAsyncLockNameProperty2600
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_2600
     * @tc.desc    Verify name attribute contains tab
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lockName = 'lock\tname';
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual(lockName);
    });

    /**
     * @tc.name    testAsyncLockNameProperty2700
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_2700
     * @tc.desc    Verify name attribute contains Unicode encoding format
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lockName = 'lock\u4e2d\u6587';
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual(lockName);
    });

    /**
     * @tc.name    testAsyncLockNameProperty2800
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_2800
     * @tc.desc    Verify name attribute contains illegal Unicode sequence
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lockName = 'lock\xFF\xFE';
      let lock = AsyncLock.request(lockName);
      expect(lock.name).assertEqual(lockName);
    });

    /**
     * @tc.name    testAsyncLockNameProperty2900
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_2900
     * @tc.desc    Verify multiple reads return consistent value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockNameProperty2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lock = AsyncLock.request('consistentName');
      let name1 = lock.name;
      let name2 = lock.name;
      expect(name1).assertEqual(name2);
    });

    /**
     * @tc.name    testAsyncLockNameProperty3000
     * @tc.number  SUB_ASYNCLOCK_NAME_PROPERTY_TEST_3000
     * @tc.desc    Verify concurrent multi-instance name attribute access
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockNameProperty3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lockNames = ['NameProperty3200_lock1', 'NameProperty3200_lock2', 'NameProperty3200_lock3'];
      let promises = lockNames.map(async (name): Promise<string> => {
        let lock = AsyncLock.request(name);
        return lock.name;
      });
      let results = await Promise.all(promises);
      expect(results[0]).assertEqual('NameProperty3200_lock1');
      expect(results[1]).assertEqual('NameProperty3200_lock2');
      expect(results[2]).assertEqual('NameProperty3200_lock3');

      } catch (error) {
        console.error("testAsyncLockNameProperty3000 failed");
        expect(false).assertFail();
      }
      done();
    });

  });
}
