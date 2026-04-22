
import ImagePackerStaticTest from "./image/ImagePacker.test";
import ImageExifMetadataStaticTest from './ExifMetadata.test'
import metaDataStaticTest from "./image/Metadata.test";
import ImageAuxiliaryPictureGetMetadataStaticTest from "./image/AuxiliaryPicture.test";
import ImagePackerStaticTest from "./image/ImagePacker.test";

export default function testsuite() {
  ImagePackerStaticTest();
  ImageExifMetadataStaticTest();
  metaDataStaticTest();
  ImageAuxiliaryPictureGetMetadataStaticTest();
  metaDataStaticTest();

}