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

const enum EnumMode {
  Primary = 10,
  Secondary = 20,
  Final = 30
}

@interface EnumFieldDeclAnno {
  mode: EnumMode;
}

@interface EnumConstantAnno {
  mode: EnumMode;
}

@interface EnumDefaultAnno {
  mode: EnumMode = EnumMode.Secondary;
}

@interface EnumListAnno {
  modes: EnumMode[];
}

@EnumFieldDeclAnno({ mode: EnumMode.Primary })
class EnumFieldHolder {
  public mode: EnumMode = EnumMode.Primary;
  public modeCode(): EnumMode {
    return this.mode;
  }
}

@EnumConstantAnno({ mode: EnumMode.Secondary })
class EnumConstantHolder {
  public mode: EnumMode = EnumMode.Secondary;
  public modeCode(): EnumMode {
    return this.mode;
  }
}

@EnumDefaultAnno({})
class EnumDefaultHolder {
  public mode: EnumMode = EnumMode.Secondary;
  public modeCode(): EnumMode {
    return this.mode;
  }
}

@EnumListAnno({ modes: [EnumMode.Primary, EnumMode.Secondary, EnumMode.Final] })
class EnumListHolder {
  public modes: EnumMode[] = [EnumMode.Primary, EnumMode.Secondary, EnumMode.Final];
  public describeModes(): string {
    return this.modes[0].toString() + ',' + this.modes[1].toString() + ',' + this.modes[2].toString();
  }
}

export default function annotationEnumFieldsTest(): void {
  describe('AnnotationEnumFieldsTest', () => {
    /**
     * @tc.number SUB_ARKTS_ANNO_ENUM_FIELDS_0100
     * @tc.name testClassAnnotationEnumFieldDeclaration0001
     * @tc.desc Verify annotation can declare an enum field (AN-ENUM-001).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationEnumFieldDeclaration0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: EnumFieldHolder = new EnumFieldHolder();
      expect(holder.modeCode()).assertEqual(EnumMode.Primary);
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_ENUM_FIELDS_0200
     * @tc.name testClassAnnotationEnumConstantValue0002
     * @tc.desc Verify an enum constant can be used as an annotation field value (AN-ENUM-002).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationEnumConstantValue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: EnumConstantHolder = new EnumConstantHolder();
      expect(holder.modeCode()).assertEqual(EnumMode.Secondary);
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_ENUM_FIELDS_0300
     * @tc.name testClassAnnotationEnumDefaultValue0003
     * @tc.desc Verify an enum constant can be used as an annotation default value (AN-ENUM-003).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationEnumDefaultValue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: EnumDefaultHolder = new EnumDefaultHolder();
      expect(holder.modeCode()).assertEqual(EnumMode.Secondary);
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_ENUM_FIELDS_0400
     * @tc.name testClassAnnotationEnumArrayOrder0004
     * @tc.desc Verify an enum array field preserves the declared order (AN-ENUM-008).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationEnumArrayOrder0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: EnumListHolder = new EnumListHolder();
      expect(holder.describeModes()).assertEqual('10,20,30');
    });
  });
}
