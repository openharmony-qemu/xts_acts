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
  NativeKeyMapManager,
  NativeKeyBasicMapManager
} from '../ets/Index.ets';

export default function mapKeyStorageTest(): void {
  describe("MapKeyStorageTest", (): void => {

    /**
     * @tc.number    SUB_ANI_MAP_NATIVE_KEY_0100
     * @tc.name      test_nativeObjectAsMapKey_0001
     * @tc.desc      Scenario 9.1: Native object as key of ConcurrentHashMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_ANI_MAP_NATIVE_KEY_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new NativeKeyMapManager();
        expect(manager.testNativeObjectAsMapKeyNative()).assertTrue();
        expect(manager.testNativeKeyMapGetNative()).assertTrue();
        expect(manager.testNativeKeyMapRemoveNative()).assertTrue();
        done();
      });

    /**
     * @tc.number    SUB_ANI_MAP_NATIVE_KEY_0200
     * @tc.name      test_nativeObjectAsBasicMapKey_0002
     * @tc.desc      Scenario 9.2: Native object as key of native Map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_ANI_MAP_NATIVE_KEY_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      (done: () => void): void => {
        let manager = new NativeKeyBasicMapManager();
        expect(manager.testNativeKeyBasicMapNative()).assertTrue();
        done();
      });
  })
}
