'use static';
/*
* Copyright (c) 2024-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

interface I {}
class A {
  fld: string = ''
}

final class F extends A implements I {}

interface I1 {}
class A1<T extends I1> {}
final class F1<T extends I1> extends A1<T> {}

class A2 {
  bar(): int {
    return 5;
  }
}

final class B extends A2 {}




export default function FinalClassTest(): void {
  describe('FinalClassTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
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
     * @tc.number    SUB_FINAL_CLASS_XTSTEST_0100
     * @tc.name      testFinalClass0001
     * @tc.desc      desc: A class may be declared final to prevent its extension. A class declared final
                     cannot have subclasses, and no method of a final class can be overridden.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFinalClass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let f: F = new F()
      expect(f instanceof F && f instanceof A && f instanceof I && f.fld == '' ).assertTrue()
      f = { fld: 'ABC' }
      expect(f.fld).assertEqual('ABC' )

    });

    /**
     * @tc.number    SUB_FINAL_CLASS_XTSTEST_0200
     * @tc.name      testFinalClass0002
     * @tc.desc      desc: A class may be declared final to prevent its extension. A class declared final
                     cannot have subclasses, and no method of a final class can be overridden.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFinalClass0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let f: F1<I1> = new F1<I1>()
      expect( f instanceof F1 ).assertTrue()

    });

    /**
     * @tc.number    SUB_FINAL_CLASS_XTSTEST_0300
     * @tc.name      testFinalClass0003
     * @tc.desc      desc: Declaration of a final class and inheritance from a parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFinalClass0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      let instance: B = new B();
      expect(instance.bar()).assertEqual(5);

    });
  })
}
