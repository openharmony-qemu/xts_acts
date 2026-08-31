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
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { getPermission, driveFn, LOG_TAG, fetchAllOption, createUserAlbum, genRandomStr, fetchOption } from '../../common';
import common from '@ohos.app.ability.common';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'setOrientation';

async function setOrientationPromiseTest(done: Function, testName: string, orientation: number) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
    let options: photoAccessHelper.CreateOptions = {title: testName}
    let createAssetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, 'jpg', options);
    createAssetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, (testContext.filesDir + "/01.jpg"));
    await phAccessHelper.applyChanges(createAssetChangeRequest);
    console.info(`${testName} :: apply createAssetRequest successfully !`);
    const asset = createAssetChangeRequest.getAsset()
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
    await assetChangeRequest.setOrientation(orientation);
    await phAccessHelper.applyChanges(assetChangeRequest);
    console.info('apply setOrientation  successfully');
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
    expect().assertFail();
    done();
  }
}

async function setOrientationAbnormalPromiseTest(done: Function, testName: string, orientation: number | undefined) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
    let options: photoAccessHelper.CreateOptions = {title: testName}
    let createAssetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, 'jpg', options);
    createAssetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, (testContext.filesDir + "/01.jpg"));
    await phAccessHelper.applyChanges(createAssetChangeRequest);
    console.info(`${testName} :: apply createAssetRequest successfully !`);
    const asset = createAssetChangeRequest.getAsset()
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
    await assetChangeRequest.setOrientation(orientation);
    await phAccessHelper.applyChanges(assetChangeRequest);
    console.info('apply setOrientation  successfully');
    expect().assertFail();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
    expect(error.code).assertEqual(String(ErrorCode.PARAM_ERROR_CODE));
    done();
  }
}

export default function MediaAssetChangeRequestSetOrientationTest() {
  describe('MediaAssetChangeRequestSetOrientationTest', () => {

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
     * @tc.name   SUB_MediaAssetChangeRequest_setOrientation_promise_0001
     * @tc.number SUB_MediaAssetChangeRequest_setOrientation_promise_0001
     * @tc.desc   setOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MediaAssetChangeRequest_setOrientation_promise_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MediaAssetChangeRequest_setOrientation_promise_0001';
      const orientation = 0;
      await setOrientationPromiseTest(done, testName, orientation);
    })

    /**
     * @tc.name   SUB_MediaAssetChangeRequest_setOrientation_promise_0002
     * @tc.number SUB_MediaAssetChangeRequest_setOrientation_promise_0002
     * @tc.desc   setOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MediaAssetChangeRequest_setOrientation_promise_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MediaAssetChangeRequest_setOrientation_promise_0002';
      const orientation = 90;
      await setOrientationPromiseTest(done, testName, orientation);
    })

    /**
     * @tc.name   SUB_MediaAssetChangeRequest_setOrientation_promise_0003
     * @tc.number SUB_MediaAssetChangeRequest_setOrientation_promise_0003
     * @tc.desc   setOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MediaAssetChangeRequest_setOrientation_promise_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MediaAssetChangeRequest_setOrientation_promise_0003';
      const orientation = 180;
      await setOrientationPromiseTest(done, testName, orientation);
    })

    /**
     * @tc.name   SUB_MediaAssetChangeRequest_setOrientation_promise_0004
     * @tc.number SUB_MediaAssetChangeRequest_setOrientation_promise_0004
     * @tc.desc   setOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MediaAssetChangeRequest_setOrientation_promise_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MediaAssetChangeRequest_setOrientation_promise_0004';
      const orientation = 270;
      await setOrientationPromiseTest(done, testName, orientation);
    })

    /**
     * @tc.name   SUB_MediaAssetChangeRequest_setOrientation_Abnormal_promise_0001
     * @tc.number SUB_MediaAssetChangeRequest_setOrientation_Abnormal_promise_0001
     * @tc.desc   setOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MediaAssetChangeRequest_setOrientation_Abnormal_promise_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MediaAssetChangeRequest_setOrientation_Abnormal_promise_0001';
      await setOrientationAbnormalPromiseTest(done, testName, undefined);
    })

    /**
     * @tc.name   MediaAssetChangeRequest_setOrientation_Abnormal_promise_0002
     * @tc.number MEDIA_ASSET_CHANGE_REQUEST_SET_ORIENTATION_0006   //TODO error.code is undefined
     * @tc.desc   setOrientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('MediaAssetChangeRequest_setOrientation_Abnormal_promise_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'MediaAssetChangeRequest_setOrientation_Abnormal_promise_0002';
      const orientation = -90;
      await setOrientationAbnormalPromiseTest(done, testName, orientation);
    })*/
  })
}