import MediaAssetChangeRequestStaticTest from "./MediaAssetChangeRequest/MediaAssetChangeRequest.test";
import MediaAssetManagerStaticTest from "./MediaAssetManager/MediaAssetManager.test";
import getAssetsTest from "./photoAccessHelper/PhotoAccessHelper.test";
import photoAccessHelperNoPermissionStaticTest from "./PhotoAccessHelperNoPermission.test";
import photoAccessHelperReadPermissionStaticTest from "./PhotoAccessHelperReadPermission.test";
import FetchResultStatic from "./FetchResult/FetchResult.test";
import PhotoAssetStatic from "./PhotoAsset/PhotoAsset.test";
import getAlbumIdByLPathTest from "./photoAccessHelper/getAlbumIdByLPath.test";
import PhotoGetAssetsTestSupp from "./photoAccessHelper/PhotoGetAssets.test";
import MediaLibraryAvailabilitySupp from "./photoAccessHelper/MediaLibraryAvailability.test";
import photoMediaLibraryNoPermissionStatic from "./photoAccessHelper/MediaLibraryAvailabilityNoPermission.test";
import AddResourceChangeRequestUrlSuppTest from "./AddResource/AddResourceUrl.test";
import CommitModifySuppTest from "./AddResource/CommitModifyTest.test";
import ApplyChangesSuppTestStatic from "./ApplyChange/ApplyChangesSupp.test";
import PhotoAccessHelperEnumStatic from "./photoAccessHelper/PhotoAccessHelperEnum.test";
import photoAccessHelperEnumImageFileTypeStatic from "./photoAccessHelper/photoAccessHelperEnumImageFileType.test";
import GetAlbumsSuppTestStatic from "./GetAlbums/GetAlbumsSuppTest.test";
import getObjectsIndexSetTestStatic from "./photoAccessHelper/getObjectsIndexSet.test";
import getRangeObjectsTestStatic from "./photoAccessHelper/getRangeObjects.test";
import PhotoAccessHelperAssetsTestStatic from "./photoAccessHelper/PhotoAccessHelperAssets.test";
import PhotoAccessHelperEnumAlbumKeysStatic from "./photoAccessHelper/PhotoAccessHelperEnumAlbumKeys.test";

export default function testsuite(): void {
  photoAccessHelperNoPermissionStaticTest();
  photoAccessHelperReadPermissionStaticTest();
  photoMediaLibraryNoPermissionStatic();
  MediaLibraryAvailabilitySupp();
  MediaAssetManagerStaticTest();
  MediaAssetChangeRequestStaticTest();
  getAssetsTest();
  PhotoAssetStatic();
  FetchResultStatic();
  PhotoGetAssetsTestSupp();
  getAlbumIdByLPathTest();
  AddResourceChangeRequestUrlSuppTest();
  CommitModifySuppTest();
  ApplyChangesSuppTestStatic();
  GetAlbumsSuppTestStatic();
  getObjectsIndexSetTestStatic();
  getRangeObjectsTestStatic();
  PhotoAccessHelperAssetsTestStatic();
  PhotoAccessHelperEnumStatic();
  PhotoAccessHelperEnumAlbumKeysStatic();
  photoAccessHelperEnumImageFileTypeStatic();

}