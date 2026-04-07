import abilityTest from "./Ability.test";
import MediaAssetChangeRequestStaticTest from "./MediaAssetChangeRequest/MediaAssetChangeRequest.test";
import MediaAssetManagerStaticTest from "./MediaAssetManager/MediaAssetManager.test";
export default function testsuite() {
  abilityTest();
  MediaAssetManagerStaticTest();
  MediaAssetChangeRequestStaticTest();
}