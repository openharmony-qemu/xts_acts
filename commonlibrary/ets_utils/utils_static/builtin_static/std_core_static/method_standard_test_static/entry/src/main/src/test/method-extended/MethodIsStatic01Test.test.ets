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
} from '../../../../../hypium/index';
import Utils from '../../Util.test';

function _M(ct: ClassType, name: string): Method {
  return ct.getMethodByName(name) as Method;
}
class EmptyClass_IsStatic03 {}
class SomeClass_IsStatic03 {
  someMethod(): void {}
  anotherMethod(): void {}
}
class PureDataObject_IsStatic03 {
  getField(): number {
    return 0;
  }
  setField(v: number): void {}
  toString(): string {
    return '';
  }
}
class Parent4_2_IsStatic03 {
  static sameNameMethod(): void {}
  anotherSameName(): void {}
}
class Child4_2_IsStatic03 extends Parent4_2_IsStatic03 {
  sameNameMethod(): void {}
  static anotherSameName(): void {}
}
interface MyInterface_IsStatic03 {
  defaultMethod(): void;
}
class MyInterfaceImpl_IsStatic03 implements MyInterface_IsStatic03 {
  defaultMethod(): void {}
  static staticInterfaceMethod(): void {}
}
class MyImpl_IsStatic03 implements MyInterface_IsStatic03 {
  defaultMethod(): void {}
}
class StringUtils9_2_IsStatic03 {
  static isEmpty(): boolean {
    return true;
  }
}
class DateUtils_IsStatic03 {
  static format(): string {
    return '';
  }
  static parse(): string {
    return '';
  }
}
class MessageFormatter_IsStatic03 {
  static format(): string {
    return '';
  }
}
class Console_IsStatic03 {
  format(): void {}
}
const __isNull = (m: Method | null): boolean => {
  return m === null;
};

export default function MethodIsStatic01Test(): void {
  describe('MethodIsStatic01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSTATIC_ONE_0100
     * @tc.name testMethodIsStaticAtOne001
     * @tc.desc Verify getMethodByName throws for non-existent, null, undefined and empty input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsStaticAtOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result: Method | null = (Type.from<EmptyClass_IsStatic03>() as ClassType).getMethodByName('anyMethod');
        expect(__isNull(result)).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      try {
        (Type.from<SomeClass_IsStatic03>() as ClassType).getMethodByName(null as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      try {
        (Type.from<SomeClass_IsStatic03>() as ClassType).getMethodByName(undefined as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      try {
        (Type.from<SomeClass_IsStatic03>() as ClassType).getMethodByName('');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSTATIC_ONE_0200
     * @tc.name testMethodIsStaticAtOne002
     * @tc.desc Verify that isStatic returns false for instance methods on all-instance data class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsStaticAtOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ct = Type.from<PureDataObject_IsStatic03>() as ClassType;
      expect(ct.getMethodByName('getField').isStatic()).assertFalse();
      expect(ct.getMethodByName('setField').isStatic()).assertFalse();
      expect(ct.getMethodByName('toString').isStatic()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSTATIC_ONE_0300
     * @tc.name testMethodIsStaticAtOne003
     * @tc.desc Verify getMethodByName for static method throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsStaticAtOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const ct = Type.from<Child4_2_IsStatic03>() as ClassType;
        expect(ct.getMethodByName('sameNameMethod').isStatic()).assertFalse();
        expect(ct.getMethodByName('anotherSameName').isStatic()).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSTATIC_ONE_0400
     * @tc.name testMethodIsStaticAtOne004
     * @tc.desc Verify getMethodByName for static interface method throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsStaticAtOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        expect(
          (Type.from<MyInterfaceImpl_IsStatic03>() as ClassType).getMethodByName('defaultMethod').isStatic(),
        ).assertFalse();
        expect((Type.from<MyImpl_IsStatic03>() as ClassType).getMethodByName('defaultMethod').isStatic()).assertFalse();
        expect(
          (Type.from<MyInterfaceImpl_IsStatic03>() as ClassType).getMethodByName('staticInterfaceMethod').isStatic(),
        ).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSTATIC_ONE_0500
     * @tc.name testMethodIsStaticAtOne005
     * @tc.desc Verify isStatic for existing static method isEmpty stays stable across 10 lookups, then the case voluntarily fails expecting TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsStaticAtOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const m = _M(Type.from<StringUtils9_2_IsStatic03>() as ClassType, 'isEmpty');
        const results: boolean[] = [];
        for (let i: number = 0; i < 10; i++) {
          results[Double.toInt(i)] = m.isStatic();
        }
        for (let i: number = 1; i < 10; i++) {
          expect(results[Double.toInt(i)]).assertEqual(results[0]);
        }
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_ISSTATIC_ONE_0600
     * @tc.name testMethodIsStaticAtOne006
     * @tc.desc Verify static methods of pure-static classes are inaccessible via getMethodByName (throws TypeError) and instance format is not static
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodIsStaticAtOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (Type.from<DateUtils_IsStatic03>() as ClassType).getMethodByName('format');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      try {
        (Type.from<MessageFormatter_IsStatic03>() as ClassType).getMethodByName('format');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      const m3 = (Type.from<Console_IsStatic03>() as ClassType).getMethodByName('format');
      expect(m3.isStatic()).assertFalse();
    });
  });
}
