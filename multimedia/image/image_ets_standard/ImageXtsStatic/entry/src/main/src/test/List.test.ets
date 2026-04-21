import AuxiliaryPictureGetAuxiliaryPictureInfoTest from "./Picture/Picture.test";
import CrateImageCreatorTest from "./ImageCreator/ImageCreator.test";
import MakerNoteHuaweiMetadataTest from "./property/Property.test";
import ImageReceiverSupp from "./ImageReceiver/ImageReceiver.test";
import ImageExifMetadataStaticTest from './ExifMetadata.test'
import metaDataStaticTest from "./image/Metadata.test";
import ImageAuxiliaryPictureGetMetadataStaticTest from "./image/AuxiliaryPicture.test";
import ImagePackerStaticTest from "./image/ImagePacker.test";

export default function testsuite(): void {
  ImageExifMetadataStaticTest();
  metaDataStaticTest();
  ImageAuxiliaryPictureGetMetadataStaticTest();
  ImagePackerStaticTest();
  AuxiliaryPictureGetAuxiliaryPictureInfoTest();
  CrateImageCreatorTest();
  MakerNoteHuaweiMetadataTest();
  ImageReceiverSupp();


}