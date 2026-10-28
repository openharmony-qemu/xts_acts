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

import { afterEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function ImageCollectionTakeItemByNodeIdTest() {

  describe('ImageCollectionTakeItemByNodeIdTest', () => {
    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /**
     * @tc.name   ImageCollectionTakeItemByNodeIdTest001
     * @tc.number SUB_ARKUI_CAPI_IMAGECOLLECTIONTAKEITEMBYNODEID_0100
     * @tc.desc   Test ImageCollectionTakeItemByNodeId error codes and async collection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ImageCollectionTakeItemByNodeIdTest001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'ImageCollectionTakeItemByNodeId';
      await Utils.pushPage(`node/${PAGE_TAG}`);
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('text_repeat_id').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('text_repeat1_id').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('text_repeat2_id').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('text_repeat3_id').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('text_repeat4_id').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('text_repeat5_id').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('text_repeat6_id').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('text_repeat7_id').$attrs.backgroundColor).assertEqual('#FF00FF00')
      expect(Utils.getComponentInfoByKey('text_repeat8_id').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done();
    });

  })
}
