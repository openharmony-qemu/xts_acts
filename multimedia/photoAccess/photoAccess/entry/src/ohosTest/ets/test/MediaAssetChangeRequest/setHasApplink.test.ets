/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import common from '@ohos.app.ability.common';
import { describe, it, expect, Level } from '@ohos/hypium';
import dataSharePredicates from '@ohos.data.dataSharePredicates'

export default function setHasApplinkChangeRequestTest() {

  describe('setHasApplinkChangeRequestTest', () => {

    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_SET_HAS_APPLINK_CHANGE_REQUEST_1000
     * @tc.name      : set_has_applink_change_request_000
     * @tc.desc      : set has applink
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('set_has_applink_change_request_000', Level.LEVEL0, async (done: Function) => {
      let testNum = 'set_has_applink_change_request_000';
      try {
        predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, 1);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['has_applink'],
          predicates: predicates
        };
        let photoFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOptions);
        let photoAsset: photoAccessHelper.PhotoAsset = await photoFetchResult.getFirstObject();
        let old_photoAsset_hasApplink = photoAsset.get('has_applink');
        expect(0).assertEqual(old_photoAsset_hasApplink);
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
        let newHasApplink = 1;
        assetChangeRequest.setHasAppLink(newHasApplink);
        await helper.applyChanges(assetChangeRequest).then(() => {
          console.error(`${testNum} failed`);
        });
        expect(photoAsset.get('has_applink')).assertEqual(newHasApplink);
        done();
      } catch (error) {
        console.info(`${testNum} successed with error: ${error}`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_SET_HAS_APPLINK_CHANGE_REQUEST_1000
     * @tc.name      : set_has_applink_change_request_001
     * @tc.desc      : set has applink
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('set_has_applink_change_request_001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'set_has_applink_change_request_001';
      try {
        predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, 1);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['has_applink'],
          predicates: predicates
        };
        let photoFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOptions);
        let photoAsset: photoAccessHelper.PhotoAsset = await photoFetchResult.getFirstObject();
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
        let newHasApplink = 2;
        assetChangeRequest.setHasAppLink(newHasApplink);
        await helper.applyChanges(assetChangeRequest).then(() => {
          console.error(`${testNum} failed`);
        });
        expect(photoAsset.get('has_applink')).assertEqual(newHasApplink);
        done();
      } catch (error) {
        console.info(`${testNum} successed with error: ${error}`);
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_SET_HAS_APPLINK_CHANGE_REQUEST_1000
     * @tc.name      : set_has_applink_change_request_002
     * @tc.desc      : set has applink
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('set_has_applink_change_request_002', Level.LEVEL0, async (done: Function) => {
      let testNum = 'set_has_applink_change_request_002';
      try {
        predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, 1);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['has_applink'],
          predicates: predicates
        };
        let photoFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOptions);
        let photoAsset: photoAccessHelper.PhotoAsset = await photoFetchResult.getFirstObject();
        let old_photoAsset_hasApplink = photoAsset.get('has_applink');
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
        let newHasApplink = 3;
        assetChangeRequest.setHasAppLink(newHasApplink);
        await helper.applyChanges(assetChangeRequest).then(() => {
          console.error(`${testNum} failed`);
        });
        expect(photoAsset.get('has_applink')).assertEqual(old_photoAsset_hasApplink);
        done();
      } catch (error) {
        console.info(`${testNum} successed with error: ${error}`);
        done();
      }
    });

  })
}
