import CrateImageSourceTest from "./image/creatImageSource/CreatImageSource.test";
import ImageGetComponentSupp from "./image/getComponent/GetComponent.test";
import abilityTest from "./Ability.test";
import metaDataStaticTest from "./image/Metadata.test";
import ImageAuxiliaryPictureGetMetadataStaticTest from "./image/AuxiliaryPicture.test";
import ImagePackerStaticTest from "./image/ImagePacker.test";

export default function testsuite(): void {
  CrateImageSourceTest();
  ImageGetComponentSupp();
  abilityTest();
  metaDataStaticTest();
  ImageAuxiliaryPictureGetMetadataStaticTest();
  ImagePackerStaticTest();
}