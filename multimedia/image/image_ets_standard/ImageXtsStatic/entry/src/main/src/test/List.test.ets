'use static'
import metaDataStaticTest from "./image/Metadata.test";
import ImageGetComponentSupp from "./image/getComponent/GetComponent.test";
import AuxiliaryPictureGetAuxiliaryPictureInfoTest from "./Picture/Picture.test";
import CrateImageSourceTest from "./image/creatImageSource/CreatImageSource.test";
import CrateImageCreatorTest from "./ImageCreator/ImageCreator.test";
import MakerNoteHuaweiMetadataTest from "./property/Property.test";
import ImageReceiverSupp from "./ImageReceiver/ImageReceiver.test";
import ImageExifMetadataStaticTest from './ExifMetadata.test'
import ImageAuxiliaryPictureGetMetadataStaticTest from "./image/AuxiliaryPicture.test";
import ImagePackerStaticTest from "./image/ImagePacker.test";
import createUnpremultipliedPixelMapSyncTest from "./testStatic/image/image/createUnpremultipliedPixelMap.test";
import imagePackerPackToDataFromPixelmapSequenceStaticSuppTest
  from "./testStatic/image/ImagePacker/packToDataFromPixelmapSequenceStatic.test";
import imagePackerPackToFileFromPixelmapSequenceSUppStaticTest
  from "./testStatic/image/ImagePacker/packToFileFromPixelmapSequenceStatic.test";
import ImagePackerReleaseStaticSuppTest from "./testStatic/image/ImagePacker/releaseStatic.test";
import createAuxiliaryPictureTest from "./testStatic/image/image/createAuxiliaryPicture.test";
import ImageCreateImageCreatorTestSupp from "./testStatic/image/image/createImageCreator.test";
import createImagePackerTest from "./testStatic/image/image/createImagePacker.test";
import createImageReceiverPackerTest from "./testStatic/image/image/createImageReceiver.test";
import createImageSourceTest from "./testStatic/image/image/createImageSource.test";
import createIncrementalSourceTest from "./testStatic/image/image/createIncrementalSource.test";
import createPixelMapTest from "./testStatic/image/image/createPixelMap.test";
import createPixelMapSyncTest from "./testStatic/image/image/createPixelMapSync.test";
import ImageMetadataTestStatic from "./testStatic/image/imageSource/ImageMetadata.test";
import ImageSourceTest from "./testStatic/image/imageSource/ImageSource.test";
import CreatePixelMapSupp from "./testStatic/image/imageSource/createPixelMap.test";
import createPremultipliedPixelMapTest from "./testStatic/image/image/createPremultipliedPixelMap.test";
import ImageGetComponentTest from "./testStatic/image/Image_operation/getComponent.test";
import ImageReleaseTest from "./testStatic/image/Image_operation/release.test";
import ImageCreatorDequeueImageTest from "./testStatic/image/ImageCreator/dequeueImage.test";
import ImageCreatorQueueImageTest from "./testStatic/image/ImageCreator/queueImage.test";
import ImageReceiverGetReceivingSurfaceIdTest from "./testStatic/image/ImageReceiver/getReceivingSurfaceId.test";
import ImageReceiverReleaseTest from "./testStatic/image/ImageReceiver/release.test";
import ImageGetImagePropertySyncEnumFlashEmpty from  "./testStatic/image/imageSource/ImageGetImagePropertySyncEnumFlashEmpty.test"
import ImageGetImagePropertySyncEnumFrontCamera from  "./testStatic/image/imageSource/ImageGetImagePropertySyncEnumFrontCamera.test"
import ImagePropertyKeySyncEnumGPS from  "./testStatic/image/imageSource/ImageGetImagePropertySyncEnumGPS.test"
import ImageGetImagePropertySyncEnumGPSStatus from  "./testStatic/image/imageSource/ImageGetImagePropertySyncEnumGPSStatus.test"
import ImageGetImagePropertySyncEnumGPSStatusEmpty from  "./testStatic/image/imageSource/ImageGetImagePropertySyncEnumGPSStatusEmpty.test"
import ImageGetImagePropertySyncEnumISO from  "./testStatic/image/imageSource/ImageGetImagePropertySyncEnumISO.test"
import ImageGetImagePropertySyncEnumLength from  "./testStatic/image/imageSource/ImageGetImagePropertySyncEnumLength.test"
import ImageGetImagePropertySyncEnumLightSource from  "./testStatic/image/imageSource/ImageGetImagePropertySyncEnumLightSource.test"
import ImageGetImagePropertySyncEnumReference from  "./testStatic/image/imageSource/ImageGetImagePropertySyncEnumReference.test"
import ImageGetImagePropertySyncEnumScenePointer from  "./testStatic/image/imageSource/ImageGetImagePropertySyncEnumScenePointer.test"
import ImageGetImagePropertySyncEnumSensitiveType from  "./testStatic/image/imageSource/ImageGetImagePropertySyncEnumSensitiveType.test"
import ImageGetImagePropertySyncEnumSensitiveTypeEmpty from  "./testStatic/image/imageSource/ImageGetImagePropertySyncEnumSensitiveTypeEmpty.test"
import ImageGetImagePropertySyncEnumSoftware from  "./testStatic/image/imageSource/ImageGetImagePropertySyncEnumSoftware.test"
import ImageSourceGetImagePropertyTest from "./testStatic/image/imageSource/getImageProperty.test";
import createPictureTest from "./testStatic/image/image/createPicture.test";
import CreatePictureTestSupp from "./testStatic/image/imageSource/createPicture.test";
import CreatePixelMapListTest from "./testStatic/image/imageSource/createPixelMapList.test";
import ImageSourceCreatePixelMapSyncTest from "./testStatic/image/imageSource/createPixelMapSync.test";
import ImageSourceCreatePixelMapUsingAllocatorTest
  from "./testStatic/image/imageSource/createPixelMapUsingAllocator.test";
import ImageSourceCreatePixelMapUsingAllocatorSyncTest
  from "./testStatic/image/imageSource/createPixelMapUsingAllocatorSync.test";
import ImageSourceGetDelayTimeListTest from "./testStatic/image/imageSource/getDelayTimeList.test";
import MetaDataSetBlobStaticSuppTest from './testStatic/image/Metadata/MetaDataSetBlobTest.test';
import imagePackerPackToFileAbnormalStaticSuppTest from './testStatic/image/ImagePacker/packToFileAbnormalStatic.test';
import imagePackerPackToFileStaticSuppTest from './testStatic/image/ImagePacker/packToFileNormalStatic.test';
import metaDatagetAllPropertiesStaticTest from './testStatic/image/Metadata/getAllPropertiesStatic.test';
import metaDataGetPropertiesTestStatic from './testStatic/image/Metadata/getPropertiesStatic.test';
import setPropertiesStaticSuppTest from './testStatic/image/Metadata/setPropertiesStatic.test';
import metadataCloneStaticSuppTest from './testStatic/image/Metadata/cloneStatic.test';
import imagePackerPackToFilePictureStaticSuppTest from './testStatic/image/ImagePacker/packToFilePictureStatic.test';
import PicturePackingPixMapSuppStatic from './testStatic/image/ImagerPackerSupplement/PicturePackingStatic.test';
import PicturePackingPixelMapFirTestSupp
  from './testStatic/image/ImagerPackerSupplement/PicturePackToFilePixMapStatic.test';
import PicturePackToFileSuppImageSourceTestStatic
  from './testStatic/image/ImagerPackerSupplement/PicturePackToFileSuppStatic.test';
import ImageSourceCreatePixelMapListSuppStatic from './testStatic/image/imageSource/ImageSourceCreatePixelMapListStatic.test';
import getHdrComposedPixelmapStaticSuppTest from './testStatic/image/Picture/getHdrComposedPixelmapStatic.test';
import imageGetMetaDataStaticTest from './testStatic/image/Picture/getMetadataStatic.test';
import PictureGetGainmapPixelmapTest from './testStatic/image/Picture/PictureGetGainmapPixelmap.test';
import ImageSetAuxiliaryPictureStaticTest from './testStatic/image/Picture/setAuxiliaryPictureStatic.test';
import imagePackerPackingSuppStaticTest from './testStatic/image/ImagePacker/packingStatic.test';
import imagePackerPackToDataTestSuppStatic from './testStatic/image/ImagePacker/packToDataStatic.test';
import setAuxiliaryPictureGetMetadataStaticTest
  from './testStatic/image/AuxiliaryPicture/setAuxiliaryPictureInfoStatic.test';
import SetMetadataAxuStaticTest from './testStatic/image/AuxiliaryPicture/setMetadataAxuStatic.test';
import ImageEnumSupp from './testStatic/image/image/ImageEnum.test';
import ImageSourceGetDisposalTypeListTest from './testStatic/image/imageSource/getDisposalTypeList.test';
import ImageSourceGetFrameCountTest from './testStatic/image/imageSource/getFrameCount.test';
import ImageSourceGetImageInfoTest from './testStatic/image/imageSource/getImageInfo.test';
import ImageSourceGetImageInfoSyncTest from './testStatic/image/imageSource/getImageInfoSync.test';
import ImageSourceGetImagePropertiesTest from './testStatic/image/imageSource/getImageProperties.test';
import ImageSourceReleaseTest from './testStatic/image/imageSource/release.test';
import pixelMapCloneTest from './testStatic/image/pixelMap/clone.test';
import ImagePixelMapConvertPixelFormatTest from './testStatic/image/pixelMap/convertPixelFormat.Test.test';
import createAlphaPixelmapTest from './testStatic/image/pixelMap/createAlphaPixelmap.test';
import createAlphaPixelmapSyncTest from './testStatic/image/pixelMap/createAlphaPixelmapSync.test';
import createScaledPixelMapTest from './testStatic/image/pixelMap/createScaledPixelMap.test';
import createScaledPixelMapSyncTest from './testStatic/image/pixelMap/createScaledPixelMapSync.test';
import pixelMapCropTest from './testStatic/image/pixelMap/crop.test';
import pixelMapFlipTest from './testStatic/image/pixelMap/flip.test';
import pixelMapGetBytesNumberPerRowTest from './testStatic/image/pixelMap/getBytesNumberPerRow.test';
import pixelMapGetImageInfoTest from './testStatic/image/pixelMap/getImageInfo.test';
import pixelMapGetImageInfoSyncTest from './testStatic/image/pixelMap/getImageInfoSync.test';
import pixelMapOpacityTest from './testStatic/image/pixelMap/opacity.test';
import pixelMapReadPixelsTest from './testStatic/image/pixelMap/readPixels.test';
import pixelMapRotateTest from './testStatic/image/pixelMap/rotate.test';
import pixelMapScaleTest from './testStatic/image/pixelMap/scale.test';
import pixelMapTranslateTest from './testStatic/image/pixelMap/translate.test';
import pixelMapWritePixelsTest from './testStatic/image/pixelMap/writePixels.test';
import ImagePictureAuxiliaryPicture from './testStatic/image/image/ImagePictureAuxiliaryPicture.test';
import ImagePropertyKeyArrayTest from  "./testStatic/image/imageSource/ImagePropertyKeyArrayTest.test";

export default function testsuite(): void {
  metaDataStaticTest();
  ImageAuxiliaryPictureGetMetadataStaticTest();
  ImagePackerStaticTest();
  ImageExifMetadataStaticTest();
  AuxiliaryPictureGetAuxiliaryPictureInfoTest();
  CrateImageCreatorTest();
  MakerNoteHuaweiMetadataTest();
  //ImageReceiverSupp();
  CrateImageSourceTest();
  //ImageGetComponentSupp();
  ImageMetadataTestStatic();
  createAuxiliaryPictureTest();
  ImageCreateImageCreatorTestSupp();
  createImagePackerTest();
  createImageReceiverPackerTest();
  createImageSourceTest();
  createIncrementalSourceTest();
  createPixelMapTest();
  createPixelMapSyncTest();
  createPremultipliedPixelMapTest();
  createUnpremultipliedPixelMapSyncTest();
  imagePackerPackToDataFromPixelmapSequenceStaticSuppTest();
  imagePackerPackToFileFromPixelmapSequenceSUppStaticTest();
  ImagePackerReleaseStaticSuppTest();
  ImageSourceTest();
  CreatePixelMapSupp();
  ImageSourceGetImagePropertyTest();
  ImageGetComponentTest();
  ImageReleaseTest();
  ImageCreatorDequeueImageTest();
  ImageCreatorQueueImageTest();
  ImageReceiverGetReceivingSurfaceIdTest();
  ImageReceiverReleaseTest();
  ImageGetImagePropertySyncEnumFlashEmpty();
  ImageGetImagePropertySyncEnumFrontCamera();
  ImagePropertyKeySyncEnumGPS();
  ImageGetImagePropertySyncEnumGPSStatus();
  ImageGetImagePropertySyncEnumGPSStatusEmpty();
  ImageGetImagePropertySyncEnumISO();
  ImageGetImagePropertySyncEnumLength();
  ImageGetImagePropertySyncEnumLightSource();
  ImageGetImagePropertySyncEnumReference();
  ImageGetImagePropertySyncEnumScenePointer();
  ImageGetImagePropertySyncEnumSensitiveType();
  ImageGetImagePropertySyncEnumSensitiveTypeEmpty();
  ImageGetImagePropertySyncEnumSoftware();
  createPictureTest();
  CreatePictureTestSupp();
  CreatePixelMapListTest();
  ImageSourceCreatePixelMapSyncTest();
  ImageSourceCreatePixelMapUsingAllocatorTest();
  ImageSourceCreatePixelMapUsingAllocatorSyncTest();
  ImageSourceGetDelayTimeListTest();
  MetaDataSetBlobStaticSuppTest();
  imagePackerPackToFileAbnormalStaticSuppTest();
  imagePackerPackToFilePictureStaticSuppTest();
  setPropertiesStaticSuppTest();
  MetaDataSetBlobStaticSuppTest();
  metaDatagetAllPropertiesStaticTest();
  imagePackerPackToFileStaticSuppTest();
  metaDataGetPropertiesTestStatic();
  metadataCloneStaticSuppTest();
  PicturePackingPixMapSuppStatic();
  PicturePackingPixelMapFirTestSupp();
  PicturePackToFileSuppImageSourceTestStatic();
  ImageSourceCreatePixelMapListSuppStatic();
  getHdrComposedPixelmapStaticSuppTest();
  SetMetadataAxuStaticTest();
  imageGetMetaDataStaticTest();
  PictureGetGainmapPixelmapTest();
  ImageSetAuxiliaryPictureStaticTest();
  imagePackerPackingSuppStaticTest();
  imagePackerPackToDataTestSuppStatic();
  setAuxiliaryPictureGetMetadataStaticTest();
  ImageEnumSupp();
  ImageSourceGetDisposalTypeListTest();
  ImageSourceGetFrameCountTest();
  ImageSourceGetImageInfoTest();
  ImageSourceGetImageInfoSyncTest();
  ImageSourceGetImagePropertiesTest();
  ImageSourceReleaseTest();
  pixelMapCloneTest();
  ImagePixelMapConvertPixelFormatTest();
  createAlphaPixelmapTest();
  createAlphaPixelmapSyncTest();
  createScaledPixelMapTest();
  createScaledPixelMapSyncTest();
  pixelMapCropTest();
  pixelMapFlipTest();
  pixelMapGetBytesNumberPerRowTest();
  pixelMapGetImageInfoTest();
  pixelMapGetImageInfoSyncTest();
  pixelMapOpacityTest();
  pixelMapReadPixelsTest();
  pixelMapRotateTest();
  pixelMapScaleTest();
  pixelMapTranslateTest();
  pixelMapWritePixelsTest();
  ImagePictureAuxiliaryPicture();
  ImagePropertyKeyArrayTest();
}

