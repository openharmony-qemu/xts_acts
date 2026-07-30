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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class C {
  fld: string = '';
  constructor() {
    this.fld += 'C';
  }
  constructor(p: number) {
    this.fld += 'N';
  }
  static $_invoke(): C {
    let x = new C();
    x.fld += 'I';
    return x;
  }
  static $_invoke(p: number): C {
    let x = new C(p);
    x.fld += 'J';
    return x;
  }
}

class C1 {
  fld: string = '';
  constructor() {
    this.fld += 'C';
  }
  constructor(p: number) {
    this.fld += 'N';
  }
  static $_instantiate(f: ()=>C1): C1 {
    let x = f();
    x.fld += 'I';
    return x;
  }
  static $_instantiate(f: ()=>C1, p: number): C1 {
    let x = f();
    x.fld += 'J';
    return x;
  }
}

export default function CallableTypesTest(): void{
  describe('CallableTypesTest', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    })

    /**
     * @tc.number    SUB_CALLABLE_TYPES_XTSTEST_0100
     * @tc.name      testCallableTypes0001
     * @tc.desc      Only a constructor - not the methods invoke or instantiate - is called in a
     *                 new expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypes0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new C().fld).assertEqual('C');
      expect(new C(42.0).fld).assertEqual('N');
      expect(C().fld).assertEqual('CI');
      expect(C(42.0).fld).assertEqual('NJ');
      expect(C.$_invoke().fld).assertEqual('CI');
      expect(C.$_invoke(42.0).fld).assertEqual('NJ');
    });

    /**
     * @tc.number    SUB_CALLABLE_TYPES_XTSTEST_0200
     * @tc.name      testCallableTypes0002
     * @tc.desc      Only a constructor - not the methods invoke or instantiate - is called in a
     *                 new expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCallableTypes0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new C1().fld).assertEqual('C');
      expect(new C1(42.0).fld).assertEqual('N');
      expect(C1().fld).assertEqual('CI');
      expect(C1(42.0).fld).assertEqual('CJ');
      expect(C1.$_instantiate(() => new C1()).fld).assertEqual('CI');
      expect(C1.$_instantiate(() => new C1(), 42.0).fld).assertEqual('CJ');
    });

  });
}
