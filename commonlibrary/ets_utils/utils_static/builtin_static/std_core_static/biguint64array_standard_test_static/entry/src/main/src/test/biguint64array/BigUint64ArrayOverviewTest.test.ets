'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function biguint64arrayOverviewTest(): void {

  describe('BigUint64ArrayOverviewTest', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OVERVIEW_0100
     * @tc.name testBigUint64ArrayOverview001
     * @tc.desc Verify nested subarray views share the original buffer through multiple view levels
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOverview001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let firstView = sourceArray.subarray(1, 5);
      let nestedView = firstView.subarray(1, 3);
      nestedView.fill(77n);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[2]).assertEqual(77n);
      expect(sourceArray[3]).assertEqual(77n);
      expect(firstView.buffer).assertEqual(sourceArray.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OVERVIEW_0200
     * @tc.name testBigUint64ArrayOverview002
     * @tc.desc Verify toString() returns comma-separated decimal strings and matches join()
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOverview002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([0n, 18446744073709551615n, 42n]);
      let stringValue = sourceArray.toString();
      expect(stringValue).assertEqual('0,18446744073709551615,42');
      expect(stringValue).assertEqual(sourceArray.join());
      expect(sourceArray[1]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OVERVIEW_0300
     * @tc.name testBigUint64ArrayOverview003
     * @tc.desc Verify ArrayBuffer views keep shared storage while toString() observes each view window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOverview003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(buffer);
      fullView[0] = 100n;
      fullView[1] = 200n;
      fullView[2] = 300n;
      fullView[3] = 400n;
      let offsetView = new BigUint64Array(buffer, 8, 2);
      expect(offsetView.buffer).assertEqual(buffer);
      expect(offsetView.byteOffset).assertEqual(8);
      expect(offsetView.toString()).assertEqual('200,300');
      offsetView[0] = 999n;
      expect(fullView[1]).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OVERVIEW_0400
     * @tc.name testBigUint64ArrayOverview004
     * @tc.desc Verify chained copyWithin and reverse operations apply in sequence to the same array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOverview004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      sourceArray.copyWithin(0, 2, 5);
      sourceArray.reverse();
      expect(sourceArray[0]).assertEqual(5n);
      expect(sourceArray[1]).assertEqual(4n);
      expect(sourceArray[2]).assertEqual(5n);
      expect(sourceArray[4]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OVERVIEW_0500
     * @tc.name testBigUint64ArrayOverview005
     * @tc.desc Verify set() can consume toReversed() output while original source remains unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOverview005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let reversedArray = sourceArray.toReversed();
      let targetArray = new BigUint64Array(4);
      targetArray.fill(9n);
      targetArray.set(reversedArray, 1);
      expect(targetArray[0]).assertEqual(9n);
      expect(targetArray[1]).assertEqual(3n);
      expect(targetArray[2]).assertEqual(2n);
      expect(targetArray[3]).assertEqual(1n);
      expect(sourceArray[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OVERVIEW_0600
     * @tc.name testBigUint64ArrayOverview006
     * @tc.desc Verify map and filter chained results stay typed and preserve expected transformed values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOverview006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let mappedArray = sourceArray.map((element: bigint): bigint => {
        return element * 2n;
      });
      let filteredArray = mappedArray.filter((element: bigint): boolean => {
        return element > 4n;
      });
      expect(filteredArray.length).assertEqual(2);
      expect(filteredArray[0]).assertEqual(6n);
      expect(filteredArray[1]).assertEqual(8n);
      expect(sourceArray[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OVERVIEW_0700
     * @tc.name testBigUint64ArrayOverview007
     * @tc.desc Verify nested byteOffset subarray writes remain visible through the parent view window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOverview007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer = new ArrayBuffer(56);
      let fullView = new BigUint64Array(sharedBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      fullView[6] = 70n;
      let offsetView = new BigUint64Array(sharedBuffer, 8, 5);
      let firstWindow = offsetView.subarray(1, 4);
      let nestedWindow = firstWindow.subarray(1, 3);
      nestedWindow.fill(555n);
      expect(nestedWindow.byteOffset).assertEqual(24);
      expect(nestedWindow.length).assertEqual(2);
      expect(offsetView.toString()).assertEqual('20,30,555,555,60');
      expect(fullView[3]).assertEqual(555n);
      expect(fullView[4]).assertEqual(555n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OVERVIEW_0800
     * @tc.name testBigUint64ArrayOverview008
     * @tc.desc Verify slice() from a byteOffset view can feed set() as an isolated snapshot
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOverview008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer = new ArrayBuffer(48);
      let fullView = new BigUint64Array(sharedBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      let offsetView = new BigUint64Array(sharedBuffer, 8, 4);
      let sliceCopy = offsetView.slice(1, 4);
      fullView[2] = 333n;
      let targetArray = new BigUint64Array(5);
      targetArray.set(sliceCopy, 1);
      sliceCopy[1] = 444n;
      expect(sliceCopy.byteOffset).assertEqual(0);
      expect(offsetView.toString()).assertEqual('20,333,40,50');
      expect(targetArray[0]).assertEqual(0n);
      expect(targetArray[1]).assertEqual(30n);
      expect(targetArray[2]).assertEqual(40n);
      expect(targetArray[3]).assertEqual(50n);
      expect(targetArray[4]).assertEqual(0n);
      expect(sliceCopy[1]).assertEqual(444n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OVERVIEW_0900
     * @tc.name testBigUint64ArrayOverview009
     * @tc.desc Verify Set source duplicate removal feeds map and reduceRight composition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOverview009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceSet = new Set<bigint>();
      sourceSet.add(7n);
      sourceSet.add(11n);
      sourceSet.add(7n);
      sourceSet.add(15n);
      let sourceArray = new BigUint64Array(sourceSet);
      let mappedArray = sourceArray.map((element: bigint): bigint => {
        return element + 1n;
      });
      let textValue = mappedArray.reduceRight<string>((previousValue: string, currentValue: bigint,
        currentIndex: int, _array: BigUint64Array): string => {
        return previousValue + currentValue.toString() + ':' + currentIndex.toString() + '|';
      }, '');
      expect(sourceArray.length).assertEqual(3);
      expect(mappedArray[0]).assertEqual(8n);
      expect(mappedArray[2]).assertEqual(16n);
      expect(textValue).assertEqual('16:2|12:1|8:0|');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OVERVIEW_1000
     * @tc.name testBigUint64ArrayOverview010
     * @tc.desc Verify advanced iterator source feeds slice and set as a remaining-window snapshot
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOverview010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let baseArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = baseArray.values();
      sourceIterator.next();
      let windowArray = new BigUint64Array(sourceIterator);
      let sliceCopy = windowArray.slice(1);
      windowArray[1] = 99n;
      let targetArray = new BigUint64Array(4);
      targetArray.fill(1n);
      targetArray.set(sliceCopy, 1);
      expect(windowArray.length).assertEqual(3);
      expect(windowArray[0]).assertEqual(10n);
      expect(windowArray[1]).assertEqual(99n);
      expect(baseArray[1]).assertEqual(10n);
      expect(targetArray[0]).assertEqual(1n);
      expect(targetArray[1]).assertEqual(15n);
      expect(targetArray[2]).assertEqual(20n);
      expect(targetArray[3]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OVERVIEW_1100
     * @tc.name testBigUint64ArrayOverview011
     * @tc.desc Verify join toString and ungrouped toLocaleString return the same stable low-value text
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOverview011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = new BigUint64Array([7n, 42n, 1000n]);
      let formatOptions: BigIntToLocaleStringOptions = { useGrouping: false };
      let joinText = sourceArray.join();
      let stringText = sourceArray.toString();
      let localeText = sourceArray.toLocaleString('en-US', formatOptions);
      expect(joinText).assertEqual('7,42,1000');
      expect(stringText).assertEqual(joinText);
      expect(localeText).assertEqual(joinText);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OVERVIEW_1200
     * @tc.name testBigUint64ArrayOverview012
     * @tc.desc Verify all three string APIs observe the same current values from a shared view window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOverview012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sharedBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let sourceView = new BigUint64Array(sharedBuffer, 8, 2);
      fullView[2] = 300n;
      let formatOptions: BigIntToLocaleStringOptions = { useGrouping: false };
      let joinText = sourceView.join();
      let stringText = sourceView.toString();
      let localeText = sourceView.toLocaleString('en-US', formatOptions);
      expect(joinText).assertEqual('20,300');
      expect(stringText).assertEqual(joinText);
      expect(localeText).assertEqual(joinText);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OVERVIEW_1300
     * @tc.name testBigUint64ArrayOverview013
     * @tc.desc Verify at returns undefined while $_get throws RangeError for the same out-of-range index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOverview013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n);
      let outOfRangeIndex: int = sourceArray.length;
      let atResult = sourceArray.at(outOfRangeIndex);
      expect(atResult).assertEqual(undefined);
      try {
        sourceArray.$_get(outOfRangeIndex);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OVERVIEW_1400
     * @tc.name testBigUint64ArrayOverview014
     * @tc.desc Verify slice isolates copied values while subarray observes later writes through shared storage
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOverview014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n);
      let isolatedSlice = sourceArray.slice(1, 3);
      let sharedSubarray = sourceArray.subarray(1, 3);
      sourceArray[1] = 99n;
      expect(isolatedSlice[0]).assertEqual(20n);
      expect(sharedSubarray[0]).assertEqual(99n);
      sharedSubarray[1] = 88n;
      expect(sourceArray[2]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OVERVIEW_1500
     * @tc.name testBigUint64ArrayOverview015
     * @tc.desc Verify includes returns presence while indexOf and lastIndexOf return first and last matching indices
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOverview015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(5n, 7n, 5n);
      let searchElement = 5n;
      let includesResult = sourceArray.includes(searchElement);
      let firstIndex = sourceArray.indexOf(searchElement);
      let lastIndex = sourceArray.lastIndexOf(searchElement);
      expect(includesResult).assertTrue();
      expect(firstIndex).assertEqual(0);
      expect(lastIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OVERVIEW_1600
     * @tc.name testBigUint64ArrayOverview016
     * @tc.desc Verify find returns a low matching value while findIndex returns its matching index
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOverview016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(2n, 3n, 4n);
      let foundValue = sourceArray.find((value: bigint): boolean => {
        return value === 3n;
      });
      let foundIndex = sourceArray.findIndex((value: bigint): boolean => {
        return value === 3n;
      });
      expect(foundValue).assertEqual(3n);
      expect(foundIndex).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_OVERVIEW_1700
     * @tc.name testBigUint64ArrayOverview017
     * @tc.desc Verify reduce and reduceRight expose opposite accumulation directions with the same low values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayOverview017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(1n, 2n, 3n);
      let leftText = sourceArray.reduce<string>((previousValue: string, currentValue: bigint): string => {
        return previousValue + currentValue.toString();
      }, '');
      let rightText = sourceArray.reduceRight<string>((previousValue: string, currentValue: bigint): string => {
        return previousValue + currentValue.toString();
      }, '');
      expect(leftText).assertEqual('123');
      expect(rightText).assertEqual('321');
    });
  });
}
