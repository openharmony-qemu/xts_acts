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
 
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import common from '@ohos.app.ability.common';
import { describe, it, expect, Level } from '@ohos/hypium';
import dataSharePredicates from '@ohos.data.dataSharePredicates'
 
export default function setHasApplinkChangeRequestTest() {
 
  describe('setHasApplinkChangeRequestTest', () => {
 
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
 
    const isEqual = async (assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest, photoAsset: photoAccessHelper.PhotoAsset, hasApplink: number) => {
      try {
        await helper.applyChanges(assetChangeRequest);
        predicates.equalTo(photoAccessHelper.PhotoKeys.URI, photoAsset.uri);
        const fetchOptionsNew: photoAccessHelper.FetchOptions = {
          fetchColumns: ['has_applink'],
          predicates: predicates
        };
        let photoFetchResultNew: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOptionsNew);
        let photoAssetNew: photoAccessHelper.PhotoAsset = await photoFetchResultNew.getFirstObject();
        let hasApplinkNew: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.HAS_APPLINK;
        expect(photoAssetNew.get(hasApplinkNew)).assertEqual(hasApplink);
      } catch (err) {
        console.error(`Do not isEqual !`);
        expect(false).assertTrue();
      }
    }
 
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_SET_HAS_APPLINK_CHANGE_REQUEST_0000
     * @tc.name      : set_has_applink_change_request_000
     * @tc.desc      : change image asset has applink
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
        let photoFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOptions);
        let photoAsset: photoAccessHelper.PhotoAsset = await photoFetchResult.getFirstObject();
        console.info(`${testNum} , old_photoAsset_hasApplink: ${photoAsset.get('has_applink')}`);
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
 
        let linkNotExist = 1;
        assetChangeRequest.setHasApplink(linkNotExist);
        try {
          await isEqual(assetChangeRequest, photoAsset, 1);
          console.info(`${testNum} successed`);
        } catch (error) {
          await isEqual(assetChangeRequest, photoAsset, 0);
          console.error(`${testNum} applyChanges failed with error: ${error}`);
        }
 
        let linkExist = 2;
        assetChangeRequest.setHasApplink(linkExist);
        try {
          await isEqual(assetChangeRequest, photoAsset, 2);
          console.info(`${testNum} successed`);
        } catch (error) {
          await isEqual(assetChangeRequest, photoAsset, 1);
          console.error(`${testNum} applyChanges failed with error: ${error}`);
        }
 
        let errorType = 3;
        assetChangeRequest.setHasApplink(errorType);
        try {
          await isEqual(assetChangeRequest, photoAsset, 3);
          console.info(`${testNum} successed`);
        } catch (error) {
          await isEqual(assetChangeRequest, photoAsset, 2);
          console.error(`${testNum} applyChanges failed with error: ${error}`);
        }
 
        console.info(`${testNum} , new_photoAsset_hasApplink: ${photoAsset.get('has_applink')}`);
        done();
      } catch (error) {
        console.error(`${testNum} failed with error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
 
  })
}