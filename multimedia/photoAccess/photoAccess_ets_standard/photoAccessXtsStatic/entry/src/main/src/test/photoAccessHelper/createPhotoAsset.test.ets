'use static'
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
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll, Hypium } from '../../../../hypium';
import { getPermission, LOG_TAG } from '../common';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { fileUri } from '@kit.CoreFileKit';
import { Context } from '@kit.ArkUI';

const TAG = LOG_TAG + 'createPhotoAssetTest';

export default function createPhotoAssetTest(): void {
  describe('createPhotoAssetTest', () => {
    const testTitle = 'createPhotoAssetTest';

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      await getPermission();
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

    let testContext: Context = Hypium.get('Context') as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0010
     * @tc.name       SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0010
     * @tc.desc       createPhotoAsset, image, with title, extension->jpg
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0010';
      console.info(TAG, testName);
      const extension = 'jpg';
      const title = 'createPhotoAsset' + new Date().getTime();
      try {
        let uri = await helper!.createPhotoAsset(photoAccessHelper.PhotoType.IMAGE, extension, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect(uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0020
     * @tc.name       SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0020
     * @tc.desc       createPhotoAsset, image, with title, extension->invalid
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0020', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0020';
      console.info(TAG, testName);
      const extension = 'invalid';
      const title = 'createPhotoAsset' + new Date().getTime();
      try {
        const uri = await helper!.createPhotoAsset(photoAccessHelper.PhotoType.IMAGE, extension as string, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0030
     * @tc.name       SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0030
     * @tc.desc       createPhotoAsset, image, with title, title->'a[]]b'
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0030';
      console.info(TAG, testName);
      const extension = 'jpg';
      const title = 'a[]]b';
      try {
        const uri = await helper!.createPhotoAsset(photoAccessHelper.PhotoType.IMAGE, extension as string, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0040
     * @tc.name       SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0040
     * @tc.desc       createPhotoAsset, image, extension->jpg
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0040';
      console.info(TAG, testName);
      const extension = 'jpg';
      try {
        const uri = await helper!.createPhotoAsset(photoAccessHelper.PhotoType.IMAGE, extension);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect(uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0050
     * @tc.name       SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0050
     * @tc.desc       createPhotoAsset, image, extension->invalid
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0050', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0050';
      console.info(TAG, testName);
      const extension = 'invalid';
      try {
        const uri = await helper!.createPhotoAsset(photoAccessHelper.PhotoType.IMAGE, extension);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0060
     * @tc.name       SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0060
     * @tc.desc       createPhotoAsset, video, with title, extension->mp4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0060';
      console.info(TAG, testName);
      const extension = 'mp4';
      const title = 'createPhotoAsset' + new Date().getTime();
      try {
        let uri = await helper!.createPhotoAsset(photoAccessHelper.PhotoType.VIDEO, extension, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect(uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0070
     * @tc.name       SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0070
     * @tc.desc       createPhotoAsset, video, with title, extension->invalid
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0070', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0070';
      console.info(TAG, testName);
      const extension = 'invalid';
      const title = 'createPhotoAsset' + new Date().getTime();
      try {
        const uri = await helper!.createPhotoAsset(photoAccessHelper.PhotoType.VIDEO, extension as string, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0080
     * @tc.name       SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0080
     * @tc.desc       createPhotoAsset, video, with title, title-> 'aa/.[]bb'
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0080', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0080';
      console.info(TAG, testName);
      const extension = 'mp4';
      const title = 'aa/.[]bb';
      try {
        const uri = await helper!.createPhotoAsset(photoAccessHelper.PhotoType.VIDEO, extension as string, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0090
     * @tc.name       SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0090
     * @tc.desc       createPhotoAsset, video, extension->mp4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0090', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0090';
      console.info(TAG, testName);
      const extension = 'mp4';
      try {
        const uri = await helper!.createPhotoAsset(photoAccessHelper.PhotoType.VIDEO, extension);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect(uri.toString().includes('file:')).assertTrue();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0100
     * @tc.name       SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0100
     * @tc.desc       createPhotoAsset, video, extension->invalid
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0100';
      console.info(TAG, testName);
      const extension = 'invalid';
      try {
        const uri = await helper!.createPhotoAsset(photoAccessHelper.PhotoType.VIDEO, extension);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0110
     * @tc.name       SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0110
     * @tc.desc       createPhotoAsset, video, title length 256
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0110', Level.LEVEL2, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_CREATE_PHOTO_ASSET_STATIC_0110';
      console.info(TAG, testName);
      const extension = '.mp4';
      let title = ''
      for (let index = 0; index < 256; index++) {
        title += 'a'
      }
      try {
        const uri = await helper!.createPhotoAsset(photoAccessHelper.PhotoType.VIDEO, extension as string, title);
        console.info(testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(error.code).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_RELEASE_STATIC_0010
     * @tc.number SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_RELEASE_STATIC_0010
     * @tc.desc   promise, release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_RELEASE_STATIC_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ACCESS_HELPER_RELEASE_STATIC_0010';
      try {
        const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let res = await helper!.release();
        expect(res == undefined).assertTrue();
        done();
      } catch (error) {
        console.info(TAG, `release failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
  })
}