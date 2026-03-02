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
import { describe, it, expect, beforeAll, Level, beforeEach, afterAll, afterEach } from '@ohos/hypium'
import {
  photoKeys, fetchOption, getPermission, driveFn, sleep, LOG_TAG, isEmpty
} from '../common'
import common from '@ohos.app.ability.common'
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { dataSharePredicates } from '@kit.ArkData';
import { PhotoSource, RecentPhotoInfo, RecentPhotoOptions } from '@kit.MediaLibraryKit';
import { JSON, uri } from '@kit.ArkTS';

const TAG = LOG_TAG + 'PhotoSetTitleSupp';

export default function PhotoSetTitleTestSupp() {
  describe('PhotoSetTitleTestSupp', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let PhAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let driver: Driver | undefined = Driver.create();
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(500);
      AppStorage.setOrCreate('emptyString', '');
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
     * @tc.number   SUB_GET_SUPPORTED_PHOTO_FORMATS_001
     * @tc.name     SUB_GET_SUPPORTED_PHOTO_FORMATS_001
     * @tc.desc     getSupportedPhotoFormats-非空覆盖PhotoType-IMAGE
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_SUPPORTED_PHOTO_FORMATS_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_SUPPORTED_PHOTO_FORMATS_001";
      try {
        let outputText: string;
        outputText = 'The supported types are:\n';
        let imageFormat = await PhAccessHelper.getSupportedPhotoFormats(photoAccessHelper.PhotoType.IMAGE);
        console.info(TAG, testName, "successfully", imageFormat);
        expect(imageFormat.length > 0).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed getSupportedPhotoFormats', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_SUPPORTED_PHOTO_FORMATS_002
     * @tc.name     SUB_GET_SUPPORTED_PHOTO_FORMATS_002
     * @tc.desc     getSupportedPhotoFormats-非空覆盖PhotoType-VIDEO
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_SUPPORTED_PHOTO_FORMATS_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_SUPPORTED_PHOTO_FORMATS_002";
      try {
        let outputText: string;
        outputText = 'The supported types are:\n';
        let imageFormat = await PhAccessHelper.getSupportedPhotoFormats(photoAccessHelper.PhotoType.VIDEO);
        console.info(TAG, testName, "successfully", imageFormat);
        expect(imageFormat.length > 0).assertTrue()
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed getSupportedPhotoFormats', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number   SUB_SET_TITLE_TEST_001
     * @tc.name     SUB_SET_TITLE_TEST_001
     * @tc.desc     setTitle-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SET_TITLE_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SET_TITLE_TEST_001";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await PhAccessHelper.getAssets(fetchOptions);
        let asset = await fetchResult.getFirstObject();
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        let newTitle: string = 'newTitle';
        assetChangeRequest.setTitle(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed setTitle', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SET_TITLE_TEST_002
     * @tc.name     SUB_SET_TITLE_TEST_002
     * @tc.desc     setTitle-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SET_TITLE_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SET_TITLE_TEST_002";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await PhAccessHelper.getAssets(fetchOptions);
        let asset = await fetchResult.getFirstObject();
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        let newTitle: string = 'newTitle';
        assetChangeRequest.setTitle(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed setTitle', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SET_TITLE_TEST_003
     * @tc.name     SUB_SET_TITLE_TEST_003
     * @tc.desc     setTitle-第一个参数为空字符串
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SET_TITLE_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SET_TITLE_TEST_003";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await PhAccessHelper.getAssets(fetchOptions);
        let asset = await fetchResult.getFirstObject();
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        let newTitle: string = 'newTitle';
        assetChangeRequest.setTitle(AppStorage.get('emptyString'));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed setTitle', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SET_ORIENTATION_TEST_001
     * @tc.name     SUB_SET_ORIENTATION_TEST_001
     * @tc.desc     setOrientation-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SET_ORIENTATION_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SET_ORIENTATION_TEST_001";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await PhAccessHelper.getAssets(fetchOptions);
        let asset = await fetchResult.getFirstObject();
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setOrientation(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed setOrientation', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SET_ORIENTATION_TEST_002
     * @tc.name     SUB_SET_ORIENTATION_TEST_002
     * @tc.desc     setOrientation-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SET_ORIENTATION_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SET_ORIENTATION_TEST_002";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await PhAccessHelper.getAssets(fetchOptions);
        let asset = await fetchResult.getFirstObject();
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setOrientation(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed setOrientation', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SET_ORIENTATION_TEST_003
     * @tc.name     SUB_SET_ORIENTATION_TEST_003
     * @tc.desc     setOrientation-第一个参数为空字符串
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SET_ORIENTATION_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SET_ORIENTATION_TEST_003";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await PhAccessHelper.getAssets(fetchOptions);
        let asset = await fetchResult.getFirstObject();
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setOrientation(AppStorage.get('emptyString'));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed setOrientation', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number   SUB_DELETE_ASSETS_STRING_TEST_004
     * @tc.name     SUB_DELETE_ASSETS_STRING_TEST_004
     * @tc.desc     deleteAssets-第二参数为Array<String>型-第二个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_DELETE_ASSETS_STRING_TEST_004", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_DELETE_ASSETS_STRING_TEST_004";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {

        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await PhAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let res = await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, [null]);
        console.info(TAG, testName, 'deleteAssets successfully', res);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed deleteAssets', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_DELETE_ASSETS_STRING_TEST_005
     * @tc.name     SUB_DELETE_ASSETS_STRING_TEST_005
     * @tc.desc     deleteAssets-第二参数为Array<String>型-第二个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_DELETE_ASSETS_STRING_TEST_005", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_DELETE_ASSETS_STRING_TEST_005";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {

        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await PhAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let res = await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, [undefined]);
        console.info(TAG, testName, 'deleteAssets successfully', res);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed deleteAssets', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_ADD_ASSETS_TEST_001
     * @tc.name     SUB_ADD_ASSETS_TEST_001
     * @tc.desc     MediaAlbumChangeRequest.addAssets-第一参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_ADD_ASSETS_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_ADD_ASSETS_TEST_001";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.addAssets(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed addAssetsDemo ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.number   SUB_ADD_ASSETS_TEST_002
     * @tc.name     SUB_ADD_ASSETS_TEST_002
     * @tc.desc     MediaAlbumChangeRequest.addAssets-第一参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_ADD_ASSETS_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_ADD_ASSETS_TEST_002";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.addAssets(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed addAssetsDemo ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.number   SUB_ADD_ASSETS_TEST_003
     * @tc.name     SUB_ADD_ASSETS_TEST_003
     * @tc.desc     MediaAlbumChangeRequest.addAssets-第一参数为空数组
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_ADD_ASSETS_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_ADD_ASSETS_TEST_003";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.addAssets([]);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed addAssetsDemo ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.number   SUB_REMOVE_ASSETS_TEST_001
     * @tc.name     SUB_REMOVE_ASSETS_TEST_001
     * @tc.desc     MediaAlbumChangeRequest.removeAssets-第一参数null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_REMOVE_ASSETS_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_REMOVE_ASSETS_TEST_001";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.removeAssets(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed removeAssetsDemo  ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.number   SUB_REMOVE_ASSETS_TEST_002
     * @tc.name     SUB_REMOVE_ASSETS_TEST_002
     * @tc.desc     MediaAlbumChangeRequest.removeAssets-第一参数undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_REMOVE_ASSETS_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_REMOVE_ASSETS_TEST_002";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.removeAssets(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed removeAssetsDemo  ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.number   SUB_REMOVE_ASSETS_TEST_003
     * @tc.name     SUB_REMOVE_ASSETS_TEST_003
     * @tc.desc     MediaAlbumChangeRequest.removeAssets-第一参数空数组覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_REMOVE_ASSETS_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_REMOVE_ASSETS_TEST_003";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.removeAssets([]);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed removeAssetsDemo  ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.number   SUB_SET_ALBUM_NAME_TEST_001
     * @tc.name     SUB_SET_ALBUM_NAME_TEST_001
     * @tc.desc     setAlbumName-第一参数null覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SET_ALBUM_NAME_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SET_ALBUM_NAME_TEST_001";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        let newAlbumName: string = 'newAlbumName' + new Date().getTime();
        albumChangeRequest.setAlbumName(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed setAlbumNameDemo ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.number   SUB_SET_ALBUM_NAME_TEST_002
     * @tc.name     SUB_SET_ALBUM_NAME_TEST_002
     * @tc.desc     setAlbumName-第一参数undefined覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SET_ALBUM_NAME_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SET_ALBUM_NAME_TEST_002";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        let newAlbumName: string = 'newAlbumName' + new Date().getTime();
        albumChangeRequest.setAlbumName(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed setAlbumNameDemo ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.number   SUB_SET_ALBUM_NAME_TEST_003
     * @tc.name     SUB_SET_ALBUM_NAME_TEST_003
     * @tc.desc     setAlbumName-第一参数空字符串覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SET_ALBUM_NAME_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SET_ALBUM_NAME_TEST_003";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        let newAlbumName: string = 'newAlbumName' + new Date().getTime();
        albumChangeRequest.setAlbumName(AppStorage.get('emptyString'));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed setAlbumNameDemo ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_ASSET_TEST_001
     * @tc.name     SUB_GET_ASSET_TEST_001
     * @tc.desc     getAsset-所有属性覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_ASSET_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_ASSET_TEST_001";
      try {
        let fileUri = testContext.filesDir + '/test.jpg';
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(testContext, fileUri);
        await PhAccessHelper.applyChanges(assetChangeRequest);
        let asset: photoAccessHelper.PhotoAsset = assetChangeRequest.getAsset();
        console.info(TAG, testName, 'create asset successfully with uri = ' + asset.uri);
        expect(asset.uri.length > 0).assertTrue();
        expect(asset.displayName.length > 0).assertTrue();
        expect(asset.photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
        done();
      } catch (error) {
        console.error(TAG, testName, ' getAssetDemo  Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_ALBUM_TEST_001
     * @tc.name     SUB_GET_ALBUM_TEST_001
     * @tc.desc     getAlbum-所有属性覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_ALBUM_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_ALBUM_TEST_001";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        let changeRequestAlbum: photoAccessHelper.Album = albumChangeRequest.getAlbum();
        console.info(TAG, testName, 'change request album uri: ' + changeRequestAlbum.albumUri);
        console.info(TAG, testName, 'change request album uri1: ' + changeRequestAlbum.imageCount);
        console.info(TAG, testName, 'change request album uri2: ' + changeRequestAlbum.videoCount);
        expect(changeRequestAlbum.imageCount != undefined).assertTrue();
        expect(changeRequestAlbum.videoCount != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, ' getAlbumDemo Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_CREATE_ASSET_REQUEST_TEST_001
     * @tc.name     SUB_CREATE_ASSET_REQUEST_TEST_001
     * @tc.desc     createAssetRequest-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_CREATE_ASSET_REQUEST_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_CREATE_ASSET_REQUEST_TEST_001";
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(null, photoType, extension, options);
        let fileUri = testContext.filesDir + '/test.jpg';
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, fileUri);
        await PhAccessHelper.applyChanges(assetChangeRequest);
        console.info(TAG, testName, 'apply createAssetRequest successfully', assetChangeRequest);
        expect(assetChangeRequest != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, ' Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_CREATE_ASSET_REQUEST_TEST_002
     * @tc.name     SUB_CREATE_ASSET_REQUEST_TEST_002
     * @tc.desc     createAssetRequest-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_CREATE_ASSET_REQUEST_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_CREATE_ASSET_REQUEST_TEST_002";
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(undefined, photoType, extension, options);
        let fileUri = testContext.filesDir + '/test.jpg';
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, fileUri);
        console.info(TAG, testName, 'apply createAssetRequest successfully', fileUri);
        await PhAccessHelper.applyChanges(assetChangeRequest);
        console.info(TAG, testName, 'apply createAssetRequest successfully', assetChangeRequest);
        expect(assetChangeRequest != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, ' Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_001
     * @tc.name     SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_001
     * @tc.desc     showSingleAssetCreationDialogEx-正常情况
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_001";
      try {
        let srcFileUri: string = testContext.filesDir + '/test.jpg';
        let creationSetting: photoAccessHelper.CreationSetting = {
          title: 'test',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE
        }
        let isImageFullyDisplayed: boolean = true
        PhAccessHelper.showSingleAssetCreationDialogEx(srcFileUri, creationSetting, isImageFullyDisplayed)
          .then((desFileUri) => {
            console.info(TAG, testName, 'showSingleAssetCreationDialogEx success, data is ' + desFileUri);
            expect(isEmpty(desFileUri)).assertFalse();
            done();
          })
        await sleep(1500);
        let power = await driver?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
        await power?.click();
      } catch (error) {
        console.error(TAG, testName,
          'showSingleAssetCreationDialogEx failed, errCode is ' + error.code + ', errMsg is ' + error.message);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_002
     * @tc.name     SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_002
     * @tc.desc     showSingleAssetCreationDialogEx-第2个参数属性photoType:覆盖枚举:['VIDEO']
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_002";
      try {
        let srcFileUri: string = testContext.filesDir + '/test.jpg';
        let creationSetting: photoAccessHelper.CreationSetting = {
          title: 'test',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.VIDEO
        }
        let isImageFullyDisplayed: boolean = true
        PhAccessHelper.showSingleAssetCreationDialogEx(srcFileUri, creationSetting, isImageFullyDisplayed)
          .then((desFileUri) => {
            console.info(TAG, testName, 'showSingleAssetCreationDialogEx success, data is ' + desFileUri);
            expect(isEmpty(desFileUri)).assertFalse();
            done();
          })
        await sleep(1500);
        let power = await driver?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
        await power?.click();
      } catch (error) {
        console.error(TAG, testName,
          'showSingleAssetCreationDialogEx failed, errCode is ' + error.code + ', errMsg is ' + error.message);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_003
     * @tc.name     SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_003
     * @tc.desc     showSingleAssetCreationDialogEx-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_003";
      try {
        let srcFileUri: string = 'file://media/Photo/4/IMG_1770778723_002/test.jpg';
        let creationSetting: photoAccessHelper.CreationSetting = {
          title: 'test',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE
        }
        let isImageFullyDisplayed: boolean = true
        await PhAccessHelper.showSingleAssetCreationDialogEx(null, creationSetting, isImageFullyDisplayed);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName,
          'showSingleAssetCreationDialogEx failed, errCode is ' + error.code + ', errMsg is ' + error.message);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_004
     * @tc.name     SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_004
     * @tc.desc     showSingleAssetCreationDialogEx-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_004", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_004";
      try {
        let srcFileUri: string = 'file://media/Photo/4/IMG_1770778723_002/test.jpg';
        let creationSetting: photoAccessHelper.CreationSetting = {
          title: 'test',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE
        }
        let isImageFullyDisplayed: boolean = true
        await PhAccessHelper.showSingleAssetCreationDialogEx(undefined, creationSetting, isImageFullyDisplayed);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName,
          'showSingleAssetCreationDialogEx failed, errCode is ' + error.code + ', errMsg is ' + error.message);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_005
     * @tc.name     SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_005
     * @tc.desc     showSingleAssetCreationDialogEx-第一个参数为空字符串
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_005", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_005";
      try {
        let srcFileUri: string = 'file://media/Photo/4/IMG_1770778723_002/test.jpg';
        let creationSetting: photoAccessHelper.CreationSetting = {
          title: 'test',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE
        }
        let isImageFullyDisplayed: boolean = true
        await PhAccessHelper.showSingleAssetCreationDialogEx(AppStorage.get('emptyString'), creationSetting,
          isImageFullyDisplayed);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName,
          'showSingleAssetCreationDialogEx failed, errCode is ' + error.code + ', errMsg is ' + error.message);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_006
     * @tc.name     SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_006
     * @tc.desc     showSingleAssetCreationDialogEx-第二个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_006", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_006";
      try {
        let srcFileUri: string = 'file://media/Photo/4/IMG_1770778723_002/test.jpg';
        let isImageFullyDisplayed: boolean = true
        await PhAccessHelper.showSingleAssetCreationDialogEx(srcFileUri, null, isImageFullyDisplayed);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName,
          'showSingleAssetCreationDialogEx failed, errCode is ' + error.code + ', errMsg is ' + error.message);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_007
     * @tc.name     SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_007
     * @tc.desc     showSingleAssetCreationDialogEx-第二个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_007", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_007";
      try {
        let srcFileUri: string = 'file://media/Photo/4/IMG_1770778723_002/test.jpg';
        let isImageFullyDisplayed: boolean = true
        await PhAccessHelper.showSingleAssetCreationDialogEx(srcFileUri, undefined, isImageFullyDisplayed);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName,
          'showSingleAssetCreationDialogEx failed, errCode is ' + error.code + ', errMsg is ' + error.message);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_008
     * @tc.name     SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_008
     * @tc.desc     showSingleAssetCreationDialogEx-false-第二个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_008", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_008";
      try {
        let srcFileUri: string = 'file://media/Photo/4/IMG_1770778723_002/test.jpg';
        let isImageFullyDisplayed: boolean = false
        await PhAccessHelper.showSingleAssetCreationDialogEx(srcFileUri, null, isImageFullyDisplayed);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName,
          'showSingleAssetCreationDialogEx failed, errCode is ' + error.code + ', errMsg is ' + error.message);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_009
     * @tc.name     SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_009
     * @tc.desc     showSingleAssetCreationDialogEx-false-第二个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_009", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_009";
      try {
        let srcFileUri: string = 'file://media/Photo/4/IMG_1770778723_002/test.jpg';
        let isImageFullyDisplayed: boolean = false
        await PhAccessHelper.showSingleAssetCreationDialogEx(srcFileUri, undefined, isImageFullyDisplayed);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName,
          'showSingleAssetCreationDialogEx failed, errCode is ' + error.code + ', errMsg is ' + error.message);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0010
     * @tc.name     SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0010
     * @tc.desc     showSingleAssetCreationDialogEx-第三个参数false覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0010", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0010";
      try {
        let srcFileUri: string = 'file://media/Photo/4/IMG_1770778723_002/test.jpg';
        let creationSetting: photoAccessHelper.CreationSetting = {
          title: 'test',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE
        }
        let isImageFullyDisplayed: boolean = false
        PhAccessHelper.showSingleAssetCreationDialogEx(srcFileUri, creationSetting, isImageFullyDisplayed)
          .then((desFileUri) => {
            console.info(TAG, testName, 'showSingleAssetCreationDialogEx success, data is ' + desFileUri);
            expect(isEmpty(desFileUri)).assertFalse();
            done();
          })
        await sleep(1500);
        let power = await driver?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
        await power?.click();
      } catch (error) {
        console.error(TAG, testName,
          'showSingleAssetCreationDialogEx failed, errCode is ' + error.code + ', errMsg is ' + error.message);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0011
     * @tc.name     SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0011
     * @tc.desc     showSingleAssetCreationDialogEx-false-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0011", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0011";
      try {
        let creationSetting: photoAccessHelper.CreationSetting = {
          title: 'test',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE
        }
        let isImageFullyDisplayed: boolean = false
        await PhAccessHelper.showSingleAssetCreationDialogEx(null, creationSetting, isImageFullyDisplayed);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName,
          'showSingleAssetCreationDialogEx failed, errCode is ' + error.code + ', errMsg is ' + error.message);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0012
     * @tc.name     SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0012
     * @tc.desc     showSingleAssetCreationDialogEx-false-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0012", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0012";
      try {
        let creationSetting: photoAccessHelper.CreationSetting = {
          title: 'test',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE
        }
        let isImageFullyDisplayed: boolean = false
        await PhAccessHelper.showSingleAssetCreationDialogEx(undefined, creationSetting, isImageFullyDisplayed);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName,
          'showSingleAssetCreationDialogEx failed, errCode is ' + error.code + ', errMsg is ' + error.message);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0013
     * @tc.name     SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0013
     * @tc.desc     showSingleAssetCreationDialogEx-false-第一个参数为空字符串
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0013", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0013";
      try {
        let creationSetting: photoAccessHelper.CreationSetting = {
          title: 'test',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE
        }
        let isImageFullyDisplayed: boolean = false
        await PhAccessHelper.showSingleAssetCreationDialogEx(AppStorage.get('emptyString'), creationSetting,
          isImageFullyDisplayed);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName,
          'showSingleAssetCreationDialogEx failed, errCode is ' + error.code + ', errMsg is ' + error.message);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_ADD_ASSETS_TEST_001
     * @tc.name     SUB_AlBUM_ADD_ASSETS_TEST_001
     * @tc.desc     Album.AddAssets-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_ADD_ASSETS_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_ADD_ASSETS_TEST_001";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.addAssets(null, () => {
          console.info(TAG, testName, 'addAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets with null param Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_ADD_ASSETS_TEST_002
     * @tc.name     SUB_AlBUM_ADD_ASSETS_TEST_002
     * @tc.desc     Album.AddAssets-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_ADD_ASSETS_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_ADD_ASSETS_TEST_002";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.addAssets(undefined, () => {
          console.info(TAG, testName, 'addAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets with null param Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_ADD_ASSETS_TEST_003
     * @tc.name     SUB_AlBUM_ADD_ASSETS_TEST_003
     * @tc.desc     Album.AddAssets-第一个参数为空数组
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_ADD_ASSETS_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_ADD_ASSETS_TEST_003";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.addAssets([], (err) => {
          console.info(TAG, testName, 'addAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets with null param Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_001
     * @tc.name     SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_001
     * @tc.desc     Album.AddAssets-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_001";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.addAssets(null).then(() => {
          console.info(TAG, testName, 'addAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets with null param Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_002
     * @tc.name     SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_002
     * @tc.desc     Album.AddAssets-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_002";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.addAssets(undefined).then(() => {
          console.info(TAG, testName, 'addAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets with null param Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_003
     * @tc.name     SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_003
     * @tc.desc     Album.AddAssets-第一个参数为空数组
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_003";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.addAssets([]).then(() => {
          console.info(TAG, testName, 'addAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets with null param Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_001
     * @tc.name     SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_001
     * @tc.desc     RemoveAssets-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_001";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.removeAssets(null, () => {
          console.info(TAG, testName, 'album removeAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_002
     * @tc.name     SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_002
     * @tc.desc     RemoveAssets-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_002";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.removeAssets(undefined, () => {
          console.info(TAG, testName, 'album removeAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_003
     * @tc.name     SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_003
     * @tc.desc     RemoveAssets-第一个参数为空数组
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_003";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.removeAssets([], () => {
          console.info(TAG, testName, 'album removeAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_REMOVE_ASSETS_TEST_001
     * @tc.name     SUB_AlBUM_REMOVE_ASSETS_TEST_001
     * @tc.desc     RemoveAssets-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_REMOVE_ASSETS_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_REMOVE_ASSETS_TEST_001";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.removeAssets(null).then(() => {
          console.info(TAG, testName, 'album removeAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_REMOVE_ASSETS_TEST_002
     * @tc.name     SUB_AlBUM_REMOVE_ASSETS_TEST_002
     * @tc.desc     RemoveAssets-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_REMOVE_ASSETS_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_REMOVE_ASSETS_TEST_002";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.removeAssets(undefined).then(() => {
          console.info(TAG, testName, 'album removeAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_REMOVE_ASSETS_TEST_003
     * @tc.name     SUB_AlBUM_REMOVE_ASSETS_TEST_003
     * @tc.desc     RemoveAssets-第一个参数为空数组
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_REMOVE_ASSETS_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_REMOVE_ASSETS_TEST_003";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.removeAssets([]).then(() => {
          console.info(TAG, testName, 'album removeAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(14000011);
        done();
      }
    });

    /**
     * @tc.number   SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_001
     * @tc.name     SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_001
     * @tc.desc     requestPhotoUrisReadPermissionEx-空数组覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_001";
      try {
        let srcFileUris: Array<string> = [];
        let requestReadPermissionResult: photoAccessHelper.RequestReadPermissionResult =
          await PhAccessHelper.requestPhotoUrisReadPermissionEx(srcFileUris);
        console.info('requestPhotoUrisReadPermissionEx success, data is ' + requestReadPermissionResult);
        expect(isEmpty(requestReadPermissionResult)).assertFalse();
        done();
      } catch (error) {
        console.error(TAG, testName, 'requestPhotoUrisReadPermissionEx failed', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_002
     * @tc.name     SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_002
     * @tc.desc     requestPhotoUrisReadPermissionEx-第一个参数null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_002";
      try {
        let requestReadPermissionResult: photoAccessHelper.RequestReadPermissionResult =
          await PhAccessHelper.requestPhotoUrisReadPermissionEx(null);
        console.info(TAG, testName, 'requestPhotoUrisReadPermissionEx success, data is ' + requestReadPermissionResult);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'requestPhotoUrisReadPermissionEx failed', error, 'failed', error.code);
        expect(isEmpty(error)).assertFalse();
        done();
      }
    });
    /**
     * @tc.number   SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_003
     * @tc.name     SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_003
     * @tc.desc     requestPhotoUrisReadPermissionEx-第一个参数undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_003";
      try {
        let requestReadPermissionResult: photoAccessHelper.RequestReadPermissionResult =
          await PhAccessHelper.requestPhotoUrisReadPermissionEx(undefined);
        console.info(TAG, testName, 'requestPhotoUrisReadPermissionEx success, data is ' + requestReadPermissionResult);
        expect(isEmpty(requestReadPermissionResult)).assertFalse();
        done();
      } catch (error) {
        console.error(TAG, testName, 'requestPhotoUrisReadPermissionEx failed', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_ON_SINGLE_PHOTO_CHANGE_TEST_001
     * @tc.name     SUB_ON_SINGLE_PHOTO_CHANGE_TEST_001
     * @tc.desc     onSinglePhotoChange-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_ON_SINGLE_PHOTO_CHANGE_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_ON_SINGLE_PHOTO_CHANGE_TEST_001";
      try {
        PhAccessHelper.onSinglePhotoChange(null, () => {
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_ON_SINGLE_PHOTO_CHANGE_TEST_002
     * @tc.name     SUB_ON_SINGLE_PHOTO_CHANGE_TEST_002
     * @tc.desc     onSinglePhotoChange-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_ON_SINGLE_PHOTO_CHANGE_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_ON_SINGLE_PHOTO_CHANGE_TEST_002";
      try {
        PhAccessHelper.onSinglePhotoChange(null, () => {
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });

    /**
     * @tc.number   SUB_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_001
     * @tc.name     SUB_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_001
     * @tc.desc     onSinglePhotoAlbumChange-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_001";
      try {
        PhAccessHelper.onSinglePhotoAlbumChange(null, () => {
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_002
     * @tc.name     SUB_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_002
     * @tc.desc     onSinglePhotoAlbumChange-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_002";
      try {
        PhAccessHelper.onSinglePhotoAlbumChange(undefined, () => {
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_OFF_SINGLE_PHOTO_ALBUM_CHANGE_TEST_001
     * @tc.name     SUB_OFF_SINGLE_PHOTO_ALBUM_CHANGE_TEST_001
     * @tc.desc     offSinglePhotoAlbumChange-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_OFF_SINGLE_PHOTO_ALBUM_CHANGE_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_OFF_SINGLE_PHOTO_ALBUM_CHANGE_TEST_001";
      try {
        PhAccessHelper.offSinglePhotoAlbumChange(null, () => {
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_OFF_SINGLE_PHOTO_ALBUM_CHANGE_TEST_002
     * @tc.name     SUB_OFF_SINGLE_PHOTO_ALBUM_CHANGE_TEST_002
     * @tc.desc     offSinglePhotoAlbumChange-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_OFF_SINGLE_PHOTO_ALBUM_CHANGE_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_OFF_SINGLE_PHOTO_ALBUM_CHANGE_TEST_002";
      try {
        PhAccessHelper.offSinglePhotoAlbumChange(undefined, () => {
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });

  })
}