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
} from '@ohos/hypium';

@interface InheritanceNote {
  name: string;
}

@InheritanceNote({ name: 'base-class' })
class AnnotatedBaseClass {
  getBaseResult(): string {
    return 'ok';
  }
}

@InheritanceNote({ name: 'child-class' })
class ExplicitAnnotatedChildClass extends AnnotatedBaseClass {
  getChildResult(): string {
    return 'ok';
  }
}

class BaseMethodClass {
  @InheritanceNote({ name: 'base-method' })
  getResult(): string {
    return 'ok';
  }
}

class ExplicitAnnotatedMethodChildClass extends BaseMethodClass {
  @InheritanceNote({ name: 'child-method' })
  getResult(): string {
    return 'ok';
  }
}

class PlainBaseClass {
  getBaseResult(): string {
    return 'ok';
  }
}

@InheritanceNote({ name: 'concrete-subclass' })
class ConcreteAnnotatedSubclass extends PlainBaseClass {
  getSubclassResult(): string {
    return 'ok';
  }
}

export default function AnnotationInheritanceTest(): void {
  describe('AnnotationInheritanceTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number SUB_ARKTS_ANNO_INH_0100
     * @tc.name testClassAnnotationInheritanceChildClassExplicitAnnotation0001
     * @tc.desc Compile-pass: annotated subclass declaration loads and can be instantiated.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationInheritanceChildClassExplicitAnnotation0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const child: ExplicitAnnotatedChildClass = new ExplicitAnnotatedChildClass();
        expect(child.getBaseResult()).assertEqual('ok');
        expect(child.getChildResult()).assertEqual('ok');
      });

    /**
     * @tc.number SUB_ARKTS_ANNO_INH_0200
     * @tc.name testClassAnnotationInheritanceOverrideMethodExplicitAnnotation0002
     * @tc.desc Compile-pass: overriding method with explicit annotation loads and can be called.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationInheritanceOverrideMethodExplicitAnnotation0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const result: string = new ExplicitAnnotatedMethodChildClass().getResult();
        expect(result).assertEqual('ok');
      });

    /**
     * @tc.number SUB_ARKTS_ANNO_INH_0300
     * @tc.name testClassAnnotationInheritanceConcreteSubclassAnnotation0003
     * @tc.desc Compile-pass: concrete subclass with annotation loads and can be instantiated.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClassAnnotationInheritanceConcreteSubclassAnnotation0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const child: ConcreteAnnotatedSubclass = new ConcreteAnnotatedSubclass();
        expect(child.getBaseResult()).assertEqual('ok');
        expect(child.getSubclassResult()).assertEqual('ok');
      });
  });
}
