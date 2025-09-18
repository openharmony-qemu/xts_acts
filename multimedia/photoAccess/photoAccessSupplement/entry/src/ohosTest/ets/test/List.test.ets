import PhotoAccessMediaAssetChangeRequestSuppTest from './photoAccess/PhotoAccessMediaAssetChangeRequestSupp.test.ets';
import MediaAssetManagerRequestImageTest from './photoAccess/PhotoAccessHelperRequestImage.test.ets';
import MediaAssetManagerRequestImageDataTest from './photoAccess/PhotoAccessHelperRequestImageData.test.ets';
import mediaAssetManagerGetAssetsTest from './photoAccess/PhotoAccessHelperGetAssetsTest.test.ets';
import PhotoAccessHelperLoadMovingPhoto from './photoAccess/PhotoAccessHelperLoadMovingPhoto.test.ets';
import PhotoCreateAssetSuppTest from './photoAccess/PhotoCreateAssetSupp.test.ets';
import GetObjectByPositionTest from './photoAccess/GetObjectByPositionSupp.test.ets';
import AddResourceChangeRequestSuppTest from './photoAccess/AddResourceSupp.test.ets';
import ApplyChangesSuppTest from './photoAccess/ApplyChangesSupp.test.ets';

export default function testsuite() {
  PhotoAccessMediaAssetChangeRequestSuppTest();
  MediaAssetManagerRequestImageTest();
  mediaAssetManagerGetAssetsTest();
  MediaAssetManagerRequestImageDataTest();
  PhotoAccessHelperLoadMovingPhoto();
  PhotoCreateAssetSuppTest();
  GetObjectByPositionTest();
  AddResourceChangeRequestSuppTest();
  ApplyChangesSuppTest();
}