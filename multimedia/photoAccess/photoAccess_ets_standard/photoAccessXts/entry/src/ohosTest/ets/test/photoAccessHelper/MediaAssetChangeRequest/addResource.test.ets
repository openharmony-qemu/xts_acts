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
import { getPermission, driveFn, LOG_TAG, copyImageToSandbox } from '../../common';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { fileUri } from '@kit.CoreFileKit';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'addResource';

async function addResourcePromiseTest(done: Function, testName: string, pathUri: string, imageType: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
    let extension: string = imageType;
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
      photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
    // 需要确保fileUri对应的资源存在。
    let path = testContext.filesDir + '/' + pathUri;
    let uri = fileUri.getUriFromPath(path);
    let uriFlag = await fs.access(path);
    console.log('fileUri is ' + JSON.stringify(uriFlag));
    await assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, uri);
    await phAccessHelper.applyChanges(assetChangeRequest);
    console.info('addResourceByFileUri successfully');
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
    expect().assertFail();
    done();
  }
}

async function addResourceAbnormalPromiseTest(done: Function, testName: string, pathUri: string | undefined, imageType: string,
  resourceType: photoAccessHelper.ResourceType | null | undefined, errorCode: ErrorCode = ErrorCode.PARAM_ERROR_CODE) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
    let extension: string = imageType;
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
      photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
    let path: string | undefined;
    let uri: string | undefined;
    if(pathUri === '' || pathUri === undefined){
      uri = pathUri
    }else{
      path = testContext.filesDir + '/' + pathUri;
      uri = fileUri.getUriFromPath(path);
    }
    await assetChangeRequest.addResource(resourceType as photoAccessHelper.ResourceType, uri);
    await phAccessHelper.applyChanges(assetChangeRequest);
    console.info('addResourceByFileUri successfully');
    expect().assertFail();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
    expect(error.code).assertEqual(String(errorCode));
  } finally {
    done();
  }
}

async function addResourceBufferPromiseTest(done: Function, testName: string, imageType: string, size: number) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    console.info('addResourceByArrayBufferDemo');
    let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
    let extension: string = imageType;
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
      photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
    let buffer: ArrayBuffer = new ArrayBuffer(size);
    await assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, buffer);
    await phAccessHelper.applyChanges(assetChangeRequest);
    console.info('addResourceByArrayBuffer successfully');
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
    expect().assertFail();
    done();
  }
}

async function addResourceBufferAbnormalPromiseTest(done: Function, testName: string, imageType: string, size: number, resourceType: photoAccessHelper.ResourceType | null | undefined, errorCode: ErrorCode = ErrorCode.PARAM_ERROR_CODE) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    console.info('addResourceByArrayBufferDemo');
    let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
    let extension: string = imageType;
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
      photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
    let buffer: ArrayBuffer = new ArrayBuffer(size);
    await assetChangeRequest.addResource(resourceType as photoAccessHelper.ResourceType, buffer);
    await phAccessHelper.applyChanges(assetChangeRequest);
    console.info('addResourceByArrayBuffer successfully');
    expect().assertFail();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
    expect(error.code).assertEqual(String(errorCode));
  } finally {
    done();
  }
}

export default function MediaAssetChangeRequestAddResourceTest() {
  describe('MediaAssetChangeRequestAddResourceTest', () => {

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
     * @tc.name   SUB_MediaAssetChangeRequest_addResource_promise_0001
     * @tc.number SUB_MediaAssetChangeRequest_addResource_promise_0001
     * @tc.desc   addResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MediaAssetChangeRequest_addResource_promise_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MediaAssetChangeRequest_addResource_promise_0001';
      const fileName = 'test.jpg';
      const path = 'test.jpg';
      const imageType = 'jpg';
      await copyImageToSandbox(fileName, path);
      await addResourcePromiseTest(done, testName, path, imageType);
    })

    /**
     * @tc.name   SUB_MediaAssetChangeRequest_addResource_promise_0002
     * @tc.number SUB_MediaAssetChangeRequest_addResource_promise_0002
     * @tc.desc   addResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MediaAssetChangeRequest_addResource_promise_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MediaAssetChangeRequest_addResource_promise_0002';
      const fileName = 'test.svg';
      const path = 'test.svg';
      const imageType = 'svg';
      await copyImageToSandbox(fileName, path);
      await addResourcePromiseTest(done, testName, path, imageType);
    })

    /**
     * @tc.name   SUB_MediaAssetChangeRequest_addResource_promise_0003
     * @tc.number SUB_MediaAssetChangeRequest_addResource_promise_0003
     * @tc.desc   addResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MediaAssetChangeRequest_addResource_promise_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MediaAssetChangeRequest_addResource_promise_0003';
      const fileName = 'test.jpeg';
      const path = 'test.jpeg';
      const imageType = 'jpeg';
      await copyImageToSandbox(fileName, path);
      await addResourcePromiseTest(done, testName, path, imageType);
    })

    /**
     * @tc.name   SUB_MediaAssetChangeRequest_addResource_promise_0004
     * @tc.number SUB_MediaAssetChangeRequest_addResource_promise_0004
     * @tc.desc   addResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MediaAssetChangeRequest_addResource_promise_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MediaAssetChangeRequest_addResource_promise_0004';
      const fileName = 'test.svg';
      const path = 'test.svg';
      const imageType = 'svg';
      await copyImageToSandbox(fileName, path);
      await addResourcePromiseTest(done, testName, path, imageType);
    })

    /**
     * @tc.name   SUB_MediaAssetChangeRequest_addResource_promise_0005
     * @tc.number SUB_MediaAssetChangeRequest_addResource_promise_0005
     * @tc.desc   addResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MediaAssetChangeRequest_addResource_promise_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MediaAssetChangeRequest_addResource_promise_0005';
      const fileName = 'test6.gif';
      const path = 'test6.gif';
      const imageType = 'gif';
      await copyImageToSandbox(fileName, path);
      await addResourcePromiseTest(done, testName, path, imageType);
    })

    /**
     * @tc.name   SUB_MediaAssetChangeRequest_addResource_promise_0006
     * @tc.number SUB_MediaAssetChangeRequest_addResource_promise_0006
     * @tc.desc   addResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MediaAssetChangeRequest_addResource_promise_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MediaAssetChangeRequest_addResource_promise_0006';
      const fileName = 'test6.gif';
      const path = 'test6.gif';
      const imageType = 'gif';
      await copyImageToSandbox(fileName, path);
      await addResourceAbnormalPromiseTest(done, testName, path, imageType, null);
    })

    /**
     * @tc.name   SUB_MediaAssetChangeRequest_addResource_promise_0007
     * @tc.number SUB_MediaAssetChangeRequest_addResource_promise_0007
     * @tc.desc   addResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MediaAssetChangeRequest_addResource_promise_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MediaAssetChangeRequest_addResource_promise_0007';
      const fileName = 'test6.gif';
      const path = 'test6.gif';
      const imageType = 'gif';
      await copyImageToSandbox(fileName, path);
      await addResourceAbnormalPromiseTest(done, testName, path, imageType, undefined);
    })

    /**
     * @tc.name   SUB_MediaAssetChangeRequest_addResource_promise_0008
     * @tc.number SUB_MediaAssetChangeRequest_addResource_promise_0008
     * @tc.desc   addResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MediaAssetChangeRequest_addResource_promise_0008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MediaAssetChangeRequest_addResource_promise_0008';
      const fileName = 'test6.gif';
      const path = 'test6.gif';
      const imageType = 'gif';
      await copyImageToSandbox(fileName, path);
      await addResourceAbnormalPromiseTest(done, testName, '', imageType, photoAccessHelper.ResourceType.IMAGE_RESOURCE, ErrorCode.UNEXIST_DIR_OR_FILE_ERROR_CODE);
    })

    /**
     * @tc.name   SUB_MediaAssetChangeRequest_addResource_buffer_promise_0001
     * @tc.number SUB_MediaAssetChangeRequest_addResource_buffer_promise_0001
     * @tc.desc   addResource(type: ResourceType, data: ArrayBuffer): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MediaAssetChangeRequest_addResource_buffer_promise_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MediaAssetChangeRequest_addResource_buffer_promise_0001';
      const imageType = 'jpg';
      const size = 2048;
      await addResourceBufferPromiseTest(done, testName, imageType, size);
    })

    /**
     * @tc.name   SUB_MediaAssetChangeRequest_addResource_buffer_promise_0002
     * @tc.number SUB_MediaAssetChangeRequest_addResource_buffer_promise_0002
     * @tc.desc   addResource(type: ResourceType, data: ArrayBuffer): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MediaAssetChangeRequest_addResource_buffer_promise_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MediaAssetChangeRequest_addResource_buffer_promise_0002';
      const imageType = 'gif';
      const size = 1024;
      await addResourceBufferPromiseTest(done, testName, imageType, size);
    })

    /**
     * @tc.name   SUB_MediaAssetChangeRequest_addResource_buffer_promise_0003
     * @tc.number SUB_MediaAssetChangeRequest_addResource_buffer_promise_0003
     * @tc.desc   addResource(type: ResourceType, data: ArrayBuffer): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MediaAssetChangeRequest_addResource_buffer_promise_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MediaAssetChangeRequest_addResource_buffer_promise_0003';
      const imageType = 'jpeg';
      const size = 1;
      await addResourceBufferPromiseTest(done, testName, imageType, size);
    })

    /**
     * @tc.name   SUB_MediaAssetChangeRequest_addResource_buffer_promise_0004
     * @tc.number SUB_MediaAssetChangeRequest_addResource_buffer_promise_0004
     * @tc.desc   addResource(type: ResourceType, data: ArrayBuffer): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MediaAssetChangeRequest_addResource_buffer_promise_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MediaAssetChangeRequest_addResource_buffer_promise_0004';
      const imageType = 'jpeg';
      const size = 1;
      await addResourceBufferAbnormalPromiseTest(done, testName, imageType, size, null);
    })

    /**
     * @tc.name   SUB_MediaAssetChangeRequest_addResource_buffer_promise_0005
     * @tc.number SUB_MediaAssetChangeRequest_addResource_buffer_promise_0005
     * @tc.desc   addResource(type: ResourceType, data: ArrayBuffer): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MediaAssetChangeRequest_addResource_buffer_promise_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MediaAssetChangeRequest_addResource_buffer_promise_0005';
      const imageType = 'jpeg';
      const size = 1;
      await addResourceBufferAbnormalPromiseTest(done, testName, imageType, size, undefined);
    })
  })
}