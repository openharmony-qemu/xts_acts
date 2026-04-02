import abilityTest from "./Ability.test";
import MediaAssetManagerStaticTest from "./MediaAssetManager/MediaAssetManager.test";
export default function testsuite() {
  abilityTest();
  MediaAssetManagerStaticTest();
}