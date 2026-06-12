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
  // ImageGetComponentSupp();
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
  createPictureTest();
  CreatePictureTestSupp();
  CreatePixelMapListTest();
  ImageSourceCreatePixelMapSyncTest();
  ImageSourceCreatePixelMapUsingAllocatorTest();
  ImageSourceCreatePixelMapUsingAllocatorSyncTest();
  ImageSourceGetDelayTimeListTest();
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
}




