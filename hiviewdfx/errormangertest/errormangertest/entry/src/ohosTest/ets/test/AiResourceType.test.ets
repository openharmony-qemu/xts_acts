/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "@ohos/hypium"
import { errorManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default function ResourceTypeTest() {
  describe('ResourceTypeTest', () => {
    beforeAll(() => {
      console.info("====> ResourceTypeTest beforeAll start");
    })
    beforeEach(() => {
      console.info("====> ResourceTypeTest beforeEach start");
    })
    afterEach(() => {
      console.info("====> ResourceTypeTest afterEach start");
    })
    afterAll(() => {
      console.info("====> ResourceTypeTest afterAll start");
    })

    /**
     * @tc.name   testResourceType_PSS_MEMORY_0100
     * @test.number SUB_DFX_DFR_ResourceType_PSS_MEMORY_0100
     * @tc.desc   验证ResourceType.PSS_MEMORY枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResourceType_PSS_MEMORY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testResourceType_PSS_MEMORY_0100 start");
      try {
        expect(errorManager.ResourceType.PSS_MEMORY).assertEqual(1);
        console.info("====> testResourceType_PSS_MEMORY_0100 end");
        done();
      } catch (err) {
        console.error(`====> testResourceType_PSS_MEMORY_0100 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testResourceType_ION_MEMORY_0100
     * @test.number SUB_DFX_DFR_ResourceType_ION_MEMORY_0100
     * @tc.desc   验证ResourceType.ION_MEMORY枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResourceType_ION_MEMORY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testResourceType_ION_MEMORY_0100 start");
      try {
        expect(errorManager.ResourceType.ION_MEMORY).assertEqual(2);
        console.info("====> testResourceType_ION_MEMORY_0100 end");
        done();
      } catch (err) {
        console.error(`====> testResourceType_ION_MEMORY_0100 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testResourceType_ASHMEM_MEMORY_0100
     * @test.number SUB_DFX_DFR_ResourceType_ASHMEM_MEMORY_0100
     * @tc.desc   验证ResourceType.ASHMEM_MEMORY枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResourceType_ASHMEM_MEMORY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testResourceType_ASHMEM_MEMORY_0100 start");
      try {
        expect(errorManager.ResourceType.ASHMEM_MEMORY).assertEqual(3);
        console.info("====> testResourceType_ASHMEM_MEMORY_0100 end");
        done();
      } catch (err) {
        console.error(`====> testResourceType_ASHMEM_MEMORY_0100 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testResourceType_FD_0100
     * @test.number SUB_DFX_DFR_ResourceType_FD_0100
     * @tc.desc   验证ResourceType.FD枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResourceType_FD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testResourceType_FD_0100 start");
      try {
        expect(errorManager.ResourceType.FD).assertEqual(5);
        console.info("====> testResourceType_FD_0100 end");
        done();
      } catch (err) {
        console.error(`====> testResourceType_FD_0100 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testResourceType_THREAD_0100
     * @test.number SUB_DFX_DFR_ResourceType_THREAD_0100
     * @tc.desc   验证ResourceType.THREAD枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResourceType_THREAD_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testResourceType_THREAD_0100 start");
      try {
        expect(errorManager.ResourceType.THREAD).assertEqual(6);
        console.info("====> testResourceType_THREAD_0100 end");
        done();
      } catch (err) {
        console.error(`====> testResourceType_THREAD_0100 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testResourceType_GPU_MEMORY_0100
     * @test.number SUB_DFX_DFR_ResourceType_GPU_MEMORY_0100
     * @tc.desc   验证ResourceType.GPU_MEMORY枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResourceType_GPU_MEMORY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testResourceType_GPU_MEMORY_0100 start");
      try {
        expect(errorManager.ResourceType.GPU_MEMORY).assertEqual(4);
        console.info("====> testResourceType_GPU_MEMORY_0100 end");
        done();
      } catch (err) {
        console.error(`====> testResourceType_GPU_MEMORY_0100 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    })
  })
}
