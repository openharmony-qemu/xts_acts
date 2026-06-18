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
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll, Hypium } from '../../../../hypium';
import { getPermission, LOG_TAG } from '../common';
import { common } from '@kit.AbilityKit';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { BusinessError } from '@ohos.base';
import { Context } from '@kit.ArkUI';

const TAG: string = LOG_TAG + 'GetAlbumsSuppTest';

function isEmpty(str: string | number | Long | Int | undefined | null): boolean {
  return str === undefined || str === null || (typeof str === 'string' && str === '');
}

async function GetAlbumsCallbackWithOptionsTest(done: () => void, testName: string,
  type: photoAccessHelper.AlbumType | number | Object | undefined | string | null,
  subType: photoAccessHelper.AlbumSubtype | number | Object | undefined | string | null,
  fetchOps: photoAccessHelper.FetchOptions | Object | undefined | string | null,
  callback: (errCode: number) => void): Promise<void> {
  let testContext: Context = Hypium.get('Context') as Context;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;
  try {
    console.info(TAG, testName, 'Start');
    helper!.getAlbums(type as photoAccessHelper.AlbumType, subType as photoAccessHelper.AlbumSubtype,
      fetchOps as photoAccessHelper.FetchOptions, (error: BusinessError | null,
        fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
      if (error !== null && error !== undefined) {
        console.error(TAG, testName, 'getAlbums failed ', error!.code, JSON.stringify(error));
        done();
        return;
      }
      fetchResult!.getFirstObject().then((album: photoAccessHelper.Album) => {
        const count: int = fetchResult!.getCount();
        console.info(TAG, testName, 'getAlbums success', count, JSON.stringify(album));
        expect(album).not().assertUndefined();
        fetchResult!.close();
        done();
      });
    })
    expect().assertFail();
  } catch (error) {
    console.error(TAG, testName, 'getAlbums catch failed; error: ',error.code, JSON.stringify(error));
    callback(error.code);
    done();
  }
}

async function GetAlbumsCallbackWithOptionsAbnormalTest(done: () => void, testName: string,
  type: photoAccessHelper.AlbumType | number | Object | undefined | string | null,
  subType: photoAccessHelper.AlbumSubtype | number | Object | undefined | string | null,
  callback: (errCode: number) => void) {
  let testContext: Context = Hypium.get('Context') as Context;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;
  try {
    console.info(TAG, testName, 'Start');
    helper!.getAlbums(type as photoAccessHelper.AlbumType, subType as photoAccessHelper.AlbumSubtype,
      (error: BusinessError | null, fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined) => {
        if (error !== null && error !== undefined) {
          console.error(TAG, testName, 'getAlbums failed ', error!.code, JSON.stringify(error));
          done();
          return undefined;
        }
        fetchResult!.getFirstObject().then((album: photoAccessHelper.Album) => {
          const count: int = fetchResult!.getCount();
          console.info(TAG, testName, 'getAlbums success', count, JSON.stringify(album));
          expect(album).not().assertUndefined();
          fetchResult!.close();
          done();
        });
        return undefined;
      })
    expect().assertFail();
  } catch (error) {
    console.error(TAG, testName, 'getAlbums catch failed; error: ', error.code, JSON.stringify(error));
    callback(error.code);
    done();
  }
}

async function GetAlbumsPromiseWithOptionsTest(done: () => void, testName: string,
  type: photoAccessHelper.AlbumType | number | Object | undefined | string | null,
  subType: photoAccessHelper.AlbumSubtype | number | Object | undefined | string | null,
  fetchOps: photoAccessHelper.FetchOptions | Object | undefined | string | null,
  callback: (errCode: number) => void) {
  let testContext: Context = Hypium.get('Context') as Context;
  const helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;
  try {
    console.info(TAG, testName, 'Start');
    helper!.getAlbums(type as photoAccessHelper.AlbumType, subType as photoAccessHelper.AlbumSubtype,
      fetchOps as photoAccessHelper.FetchOptions).then((fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>) => {
      const count: int = fetchResult.getCount();
      fetchResult.getFirstObject().then((album: photoAccessHelper.Album) => {
        console.info(TAG, testName, 'getAlbums success', count, JSON.stringify(album));
        expect(true).assertTrue();
        fetchResult.close();
      });
    }).catch((error: Error) => {
      const errCode: number = error.code;
      console.error(TAG, testName, 'getAlbums catch failed ', errCode, JSON.stringify(error));
      expect(errCode == 13900020).assertTrue();
    });
    done();
  } catch (error) {
    console.error(TAG, testName, 'getAlbums catch failed; error: ', error.code, JSON.stringify(error));
    callback(error.code);
    done();
  }
}

const ALBUM_TYPE_MAX: number = 1;
const ALBUM_SUBTYPE_MAX: number = 1025;

export default function GetAlbumsSuppTestStatic(): void {
  describe('GetAlbumsSuppTestStatic', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      Hypium.set('testNumber', 123);
      Hypium.set('testString', 'abc');
      await getPermission();
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0001
     * @tc.desc   callback, USER-USER_GENERIC, type=enum_max+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0001';
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: number = ALBUM_TYPE_MAX + 1;
      await GetAlbumsCallbackWithOptionsTest(done, testName, maxEnum, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(0);
      });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0002
     * @tc.desc   callback, USER-USER_GENERIC, type=enum_max+1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0002';
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: number = ALBUM_TYPE_MAX + 1000;
      await GetAlbumsCallbackWithOptionsTest(done, testName, maxEnum, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020);
      });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0003
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0003
     * @tc.desc   callback, USER-USER_GENERIC, type=-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0003';
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: int = -1;
      await GetAlbumsCallbackWithOptionsTest(done, testName, maxEnum, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020);
      });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0004
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0004
     * @tc.desc   callback, USER-USER_GENERIC, type=-1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0004';
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: int = -1000;
      await GetAlbumsCallbackWithOptionsTest(done, testName, maxEnum, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020);
      });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0007
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0007
     * @tc.desc   callback, USER-USER_GENERIC, type=Hypium_string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0007';
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsCallbackWithOptionsTest(done, testName, 'abc', subType,
        fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual(13900020);
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0008
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0008
     * @tc.desc   callback, USER-USER_GENERIC, type=Hypium_number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0008';
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsCallbackWithOptionsTest(done, testName, Hypium.get('testNumber') as Object, subType, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual(13900020);
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0009
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0009
     * @tc.desc   callback, USER-FAVORITE, subType=enum_max+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0009';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: number = ALBUM_SUBTYPE_MAX + 1;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020);
      });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0010
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0010
     * @tc.desc   callback, USER-FAVORITE, subType=enum_max+1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0010';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: number = ALBUM_SUBTYPE_MAX + 1000;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020);
      });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0011
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0011
     * @tc.desc   callback, USER-FAVORITE, subType=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0011';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: int = 0;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020);
      });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0012
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0012
     * @tc.desc   callback, USER-FAVORITE, subType=-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0012', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0012';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: int = -1;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020);
      });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0013
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0013
     * @tc.desc   callback, USER-FAVORITE, subType=-1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0013', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0013';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: int = -1000;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020);
      });
    });


    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0016
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0016
     * @tc.desc   callback, USER-FAVORITE, subType=Hypium_string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0016', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0016';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, Hypium.get('testString') as Object, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual(13900020);
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0017
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0017
     * @tc.desc   callback, USER-FAVORITE, subType=Hypium_number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0017', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0017';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, Hypium.get('testNumber') as Object, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual(13900020);
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0020
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0020
     * @tc.desc   callback, USER-FAVORITE, fetchOps=Hypium_string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0020';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.FAVORITE;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, subType, Hypium.get('testString') as Object,
        (errCode: number) => {
          expect(errCode).assertEqual(14000011);
        });
    });

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0021
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0021
     * @tc.desc   callback, USER-FAVORITE, fetchOps=Hypium_number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0021', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0021';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.FAVORITE;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, subType, Hypium.get('testNumber') as Object,
        (errCode: number) => {
          expect(errCode).assertEqual(14000011)
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0022
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0022
     * @tc.desc   callback, SYSTEM, subtype=maxEnum+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0022', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0022';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: number = ALBUM_SUBTYPE_MAX + 1;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0023
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0023
     * @tc.desc   callback, SYSTEM, subtype=maxEnum+1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0023', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0023';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: number = ALBUM_SUBTYPE_MAX + 1000;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0024
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0024
     * @tc.desc   callback, SYSTEM, subtype=0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0024', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0024';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: int = 0;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0025
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0025
     * @tc.desc   callback, SYSTEM, subtype=-1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0025', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0025';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: int = -1;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0026
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0026
     * @tc.desc   callback, SYSTEM, subtype=-1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0026', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0026';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: int = -1000;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0029
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0029
     * @tc.desc   callback, SYSTEM, subtype=Hypium_string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0029', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0029';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, Hypium.get('testString') as Object, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual(13900020)
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0030
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0030
     * @tc.desc   callback, SYSTEM, subtype=Hypium_number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0030';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, Hypium.get('testNumber') as Object, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual(13900020)
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0033
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0033
     * @tc.desc   callback, SYSTEM-FAVORITE, fetchOps=Hypium_string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0033', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0033';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.FAVORITE;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, subType, Hypium.get('testString') as Object,
        (errCode: number) => {
          expect(errCode).assertEqual(14000011)
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0034
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0034
     * @tc.desc   callback, SYSTEM-FAVORITE, fetchOps=Hypium_number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0034', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_0034';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.FAVORITE;
      await GetAlbumsCallbackWithOptionsTest(done, testName, type, subType, Hypium.get('testNumber') as Object,
        (errCode: number) => {
          expect(errCode).assertEqual(14000011)
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0001
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0001';
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      let maxEnum: number = ALBUM_TYPE_MAX + 1;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, maxEnum, subType, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0002
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0002';
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      let maxEnum: number = ALBUM_TYPE_MAX + 1000;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, maxEnum, subType, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0003
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0003
     * @tc.desc   callback, USER-USER_GENERIC, test with AlbumType=-1 (invalid negative value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0003';
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      let maxEnum: int = -1;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, maxEnum, subType, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0004
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0004
     * @tc.desc   callback, USER-USER_GENERIC, test with AlbumType=-1000 (large invalid negative value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0004';
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      let maxEnum: int = -1000;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, maxEnum, subType, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0007
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0007
     * @tc.desc   callback, USER-USER_GENERIC, test with AlbumType from Hypium (number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0007';
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, Hypium.get('testNumber') as Object, subType,
        (errCode: number) => {
          expect(errCode).assertEqual(13900020)
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0008
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0008
     * @tc.desc   callback, USER-USER_GENERIC, test with AlbumType from Hypium (string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0008';
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, Hypium.get('testString') as Object, subType,
        (errCode: number) => {
          expect(errCode).assertEqual(13900020)
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0009
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0009
     * @tc.desc   callback, USER type, test with AlbumSubtype=maxEnum+1 (out of bounds)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0009';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      let maxEnum: number = ALBUM_SUBTYPE_MAX + 1;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, maxEnum, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0010
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0010
     * @tc.desc   callback, USER type, test with AlbumSubtype=maxEnum+1000 (large out of bounds)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0010';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      let maxEnum: number = ALBUM_SUBTYPE_MAX + 1000;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, maxEnum, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0011
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0011
     * @tc.desc   callback, USER type, test with AlbumSubtype=0 (boundary value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0011';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      let maxEnum: int = 0;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, maxEnum, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0012
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0012
     * @tc.desc   callback, USER type, test with AlbumSubtype=-1 (invalid negative value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0012', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0012';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      let maxEnum: int = -1;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, maxEnum, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0013
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0013
     * @tc.desc   callback, USER type, test with AlbumSubtype=-1000 (large invalid negative value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0013', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0013';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      let maxEnum: int = -1000;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, maxEnum, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0016
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0016
     * @tc.desc   callback, USER type, test with AlbumSubtype from Hypium (string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0016', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0016';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, Hypium.get('testString') as Object,
        (errCode: number) => {
          expect(errCode).assertEqual(13900020)
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0017
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0017
     * @tc.desc   callback, USER type, test with AlbumSubtype from Hypium (number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0017', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0017';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, Hypium.get('testNumber') as Object,
        (errCode: number) => {
          expect(errCode).assertEqual(13900020)
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0018
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0018
     * @tc.desc   callback, SYSTEM type, test with AlbumSubtype=maxEnum+1 (out of bounds)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0018', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0018';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      let maxEnum: number = ALBUM_SUBTYPE_MAX + 1;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, maxEnum, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0019
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0019
     * @tc.desc   callback, SYSTEM type, test with AlbumSubtype=maxEnum+1000 (large out of bounds)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0019', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0019';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      let maxEnum: number = ALBUM_SUBTYPE_MAX + 1000;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, maxEnum, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0020
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0020
     * @tc.desc   callback, SYSTEM type, test with AlbumSubtype=0 (boundary value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0020';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      let maxEnum: int = 0;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, maxEnum, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0021
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0021
     * @tc.desc   callback, SYSTEM type, test with AlbumSubtype=-1 (invalid negative value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0021', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0021';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      let maxEnum: int = -1;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, maxEnum, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0022
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0022
     * @tc.desc   callback, SYSTEM type, test with AlbumSubtype=-1000 (large invalid negative value)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0022', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0022';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      let maxEnum: int = -1000;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, maxEnum, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0025
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0025
     * @tc.desc   callback, SYSTEM type, test with AlbumSubtype from Hypium (string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0025', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0025';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, Hypium.get('testString') as Object,
        (errCode: number) => {
          expect(errCode).assertEqual(13900020)
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0026
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0026
     * @tc.desc   callback, SYSTEM type, test with AlbumSubtype from Hypium (number)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0026', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_CALLBACK_STATIC_0026';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      await GetAlbumsCallbackWithOptionsAbnormalTest(done, testName, type, Hypium.get('testNumber') as Object,
        (errCode: number) => {
          expect(errCode).assertEqual(13900020)
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0001
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0001';
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: number = ALBUM_TYPE_MAX + 1;
      await GetAlbumsPromiseWithOptionsTest(done, testName, maxEnum, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0002
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0002';
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: number = ALBUM_TYPE_MAX + 1000;
      await GetAlbumsPromiseWithOptionsTest(done, testName, maxEnum, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0003
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0003
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0003';
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: int = -1;
      await GetAlbumsPromiseWithOptionsTest(done, testName, maxEnum, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0004
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0004
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0004';
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: int = -1000;
      await GetAlbumsPromiseWithOptionsTest(done, testName, maxEnum, subType, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0007
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0007
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0007';
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsPromiseWithOptionsTest(done, testName, Hypium.get('testNumber') as Object, subType, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual(13900020)
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0008
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0008
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0008';
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.USER_GENERIC;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsPromiseWithOptionsTest(done, testName, Hypium.get('testString') as Object, subType, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual(13900020)
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0009
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0009
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0009';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: number = ALBUM_SUBTYPE_MAX + 1;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0010
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0010
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0010';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: number = ALBUM_SUBTYPE_MAX + 1000;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0011
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0011
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0011';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: int = 0;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0012
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0012
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0012', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0012';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: int = -1;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0013
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0013
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0013', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0013';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: int = -1000;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0016
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0016
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0016', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0016';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, Hypium.get('testString') as Object, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual(13900020)
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0017
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0017
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0017', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0017';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, Hypium.get('testNumber') as Object, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual(13900020)
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0020
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0020
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0020';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.FAVORITE;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, subType, Hypium.get('testString') as Object,
        (errCode: number) => {
          expect(errCode).assertEqual(14000011)
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0021
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0021
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0021', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0021';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.USER;
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.FAVORITE;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, subType, Hypium.get('testNumber') as Object,
        (errCode: number) => {
          expect(errCode).assertEqual(14000011)
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_00021
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_00021
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_00021', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_00021';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: number = ALBUM_SUBTYPE_MAX + 1;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0022
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0022
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0022', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0022';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: number = ALBUM_SUBTYPE_MAX + 1000;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0023
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0023
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0023', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0023';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: int = 0;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0024
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0024
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0024', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0024';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: int = -1;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0025
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0025
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0025', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0025';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      let maxEnum: int = -1000;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, maxEnum, fetchOps, (errCode: number) => {
        expect(errCode).assertEqual(13900020)
      })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0028
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0028
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0028', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0028';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, Hypium.get('testString') as Object, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual(13900020)
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0029
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0029
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0029', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0029';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      const fetchOps: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: new dataSharePredicates.DataSharePredicates()
      };
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, Hypium.get('testNumber') as Object, fetchOps,
        (errCode: number) => {
          expect(errCode).assertEqual(13900020)
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0032
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0032
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0032', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0032';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.FAVORITE;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, subType, Hypium.get('testString') as Object,
        (errCode: number) => {
          expect(errCode).assertEqual(14000011)
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0033
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0033
     * @tc.desc   callback, USER-USER_GENERIC, fetchColumns->album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0033', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_OPTIONS_STATIC_0033';
      const type: photoAccessHelper.AlbumType = photoAccessHelper.AlbumType.SYSTEM;
      const subType: photoAccessHelper.AlbumSubtype = photoAccessHelper.AlbumSubtype.FAVORITE;
      await GetAlbumsPromiseWithOptionsTest(done, testName, type, subType, Hypium.get('testNumber') as Object,
        (errCode: number) => {
          expect(errCode).assertEqual(14000011)
        })
    })

    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_PROPERTY_STATIC_0034
     * @tc.number SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_PROPERTY_STATIC_0034
     * @tc.desc   lpath changeTime videoCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_PROPERTY_STATIC_0034', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_GET_ALBUMS_STATIC_PROPERTY_STATIC_0034';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext)!;
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        console.info(TAG, testName, 'Start', helper);
        helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY, fetchOptions).then((fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>) => {
          const count: int = fetchResult.getCount();
          fetchResult.getFirstObject().then((album: photoAccessHelper.Album) => {
            console.info(TAG, testName, 'getAlbums success', count, JSON.stringify(album.lpath), album.changeTime, album.videoCount);
            expect(isEmpty(album.lpath)).assertFalse();
            expect(isEmpty(album.changeTime)).assertFalse();
            expect(isEmpty(album.videoCount)).assertFalse();
            fetchResult.close();
            done();
          });
        }).catch((error) => {
          console.error(TAG, testName, 'getAlbums catch failed ', error.code, JSON.stringify(error));
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, 'getAlbums catch failed; error: ', error.code, JSON.stringify(error));
        expect().assertFail();
        done();
      }
    })


  })
}