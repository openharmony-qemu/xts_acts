'use static';
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

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}



let strseq00 = "";
function seq00(i: string) {
  strseq00 += i;
}

class A00 {
  static {
    seq00("A");
  }
}

class B00 extends A00 {
  static {
    seq00("B");
    throw new Error("initialization has stopped");
  }
}

class C00 extends B00 {
  static s: number;
  f: number = 0;
  static {
    seq00("C");
  }
  static foo() {}
  foo() {}
}

class D00 extends C00 {
  static {
    seq00("D");
  }
}



let strseq01 = "";
function seq01(i: string) {
  strseq01 += i;
}

class A01 {
  static {
    seq01("A");
  }
}

class B01 extends A01 {
  static {
    seq01("B");
    throw new Error("initialization has stopped");
  }
}

class C01 extends B01 {
  static s: number;
  f: number = 0;
  static {
    seq01("C");
  }
  static foo() {}
  foo() {}
}

class D01 extends C01 {
  static {
    seq01("D");
  }
}



let strseq02 = "";
function seq02(i: string) {
  strseq02 += i;
}

class A02 {
  static {
    seq02("A");
  }
}

class B02 extends A02 {
  static {
    seq02("B");
    throw new Error("initialization has stopped");
  }
}

class C02 extends B02 {
  static s: number;
  f: number = 0;
  static {
    seq02("C");
  }
  static foo() {}
  foo() {}
}

class D02 extends C02 {
  static {
    seq02("D");
  }
}



let strseq03 = "";
function seq03(i: string) {
  strseq03 += i;
}

class A03 {
  static {
    seq03("A");
  }
}

class B03 extends A03 {
  static {
    seq03("B");
    throw new Error("initialization has stopped");
  }
}

class C03 extends B03 {
  static s: number;
  f: number = 0;
  static {
    seq03("C");
  }
  static foo() {}
  foo() {}
}

class D03 extends C03 {
  static {
    seq03("D");
  }
}



export default function StaticInitializationIncompleteTest():void {
  describe('StaticInitializationIncompleteTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_INCOMPLETE_0100
     * @tc.name      testIncompleteStaticInitialization0001
     * @tc.desc      None of the operations above invokes a static initialization recursively if the static initialization of the same entity is not complete
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIncompleteStaticInitialization0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = false;
      try {
        C00.foo();
      } catch (e) {
        res = true;
      }
      expect(res).assertTrue();
      expect(strseq00).assertEqual("AB");
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_INCOMPLETE_0200
     * @tc.name      testIncompleteStaticInitialization0002
     * @tc.desc      None of the operations above invokes a static initialization recursively if the static initialization of the same entity is not complete
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIncompleteStaticInitialization0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = false;
      try {
        C01.s;
      } catch (e) {
        res = true;
      }
      expect(res).assertTrue();
      expect(strseq01).assertEqual("AB");
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_INCOMPLETE_0300
     * @tc.name      testIncompleteStaticInitialization0003
     * @tc.desc      None of the operations above invokes a static initialization recursively if the static initialization of the same entity is not complete
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIncompleteStaticInitialization0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = false;
      try {
        new C02();
      } catch (e) {
        res = true;
      }
      expect(res).assertTrue();
      expect(strseq02).assertEqual("AB");
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_INCOMPLETE_0400
     * @tc.name      testIncompleteStaticInitialization0004
     * @tc.desc      None of the operations above invokes a static initialization recursively if the static initialization of the same entity is not complete
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testIncompleteStaticInitialization0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res = false;
      try {
        new D03();
      } catch (e) {
        res = true;
      }
      expect(res).assertTrue();
      expect(strseq03).assertEqual("AB");
    });
  })

}
