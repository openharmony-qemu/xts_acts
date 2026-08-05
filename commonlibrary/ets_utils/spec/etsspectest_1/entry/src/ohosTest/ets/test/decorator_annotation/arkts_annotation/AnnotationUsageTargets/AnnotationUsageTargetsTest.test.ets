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

import { describe, expect, it, beforeEach, Level, Size, TestType } from '@ohos/hypium';

@interface UsageTargetNote {
  name: string;
}

@UsageTargetNote({ name: 'class-target' })
class UsageTargetClass {
  getResult(): string {
    return 'class-target';
  }
}

class UsageTargetInstanceMethod {
  @UsageTargetNote({ name: 'instance-method-target' })
  getResult(): string {
    return 'instance-method-target';
  }
}

class UsageTargetStaticMethod {
  @UsageTargetNote({ name: 'static-method-target' })
  static getResult(): string {
    return 'static-method-target';
  }
}

export default function annotationUsageTargetsTest(): void {
  describe('AnnotationUsageTargetsTest', () => {
    beforeEach(() => {
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_TGT_0100
     * @tc.name testClassAnnotationUsageTargetsClassTarget0001
     * @tc.desc Verify that a user annotation can be applied to a class declaration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationUsageTargetsClassTarget0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const result: string = new UsageTargetClass().getResult();
        expect(result).assertEqual('class-target');
      });

    /**
     * @tc.number SUB_ARKTS_ANNO_TGT_0200
     * @tc.name testClassAnnotationUsageTargetsInstanceMethodTarget0002
     * @tc.desc Verify that a user annotation can be applied to an instance method declaration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationUsageTargetsInstanceMethodTarget0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const result: string = new UsageTargetInstanceMethod().getResult();
        expect(result).assertEqual('instance-method-target');
      });

    /**
     * @tc.number SUB_ARKTS_ANNO_TGT_0300
     * @tc.name testClassAnnotationUsageTargetsStaticMethodTarget0003
     * @tc.desc Verify that a user annotation can be applied to a static method declaration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationUsageTargetsStaticMethodTarget0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const result: string = UsageTargetStaticMethod.getResult();
        expect(result).assertEqual('static-method-target');
      });
  });
}
