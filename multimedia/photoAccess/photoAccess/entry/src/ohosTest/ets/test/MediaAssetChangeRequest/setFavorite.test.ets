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
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium-dynamic'
import { photoKeys, fetchOption, albumType, albumSubtype, getPermission, driveFn, sleep } from '../common'
import common from '@ohos.app.ability.common'

export default function setFavoriteChangeRequestTest() {
  describe('setFavoriteChangeRequestTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_FAVORITE_CHANGE_REQUEST_0000
     * @tc.name   set_favorite_change_request_000
     * @tc.desc   image setFavorite true
     * @tc.size   MEDIUM
     * @tc.type   FUNCTION
     * @tc.level  Level 0
     */
    it('set_favorite_change_request_000', Level.LEVEL0, async (done: Function) => {
      const testNum: string = 'set_favorite_change_request_000';
      let favoriteCount: number = 0;
      try {
        let asset: ESObject = await helper.createAsset('favChangeReq01.jpg');
        let fd: ESObject = await asset.open('rw');
        await asset.close(fd);

        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setFavorite(true);
        await helper.applyChanges(assetChangeRequest);

        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'favChangeReq01.jpg');
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
        let album: photoAccessHelper.Album = await fetchResult.getFirstObject();
        fetchResult.close();

        let curFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        favoriteCount = curFetchResult.getCount();
        curFetchResult.close();

        expect(favoriteCount).assertEqual(1);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_FAVORITE_CHANGE_REQUEST_0100
     * @tc.name   set_favorite_change_request_001
     * @tc.desc   image setFavorite true and then false
     * @tc.size   MEDIUM
     * @tc.type   FUNCTION
     * @tc.level  Level 0
     */
    it('set_favorite_change_request_001', Level.LEVEL0, async (done: Function) => {
      const testNum: string = 'set_favorite_change_request_001';
      let countAfterTrue: number = 0;
      let countAfterFalse: number = 0;
      try {
        let asset: ESObject = await helper.createAsset('favChangeReq02.jpg');
        let fd: ESObject = await asset.open('rw');
        await asset.close(fd);

        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'favChangeReq02.jpg');
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setFavorite(true);
        await helper.applyChanges(assetChangeRequest);

        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
        let album: photoAccessHelper.Album = await fetchResult.getFirstObject();
        fetchResult.close();
        let curFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        countAfterTrue = curFetchResult.getCount();
        curFetchResult.close();

        assetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setFavorite(false);
        await helper.applyChanges(assetChangeRequest);

        fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
        album = await fetchResult.getFirstObject();
        fetchResult.close();
        curFetchResult = await album.getAssets(fetchOps);
        countAfterFalse = curFetchResult.getCount();
        curFetchResult.close();

        expect(countAfterTrue).assertEqual(1);
        expect(countAfterFalse).assertEqual(0);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_FAVORITE_CHANGE_REQUEST_0200
     * @tc.name   set_favorite_change_request_002
     * @tc.desc   video setFavorite true
     * @tc.size   MEDIUM
     * @tc.type   FUNCTION
     * @tc.level  Level 2
     */
    it('set_favorite_change_request_002', Level.LEVEL2, async (done: Function) => {
      const testNum: string = 'set_favorite_change_request_002';
      let favoriteCount: number = 0;
      try {
        let asset: ESObject = await helper.createAsset('favChangeReq01.mp4');
        let fd: ESObject = await asset.open('rw');
        await asset.close(fd);

        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setFavorite(true);
        await helper.applyChanges(assetChangeRequest);

        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'favChangeReq01.mp4');
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
        let album: photoAccessHelper.Album = await fetchResult.getFirstObject();
        fetchResult.close();
        let curFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        favoriteCount = curFetchResult.getCount();
        curFetchResult.close();

        expect(favoriteCount).assertEqual(1);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_FAVORITE_CHANGE_REQUEST_0300
     * @tc.name   set_favorite_change_request_003
     * @tc.desc   video setFavorite true and then false
     * @tc.size   MEDIUM
     * @tc.type   FUNCTION
     * @tc.level  Level 2
     */
    it('set_favorite_change_request_003', Level.LEVEL2, async (done: Function) => {
      const testNum: string = 'set_favorite_change_request_003';
      let countAfterTrue: number = 0;
      let countAfterFalse: number = 0;
      try {
        let asset: ESObject = await helper.createAsset('favChangeReq02.mp4');
        let fd: ESObject = await asset.open('rw');
        await asset.close(fd);

        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'favChangeReq02.mp4');
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setFavorite(true);
        await helper.applyChanges(assetChangeRequest);

        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
        let album: photoAccessHelper.Album = await fetchResult.getFirstObject();
        fetchResult.close();
        let curFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        countAfterTrue = curFetchResult.getCount();
        curFetchResult.close();

        assetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setFavorite(false);
        await helper.applyChanges(assetChangeRequest);

        fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
        album = await fetchResult.getFirstObject();
        fetchResult.close();
        curFetchResult = await album.getAssets(fetchOps);
        countAfterFalse = curFetchResult.getCount();
        curFetchResult.close();

        expect(countAfterTrue).assertEqual(1);
        expect(countAfterFalse).assertEqual(0);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_FAVORITE_CHANGE_REQUEST_0400
     * @tc.name   set_favorite_change_request_004
     * @tc.desc   setFavorite true image 5 times
     * @tc.size   MEDIUM
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('set_favorite_change_request_004', Level.LEVEL1, async (done: Function) => {
      const testNum: string = 'set_favorite_change_request_004';
      let favoriteCount: number = 0;
      try {
        let asset: ESObject = await helper.createAsset('setFavoriteRequest001.jpg');
        let fd: ESObject = await asset.open('rw');
        await asset.close(fd);

        for (let index: number = 0; index < 5; index++) {
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
            new photoAccessHelper.MediaAssetChangeRequest(asset);
          assetChangeRequest.setFavorite(true);
          await helper.applyChanges(assetChangeRequest);
        }

        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'setFavoriteRequest001.jpg');
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
        let album: photoAccessHelper.Album = await fetchResult.getFirstObject();
        fetchResult.close();
        let curFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        favoriteCount = curFetchResult.getCount();
        curFetchResult.close();

        expect(favoriteCount).assertEqual(1);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_FAVORITE_CHANGE_REQUEST_0500
     * @tc.name   set_favorite_change_request_005
     * @tc.desc   setFavorite after setTitle
     * @tc.size   MEDIUM
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('set_favorite_change_request_005', Level.LEVEL1, async (done: Function) => {
      const testNum: string = 'set_favorite_change_request_005';
      let favoriteCount: number = 0;
      try {
        let asset: ESObject = await helper.createAsset('setFavoriteRequest002.jpg');
        let fd: ESObject = await asset.open('rw');
        await asset.close(fd);

        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setTitle(testNum);
        await helper.applyChanges(assetChangeRequest);

        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, testNum + '.jpg');
        let fetchResultByTitle: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOps);
        let titleChangedAsset: photoAccessHelper.PhotoAsset = await fetchResultByTitle.getFirstObject();
        fetchResultByTitle.close();

        assetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(titleChangedAsset);
        assetChangeRequest.setFavorite(true);
        await helper.applyChanges(assetChangeRequest);

        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
        let album: photoAccessHelper.Album = await fetchResult.getFirstObject();
        fetchResult.close();
        let curFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        favoriteCount = curFetchResult.getCount();
        curFetchResult.close();

        expect(favoriteCount).assertEqual(1);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_FAVORITE_CHANGE_REQUEST_0600
     * @tc.name   set_favorite_change_request_006
     * @tc.desc   setFavorite false image 5 times
     * @tc.size   MEDIUM
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('set_favorite_change_request_006', Level.LEVEL1, async (done: Function) => {
      const testNum: string = 'set_favorite_change_request_006';
      let favoriteCount: number = 0;
      try {
        let asset: ESObject = await helper.createAsset('setFavoriteRequest006.jpg');
        let fd: ESObject = await asset.open('rw');
        await asset.close(fd);

        for (let index: number = 0; index < 5; index++) {
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
            new photoAccessHelper.MediaAssetChangeRequest(asset);
          assetChangeRequest.setFavorite(false);
          await helper.applyChanges(assetChangeRequest);
        }

        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'setFavoriteRequest006.jpg');
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
        let album: photoAccessHelper.Album = await fetchResult.getFirstObject();
        fetchResult.close();
        let curFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        favoriteCount = curFetchResult.getCount();
        curFetchResult.close();

        expect(favoriteCount).assertEqual(0);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })
  })
}