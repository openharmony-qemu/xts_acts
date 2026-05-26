import CrateImageSourceTest from "./image/creatImageSource/CreatImageSource.test";
import ImageGetComponentSupp from "./image/getComponent/GetComponent.test";
import AuxiliaryPictureGetAuxiliaryPictureInfoTest from "./Picture/Picture.test";
import CrateImageCreatorTest from "./ImageCreator/ImageCreator.test";
import MakerNoteHuaweiMetadataTest from "./property/Property.test";
import ImageReceiverSupp from "./ImageReceiver/ImageReceiver.test";
import ImageExifMetadataStaticTest from './ExifMetadata.test'
import metaDataStaticTest from "./image/Metadata.test";
import ImageAuxiliaryPictureGetMetadataStaticTest from "./image/AuxiliaryPicture.test";
import ImagePackerStaticTest from "./image/ImagePacker.test";
import ImageMetadataTestStatic from "./image/imageSource/ImageMetadata.test";
import createUnpremultipliedPixelMapSyncTest from "./testStatic/image/image/createUnpremultipliedPixelMap.test";
import imagePackerPackToDataFromPixelmapSequenceStaticSuppTest
  from "./image/ImagePacker/packToDataFromPixelmapSequenceStatic.test";
import imagePackerPackToFileFromPixelmapSequenceSUppStaticTest
  from "./image/ImagePacker/packToFileFromPixelmapSequenceStatic.test";
import ImagePackerReleaseStaticSuppTest from "./image/ImagePacker/releaseStatic.test";
import createAuxiliaryPictureTest from "./testStatic/image/image/createAuxiliaryPicture.test";
import ImageCreateImageCreatorTestSupp from "./testStatic/image/image/createImageCreator.test";
import createImagePackerTest from "./testStatic/image/image/createImagePacker.test";
import createImageReceiverPackerTest from "./testStatic/image/image/createImageReceiver.test";
import createImageSourceTest from "./testStatic/image/image/createImageSource.test";
import createIncrementalSourceTest from "./testStatic/image/image/createIncrementalSource.test";
import createPixelMapTest from "./testStatic/image/image/createPixelMap.test";
import createPixelMapSyncTest from "./testStatic/image/image/createPixelMapSync.test";


export default function testsuite(): void {
  metaDataStaticTest();
  ImageAuxiliaryPictureGetMetadataStaticTest();
  ImagePackerStaticTest();
  ImageExifMetadataStaticTest();
  AuxiliaryPictureGetAuxiliaryPictureInfoTest();
  CrateImageCreatorTest();
  MakerNoteHuaweiMetadataTest();
  ImageReceiverSupp();
  CrateImageSourceTest();
  ImageGetComponentSupp();
  ImageMetadataTestStatic();
  createAuxiliaryPictureTest();
  ImageCreateImageCreatorTestSupp();
  createImagePackerTest();
  createImageReceiverPackerTest();
  createImageSourceTest();
  createIncrementalSourceTest();
  createPixelMapTest();
  createPixelMapSyncTest();
  createUnpremultipliedPixelMapSyncTest();
  imagePackerPackToDataFromPixelmapSequenceStaticSuppTest();
  imagePackerPackToFileFromPixelmapSequenceSUppStaticTest();
  ImagePackerReleaseStaticSuppTest();
}


