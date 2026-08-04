/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

const enum ArrayMode {
  Mild = 1,
  Bold = 2,
  Bright = 3
}

@interface StringArrayAnno {
  values: string[];
}

@interface NumberArrayAnno {
  values: number[];
}

@interface BooleanArrayAnno {
  values: boolean[];
}

@interface EnumArrayAnno {
  values: ArrayMode[];
}

@interface EmptyArrayAnno {
  values: string[];
}

@interface DefaultArrayAnno {
  values: string[] = ['default', 'fallback'];
}

@interface SingleArrayAnno {
  values: number[];
}

@StringArrayAnno({ values: ['alpha', 'beta'] })
class StringArrayHolder {
  public values: string[] = ['alpha', 'beta'];
  public joinValues(): string {
    return this.values[0] + '|' + this.values[1];
  }
}

@NumberArrayAnno({ values: [3, 4, 5] })
class NumberArrayHolder {
  public values: number[] = [3, 4, 5];
  public sumValues(): number {
    return this.values[0] + this.values[1] + this.values[2];
  }
}

@BooleanArrayAnno({ values: [true, false, true] })
class BooleanArrayHolder {
  public flags: boolean[] = [true, false, true];
  public countTrue(): number {
    let count: number = 0;
    if (this.flags[0]) {
      count++;
    }
    if (this.flags[1]) {
      count++;
    }
    if (this.flags[2]) {
      count++;
    }
    return count;
  }
}

@EnumArrayAnno({ values: [ArrayMode.Mild, ArrayMode.Bold] })
class EnumArrayHolder {
  public modes: ArrayMode[] = [ArrayMode.Mild, ArrayMode.Bold];
  public describeModes(): string {
    return this.modes[0].toString() + ',' + this.modes[1].toString();
  }
}

@EmptyArrayAnno({ values: [] })
class EmptyArrayHolder {
  public values: string[] = [];
  public size(): number {
    return this.values.length;
  }
}

@DefaultArrayAnno({})
class DefaultArrayHolder {
  public values: string[] = ['default', 'fallback'];
  public joinValues(): string {
    return this.values[0] + '|' + this.values[1];
  }
}

@SingleArrayAnno({ values: [10, 20, 30] })
class SingleArrayHolder {
  public values: number[] = [10, 20, 30];
  public sumValues(): number {
    return this.values[0] + this.values[1] + this.values[2];
  }
}

export default function annotationArraysTest(): void {
  describe('AnnotationArraysTest', () => {
    /**
     * @tc.number SUB_ARKTS_ANNO_ARRAYS_0100
     * @tc.name testClassAnnotationArrayString0001
     * @tc.desc Verify annotation accepts a string array field (AN-ARR-001).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationArrayString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: StringArrayHolder = new StringArrayHolder();
      expect(holder.joinValues()).assertEqual('alpha|beta');
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_ARRAYS_0200
     * @tc.name testClassAnnotationArrayNumber0002
     * @tc.desc Verify annotation accepts a number array field (AN-ARR-002).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationArrayNumber0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: NumberArrayHolder = new NumberArrayHolder();
      expect(holder.sumValues()).assertEqual(12);
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_ARRAYS_0300
     * @tc.name testClassAnnotationArrayBoolean0003
     * @tc.desc Verify annotation accepts a boolean array field (AN-ARR-003).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationArrayBoolean0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: BooleanArrayHolder = new BooleanArrayHolder();
      expect(holder.countTrue()).assertEqual(2);
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_ARRAYS_0400
     * @tc.name testClassAnnotationArrayEnum0004
     * @tc.desc Verify annotation accepts an enum array field (AN-ARR-004).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationArrayEnum0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: EnumArrayHolder = new EnumArrayHolder();
      expect(holder.describeModes()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_ARRAYS_0500
     * @tc.name testClassAnnotationArrayEmpty0005
     * @tc.desc Verify annotation accepts an empty array value (AN-ARR-005).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationArrayEmpty0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: EmptyArrayHolder = new EmptyArrayHolder();
      expect(holder.size()).assertEqual(0);
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_ARRAYS_0600
     * @tc.name testClassAnnotationArrayDefault0006
     * @tc.desc Verify annotation array field can provide a default value (AN-ARR-006).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationArrayDefault0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: DefaultArrayHolder = new DefaultArrayHolder();
      expect(holder.joinValues()).assertEqual('default|fallback');
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_ARRAYS_0700
     * @tc.name testClassAnnotationArraySingleField0007
     * @tc.desc Verify annotation with a single array field is accepted (AN-ARR-010).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationArraySingleField0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: SingleArrayHolder = new SingleArrayHolder();
      expect(holder.sumValues()).assertEqual(60);
    });
  });
}
