/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import {
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from '../../../../../hypium/index';


async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class A {
  public foo(): int {
    return 5;
  }
}

class Point {
  public x: number
  public y: number
  public constructor(x: number, y: number) {
    this.x = x
    this.y = y
  }
  public distanceBetween(other: Point): number {
    return Math.sqrt(
      (this.x - other.x) * (this.x - other.x) +
        (this.y - other.y) * (this.y - other.y)
    )
  }
}


export default function InstanceMethodsTest():void {
  describe('InstanceMethodsTest', () => {
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
     * @tc.number    SUB_INSTANCE_METHODSTEST_0100
     * @tc.name      testInstanceMethods0001
     * @tc.desc      Instance method call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstanceMethods0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInstanceMethods0001';
      let instance: A = new A();
      expect( instance.foo()).assertEqual(5);
    });

    /**
     * @tc.number    SUB_INSTANCE_METHODSTEST_0200
     * @tc.name      testInstanceMethods0002
     * @tc.desc      An instance method is always called with respect to an object that becomes the current object
     * which the keyword this refers to during method execution
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInstanceMethods0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testInstanceMethods0002';
      let p1: Point = new Point(0, 0);
      let p2: Point = new Point(3, 4);

      // When called on p1, 'this' refers to p1
      let dist1: number = p1.distanceBetween(p2);
      expect(dist1).assertEqual(5);

      // When called on p2, 'this' refers to p2
      let dist2: number = p2.distanceBetween(p1);
      expect(dist2).assertEqual(5);
    });







  })
}