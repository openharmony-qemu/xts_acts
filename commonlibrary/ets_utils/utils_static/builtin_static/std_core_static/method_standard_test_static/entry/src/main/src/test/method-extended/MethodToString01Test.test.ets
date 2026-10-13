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

class TypeAssert_MTS02 {
  doWork(): void {}
}
class CtorTypeAssert_MTS02 {
  constructor() {}
}
function _M(ct: ClassType, name: string): Method | null {
  return ct.getMethodByName(name);
}
class TS3_ExistClass03 {
  exist(): void {}
}
class TS3_BareMinimal03 {
  id: number = 0;
}
class TS3_GrandParentPriv03 {
  private gpSecret(): void {}
  gpPublic(): void {}
}
class TS3_MidPriv03 extends TS3_GrandParentPriv03 {
  midSecret(): void {}
}
class TS3_SelfPrivate03 {
  private doSecret(): void {}
  doOpen(): void {}
}
interface TS3_WorkerIface03 {
  work(): void;
}
class TS3_WorkerImpl03 implements TS3_WorkerIface03 {
  work(): void {}
}
const ts3GetMethods = (cls: ClassType): Method[] => {
  let result: Method[] = [];
  let n: long = cls.getMethodsNum();
  for (let i: long = 0; i < n; i++) {
    result.push(cls.getMethod(i));
  }
  return result;
};
const isNotNull = (m: Method | null): boolean => {
  return m !== null;
};

export default function MethodToString01Test(): void {
  describe('MethodToString01Test', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {});
    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TOSTRING_ONE_0100
     * @tc.name testMethodToStringAtOne001
     * @tc.desc Verify toString returns string type for public method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodToStringAtOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<TypeAssert_MTS02>() as ClassType).getMethodByName('doWork');
      const str: string = method.toString();
      expect(str.startsWith('doWork: ')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TOSTRING_ONE_0300
     * @tc.name testMethodToStringAtOne003
     * @tc.desc Verify toString returns string type for constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodToStringAtOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = (Type.from<CtorTypeAssert_MTS02>() as ClassType).getConstructor(0).toString();
      expect(str.startsWith('constructor: ')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TOSTRING_ONE_0400
     * @tc.name testMethodToStringAtOne004
     * @tc.desc Verify getMethodByName throws TypeError for non-existent method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodToStringAtOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        (Type.from<TS3_ExistClass03>() as ClassType).getMethodByName('notExist');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TOSTRING_ONE_0500
     * @tc.name testMethodToStringAtOne005
     * @tc.desc Verify ts3GetMethods (getMethodsNum + getMethod) on fields-only class TS3_BareMinimal03: methods[0].toString() matches the getOwnPropertyNames signature, or the array is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodToStringAtOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const methods: Method[] = ts3GetMethods(Type.from<TS3_BareMinimal03>() as ClassType);
      if (methods.length > 0) {
        const str: string = methods[0].toString();
        expect(str).assertEqual('getOwnPropertyNames: (0: std.core.Record): std.core.Array');
      } else {
        expect(methods.length).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TOSTRING_ONE_0600
     * @tc.name testMethodToStringAtOne006
     * @tc.desc Verify ancestor private method IS visible in multi-level inheritance and toString contains method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodToStringAtOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<TS3_MidPriv03>() as ClassType).getMethodByName('gpSecret');
      const str: string = method.toString();
      expect(str.includes('gpSecret')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TOSTRING_ONE_0700
     * @tc.name testMethodToStringAtOne007
     * @tc.desc Verify ts3GetMethods (getMethodsNum + getMethod) on TS3_SelfPrivate03 lists its own private method doSecret
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodToStringAtOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const declared: Method[] = ts3GetMethods(Type.from<TS3_SelfPrivate03>() as ClassType);
      let foundPrivate: boolean = false;
      for (let i: int = 0; i < declared.length; i++) {
        if (declared[i].getName() === 'doSecret') {
          foundPrivate = true;
        }
      }
      expect(foundPrivate).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TOSTRING_ONE_0800
     * @tc.name testMethodToStringAtOne008
     * @tc.desc Verify interface method toString through implementing class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMethodToStringAtOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const method = (Type.from<TS3_WorkerImpl03>() as ClassType).getMethodByName('work');
      if (isNotNull(method)) {
        const str: string = method.toString();
        expect(str.startsWith('work: ')).assertTrue();
      } else {
        expect().assertFail();
      }
    });
  });
}
