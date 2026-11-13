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
import { BusinessError } from '@ohos.base'
import { photoKeys, fetchOption, albumType, albumSubtype, getPermission, driveFn, sleep } from '../common'
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import common from '@ohos.app.ability.common'

export default function batchSetFavoriteChangeRequestTest() {
  describe('batchSetFavoriteChangeRequestTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_BATCH_SET_FAVORITE_CHANGE_REQUEST_0000
     * @tc.name   batch_set_favorite_change_request_000
     * @tc.desc   set favorite and then cancel
     * @tc.size   MEDIUM
     * @tc.type   FUNCTION
     * @tc.level  Level 0
     */
    it('batch_set_favorite_change_request_000', Level.LEVEL0, async (done: Function) => {
      const testNum: string = 'batch_set_favorite_change_request_000';
      const assetName1: string = 'batchFavChangeReq01.jpg';
      const assetName2: string = 'batchFavChangeReq02.jpg';
      let countAfterTrue: number = 0;
      let countAfterFalse: number = 0;
      let assetCount: number = 0;
      try {
        let asset1: ESObject = await helper.createAsset(assetName1);
        let fd1: ESObject = await asset1.open('rw');
        await asset1.close(fd1);

        let asset2: ESObject = await helper.createAsset(assetName2);
        let fd2: ESObject = await asset2.open('rw');
        await asset2.close(fd2);

        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.in(photoKeys.DISPLAY_NAME, [assetName1, assetName2]);
        let fetchOps: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let assetFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOps);
        assetCount = assetFetchResult.getCount();
        let assetList: Array<photoAccessHelper.PhotoAsset> = await assetFetchResult.getAllObjects();
        assetFetchResult.close();

        let assetsChangeRequest: photoAccessHelper.MediaAssetsChangeRequest =
          new photoAccessHelper.MediaAssetsChangeRequest(assetList);
        assetsChangeRequest.setFavorite(true);
        await helper.applyChanges(assetsChangeRequest);

        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
        let album: photoAccessHelper.Album = await fetchResult.getFirstObject();
        fetchResult.close();
        let curFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        countAfterTrue = curFetchResult.getCount();
        curFetchResult.close();

        assetsChangeRequest = new photoAccessHelper.MediaAssetsChangeRequest(assetList);
        assetsChangeRequest.setFavorite(false);
        await helper.applyChanges(assetsChangeRequest);

        fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
        album = await fetchResult.getFirstObject();
        fetchResult.close();
        curFetchResult = await album.getAssets(fetchOps);
        countAfterFalse = curFetchResult.getCount();
        curFetchResult.close();

        expect(assetCount).assertEqual(2);
        expect(countAfterTrue).assertEqual(2);
        expect(countAfterFalse).assertEqual(0);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_BATCH_SET_FAVORITE_CHANGE_REQUEST_0200
     * @tc.name   batch_set_favorite_change_request_001
     * @tc.desc   set favorite multiple different statuses
     * @tc.size   MEDIUM
     * @tc.type   FUNCTION
     * @tc.level  Level 0
     */
    it('batch_set_favorite_change_request_001', Level.LEVEL0, async (done: Function) => {
      const testNum: string = 'batch_set_favorite_change_request_001';
      const assetName1: string = 'setFavorite002_1.jpg';
      const assetName2: string = 'setFavorite002_2.jpg';
      let countAfterInitialFavorite: number = 0;
      let countAfterBatchTrue: number = 0;
      let countAfterBatchFalse: number = 0;
      try {
        let asset1: ESObject = await helper.createAsset(assetName1);
        let fd1: ESObject = await asset1.open('rw');
        await asset1.close(fd1);

        let asset2: ESObject = await helper.createAsset(assetName2);
        let fd2: ESObject = await asset2.open('rw');
        await asset2.close(fd2);

        let singleAssetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset1);
        singleAssetChangeRequest.setFavorite(true);
        await helper.applyChanges(singleAssetChangeRequest);

        singleAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset2);
        singleAssetChangeRequest.setFavorite(false);
        await helper.applyChanges(singleAssetChangeRequest);

        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.in(photoKeys.DISPLAY_NAME, [assetName1, assetName2]);
        let fetchOps: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };

        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
        let album: photoAccessHelper.Album = await fetchResult.getFirstObject();
        fetchResult.close();
        let curFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        countAfterInitialFavorite = curFetchResult.getCount();
        curFetchResult.close();

        let assetFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOps);
        let assetList: Array<photoAccessHelper.PhotoAsset> = await assetFetchResult.getAllObjects();
        assetFetchResult.close();

        let assetsChangeRequest: photoAccessHelper.MediaAssetsChangeRequest =
          new photoAccessHelper.MediaAssetsChangeRequest(assetList);
        assetsChangeRequest.setFavorite(true);
        await helper.applyChanges(assetsChangeRequest);

        fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
        album = await fetchResult.getFirstObject();
        fetchResult.close();
        curFetchResult = await album.getAssets(fetchOps);
        countAfterBatchTrue = curFetchResult.getCount();
        curFetchResult.close();

        assetsChangeRequest = new photoAccessHelper.MediaAssetsChangeRequest(assetList);
        assetsChangeRequest.setFavorite(false);
        await helper.applyChanges(assetsChangeRequest);

        fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
        album = await fetchResult.getFirstObject();
        fetchResult.close();
        curFetchResult = await album.getAssets(fetchOps);
        countAfterBatchFalse = curFetchResult.getCount();
        curFetchResult.close();

        expect(countAfterInitialFavorite).assertEqual(1);
        expect(countAfterBatchTrue).assertEqual(2);
        expect(countAfterBatchFalse).assertEqual(0);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })
  })
}
