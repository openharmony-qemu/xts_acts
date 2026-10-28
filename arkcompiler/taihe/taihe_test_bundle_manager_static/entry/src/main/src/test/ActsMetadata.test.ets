'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import * as test_bundle from '../ets/metadata'

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function metadataTest(): void {
  describe("ActsMetadataTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_Metadata_Static_0100
     * @tc.name      test_metadata_name_0001
     * @tc.desc      Test Metadata name setter and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_metadata_name_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_metadata_name_0001 start');
      let metadata_ = test_bundle.getMetadata();
      metadata_.name = "bob";
      expect(metadata_.name).assertEqual("bob");
      console.log('test_metadata_name_0001 done');
      done();
      console.log('test_metadata_name_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Metadata_Static_0200
     * @tc.name      test_metadata_value_0001
     * @tc.desc      Test Metadata value setter and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_metadata_value_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_metadata_value_0001 start');
      let metadata_ = test_bundle.getMetadata();
      metadata_.value = "apple";
      expect(metadata_.value).assertEqual("apple");
      console.log('test_metadata_value_0001 done');
      done();
      console.log('test_metadata_value_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Metadata_Static_0300
     * @tc.name      test_metadata_resource_0001
     * @tc.desc      Test Metadata resource setter and getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_metadata_resource_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_metadata_resource_0001 start');
      let metadata_ = test_bundle.getMetadata();
      metadata_.resource = "food";
      expect(metadata_.resource).assertEqual("food");
      console.log('test_metadata_resource_0001 done');
      done();
      console.log('test_metadata_resource_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Metadata_Static_0400
     * @tc.name      test_metadata_valueId_0001
     * @tc.desc      Test Metadata valueId getter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_metadata_valueId_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_metadata_valueId_0001 start');
      let metadata_ = test_bundle.getMetadata();
      expect(metadata_.valueId).assertEqual(21474);
      console.log('test_metadata_valueId_0001 done');
      done();
      console.log('test_metadata_valueId_0001 end');
    });
  })
}