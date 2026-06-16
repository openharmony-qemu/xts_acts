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
import { createUserAlbum, fetchOption, getPermission, LOG_TAG } from '../common';
import { Context } from '@kit.ArkUI';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { BusinessError } from '@kit.BasicServicesKit';


const TAG = LOG_TAG + 'getAlbumsTest';


export default function getAlbumsStaticTest(): void {
  describe('getAlbumsStaticTest', () => {
    const albumName = 'testAlbum';
    const abnormalAlbum = 'invalidAlbum';
    let testContext: Context = Hypium.get('Context') as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      await getPermission();
      await createUserAlbum(testContext, TAG, 'PhotoSetTitleTestSupp');
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
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0010
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0010
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0010';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, fetchOps,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertFalse();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0020
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0020
     * @tc.desc   callback, USER-FAVORITE, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0020';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.FAVORITE, fetchOps,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertTrue();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0030
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0030
     * @tc.desc   callback, USER-VIDEO, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0030';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.VIDEO, fetchOps,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertTrue();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0040
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0040
     * @tc.desc   callback, USER-IMAGE, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0040';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.IMAGE, fetchOps,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertTrue();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0050
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0050
     * @tc.desc   callback, USER-ANY, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0050';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.ANY, fetchOps,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertFalse();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0060
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0060
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0060';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [albumName],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, fetchOps,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertFalse();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0070
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0070
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0070', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0070';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [abnormalAlbum],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, fetchOps,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertFalse();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0080
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0080
     * @tc.desc   callback, SYSTEM-USER_GENERIC, fetchOps->new
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0080', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0080';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.USER_GENERIC, fetchOps,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertTrue();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0090
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0090
     * @tc.desc   callback, SYSTEM-FAVORITE, fetchOps->new
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0090', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0090';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.FAVORITE, fetchOps,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertFalse();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0100
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0100
     * @tc.desc   callback, SYSTEM-VIDEO, fetchOps->new
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0100';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.VIDEO, fetchOps,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertFalse();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0110
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0110
     * @tc.desc   callback, SYSTEM-IMAGE, fetchOps->new
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0110', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0110';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE, fetchOps,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertFalse();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0120
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0120
     * @tc.desc   callback, SYSTEM-ANY, fetchOps->new
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0120', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0120';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY, fetchOps,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertFalse();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0130
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0130
     * @tc.desc   callback, SYSTEM-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0130', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0130';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [albumName],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.USER_GENERIC, fetchOps,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertFalse();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0140
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0140
     * @tc.desc   callback, USER-USER_GENERIC, no fetchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0140', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0140';
      console.info(TAG, testName);
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertFalse();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0150
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0150
     * @tc.desc   callback, USER-FAVORITE, no fetchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0150', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0150';
      console.info(TAG, testName);
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.FAVORITE,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertTrue();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0160
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0160
     * @tc.desc   callback, USER-VIDEO, no fetchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0160', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0160';
      console.info(TAG, testName);
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.VIDEO,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertTrue();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0170
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0170
     * @tc.desc   callback, USER-IMAGE, no fetchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0170', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0170';
      console.info(TAG, testName);
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.IMAGE,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertTrue();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0180
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0180
     * @tc.desc   callback, USER-ANY, no fetchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0180', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0180';
      console.info(TAG, testName);
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.ANY,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertFalse();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0190
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0190
     * @tc.desc   callback, SYSTEM-USER_GENERIC, no fetchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0190', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0190';
      console.info(TAG, testName);
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.USER_GENERIC,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertTrue();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0200
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0200
     * @tc.desc   callback, SYSTEM-FAVORITE, no fetchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0200';
      console.info(TAG, testName);
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.FAVORITE,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertFalse();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0210
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0210
     * @tc.desc   callback, SYSTEM-VIDEO, no fetchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0210', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0210';
      console.info(TAG, testName);
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.VIDEO,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertFalse();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0220
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0220
     * @tc.desc   callback, SYSTEM-IMAGE, no fetchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0220', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0220';
      console.info(TAG, testName);
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertFalse();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0230
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0230
     * @tc.desc   callback, SYSTEM-ANY, no fetchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0230', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0230';
      console.info(TAG, testName);
      try {
        helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY,
          (error: BusinessError<void> | null,
            fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
            expect(fetchResult!.isAfterLast()).assertFalse();
            done();
          });
      } catch (error) {
        console.error(TAG, testName, 'Failed applyChanges', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0240
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0240
     * @tc.desc   callback, USER-ANY, fetchOps->new
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0240', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0240';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      try {
        let fetchResult =
          await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.ANY, fetchOps)
        expect(fetchResult!.isAfterLast()).assertFalse();
        console.info(TAG, testName, `getAlbums success`);
        fetchResult.close();
        done();
      } catch (error) {
        console.error(TAG, `getAlbums catch failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0250
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0250
     * @tc.desc   callback, USER-ANY, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0250', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0250';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [albumName],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      try {
        let fetchResult =
          await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.ANY, fetchOps)
        expect(fetchResult!.isAfterLast()).assertFalse();
        console.info(TAG, testName, `getAlbums success`);
        fetchResult.close();
        done();
      } catch (error) {
        console.error(TAG, `getAlbums catch failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0260
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0260
     * @tc.desc   callback, SYSTEM-ANY, fetchOps->new
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0260', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0260';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      try {
        let fetchResult =
          await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY, fetchOps)
        expect(fetchResult!.isAfterLast()).assertFalse();
        console.info(TAG, testName, `getAlbums success`);
        fetchResult.close();
        done();
      } catch (error) {
        console.error(TAG, `getAlbums catch failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0270
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0270
     * @tc.desc   callback, SYSTEM-ANY, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0270', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0270';
      console.info(TAG, testName);
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [albumName],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      try {
        let fetchResult =
          await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY, fetchOps)
        expect(fetchResult!.isAfterLast()).assertFalse();
        console.info(TAG, testName, `getAlbums success`);
        fetchResult.close();
        done();
      } catch (error) {
        console.error(TAG, `getAlbums catch failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0280
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0280
     * @tc.desc   callback, USER-ANY, no fetchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0280', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0280';
      console.info(TAG, testName);
      try {
        let fetchResult =
          await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.ANY)
        expect(fetchResult!.isAfterLast()).assertFalse();
        console.info(TAG, testName, `getAlbums success`);
        fetchResult.close();
        done();
      } catch (error) {
        console.error(TAG, `getAlbums catch failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0290
     * @tc.number SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0290
     * @tc.desc   callback, SYSTEM-ANY, no fetchOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0290', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_STATIC_0290';
      console.info(TAG, testName);
      try {
        let fetchResult =
          await helper!.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY)
        expect(fetchResult!.isAfterLast()).assertFalse();
        console.info(TAG, testName, `getAlbums success`);
        fetchResult.close();
        done();
      } catch (error) {
        console.error(TAG, `getAlbums catch failed; error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
    })

  })
}