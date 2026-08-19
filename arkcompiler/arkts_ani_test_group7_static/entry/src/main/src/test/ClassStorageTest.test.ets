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
  NativeObjectHolder,
  ResourceContainer,
  GlobalResourceManager,
  DataHolderImpl,
  ResourceCollectionImpl,
  IDataHolder,
  IResourceCollection
} from '../ets/Index.ets';

const FIELD_INIT_VALUE: int = 42;
const STATIC_INIT_VALUE: int = 100;
const STATIC_UPDATED_VALUE: int = 200;

export default function classStorageTest(): void {
  describe("ClassStorageTest", (): void => {

    /**
     * @tc.number    SUB_ANI_NATIVE_OBJ_CLASS_FIELD_0100
     * @tc.name      test_classFieldStorage_0001
     * @tc.desc      Scenario 1.1: Native object stored in class field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_classFieldStorage_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let holder = new NativeObjectHolder();
        holder.nativeObj = holder.createAndStoreNativeObject();
        expect(holder.nativeObj != null).assertTrue();
        let value = holder.getNativeObjectValue();
        expect(value).assertEqual(FIELD_INIT_VALUE);
        holder.setNativeObjectValue(STATIC_UPDATED_VALUE);
        value = holder.getNativeObjectValue();
        expect(value).assertEqual(STATIC_UPDATED_VALUE);
        done();
      });

    /**
     * @tc.number    SUB_ANI_NATIVE_OBJ_CLASS_PROPERTY_0200
     * @tc.name      test_classPropertyStorage_0002
     * @tc.desc      Scenario 1.2: Native object stored in class property (interface inheritance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_classPropertyStorage_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let container = new ResourceContainer();
        container.resource = container.createResource();
        let data = container.getResourceData();
        expect(data).assertEqual(FIELD_INIT_VALUE);
        done();
      });

    /**
     * @tc.number    SUB_ANI_NATIVE_OBJ_CLASS_STATIC_FIELD_0300
     * @tc.name      test_staticFieldStorage_0003
     * @tc.desc      Scenario 1.3: Native object stored in class static field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_staticFieldStorage_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new GlobalResourceManager();
        manager.initSharedResource();
        let value1 = manager.getSharedResourceValue();
        expect(value1).assertEqual(STATIC_INIT_VALUE);
        manager.updateSharedResourceValue(STATIC_UPDATED_VALUE);
        let value2 = manager.getSharedResourceValue();
        expect(value2).assertEqual(STATIC_UPDATED_VALUE);
        let value3 = manager.getSharedResourceValue();
        expect(value3).assertEqual(STATIC_UPDATED_VALUE);
        done();
      });

    /**
     * @tc.number    SUB_ANI_NATIVE_OBJ_INTERFACE_PROPERTY_0100
     * @tc.name      test_interfacePropertyStorage_0004
     * @tc.desc      Scenario 2.1: Native object stored in interface property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_interfacePropertyStorage_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let holder: IDataHolder = new DataHolderImpl();
        holder.data = (holder as DataHolderImpl).createNativeData();
        let value = (holder as DataHolderImpl).getDataValue();
        expect(value).assertEqual(FIELD_INIT_VALUE);
        done();
      });

    /**
     * @tc.number    SUB_ANI_NATIVE_OBJ_INTERFACE_ARRAY_PROPERTY_0200
     * @tc.name      test_interfaceArrayProperty_0005
     * @tc.desc      Scenario 2.2: Native object array stored in interface array property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_interfaceArrayProperty_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let collection: IResourceCollection = new ResourceCollectionImpl();
        let res1 = new NativeResource();
        res1.value = 10;
        (collection as ResourceCollectionImpl).addResource(res1);
        let res2 = new NativeResource();
        res2.value = 20;
        (collection as ResourceCollectionImpl).addResource(res2);
        expect((collection as ResourceCollectionImpl).getResourceCount()).assertEqual(2);
        let first = (collection as ResourceCollectionImpl).getResourceAtIndex(0);
        expect(first != null).assertTrue();
        expect(first!.value).assertEqual(10);
        done();
      });
  })
}
