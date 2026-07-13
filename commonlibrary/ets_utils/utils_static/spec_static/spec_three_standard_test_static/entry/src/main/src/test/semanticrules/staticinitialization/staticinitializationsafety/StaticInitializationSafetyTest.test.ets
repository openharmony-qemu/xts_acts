'use static'
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../../../Util.test'

class A00 {
  static a00: Object;
  static b00: Object;
  static {
    A00.a00 = A00.b00;
    A00.b00 = new Object();
  }
}

abstract class A01 {
  static a01: Object;
  static b01: Object;
  static {
    A01.a01 = A01.b01;
    A01.b01 = new Object();
  }
}

class A02 {
  static a02: Object;
  static {
    A02.a02 = C03.c03;
  }
}
class C03 {
  static c03: Object;
  static {
    C03.c03 = A02.a02;
  }
}

abstract class A04 {
  static a04: Object;
  static {
    A04.a04 = C05.c05;
  }
}
abstract class C05 {
  static c05: Object;
  static {
    C05.c05 = A04.a04;
  }
}

class A06 {
  static a06: Object;
  static {
    A06.a06 = B07.b07;
  }
}
class B07 {
  static b07: Object;
  static {
    B07.b07 = C08.c08;
  }
}
class C08 {
  static c08: Object;
  static {
    C08.c08 = A06.a06;
  }
}

export default function StaticInitializationSafetyTest():void {
  describe('StaticInitializationSafetyTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_SAFETY_0100
     * @tc.name      testCircularDependencies0001
     * @tc.desc      Object is used before being initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCircularDependencies0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = false;
      try {
        A00.a00;
      } catch(e) {
        res = true;
      }
      expect(res).assertTrue();
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_SAFETY_0200
     * @tc.name      testCircularDependencies0002
     * @tc.desc      Object is used before being initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCircularDependencies0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = false;
      try {
        A01.a01;
      } catch(e) {
        res = true;
      }
      expect(res).assertTrue();
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_SAFETY_0300
     * @tc.name      testCircularDependencies0003
     * @tc.desc      Object is used before being initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCircularDependencies0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = false;
      try {
        A02.a02;
      } catch(e) {
        res = true;
      }
      expect(res).assertTrue();
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_SAFETY_0400
     * @tc.name      testCircularDependencies0004
     * @tc.desc      Object is used before being initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCircularDependencies0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = false;
      try {
        A04.a04;
      } catch(e) {
        res = true;
      }
      expect(res).assertTrue();
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_SAFETY_0500
     * @tc.name      testCircularDependencies0005
     * @tc.desc      Object is used before being initialized
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCircularDependencies0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = false;
      try {
        A06.a06;
      } catch(e) {
        res = true;
      }
      expect(res).assertTrue();
    });
  })
}
