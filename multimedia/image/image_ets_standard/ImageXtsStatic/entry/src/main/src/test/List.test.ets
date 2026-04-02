import abilityTest from "./Ability.test";
import ImageExifMetadataStaticTest from './ExifMetadata.test'

export default function testsuite() {
  abilityTest();
  ImageExifMetadataStaticTest();
}