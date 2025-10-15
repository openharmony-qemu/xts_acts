import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ArkTSUtils, collections, taskpool, worker } from '@kit.ArkTS';
import { sleep } from './utils';


@Concurrent
async function printArgs(args: number) {
  await sleep(args)
  if (taskpool.Task.isCanceled()) {
    return true
  }
  return;
}

export default function concurrencyReturnCoveredTest() {
  describe('concurrencyReturnCoveredTest', () => {
    afterEach(async () => {
      await sleep(10)
    })

    /**
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_TEST_0101
     * @tc.name concurrencyReturnCoveredTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let func = () => {
      }
      let result = ArkTSUtils.isSendable(func)
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_TEST_0102
     * @tc.name concurrencyReturnCoveredTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let lru = new ArkTSUtils.SendableLruCache<string, number>()
      const result = lru.keys().length;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number.number SUB_CONCURRENCY_RETURN_COVERED_TEST_0103
     * @tc.name concurrencyReturnCoveredTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let lru = new ArkTSUtils.SendableLruCache<string, number>()
      const result = lru.values().length;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_TEST_0104
     * @tc.name concurrencyReturnCoveredTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = ArkTSUtils.ASON.parse('null')
      expect(result).assertEqual(null);
    });

    /**
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_TEST_0105
     * @tc.name concurrencyReturnCoveredTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let bit = new collections.BitVector(0)
      const result = bit.push(Number.MAX_VALUE + 1);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_TEST_0106
     * @tc.name concurrencyReturnCoveredTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Float32Array(2)
      arr.fill(2)
      const result = arr.includes(2);
      const result2 = arr.includes(-1, 0);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_RETURN_COVERED_TEST_0107
     * @tc.name concurrencyReturnCoveredTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Float32Array(2)
      const result = arr.at(3);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0108
     * @tc.name concurrencyReturnCoveredTest008
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arrayLike = [-10, 20, -30, 40, -50];
      let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike);

      const result = float32Array.some((element: number) => element < 0);
      const result2 = float32Array.some((element: number) => element < -100);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0109
     * @tc.name concurrencyReturnCoveredTest009
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arrayLike = [-10, 20, -30, 40, -50];
      let float32Array: collections.Float32Array = new collections.Float32Array(arrayLike);

      const result = float32Array.every((element: number) => element < 50);
      const result2 = float32Array.every((element: number) => element < -100);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0110
     * @tc.name concurrencyReturnCoveredTest010
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Uint32Array(2)
      arr.fill(2)
      const result = arr.includes(2);
      const result2 = arr.includes(-1, 0);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0111
     * @tc.name concurrencyReturnCoveredTest011
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Uint32Array(2)
      const result = arr.at(3);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0112
     * @tc.name concurrencyReturnCoveredTest012
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arrayLike = [10, 20, 30, 40, 50];
      let array: collections.Uint32Array = new collections.Uint32Array(arrayLike);

      const result = array.some((element: number) => element < 30);
      const result2 = array.some((element: number) => element < 10);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0113
     * @tc.name concurrencyReturnCoveredTest013
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arrayLike = [10, 20, 30, 40, 50];
      let array: collections.Uint32Array = new collections.Uint32Array(arrayLike);

      const result = array.every((element: number) => element < 60);
      const result2 = array.every((element: number) => element < 10);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0114
     * @tc.name concurrencyReturnCoveredTest014
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Int32Array(2)
      arr.fill(2)
      const result = arr.includes(2);
      const result2 = arr.includes(-1, 0);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0115
     * @tc.name concurrencyReturnCoveredTest015
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Int32Array(2)
      const result = arr.at(3);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0116
     * @tc.name concurrencyReturnCoveredTest016
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arrayLike = [-10, 20, -30, 40, -50];
      let array: collections.Int32Array = new collections.Int32Array(arrayLike);

      const result = array.some((element: number) => element < 0);
      const result2 = array.some((element: number) => element < -100);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0117
     * @tc.name concurrencyReturnCoveredTest017
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arrayLike = [-10, 20, -30, 40, -50];
      let array: collections.Int32Array = new collections.Int32Array(arrayLike);

      const result = array.every((element: number) => element < 50);
      const result2 = array.every((element: number) => element < -100);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0118
     * @tc.name concurrencyReturnCoveredTest018
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Uint16Array(2)
      arr.fill(2)
      const result = arr.includes(2);
      const result2 = arr.includes(-1, 0);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0119
     * @tc.name concurrencyReturnCoveredTest019
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Uint16Array(2)
      const result = arr.at(3);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0120
     * @tc.name concurrencyReturnCoveredTest020
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arrayLike = [10, 20, 30, 40, 50];
      let array: collections.Uint16Array = new collections.Uint16Array(arrayLike);

      const result = array.some((element: number) => element < 30);
      const result2 = array.some((element: number) => element < 10);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0121
     * @tc.name concurrencyReturnCoveredTest021
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arrayLike = [10, 20, 30, 40, 50];
      let array: collections.Uint16Array = new collections.Uint16Array(arrayLike);

      const result = array.every((element: number) => element < 60);
      const result2 = array.every((element: number) => element < 10);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0122
     * @tc.name concurrencyReturnCoveredTest022
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Int16Array(2)
      arr.fill(2)
      const result = arr.includes(2);
      const result2 = arr.includes(-1, 0);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0123
     * @tc.name concurrencyReturnCoveredTest023
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Int16Array(2)
      const result = arr.at(3);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0124
     * @tc.name concurrencyReturnCoveredTest024
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arrayLike = [-10, 20, -30, 40, -50];
      let array: collections.Int16Array = new collections.Int16Array(arrayLike);

      const result = array.some((element: number) => element < 0);
      const result2 = array.some((element: number) => element < -100);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0125
     * @tc.name concurrencyReturnCoveredTest025
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arrayLike = [-10, 20, -30, 40, -50];
      let array: collections.Int16Array = new collections.Int16Array(arrayLike);

      const result = array.every((element: number) => element < 50);
      const result2 = array.every((element: number) => element < -100);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0126
     * @tc.name concurrencyReturnCoveredTest026
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Uint8Array(2)
      arr.fill(2)
      const result = arr.includes(2);
      const result2 = arr.includes(-1, 0);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0127
     * @tc.name concurrencyReturnCoveredTest027
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Uint8Array(2)
      const result = arr.at(3);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0128
     * @tc.name concurrencyReturnCoveredTest028
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arrayLike = [10, 20, 30, 40, 50];
      let array: collections.Uint8Array = new collections.Uint8Array(arrayLike);

      const result = array.some((element: number) => element < 30);
      const result2 = array.some((element: number) => element < 10);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0129
     * @tc.name concurrencyReturnCoveredTest029
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arrayLike = [10, 20, 30, 40, 50];
      let array: collections.Uint8Array = new collections.Uint8Array(arrayLike);

      const result = array.every((element: number) => element < 60);
      const result2 = array.every((element: number) => element < 10);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0130
     * @tc.name concurrencyReturnCoveredTest030
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Uint8ClampedArray(2)
      arr.fill(2)
      const result = arr.includes(2);
      const result2 = arr.includes(-1, 0);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0131
     * @tc.name concurrencyReturnCoveredTest031
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Uint8ClampedArray(2)
      const result = arr.at(3);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0132
     * @tc.name concurrencyReturnCoveredTest032
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arrayLike = [10, 20, 30, 40, 50];
      let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);

      const result = array.some((element: number) => element < 30);
      const result2 = array.some((element: number) => element < 10);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0133
     * @tc.name concurrencyReturnCoveredTest033
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arrayLike = [10, 20, 30, 40, 50];
      let array: collections.Uint8ClampedArray = new collections.Uint8ClampedArray(arrayLike);

      const result = array.every((element: number) => element < 60);
      const result2 = array.every((element: number) => element < 10);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0134
     * @tc.name concurrencyReturnCoveredTest034
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Int8Array(2)
      arr.fill(2)
      const result = arr.includes(2);
      const result2 = arr.includes(-1, 0);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0135
     * @tc.name concurrencyReturnCoveredTest035
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Int8Array(2)
      const result = arr.at(3);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0136
     * @tc.name concurrencyReturnCoveredTest036
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arrayLike = [-10, 20, -30, 40, -50];
      let array: collections.Int8Array = new collections.Int8Array(arrayLike);

      const result = array.some((element: number) => element < 0);
      const result2 = array.some((element: number) => element < -100);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0137
     * @tc.name concurrencyReturnCoveredTest037
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arrayLike = [-10, 20, -30, 40, -50];
      let array: collections.Int8Array = new collections.Int8Array(arrayLike);

      const result = array.every((element: number) => element < 50);
      const result2 = array.every((element: number) => element < -100);
      expect(result).assertEqual(true);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0138
     * @tc.name concurrencyReturnCoveredTest038
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new collections.Map<number, string>([
        [1, "one"],
        [2, "two"],
        [3, "three"],
      ]);
      const result = map.has(1);
      expect(result).assertEqual(true);
      const result2 = map.has(11);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0139
     * @tc.name concurrencyReturnCoveredTest039
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new collections.Map<number, string>([
        [1, "one"],
        [2, "two"],
        [3, "three"],
      ]);
      const result = map.get(11);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0140
     * @tc.name concurrencyReturnCoveredTest040
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new collections.Map<number, string>([
        [1, "one"],
        [2, "two"],
        [3, "three"],
      ]);
      const result = map.delete(1);
      expect(result).assertEqual(true);
      const result2 = map.delete(11);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0141
     * @tc.name concurrencyReturnCoveredTest041
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let newArray: collections.Array<number> = collections.Array.from([-10, 20, -30, 40, -50]);
      let result = newArray.some((element: number) => element < -100);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0142
     * @tc.name concurrencyReturnCoveredTest042
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let newArray: collections.Array<number> = collections.Array.from([-10, 20, -30, 40, -50]);
      let result = newArray.reverse().length
      expect(result > 0).assertEqual(true);
      let newArray1: collections.Array<number> = collections.Array.from([]);
      let result1 = newArray1.reverse().length
      expect(result1 == 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0143
     * @tc.name concurrencyReturnCoveredTest043
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let array: collections.Array<number> = collections.Array.from([1, 2, 3, 4, 5, 6, 7, 8]);
      let result = array.copyWithin(3, 1, 3).length;
      expect(result > 0).assertEqual(true);
      let array1: collections.Array<number> = collections.Array.from([]);
      let result1 = array1.copyWithin(0, 1, 3).length;
      expect(result1 == 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0144
     * @tc.name concurrencyReturnCoveredTest044
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr: collections.Array<string> = collections.Array.of('a', 'b', 'c', 'd');
      const result = arr.length;
      expect(result > 0).assertEqual(true);
      let arr1: collections.Array<string> = collections.Array.of();
      const result1 = arr1.length;
      expect(result1 == 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0145
     * @tc.name concurrencyReturnCoveredTest045
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr: collections.Array<string> = new collections.Array('a', 'b', 'c', 'd');
      const result = collections.Array.isArray(arr);
      expect(result).assertEqual(true);
      const result1 = collections.Array.isArray(new Object());
      expect(result1).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0146
     * @tc.name concurrencyReturnCoveredTest046
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let array = new collections.Array<number>(1, 2, 3, 4, 5);
      const result = array.splice(2).length;
      expect(result > 0).assertEqual(true);
      const result1 = array.splice(7).length;
      expect(result1 == 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0147
     * @tc.name concurrencyReturnCoveredTest047
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let array = new collections.Array<number>(1, 2, 3, 4, 5);
      const result = array.splice(2, 2).length;
      expect(result > 0).assertEqual(true);
      const result1 = array.splice(7, 2).length;
      expect(result1 == 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0148
     * @tc.name concurrencyReturnCoveredTest048
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let array = new collections.Array(1, 2, 3);
      let array1 = new collections.Array(4, 5, 6);
      let array2 = new collections.Array(7, 8, 9);
      let array3 = new collections.Array<number>();
      let array4 = new collections.Array<number>();

      const result = array.concat(array1, array2).length;
      expect(result > 0).assertEqual(true);
      const result1 = array3.concat(array4).length;
      expect(result1 == 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0149
     * @tc.name concurrencyReturnCoveredTest049
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let array = new collections.Array(1, 2, 3, 4, 5);
      const result = array.fill(0, 1, 3).length;
      expect(result > 0).assertEqual(true);
      let array1 = new collections.Array<number>();
      const result1 = array1.fill(0, 0, 3).length;
      expect(result1 == 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0150
     * @tc.name concurrencyReturnCoveredTest050
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let array = new collections.Array<number>(1, 3, 5, 4, 2);
      const result = array.sort((a: number, b: number) => a - b).length;
      expect(result > 0).assertEqual(true);
      let array1 = new collections.Array<number>();
      const result1 = array1.sort((a: number, b: number) => a - b).length;
      expect(result1 == 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0151
     * @tc.name concurrencyReturnCoveredTest051
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let array = new collections.Array<number>(1, 2, 3, 4, 5);
      const result = array.slice(1, 3).length;
      expect(result > 0).assertEqual(true);
      const result1 = array.slice(1, 1).length;
      expect(result1 == 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0152
     * @tc.name concurrencyReturnCoveredTest052
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let array: Array<number> = [1, 2, 3];
      let newArray = collections.Array.from<number, string>(array, (value, index) => value + "." + index);
      const result = newArray.length;
      expect(result > 0).assertEqual(true);
      let array1: Array<number> = [];
      let newArray1 = collections.Array.from<number, string>(array1, (value, index) => value + "." + index);
      const result1 = newArray1.length;
      expect(result1 == 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0153
     * @tc.name concurrencyReturnCoveredTest053
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let array: Array<number> = [1, 2, 3];
      let newArray = collections.Array.from<number>(array, (value, index) => value + index);
      const result = newArray.length;
      expect(result > 0).assertEqual(true);
      let array1: Array<number> = [];
      let newArray1 = collections.Array.from<number>(array1, (value, index) => value + index);
      const result1 = newArray1.length;
      expect(result1 == 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0154
     * @tc.name concurrencyReturnCoveredTest054
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const workerInstance = new worker.ThreadWorker("./workers/Worker01.ets");

      workerInstance.addEventListener("alert", () => {
        console.info("alert listener callback");
      })
      const result = workerInstance.dispatchEvent({ type: "alert", timeStamp: 0 });
      const result1 = workerInstance.dispatchEvent({ type: "1111alert1111", timeStamp: 0 });
      let finish = false;
      workerInstance.terminate()
      workerInstance.onexit = () => {
        finish = true
      }
      while (!finish) {
        await sleep(100)
      }
      expect(result).assertEqual(true);
      expect(result1).assertEqual(true);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0155
     * @tc.name concurrencyReturnCoveredTest055
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const workerInstance = new worker.ThreadWorker("./workers/Worker01.ets");
      workerInstance.postMessage(1)
      let result: Array<boolean> = [];
      let finish = false;
      workerInstance.onmessage = (e) => {
        result = e.data
        workerInstance.terminate()
      }
      workerInstance.onexit = () => {
        finish = true
      }
      while (!finish) {
        await sleep(100)
      }
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0156
     * @tc.name concurrencyReturnCoveredTest056
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let taskGroup1: taskpool.TaskGroup = new taskpool.TaskGroup();
      let result = await taskpool.execute(taskGroup1)
      expect(result.length == 0).assertEqual(true);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0157
     * @tc.name concurrencyReturnCoveredTest057
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(printArgs, 100); // 100: test number
      await taskpool.execute(task).then((res: Object) => {
        console.info("taskpool test result: " + res);
      }).catch((err: string) => {
        console.error("taskpool test occur error: " + err);
      });
      const result = taskpool.Task.isCanceled();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_CONCURRENCY_return_COVERED_TEST_0158
     * @tc.name concurrencyReturnCoveredTest058
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concurrencyReturnCoveredTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(printArgs, 1000); // 100: test number
      let isCanceled = false
      let pro = taskpool.execute(task).then((res: Object) => {
        console.log('concurrencyReturnCoveredTest058 result: ' + res);
      }).catch(() => {
        isCanceled = true
      });
      taskpool.cancel(task)
      await pro
      expect(isCanceled).assertEqual(true);
    });


  }
  )
}