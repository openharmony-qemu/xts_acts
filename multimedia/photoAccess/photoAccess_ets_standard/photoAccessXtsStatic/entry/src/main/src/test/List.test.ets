import MediaAssetChangeRequestStaticTest from "./MediaAssetChangeRequest/MediaAssetChangeRequest.test";
import MediaAssetManagerStaticTest from "./MediaAssetManager/MediaAssetManager.test";
import getAssetsTest from "./photoAccessHelper/PhotoAccessHelper.test";
import photoAccessHelperNoPermissionStaticTest from "./PhotoAccessHelperNoPermission.test";
import photoAccessHelperReadPermissionStaticTest from "./PhotoAccessHelperReadPermission.test";
import FetchResultStatic from "./FetchResult/FetchResult.test";
import PhotoAssetStatic from "./PhotoAsset/PhotoAsset.test";
import getAlbumIdByLPathTest from "./photoAccessHelper/getAlbumIdByLPath.test";
import PhotoGetAssetsTestSupp from "./photoAccessHelper/PhotoGetAssets.test";

export default function testsuite(): void {
  photoAccessHelperNoPermissionStaticTest();
  photoAccessHelperReadPermissionStaticTest();
  MediaAssetManagerStaticTest();
  MediaAssetChangeRequestStaticTest();
  getAssetsTest();
  PhotoAssetStatic();
  FetchResultStatic();
  PhotoGetAssetsTestSupp();
  getAlbumIdByLPathTest();
}