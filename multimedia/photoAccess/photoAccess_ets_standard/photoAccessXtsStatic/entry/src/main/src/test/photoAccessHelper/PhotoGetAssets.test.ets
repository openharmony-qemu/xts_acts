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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level, beforeEach, afterAll, afterEach, Hypium } from '../../../../hypium/index'
import {
  getPermission, sleep, LOG_TAG,
} from '../common'
import common from '@ohos.app.ability.common'
import { AppStorage } from '@kit.ArkUI';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import { Driver, MatchPattern, ON } from '@kit.TestKit';
import { Context } from '@kit.AbilityKit';
import dataSharePredicates from '@ohos.data.dataSharePredicates';

const TAG = LOG_TAG + 'PhotoGetAssetsSupp';

function isEmpty(obj: Object | null | undefined): boolean {
  return obj === null || obj === undefined;
}

export async function getFd(pathName: string): Promise<int> {
  console.info(TAG, 'case come in getFd');
  let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
  pathName = testContext.filesDir + "/" + pathName;
  console.log(TAG, 'pathName =' + pathName);
  let file = await fs.openSync(pathName);
  let fdNumber: int = file.fd;
  console.info(TAG, 'case getFd number is: ' + fdNumber);
  return fdNumber;
}

export default function PhotoGetAssetsTestSupp(): void {
  describe('PhotoGetAssetsTestSupp', () => {
    let testContext: Context = Hypium.get('Context') as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let driver: Driver | undefined = Driver.create();
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
      AppStorage.delete('emptyString');
    });

    /**
     * @tc.name   SUB_MULTMEDIA_FETCH_RESULT_GET_INDEX_STATIC_0100
     * @tc.number SUB_MULTMEDIA_FETCH_RESULT_GET_INDEX_STATIC_0100
     * @tc.desc   FetchResult.getIndex-fetchColumns-normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_FETCH_RESULT_GET_INDEX_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_FETCH_RESULT_GET_INDEX_STATIC_0100';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let ret: number = await fetchResult.getIndex(asset);
        console.info(TAG,testName,`succeed. ${ret}`);
        expect(ret !== undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_FETCH_RESULT_GET_INDEX_STATIC_0200
     * @tc.number SUB_MULTMEDIA_FETCH_RESULT_GET_INDEX_STATIC_0200
     * @tc.desc   FetchResult.getIndex-fetchColumns-''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_FETCH_RESULT_GET_INDEX_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_FETCH_RESULT_GET_INDEX_STATIC_0200';
      try {
        const display_name = 'test_mov_1.jpg';
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME,display_name);
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: [''],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let ret: number = await fetchResult.getIndex(asset);
        console.info(TAG,testName,`succeed. ${ret}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_FETCH_RESULT_GET_INDEX_STATIC_0300
     * @tc.number SUB_MULTMEDIA_FETCH_RESULT_GET_INDEX_STATIC_0300
     * @tc.desc   FetchResult.getIndex-fetchColumns-非空数组-'uri'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_FETCH_RESULT_GET_INDEX_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_FETCH_RESULT_GET_INDEX_STATIC_0300';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['uri'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let ret: number = await fetchResult.getIndex(asset);
        console.info(TAG,testName,`succeed. ${ret}`);
        expect(ret != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_FETCH_RESULT_GET_RANGE_OBJECTS_STATIC_0100
     * @tc.number SUB_MULTMEDIA_FETCH_RESULT_GET_RANGE_OBJECTS_STATIC_0100
     * @tc.desc   FetchResult.getRangeObjects-fetchColumns-normal-extension-mp4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_FETCH_RESULT_GET_RANGE_OBJECTS_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_FETCH_RESULT_GET_RANGE_OBJECTS_STATIC_0100';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOptions);
        let list = await fetchResult.getAllObjects()
        let currentList = await fetchResult.getRangeObjects(0,list.length)
        expect(currentList.length > 0).assertTrue();
        console.info(TAG, `currentIndex.length: ${currentList.length}`, testName);
        fetchResult.close();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_FETCH_RESULT_GET_RANGE_OBJECTS_STATIC_0200
     * @tc.number SUB_MULTMEDIA_FETCH_RESULT_GET_RANGE_OBJECTS_STATIC_0200
     * @tc.desc   FetchResult.getRangeObjects-fetchColumns-''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_FETCH_RESULT_GET_RANGE_OBJECTS_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_FETCH_RESULT_GET_RANGE_OBJECTS_STATIC_0200';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper!.getAssets(fetchOptions);
        let list = await fetchResult!.getAllObjects()
        let currentList = await fetchResult.getRangeObjects(0,list.length)
        console.info(TAG, `currentIndex.length: ${currentList.length}`, testName);
        fetchResult.close();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_FETCH_RESULT_CONTAINS_STATIC_0100
     * @tc.number SUB_MULTMEDIA_FETCH_RESULT_CONTAINS_STATIC_0100
     * @tc.desc   FetchResult.contains-fetchColumns-normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_FETCH_RESULT_CONTAINS_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_FETCH_RESULT_CONTAINS_STATIC_0100';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let ret: boolean = await fetchResult.contains(asset);
        console.info(TAG,testName,`succeed. ${ret}`);
        expect(ret != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_FETCH_RESULT_CONTAINS_STATIC_0200
     * @tc.number SUB_MULTMEDIA_FETCH_RESULT_CONTAINS_STATIC_0200
     * @tc.desc   FetchResult.contains-fetchColumns-normal-非空数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_FETCH_RESULT_CONTAINS_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_FETCH_RESULT_CONTAINS_STATIC_0200';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['uri'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let ret: boolean = await fetchResult.contains(asset);
        console.info(TAG,testName,`succeed. ${ret}`);
        expect(ret != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_FETCH_RESULT_CONTAINS_STATIC_0300
     * @tc.number SUB_MULTMEDIA_FETCH_RESULT_CONTAINS_STATIC_0300
     * @tc.desc   FetchResult.contains-fetchColumns-空字符串
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_FETCH_RESULT_CONTAINS_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_FETCH_RESULT_CONTAINS_STATIC_0300';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let ret: boolean = await fetchResult.contains(asset);
        console.info(TAG,testName,`succeed. ${ret}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_FETCH_RESULT_GET_OBJECT_BY_INDEX_SET_STATIC_0100
     * @tc.number SUB_MULTMEDIA_FETCH_RESULT_GET_OBJECT_BY_INDEX_SET_STATIC_0100
     * @tc.desc   FetchResult.getObjectsByIndexSet-normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_FETCH_RESULT_GET_OBJECT_BY_INDEX_SET_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_FETCH_RESULT_GET_OBJECT_BY_INDEX_SET_STATIC_0100';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let ret: photoAccessHelper.PhotoAsset[] = await fetchResult.getObjectsByIndexSet([0,1]);
        console.info(TAG,testName,`succeed. ${ret.length}`);
        expect(ret.length > 0).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_FETCH_RESULT_GET_OBJECT_BY_INDEX_SET_STATIC_0200
     * @tc.number SUB_MULTMEDIA_FETCH_RESULT_GET_OBJECT_BY_INDEX_SET_STATIC_0200
     * @tc.desc   FetchResult.getObjectsByIndexSet--参数空数组
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_FETCH_RESULT_GET_OBJECT_BY_INDEX_SET_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_FETCH_RESULT_GET_OBJECT_BY_INDEX_SET_STATIC_0200';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let ret: photoAccessHelper.PhotoAsset[] = await fetchResult.getObjectsByIndexSet([]);
        console.info(TAG,testName,`succeed. ${ret.length}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_FETCH_RESULT_GET_OBJECT_BY_INDEX_SET_STATIC_0300
     * @tc.number SUB_MULTMEDIA_FETCH_RESULT_GET_OBJECT_BY_INDEX_SET_STATIC_0300
     * @tc.desc   FetchResult.getObjectsByIndexSet-fetchColumns-''
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_FETCH_RESULT_GET_OBJECT_BY_INDEX_SET_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_FETCH_RESULT_GET_OBJECT_BY_INDEX_SET_STATIC_0300';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [''],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let ret: photoAccessHelper.PhotoAsset[] = await fetchResult.getObjectsByIndexSet([0,1]);
        console.info(TAG,testName,`succeed. ${ret.length}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTMEDIA_FETCH_RESULT_GET_OBJECT_BY_INDEX_SET_STATIC_0400
     * @tc.number SUB_MULTMEDIA_FETCH_RESULT_GET_OBJECT_BY_INDEX_SET_STATIC_0400
     * @tc.desc   FetchResult.getObjectsByIndexSet-fetchColumns-normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_FETCH_RESULT_GET_OBJECT_BY_INDEX_SET_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_FETCH_RESULT_GET_OBJECT_BY_INDEX_SET_STATIC_0400';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['uri'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOption);
        let ret: photoAccessHelper.PhotoAsset[] = await fetchResult.getObjectsByIndexSet([0,1]);
        console.info(TAG,testName,`succeed. ${ret.length}`);
        expect(ret.length > 0).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_MULTMEDIA_GET_ALBUM_ID_BY_LPATH_TEST_STATIC_0100
     * @tc.name     SUB_MULTMEDIA_GET_ALBUM_ID_BY_LPATH_TEST_STATIC_0100
     * @tc.desc     getAlbumIdByLpath-normal
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_MULTMEDIA_GET_ALBUM_ID_BY_LPATH_TEST_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = "SUB_MULTMEDIA_GET_ALBUM_ID_BY_LPATH_TEST_STATIC_0100";
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let albumId: number = await helper!.getAlbumIdByLpath('/DCIM/Camera');
        console.info(TAG, testName, 'requestFile:: albumId: ', albumId);
        console.info(TAG, testName, 'getAlbumIdByLpath completed.');
        console.info(TAG, testName, `albumId : ${albumId}`);
        expect(albumId !== undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, ' getAlbumIdByLpath Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_MULTMEDIA_GET_ALBUM_ID_BY_LPATH_TEST_STATIC_0200
     * @tc.name     SUB_MULTMEDIA_GET_ALBUM_ID_BY_LPATH_TEST_STATIC_0200
     * @tc.desc     getAlbumIdByLpath-normal
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_MULTMEDIA_GET_ALBUM_ID_BY_LPATH_TEST_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = "SUB_MULTMEDIA_GET_ALBUM_ID_BY_LPATH_TEST_STATIC_0200";
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let albumId: number = await helper!.getAlbumIdByLpath('');
        console.info(TAG, testName, 'requestFile:: albumId: ', albumId);
        console.info(TAG, testName, 'getAlbumIdByLpath completed.');
        console.info(TAG, testName, `albumId : ${albumId}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' getAlbumIdByLpath Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0100
     * @tc.name       SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0100
     * @tc.desc       createPhotoAsset, image, with title, extension->jpg-normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0100';
      console.info(TAG, testName);
      try {
        let uri = await helper!.createPhotoAsset(photoAccessHelper.PhotoType.IMAGE, 'jpg', 'testPhoto');
        console.info(TAG, testName, `createPhotoAsset success; uri: ${uri}`);
        expect(uri.length > 0).assertTrue;
        done();
      } catch (error) {
        console.error(TAG, testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0200
     * @tc.name       SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0200
     * @tc.desc       createPhotoAsset, video, with title, extension->mp4-normal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0200';
      console.info(TAG, testName);
      try {
        let uri = await helper!.createPhotoAsset(photoAccessHelper.PhotoType.VIDEO, 'mp4', 'testPhoto');
        console.info(TAG, testName, `createPhotoAsset success; uri: ${uri}`);
        expect(uri.length > 0).assertTrue;
        done();
      } catch (error) {
        console.error(TAG, testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0300
     * @tc.name       SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0300
     * @tc.desc       createPhotoAsset, image-extension->mp4-abnormal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0300';
      console.info(TAG, testName);
      try {
        let uri = await helper!.createPhotoAsset(photoAccessHelper.PhotoType.IMAGE, 'mp4', 'testPhoto');
        console.info(TAG, testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0400
     * @tc.name       SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0400
     * @tc.desc       createPhotoAsset, video-extension->jpg-abnormal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0400';
      console.info(TAG, testName);
      try {
        let uri = await helper!.createPhotoAsset(photoAccessHelper.PhotoType.VIDEO, 'jpg', 'testPhoto');
        console.info(TAG, testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0500
     * @tc.name       SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0500
     * @tc.desc       createPhotoAsset,第二个参数为空字符串-abnormal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0500';
      console.info(TAG, testName);
      try {
        let uri = await helper!.createPhotoAsset(photoAccessHelper.PhotoType.IMAGE, '', 'testPhoto');
        console.info(TAG, testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number     SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0600
     * @tc.name       SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0600
     * @tc.desc       createPhotoAsset,第三个参数为空字符串-abnormal
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_PHOTO_ASSET_STATIC_0600';
      console.info(TAG, testName);
      try {
        let uri = await helper!.createPhotoAsset(photoAccessHelper.PhotoType.IMAGE, 'jpg', '');
        console.info(TAG, testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `createPhotoAsset failed; error: ${error?.code}, ${error?.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.number    SUB_MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_STATIC_0010
     * @tc.name      SUB_MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_STATIC_0010
     * @tc.desc      Testing GetBurstAssets-第一个参数为空字符
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_STATIC_0010", Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_STATIC_0010';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let result = await helper!.getBurstAssets('',fetchOptions);
        console.info(TAG, testName, 'getBurstAssets success', result);
        expect().assertFail();
        done();
      }
      catch (error){
        console.error(TAG, testName, error.message, error.code);
        expect(Number(error.code)).assertEqual(14000011);
      }
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_STATIC_0020
     * @tc.name      SUB_MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_STATIC_0020
     * @tc.desc      Testing GetBurstAssets-normal-属性fetchColumns空数组
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_STATIC_0020", Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_STATIC_0020';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let burstKey: string = "e719d696-09fa-44f8-8e9e-ec3f215aa62a";
        let result = await helper!.getBurstAssets(burstKey,fetchOptions);
        console.info(TAG, testName, 'getBurstAssets success', result);
        expect(result != undefined).assertTrue();
        done();
      }
      catch (error){
        console.error(TAG, testName, error.message, error.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_STATIC_0030
     * @tc.name      SUB_MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_STATIC_0030
     * @tc.desc      Testing GetBurstAssets-normal-属性fetchColumns非空数组
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_STATIC_0030", Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MEDIA_LIBRARY_KIT__PHOTO_GET_BURST_STATIC_0030';
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['uri'],
          predicates: predicates
        };
        let burstKey: string = "e719d696-09fa-44f8-8e9e-ec3f215aa62a";
        let result = await helper!.getBurstAssets(burstKey,fetchOptions);
        console.info(TAG, testName, 'getBurstAssets success', result);
        expect(result != undefined).assertTrue();
        done();
      }
      catch (error){
        console.error(TAG, testName, error.message, error.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_SUPPORTED_PHOTO_FORMATS_STATIC_0010
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_SUPPORTED_PHOTO_FORMATS_STATIC_0010
     * @tc.desc   get supported photo formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_SUPPORTED_PHOTO_FORMATS_STATIC_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testNum = 'SUB_MULTMEDIA_PHOTO_GET_SUPPORTED_PHOTO_FORMATS_STATIC_0010';
      try {
        let result = await helper!.getSupportedPhotoFormats(photoAccessHelper.PhotoType.IMAGE);
        expect(result.length >= 1).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testNum, `FAILED. error code:`,JSON.stringify(error),error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_SUPPORTED_PHOTO_FORMATS_STATIC_0020
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_SUPPORTED_PHOTO_FORMATS_STATIC_0020
     * @tc.desc   get supported photo formats
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_SUPPORTED_PHOTO_FORMATS_STATIC_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MULTMEDIA_PHOTO_GET_SUPPORTED_PHOTO_FORMATS_STATIC_0020';
      try {
        let result = await helper!.getSupportedPhotoFormats(photoAccessHelper.PhotoType.VIDEO);
        expect(result.length >= 1).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testNum, `FAILED. error code:`,JSON.stringify(error),error.code);
        expect().assertFail();
        done();
      }
    })

  })
}