'use static';
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

import { AppStorage } from '@kit.ArkUI';

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level, Hypium } from '../../../../hypium/index';
import { fetchAllOption, getPermission, fetchOption, LOG_TAG, sleep } from '../common';
import common from '@ohos.app.ability.common';
import { Context } from '@kit.ArkUI';

const TAG = LOG_TAG + 'getObjectsIndexSet';

export default function getObjectsIndexSetTestStatic(): void {
  describe('getObjectsIndexSetTestStatic', (): void => {

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
     * @tc.number     SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0001
     * @tc.name       SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0001
     * @tc.desc       PhotoAsset fetchResult getObjectsByIndexSet [0,2]
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0001';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        await createAsset(done, 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0001_1', 'jpg')
        await createAsset(done, 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0001_2', 'jpg')
        await createAsset(done, 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0001_3', 'jpg')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult);
        let list = await fetchResult.getAllObjects()
        const total = fetchResult.getCount();
        // expect(total).assetEqual(3);
        const indexSet = [0, 1, 2];
        const currentList = await fetchResult.getObjectsByIndexSet(indexSet);
        expect(currentList.length).assertEqual(indexSet.length);
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0002
     * @tc.name       SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0002
     * @tc.desc       PhotoAsset fetchResult getObjectsByIndexSet [2,0]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0002';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        await createAsset(done, 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0002_1', 'jpg')
        await createAsset(done, 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0002_2', 'jpg')
        await createAsset(done, 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0002_3', 'jpg')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let list = await fetchResult.getAllObjects()
        let currentList = await fetchResult.getObjectsByIndexSet([2,0])
        expect(list[0].displayName).assertEqual(currentList[1].displayName)
        expect(list[2].displayName).assertEqual(currentList[0].displayName)
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0003
     * @tc.name       SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0003
     * @tc.desc       PhotoAsset fetchResult getObjectsByIndexSet [1,2,0]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0003';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        await createAsset(done, 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0003_1', 'jpg')
        await createAsset(done, 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0003_2', 'jpg')
        await createAsset(done, 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0003_3', 'jpg')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let list = await fetchResult.getAllObjects()
        let currentList = await fetchResult.getObjectsByIndexSet([1,2,0])
        expect(list[0].displayName).assertEqual(currentList[2].displayName)
        expect(list[1].displayName).assertEqual(currentList[0].displayName)
        expect(list[2].displayName).assertEqual(currentList[1].displayName)
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0004
     * @tc.name       SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0004
     * @tc.desc       PhotoAsset fetchResult getObjectsByIndexSet [1,1,1]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0004';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        await createAsset(done, 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0004_1', 'jpg')
        await createAsset(done, 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0004_2', 'jpg')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let list = await fetchResult.getAllObjects()
        let currentList = await fetchResult.getObjectsByIndexSet([1,1,1])
        expect(list[1].displayName).assertEqual(currentList[0].displayName)
        expect(list[1].displayName).assertEqual(currentList[0].displayName)
        expect(list[1].displayName).assertEqual(currentList[0].displayName)
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number     SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0005
     * @tc.name       SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0005
     * @tc.desc       album fetchResult getObjectsByIndexSet [0,1]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0005';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        await createAsset(done, 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0005', 'jpg')
        await createAsset(done, 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0005', 'mp4')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let list = await fetchResult.getAllObjects()
        let currentList = await fetchResult.getObjectsByIndexSet([0,1])
        expect(list[0].albumName).assertEqual(currentList[0].albumName)
        expect(list[1].albumName).assertEqual(currentList[1].albumName)
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0006
     * @tc.name       SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0006
     * @tc.desc       album fetchResult getObjectsByIndexSet [1,0]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0006';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        await createAsset(done, 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0006', 'jpg')
        await createAsset(done, 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0006', 'mp4')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let list = await fetchResult.getAllObjects()
        let currentList = await fetchResult.getObjectsByIndexSet([1,0])
        expect(list[0].albumName).assertEqual(currentList[1].albumName)
        expect(list[0].albumName).assertEqual(currentList[1].albumName)
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0007
     * @tc.name       SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0007
     * @tc.desc       album fetchResult getObjectsByIndexSet [1,2,0]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0007';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        await createAsset(done, 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0007', 'jpg')
        await createAsset(done, 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0007', 'mp4')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let list = await fetchResult.getAllObjects()
        let currentList = await fetchResult.getObjectsByIndexSet([1,2,0])
        expect(list[0].albumName).assertEqual(currentList[2].albumName)
        expect(list[1].albumName).assertEqual(currentList[0].albumName)
        expect(list[2].albumName).assertEqual(currentList[1].albumName)
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0008
     * @tc.name       SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0008
     * @tc.desc       album fetchResult getObjectsByIndexSet [1,1,1]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0008';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        await createAsset(done, 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0008', 'jpg')
        await createAsset(done, 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0008', 'mp4')
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let list = await fetchResult.getAllObjects()
        let currentList = await fetchResult.getObjectsByIndexSet([1,1,1])
        expect(list[1].albumName).assertEqual(currentList[0].albumName)
        expect(list[1].albumName).assertEqual(currentList[1].albumName)
        expect(list[1].albumName).assertEqual(currentList[2].albumName)
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0013
     * @tc.name       SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0013
     * @tc.desc       PhotoAsset fetchResult getObjectsByIndexSet []
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0013', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0013';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let currentList = await fetchResult.getObjectsByIndexSet([])
        console.info(TAG, `currentIndex: ${currentList.length}`, testNum);
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
     * @tc.number     SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0014
     * @tc.name       SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0014
     * @tc.desc       album fetchResult getObjectsByIndexSet []
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0014', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0014';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        await fetchResult.getObjectsByIndexSet([])
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
     * @tc.number     SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0015
     * @tc.name       SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0015
     * @tc.desc       PhotoAsset fetchResult getObjectsByIndexSet [-1,0,2]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0015', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0015';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let currentList = await fetchResult.getObjectsByIndexSet([-1,0,2])
        console.info(TAG, `currentIndex: ${currentList.length}`, testNum);
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
     * @tc.number     SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0016
     * @tc.name       SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0016
     * @tc.desc       album fetchResult getObjectsByIndexSet [-1,0,2]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0016', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0016';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        await fetchResult.getObjectsByIndexSet([-1,0,2])
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
     * @tc.number     SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0017
     * @tc.name       SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0017
     * @tc.desc       PhotoAsset fetchResult getObjectsByIndexSet [0,10000]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0017', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0017';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let currentList = await fetchResult.getObjectsByIndexSet( [0,10000])
        console.info(TAG, `currentIndex: ${currentList.length}`, testNum);
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
     * @tc.number     SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0018
     * @tc.name       SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0018
     * @tc.desc       album fetchResult getObjectsByIndexSet [0, 10000]
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0018', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0018';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        await fetchResult.getObjectsByIndexSet([0, 10000])
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
     * @tc.number     SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0019
     * @tc.name       SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0019
     * @tc.desc       album fetchResult getObjectsByIndexSet empty
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0019', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0019';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'XxXxXxXx');
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        await fetchResult.getObjectsByIndexSet([0])
        expect().assertFail()
        await fetchResult.close();
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error}`, testNum);
        expect(error.code).assertEqual(23800151);
        done();
      }
    })

    /**
     * @tc.number     SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0020
     * @tc.name       SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0020
     * @tc.desc       PhotoAsset fetchResult getObjectsByIndexSet empty
     * @tc.size       MEDIUM
     * @tc.type       Function   
     * @tc.level      Level 0
     */
    it('SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_MEDIA_FETCH_RESULT_GET_OBJECTS_BY_INDEX_STATIC_0020';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'XxXxXxXx');
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOps);
        checkFetchResult(done, testNum, fetchResult );
        let currentList = await fetchResult.getObjectsByIndexSet( [0])
        console.info(TAG, `currentIndex: ${currentList.length}`, testNum);
        await fetchResult.close();
        expect().assertFail()
        done();
      } catch (error) {
        console.info(TAG, `failed; error: ${error.code}${error.message}`, testNum);
        expect(error.code).assertEqual(23800151);
        done();
      }
    })
  })
}