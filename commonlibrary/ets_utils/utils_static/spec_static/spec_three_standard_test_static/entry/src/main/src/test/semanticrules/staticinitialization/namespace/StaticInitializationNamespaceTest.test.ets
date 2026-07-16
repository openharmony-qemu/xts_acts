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
import Utils from '../../../Util.test'



namespace ns00 {
  export class A00 {
    static f: number;
  }
  export class C00 {
    static s: number = 1;
    static {
      A00.f = 3;
    }
  }
  static {
    A00.f = 2;
  }
  export let i00: string = "";
}

namespace ns01 {
  export let f01: number;
  static {
    f01 = 1;
  }
}

namespace ns02 {
  export function foo02(): number {
    return v02;
  }
  let v02: number;
  static {
    v02 = 1;
  }
}

interface I03 { i: string }
namespace ns03 {
  export interface I03 { i: string }
  export let v03: I03;
  static {
    v03 = { i: "some str" };
  }
}

let seqstr04 = "";
function seq04(i: string) {
  seqstr04 += ":" + i;
}

namespace ns0401 {
  export let d0401: number = 1;
  static {
    seq04("A");
  }
  export namespace ns0402 {
    export let i0402: number = 2;
    static {
      seq04("B");
    }
  }
}

let seqstr05 = "";
function seq05(i: string) {
  seqstr05 += ":" + i;
}

namespace ns0501 {
  export let d0501: number = 1;
  static {
    seq05("A");
  }
  export namespace ns0502 {
    export let i0502: number = 2;
    static {
      seq05("B");
    }
  }
}

namespace ns0601 {
  export let i0601: string;
  static {
    i0601 = "ns1 initialized";
  }
}

namespace ns0602 {
  export let i0602: string;
  static {
    i0602 = "ns2 initialized";
  }
}

namespace ns0603 {
  export let i0603: number;
  static {
    i0603 = 2;
  }
}

export default function StaticInitializationNamespaceTest():void {
  describe('StaticInitializationNamespaceTest', () => {
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
      seqstr04 = "";
      seqstr05 = "";
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_NAMESPACE_0100
     * @tc.name      testNamespaceStaticInitialization0001
     * @tc.desc      For namespaces, the code in a static block is executed only when namespace members are used in the program
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceStaticInitialization0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns00.A00.f).assertEqual(0);
      expect(ns00.C00.s).assertEqual(1);
      expect(ns00.A00.f).assertEqual(3);
      ns00.i00 = "str";
      expect(ns00.A00.f).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_NAMESPACE_0200
     * @tc.name      testNamespaceStaticInitialization0002
     * @tc.desc      For namespaces, call namespace field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceStaticInitialization0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns01.f01).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_NAMESPACE_0300
     * @tc.name      testNamespaceStaticInitialization0003
     * @tc.desc      For namespaces, call namespace function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceStaticInitialization0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns02.foo02()).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_NAMESPACE_0400
     * @tc.name      testNamespaceStaticInitialization0004
     * @tc.desc      For namespaces, use interface field of the namespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNamespaceStaticInitialization0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns03.v03.i).assertEqual("some str");
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_NAMESPACE_0500
     * @tc.name      testInnerNamespaces0005
     * @tc.desc      For namespaces, the code in a static block is executed only when namespace members are used
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInnerNamespaces0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(seqstr04).assertEqual("");
      ns0401.d0401;
      expect(seqstr04).assertEqual(":A");
      ns0401.ns0402.i0402;
      expect(seqstr04).assertEqual(":A:B");
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_NAMESPACE_0600
     * @tc.name      testInnerNamespaces0006
     * @tc.desc      Static initializer of the namespace in not called in case when its inner namespace member is in use
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInnerNamespaces0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(seqstr05).assertEqual("");
      ns0501.ns0502.i0502;
      expect(seqstr05).assertEqual(":B");
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_NAMESPACE_0700
     * @tc.name      testNumerousNamespaces0007
     * @tc.desc      Static initializers from multiple namespaces work independently
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumerousNamespaces0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ns0601.i0601).assertEqual("ns1 initialized");
      expect(ns0602.i0602).assertEqual("ns2 initialized");
      expect(ns0603.i0603).assertEqual(2);
    });
  })
}
