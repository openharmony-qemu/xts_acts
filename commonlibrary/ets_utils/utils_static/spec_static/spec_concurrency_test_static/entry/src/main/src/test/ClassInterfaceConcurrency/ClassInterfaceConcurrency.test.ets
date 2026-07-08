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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import hilog from '@ohos.hilog'

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class BaseNonAsyncClass {
  m(): Promise<number> {
    return Promise.resolve(10.0);
  }
}

class DerivedAsyncOverrideClass extends BaseNonAsyncClass {
  override async m(): Promise<number> {
    return 20;
  }
}

class BaseAsyncClass {
  async m(): Promise<number> {
    return 30;
  }
}

class DerivedNonAsyncOverrideClass extends BaseAsyncClass {
  override m(): Promise<number> {
    return Promise.resolve(40.0);
  }
}

class BaseAsyncReturnThisClass {
  public value: int = 50;
  async m(): Promise<this> {
    return this;
  }
}

class DerivedNonAsyncReturnThisClass extends BaseAsyncReturnThisClass {
  override m(): Promise<this> {
    return Promise.resolve(this);
  }
}

export default function ClassInterfaceConcurrencyTest():void {
  describe('ClassInterfaceConcurrencyTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach(async (): Promise<void> => {
      await sleep(30);
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.number SUB_SPEC_CLASS_INTERFACE_CONCURRENCY_0100
     * @tc.name OverrideAsyncVsNonAsyncTest
     * @tc.desc test subclass override async vs superclass non-async: async modifier not part of function type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('OverrideAsyncVsNonAsyncTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-086: subclass override async vs superclass non-async
      let base: BaseNonAsyncClass = new BaseNonAsyncClass();
      let baseResult: number = await base.m();
      expect(baseResult).assertEqual(10);

      let derived: DerivedAsyncOverrideClass = new DerivedAsyncOverrideClass();
      let derivedResult: number = await derived.m();
      expect(derivedResult).assertEqual(20);

      let polymorphic: BaseNonAsyncClass = new DerivedAsyncOverrideClass();
      let polyResult: number = await polymorphic.m();
      expect(polyResult).assertEqual(20);
    });

    /**
     * @tc.number SUB_SPEC_CLASS_INTERFACE_CONCURRENCY_0200
     * @tc.name OverrideNonAsyncVsAsyncTest
     * @tc.desc test subclass override non-async vs superclass async: async modifier not part of function type, type equivalent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('OverrideNonAsyncVsAsyncTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-087: superclass async vs subclass non-async override
      let base: BaseAsyncClass = new BaseAsyncClass();
      let baseResult: number = await base.m();
      expect(baseResult).assertEqual(30);
      
      let derived: DerivedNonAsyncOverrideClass = new DerivedNonAsyncOverrideClass();
      let derivedResult: number = await derived.m();
      expect(derivedResult).assertEqual(40);
      
      let polymorphic: BaseAsyncClass = new DerivedNonAsyncOverrideClass();
      let polyResult: number = await polymorphic.m();
      expect(polyResult).assertEqual(40);
    });

    /**
     * @tc.number SUB_SPEC_CLASS_INTERFACE_CONCURRENCY_0300
     * @tc.name OverrideReturnThisAsyncVsNonAsyncTest
     * @tc.desc test override with Promise<this> return type: async/non-async both valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('OverrideReturnThisAsyncVsNonAsyncTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // Extended test: override with Promise<this>
      let base: BaseAsyncReturnThisClass = new BaseAsyncReturnThisClass();
      let baseResult: BaseAsyncReturnThisClass = await base.m();
      expect(baseResult.value).assertEqual(50);
      expect(baseResult === base).assertTrue();
      
      let derived: DerivedNonAsyncReturnThisClass = new DerivedNonAsyncReturnThisClass();
      derived.value = 60;
      let derivedResult: DerivedNonAsyncReturnThisClass = await derived.m();
      expect(derivedResult.value).assertEqual(60);
      expect(derivedResult === derived).assertTrue();
    });




  });
}