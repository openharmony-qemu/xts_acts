'use static'
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
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level, Hypium } from '../../../../hypium';
import { fetchAllOption, getPermission, fetchOption, LOG_TAG, sleep } from '../common';
import common from '@ohos.app.ability.common';
import { Context } from '@kit.ArkUI';

const TAG = LOG_TAG + 'getRangeObjects';

export default function getRangeObjectsTestStatic(): void {
  describe('getRangeObjectsTestStatic', (): void => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
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

    let testContext: Context = Hypium.get('Context')! as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let checkFetchResult = (done: () => void, testNum: string, fetchResult:
      photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> |
      photoAccessHelper.FetchResult<photoAccessHelper.Album>): void =>{
      if (fetchResult === undefined) {
        expect().assertFail();
        done();
      }
      let fetchCount: int = fetchResult.getCount();
      if (fetchCount === undefined || fetchCount < 0) {
        expect().assertFail();
        done();
      }
    }
    let createAsset = async (done: () => void, title: string, extension: string): Promise<void> => {
      try {
        let fileUri: string =
          `file://ohos.acts.multimedia.photoaccess.xts/data/storage/el2/base/haps/entry_test/photos/cloneTest.${extension}`;
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let resourceType: photoAccessHelper.ResourceType = photoAccessHelper.ResourceType.IMAGE_RESOURCE
        if(extension !== 'jpg') {
          photoType= photoAccessHelper.PhotoType.VIDEO;
          resourceType = photoAccessHelper.ResourceType.VIDEO_RESOURCE
        }
        let options: photoAccessHelper.CreateOptions = {
          title: title,
        }
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest | null =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        if (assetChangeRequest === null) {
          expect().assertFail();
          done();
          return;
        }
        assetChangeRequest.addResource(resourceType, fileUri);
        await helper!.applyChanges(assetChangeRequest);
        await sleep(500);
        console.info('addResourceByFileUri successfully');
      } catch (err) {
        console.error(`createImageAsset:: failed to createMovingPhoto::${err.code}, ${err.message} !`);
        expect().assertFail();
        done();
      }
    }


    /**
     * @tc.number     SUB_MEDIA_FETCH_RESULT_GET_RANGE_OBJECTS_STATIC_0006
     * @tc.name       SUB_MEDIA_FETCH_RESULT_GET_RANGE_OBJECTS_STATIC_0006
     * @tc.desc       album fetchResult getRangeObjects(-1,0) - error
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_FETCH_RESULT_GET_RANGE_OBJECTS_STATIC_0006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_MEDIA_FETCH_RESULT_GET_RANGE_OBJECTS_STATIC_0006';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        await fetchResult.getRangeObjects(-1,0)
        await fetchResult.close();
        expect().assertFail()
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error.code}${error.message}`, testNum);
        expect(error.code).assertEqual(23800151);
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_FETCH_RESULT_GET_RANGE_OBJECTS_STATIC_0007
     * @tc.name       SUB_MEDIA_FETCH_RESULT_GET_RANGE_OBJECTS_STATIC_0007
     * @tc.desc       album fetchResult getRangeObjects(0,10000) - error
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_FETCH_RESULT_GET_RANGE_OBJECTS_STATIC_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_MEDIA_FETCH_RESULT_GET_RANGE_OBJECTS_STATIC_0007';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        await fetchResult.getRangeObjects(0,10000)
        await fetchResult.close();
        expect().assertFail()
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error.code}${error.message}`, testNum);
        expect(error.code).assertEqual(23800151);
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_FETCH_RESULT_GET_RANGE_OBJECTS_STATIC_0008
     * @tc.name       SUB_MEDIA_FETCH_RESULT_GET_RANGE_OBJECTS_STATIC_0008
     * @tc.desc       album fetchResult getRangeObjects(-1,1000) - error
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_FETCH_RESULT_GET_RANGE_OBJECTS_STATIC_0008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_MEDIA_FETCH_RESULT_GET_RANGE_OBJECTS_STATIC_0008';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        await fetchResult.getRangeObjects(-1,1000)
        expect().assertFail()
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect(error.code).assertEqual(23800151);
        done();
      }
    })

  })
}