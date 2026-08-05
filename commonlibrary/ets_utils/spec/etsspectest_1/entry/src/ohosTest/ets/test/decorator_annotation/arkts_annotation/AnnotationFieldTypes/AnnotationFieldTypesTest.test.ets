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

const enum FieldMode {
  Ready = 4,
  Default = 7,
  Ordered = 17
}

@interface NumberFieldAnno {
  value: number;
}

@interface BooleanFieldAnno {
  enabled: boolean;
}

@interface StringFieldAnno {
  text: string;
}

@interface EnumFieldAnno {
  mode: FieldMode;
}

@interface ArrayFieldAnno {
  ids: number[];
  flags: boolean[];
  names: string[];
  modes: FieldMode[];
}

@interface PrimitiveDefaultAnno {
  count: number = 6;
  enabled: boolean = true;
  text: string = 'hello';
}

@interface FieldTypeEnumDefaultAnno {
  mode: FieldMode = FieldMode.Default;
}

@interface OmittedDefaultAnno {
  label: string;
  count: number = 14;
}

@interface OrderFieldAnno {
  id: number;
  enabled: boolean;
  text: string;
}

@interface SingleFieldAnno {
  value: string;
}

@NumberFieldAnno({ value: 101 })
class NumberFieldHolder {
  public value: number = 101;
  public addNine(): number {
    return this.value + 9;
  }
}

@BooleanFieldAnno({ enabled: true })
class BooleanFieldHolder {
  public enabled: boolean = true;
  public inverted(): boolean {
    return !this.enabled;
  }
}

@StringFieldAnno({ text: 'stringField' })
class StringFieldHolder {
  public text: string = 'stringField';
  public greeting(): string {
    return 'hello-' + this.text;
  }
}

@EnumFieldAnno({ mode: FieldMode.Ready })
class EnumFieldHolder {
  public mode: FieldMode = FieldMode.Ready;
  public modeCode(): FieldMode {
    return this.mode;
  }
}

@ArrayFieldAnno({
  ids: [1, 2, 3],
  flags: [true, false],
  names: ['alpha', 'beta'],
  modes: [FieldMode.Ready, FieldMode.Default]
})
class ArrayFieldHolder {
  public ids: number[] = [1, 2, 3];
  public sumIds(): number {
    return this.ids[0] + this.ids[1] + this.ids[2];
  }
}

@PrimitiveDefaultAnno({})
class PrimitiveDefaultHolder {
  public count: number = 6;
  public enabled: boolean = true;
  public text: string = 'hello';
  public summary(): string {
    return this.count + '-' + this.text + '-' + (this.enabled ? 'y' : 'n');
  }
}

@FieldTypeEnumDefaultAnno({})
class EnumDefaultHolder {
  public mode: FieldMode = FieldMode.Default;
  public modeCode(): FieldMode {
    return this.mode;
  }
}

@OmittedDefaultAnno({ label: 'omittedDefault' })
class OmittedDefaultHolder {
  public label: string = 'omittedDefault';
  public count: number = 14;
  public describe(): string {
    return this.label + ':' + this.count;
  }
}

@OrderFieldAnno({ text: 'ordered', enabled: true, id: 17 })
class OrderFieldHolder {
  public id: number = 17;
  public enabled: boolean = true;
  public text: string = 'ordered';
  public summary(): string {
    return this.text + ':' + this.id + ':' + (this.enabled ? 'y' : 'n');
  }
}

@SingleFieldAnno({ value: 'singleValue' })
class SingleFieldHolder {
  public value: string = 'singleValue';
  public textLength(): number {
    return this.value.length;
  }
}

export default function annotationFieldTypesTest(): void {
  describe('AnnotationFieldTypesTest', () => {
    /**
     * @tc.number SUB_ARKTS_ANNO_FIELD_TYPES_0100
     * @tc.name testClassAnnotationFieldTypeNumber0001
     * @tc.desc Verify annotation accepts a number field (AN-FLD-001).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationFieldTypeNumber0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: NumberFieldHolder = new NumberFieldHolder();
      expect(holder.addNine()).assertEqual(110);
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_FIELD_TYPES_0200
     * @tc.name testClassAnnotationFieldTypeBoolean0002
     * @tc.desc Verify annotation accepts a boolean field (AN-FLD-002).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationFieldTypeBoolean0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: BooleanFieldHolder = new BooleanFieldHolder();
      expect(holder.inverted()).assertEqual(false);
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_FIELD_TYPES_0300
     * @tc.name testClassAnnotationFieldTypeString0003
     * @tc.desc Verify annotation accepts a string field (AN-FLD-003).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationFieldTypeString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: StringFieldHolder = new StringFieldHolder();
      expect(holder.greeting()).assertEqual('hello-stringField');
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_FIELD_TYPES_0400
     * @tc.name testClassAnnotationFieldTypeEnum0004
     * @tc.desc Verify annotation accepts an enum field (AN-FLD-004).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationFieldTypeEnum0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: EnumFieldHolder = new EnumFieldHolder();
      expect(holder.modeCode()).assertEqual(FieldMode.Ready);
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_FIELD_TYPES_0500
     * @tc.name testClassAnnotationFieldTypeArray0005
     * @tc.desc Verify annotation accepts an array field (AN-FLD-005).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationFieldTypeArray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: ArrayFieldHolder = new ArrayFieldHolder();
      expect(holder.sumIds()).assertEqual(6);
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_FIELD_TYPES_0600
     * @tc.name testClassAnnotationFieldTypePrimitiveDefault0006
     * @tc.desc Verify annotation supports number boolean and string default values (AN-FLD-006).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationFieldTypePrimitiveDefault0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: PrimitiveDefaultHolder = new PrimitiveDefaultHolder();
      expect(holder.summary()).assertEqual('6-hello-y');
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_FIELD_TYPES_0700
     * @tc.name testClassAnnotationFieldTypeEnumDefault0007
     * @tc.desc Verify annotation supports a compile-time enum constant as a default value (AN-FLD-007).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationFieldTypeEnumDefault0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: EnumDefaultHolder = new EnumDefaultHolder();
      expect(holder.modeCode()).assertEqual(FieldMode.Default);
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_FIELD_TYPES_0800
     * @tc.name testClassAnnotationFieldTypeOmittedDefault0008
     * @tc.desc Verify annotation allows omitting a field that has a default value (AN-FLD-014).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationFieldTypeOmittedDefault0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: OmittedDefaultHolder = new OmittedDefaultHolder();
      expect(holder.describe()).assertEqual('omittedDefault:14');
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_FIELD_TYPES_0900
     * @tc.name testClassAnnotationFieldTypeOrder0009
     * @tc.desc Verify annotation field order changes do not affect accepted usage (AN-FLD-017).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationFieldTypeOrder0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: OrderFieldHolder = new OrderFieldHolder();
      expect(holder.summary()).assertEqual('ordered:17:y');
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_FIELD_TYPES_1000
     * @tc.name testClassAnnotationFieldTypeSingleField0010
     * @tc.desc Verify annotation with a single field is accepted (AN-FLD-018).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationFieldTypeSingleField0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: SingleFieldHolder = new SingleFieldHolder();
      expect(holder.textLength()).assertEqual(11);
    });
  });
}
