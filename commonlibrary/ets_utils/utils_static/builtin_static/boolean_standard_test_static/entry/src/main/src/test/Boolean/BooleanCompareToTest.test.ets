'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

interface BooleanCompareComparator<T> {
  compare(a: T, b: T): int;
}

interface BooleanCompareItem {
  flag: Boolean;
  priority: int;
}

class BooleanComparator implements BooleanCompareComparator<Boolean> {
  compare(a: Boolean, b: Boolean): int {
    return a.compareTo(b);
  }
}

class BooleanOrderedSet {
  private items: Boolean[] = [];

  add(item: Boolean): void {
    let index: int = 0;
    while (index < this.items.length && item.compareTo(this.items[index]) > 0) {
      index++;
    }
    if (index < this.items.length && item.compareTo(this.items[index]) === 0) {
      return;
    }
    this.items.splice(index, 0, item);
  }

  toArray(): Boolean[] {
    return this.items;
  }
}

class BooleanComparePair {
  first: Boolean;
  second: Boolean;

  constructor(first: Boolean, second: Boolean) {
    this.first = first;
    this.second = second;
  }

  compareTo(other: BooleanComparePair): int {
    const firstCompare: int = this.first.compareTo(other.first);
    if (firstCompare !== 0) {
      return firstCompare;
    }
    return this.second.compareTo(other.second);
  }
}

function sortBooleans(values: Boolean[]): Boolean[] {
  return values.sort((a: Boolean, b: Boolean): int => {
    return a.compareTo(b);
  });
}

function sortBooleansDescending(values: Boolean[]): Boolean[] {
  return values.sort((a: Boolean, b: Boolean): int => {
    return b.compareTo(a);
  });
}

function findMax(values: Boolean[]): Boolean {
  let max: Boolean = values[0];
  for (let index: int = 1; index < values.length; index++) {
    if (values[index].compareTo(max) > 0) {
      max = values[index];
    }
  }
  return max;
}

function findMin(values: Boolean[]): Boolean {
  let min: Boolean = values[0];
  for (let index: int = 1; index < values.length; index++) {
    if (values[index].compareTo(min) < 0) {
      min = values[index];
    }
  }
  return min;
}

function isInRange(value: Boolean, min: Boolean, max: Boolean): boolean {
  return value.compareTo(min) >= 0 && value.compareTo(max) <= 0;
}

function binarySearch(values: Boolean[], target: Boolean): int {
  let left: int = 0;
  let right: int = values.length - 1;
  while (left <= right) {
    const mid: int = ((left + right) / 2).toInt();
    const compare: int = target.compareTo(values[mid]);
    if (compare === 0) {
      return mid;
    } else if (compare > 0) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return -1;
}

function sortItems(items: BooleanCompareItem[]): BooleanCompareItem[] {
  return items.sort((a: BooleanCompareItem, b: BooleanCompareItem): int => {
    const flagCompare: int = a.flag.compareTo(b.flag);
    if (flagCompare !== 0) {
      return flagCompare;
    }
    return a.priority - b.priority;
  });
}

function maxBoolean<T extends Boolean>(a: T, b: T): T {
  return a.compareTo(b) >= 0 ? a : b;
}

function minBoolean<T extends Boolean>(a: T, b: T): T {
  return a.compareTo(b) <= 0 ? a : b;
}

function countInRange(values: Boolean[], min: Boolean, max: Boolean): int {
  let count: int = 0;
  for (let index: int = 0; index < values.length; index++) {
    if (values[index].compareTo(min) >= 0 && values[index].compareTo(max) <= 0) {
      count++;
    }
  }
  return count;
}

function naturalOrder(a: Boolean, b: Boolean): int {
  return a.compareTo(b);
}

export default function BooleanCompareToTest(): void {
  describe("BooleanCompareToTest", (): void => {
    beforeAll((): void => {
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_0100
     * @tc.name      testBooleanCompareToRequiredParameter
     * @tc.desc      Boolean.compareTo() compares with another Boolean object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToRequiredParameter", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Boolean(true).compareTo(new Boolean(false));
      expect(result).assertEqual(1);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_0200
     * @tc.name      testBooleanCompareToTruthTable
     * @tc.desc      Boolean.compareTo() follows false < true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToTruthTable", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).compareTo(new Boolean(false))).assertEqual(1);
      expect(new Boolean(false).compareTo(new Boolean(true))).assertEqual(-1);
      expect(new Boolean(true).compareTo(new Boolean(true))).assertEqual(0);
      expect(new Boolean(false).compareTo(new Boolean(false))).assertEqual(0);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_0300
     * @tc.name      testBooleanCompareToStaticInstances
     * @tc.desc      Boolean.compareTo() works with Boolean.TRUE and Boolean.FALSE.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToStaticInstances", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Boolean(true).compareTo(Boolean.TRUE)).assertEqual(0);
      expect(new Boolean(false).compareTo(Boolean.TRUE)).assertEqual(-1);
      expect(Boolean.TRUE.compareTo(new Boolean(false))).assertEqual(1);
      expect(new Boolean(false).compareTo(Boolean.FALSE)).assertEqual(0);
      expect(new Boolean(true).compareTo(Boolean.FALSE)).assertEqual(1);
      expect(Boolean.FALSE.compareTo(new Boolean(true))).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_0400
     * @tc.name      testBooleanCompareToReturnTypeAndSigns
     * @tc.desc      Boolean.compareTo() returns primitive int values with expected signs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToReturnTypeAndSigns", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const greater: int = new Boolean(true).compareTo(new Boolean(false));
      const less: int = new Boolean(false).compareTo(new Boolean(true));
      const equal: int = new Boolean(true).compareTo(new Boolean(true));

      expect(typeof greater).assertEqual("int");
      expect(greater).assertEqual(1);
      expect(greater > 0).assertEqual(true);
      expect(less).assertEqual(-1);
      expect(less < 0).assertEqual(true);
      expect(equal).assertEqual(0);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_0500
     * @tc.name      testBooleanCompareToSymmetry
     * @tc.desc      Boolean.compareTo() satisfies sign symmetry.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToSymmetry", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool1: Boolean = new Boolean(true);
      const bool2: Boolean = new Boolean(false);
      const result1: int = bool1.compareTo(bool2);
      const result2: int = bool2.compareTo(bool1);

      expect(result1).assertEqual(-result2);
      expect(result1).assertEqual(1);
      expect(result2).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_0600
     * @tc.name      testBooleanCompareToTransitivity
     * @tc.desc      Boolean.compareTo() satisfies transitivity for Boolean order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToTransitivity", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Boolean = new Boolean(true);
      const b: Boolean = new Boolean(false);
      const c: Boolean = new Boolean(false);

      expect(a.compareTo(b)).assertEqual(1);
      expect(b.compareTo(c)).assertEqual(0);
      expect(a.compareTo(c)).assertEqual(1);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_0700
     * @tc.name      testBooleanCompareToSelf
     * @tc.desc      Boolean.compareTo() returns 0 when compared with itself.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToSelf", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const trueBool: Boolean = new Boolean(true);
      const falseBool: Boolean = new Boolean(false);

      expect(trueBool.compareTo(trueBool)).assertEqual(0);
      expect(falseBool.compareTo(falseBool)).assertEqual(0);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_0800
     * @tc.name      testBooleanCompareToDifferentConstructors
     * @tc.desc      Boolean.compareTo() compares Boolean objects created from different inputs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToDifferentConstructors", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool1: Boolean = new Boolean(true);
      const bool2: Boolean = new Boolean(true);
      const bool3: Boolean = new Boolean(100);
      const bool4: Boolean = new Boolean(0);
      const bool5: Boolean = new Boolean("test");
      const bool6: Boolean = new Boolean(null);

      expect(bool1.compareTo(bool2)).assertEqual(0);
      expect(bool1.compareTo(bool3)).assertEqual(0);
      expect(bool2.compareTo(bool4)).assertEqual(1);
      expect(bool1.compareTo(bool5)).assertEqual(0);
      expect(bool4.compareTo(bool6)).assertEqual(0);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_0900
     * @tc.name      testBooleanCompareToReturnRange
     * @tc.desc      Boolean.compareTo() only returns -1, 0, or 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToReturnRange", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Boolean[] = [new Boolean(true), new Boolean(false), Boolean.TRUE, Boolean.FALSE];
      for (let i: int = 0; i < values.length; i++) {
        for (let j: int = 0; j < values.length; j++) {
          const result: int = values[i].compareTo(values[j]);
          expect(result === -1 || result === 0 || result === 1).assertEqual(true);
        }
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_1000
     * @tc.name      testBooleanCompareToEquals
     * @tc.desc      Boolean.compareTo() result 0 is consistent with equals().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToEquals", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool1: Boolean = new Boolean(true);
      const bool2: Boolean = new Boolean(true);
      const bool3: Boolean = new Boolean(false);

      expect(bool1.compareTo(bool2)).assertEqual(0);
      expect(bool1.equals(bool2)).assertEqual(true);
      expect(bool1.compareTo(bool3)).assertEqual(1);
      expect(bool1.equals(bool3)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_1100
     * @tc.name      testBooleanCompareToPrimitiveOperators
     * @tc.desc      Boolean.compareTo() matches valueOf() primitive comparisons.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToPrimitiveOperators", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool1: Boolean = new Boolean(true);
      const bool2: Boolean = new Boolean(false);

      expect(bool1.compareTo(bool2)).assertEqual(1);
      expect(bool2.compareTo(bool1)).assertEqual(-1);
      expect(bool1.valueOf() > bool2.valueOf()).assertEqual(true);
      expect(bool2.valueOf() < bool1.valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_1200
     * @tc.name      testBooleanCompareToSortAscending
     * @tc.desc      Boolean.compareTo() can sort Boolean values ascending.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToSortAscending", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sorted: Boolean[] = sortBooleans([
        new Boolean(true),
        new Boolean(false),
        new Boolean(true),
        new Boolean(false)
      ]);

      expect(sorted[0].valueOf()).assertEqual(false);
      expect(sorted[1].valueOf()).assertEqual(false);
      expect(sorted[2].valueOf()).assertEqual(true);
      expect(sorted[3].valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_1300
     * @tc.name      testBooleanCompareToFindMinMax
     * @tc.desc      Boolean.compareTo() can find min and max values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToFindMinMax", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Boolean[] = [new Boolean(false), new Boolean(true), new Boolean(false)];

      expect(findMax(values).valueOf()).assertEqual(true);
      expect(findMin(values).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_1400
     * @tc.name      testBooleanCompareToRangeCheck
     * @tc.desc      Boolean.compareTo() can check Boolean ranges.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToRangeCheck", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(isInRange(Boolean.TRUE, Boolean.FALSE, Boolean.TRUE)).assertEqual(true);
      expect(isInRange(Boolean.FALSE, Boolean.FALSE, Boolean.TRUE)).assertEqual(true);
      expect(isInRange(new Boolean(true), Boolean.TRUE, Boolean.TRUE)).assertEqual(true);
      expect(isInRange(new Boolean(false), Boolean.TRUE, Boolean.TRUE)).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_1500
     * @tc.name      testBooleanCompareToBinarySearch
     * @tc.desc      Boolean.compareTo() can be used in binary search.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToBinarySearch", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sorted: Boolean[] = [
        new Boolean(false),
        new Boolean(false),
        new Boolean(true),
        new Boolean(true)
      ];

      expect(binarySearch(sorted, Boolean.FALSE) >= 0).assertEqual(true);
      expect(binarySearch(sorted, Boolean.TRUE) >= 0).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_1600
     * @tc.name      testBooleanCompareToLoopComparison
     * @tc.desc      Boolean.compareTo() matches expected values during nested comparisons.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToLoopComparison", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Boolean[] = [new Boolean(true), new Boolean(false), new Boolean(true), new Boolean(false)];
      for (let i: int = 0; i < values.length; i++) {
        for (let j: int = 0; j < values.length; j++) {
          const expected: int = values[i].valueOf() === values[j].valueOf() ? 0 : values[i].valueOf() ? 1 : -1;
          expect(values[i].compareTo(values[j])).assertEqual(expected);
        }
      }
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_1700
     * @tc.name      testBooleanCompareToOrderedSet
     * @tc.desc      Boolean.compareTo() can maintain ordered unique Boolean collection.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToOrderedSet", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set: BooleanOrderedSet = new BooleanOrderedSet();
      set.add(new Boolean(true));
      set.add(new Boolean(false));
      set.add(new Boolean(true));
      const items: Boolean[] = set.toArray();

      expect(items.length).assertEqual(2);
      expect(items[0].valueOf()).assertEqual(false);
      expect(items[1].valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_1800
     * @tc.name      testBooleanCompareToComparator
     * @tc.desc      Boolean.compareTo() can implement a comparator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToComparator", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const comparator: BooleanComparator = new BooleanComparator();
      const bool1: Boolean = new Boolean(true);
      const bool2: Boolean = new Boolean(false);

      expect(comparator.compare(bool1, bool2)).assertEqual(1);
      expect(comparator.compare(bool2, bool1)).assertEqual(-1);
      expect(comparator.compare(bool1, bool1)).assertEqual(0);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_1900
     * @tc.name      testBooleanCompareToSortDescending
     * @tc.desc      Boolean.compareTo() can sort Boolean values descending.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToSortDescending", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sorted: Boolean[] = sortBooleansDescending([
        new Boolean(true),
        new Boolean(false),
        new Boolean(true),
        new Boolean(false)
      ]);

      expect(sorted[0].valueOf()).assertEqual(true);
      expect(sorted[1].valueOf()).assertEqual(true);
      expect(sorted[2].valueOf()).assertEqual(false);
      expect(sorted[3].valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_2000
     * @tc.name      testBooleanCompareToMultiLevelSort
     * @tc.desc      Boolean.compareTo() can be the first key in multi-level sort.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToMultiLevelSort", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sorted: BooleanCompareItem[] = sortItems([
        { flag: new Boolean(true), priority: 2 },
        { flag: new Boolean(false), priority: 1 },
        { flag: new Boolean(true), priority: 1 },
        { flag: new Boolean(false), priority: 2 }
      ]);

      expect(sorted[0].flag.valueOf()).assertEqual(false);
      expect(sorted[0].priority).assertEqual(1);
      expect(sorted[1].flag.valueOf()).assertEqual(false);
      expect(sorted[1].priority).assertEqual(2);
      expect(sorted[2].flag.valueOf()).assertEqual(true);
      expect(sorted[2].priority).assertEqual(1);
      expect(sorted[3].flag.valueOf()).assertEqual(true);
      expect(sorted[3].priority).assertEqual(2);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_2100
     * @tc.name      testBooleanCompareToNaturalOrder
     * @tc.desc      Boolean.compareTo() provides natural order false before true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToNaturalOrder", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Boolean[] = [
        new Boolean(true),
        new Boolean(false),
        new Boolean(true),
        new Boolean(false)
      ];
      values.sort(naturalOrder);

      expect(values[0].valueOf()).assertEqual(false);
      expect(values[1].valueOf()).assertEqual(false);
      expect(values[2].valueOf()).assertEqual(true);
      expect(values[3].valueOf()).assertEqual(true);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_2200
     * @tc.name      testBooleanCompareToPairChain
     * @tc.desc      Boolean.compareTo() can be used in comparison chains.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToPairChain", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pair1: BooleanComparePair = new BooleanComparePair(new Boolean(true), new Boolean(false));
      const pair2: BooleanComparePair = new BooleanComparePair(new Boolean(true), new Boolean(true));
      const pair3: BooleanComparePair = new BooleanComparePair(new Boolean(false), new Boolean(true));

      expect(pair1.compareTo(pair2)).assertEqual(-1);
      expect(pair1.compareTo(pair3)).assertEqual(1);
      expect(pair2.compareTo(pair1)).assertEqual(1);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_2300
     * @tc.name      testBooleanCompareToCountInRange
     * @tc.desc      Boolean.compareTo() can count values in query ranges.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToCountInRange", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Boolean[] = [
        new Boolean(true),
        new Boolean(false),
        new Boolean(true),
        new Boolean(false),
        new Boolean(true)
      ];

      expect(countInRange(values, Boolean.FALSE, Boolean.FALSE)).assertEqual(2);
      expect(countInRange(values, Boolean.TRUE, Boolean.TRUE)).assertEqual(3);
      expect(countInRange(values, Boolean.FALSE, Boolean.TRUE)).assertEqual(5);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_2400
     * @tc.name      testBooleanCompareToGenericMinMax
     * @tc.desc      Boolean.compareTo() can be used by generic min and max helpers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToGenericMinMax", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool1: Boolean = new Boolean(true);
      const bool2: Boolean = new Boolean(false);

      expect(maxBoolean<Boolean>(bool1, bool2).valueOf()).assertEqual(true);
      expect(minBoolean<Boolean>(bool1, bool2).valueOf()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_BOOLEAN_COMPARE_TO_2500
     * @tc.name      testBooleanCompareToConsistency
     * @tc.desc      Boolean.compareTo() returns consistent results across calls.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanCompareToConsistency", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bool1: Boolean = new Boolean(true);
      const bool2: Boolean = new Boolean(false);
      const result1: int = bool1.compareTo(bool2);
      const result2: int = bool1.compareTo(bool2);
      const result3: int = bool1.compareTo(bool2);

      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertEqual(1);
    })
  })
}
