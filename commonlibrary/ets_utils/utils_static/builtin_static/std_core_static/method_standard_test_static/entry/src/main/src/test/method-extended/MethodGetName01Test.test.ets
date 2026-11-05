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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

function _M(ct: ClassType, name: string): Method {
  return ct.getMethodByName(name) as Method;
}
class GetName02EnLiteralSample {
  simpleName(): void {}
  camelCase(): void {}
  PascalCase(): void {}
  alllowercase(): void {}
  ALLUPPERCASE(): void {}
  mixedCASE(): void {}
  methodWithDigits123(): void {}
  _underscorePrefix(): void {}
  trailingUnderscore_(): void {}
  single(): void {}
  doubleName(): void {}
  tripleName(): void {}
  $dollarPrefix(): void {}
  contains2Digits(): void {}
  z(): void {}
  embedded_underscore(): void {}
  suffixNum99(): void {}
}
class GetName02LengthSample {
  x(): void {}
  foo(): void {}
  mediumLengthMethodName(): void {}
  thisIsAVeryLongMethodNameForTestingLengthAssertion(): void {}
  emptyNear(): void {}
}
class GetName02CharByCharSample {
  add(): number {
    return 0;
  }
  foo(): void {}
  cjkTest(): void {}
  my_method(): void {}
  method2(): void {}
}
class GetName02PatternSample {
  startsWithLetter(): void {}
  _startsWithUnderscore(): void {}
  $startsWithDollar(): void {}
  onlyletters(): void {}
  mix3dName(): void {}
  camelCasePattern(): void {}
  PascalCasePattern(): void {}
  snake_case_pattern(): void {}
}
class GetName02ImmutableSample {
  modifyMe(): void {}
}
class GetName02CompareHolder {
  compareMethod(): void {}
}
class GetName02SelfNamed {
  GetName02SelfNamed(): void {}
}
class GetName02KeywordSample {
  getName(): string {
    return 'name';
  }
  setValue(): void {}
  isValid(): boolean {
    return true;
  }
  hasProperty(): boolean {
    return true;
  }
  onClick(): void {}
}
class GN3OuterAccess {
  protected restricted(): void {}
}
class GN3ClassA {
  compute(): void {}
}
class GN3ClassB {
  compute(): void {}
}
class GN3IsolatedMethods {
  task1(): void {}
  task2(): void {}
  task3(): void {}
}
class GN3CleanName {
  process(): void {}
}
class GN3PrivateParentMethod {
  private pvt(): void {}
}
class GN3PublicChild extends GN3PrivateParentMethod {
  pub(): void {}
}
class GN3LastMethod {
  first(): void {}
  second(): void {}
  last(): void {}
}
class GN3ControlQuery021 {
  work(): void {}
}
const __isNull = (m: Method | null): boolean => {
  return m === null;
};

export default function MethodGetName01Test(): void {
  describe('MethodGetName01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_ONE_0100
     * @tc.name testMethodGetNameAtOne001
     * @tc.desc Verify getName returns correct simple English method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetNameAtOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<GetName02EnLiteralSample>() as ClassType).getMethodByName('simpleName');
      let name: string = method.getName();
      expect(name as Object).assertEqual('simpleName');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_ONE_0200
     * @tc.name testMethodGetNameAtOne002
     * @tc.desc Verify getName returns correct method name with dollar sign prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetNameAtOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<GetName02EnLiteralSample>() as ClassType).getMethodByName('$dollarPrefix');
      let name: string = method.getName();
      expect(name as Object).assertEqual('$dollarPrefix');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_ONE_0300
     * @tc.name testMethodGetNameAtOne003
     * @tc.desc Verify getName string length is 1 for single-char method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetNameAtOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = _M(Type.from<GetName02LengthSample>() as ClassType, 'x');
      let name: string = method.getName();
      expect(name.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_ONE_0400
     * @tc.name testMethodGetNameAtOne004
     * @tc.desc Verify getName returns string with correct characters for method 'add'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetNameAtOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<GetName02CharByCharSample>() as ClassType).getMethodByName('add');
      let name: string = method.getName();
      expect(name[0]).assertEqual('a');
      expect(name[1]).assertEqual('d');
      expect(name[2]).assertEqual('d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_ONE_0500
     * @tc.name testMethodGetNameAtOne005
     * @tc.desc Verify method name starts with a letter character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetNameAtOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<GetName02PatternSample>() as ClassType).getMethodByName('startsWithLetter');
      let name: string = method.getName();
      expect(name[0] >= 'a' && name[0] <= 'z').assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_ONE_0600
     * @tc.name testMethodGetNameAtOne006
     * @tc.desc Verify method name starts with underscore character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetNameAtOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<GetName02PatternSample>() as ClassType).getMethodByName('_startsWithUnderscore');
      let name: string = method.getName();
      expect(name[0]).assertEqual('_');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_ONE_0700
     * @tc.name testMethodGetNameAtOne007
     * @tc.desc Verify method name contains only letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetNameAtOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<GetName02PatternSample>() as ClassType).getMethodByName('onlyletters');
      let name: string = method.getName();
      let allLetters: boolean = true;
      for (let i: number = 0; i < name.length; i += 1) {
        const c: string = name[i.toInt()];
        if (!((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))) {
          allLetters = false;
        }
      }
      expect(allLetters).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_ONE_0800
     * @tc.name testMethodGetNameAtOne008
     * @tc.desc Verify method name contains both letters and digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetNameAtOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<GetName02PatternSample>() as ClassType).getMethodByName('mix3dName');
      let name: string = method.getName();
      let hasLetter: boolean = false;
      let hasDigit: boolean = false;
      for (let i: number = 0; i < name.length; i += 1) {
        const c: string = name[i.toInt()];
        if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')) {
          hasLetter = true;
        }
        if (c >= '0' && c <= '9') {
          hasDigit = true;
        }
      }
      expect(hasLetter && hasDigit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_ONE_0900
     * @tc.name testMethodGetNameAtOne009
     * @tc.desc Verify method name follows camelCase naming pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetNameAtOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<GetName02PatternSample>() as ClassType).getMethodByName('camelCasePattern');
      let name: string = method.getName();
      expect(name[0]).assertEqual('c');
      const upperC: string = name[5];
      expect(upperC >= 'A' && upperC <= 'Z').assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_ONE_1000
     * @tc.name testMethodGetNameAtOne010
     * @tc.desc Verify method name follows snake_case naming pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetNameAtOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<GetName02PatternSample>() as ClassType).getMethodByName('snake_case_pattern');
      let name: string = method.getName();
      expect(name as Object).assertEqual('snake_case_pattern');
      expect(name.indexOf('_') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_ONE_1100
     * @tc.name testMethodGetNameAtOne011
     * @tc.desc Verify getName returns immutable string that cannot be modified after concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetNameAtOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<GetName02ImmutableSample>() as ClassType).getMethodByName('modifyMe');
      let name: string = method.getName();
      let modified: string = name + 'Suffix';
      expect(name as Object).assertEqual('modifyMe');
      expect(modified as Object).assertEqual('modifyMeSuffix');
      expect(name).not().assertEqual(modified);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_ONE_1200
     * @tc.name testMethodGetNameAtOne012
     * @tc.desc Verify method name does not equal its enclosing class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetNameAtOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<GetName02CompareHolder>() as ClassType).getMethodByName('compareMethod');
      let name: string = method.getName();
      const className: string = 'GetName02CompareHolder';
      expect(name).not().assertEqual(className);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_ONE_1300
     * @tc.name testMethodGetNameAtOne013
     * @tc.desc Verify getName of self-named method GetName02SelfNamed matches its enclosing class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetNameAtOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<GetName02SelfNamed>() as ClassType).getMethodByName('GetName02SelfNamed');
      let name: string = method.getName();
      const className: string = 'GetName02SelfNamed';
      expect(name as Object).assertEqual(className);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_ONE_1400
     * @tc.name testMethodGetNameAtOne014
     * @tc.desc Verify getName returns method name with 'get' prefix style
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetNameAtOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<GetName02KeywordSample>() as ClassType).getMethodByName('getName');
      let name: string = method.getName();
      expect(name as Object).assertEqual('getName');
      expect(name.startsWith('get')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_ONE_1500
     * @tc.name testMethodGetNameAtOne015
     * @tc.desc Verify protected method getName through outer class access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetNameAtOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = (Type.from<GN3OuterAccess>() as ClassType).getMethodByName('restricted');
      expect(m.getName()).assertEqual('restricted');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_ONE_1600
     * @tc.name testMethodGetNameAtOne016
     * @tc.desc Verify getName consistency across different classes with same method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetNameAtOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m1 = (Type.from<GN3ClassA>() as ClassType).getMethodByName('compute');
      let m2 = (Type.from<GN3ClassB>() as ClassType).getMethodByName('compute');
      expect(m1.getName()).assertEqual('compute');
      expect(m2.getName()).assertEqual('compute');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_ONE_1700
     * @tc.name testMethodGetNameAtOne017
     * @tc.desc Verify that Type.from creates non-null class type for IsolatedMethods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetNameAtOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Type.from<GN3IsolatedMethods>() as Object)
        .not()
        .assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_ONE_1800
     * @tc.name testMethodGetNameAtOne018
     * @tc.desc Verify getName return value contains no extra whitespace characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetNameAtOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = (Type.from<GN3CleanName>() as ClassType).getMethodByName('process');
      let name: string = m.getName();
      expect(name).assertEqual(name.trim());
      expect(name.indexOf('\n') < 0).assertTrue();
      expect(name.indexOf('\r') < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_ONE_1900
     * @tc.name testMethodGetNameAtOne019
     * @tc.desc Verify private parent method found in child class returns its name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetNameAtOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m = (Type.from<GN3PublicChild>() as ClassType).getMethodByName('pvt');
      if (!__isNull(m)) {
        expect(m.getName()).assertEqual('pvt');
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_ONE_2000
     * @tc.name testMethodGetNameAtOne020
     * @tc.desc Verify getMethodByName with control character name throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetNameAtOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let m = (Type.from<GN3ControlQuery021>() as ClassType).getMethodByName('\0');
        expect(__isNull(m)).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_GET_NAME_ONE_2100
     * @tc.name testMethodGetNameAtOne021
     * @tc.desc Verify getName returns different names for different methods using not().assertEqual
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodGetNameAtOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m1 = (Type.from<GN3LastMethod>() as ClassType).getMethodByName('first');
      let m2 = (Type.from<GN3LastMethod>() as ClassType).getMethodByName('last');
      expect(m1.getName()).not().assertEqual(m2.getName());
    });
  });
}
