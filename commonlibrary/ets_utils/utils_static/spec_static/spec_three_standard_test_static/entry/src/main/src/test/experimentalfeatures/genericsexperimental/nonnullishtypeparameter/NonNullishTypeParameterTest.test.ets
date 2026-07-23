'use static'
/*
---
Copyright (c) 2025 Huawei Device Co., Ltd.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
---
*/

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';
import Utils from '../../../Util.test'

class MyBase {}

class A<T extends MyBase | null> {
  foo(p:T): NonNullable<T> {
    return p!
  }
}

class MyBase1 {}

type TMyBase = MyBase1
type TMyBaseNullable = MyBase1 | null

class A1<T extends MyBase1 | null> {
  foo(p:T): NonNullable<T> {
    return p!
  }
}

class MyBase2 {}

type TMyBase1 = MyBase2
type TMyBaseUndefineable = MyBase2 | undefined

class A2<T extends MyBase2 | undefined> {
  foo(p:T): NonNullable<T> {
    return p!
  }
}

class MyBase3 {}

type TMyBase2 = MyBase3
type TMyBaseUndefineableNullable = MyBase3 | undefined | null

class A3<T extends MyBase3 | undefined | null> {
  foo(p:T): NonNullable<T> {
    return p!
  }
}

interface IMyInterface {}

class A4<T extends IMyInterface | undefined | null> {
  foo(p:T): NonNullable<T> {
    return p!
  }
}

export default function NonNullishTypeParameterTest(): void {
  describe('NonNullishTypeParameterTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
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
     * @tc.number    SUB_NONNULLISH_TYPEPARAMETER_XTSTEST_0100
     * @tc.name      testNonNullishTypeParameter0001
     * @tc.desc      desc: NonNullish Type Parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullishTypeParameter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let a = new A<MyBase>
      let result: MyBase = a.foo(new MyBase)
      expect(result === null).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NONNULLISH_TYPEPARAMETER_XTSTEST_0200
     * @tc.name      testNonNullishTypeParameter0002
     * @tc.desc      desc: NonNullish Type Parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullishTypeParameter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let a = new A1<TMyBaseNullable>
      let result: TMyBase = a.foo(new MyBase1)
      expect(result === null).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NONNULLISH_TYPEPARAMETER_XTSTEST_0300
     * @tc.name      testNonNullishTypeParameter0003
     * @tc.desc      desc: NonNullish Type Parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullishTypeParameter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let a = new A2<TMyBaseUndefineable>
      let result: MyBase2 = a.foo(new MyBase2)
      expect(result === null).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NONNULLISH_TYPEPARAMETER_XTSTEST_0400
     * @tc.name      testNonNullishTypeParameter0004
     * @tc.desc      desc: NonNullish Type Parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullishTypeParameter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let a = new A3<TMyBaseUndefineableNullable>
      let result: MyBase3 = a.foo(new MyBase3)
      expect(result === null).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NONNULLISH_TYPEPARAMETER_XTSTEST_0500
     * @tc.name      testNonNullishTypeParameter0005
     * @tc.desc      desc: NonNullish Type Parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNonNullishTypeParameter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let a = new A4<IMyInterface>
      let result: IMyInterface = a.foo({})
      expect(result === null).assertEqual(false);
    });
  })
}