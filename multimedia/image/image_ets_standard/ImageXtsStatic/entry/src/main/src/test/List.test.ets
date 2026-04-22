import ImageExifMetadataStaticTest from './ExifMetadata.test'
import metaDataStaticTest from "./image/Metadata.test";
import ImageAuxiliaryPictureGetMetadataStaticTest from "./image/AuxiliaryPicture.test";
import ImagePackerStaticTest from "./image/ImagePacker.test";
import ImagePackerStaticTest from "./image/imageSource/ImageSourceTest.test";

export default function testsuite() {
  ImageExifMetadataStaticTest();
  metaDataStaticTest();
  ImageAuxiliaryPictureGetMetadataStaticTest();
  metaDataStaticTest();
  ImageSourceTest();
}