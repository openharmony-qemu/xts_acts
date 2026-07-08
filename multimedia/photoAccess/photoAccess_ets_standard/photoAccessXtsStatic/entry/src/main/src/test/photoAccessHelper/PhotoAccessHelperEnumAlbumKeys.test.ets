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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level, Hypium } from '@ohos/hypium-binary/src/main/indexStatic';
import { getPermission, LOG_TAG, fetchAllOption, createUserAlbum, fetchOption } from '../common';
import { Context } from '@kit.ArkUI';

const TAG = LOG_TAG + 'PhotoAccessHelperEnumAlbumKeys';

async function getAlbumsPromiseWithOptionsAbnormalTest(done: Function, type: photoAccessHelper.AlbumType | undefined,
  subType: photoAccessHelper.AlbumSubtype | undefined, fetchOps: photoAccessHelper.FetchOptions | undefined, callback: () => void) {
  let testContext: Context = Hypium.get('Context')! as Context;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let fetchResult = await helper!.getAlbums(type as photoAccessHelper.AlbumType, subType as photoAccessHelper.AlbumSubtype,
      fetchOps as photoAccessHelper.FetchOptions);
    const count: int = fetchResult.getCount();
    console.info(TAG, `count,`+ count);
    console.info(TAG, `getAlbums success, count: ${count}`);
    fetchResult.close();
    expect(count >= 0).assertTrue()
    done.unsafeCall();
  } catch (error) {
    console.error(TAG, `getAlbums catch failed; error: ${error?.code}, ${error?.message}`);
    callback();
    done.unsafeCall();
  }
}

async function getAlbumsCallbackTest(done: Function, type: photoAccessHelper.AlbumType,
  subType: photoAccessHelper.AlbumSubtype, callback: () => void) {
  let testContext: Context = Hypium.get('Context')! as Context;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    helper!.getAlbums(type, subType, (error, fetchResult) => {
      try {
        if (error !== undefined) {
          console.error(TAG, `getAlbums failed; error: ${error?.code}, ${error?.message}`);
          callback();
        } else if (fetchResult !== undefined) {
          const count: int = fetchResult.getCount();
          console.info(TAG, `getAlbums success, count: ${count}`);
          fetchResult.close();
        }
        done.unsafeCall();
      } catch (error) {
        console.error(TAG, `getAlbums callback failed; code: ${error?.code}, msg: ${error?.message}`);
        expect(error?.code == 14000011).assertTrue();
        done.unsafeCall();
      }
    })
  } catch (error) {
    console.error(TAG, `getAlbums catch failed; error: ${error?.code}, ${error?.message}`);
    expect(error?.code == 13900020).assertTrue();
    done.unsafeCall();
  }
}

export default function PhotoAccessHelperEnumAlbumKeysStatic(): void {
  describe('PhotoAccessHelperEnumAlbumKeysStatic', () => {
    const albumName = 'testAlbum';
    const abnormalAlbum = 'invalidAlbum';

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

    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_KEYS_STATIC_0800
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_KEYS_STATIC_0800
     * @tc.desc      AlbumKeys.ALBUM_NAME
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_KEYS_STATIC_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_KEYS_STATIC_0800';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.USER;
      const subType = photoAccessHelper.AlbumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.ALBUM_NAME, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_KEYS_STATIC_0900
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_KEYS_STATIC_0900
     * @tc.desc      AlbumKeys.URI
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_KEYS_STATIC_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_KEYS_STATIC_0900';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.USER;
      const subType = photoAccessHelper.AlbumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.URI, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })



    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1000
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1000
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.ANY AlbumKeys.URI
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1000';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.URI, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1100
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1100
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.ANY AlbumKeys.ALBUM_NAME
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1100';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.ALBUM_NAME, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1200
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1200
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.ANY AlbumKeys.uri
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1200';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.ANY;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.URI, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1300
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1300
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.IMAGE AlbumKeys.ALBUM_NAME
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1300';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.IMAGE;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.ALBUM_NAME, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1400
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1400
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.IMAGE AlbumKeys.URI
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1400';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.IMAGE;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.URI, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1500
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1500
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.VIDEO AlbumKeys.ALBUM_NAME
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1500';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.VIDEO;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.ALBUM_NAME, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1600
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1600
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.VIDEO AlbumKeys.URI
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1600';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.VIDEO;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.URI, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1700
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1700
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.FAVORITE AlbumKeys.ALBUM_NAME
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1700';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.FAVORITE;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.ALBUM_NAME, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1800
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1800
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.FAVORITE AlbumKeys.URI
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1800';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.FAVORITE;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.URI, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1900
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1900
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.USER_GENERIC AlbumKeys.ALBUM_NAME
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_1900';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.ALBUM_NAME, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_2000
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_2000
     * @tc.desc      AlbumType.SYSTEM AlbumSubtype.USER_GENERIC AlbumKeys.URI
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_2000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_PHOTO_ACCESS_HELPER_GET_ALBUM_STATIC_2000';
      console.info(TAG, testName);
      const type = photoAccessHelper.AlbumType.SYSTEM;
      const subType = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoAccessHelper.AlbumKeys.URI, abnormalAlbum);
      await getAlbumsPromiseWithOptionsAbnormalTest(done, type, subType, fetchOps, () => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_ALBUM_EUM_STATIC_2100
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_ALBUM_EUM_STATIC_2100
     * @tc.desc      AlbumKeys emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_ALBUM_EUM_STATIC_2100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_ALBUM_EUM_STATIC_2100---------')
      expect(photoAccessHelper.AlbumKeys.URI).assertEqual('uri');
      expect(photoAccessHelper.AlbumKeys.ALBUM_NAME).assertEqual('album_name');
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_ALBUM_EUM_STATIC_2100,end here---------')
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_ALBUM_EUM_STATIC_2200
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_ALBUM_EUM_STATIC_2200
     * @tc.desc      AlbumType emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_ALBUM_EUM_STATIC_2200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_ALBUM_EUM_STATIC_2200---------')
      expect(photoAccessHelper.AlbumType.USER == 0).assertTrue();
      expect(photoAccessHelper.AlbumType.SYSTEM == 1024).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_ALBUM_EUM_STATIC_2200,end here---------')
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_ALBUM_EUM_STATIC_2300
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_ALBUM_EUM_STATIC_2300
     * @tc.desc      AlbumSubtype emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_ALBUM_EUM_STATIC_2300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_ALBUM_EUM_STATIC_2300---------')
      expect(photoAccessHelper.AlbumSubtype.USER_GENERIC == 1).assertTrue();
      expect(photoAccessHelper.AlbumSubtype.FAVORITE == 1025).assertTrue();
      expect(photoAccessHelper.AlbumSubtype.VIDEO == 1026).assertTrue();
      expect(photoAccessHelper.AlbumSubtype.IMAGE == 1031).assertTrue();
      expect(photoAccessHelper.AlbumSubtype.ANY == 2147483647).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_ALBUM_EUM_STATIC_2300,end here---------')
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_ALBUM_EUM_STATIC_2400
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_ALBUM_EUM_STATIC_2400
     * @tc.desc      AlbumSubtype emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_ALBUM_EUM_STATIC_2400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_ALBUM_EUM_STATIC_2400---------')
      expect(photoAccessHelper.AlbumSubtype.USER_GENERIC == 1).assertTrue();
      expect(photoAccessHelper.AlbumSubtype.FAVORITE == 1025).assertTrue();
      expect(photoAccessHelper.AlbumSubtype.VIDEO == 1026).assertTrue();
      expect(photoAccessHelper.AlbumSubtype.IMAGE == 1031).assertTrue();
      expect(photoAccessHelper.AlbumSubtype.ANY == 2147483647).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_ALBUM_EUM_STATIC_2400,end here---------')
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2500
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2500
     * @tc.desc      PhotoKeys emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2500---------')
      expect(photoAccessHelper.PhotoKeys.SIZE).assertEqual('size');
      expect(photoAccessHelper.PhotoKeys.DATE_ADDED).assertEqual('date_added');
      expect(photoAccessHelper.PhotoKeys.DATE_MODIFIED).assertEqual('date_modified');
      expect(photoAccessHelper.PhotoKeys.DURATION).assertEqual('duration');
      expect(photoAccessHelper.PhotoKeys.WIDTH).assertEqual('width');
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2500,end here---------')
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2600
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2600
     * @tc.desc      PhotoKeys emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2600---------')
      expect(photoAccessHelper.PhotoKeys.HEIGHT).assertEqual('height');
      expect(photoAccessHelper.PhotoKeys.DATE_TAKEN).assertEqual('date_taken');
      expect(photoAccessHelper.PhotoKeys.ORIENTATION).assertEqual('orientation');
      expect(photoAccessHelper.PhotoKeys.FAVORITE).assertEqual('is_favorite');
      expect(photoAccessHelper.PhotoKeys.TITLE).assertEqual('title');
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2600,end here---------')
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2700
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2700
     * @tc.desc      PhotoKeys emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2700', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2700---------')
      expect(photoAccessHelper.PhotoKeys.POSITION).assertEqual('position');
      expect(photoAccessHelper.PhotoKeys.DATE_ADDED_MS).assertEqual('date_added_ms');
      expect(photoAccessHelper.PhotoKeys.DATE_MODIFIED_MS).assertEqual('date_modified_ms');
      expect(photoAccessHelper.PhotoKeys.PHOTO_SUBTYPE).assertEqual('subtype');
      expect(photoAccessHelper.PhotoKeys.DYNAMIC_RANGE_TYPE).assertEqual('dynamic_range_type');
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2700,end here---------')
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2800
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2800
     * @tc.desc      PhotoKeys emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2800', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2800---------')
      expect(photoAccessHelper.PhotoKeys.COVER_POSITION).assertEqual('cover_position');
      expect(photoAccessHelper.PhotoKeys.BURST_KEY).assertEqual('burst_key');
      expect(photoAccessHelper.PhotoKeys.LCD_SIZE).assertEqual('lcd_size');
      expect(photoAccessHelper.PhotoKeys.DETAIL_TIME).assertEqual('detail_time');
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2800,end here---------')
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2900
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2900
     * @tc.desc      PhotoKeys emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2900', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2900---------')
      expect(photoAccessHelper.PhotoKeys.DATE_TAKEN_MS).assertEqual('date_taken_ms');
      expect(photoAccessHelper.PhotoKeys.MEDIA_SUFFIX).assertEqual('media_suffix');
      expect(photoAccessHelper.PhotoKeys.URI).assertEqual('uri');
      expect(photoAccessHelper.PhotoKeys.PHOTO_TYPE).assertEqual('media_type');
      expect(photoAccessHelper.PhotoKeys.DISPLAY_NAME).assertEqual('display_name');
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_KEYS_EUM_STATIC_2900,end here---------')
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_TYPE_EUM_STATIC_0100
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_TYPE_EUM_STATIC_0100
     * @tc.desc      PhotoType emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_TYPE_EUM_STATIC_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_TYPE_EUM_STATIC_0100---------')
      expect(photoAccessHelper.PhotoType.IMAGE == 1).assertTrue();
      expect(photoAccessHelper.PhotoType.VIDEO == 2).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_TYPE_EUM_STATIC_0100,end here---------')
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_TYPE_EUM_STATIC_0200
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_TYPE_EUM_STATIC_0200
     * @tc.desc      PhotoSubtype emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_TYPE_EUM_STATIC_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_TYPE_EUM_STATIC_0200---------')
      expect(photoAccessHelper.PhotoSubtype.DEFAULT == 0).assertTrue();
      expect(photoAccessHelper.PhotoSubtype.MOVING_PHOTO == 3).assertTrue();
      expect(photoAccessHelper.PhotoSubtype.BURST == 4).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_PHOTO_TYPE_EUM_STATIC_0200,end here---------')
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_POSITION_TYPE_EUM_STATIC_0100
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_POSITION_TYPE_EUM_STATIC_0100
     * @tc.desc      PositionType emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_POSITION_TYPE_EUM_STATIC_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_POSITION_TYPE_EUM_STATIC_0100---------')
      expect(photoAccessHelper.PositionType.LOCAL == 1).assertTrue();
      expect(photoAccessHelper.PositionType.CLOUD == 2).assertTrue();
      expect(photoAccessHelper.PositionType.LOCAL_AND_CLOUD == 3).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_POSITION_TYPE_EUM_STATIC_0100,end here---------')
      done();
    })

    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_RECOMMENDATION_TYPE_EUM_STATIC_0200
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_RECOMMENDATION_TYPE_EUM_STATIC_0200
     * @tc.desc      RecommendationType emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_RECOMMENDATION_TYPE_EUM_STATIC_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_RECOMMENDATION_TYPE_EUM_STATIC_0200---------')
      expect(photoAccessHelper.RecommendationType.QR_OR_BAR_CODE == 1).assertTrue();
      expect(photoAccessHelper.RecommendationType.QR_CODE == 2).assertTrue();
      expect(photoAccessHelper.RecommendationType.BAR_CODE == 3).assertTrue();
      expect(photoAccessHelper.RecommendationType.ID_CARD == 4).assertTrue();
      expect(photoAccessHelper.RecommendationType.PROFILE_PICTURE == 5).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_RECOMMENDATION_TYPE_EUM_STATIC_0200,end here---------')
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_RECOMMENDATION_TYPE_EUM_STATIC_0300
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_RECOMMENDATION_TYPE_EUM_STATIC_0300
     * @tc.desc      RecommendationType emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_RECOMMENDATION_TYPE_EUM_STATIC_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_RECOMMENDATION_TYPE_EUM_STATIC_0300---------')
      expect(photoAccessHelper.RecommendationType.PASSPORT == 6).assertTrue();
      expect(photoAccessHelper.RecommendationType.BANK_CARD == 7).assertTrue();
      expect(photoAccessHelper.RecommendationType.DRIVER_LICENSE == 8).assertTrue();
      expect(photoAccessHelper.RecommendationType.DRIVING_LICENSE == 9).assertTrue();
      expect(photoAccessHelper.RecommendationType.FEATURED_SINGLE_PORTRAIT == 10).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_RECOMMENDATION_TYPE_EUM_STATIC_0300,end here---------')
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_DELIVERY_MODE_EUM_STATIC_0100
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_DELIVERY_MODE_EUM_STATIC_0100
     * @tc.desc      DeliveryMode emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_DELIVERY_MODE_EUM_STATIC_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_DELIVERY_MODE_EUM_STATIC_0100---------')
      expect(photoAccessHelper.DeliveryMode.FAST_MODE == 0).assertTrue();
      expect(photoAccessHelper.DeliveryMode.HIGH_QUALITY_MODE == 1).assertTrue();
      expect(photoAccessHelper.DeliveryMode.BALANCE_MODE == 2).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_DELIVERY_MODE_EUM_STATIC_0100,end here---------')
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_COMPATIBLE_MODE_EUM_STATIC_0200
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_COMPATIBLE_MODE_EUM_STATIC_0200
     * @tc.desc      CompatibleMode emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_COMPATIBLE_MODE_EUM_STATIC_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_COMPATIBLE_MODE_EUM_STATIC_0200---------')
      expect(photoAccessHelper.CompatibleMode.ORIGINAL_FORMAT_MODE == 0).assertTrue();
      expect(photoAccessHelper.CompatibleMode.COMPATIBLE_FORMAT_MODE == 1).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_COMPATIBLE_MODE_EUM_STATIC_0200,end here---------')
      done();
    })
    /**
     * @tc.number    SUB_MEDIA_PHOTO_ACCESS_HELPER_COMPLETE_BUTTON_TEXT_EUM_STATIC_0300
     * @tc.name      SUB_MEDIA_PHOTO_ACCESS_HELPER_COMPLETE_BUTTON_TEXT_EUM_STATIC_0300
     * @tc.desc      CompleteButtonText emu
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('SUB_MEDIA_PHOTO_ACCESS_HELPER_COMPLETE_BUTTON_TEXT_EUM_STATIC_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_COMPLETE_BUTTON_TEXT_EUM_STATIC_0300---------')
      expect(photoAccessHelper.CompleteButtonText.TEXT_DONE == 0).assertTrue();
      expect(photoAccessHelper.CompleteButtonText.TEXT_SEND == 1).assertTrue();
      expect(photoAccessHelper.CompleteButtonText.TEXT_ADD == 2).assertTrue();
      console.info(TAG,'--------SUB_MEDIA_PHOTO_ACCESS_HELPER_COMPLETE_BUTTON_TEXT_EUM_STATIC_0300,end here---------')
      done();
    })
  })
}


