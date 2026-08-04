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

@interface RepeatabilityNameNote {
  name: string;
}

@interface RepeatabilityLevelNote {
  level: number;
}

@RepeatabilityNameNote({ name: 'class-repeatable' })
@RepeatabilityLevelNote({ level: 2 })
class RepeatabilityClassHolder {
  getResult(): string {
    return 'class-repeatable:2';
  }
}

class RepeatabilityMethodHolder {
  @RepeatabilityNameNote({ name: 'method-repeatable' })
  @RepeatabilityLevelNote({ level: 3 })
  getResult(): string {
    return 'method-repeatable:3';
  }
}

export default function annotationRepeatabilityTest(): void {
  describe('AnnotationRepeatabilityTest', () => {
    beforeEach(() => {
    });

    /**
     * @tc.number SUB_ARKTS_ANNO_REP_0100
     * @tc.name testClassAnnotationRepeatabilityClassMultipleAnnotations0001
     * @tc.desc Verify that two different annotations can be applied to one class declaration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationRepeatabilityClassMultipleAnnotations0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const result: string = new RepeatabilityClassHolder().getResult();
        expect(result).assertEqual('class-repeatable:2');
      });

    /**
     * @tc.number SUB_ARKTS_ANNO_REP_0200
     * @tc.name testClassAnnotationRepeatabilityMethodMultipleAnnotations0002
     * @tc.desc Verify that multiple different annotations can be applied to one method declaration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationRepeatabilityMethodMultipleAnnotations0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const result: string = new RepeatabilityMethodHolder().getResult();
        expect(result).assertEqual('method-repeatable:3');
      });
  });
}
