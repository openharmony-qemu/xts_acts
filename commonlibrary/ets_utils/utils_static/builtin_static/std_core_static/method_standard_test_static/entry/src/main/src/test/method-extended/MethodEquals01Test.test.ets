'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

class Calculator {
  add(): number {
    return 0;
  }
  private validateInternal(): number {
    return 0;
  }
  subtract(): number {
    return 0;
  }
  reset(): number {
    return 0;
  }
}
class StringUtil {
  capitalize(): number {
    return 0;
  }
  reverse(): number {
    return 0;
  }
  format(): number {
    return 0;
  }
}
class ClassTypeA {
  run(): number {
    return 0;
  }
}
class ClassTypeB {
  run(): number {
    return 0;
  }
}

export default function MethodEquals01Test(): void {
  describe('MethodEquals01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_ONE_0100
     * @tc.name testMethodEqualsAtOne001
     * @tc.desc Verify equals returns true when comparing the same method reference via variable assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodEqualsAtOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m1 = (Type.from<Calculator>() as ClassType).getMethodByName('add');
      let m2 = m1;
      expect(m1.equals(m2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_ONE_0200
     * @tc.name testMethodEqualsAtOne002
     * @tc.desc Verify equals returns true when retrieving the same private method twice via getMethodByName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodEqualsAtOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m1 = (Type.from<Calculator>() as ClassType).getMethodByName('validateInternal');
      let m2: Method | null = (Type.from<Calculator>() as ClassType).getMethodByName('validateInternal');
      expect(m1.equals(m2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_ONE_0400
     * @tc.name testMethodEqualsAtOne004
     * @tc.desc Verify equals returns false when comparing methods with the same name from different classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodEqualsAtOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m1 = (Type.from<ClassTypeA>() as ClassType).getMethodByName('run');
      let m2: Method | null = (Type.from<ClassTypeB>() as ClassType).getMethodByName('run');
      expect(m1.equals(m2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_ONE_0500
     * @tc.name testMethodEqualsAtOne005
     * @tc.desc Verify equals returns false when comparing public methods from different classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodEqualsAtOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m1 = (Type.from<Calculator>() as ClassType).getMethodByName('add');
      let m2: Method | null = (Type.from<StringUtil>() as ClassType).getMethodByName('reverse');
      expect(m1.equals(m2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_ONE_0700
     * @tc.name testMethodEqualsAtOne007
     * @tc.desc Verify equals returns false when comparing instance method with null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodEqualsAtOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = (Type.from<Calculator>() as ClassType).getMethodByName('add');
      expect(m.equals(null)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_ONE_0800
     * @tc.name testMethodEqualsAtOne008
     * @tc.desc Verify equals returns false when comparing method with non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodEqualsAtOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = (Type.from<Calculator>() as ClassType).getMethodByName('add');
      expect(m.equals('add')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_ONE_0900
     * @tc.name testMethodEqualsAtOne009
     * @tc.desc Verify mixed positive and negative equals checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodEqualsAtOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m1 = (Type.from<Calculator>() as ClassType).getMethodByName('add');
      let m2 = (Type.from<Calculator>() as ClassType).getMethodByName('add');
      let m3 = (Type.from<Calculator>() as ClassType).getMethodByName('subtract');
      expect(m1.equals(m2)).assertTrue();
      expect(m1.equals(m3)).assertFalse();
      expect(m2.equals(m1)).assertTrue();
      expect(m2.equals(m3)).assertFalse();
      expect(m3.equals(m1)).assertFalse();
      expect(m3.equals(m2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_EQUALS_ONE_1000
     * @tc.name testMethodEqualsAtOne010
     * @tc.desc Verify equals calls do not mutate Method state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodEqualsAtOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = (Type.from<Calculator>() as ClassType).getMethodByName('add');
      let before: string = m.getName();
      m.equals(null);
      m.equals(0);
      m.equals('test');
      let after: string = m.getName();
      expect(before as Object).assertEqual(after);
    });
  });
}
