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

@interface EmptyAnnotation {
}

@interface MultiFieldAnnotation {
  name: string;
  value: number;
  enabled: boolean;
}

export @interface ExportedAnnotation {
  tag: string;
}

@interface OmitParenAnnotation {
}

@EmptyAnnotation
class EmptyHolder {
  public count: number = 5;
  public doubled(): number {
    return this.count * 2;
  }
}

@MultiFieldAnnotation({ name: 'annotated', value: 99, enabled: true })
class MultiFieldHolder {
  public name: string = 'annotated';
  public value: number = 99;
  public enabled: boolean = true;
  public describe(): string {
    return this.name + ':' + this.value + ':' + (this.enabled ? 'on' : 'off');
  }
}

@ExportedAnnotation({ tag: 'exported' })
class ExportedHolder {
  public tag: string = 'exported';
  public label(): string {
    return 'tag-' + this.tag;
  }
}

@OmitParenAnnotation
class OmitParenHolder {
  public id: number = 5;
  public nextId(): number {
    return this.id + 1;
  }
}

export default function annotationDeclarationTest(): void {
  describe('AnnotationDeclarationTest', () => {
    /**
     * @tc.number SUB_ARKTS_ANNO_DECLARATION_0100
     * @tc.name testClassAnnotationDeclarationEmpty0001
     * @tc.desc Verify an empty annotation declaration is valid (AN-DCL-001).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationDeclarationEmpty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: EmptyHolder = new EmptyHolder();
      expect(holder.doubled()).assertEqual(10);
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_DECLARATION_0200
     * @tc.name testClassAnnotationDeclarationWithFields0002
     * @tc.desc Verify annotation declaration with multiple fields is valid (AN-DCL-002).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationDeclarationWithFields0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: MultiFieldHolder = new MultiFieldHolder();
      expect(holder.describe()).assertEqual('annotated:99:on');
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_DECLARATION_0300
     * @tc.name testClassAnnotationDeclarationExport0003
     * @tc.desc Verify an exported annotation declaration is valid (AN-DCL-003).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationDeclarationExport0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: ExportedHolder = new ExportedHolder();
      expect(holder.label()).assertEqual('tag-exported');
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_DECLARATION_0400
     * @tc.name testClassAnnotationDeclarationOmitParentheses0004
     * @tc.desc Verify annotation without fields can be applied with omitted parentheses (AN-DCL-014).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationDeclarationOmitParentheses0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const holder: OmitParenHolder = new OmitParenHolder();
      expect(holder.nextId()).assertEqual(6);
    });
  });
}
