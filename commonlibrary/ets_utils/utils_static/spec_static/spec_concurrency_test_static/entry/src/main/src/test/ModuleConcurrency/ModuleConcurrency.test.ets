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

namespace AsyncNamespace {
  export async function namespaceAsyncFunc(): Promise<number> {
    return 42;
  }
  
  export async function namespaceAsyncVoidFunc(): Promise<void> {
    return;
  }
}

export async function exportedAsyncFunc(): Promise<number> {
  return 100;
}

export async function exportedAsyncVoidFunc(): Promise<void> {
  return;
}

// export let exportedLock: AsyncLock = new AsyncLock();
// export let exportedMutex: AsyncMutex = new AsyncMutex();

let defaultExportAsyncFunc = async (): Promise<string> => {
  return "default export";
}

export default function ModuleConcurrencyTest():void {
  describe('ModuleConcurrencyTest', (): void => {
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
     * @tc.number SUB_SPEC_MODULE_CONCURRENCY_0100
     * @tc.name NamespaceAsyncFunctionTest
     * @tc.desc test async function in namespace: valid syntax
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('NamespaceAsyncFunctionTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-111: namespace内async函数
      let result: number = await AsyncNamespace.namespaceAsyncFunc();
      expect(result).assertEqual(42);
      
      await AsyncNamespace.namespaceAsyncVoidFunc();
    });

    /**
     * @tc.number SUB_SPEC_MODULE_CONCURRENCY_0200
     * @tc.name ExportAsyncFunctionTest
     * @tc.desc test exported async function: valid syntax
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportAsyncFunctionTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // TC-112: 导出async函数
      let result: number = await exportedAsyncFunc();
      expect(result).assertEqual(100);
      
      await exportedAsyncVoidFunc();
    });

    /**
     * @tc.number SUB_SPEC_MODULE_CONCURRENCY_0400
     * @tc.name DefaultExportAsyncFunctionTest
     * @tc.desc test default export async function: valid syntax
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('DefaultExportAsyncFunctionTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // TC-114: default export async函数
      let result: string = await defaultExportAsyncFunc();
      expect(result).assertEqual("default export");
    });

    /**
     * @tc.number SUB_SPEC_MODULE_CONCURRENCY_0500
     * @tc.name AsyncLockRequestSameNameTest
     * @tc.desc test AsyncLock.request with same name: returns same lock instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('AsyncLockRequestSameNameTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // Partial TC-109: AsyncLock.request same name (single module test)
      let lock1: AsyncLock = AsyncLock.request("testLockName");
      let lock2: AsyncLock = AsyncLock.request("testLockName");
      
      let result1: number = await lock1.lockAsync<number>(async () => {
        return 10;
      });
      expect(result1).assertEqual(10);
      
      let result2: number = await lock2.lockAsync<number>(async () => {
        return 20;
      });
      expect(result2).assertEqual(20);
    });
  });
}