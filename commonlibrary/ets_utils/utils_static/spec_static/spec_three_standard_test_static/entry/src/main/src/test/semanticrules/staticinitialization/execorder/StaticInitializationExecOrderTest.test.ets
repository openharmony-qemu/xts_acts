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
} from '../../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}


let seqstr00 = "";
function seq00(i: string) {
  seqstr00 += ":" + i;
}

class A00 {
  static {
    seq00("init A");
  }
}

class B00 {
  static {
    seq00("init B");
  }
}

class C00 extends B00 {
  static {
    seq00("init C");
  }
}



let seqstr01 = "";
function seq01(i: string) {
  seq01_str += ":" + i;
}
let seq01_str = "";

class A01 {
  static {
    seq01("init A");
  }
}

class B01 extends A01 { }

class C01 extends B01 {
  static {
    seq01("init C");
  }
}



let seqstr02 = "";
function seq02(i: string) {
  seq02_str += ":" + i;
}
let seq02_str = "";

abstract class A02 {
  static {
    seq02("init A");
  }
}

class B02 extends A02 {
  static {
    seq02("init B");
  }
}


export default function StaticInitializationExecOrderTest():void {
  describe('StaticInitializationExecOrderTest', () => {
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
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_EXEC_ORDER_0100
     * @tc.name      testExtendedWithStaticInitializer0001
     * @tc.desc      Static initialization is performed before the first execution of one of the following operations - Static initialization of a direct subclass
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExtendedWithStaticInitializer0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testExtendedWithStaticInitializer0001';
      console.log(TAG + ' start');
      expect(seqstr00).assertEqual("");
      new C00();
      expect(seqstr00).assertEqual(":init B:init C");
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_EXEC_ORDER_0200
     * @tc.name      testExtendedWithStaticInitializer0002
     * @tc.desc      Static initialization is performed before the first execution of one of the following operations - Static initialization of a direct subclass
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExtendedWithStaticInitializer0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testExtendedWithStaticInitializer0002';
      console.log(TAG + ' start');
      expect(seq01_str).assertEqual("");
      new C01();
      expect(seq01_str).assertEqual(":init A:init C");
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_EXEC_ORDER_0300
     * @tc.name      testExtendedWithStaticInitializer0003
     * @tc.desc      Static initialization is performed before the first execution of one of the following operations - Static initialization of a direct subclass
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExtendedWithStaticInitializer0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testExtendedWithStaticInitializer0003';
      console.log(TAG + ' start');
      expect(seq02_str).assertEqual("");
      new B02();
      expect(seq02_str).assertEqual(":init A:init B");
    });
  })

}
