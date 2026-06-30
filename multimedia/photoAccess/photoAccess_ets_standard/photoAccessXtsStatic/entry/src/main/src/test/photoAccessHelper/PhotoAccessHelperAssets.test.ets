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
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level, Hypium } from '../../../../hypium';
import { getPermission, LOG_TAG, fetchAllOption, createUserAlbum, fetchOption } from '../common';
import common from '@ohos.app.ability.common';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { Context } from '@kit.ArkUI';

const TAG = LOG_TAG + 'addRemoveAssetsSupp';


async function addAssetsPromiseTest(done: Function, testName: string, type:photoAccessHelper.AlbumType, subType:photoAccessHelper.AlbumSubtype, callback: (errCode: number) => void) {
  let testContext: Context = Hypium.get('Context')! as Context;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  console.info(TAG, `phAccessHelper success`+ helper  );
  const fetchOptions = fetchAllOption();
  try {
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOptions);
    const count = await fetchResult.getCount();
    console.info(TAG, `getcount count success:`+ count);
    let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(type, subType);
    console.info(TAG, `albumFetchResult  success`+ albumFetchResult.getCount());
    if (albumFetchResult.getCount() == 0) {
      if (albumValid(type,subType)) {
        await createUserAlbum(testContext, 'addAssets', 'testAlbum' + Date.now());
        albumFetchResult = await helper!.getAlbums(type, subType);
        console.info(TAG, testName,`createUserAlbum success `);
      } else {
        return;
      }
    }
    let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
    let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
    await albumChangeRequest.addAssets([asset]);
    console.info(TAG, testName,`add success first`);
    await albumChangeRequest.addAssets([asset]);
    console.info(TAG, testName,`add success Second`);
    await helper!.applyChanges(albumChangeRequest);
    expect().assertFail();
    done.unsafeCall();
  } catch (error) {
    console.error(TAG, `failed; error: ${error}`, error.code,testName);
    callback(error.code)
    done.unsafeCall();
  }
}

function albumValid(type:photoAccessHelper.AlbumType,subType:photoAccessHelper.AlbumSubtype): Boolean {
  if (type == photoAccessHelper.AlbumType.SYSTEM) {
    if (subType == photoAccessHelper.AlbumSubtype.USER_GENERIC) {
      return false;
    }
  }
  if (type == photoAccessHelper.AlbumType.USER) {
    if (subType == photoAccessHelper.AlbumSubtype.IMAGE ||
        subType == photoAccessHelper.AlbumSubtype.VIDEO ||
        subType == photoAccessHelper.AlbumSubtype.FAVORITE) {
      return false;
    }
  }
  return true;
}

async function removeAssetsPromiseTest(done: Function, testName: string,
  type:photoAccessHelper.AlbumType,subType:photoAccessHelper.AlbumSubtype, callback: (errCode: number) => void) {
  let testContext: Context = Hypium.get('Context')! as Context;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  console.info(TAG, `phAccessHelper success`+ helper  );
  const fetchOptions = fetchAllOption();
  try {
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOptions);
    const count = await fetchResult.getCount();
    console.info(TAG, `getcount count success:`+ count);
    let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(type, subType);
    console.info(TAG, `albumFetchResult  success`+ albumFetchResult.getCount());
    if (albumFetchResult.getCount() == 0) {
      if (albumValid(type,subType)) {
        await createUserAlbum(testContext, 'addAssets', 'testAlbum' + Date.now());
        albumFetchResult = await helper!.getAlbums(type, subType);
        console.info(TAG, testName,`createUserAlbum success `);
      } else {
        return;
      }
    }
    let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
    let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =  new photoAccessHelper.MediaAlbumChangeRequest(album);
    console.info(TAG, `albumChangeRequest  success`+ albumChangeRequest  );
    await albumChangeRequest.removeAssets([asset]);
    console.info(TAG, testName,`remove success first`);
    await albumChangeRequest.removeAssets([asset]);
    console.info(TAG, testName,`remove success Second `);
    await helper!.applyChanges( albumChangeRequest);
    expect().assertFail();
    done.unsafeCall();
  } catch (error) {
    console.error(TAG, testName,`failed; error: ${error}`,error.code,);
    callback(error.code)
    done.unsafeCall();
  }
}

export default function PhotoAccessHelperAssetsTestStatic(): void {
  describe('PhotoAccessHelperAssetsTestStatic', (): void => {
    const abnormalAlbum = 'invalidAlbum';
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

    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0100
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0100
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0100';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.ANY;
      await addAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual(401);
      })
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0200
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0200
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0200';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.FAVORITE;
      await addAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual(401);
      })
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0300
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0300
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0300';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.VIDEO;
      await addAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual(401);
      })
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0400
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0400
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0400';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.IMAGE;
      await addAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual(401);
      })
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0500
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0500
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0500';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.USER_GENERIC;
      await addAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual(14000016);
      })
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0600
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0600
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0600';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.ANY;
      await addAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual(14000016);
      })
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0700
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0700
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0700';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.VIDEO;
      await addAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect().assertFail();
      })
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0800
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0800
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0800';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.IMAGE;
      await addAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect().assertFail();
      })
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0900
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0900
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_0900';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.FAVORITE;
      await addAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect().assertFail();
      })
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_1000
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_1000
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_1000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_1000';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.USER_GENERIC;
      await addAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect().assertFail();
      })
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0100
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0100
     * @tc.desc   removeAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0100';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.ANY;
      await removeAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual(14000016);
      })
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0200
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0200
     * @tc.desc   removeAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0200';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.USER_GENERIC;
      await removeAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual(14000016);
      })
      done.unsafeCall();
    })

    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0300
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0300
     * @tc.desc   removeAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0300';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.ANY;
      await removeAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual(401);
      })
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0400
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0400
     * @tc.desc   removeAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0400';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.FAVORITE;
      await removeAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual(401);
      })
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0500
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0500
     * @tc.desc   removeAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0500';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.VIDEO;
      await removeAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual(401);
      })
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0600
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0600
     * @tc.desc   removeAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0600';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.IMAGE;
      await removeAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect(errCode).assertEqual(401);
      })
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0700
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0700
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0700';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.VIDEO;
      await removeAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect().assertFail();
      })
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0800
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0800
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0800';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.IMAGE;
      await removeAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect().assertFail();
      })
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0900
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0900
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_0900';
      const type = photoAccessHelper.AlbumType.USER;
      const subType= photoAccessHelper.AlbumSubtype.FAVORITE;
      await removeAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect().assertFail();
      })
      done.unsafeCall();
    })
    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_1000
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_1000
     * @tc.desc   addAssets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_1000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_1000';
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType= photoAccessHelper.AlbumSubtype.USER_GENERIC;
      await removeAssetsPromiseTest(done, testName, type , subType, errCode => {
        expect().assertFail();
      })
      done.unsafeCall();
    })
  })
}