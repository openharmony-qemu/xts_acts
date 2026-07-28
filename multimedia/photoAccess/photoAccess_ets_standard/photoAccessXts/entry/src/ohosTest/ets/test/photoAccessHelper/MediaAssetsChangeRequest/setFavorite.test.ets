/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { getPermission, driveFn, LOG_TAG } from '../../common';
import common from '@ohos.app.ability.common';
import { dataSharePredicates } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'setFavorite';

async function setFavoriteAssetsPromiseTest(done: Function, testName: string, isFavorite: boolean) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
    let fetchOption: photoAccessHelper.FetchOptions = {
      fetchColumns: [],
      predicates: predicates
    };
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
      await phAccessHelper.getAssets(fetchOption);
    let assetList: Array<photoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
    let assetsChangeRequest: photoAccessHelper.MediaAssetsChangeRequest =
      new photoAccessHelper.MediaAssetsChangeRequest(assetList);

    await assetsChangeRequest.setFavorite(isFavorite);
    await phAccessHelper.applyChanges(assetsChangeRequest).then(() => {
      console.info('apply setFavorite successfully');
    }).catch((err: BusinessError) => {
      console.error(`apply setFavorite failed with error: ${err.code}, ${err.message}`);
      expect().assertFail();
    });
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
    expect().assertFail();
    done();
  }
}

async function setFavoriteAssetsAbnormalPromiseTest(done: Function, testName: string, isFavorite: boolean) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
    let fetchOption: photoAccessHelper.FetchOptions = {
      fetchColumns: [],
      predicates: predicates
    };
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
      await phAccessHelper.getAssets(fetchOption);
    let assetList: Array<photoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
    let assetsChangeRequest: photoAccessHelper.MediaAssetsChangeRequest =
      new photoAccessHelper.MediaAssetsChangeRequest(assetList);

    await assetsChangeRequest.setFavorite(isFavorite);
    await phAccessHelper.applyChanges(assetsChangeRequest).then(() => {
      console.info('apply setFavorite successfully');
    }).catch((err: BusinessError) => {
      console.error(`apply setFavorite failed with error: ${err.code}, ${err.message}`);
      expect().assertFail();
    });
    done();
  } catch (error) {
    console.error(`${testName} failed; error: ${error}`);
    expect(Number(error.code) == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

export default function MediaAssetsChangeRequestSetFavoriteTest() {
  describe('MediaAssetsChangeRequestSetFavoriteTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   MediaAssetsChangeRequest_setFavorite_promise_001
     * @tc.number SUB_MEDIA_ASSETS_CHANGE_REQUEST_SET_FAVORITE_0100
     * @tc.desc   setFavorite true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetsChangeRequest_setFavorite_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetsChangeRequest_setFavorite_promise_001';
      await setFavoriteAssetsPromiseTest(done, testName, true);
    })

    /**
     * @tc.name   MediaAssetsChangeRequest_setFavorite_promise_002
     * @tc.number SUB_MEDIA_ASSETS_CHANGE_REQUEST_SET_FAVORITE_0200
     * @tc.desc   setFavorite false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetsChangeRequest_setFavorite_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetsChangeRequest_setFavorite_promise_002';
      await setFavoriteAssetsPromiseTest(done, testName, false);
    })

    /**
     * @tc.name   MediaAssetsChangeRequest_setFavorite_Abnormal_promise_003
     * @tc.number SUB_MEDIA_ASSETS_CHANGE_REQUEST_SET_FAVORITE_0300
     * @tc.desc   setFavorite invalid parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetsChangeRequest_setFavorite_Abnormal_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetsChangeRequest_setFavorite_Abnormal_promise_003';
      await setFavoriteAssetsAbnormalPromiseTest(done, testName, 'true' as Object as boolean);
    })

    /**
     * @tc.name   MediaAssetsChangeRequest_setFavorite_Abnormal_promise_004
     * @tc.number SUB_MEDIA_ASSETS_CHANGE_REQUEST_SET_FAVORITE_0400
     * @tc.desc   setFavorite undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetsChangeRequest_setFavorite_Abnormal_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetsChangeRequest_setFavorite_Abnormal_promise_004';
      let abnormalParameter: ESObject = undefined;
      await setFavoriteAssetsAbnormalPromiseTest(done, testName, abnormalParameter);
    })

    /**
     * @tc.name   MediaAssetsChangeRequest_setFavorite_Abnormal_promise_005
     * @tc.number SUB_MEDIA_ASSETS_CHANGE_REQUEST_SET_FAVORITE_0500
     * @tc.desc   setFavorite null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetsChangeRequest_setFavorite_Abnormal_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetsChangeRequest_setFavorite_Abnormal_promise_005';
      let abnormalParameter: ESObject = null;
      await setFavoriteAssetsAbnormalPromiseTest(done, testName, abnormalParameter);
    })
  })
}