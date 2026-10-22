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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium-dynamic';
import { getPermission, driveFn, LOG_TAG, fetchAllOption, checkResourceFile, createResource } from '../../common';
import common from '@ohos.app.ability.common';
import dataSharePredicates from '@ohos.data.dataSharePredicates';

const TAG = LOG_TAG + 'constructor';

async function constructorPromiseTest(done: Function, testName: string, fetchOptions: photoAccessHelper.FetchOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
      await phAccessHelper.getAssets(fetchOptions);
    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    let albumChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
      new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, testName);
    expect().assertFail();
    done();
  }
}

export default function MediaAssetChangeRequestConstructorTest() {
  describe('MediaAssetChangeRequestConstructorTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let fileNameList: Array<string> = [ "01.jpg" , "01.mp4" ];
      checkResourceFile(testContext);
      await createResource(testContext, fileNameList);
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
     * @tc.name   MediaAssetChangeRequest_constructor_promise_001
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_CONSTRUCTOR_001
     * @tc.desc   constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MediaAssetChangeRequest_constructor_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_constructor_promise_001';
      const fetchOptions = fetchAllOption();
      await constructorPromiseTest(done, testName, fetchOptions);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_LIBRARY_CONSTRUCTOR_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_LIBRARY_CONSTRUCTOR_0200
     * @tc.desc   constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_LIBRARY_CONSTRUCTOR_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_LIBRARY_CONSTRUCTOR_0200';
      try {
        let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, '');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${testName} :: error, err is ${error} ${error.code}`);
        expect(error.code).assertEqual('14000011');
        done();
      }
    })
  })
}