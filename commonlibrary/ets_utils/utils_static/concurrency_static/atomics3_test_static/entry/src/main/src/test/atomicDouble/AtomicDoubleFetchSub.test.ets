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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

class RateLimiter {
  private quota: AtomicDouble;

  constructor(initialQuota: number) {
    this.quota = new AtomicDouble(initialQuota);
  }

  consume(amount: number): number {
    return this.quota.fetchSub(amount);
  }

  getQuota(): number {
    return this.quota.load();
  }
}

export default function atomicDoubleFetchSubTest():void {
  describe('atomicDoubleFetchSubTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicDoubleFetchSubTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_SUB_TEST_0100
     * @tc.desc   Verify AtomicDouble.fetchSub() with required parameter returns old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleFetchSubTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicDouble = new AtomicDouble(10.0);
      let oldValue = atomicDouble.fetchSub(2.5);
      expect(oldValue).assertEqual(10.0);
      expect(atomicDouble.load()).assertEqual(7.5);
    });

    /**
     * @tc.name   atomicDoubleFetchSubTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_SUB_TEST_0200
     * @tc.desc   Verify AtomicDouble.fetchSub() returns the value before subtraction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleFetchSubTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicDouble = new AtomicDouble(20.5);
      let oldValue = atomicDouble.fetchSub(5.5);
      expect(oldValue).assertEqual(20.5);
      expect(atomicDouble.load()).assertEqual(15.0);
    });

    /**
     * @tc.name   atomicDoubleFetchSubTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_SUB_TEST_0300
     * @tc.desc   Verify AtomicDouble.fetchSub() implements rate limiter quota decrement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleFetchSubTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let limiter = new RateLimiter(100.0);
      let oldQuota = limiter.consume(10.5);
      expect(oldQuota).assertEqual(100.0);
      expect(limiter.getQuota()).assertEqual(89.5);
    });

    /**
     * @tc.name   atomicDoubleFetchSubTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_SUB_TEST_0400
     * @tc.desc   Verify AtomicDouble.fetchSub() with negative value increases the value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleFetchSubTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(5.5);
      let oldValue = atomicDouble.fetchSub(-2.5);
      expect(oldValue).assertEqual(5.5);
      expect(atomicDouble.load()).assertEqual(8.0);
    });

    /**
     * @tc.name   atomicDoubleFetchSubTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_SUB_TEST_0500
     * @tc.desc   Verify AtomicDouble.fetchSub() with zero value returns old value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleFetchSubTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(3.5);
      let oldValue = atomicDouble.fetchSub(0.0);
      expect(oldValue).assertEqual(3.5);
      expect(atomicDouble.load()).assertEqual(3.5);
    });

    /**
     * @tc.name   atomicDoubleFetchSubTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_SUB_TEST_0600
     * @tc.desc   Verify AtomicDouble.fetchSub() with very small decimal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleFetchSubTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(0.003);
      let oldValue = atomicDouble.fetchSub(0.001);
      expect(oldValue).assertEqual(0.003);
      expect(atomicDouble.load()).assertEqual(0.002);
    });

    /**
     * @tc.name   atomicDoubleFetchSubTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_SUB_TEST_0700
     * @tc.desc   Verify AtomicDouble.fetchSub() with very large value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleFetchSubTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(1e10);
      let oldValue = atomicDouble.fetchSub(1e5);
      expect(oldValue).assertEqual(1e10);
      expect(atomicDouble.load()).assertEqual(1e10 - 1e5);
    });

    /**
     * @tc.name   atomicDoubleFetchSubTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_SUB_TEST_0800
     * @tc.desc   Verify AtomicDouble.fetchSub() multiple calls accumulate correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleFetchSubTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let counter = new AtomicDouble(10.0);
      let oldValue1 = counter.fetchSub(1.5);
      expect(oldValue1).assertEqual(10.0);
      let oldValue2 = counter.fetchSub(2.5);
      expect(oldValue2).assertEqual(8.5);
      let oldValue3 = counter.fetchSub(3.5);
      expect(oldValue3).assertEqual(6.0);
      expect(counter.load()).assertEqual(2.5);
    });

    /**
     * @tc.name   atomicDoubleFetchSubTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_SUB_TEST_0900
     * @tc.desc   Verify AtomicDouble.fetchSub() with Infinity value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleFetchSubTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(Infinity);
      let oldValue = atomicDouble.fetchSub(1.5);
      expect(oldValue).assertEqual(Infinity);
      expect(atomicDouble.load()).assertEqual(Infinity);
    });

    /**
     * @tc.name   atomicDoubleFetchSubTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_SUB_TEST_1000
     * @tc.desc   Verify AtomicDouble.fetchSub() with negative Infinity value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleFetchSubTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(-Infinity);
      let oldValue = atomicDouble.fetchSub(1.5);
      expect(oldValue).assertEqual(-Infinity);
      expect(atomicDouble.load()).assertEqual(-Infinity);
    });

    /**
     * @tc.name   atomicDoubleFetchSubTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_SUB_TEST_1100
     * @tc.desc   Verify AtomicDouble.fetchSub() independent instances do not affect each other
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicDoubleFetchSubTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let counter1 = new AtomicDouble(10.0);
      let counter2 = new AtomicDouble(20.0);
      let oldValue1 = counter1.fetchSub(1.5);
      expect(oldValue1).assertEqual(10.0);
      expect(counter1.load()).assertEqual(8.5);
      expect(counter2.load()).assertEqual(20.0);
      let oldValue2 = counter2.fetchSub(2.5);
      expect(oldValue2).assertEqual(20.0);
      expect(counter2.load()).assertEqual(17.5);
      expect(counter1.load()).assertEqual(8.5);
    });

    /**
     * @tc.name   atomicDoubleFetchSubTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_SUB_TEST_1200
     * @tc.desc   Verify AtomicDouble.fetchSub() with NaN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleFetchSubTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(10.5);
      let oldValue = atomicDouble.fetchSub(NaN);
      expect(oldValue).assertEqual(10.5);
      expect(Number.isNaN(atomicDouble.load())).assertTrue();
    });

    /**
     * @tc.name   atomicDoubleFetchSubTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_SUB_TEST_1300
     * @tc.desc   Verify AtomicDouble.fetchSub() with Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleFetchSubTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(10.5);
      let oldValue = atomicDouble.fetchSub(Number.MIN_VALUE);
      expect(oldValue).assertEqual(10.5);
      expect(atomicDouble.load()).assertEqual(10.5 - Number.MIN_VALUE);
    });

    /**
     * @tc.name   atomicDoubleFetchSubTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_SUB_TEST_1400
     * @tc.desc   Verify AtomicDouble.fetchSub() with Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleFetchSubTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(-Number.MAX_VALUE);
      let oldValue = atomicDouble.fetchSub(Number.MAX_VALUE);
      expect(oldValue).assertEqual(-Number.MAX_VALUE);
      let result = atomicDouble.load();
      expect(Number.isFinite(result)).assertFalse();
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.name   atomicDoubleFetchSubTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_DOUBLE_FETCH_SUB_TEST_1500
     * @tc.desc   Verify AtomicDouble.fetchSub() with Number.EPSILON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('atomicDoubleFetchSubTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicDouble = new AtomicDouble(10.5);
      let oldValue = atomicDouble.fetchSub(Number.EPSILON);
      expect(oldValue).assertEqual(10.5);
      expect(atomicDouble.load()).assertEqual(10.5 - Number.EPSILON);
    });
  });
}
