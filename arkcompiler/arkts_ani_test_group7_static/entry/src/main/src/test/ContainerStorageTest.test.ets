'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index.ets";
import {
  NativeResource,
  ResourceMapManager,
  ResourceSetManager,
  DynamicArrayManager,
  FixedArrayManager,
  MixedArrayManager
} from '../ets/Index.ets';

const FIXED_ARRAY_SIZE: int = 5;
const MIXED_INT_VALUE_0: int = 10;
const MIXED_INT_VALUE_1: int = 20;
const MIXED_INT_VALUE_2: int = 30;
const MIXED_REF_VALUE: int = 100;
const OUT_OF_BOUNDS_INDEX: int = 10;

export default function containerStorageTest(): void {
  describe("ContainerStorageTest", (): void => {

    /**
     * @tc.number    SUB_ANI_NATIVE_OBJ_CONTAINER_MAP_0100
     * @tc.name      test_mapContainerStorage_0001
     * @tc.desc      Scenario 3.1: Native object stored in Map container
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_ANI_NATIVE_OBJ_CONTAINER_MAP_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ResourceMapManager();
        let res1 = manager.createResourceWithKey("key1");
        manager.addResourceToMap("key1", res1);
        let res2 = manager.createResourceWithKey("key2");
        manager.addResourceToMap("key2", res2);
        expect(manager.getMapSize()).assertEqual(2);
        let retrieved = manager.getResourceFromMap("key1");
        expect(retrieved != null).assertTrue();
        let removed = manager.removeResourceFromMap("key1");
        expect(removed).assertTrue();
        expect(manager.getMapSize()).assertEqual(1);
        done();
      });

    /**
     * @tc.number    SUB_ANI_NATIVE_OBJ_CONTAINER_SET_0200
     * @tc.name      test_setContainerStorage_0002
     * @tc.desc      Scenario 3.2: Native object stored in Set container
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_ANI_NATIVE_OBJ_CONTAINER_SET_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new ResourceSetManager();
        let res1 = manager.createUniqueResource(1);
        let added = manager.addResourceToSet(res1);
        expect(added).assertTrue();
        let res2 = manager.createUniqueResource(2);
        added = manager.addResourceToSet(res2);
        expect(added).assertTrue();
        expect(manager.getSetSize()).assertEqual(2);
        expect(manager.hasResourceInSet(res1)).assertTrue();
        let deleted = manager.deleteResourceFromSet(res1);
        expect(deleted).assertTrue();
        expect(manager.getSetSize()).assertEqual(1);
        done();
      });

    /**
     * @tc.number    SUB_ANI_NATIVE_OBJ_ARRAY_DYNAMIC_0100
     * @tc.name      test_dynamicArrayStorage_0003
     * @tc.desc      Scenario 4.1: Native object stored in dynamic Array<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_ANI_NATIVE_OBJ_ARRAY_DYNAMIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new DynamicArrayManager();
        let res1 = manager.createNativeResource();
        let newLength = manager.pushResourceToArray(res1);
        expect(newLength).assertEqual(1);
        let res2 = manager.createNativeResource();
        newLength = manager.pushResourceToArray(res2);
        expect(newLength).assertEqual(2);
        let retrieved = manager.getResourceFromArray(0);
        expect(retrieved != null).assertTrue();
        let res3 = manager.createNativeResource();
        manager.setResourceInArray(0, res3);
        retrieved = manager.getResourceFromArray(0);
        expect(retrieved != null).assertTrue();
        let popped = manager.popResourceFromArray();
        expect(popped != null).assertTrue();
        expect(manager.getArrayLength()).assertEqual(1);
        done();
      });

    /**
     * @tc.number    SUB_ANI_NATIVE_OBJ_ARRAY_FIXED_0200
     * @tc.name      test_fixedArrayStorage_0004
     * @tc.desc      Scenario 4.2: Native object stored in FixedArray<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_ANI_NATIVE_OBJ_ARRAY_FIXED_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new FixedArrayManager();
        manager.fixedResourceArray = manager.createFixedArray(FIXED_ARRAY_SIZE);
        expect(manager.fixedResourceArray != null).assertTrue();
        expect(manager.getFixedArrayLength()).assertEqual(FIXED_ARRAY_SIZE);
        let res1 = new NativeResource();
        res1.value = MIXED_INT_VALUE_0;
        manager.setResourceInFixedArray(0, res1);
        let res2 = new NativeResource();
        res2.value = MIXED_INT_VALUE_1;
        manager.setResourceInFixedArray(1, res2);
        let retrieved = manager.getResourceFromFixedArray(0);
        expect(retrieved != null).assertTrue();
        expect(retrieved!.value).assertEqual(MIXED_INT_VALUE_0);
        let outOfBound = manager.getResourceFromFixedArray(OUT_OF_BOUNDS_INDEX);
        expect(outOfBound == null).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_NATIVE_OBJ_ARRAY_FIXED_MIXED_0300
     * @tc.name      test_mixedFixedArrayStorage_0005
     * @tc.desc      Scenario 4.3: FixedArray with mixed primitive types and Native objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_ANI_NATIVE_OBJ_ARRAY_FIXED_MIXED_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new MixedArrayManager();
        manager.intFixedArray = manager.createIntFixedArray(3);
        manager.setIntValue(0, MIXED_INT_VALUE_0);
        manager.setIntValue(1, MIXED_INT_VALUE_1);
        manager.setIntValue(2, MIXED_INT_VALUE_2);
        expect(manager.getIntValue(0)).assertEqual(MIXED_INT_VALUE_0);
        expect(manager.getIntValue(1)).assertEqual(MIXED_INT_VALUE_1);
        manager.refFixedArray = manager.createRefFixedArray(2);
        let res1 = new NativeResource();
        res1.value = MIXED_REF_VALUE;
        manager.setNativeResource(0, res1);
        let retrieved = manager.getNativeResource(0);
        expect(retrieved != null).assertTrue();
        expect(retrieved!.value).assertEqual(MIXED_REF_VALUE);
        done();
      });
  })
}
