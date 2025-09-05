import PhotoAccessMediaAssetChangeRequestSuppTest from './photoAccess/PhotoAccessMediaAssetChangeRequestSupp.test.ets';
import MediaAssetManagerRequestImageTest from './photoAccess/PhotoAccessHelperRequestImage.test.ets';
import MediaAssetManagerRequestImageDataTest from './photoAccess/PhotoAccessHelperRequestImageData.test.ets';
import mediaAssetManagerGetAssetsTest from './photoAccess/PhotoAccessHelperGetAssetsTest.test.ets';
import PhotoAccessHelperLoadMovingPhoto from './photoAccess/PhotoAccessHelperLoadMovingPhoto.test.ets';

export default function testsuite() {
  PhotoAccessMediaAssetChangeRequestSuppTest();
  MediaAssetManagerRequestImageTest();
  mediaAssetManagerGetAssetsTest();
  MediaAssetManagerRequestImageDataTest();
  PhotoAccessHelperLoadMovingPhoto();
}