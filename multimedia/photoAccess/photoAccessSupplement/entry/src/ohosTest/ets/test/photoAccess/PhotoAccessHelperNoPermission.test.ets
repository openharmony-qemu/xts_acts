import { photoAccessHelper, sendablePhotoAccessHelper } from '@kit.MediaLibraryKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { dataSharePredicates } from '@kit.ArkData';
import { systemDateTime } from '@kit.BasicServicesKit';


const TAG = "PhotoNoPermissionTest";
interface ErrorCodeType{
  No_Permission: string;
  Invalid_Parm: string;
}
const ErrorCode: ErrorCodeType = {
  No_Permission: '201',
  Invalid_Parm: '23800151'
}

export default function PhotoNoPermissionSupp() {
  describe('PhotoNoPermissionSupp', () => {
    let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);

    /**
     * @tc.number    SUB_MULTMEDIA_ABS_ALBUM__GET_ASSETS_NO_PERMISSION_CALLBACK_0010
     * @tc.name      SUB_MULTMEDIA_ABS_ALBUM__GET_ASSETS_NO_PERMISSION_CALLBACK_0010
     * @tc.desc      callback AbsAlbum-getAssets-no permission
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_ABS_ALBUM__GET_ASSETS_NO_PERMISSION_CALLBACK_0010", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_ABS_ALBUM__GET_ASSETS_NO_PERMISSION_CALLBACK_0010'
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let albumFetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, albumFetchOptions);
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        album.getAssets(fetchOption, async (err, albumFetchResult) => {
          expect().assertFail();
          done();
        })
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual(ErrorCode.No_Permission);
        done();
      }
    })
    /**
     * @tc.number    SUB_MULTMEDIA_ABS_ALBUM__GET_ASSETS_NO_PERMISSION_PROMISE_0010
     * @tc.name      SUB_MULTMEDIA_ABS_ALBUM__GET_ASSETS_NO_PERMISSION_PROMISE_0010
     * @tc.desc      promise AbsAlbum-getAssets-no permission
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_ABS_ALBUM__GET_ASSETS_NO_PERMISSION_PROMISE_0010", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_ABS_ALBUM__GET_ASSETS_NO_PERMISSION_PROMISE_0010'
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let albumFetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, albumFetchOptions);
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        await album.getAssets(fetchOption);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual(ErrorCode.No_Permission);
        done();
      }
    })
    /**
     * @tc.number    SUB_MULTMEDIA_PHOTO_GET_ASSETS_NO_PERMISSION_CALLBACK_0010
     * @tc.name      SUB_MULTMEDIA_PHOTO_GET_ASSETS_NO_PERMISSION_CALLBACK_0010
     * @tc.desc      callback getAssets-no permission
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_PHOTO_GET_ASSETS_NO_PERMISSION_CALLBACK_0010", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ASSETS_NO_PERMISSION_CALLBACK_0010'
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        phAccessHelper.getAssets(fetchOption, async (err, fetchResult) => {
          console.error(TAG, testName, err.code);
          expect(err.code).assertEqual('201');
          done();
        })
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MULTMEDIA_PHOTO_GET_ASSETS_NO_PERMISSION_PROMISE_0010
     * @tc.name      SUB_MULTMEDIA_PHOTO_GET_ASSETS_NO_PERMISSION_PROMISE_0010
     * @tc.desc      promise getAssets-no permission
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_PHOTO_GET_ASSETS_NO_PERMISSION_PROMISE_0010", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ASSETS_NO_PERMISSION_PROMISE_0010'
      let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        await phAccessHelper.getAssets(fetchOption);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual(ErrorCode.No_Permission);
        done();
      }
    })
    /**
     * @tc.number    SUB_MULTMEDIA_PHOTO_GET_BURST_ASSETS_NO_PERMISSION_0010
     * @tc.name      SUB_MULTMEDIA_PHOTO_GET_BURST_ASSETS_NO_PERMISSION_0010
     * @tc.desc      Testing GetBurstAssets-no permission
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_PHOTO_GET_BURST_ASSETS_NO_PERMISSION_0010", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_BURST_ASSETS_NO_PERMISSION_0010'
      let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let burstKey: string = "e719d696-09fa-44f8-8e9e-ec3f215aa62a";
        await phAccessHelper.getBurstAssets(burstKey, fetchOption);
        console.info(TAG, testName, 'getBurstAssets success');
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual(ErrorCode.No_Permission);
        done();
      }
    })
    /**
     * @tc.number    SUB_MULTMEDIA_PHOTO_CREATE_ASSET_NO_PERMISSION_CALLBACK_0010
     * @tc.name      SUB_MULTMEDIA_PHOTO_CREATE_ASSET_NO_PERMISSION_CALLBACK_0010
     * @tc.desc      callback CreateAsset-options-no permission
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_PHOTO_CREATE_ASSET_NO_PERMISSION_CALLBACK_0010", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_NO_PERMISSION_CALLBACK_0010'
      let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
          console.error(TAG, testName, err.code)
          expect(err.code).assertEqual('201');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual(ErrorCode.No_Permission);
        done();
      }
    })
    /**
     * @tc.number    SUB_MULTMEDIA_PHOTO_CREATE_ASSET_NO_PERMISSION_CALLBACK_0020
     * @tc.name      SUB_MULTMEDIA_PHOTO_CREATE_ASSET_NO_PERMISSION_CALLBACK_0020
     * @tc.desc      callback CreateAsset- no options-no permission
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_PHOTO_CREATE_ASSET_NO_PERMISSION_CALLBACK_0020", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_NO_PERMISSION_CALLBACK_0020'
      let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        phAccessHelper.createAsset(photoType, extension, (err, uri) => {
          console.error(TAG, testName, err.code)
          expect(err.code).assertEqual('201');
          done();
        });
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MULTMEDIA_PHOTO_CREATE_ASSET_NO_PERMISSION_PROMISE_0010
     * @tc.name      SUB_MULTMEDIA_PHOTO_CREATE_ASSET_NO_PERMISSION_PROMISE_0010
     * @tc.desc      promise CreateAsset- options-no permission
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_PHOTO_CREATE_ASSET_NO_PERMISSION_PROMISE_0010", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_PHOTO_CREATE_ASSET_NO_PERMISSION_PROMISE_0010'
      let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        await phAccessHelper.createAsset(photoType, extension, options);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual(ErrorCode.No_Permission);
        done();
      }
    })
    /**
     * @tc.number    SUB_MULTMEDIA_PHOTO_GET_ALBUMS_NO_PERMISSION_CALLBACK_0010
     * @tc.name      SUB_MULTMEDIA_PHOTO_GET_ALBUMS_NO_PERMISSION_CALLBACK_0010
     * @tc.desc      callback getAlbums-options-no permission
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_PHOTO_GET_ALBUMS_NO_PERMISSION_CALLBACK_0010", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_NO_PERMISSION_CALLBACK_0010'
      let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
          fetchOptions, async (err, fetchResult) => {
            console.error(TAG, testName, err.code)
            expect(err.code).assertEqual(ErrorCode.No_Permission);
            done();
          });
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MULTMEDIA_PHOTO_GET_ALBUMS_NO_PERMISSION_CALLBACK_0020
     * @tc.name      SUB_MULTMEDIA_PHOTO_GET_ALBUMS_NO_PERMISSION_CALLBACK_0020
     * @tc.desc      callback getAlbums-no options-no permission
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_PHOTO_GET_ALBUMS_NO_PERMISSION_CALLBACK_0020", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_NO_PERMISSION_CALLBACK_0020'
      let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
      try {
        phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
          async (err, fetchResult) => {
            console.error(TAG, testName, err.code)
            expect(err.code).assertEqual(ErrorCode.No_Permission);
            done();
          });
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    SUB_MULTMEDIA_PHOTO_GET_ALBUMS_NO_PERMISSION_PROMISE_0010
     * @tc.name      SUB_MULTMEDIA_PHOTO_GET_ALBUMS_NO_PERMISSION_PROMISE_0010
     * @tc.desc      promise getAlbums-options-no permission
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_PHOTO_GET_ALBUMS_NO_PERMISSION_PROMISE_0010", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_PHOTO_GET_ALBUMS_NO_PERMISSION_PROMISE_0010'
      let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        await phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC,
          fetchOptions);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual(ErrorCode.No_Permission);
        done();
      }
    })
    /**
     * @tc.number    SUB_MULTMEDIA_PHOTO_APPLY_CHANGES_NO_PERMISSION_PROMISE_0010
     * @tc.name      SUB_MULTMEDIA_PHOTO_APPLY_CHANGES_NO_PERMISSION_PROMISE_0010
     * @tc.desc      promise applyChanges-no permission
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_PHOTO_APPLY_CHANGES_NO_PERMISSION_PROMISE_0010", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_PHOTO_APPLY_CHANGES_NO_PERMISSION_PROMISE_0010'
      let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoType, extension);
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024));
        await phAccessHelper.applyChanges(assetChangeRequest!);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual(ErrorCode.No_Permission);
        done();
      }
    })
    /**
     * @tc.number    SUB_MULTMEDIA_PHOTO_ON_PHOTO_CHANGE_NO_PERMISSION_CALLBACK_0010
     * @tc.name      SUB_MULTMEDIA_PHOTO_ON_PHOTO_CHANGE_NO_PERMISSION_CALLBACK_0010
     * @tc.desc      callback on_photoChange-no permission
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_PHOTO_ON_PHOTO_CHANGE_NO_PERMISSION_CALLBACK_0010", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ON_PHOTO_CHANGE_NO_PERMISSION_CALLBACK_0010'
      let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
      try {
        phAccessHelper!.on('photoChange',(changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
          console.info(TAG, testName + ` changeData: ${JSON.stringify(changeData)}`);
          expect().assertFail();
        });
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
        expect(err.code).assertEqual(ErrorCode.No_Permission);
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTMEDIA_PHOTO_OFF_PHOTO_CHANGE_NO_PERMISSION_CALLBACK_0010
     * @tc.name      SUB_MULTMEDIA_PHOTO_OFF_PHOTO_CHANGE_NO_PERMISSION_CALLBACK_0010
     * @tc.desc      callback off_photoChange-no permission
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_PHOTO_OFF_PHOTO_CHANGE_NO_PERMISSION_CALLBACK_0010", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_PHOTO_OFF_PHOTO_CHANGE_NO_PERMISSION_CALLBACK_0010'
      let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
      try {
        phAccessHelper!.off('photoChange',(changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
          console.info(TAG, testName + ` changeData: ${JSON.stringify(changeData)}`);
          expect().assertFail();
        });
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
        expect(err.code).assertEqual(ErrorCode.Invalid_Parm);
        done();
      }
    })
    /**
     * @tc.number    SUB_MULTMEDIA_PHOTO_ON_PHOTO_ALBUM_CHANGE_NO_PERMISSION_CALLBACK_0010
     * @tc.name      SUB_MULTMEDIA_PHOTO_ON_PHOTO_ALBUM_CHANGE_NO_PERMISSION_CALLBACK_0010
     * @tc.desc      callback on_photoAlbumChange-no permission
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_PHOTO_ON_PHOTO_ALBUM_CHANGE_NO_PERMISSION_CALLBACK_0010", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ON_PHOTO_ALBUM_CHANGE_NO_PERMISSION_CALLBACK_0010'
      let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
      try {
        phAccessHelper!.on('photoAlbumChange',(changeData: photoAccessHelper.AlbumChangeInfos) => {
          console.info(TAG, testName + ` changeData: ${JSON.stringify(changeData)}`);
          expect().assertFail();
        });
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
        expect(err.code).assertEqual(ErrorCode.No_Permission);
        done();
      }
    })
    /**
     * @tc.number    SUB_MULTMEDIA_PHOTO_OFF_PHOTO_ALBUM_CHANGE_NO_PERMISSION_CALLBACK_0010
     * @tc.name      SUB_MULTMEDIA_PHOTO_OFF_PHOTO_ALBUM_CHANGE_NO_PERMISSION_CALLBACK_0010
     * @tc.desc      callback off_photoAlbumChange-no permission
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_PHOTO_OFF_PHOTO_ALBUM_CHANGE_NO_PERMISSION_CALLBACK_0010", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_PHOTO_OFF_PHOTO_ALBUM_CHANGE_NO_PERMISSION_CALLBACK_0010'
      let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
      try {
        phAccessHelper!.off('photoAlbumChange',(changeData: photoAccessHelper.AlbumChangeInfos) => {
          console.info(TAG, testName + ` changeData: ${JSON.stringify(changeData)}`);
          expect().assertFail();
        });
        expect().assertFail();
        done();
      } catch (err) {
        console.error(TAG, testName + 'failed. code:' + err.code + ' message:' + err.message);
        expect(err.code).assertEqual(ErrorCode.Invalid_Parm);
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTMEDIA_MEDIA_ASSET_DELETE_ASSETS_NO_PERMISSION_PROMISE_0010
     * @tc.name      SUB_MULTMEDIA_MEDIA_ASSET_DELETE_ASSETS_NO_PERMISSION_PROMISE_0010
     * @tc.desc      promise deleteAssets-no permission-通过PhotoAsset对象删除媒体文件
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_MEDIA_ASSET_DELETE_ASSETS_NO_PERMISSION_PROMISE_0010", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_MEDIA_ASSET_DELETE_ASSETS_NO_PERMISSION_PROMISE_0010'
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let photoAssetList: Array<photoAccessHelper.PhotoAsset> = await fetchResult.getAllObjects();
        await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(context, photoAssetList);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual(ErrorCode.No_Permission);
        done();
      }
    })
    /**
     * @tc.number    SUB_MULTMEDIA_MEDIA_ASSET_DELETE_ASSETS_NO_PERMISSION_PROMISE_0020
     * @tc.name      SUB_MULTMEDIA_MEDIA_ASSET_DELETE_ASSETS_NO_PERMISSION_PROMISE_0020
     * @tc.desc      promise deleteAssets-no permission-通过uri删除媒体文件
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_MEDIA_ASSET_DELETE_ASSETS_NO_PERMISSION_PROMISE_0020", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_MEDIA_ASSET_DELETE_ASSETS_NO_PERMISSION_PROMISE_0020'
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(context, [asset.uri]);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual(ErrorCode.No_Permission);
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTMEDIA_PHOTO_ASSET_COMMIT_MODIFY_NO_PERMISSION_CALLBACK_0010
     * @tc.name      SUB_MULTMEDIA_PHOTO_ASSET_COMMIT_MODIFY_NO_PERMISSION_CALLBACK_0010
     * @tc.desc      callback commitModify-no permission
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_PHOTO_ASSET_COMMIT_MODIFY_NO_PERMISSION_CALLBACK_0010", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_COMMIT_MODIFY_NO_PERMISSION_CALLBACK_0010'
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['title'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = photoAccessHelper.PhotoKeys.TITLE.toString();
        let photoAssetTitle: photoAccessHelper.MemberType = photoAsset.get(title);
        console.info('photoAsset get photoAssetTitle = ', photoAssetTitle);
        photoAsset.set(title, 'newTitle2');
        photoAsset.commitModify((err) => {
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual(ErrorCode.No_Permission);
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTMEDIA_PHOTO_ASSET_COMMIT_MODIFY_NO_PERMISSION_PROMISE_0010
     * @tc.name      SUB_MULTMEDIA_PHOTO_ASSET_COMMIT_MODIFY_NO_PERMISSION_PROMISE_0010
     * @tc.desc      promise commitModify-no permission
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_PHOTO_ASSET_COMMIT_MODIFY_NO_PERMISSION_PROMISE_0010", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_COMMIT_MODIFY_NO_PERMISSION_PROMISE_0010'
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: ['title'],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = photoAccessHelper.PhotoKeys.TITLE.toString();
        let photoAssetTitle: photoAccessHelper.MemberType = photoAsset.get(title);
        console.info('photoAsset get photoAssetTitle = ', photoAssetTitle);
        photoAsset.set(title, 'newTitle2');
        await photoAsset.commitModify();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual(ErrorCode.No_Permission);
        done();
      }
    })

    /**
     * @tc.number    SUB_MULTMEDIA_PHOTO_ASSET_CLONE_NO_PERMISSION_0010
     * @tc.name      SUB_MULTMEDIA_PHOTO_ASSET_CLONE_NO_PERMISSION_0010
     * @tc.desc      promise clone-no permission
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_PHOTO_ASSET_CLONE_NO_PERMISSION_0010", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_PHOTO_ASSET_CLONE_NO_PERMISSION_0010'
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = systemDateTime.getTime().toString();
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual(ErrorCode.No_Permission);
        done();
      }
    })
    /**
     * @tc.number    SUB_MULTMEDIA_SENDABLE_PHOTO_GET_ASSETS_NO_PERMISSION_PROMISE_0010
     * @tc.name      SUB_MULTMEDIA_SENDABLE_PHOTO_GET_ASSETS_NO_PERMISSION_PROMISE_0010
     * @tc.desc      promise sendable-getAssets-no permission
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MULTMEDIA_SENDABLE_PHOTO_GET_ASSETS_NO_PERMISSION_PROMISE_0010", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTMEDIA_SENDABLE_PHOTO_GET_ASSETS_NO_PERMISSION_PROMISE_0010'
      let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(context);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual(ErrorCode.No_Permission);
        done();
      }
    })

  })
}
